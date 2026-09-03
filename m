Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3920E2264AB
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 04:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788411083; cv=none; b=kGE9DJpRmXIHmdJAci3DNJ/ijA8s4GL8VDUYgoO3WiMmQq51ZtHf/NkbrxafmZu9XxWTJr0U9czqI9lpt5c+3nIUhIIFFziIFelOvrHgG27kvb9WgHfDyp2WyNFj72j7ckz7qlHkeFzJyYi2WxM2HRGFFq8Lxc2FMh2fokydpj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788411083; c=relaxed/simple;
	bh=6rx7iFDba3AXMmPalnwUsPccGP+mx7yntoMCWpeIhEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQhoa/twn6N25eKwOPL/6SZisiRE+V6VIMTnCJeOGN08d+icdIgiuoGN83leA3lTkxJzljZuwvEnxGgNiNEOyzPApAUj2MtctYSVwhlLq1m20odcjhSbSusA+jF/+25rEIPu96cPYRCjzLy4bUiuSAsyXKFosAr+Wz+R7Hp16/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1/YB5Nq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1/YB5Nq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE7A1F000E9;
	Thu,  3 Sep 2026 04:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788411081;
	bh=CaGBqtS3DaFjj+Xhag/F/YKxRfKgZg+1yNv7vfDeCeg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=W1/YB5Nqpv5ClZyywMABL+9A3vkt5053BEnqzPT84CQCxKXOy1N0QNMVMABkGWhHn
	 Ml/hG0yYR6EiHGjGy9tnPDtn4WC+yLvENQX3fbLC9jLMVi85m54efR1mFkM8Y/TRSD
	 yvLI/CPmAthCKh3gcG0U/KFRKdZ6TbZeQzWoet7xXFKLgLHuAdWdTomJLjkvNkSEvC
	 L9swObU/eBhbVKx3k36gQRUa0BhUMBCo+z6RC8vb7JnlbtMF2vR2Ytw2e2/VkhG2vu
	 vg3FsB0DxiSeHWlEmXFbOu1oyK4RwxbZaQlSQRgppVXKUQfT/bfI33/haiymulkcBS
	 kjOjoNTGgBS9Q==
Message-ID: <8130e76e-931b-415c-bdfb-4e9ae1e39968@kernel.org>
Date: Thu, 3 Sep 2026 06:51:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/entry: Fix double accounting of user time on
 interrupt entry
To: Aboorva Devarajan <aboorvad@linux.ibm.com>,
 Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Ritesh Harjani <ritesh.list@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20260902050628.2553909-1-aboorvad@linux.ibm.com>
 <cd25ffa5-5efc-42f1-b145-0c1c6539b4c4@kernel.org>
 <742182de86c038f6b8a01a6c418469e7f8255595.camel@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <742182de86c038f6b8a01a6c418469e7f8255595.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Aboorva,

Le 02/09/2026 à 21:44, Aboorva Devarajan a écrit :
> 
> The history is as follows:
> 
> Commit 09a9d3a8499d ("powerpc: introduce arch_enter_from_user_mode")
> introduced the arch_enter_from_user_mode() function with the accounting,
> but the function was not called at that point. Commit 893082ac769b
> ("powerpc: Prepare for IRQ entry exit") introduced arch_interrupt_enter_prepare()
> and copied the accounting from interrupt_enter_prepare() into it, but the
> new helper was not used either. Both changes were preparatory and did not
> change the accounting behavior.
> 
> Commit bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature") made both paths
> active. The syscall path removed its open-coded account_cpu_user_entry() and
> started accounting through arch_enter_from_user_mode(). But the interrupt path
> started using arch_interrupt_enter_prepare() followed by irqentry_enter(),
> which also invokes arch_enter_from_user_mode(), while the accounting in
> arch_interrupt_enter_prepare() remained. This resulted in the same user-time
> interval being accounted twice for interrupts taken from user mode.
> 
> I used bee25f97ad24 ("powerpc: Enable GENERIC_ENTRY feature") as the Fixes
> tag because 893082ac769b only introduced the accounting call while
> arch_interrupt_enter_prepare() was unused. bee25f97ad24 is where the duplicate
> accounting actually became functional.
> 
> Would it be ok to keep bee25f97ad24 as the Fixes tag? Please let me know if
> you think 893082ac769b would be more appropriate.

Ok, lets keep bee25f97ad24, I guess a bisect would land here. Anyway 
they all appear for the first time in v7.2

Christophe

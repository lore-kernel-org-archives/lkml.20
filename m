Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C4489FB4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045663; cv=none; b=G5+rK6Fw80UjHPP7EFbSTdQtSYlNiV10RnG/+fSfkSviIHmYuZtQkRX/KrFuXf03KNQSrLkrqGp+aevoJsuwOoEhxPZIAM5eAf80AXHC1qRmbBtbFOLXe+3W4J7v5y/LDqRcB/Px4qwK0g80tPsax1eVFxLLF6OYiJDFQWU2egI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045663; c=relaxed/simple;
	bh=gtN+JA/gfIK2AXR5VdcWvoO75x/OMhSoP6vQH7AK1JE=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=CJaIZa0U012tbmkNawwcwRqHDXdEMmoNFSx5FYXDPnd7rLNcH2wQSkE0yHf1LHiuA+UVIzA5f9xShNHYZvEXa/I3dBvWQDJzjzmIJHuBhiTI2WhGUZn7YselUPCXYy7QZAvTNDqYDUgReKD8rMS2UlZu0AUq944bVJeXlDJNFRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Vh9k17xJ; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Vh9k17xJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:Message-ID:Subject:Cc:To
	:From:Date:MIME-Version:From:Reply-To;
	bh=HcYthpHHwERyxlr750rAd0uztEIm6CVXAXuw/bKumiE=; b=Vh9k17xJz9abAm2BUHaBiJm+c5
	5h9qXx+f05o1x6NRFPiAcw7Kj4lSLnIVEIaHhRLWBQgIfM1E9Gs3MhFHzi0n2HbIe+/G1o78bo1W6
	CE8zGjgscerDiWN3A3L/Pc/ExltzlU3/EaKq7UW1yvB2JE9RonLH24FnjMGUJpUgi7gh5byX2dX/O
	8IFAic5mZ8rEW+pHmzgdbU/e1XE5FSOeCjjgzczEaRR2LJ1dlVbSk8N5K/TmifvTGL/9GPg0+Cpxo
	CiL6GwMKQd9Bk8GPjh8/bAwZmr0BwjrNgjW0qMaMHW5Q4z5UiVhJZ7E/Uka2zijZ0CnNlGoJKNurL
	5ofB+OLA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
	by fanzine2.igalia.com with esmtps 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1x4eUZ-000AkJ-Dq; Thu, 10 Sep 2026 15:07:03 +0200
Received: from webmail.service.igalia.com ([192.168.21.45])
	by mail.igalia.com with esmtp (Exim)
	id 1x4eUY-000ZNN-EA; Thu, 10 Sep 2026 15:07:03 +0200
Received: from localhost ([127.0.0.1] helo=webmail.igalia.com)
	by webmail.service.igalia.com with esmtp (Exim 4.98.2)
	(envelope-from <mfo@igalia.com>)
	id 1x4eUY-000000005On-22Sa;
	Thu, 10 Sep 2026 15:07:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 10:07:01 -0300
From: Mauricio Faria de Oliveira <mfo@igalia.com>
To: Borislav Petkov <bp@alien8.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Juergen Gross <jgross@suse.com>, Alexey Dobriyan
 <adobriyan@gmail.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jan
 Beulich <jbeulich@suse.com>, Brian Gerst <brgerst@gmail.com>,
 kernel-dev@igalia.com, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH v9 2/5] x86/asm, x86/boot: expose inline memcmp()
In-Reply-To: <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
References: <20260822-pvh-kasan-inline-v9-0-e70ef3b75b6a@igalia.com>
 <20260822-pvh-kasan-inline-v9-2-e70ef3b75b6a@igalia.com>
 <20260906170116.GRap2cXOY6ENSzAXUJ@fat_crate.local>
 <E4FDF95C-3FAB-41DB-8EA0-8A26B964B38D@zytor.com>
 <d1b9ff734b918889eaf8885d64141bc3@igalia.com>
 <20260908193229.GFaqBizWcssBoewNSo@fat_crate.local>
 <c955deded411defba0de3a1f6daa78b0@igalia.com>
 <20260910033810.GFaqImIu15e_pszuO2@fat_crate.local>
Message-ID: <295ce95081662f9f0c3d8780d0e754a8@igalia.com>
X-Sender: mfo@igalia.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Report: NO, Score=-2.1, Tests=ALL_TRUSTED=-3,BAYES_50=0.8,KAM_DMARC_NONE=0.125,KAM_DMARC_STATUS=0.005
X-Spam-Score: -20
X-Spam-Bar: --

On 2026-09-10 00:38, Borislav Petkov wrote:
> On Tue, Sep 08, 2026 at 06:06:21PM -0300, Mauricio Faria de Oliveira wrote:
>> Ack, and to confirm: not rename the existing one, either?
> 
> Nah, concentrate only on what you're trying to achieve.
> 
> hpa can send a patch ontop since he cares so much.
> 
> :-)

This seems to close the review feedback so far, on patches 1 and 2.

Could you please confirm whether the other patches (3-5) are OK to you?
And I can send v10.

Thanks,

-- 
Mauricio

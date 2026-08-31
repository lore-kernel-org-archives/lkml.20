Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5E62D9EED
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788161529; cv=none; b=k9FfabgJCSwkALTd73nsZkXFvn3sLV+lEtp18P1Wnk/4QWlmjR6pPVSm+ueF3FLVKnleIy/lmYPvNxFsnaVXzFM69vHc322QBHvgOBLaFLLymVKFHC8VZyb9UR79xL4PRaRHw0ksUEeVDe9OF3FQicXe9dKIiL0VZeJ8RudraNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788161529; c=relaxed/simple;
	bh=Hn1FKWFNCdeyiB+xxk9wibsYSMdvurynawH1qMxS7l4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=GX3GOR9xa7ENTresHpfAEUWiKuWW10cs6IuehejRaklB8Iqc/p3e2P09UqcQiGUq+MOWUIrARbakAAYJfDmR8dAUheIAXdXKyvhWIJITzvc5Qwh5U7G5gck/rpmZzd59nG8pRcrxrOl99h1H9/1KTQQvh9xu3I4ByZ1R9c17DPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Z8qoGt1m; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=5jZnvv5B; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Z8qoGt1m";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="5jZnvv5B"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788161481; bh=XjXdsCMQ89FTbkDLc6UoZAM
	j02VGo3pvuzq9RALaHmk=; b=Z8qoGt1mC3zbFKmuNjJfFEveDsianGBNe8qdTU4Dh026PNFo1u
	SyHqmgMN57094mBuDree2v2YvqDIp12Dgg4QjqWBiZjSYPqDbEDZqGiAVZj5wBgnq5e2c/+hH36
	aTA3jCxbHs84xMwpi8Mk1QUx2Xzw9A/Q9pbCzvNpkcZE1+RQOvfvXjRDIaTwXrcAh+qu+oRrB2v
	dQKX3Q9ViWWBj35WxC8FCZaP2WYKseBwItOra+opaOPSWnfpxs6vXFtrhAPs93SqwdOKWyOkXP0
	zyjcxCauVV/WiRQLg3P63G3NV80d0z7kcIziGKGBMltB4qstw1I6RujGnY1bkiw8ojQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788161481; bh=XjXdsCMQ89FTbkDLc6UoZAM
	j02VGo3pvuzq9RALaHmk=; b=5jZnvv5B6LBslHIBCO5Neh6Vi1+BhNOpm9KukWYJCDu8gnPY+E
	YQjTe4TpeUFvDkYeRfmsueIhibOA5ZdMJuDw==;
Date: Mon, 31 Aug 2026 08:31:22 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: john.ogness@linutronix.de, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, pmladek@suse.com, rostedt@goodmis.org,
 senozhatsky@chromium.org, tglx@kernel.org, thierry.reding@kernel.org
Subject: Re: [PATCH printk v2 0/2] nbcon irq_work fixes
In-Reply-To: <20260831063648.7j2bEr1S@linutronix.de>
References: <20260828140218.232439-1-john.ogness@linutronix.de> <6CCFF45A-3C60-4A38-BF22-7BA556DF28C0@mainlining.org> <20260831063648.7j2bEr1S@linutronix.de>
Message-ID: <E462DFFC-320A-48AA-90E3-B61B026BBC58@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 31 August 2026 07:36:48 BST, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>On 2026-08-29 00:39:15 [+0100], Bradley Morgan wrote:
>> Tested-by: Bradley Morgan <brads@mainlining.org> # PKVM, based on Pixel
>7 (ARM64)
>
>Does this PKVM even use a nbcon and if so which one?
>

heh, not PKVM itself, I booted a kernel inside PKVM, which is the
hypervisor, the kernel has nbcon inside. My T-B is for the kernel 

>Sebastian

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

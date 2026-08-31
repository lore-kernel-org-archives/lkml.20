Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F912DB7B8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165738; cv=none; b=Z9xj0EWBsSnhuWzqcPR5apGEzt99f5DHMlW0W9NmUsitHLLbzqAkibix5fQbBnYdh9aIE6LcxLqEmcv4Hym9avqjvFEeiIcl4zyAuaYJfZwRFWk3SRxIKAtKPr2UtlcFukbF0PZLw37v9nEcm0YL4pwCCbuJ0eAeJLS7hzR9a4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165738; c=relaxed/simple;
	bh=Ils5SLksfQJzsFEn7MEhtRq3T+cjeWxuD8x+hggBSRw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=cr7A5P1SptA97DKDiatQQLgq6/Ec9UXBg++TfHgRsQGB5jJ1yYCFjGPgWirj1qO+792l7sGfI6pDiJhA39HJQHuwC3WkN6JgMgWV5lCLysJuh3HCv4sfjEdEzEUfFz9ELPgQBBuH0e/MCb9a+Wt0e4R/rOgHW9SmJzH0IefT8T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=kmpNBcRy; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=eaaS60gl; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="kmpNBcRy";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="eaaS60gl"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788165727; bh=vy33aD8VXwgpwpVjDWtmNSr
	IqCh/p/+w/42MH027Dzc=; b=kmpNBcRyMWQezoShwue5WF6tP7UkucyooutMBnoGogBPKWTIeK
	UEiJPV94hjQbT3mtCOgYdlKwB5zARSLx+bAUQS080Y6GgNovlvAaBOtThfg5xk+dAnewrw/KiOA
	xdt41rZ7WjUG/pKTbw5b3tsH3nZlmX29zOADf1JSiR7C0JpkPTNgprrg4Pi3B2BvnhyfpdNXF9U
	o0Ud3i1Ch7F0QNNmeqr+gN0Hb87+/xlMx8oNfB262w5EBidvwmuJi9ORzkq1XE1LO8KoGExkeXm
	2uAF+P5jgzyPrV0JavFcE5CwuePTf2dNOSHKJ/TbCuzxPtjgDhLYGj8g0PvIjz9wTYA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788165727; bh=vy33aD8VXwgpwpVjDWtmNSr
	IqCh/p/+w/42MH027Dzc=; b=eaaS60gl6ltgwjSX5Fsx2HHNJ8SaSAV+kqWCWKNhuH9GJA8UfM
	kh5PoyIhswqQKI3yNEdX78arBKLSjrQOoVDA==;
Date: Mon, 31 Aug 2026 09:42:07 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: john.ogness@linutronix.de, gregkh@linuxfoundation.org, jonathanh@nvidia.com,
 linux-kernel@vger.kernel.org, pmladek@suse.com, rostedt@goodmis.org,
 senozhatsky@chromium.org, tglx@kernel.org, thierry.reding@kernel.org
Subject: Re: [PATCH printk v2 0/2] nbcon irq_work fixes
In-Reply-To: <20260831082237.lo_33Mqq@linutronix.de>
References: <20260828140218.232439-1-john.ogness@linutronix.de> <6CCFF45A-3C60-4A38-BF22-7BA556DF28C0@mainlining.org> <20260831063648.7j2bEr1S@linutronix.de> <E462DFFC-320A-48AA-90E3-B61B026BBC58@mainlining.org> <20260831082237.lo_33Mqq@linutronix.de>
Message-ID: <BD814BC0-D631-40C0-985C-D93609E69C15@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 31 August 2026 09:22:37 BST, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
>On 2026-08-31 08:31:22 [+0100], Bradley Morgan wrote:
>> On 31 August 2026 07:36:48 BST, Sebastian Andrzej Siewior
>> <bigeasy@linutronix.de> wrote:
>> >On 2026-08-29 00:39:15 [+0100], Bradley Morgan wrote:
>> >> Tested-by: Bradley Morgan <brads@mainlining.org> # PKVM, based on
>Pixel
>> >7 (ARM64)
>> >
>> >Does this PKVM even use a nbcon and if so which one?
>> >
>> 
>> heh, not PKVM itself, I booted a kernel inside PKVM, which is the
>> hypervisor, the kernel has nbcon inside. My T-B is for the kernel 
>
>That tested-by is futile if none of the suggested changes were actually
>tested.
>
>Sebastian
urgh im on holiday, I'll elaborate later.
--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

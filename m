Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.154.255.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794326904;
	b=NdDrv6IFvTsgtE5zsSFLjVmhqTAacfSPxcj+3+oRhYz/HGrMH6TgBNWGH3uQjiGKvgl0
	 /eNJerUH2wSXhAInPgoQLp6OpLi9OuSYPhZi3hTueO9g+w1IL5M+Vwfq8At3HMQcuDh1i
	 O8+ktUFZkisCtnVCSQg0sHwD8rw5QVed+Pc6OJ3xUqj5UX6MRiBIXkrQ8Fgpx+PlveVjr
	 vmGvDNXhMSPBhSb1U0/pvQZT8iaOkpHuk1NXVOEbTnyCcZ26m9aa0LwHu35RFOYJjDwkU
	 g6o+bFBt9mKu6PEtH+/9qR5IlVuqlOQhYB8o5G5MIh0wD6BiIJHS6ur99lOKcSEnh4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794326904;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:
	 Subject:Feedback-ID:X-Maileroo-Ref-Id:DKIM-Signature:Message-ID:
	 Content-Type:Content-Transfer-Encoding:X-CSA-Complaints:Cc:References:
	 MIME-Version:From:In-Reply-To:Date:To:X-Tenant-Id;
	bh=YBGGeMD4iFIEU2mWym3FhOdzZclJ1seq6HyWVVamaw8=;
	b=kkMbDgIMOcsktfkUFK6XIL2sCAjzfrcPzJuFJRNCm6h/zs+Xdr4waaOh056GE+mKGt+r
	 PtVElqsIRrmApxes87a05qgSe/PZHx3BEUtz8gmr6BaMn1cGgX1rVECUywHPFPysGAn+A
	 jiJJXv4lzgj2PMO+X4H7AcAB/ZVc9HLDrOJhSYVxU/Rtseff/vwurbVt8/8zyejjRbSze
	 Q+cabl2joy83mPBBbT4VeoA16Gpp+ZLUcXmxb4ZG6K9vbD90VmjHU7lDuyjB3wJ1rcY4L
	 fOG2Js9Fz9BD8+busneAbQQ9d6rryhxLqzGq3SpIwfnF0HS3mk2/d6WUgho+9rKfDng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=fmz5eI4q;
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=Zy+PUheq;
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=l98FGin5;
	arc=none smtp.remote-ip=213.154.255.219
Received: from mta180.maileroo.com (mta180.maileroo.com [213.154.255.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E16606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E16606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=fmz5eI4q;
	dkim=pass (2048-bit key, unprotected) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=Zy+PUheq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=l98FGin5
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoibGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyJ
	9
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=YBGGeMD4iFIEU2mWym3FhOdzZclJ1seq6HyWVVamaw8=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794326901;
	b=fmz5eI4q7K0YqjzDsuJgqHPYe4Q530SAYZD+QZ41Zo5heJlghpOZj3A0bPFk6j+9MnjIypXFb
	nordajv/qA+7G1tVY7zbkM4oudpitwmNHa4rGluP6pXWJo+acvwx7CrvW5gdSRphokUhBXDrFlu
	XTousoRfGAltNG+52UkSzMUOohC2r43fcnU7nnLu6u/cOvQFmko8xFfjl+af/PRABbU4++uVd1u
	fbHu2/dZSdWy0m3CVxy1PtgYSF/jJTIU98J9qkvdmU17IElqkUXrDO3n3gbE77wDppbFfZPyjSL
	nxHMoVCB9IjrhPTlx/PbccUoYMhIjnCpjo13Se03NgQQ==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=YBGGeMD4iFIEU2mWym3FhOdzZclJ1seq6HyWVVamaw8=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794326901;
	b=Zy+PUheqDqS6DYeftWZ8DA1WT9+YpYEAYpILPNesCnFNC3EbVTjvJPs96iUai6zNBQxe1vWk/
	DS4r0l5Ns7TrRRxIr/v4ofTjOKB+ZIwMYumxpUIcZ5LvPLNyVZPR6Qu8FIvwHXO9kxgnTl0ca23
	FILQARF/QLw/iuPv8uptGeeQA9MBarhSAKBOHSUY3wdLryWGtSdnXisp5yzCys3+hHW1bwLp2a7
	iPFYwSoGhvl7wqfobiL0YY3fD7FYGOmb/nArBBDMM64TLBiTLjx7NRfV9NdyzQsakLFVKlR1zW/
	GBVqN74wlGD77YFI8b80vN8MuJMwdrBVG3AQoUlj2Iag==;
Received: from localhost (127.0.0.1)
  by mta6 (KumoMTA 127.0.0.1) 
  with ESMTP id f32cdf2bdd2011f1ad950200d472712f for <linux-kernel@vger.kernel.org>;
  Tue, 10 Nov 2026 16:08:21 +0000
Subject: =?us-ascii?Q?AW:_[REGRESSION]_x86/microcode:_boot_hangs_bringing_?= =?us-ascii?Q?up_first_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode?= =?us-ascii?Q?=5Fldr?=
Feedback-ID: u56201:maileroo
X-Maileroo-Ref-Id: 78513f6767ca9c5eb6279910
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794326899; bh=YBGGeMD4iFIEU2mWym3FhOd zZclJ1seq6HyWVVamaw8=; b=l98FGin5/GesXHr4arpF77GeWGAlIy6ZFWCnTHsrTwuCDR3yAJ 4aYkwUl5JVnaMiaQWhnamA0OldYALQB910b7n6YqFN20zE5ql5F1DNfsWG+lv2aTv6zlfmFEppp baJf1JQkGWmAqnUI2NvN2MtwHrmU1UjJaUTR+NkINQ43wPr9mkNW4u0jdXq5C6xoxLLx6D4zBhL T8/foHme0fPO/haT96hc/u+q4mUDwDh8qWY6aQNZREQzbtNYa+B8s2Q1ZuhL0HGmyyPrenhW/NL H4akRFkMTk+jfIyWie1xfYhNY4m5WXrm25nPW+1YknAcegqvrLr8d3kwbqSK3OU6YxA==;
Message-ID: <513701528800531927756553.7556.2026111016821@darioackermann.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CSA-Complaints: csa-complaints@eco.de
Cc: <x86@kernel.org>, <bp@alien8.de>, <tglx@kernel.org>
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch> <630330232567670562275469.6204.202611921938@darioackermann.ch> <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: "Dario Ackermann" <dario@darioackermann.ch>
In-Reply-To: <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info>
Date: Tue, 10 Nov 2026 16:08:17 +0000
To: "Thorsten Leemhuis" <regressions@leemhuis.info>, <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>
X-Tenant-Id: u56201

Sorry for the thread-mixup.

I tested v7.4-rc2 (7475ea8b5861). It still hangs while bringing up CPU1,
with both default AP bringup and cpuhp.parallel=3D0.

On upstream 6.18.55, I compared four images with the same config and boot
arguments (cpuhp.parallel=3D0, only intel-ucode.img as initrd):

  unmodified kernel                              hangs at CPU1
  skip Intel AP microcode loading               passes SMP
  skip the AP's MSR 0x79 write                  passes SMP
  do the write, skip the following revision read hangs at CPU1

The passing images reach the expected root-mount failure because the initrd
has no NVMe driver. This implicates the AP microcode write or its immediate
effect, rather than the following revision read (?) Moving load_ucode_ap() =
after
cpuhp_ap_sync_alive() or cpu_init() still hung.

With the unmodified image, microcode revisions 0xdc (one boot) and 0xd6 (tw=
o
boots) hung too. A first-parent bisect of v6.4..v6.5 tentatively points to
the smp-core-2023-06-26 merge (9244724f): its parent passed SMP in 4/5 boot=
s
and the merge in 0/5. Earlier kernels occasionally hang too, and tests with=
in
the merged branch were inconclusive.

Any suggestions for what to instrument next? I am new to kernel debugging,
but happy to take pointers.

Dario

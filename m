Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793014901;
	b=t+a5hQP2pXlx9DTiRD2lHmUMkMtDWnA4ZB5aP0pDg12uat88OVL6SHeB6JRxwpm9DDiw
	 1Z5FQKqEtsHVAH4+b2RnLg+xI8NZNtKHSFoSLl8ON3oTH1hVT73sHweHodQKMT7weIvXZ
	 NUcFizMgA1uob1zTRznIY+qr+1MyOy3Adaaz5/jzQaAtxJvGmbyj5SFeRseRh1a/6jVuJ
	 Ha4jNBJSB75alkljftqeAFpYb4K3b7DPd3tpGo/jr0E31DizpxiGRcvti3oqBjlQH2a+a
	 IJuHAsyEDd35qFyFQrjCuWMSrHePlzln3Lt0+CkCeCqxjsyxddpWhcs/5blUIsdP7lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793014901;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=YQdKMODoK4Ev100s77Ct9qUOPvRnjGCJWnQCHST9ATc=;
	b=qodi8z3rbNXRWHYVHMmREVpA3BxYeeCKgJ27lw7Ft/gocnb1DhMWdnTWWRWhlvV2Xlfj
	 3N2t7o37UicxNZi4CCHtE/xDtAZQizXSG3vhcP6lunVycU2KOK72mV2GoZKRCoAoMw4Ci
	 v9VK+CKgD3joBYsOvN7ypjT49oeTU5sgJRy9xOxkXESUYbwsFXiriaAs4G5rkrVNgxIrv
	 xoTrNkPQ4ErHhMAiDcny9NSiuhRG78kaAtPVNxL8fLF1TP4KbRRbR6zJx4ut3VwNH16ET
	 mcheT1Jmiigys6vRcr3moyf8y+6ovVs/DhRk2x6c0phO7OLujULn/FaTIjU17G+GUag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nyTcILFS;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39456606A31B;
	Mon, 26 Oct 2026 11:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39456606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=nyTcILFS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	MIME-Version; bh=YQdKMODoK4Ev100s77Ct9qUOPvRnjGCJWnQCHST9ATc=;
	b=nyTcILFS6s+AVkRuyC5jdAcK98gBgEmTJepR8pCAcCRmisHMOtTEC3cOPQhDF8
	TX5N9z/Am6SW2RxMxEmhU0jAY1KBs7MRH7hnqo85966mtwMictpYsHTJpWeCr8yX
	D8wjLKQl8UAXvH0EWB3kl6OTajDFT7qE78gO9xSa6hKkQ=
Received: from [127.0.1.1] (unknown [114.214.177.11])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAnnTFpPN9qAwxJAA--.2459S2;
	Mon, 26 Oct 2026 19:41:29 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] irqchip/gic-v3-its: Claim LPI tables inherited across kexec on DT
Date: Mon, 26 Oct 2026 19:41:29 +0800
Message-ID: <179301488974.13269.12823732532276833194@mail.ustc.edu.cn>
In-Reply-To: <87v76r8h0o.wl-maz@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-CM-TRANSID:3pYKCgAnnTFpPN9qAwxJAA--.2459S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWUZr17JFyDJw45tFW3trb_yoW8GF1xpF
	Z3K3yvqa1kJF93tr4kXr409F1Fy3Z3Kr15Xw1kG34DZ3y5Xw1IvrW2gr4aq3ySvws5Kr4Y
	qr4Yq34kua1DAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07boDGrUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREMB2reWNVgmwAwsp

Hi Marc,

Understood on all three points, and the series is withdrawn -- I am not
going to resend it in any form.

Just so it is on record that I got the reasoning right this time:

 - Inheriting LPI tables is not something the incoming kernel can decide to
   fix up after the fact.  By the time it runs, it can no longer tell which
   of those pages are still the LPI tables and which are ordinary memory it
   has already handed out, so any "claim" is a race with a statistical
   chance of being correct.  That is why it is either configured before the
   handoff, or not at all.
 - EFI and DT are not alternatives: the reservation has to exist in
   whichever description the next kernel is given, EFI memory map or DT
   reserved-memory, and EFI booting a DT machine is the normal case.
 - Therefore the LPI tables have to be programmed and reserved by the
   firmware/bootloader at boot and stay reserved across the whole kexec
   chain.

In our case the "bootloader" for a kexec chain is the kexec loader itself,
so the work moves there: add the reservation to the FDT that is handed over
(e.g. grow the blob when there is no space for the memreserve) and have the
loader program the tables, instead of the kernel trying to reclaim them.
Anything that needs LPIs will simply use a full reboot until that exists.

No further review requested -- thanks for stopping this early rather than
after a round of review.

Best regards,
Qianhui


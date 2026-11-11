Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.241.220.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390365;
	b=5PnD1iF7OZsSPOhDI2vS/LBawrwbMUJEiYPv2wKC13HXZ4xOnld/y6FiKtlgUoDP6bQ5
	 9Sx7htaqAVzcH/r5Un3i6sz0KCHJk+H1yo1UUaD/wNp17VVEauSJWQeP7YshIfDcDzbZi
	 4feZRe16GNlWpQzUqcOEQpzYrsx2aNSy45lVsdm1ZYTV5gNtvQihl+oOQi8ztPJFGaFhq
	 AlHbFCT9pWeKHm1hr7BbAtLskb3K5SmbuF2vX33FNf9nE4Hhx0giSmiP9/SIz3YrSC+E1
	 RdorILGy40rVmppZmUQN4Madvkb8TKYjAuU3kZgnKU5iNqI/5aWzoxELA2kA5mD2cNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390365;
	h=DMARC-Filter:X-KumoRef:DKIM-Signature:DKIM-Signature:Received:Cc:
	 In-Reply-To:References:Content-Transfer-Encoding:X-CSA-Complaints:
	 X-Maileroo-Ref-Id:DKIM-Signature:From:Subject:Date:Content-Type:To:
	 Message-ID:MIME-Version:Feedback-ID:X-Tenant-Id;
	bh=NaNsA5eyMMzZsBJWrElEiCkH2y5OkN7uDpy6upCkkj0=;
	b=mrP+Lq4IRHLpay1tlIk81kLN4sp8sdMGCCLz4kRjPMZcZa9xO3SRVeirKLLJ4hp/Bbng
	 Is2I2ZND9ueIwEeo3T30/8qMAMhHu45X+4KTG4vZr8S+KbCU5+KnnRoRN6mDnYq+R711n
	 Xgrh+eairJlQW2PK5uatyvkTEZVz46qqQ661EPn9fUDsl9ElPTB/LF29Rawx0IJfjrQ4e
	 v98qwgv2+odBN4NWeaP1D7RVGWWnqOMlcH2rHzAI26cavyxdv3OUuEXECvax/F5CsAA5Z
	 9hO7KyokD0dLj8gdHdxKjYjuTnOQ2Z6oPaoqDQSgxGGF6YN8+wSn15+NqTZNzYEQYxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=darioackermann.ch;
	spf=pass smtp.mailfrom=darioackermann.ch;
	dkim=pass header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=VnORAC95;
	dkim=pass header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=aw80hXRH;
	dkim=fail reason="signature verification failed" header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b="J/R1EKHL";
	arc=none smtp.remote-ip=188.241.220.25
Received: from mta203.maileroo.com (mta203.maileroo.com [188.241.220.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9D6606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E9D6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darioackermann.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maileroo.info header.i=@maileroo.info header.a=rsa-sha256 header.s=mta header.b=VnORAC95;
	dkim=pass (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=mta header.b=aw80hXRH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=darioackermann.ch header.i=@darioackermann.ch header.a=rsa-sha256 header.s=v1-rsa-20261020 header.b=J/R1EKHL
X-KumoRef: eyJfQF8iOiJcXF8vIiwicmVjaXBpZW50IjoibGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyJ
	9
DKIM-Signature: v=1; a=rsa-sha256; d=maileroo.info; s=mta; c=relaxed/relaxed;
	bh=NaNsA5eyMMzZsBJWrElEiCkH2y5OkN7uDpy6upCkkj0=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794390356;
	b=VnORAC95MLiembFHhEN+lTktjl9LgeBtsbaIkkjZBkKScAUwqt26fmHaQyFFcGgEGwikJNA+/
	GSXyqPbFLGqJn7ILbnJ7y9iMb55KsXyS35eNcUlFR6S23uywp1BrbZDBULcUD7TYtdarlh+VMcX
	w89fltBNc3QFkHOS6S8ta9ir9b6Qg/BBWMACG/O90NVMRTHf4O3Q6orXKvYZjbCMRFmgbtydVh2
	rEHWKPdJCb/4liKBoxd5lZRVua79ykwllH21K34PeikuL4l8wGs7yifu53uzgl2tu8nVJY14+V4
	mA7SOH2o0WA12rKeE1jNdWm5GoC0GUX+G9Bowk9ry0sA==;
DKIM-Signature: v=1; a=rsa-sha256; d=darioackermann.ch; s=mta; c=relaxed/relaxed;
	bh=NaNsA5eyMMzZsBJWrElEiCkH2y5OkN7uDpy6upCkkj0=;
	h=from:sender:reply-to:subject:date:message-id:to:cc:mime-version:
		content-type:content-transfer-encoding:content-id:content-description:
		resent-date:resent-from:resent-sender:resent-to:resent-cc:
		resent-message-id:in-reply-to:references:list-id:list-help:
		list-unsubscribe:list-subscribe:list-post:list-owner:list-archive:
		list-unsubscribe-post:feedback-id:x-csa-complaints; t=1794390356;
	b=aw80hXRHoUGzXqt7XNWKEbRhAxinoVK9zQmkNJZG9nOaUJf3zaTiQ1uKCzR4TQaGKFHk9llQI
	AfiecLeZAwlthci/WimKO6/kS8rS3ZNPrPKo0ubtmHYXNTVmpOOqD5+eSCJXPDRaRWBxJH8XY+c
	CZ/BjMCCZwsn6gMvCrIrAW7mdGPpGKSiS1sxGJ9A78znHi9pAfVR9xx2SWLdYsUz1Zt46B36VKh
	Ao5HCQg1nYnojNJ7pMrcS5uvE7wQ45M0DOIzlxQdyyW7QKQhzkY/jsWe/R6/kVNBZF+ZWv9Qci/
	tcnn1LA2/qHex9VoU2XuA5AwqbVroVcd2D3dcRz1/Yzg==;
Received: from localhost (127.0.0.1)
  by mta3 (KumoMTA 127.0.0.1) 
  with ESMTP id b19381daddb411f1be5592000677b433 for <linux-kernel@vger.kernel.org>;
  Wed, 11 Nov 2026 09:45:56 +0000
Cc: "Thorsten Leemhuis" <regressions@leemhuis.info>, <linux-kernel@vger.kernel.org>, <regressions@lists.linux.dev>, <x86@kernel.org>, <tglx@kernel.org>
In-Reply-To: <20261110185257.GFavNoCWszSXhRkaOV@fat_crate.local>
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch> <630330232567670562275469.6204.202611921938@darioackermann.ch> <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info> <691747894523180440145931.1352.2026111016821@darioackermann.ch> <20261110185257.GFavNoCWszSXhRkaOV@fat_crate.local>
Content-Transfer-Encoding: quoted-printable
X-CSA-Complaints: csa-complaints@eco.de
X-Maileroo-Ref-Id: 68c0f937eda08bf6f28f408a
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20261020; d=darioackermann.ch; c=relaxed/relaxed; r=y; h=Date:Message-ID:Subject:To:From; t=1794390354; bh=NaNsA5eyMMzZsBJWrElEiCk H2y5OkN7uDpy6upCkkj0=; b=J/R1EKHLq6hZaMQpUr5MhAW9+zif9md4C2a7XYVXXH1ZInG5Da QDeZ1wTvpJ61o91TUa0mcKioLmDPfclftY3VLBw+TAFHWi8gdwd257S/JQXvi9N583mPi7+qvak vltiKbZy4y8sLjapPM6h9skM8oSAnKdYVKPNCsFaYUrdEZdOFIb6OboNQOK2v/Sk3aAquMwd68h u+shyHfAVKmzsgEMdj7LxD28zDnsK/a9E67WUkYUdDxhAGq+fNWEkzOy+YgYsBWCJ8iwJAxSpvX GC0ufieNl6uYJNnwa7LmcGUof39Ha4c0OENHrnGwGwS296WJRIfK4HbCzgeg5duH7fg==;
From: "Dario Ackermann" <dario@darioackermann.ch>
Subject: =?us-ascii?Q?AW:_[REGRESSION]_x86/microcode:_boot_hangs_bringing_?= =?us-ascii?Q?up_first_secondary_CPU_on_i7-6700HQ,_avoided_by_dis=5Fucode?= =?us-ascii?Q?=5Fldr?=
Date: Wed, 11 Nov 2026 09:45:52 +0000
Content-Type: text/plain; charset="utf-8"
To: "Borislav Petkov" <bp@alien8.de>
Message-ID: <028567884560396077425152.0767.2026111194556@darioackermann.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Feedback-ID: u56201:maileroo
X-Tenant-Id: u56201

> Ok, so I don't understand: which kernel did work fine, without any cmdlin=
e
> switches?
>
> Pls send full dmesg from that one. IOW, did any kernel at all load microc=
ode
> successfully on your machine?

6.1, and yes. I had only tested the Manjaro build before. Vanilla 6.1.189
also updates early to 0xf0 and brings up all eight CPUs

https://drop.ackd.xyz/n552vx/dmesg-6.1.189.txt

Not perfect either: ~1 boot in 10 black-screens, as in my first mail.

Second case, from that same mail: 6.18.55 with maxcpus=3D1, then onlining
CPUs 1-7 from sysfs, leaves all eight on 0xf0. Log for that:

https://drop.ackd.xyz/n552vx/dmesg-6.18.55-maxcpus1.txt

> Also, send one from 7.4 with dis_ucode_ldr on the cmdline.

https://drop.ackd.xyz/n552vx/dmesg-7.4.0-rc2-dis_ucode_ldr.txt

Boots all eight CPUs on the firmware revision:

  [    0.000000] x86/CPU: Running old microcode

> Also, check whether you're running the latest microcode packages by updat=
ing
> your distro blobs.

intel-ucode 20260925-1, newest available for manjaro at that point. 0xf0
(2021-11-12) is the latest for signature 0x506e3, pf 0x20.

> And put your reply under the text you're replying to, like I just did.

Done.

Both kernels are vanilla (v7.4-rc2 at 7475ea8b5861, 6.1.189 from
kernel.org), rebuilt with NVMe, ext4 and console built in so they reach
userspace.

My best suspicion at the current time is that it is related to SMP startup =
and
that disabling the microcode loader prevents a (firmware?) race there.=20

Dario

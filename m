Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794669703;
	b=r2rbMOlAEG/ihTMyw1lrfdOiFSyZMQXbPeCSuW/SuMlkSOHilELY9ibjM5kC04Z4NEUS
	 8mfwkyTzbihCiRD5H6KQdSzzUtr0RFX2+CRbYDJcZq7iI30LmnErS01U38cqPG2vYV/PY
	 EZvtnXUMGdgMw2ko0VlhcX3AIYi8Al8lImhzXRrKz59HXIEqJ/fHGJTWl8sKllfprJif1
	 T9UnJB+mK/EX0JWdANGc1yT28ZCOzmudzusiiNQ4HOtivMoAmEDKgWpDmOCvXfIhv+cui
	 GHskCfzWeH1a5sq0oYcGiGPOFwKmc3UDkHBpERX3OlDPsCWHf1+cwNnqoMKTdFZ9EwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794669703;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=bkYXLNgGbW2wY/7E8Q/DSiEzOBil00s+GF/FB8/8DkM=;
	b=1t74kbZ5nJaAt5HDEUjKsfvhJllpa47tyA0KTlU+bd44uRWMgDow3hV4hvVfPrZegmZm
	 TggU/e9REno8rPEE0Sy7ILzBUyhdhKH8as4bywZ5Ky2GGnjF6/ndg6JxOZ+Fp6ginwtGH
	 5dRrqEm+CUzQrHk9HHkMY08cLufCu36It7ZnGtSG46v4TF7aiG6rHWMaBbrhFhiOrtMAI
	 yPbSJgnAREFXJoE3MN2BRuMATs73LTyqGP3Jj9UlRN+A+7pK5OLaisiRIzU1tqfFbUPWa
	 S2BjR9N4cdn10dU8MyIQACMpOVNcdw7Zxz98WwG+y3x00ybBFAr4163LV3+2N9xri0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=abtoV9+e;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A45E606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 15:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A45E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=abtoV9+e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=bk
	YXLNgGbW2wY/7E8Q/DSiEzOBil00s+GF/FB8/8DkM=; b=abtoV9+egRrryJABdg
	UmQG8e4szouD8El/q0XVT3IA95dPS+OASpFdc1oa7L+ouCkFRLiqENi13slbIg7B
	ulKLHKQKeLrBKjRNleZUE8rOp8jtmyRBcN0Gn+ANayFTTBcNzKbnTexlqBPtbVZl
	3GX1lLXzDdaOY6JyM4E4XDS+Q=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBXNBAmfPhqCFw_Hg--.3815S2;
	Sat, 14 Nov 2026 23:20:07 +0800 (CST)
From: albin_yang@163.com
To: kayracizmeci@gmail.com
Cc: albin_yang@163.com,
	albinwyang@tencent.com,
	bsegall@google.com,
	dietmar.eggemann@arm.com,
	jstultz@google.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v2] sched/stats: Fix run_delay over-count for tasks parked on the runqueue while blocked
Date: Sat, 14 Nov 2026 23:20:06 +0800
Message-ID: <20261114152006.3397473-1-albin_yang@163.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <avhSzH_sRtg4g_Gs@scheduler.schedules>
References: <avhSzH_sRtg4g_Gs@scheduler.schedules>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBXNBAmfPhqCFw_Hg--.3815S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Jw1fGFWxAF17Cw1DWFW5Awb_yoWfZwb_uF
	s3GFyIy3y8C3y8tF4xKFZ09ws3tay5Zayjy34FgayUJ34rJFWUXw4fCr9rury8Xas29Fs2
	yFn5Xa9Fkr9I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUULSd7UUUUU==
X-CM-SenderInfo: pdoex0xb1d0wi6rwjhhfrp/xtbCzQkCpGr4fCm5bQAA3x

Hi Kayra,

> So I see you removed some of the comments from Prateek's diff.
> Is there a reason or you just forgot to add them? :-).

I was just trying to simplify the patch, not an oversight. Those
comments are needed; I'll restore them in the next version.

> And what is your plan for v4?

v4: https://lore.kernel.org/all/20261024042753.2276779-1-albin_yang@163.com/

Two options as I see it:

  1) Drop v4. This patch fixes both the proxy and the DELAY_DEQUEUE
     over-counts on mainline, so a separate sched_delayed based fix
     is not needed here. Once this patch lands, I would submit v4
     to stable separately as the equivalent fix for the older series.

  2) Post a series with v4 as 1/2 (so it can be backported to older
     kernels) and this patch as 2/2. This is a bit odd, though, as
     1/2's change to sched_info_enqueue() would be overwritten by
     2/2 -- they touch the same line.

Happy to go either way if you have a preference.

Thanks,
Wei Yang


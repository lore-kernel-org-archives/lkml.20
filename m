Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C4E2C86D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788176408; cv=none; b=S/oATYs67Ev2+O40HZH0VsFHq8M0DwDK63mn1kp4hv+g6IMd9VAKR1H2lzdHjrvzFyYGKGauQRqHYx5tmG3NvlNgts9w3f2QfKau4ksnYD2DtDvp9VyIBt0QZDc9J+1UtR70JlyylLopJmBm9TMMEONKjHPtZ5eZHldjk1tVnr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788176408; c=relaxed/simple;
	bh=DjNwViL96dqHXrSeA1TtrBU5nHsWdSZF/XzqoG1GBAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sTykRzsIc4E9u9Z13Qn2Ev5oW+OWjVVJiYiJ1vPtRfsXQgX4dtcj70h5mHm7mLp00UOPA3YLjwbTNK8t/iBrqMBU5VHbdDwXg5hpEx9NIPmFU9FDFHrelTvzP0aT5HnwU5ldgw6HO5ABhGNd6xsXzCgA2whL2vrtsI9Q0S+IJfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjHX2vC/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjHX2vC/"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48433e9562bso213891f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176404; x=1788781204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DjNwViL96dqHXrSeA1TtrBU5nHsWdSZF/XzqoG1GBAA=;
        b=WjHX2vC/KF/Nj9tfRtd0M9FkzcyENvCrPRrtadLCGIfEWoawrRSKjJQTsWuk/tYIez
         /5NMBdl1JfvJ0LiZCq7iUMq/B+eQgR2k32d6vILyFMZG4txMA8Qrlm/KkwkbTIs7XuFs
         6HPIDAnwuSFgI93NKgqYF4zAd9mPic8JsPO1IrcjuSv/r3rd70eGrNskujrIVb2AzUrp
         zTnPuCmRyBmFb1/pcAqjShNsM9xCGKCPmoAi2ioLxC2burocFaCmSFvdkU2kZ0uIKv/o
         xe14IcFSB4KEeK+A0RtigTa9LrekTotO3Dr9kfv7kqyspx4oIeVpdJfeNYlc1ElFah4q
         VVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176404; x=1788781204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DjNwViL96dqHXrSeA1TtrBU5nHsWdSZF/XzqoG1GBAA=;
        b=BW9alnW1IewcrsWFykmFBCnvha0/wHjHUsrAtCLiFPZ5pvrwllA0jpk0g5o24pja2+
         GN7zhcI07XnQF1AQhOEsULmjQxPmNOCUVln4UYK3MUXypfrsqQVfbUDAnjZ/JaSdDLzJ
         B+3PNqouNg9s3sWG8F9OWLIh0i3IQKcxiIBhUCDfJKJyP2dP7uLc7Akys0YH78hfgwY0
         Fq+XvEvcBJMFOISZq3tfGsRbPClPxzfJOq0J42FrSY3pRLQfG9w/IvjlqwV4t1fUtw32
         d9sQrJbdy1cvgUZZeVr0HLJN0pNLa06F7V9t5ULizvvmfoA7kMuNaJdV+cgemOlegk7l
         zo1Q==
X-Forwarded-Encrypted: i=1; AKwUvByT9N3C4pnntYAk15R+v2ZUaLveNrO1StZytFdDhao2H/u9DG9eTxdQFW4IvQJlvRC6Q7p10yMxC2kB+24=@vger.kernel.org
X-Gm-Message-State: AFuF++lOCqq3U9RdSTQUqxwrwW+Ph+aiOuyZIsGksFQNAOEEi20XeZC3
	VZWT1h+aK8aleEyR48EG7+fCBNref53CVZkzZSUtGvk/fQrkIuG7vwYj
X-Gm-Gg: AYBFou3d28m48lPN4gV5VQ6gdr18Xsy6tk1Dsq5IvRJ5sp3qRRMskGLGo/cVh1L6s2Z
	uKo1X/zIrty4zo6bzWVYu/5ZGPN3xHFtJ1Ij0XTInxSzly8G5Uyaylgv7H4EK4eq7g5+JmtzzXf
	D7AmIzTOE5LdMtV5Ldz0kn5khLpB1gQleOo9SB7zogTqU2hje9kvH4w76cD/89bZ/vy3cU4KAEQ
	0QYZBHVCMtq651behNgkHbaijFdHyTkOJvgxhePUif1z4TZbJMEOj5Xlu3ctiRpHRa/wjB9U+ID
	EVTIV1eoWIqO83yXYJX8+uOqV9d0DYPpvqYfGUKSYEP3XMhg39Y6vV6HZK12NxD5wfwqDxl7Y9v
	fTpoNVuwy/EoCJRCP/J6QNzZpCB2ZV5BTTNb4PnaObwqZmGjH6ILciN4hGNlVMKplADY48Iqgy/
	AdS6J8eBoyz3SN3zU04Ivm8R/w8MhIGuL3be2qxWapz2N1c7ZyUsTmEgPaKyPf+zTqVw==
X-Received: by 2002:a05:6000:27c1:b0:482:e968:86d2 with SMTP id ffacd0b85a97d-482f79b20c9mr35297160f8f.9.1788176404281;
        Mon, 31 Aug 2026 04:40:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm11201044f8f.37.2026.08.31.04.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:40:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: vf610_nfc: fix false bitflips on reads of erased pages
Date: Mon, 31 Aug 2026 13:40:00 +0200
Message-ID: <20260831114000.1844796-3-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <871pbed8mc.fsf@bootlin.com>
References: <20260828085337.3916199-3-mehmet.fide@gmail.com> <871pbed8mc.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Miquel,

> chip.ecc.size is not covering the whole data buffer. You should be
> reading mtd->writesize + mtd->oobsize, no? Otherwise you only overwrite
> the first ECC step (out of 2/4/8 depending on the configuration of
> the ECC engine).

On this controller there is only ever one step: attach_chip() rejects
any hwecc setup where ecc.size differs from the page size ("Step size
needs to be page size") and the engine protects the whole page in one
go, so ecc.size always equals the full data area here. But you are
right that mtd->writesize says that much more clearly, so I will use it
in v3.

> Unrelated, but this comment is wrong, we accept up to <strength>
> bitflips. Not a big deal though, the impact is very limited.

I will reword that comment in v3 to match what the code actually passes
(the driver's historic threshold of half the strength). If you would
rather see the threshold itself aligned to <strength>, I can send that
as a separate cleanup so it does not hide in a fix.

Thanks,
Mehmet

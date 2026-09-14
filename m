Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8668047124D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394446; cv=none; b=ByeHI+rgt4RieHJmBEfIU+Y0kmmIXm1O9HY3Qa3hvwkog+g9YNW3hDugdIjI/Iio1KO82s9VL1jY1Mdh2ipm9FRONaNRkjN5GzV5E1v5Q3nzUvwtL1AdH5rrlAVzMMtl8glVZa3H1D9iqUUFNxxT4adTs0ABqsnr1zNv3tkc1pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394446; c=relaxed/simple;
	bh=FaUj94y57MqF0xGZwbDMThspB5OgCX1jKLOlxWFPJv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EH33Gs6U0oh4LjWi95Ei5zCKlIaSuGMMjdFRH/8RIy6y7pnQfetO+kPLalioutXjqcTsRMNeH5LJg4E0qvbzWAJ6SXkBwSAAoaXOqtBpjJCOke7DI5YskC/bUknXUAf+H0dNuhc9hSCUWU0O57NutbMNy8F5CDSGDhFz403h1Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxldTTjT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxldTTjT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-485850cbac3so1810622f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789394438; x=1789999238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJ3aa4kXmKrH0pgjyTlrtAOwvYzjPD8Dyimbg+nXXfk=;
        b=fxldTTjTc4ZU0Y7QeW/HsAIs6f3ptHWA0LBKWMUTr2u+5ui5ZkJIkcbG/torV+7PsI
         Q9yRRYegixSHoMa9cSAF19GGvMvdFcmi5jdpHh0ldEtf6ryb7ixuGRGwuAbzJNWKRbgE
         tBH/Z0x+QRSQ8ogChmlkwlJ/1JKtPqIIxVi0zfICZ7rPCsCDQRY6cd9KngyScbeNqd2n
         gFV5tNRAUKxhv5vj4VeqgfmiPyVVYqxJYgrnmv6ZHcN924YogHQ4Y9+/qkF+nWSpEk/G
         7LFSsmZ6BidkGzXM4CFb+fy37iDLKw/pk3JizLaq/y4czqb/6Qdf/0DARIH0yVroFKDJ
         7jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789394438; x=1789999238;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJ3aa4kXmKrH0pgjyTlrtAOwvYzjPD8Dyimbg+nXXfk=;
        b=K4Bj5UcW7cYQBznkQrl9pPtNzb/y2MRq/CAdkI7EHrCBSYOuTwsR01WHmHFuJwZ8NK
         ZigLdyRrhapHC4qieOuUvNZEKbWPwr6zjYIjQqbYzOgpuqlo1JSsWK4sy5gZqB+qgzs1
         eBANTWIxvi9TJpBAMAxVbRng5svkGeZH2fQJwiTn18f4HSKQsJu9o5IZb748KyXdxQnO
         p08GH97MhJip6r8Djo18YB2uMOtHs2C75t4/HNA/icOTjpPMRDD/bvUTRp77HqCEWaFa
         5oyiqiAQlLV9HyEtI7d5V+vFN00jsEDC4ptIUNSKL2DySb4G5wj1oXB/PdVsRIuVRQIM
         SNTg==
X-Forwarded-Encrypted: i=1; AKwUvByFGcJYik3Y3GTmu30zapN4jrAHdTn3gwWk9GoZYz7EkWN1Kb2TORNPL01ZstxqX1mmxHxRSEnVGJMrJ2I=@vger.kernel.org
X-Gm-Message-State: AFuF++mv81CPn5mEGxcYnkSjGh/sp9hc4cT89v3e+Od3geXsfDW8nI01
	WB8TGIqf1ofkimMjn4805wPE3eXuIG+opFGJIqRahnXEQYjLE+m6IcvLJXDyiitOqNwW9w==
X-Gm-Gg: AYBFou1HfchDP4gFnSCA6epIkKr0E1ITAfLa4DVIYWudZH1h1CFSc1bNkrg7gbcQBxr
	rX7TZDYpmsQXGu2cR1NXWckwGgwWKnzgusKXg0gBnWgaDaexkIlTtgr6l895EdkAsN1XXSZ8lHK
	XzyA70QOqz/68zqGOcw6Ydp9CfVAD81nk5/j5X8snEZq6uORa4iXKooJvLujNAE/6z88+kCGEkp
	c4KyytoCNZ5mRu6WkvDKdNRi3q+M8Fxw4Jx8O1COnnQ+7QeegquYQeoGKtcRd6MfHBzwEtT8wby
	AIGJDUblAej0zsclvfrUAcMBnfWXjtYBbE5IvjTPK7Cyb7N10T4xr818DmFkBdxRyZiaNQQAFMC
	cbS7TVcxsBtGTrbX9atcMn5Bd/2Jjn3nXgTVTxrA4K8+SPcAe0ljeUlmbHEY9KVx7+dqbEFq5ac
	CBL0sgmNxiX1Rfouve/Xp2LorIduFLKEXXCdq69jW10YosNMEhWwzJb15KAdY3sHyei4SikZUmy
	rgujbh8L6U3ZesKTg==
X-Received: by 2002:a05:600c:4746:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49e7a63a654mr33329975e9.2.1789394437734;
        Mon, 14 Sep 2026 07:00:37 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.25])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm676620395e9.6.2026.09.14.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:00:36 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Chen <jason.z.chen@intel.com>,
	Jimmy Su <jimmy.su@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: i2c: ov08x40: Implement the selection API
Date: Mon, 14 Sep 2026 16:00:27 +0200
Message-ID: <178939442771.2622.14821982022354625878@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904134524.595598-1-pierre@pinon1.fr>
References: <20260904134524.595598-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pierre,

On Fri, Sep 04, 2026 at 03:45:23PM +0200, Pierre Pinon wrote:
> The mode register lists program only the low bytes of the vertical
> window (0x3803, 0x3807) and the output size (0x3808-0x380b). The
> horizontal window (0x3800/0x3801, 0x3804/0x3805) and the high bytes of
> the vertical window (0x3802, 0x3806) are never written and keep their
> power-on values, so they cannot be derived from the driver source.

They are written, just not per mode: ov08x40_global_regs has

	{0x3800, 0x00},
	{0x3801, 0x00},
	{0x3802, 0x00},
	{0x3804, 0x0f},
	{0x3805, 0x1f},
	{0x3806, 0x09},

which is exactly what you read back, so the first caveat in the message
can go. The same five rectangles and the 3872x2432 array also match
what I see on a Lenovo Yoga Slim 7x Gen 11 (Qualcomm CAMSS, 2 lanes)
with libcamera.

One small thing you may want to consider: V4L2_SEL_TGT_CROP for
V4L2_SUBDEV_FORMAT_TRY returns the active mode's crop here. Looking up
the mode that matches the TRY format in the subdev state, the way
ov08x40_get_pad_format() does, would keep a TRY set_fmt and a TRY
get_selection consistent.

Thanks,
Oleg

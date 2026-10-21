Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616190;
	b=PpN8fxLZwSP07Z6z2ZoEQd8YNRc/k9YkM4ys/E7iL1Ni9WQ3mkOQvqwY7GvxM/TJrdiL
	 pUXRf2F+zbdz0sQdY33aJqMfegCOec4YPhs4g+11nHic+o4CpPWprGgTRRidre7lmHuZR
	 Vy4XI8nZnLCmEOHJJZsJBk7TWVMRWRaU82+qPtmsVnK4wi0FyM/7XRNKdfXo6TF3OfGYH
	 aF/uHR+f3uRd18RCDfhBBOLSLy8dWBN9BrP4tCeNg534/Zpe4WOT/nhSfdirQ095eHsGU
	 wXoV3ze/C0mrYOACzrtYi54/+Fc2IPkWMgTw1U85laFyuO8EpZLU3SdJExDnVQea3Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616190;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=/wMSCFq7cwAqlw5+JpUyGiK59gPbKmzoJzlvO01tlDo=;
	b=ZyTbC/wCruZ1vaI6hb78+4Y5bUUnwE+HdO6EK3JDM9lDtcWUp5iaHJ4gWFnOwMyY1pP0
	 P1deiDIhKADCV0S+cxSkp2Eog3Gf+inxUOr/SMhCkRdmAx7bYHURF7/UA2OeYHs9DrAW8
	 CJX/i7YWTs1u5X+GVC5DIPGDXCWdn3K2NPz6/1X7FlODrf7ADaXbNH9z5lmb+zeiYHz7S
	 Xl6RE/0QZCRguizuLUvtBw6maZQg3gk9Mx1ara7X5cJQtbZwzM8JGeVGHXuUnC+SB2j7k
	 /Kps8M+laDyxCYSzjKl2nS6ZNQB4Wdid9UOFqj15RgXN9WRjDLbnDQwtUgR7WqPc94w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gwwp587o;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664C4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664C4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Gwwp587o
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso2190471eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792616189; x=1793220989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wMSCFq7cwAqlw5+JpUyGiK59gPbKmzoJzlvO01tlDo=;
        b=Gwwp587o6azI29+TvQEdT4XuDNJaKyrkNZuS1Wb/cZmb6w0H2yHF29MWJxsJ/25Z+i
         B261985l0eGXHxnxZOaQnnbmRSLY04ujt3hKiGMmALmostf5QpPU0wxepQPKIPk8MFdi
         /e3xSDHfQxPzuwc4WqOW6jKy9RxwzsYCK+2mMZ5uR1zInZ/e7fcCoY/d1TKyD4y+Mfvl
         AwdkZ4lxe18Q0MrlpQrZzDoUVNXWuW7t7/IhFYPgOaDzGuJ4I4WUUh80pT44kGQsIGqz
         +I7Ay+yfALT6kucTCpgFYLSwT/6erjOSnXzs9zK3c9kRlopos+DFkr7ncj5OnfZJd1PJ
         gWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792616189; x=1793220989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/wMSCFq7cwAqlw5+JpUyGiK59gPbKmzoJzlvO01tlDo=;
        b=Gn8yLgRL9ZXiMiF26PTZ0awp7iaSL1nTjBBuoXtiaylVa0lZks7j1Qt09SCXZ7vmFj
         dSn8AnIuIwsaHwz9ASA8aZCP22FpPz8F7CfRUIbil56S9ubr1Ctu+M19LGf0ucKYrBW2
         KbKYbhPeWP/e0p6IxDT+bWhczM/KLexMnZG7HEOzZb6IePw6VZjsLmRAYJ6Zd3Sk46GN
         5smVIEPDy9Yfv6/wQ5IoASi4eYSBXOtuu5POn9pv3s4asGZs2b2fV0ay1qJj9o8PZn43
         2nQCb+SNgWxwkegzKZb/uFHYHLa/LR5SYyYyV3lU92ZMlb18VcSFLRPojjqLKOgo3gng
         2ZRA==
X-Forwarded-Encrypted: i=1; AKwUvBz8YO0u39duzwI11E5ZIeU4xg/xv5q5IQ7DOdYPHiHDNNFKpH2atGwP38M/X3E6RmkfTSNgsVy7RnZN0bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZdF4mA+PCr5X87GNzKYivrm+BmHMT9AkoDLbZcuJ+7r0UoJvN
	9tNXbicI/3BbIj3jmxD0TbWs3MppEP3K6hVq0UUPVs9plnqBNpUj5SMTX9ZDv3Fv
X-Gm-Gg: AYBFou1suGpIFdtrkPJ1/3etZJ1xxzGvgZxqFKhoud/eeLXlegZuBWV/KN2iLql6QYA
	u8PmkmXYcrrmuODrikZcrwVWy8Aenkbm5zKobqOgALq+ddD+uEoH30vS1tuTajvwTq6VWHJvKyY
	6ALaiXp1HGF+hG7wwGOYd6VpLkNAf0ePAjxFAGE+q1/ZSz0lly7dPmgaOMMc+VSeqQAQaOcYWFw
	odQfdjEMRSmi0mEF+Ya8qdke0BrlZ6dmVuV9LFXWYxzVigjSBkWpN8+YC8tnly5nCV0c0E9OFw6
	uQseA8D40+d1Q2wwUnnqDyG6MSMlWFpNfl0zKdp527n858P0dF5LKw1BbA7TQQbxj9ZfJPRtbjF
	PTonD/Q7K7aw0RoAAPmYfxEptmBg/UDFP1BNkp4O5lr/LUISZY/MFpdlBLHGg7WSMEdPtLiQoUG
	LwlUboZqtwslcOj5ljeN/sJZ5g/jikOJha2PODu+FcMzAZftSVRbOHL/uTfl8PRQRo/74a8tBT+
	fEiQjH0VIdkzEHJky9K8ofqEYOr0BVV79DinZD3sVexW3K6nSjOmAP48MZt+wJZMyIFS4/JyScf
	JztK48CtReWHMGCR8ON58GfCqQcuL6IY3MB5b9UME4sWYc2jSQ4qE9jb7MvVUYNQu6owg2x74Dy
	VLgaFt2Mk+W0hNNhnNpHdHDaQ3r0exHFw
X-Received: by 2002:a05:7022:eb46:10b0:159:aa67:2893 with SMTP id a92af1059eb24-190a632f2bemr4055440c88.30.1792616189407;
        Wed, 21 Oct 2026 13:56:29 -0700 (PDT)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a275026sm13371585c88.5.2026.10.21.13.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 13:56:28 -0700 (PDT)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Joshua Crofts <joshua.crofts1@gmail.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: imu: inv_mpu6050: use named initializers for temp in hw_info[]
Date: Thu, 22 Oct 2026 02:26:20 +0530
Message-ID: <20261021205620.342142-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atkKMNHPRLSrD3iZ@ashevche-desk.local>
References: <20261018000924.758186-1-kapoorarnav43@gmail.com> <20261020095936.00002ff3@gmail.com> <20261021183823.169199-1-kapoorarnav43@gmail.com> <atkKMNHPRLSrD3iZ@ashevche-desk.local>
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

On Wed, 21 Oct 2026 21:53:36 +0300, Andy Shevchenko wrote:
> just use --base next time when formatting patch (with `git format-patch`).

Will do, thanks. For this one, the base was:

base-commit: 28691515f54f03f23636cbf1ee2cd60fc31e2353

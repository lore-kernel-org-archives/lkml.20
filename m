Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E054189C2
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 07:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925933; cv=none; b=AM3R+iUB4ewya0pfeFUGpTUtjJyVmijQ1Yo8s0hnKPH5rmZFfgU2S8sU7/7bQDCIHso2osP0UciB9kROlOMt0oLfy1hMxZfqpIkM3IOJXwIVWhcpcXXliJvICrjIfvTpFDTxBI/DWhLneu7HhoesSDmqdGDX8rTwluNTTGFXF8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925933; c=relaxed/simple;
	bh=/kQ4fSekPPFinZeyqe+grEE9/hzLsUKUj00QBMn+5Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BOYKTTr56TXzc6wiVEIebN/hkt/Lpq2uRMgkklQsTlwTPU6Wk68Z/uRLsF0XdfeqHMhqIX8bWalQ7YxiELgeE1Mz96uvgXvmcYZcLkd7lXhYEt3cCKw5oaVjGktRANwGT+pMyB1Z7n+gUftSMnvrbu5B4hXO7pO8/do7GgtDEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwJ3Coi4; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwJ3Coi4"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64d20990fso71413261fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 00:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790925928; x=1791530728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sG65+SKn65DP6wBKULwQwiXjO7ctbm5y4pXnwFPOBMw=;
        b=SwJ3Coi4HLDPU452nuoEbmFp0a6k4TTqrTYldWSOefyJYJczOBYNLOFg0dEhNyLb0Z
         E2OoQez2VrRIf9ZcE2OiYI4QPXaL/gwklkGLQ01qQ8rFMzC4Zk7mTQo3dDcWV28EVS04
         vqSvZBiECtze4u+mLMnEfOt5v800aEJp31oiNlil/W4BnkWHT54ZAiQAHh8173BuE8MS
         3HZjmprcL+O7nqerlP7y3Dug1rsqlfrp7d0IuZjfDX6WSYm/tMwtS3u8bkVajlzyqcvr
         Sajc1tMiaLpWuCKO0uVOPCc5DF/DZNPXIm/Cqpm5DtFavMtDaKO5w53Ai+KOzT7s3VW7
         5oaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790925928; x=1791530728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sG65+SKn65DP6wBKULwQwiXjO7ctbm5y4pXnwFPOBMw=;
        b=QkP9qJWG8fhgVdlQQdFVam/Cd0UxRrzGCvhGQKA1I0z8UoMAWJnbfKTl8KRBWMWAgh
         20gnHmOywfkwEYaEWHXYg7j6Cu9XFeZ288NfVS4bBst+2PnTzqOpMcprLflgvbtVOn+Z
         pMk/0hga6z4YYNAm7zzx/3/cmGXn5qfredJjn/jYJ/BwVuupkeqIiAPjqzm6rPJHGPIq
         0u68Vz+8weQGHFxehW3N4sHqlxVupUOUfVOsP0nA7G3qZdAYtNU71biGE1iwl1daP9Jd
         CgGnK/ZRtySIpjFmvwOywsuPLANKDAlwgv+mWBCqieDDXx7IX4CPZZDfxURldg29dqvO
         Nbjw==
X-Forwarded-Encrypted: i=1; AKwUvBxtAS3Fomv+orhQ88hGZtih94WE81zciE4e0IAlZEPhkhGi/3zr0VGofdVRelpsxXRPwK9u6cWCgiyiE4Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUijqkdvoCHXw1UgrogeM/0ZxifsM346qQztPkY9vaPQ1rKBSc
	UFx2ytU7v7s4B0c/Q6PQ5ARmuya7VujCimiC+W4me/MtEGgKKJf1nXG6TWrswDJw
X-Gm-Gg: AYBFou1W3PwPQH3GBx1/oPc0wEgPLSQ5NaZ9QhUxxQ0n9nooH32U7IpEXYMYkz4DJNq
	MBQI77ZH8QxqvDFKfHU0tCCaZ1KKfWEC1K4XBJ3aQZbNG0k6JkuXmmDEr4toBiOIHiw0tGLuGYd
	5WggOn0GiN3SPCkJblEgcbvQnYMRwo2q/B6+vqzQntOyBNAfELGMshMBSPj6rUQb3S549XUXBWN
	/WQMtPVCbxuXM/34IFU0CfRJh0y7/7Qo0Mr+nHMtzb2ZGJW5DIJgDr/GWqwLGO8UX83IcEI8PUQ
	S3N7TPxcRqY5N/1vwX7dUZZC/64l5WU2kXqpeD8DMGu6FoDiUGR2hwCi/Tvi86Dt+Af0OjsNSFe
	meTXbq0VVQfUapN8mWmLrIo7Z7egfRgZnM2DoP4a8DS5UHbl/9DmaJ568Qe+TTnbsixsKY/8guf
	/tQmt8Kdw9TRNFdSLxlFvZvNTTkaJWMIqq6B+EUXqXu14KIx9jkX+0y20uz0qnmMlJM2aWSHuAP
	fybrNaqWDD73V2XPw0cV+cXvK593Dlagoozd6b0Gs4ibjkY6pL05NHLs73Nza2IjywNSGEgeJPs
	jTNy2A==
X-Received: by 2002:a2e:a9a1:0:b0:3a9:2e08:c76f with SMTP id 38308e7fff4ca-3a92e08cabcmr2410271fa.22.1790925927480;
        Fri, 02 Oct 2026 00:25:27 -0700 (PDT)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e324350sm6724731fa.36.2026.10.02.00.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:25:27 -0700 (PDT)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Bill Wendling <morbo@google.com>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Justin Stitt <justinstitt@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
Cc: linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH v11 0/5] iio: pressure: dps310: hardware FIFO support
Date: Fri,  2 Oct 2026 10:25:21 +0300
Message-ID: <20261002072526.250081-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rest of FIFO series, on iio/togreg which has 1-6 and 10 of v8.

Since v10:
 - patch 1, new: devm_mutex_init()
 - patch 2: devm_delayed_work_autocancel(), modes reordered, unused
   units.h dropped
 - patch 3: drain_interval_ms local
 - patch 5: Suggested-by dropped, patch is optional

Pressure overflow fix is now at v3:
https://lore.kernel.org/linux-iio/20261001121616.109973-1-zoone.rupert@gmail.com/
Patches 1 and 5 conflict trivially with it. I can rebase on whichever
goes in first.

Retested on DPS310 with BeagleBone Black, now also unbind during
capture. Lockdep run under QEMU.

v10: https://lore.kernel.org/linux-iio/20260930100158.957977-1-zoone.rupert@gmail.com/

Rupesh Majhi (5):
  iio: pressure: dps310: use devm_mutex_init()
  iio: pressure: dps310: read buffered samples from the hardware FIFO
  iio: pressure: dps310: derive the drain interval from the watermark
  iio: pressure: dps310: implement .hwfifo_flush_to_buffer()
  iio: pressure: dps310: assert the lock at runtime too

 drivers/iio/pressure/dps310.c | 447 +++++++++++++++++++++++++++++++++-
 1 file changed, 436 insertions(+), 11 deletions(-)


base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.43.0


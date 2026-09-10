Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0036391E7A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010494; cv=none; b=PzO0LWBMbQ/eY8o28Joe8VmCpsimI57kG20qCxpg5vnOjhyGsK0/S3vJTPUebI542OMEsP2ArVPiGZY8uswr6Zd3bkItGZXA7OYRBfbN93FWifWsQjhwYgzXi6hhMrTVkoWuDe7zwt5/sXhQVUO2ISZ7vCdl5TPt1qqJzxGfWyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010494; c=relaxed/simple;
	bh=8jNRGrzAMfC74cF7QqblcNHcIj2RnLHXXe610hq/Vjw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJXauTGBmBFQ0XrkcrnZhO4A56DhQsq8rhyJThk3OQoUzsrat1Z2fgz44B/ZHo/N7ypnFwCqJT3dOjxfHEScDx6IizJ5JQHHDCNyHrFqoeVsuoPjLGr4HoDzE2KK6J318NhTKOO7nDNWBWfLJVz27YDwFgB5hkW+SnBCVmHjo/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUgJu/pa; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUgJu/pa"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-46af36be149so1557533fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010491; x=1789615291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NSfuMa1PaK7LxfGHLbiVRQmOmAt7jKjptTGVArTkaVc=;
        b=sUgJu/pa74fYdEWss+vwiyBP7BlMRkYj4+FdiZvmMBt5IY8z3hueuEWyU+xmevdXQU
         AkI2yGuxd5iBaC5x0B0NLJk6sMMCt94EpuXYPZ39/HtdDNruzwE1x27Ju3DAO3S7qpNB
         ewY4Gb1FdTKFR4ISANInAS3sDP/LJtgWrpXUUrqW2ErnN+A1h0p4dfRGs5+gX0glqZ6A
         eknYnDfE244YEpRAWTX3By1fQZr5NJqS998zYksccEnc+05IEAng+BWNZVKiGoDFQYf4
         UsRK8nOUb50gjGyt7f7WkGHetAabx0w48aFZ5SeU2LjdygYjDvBmob+dajT2hKEfuHha
         3Gog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010491; x=1789615291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NSfuMa1PaK7LxfGHLbiVRQmOmAt7jKjptTGVArTkaVc=;
        b=mBEk88tjohNji2jD3QS0ppLogyknJ2scCGp5CvmnYWxasft16QeDY25a0V7OfNwNZF
         IwBUI5M2V/Wl0yWYMEmdP0/DlonytVga334bqsrniZS8AUJl5AZn5zzGjW1v7fNM1vbM
         iZ+JcmfW7Ovwd3NY4rFOhYbiXC8XoDu2zcKESVl1PmG7Awekozwr3hgZcKvm+tg75iZ9
         UYlvQxwHCYOkBRHaHSblwT47er5ggZyMk+MDpuHZDs6T+82qEZHyMZJGbDHuL1gmAeUd
         DespGPUW/afBhDcoP+JowzCqJFhpvKcEMt9EvDuSdupjLVgGFN1fFvjDsqYv+rfeF/jI
         8xkw==
X-Forwarded-Encrypted: i=1; AKwUvBzc0sxTOuhJUhVrUnJ1vh3F4i8ocnPTJ0KUnuM0LwLLe08A6ml4GVYtuZ0ImZ1jo7f2VLL3uL+Bv5EvQjA=@vger.kernel.org
X-Gm-Message-State: AFuF++nDamdKgohtyiP9lTJNyd30or9231a6cA0J7f1e1PAImh3IH1sD
	lA7sqHFbeHJSSByTGPM02LxzB5kFjtn+ymQSAuOZ8rkeCLR7y05PPY2g4EEbGw/zeU+0ylPp
X-Gm-Gg: AYBFou1hkIFQvSZGYX8RfjJ2zXNZi85MLPawueuTvGeL2JuMJ1YdLzK5C+g5BSi6w//
	tG9MuDc0PCZiBJFkiv1h3eXIE8wkF+pR3KNotIT7Eu6A4OOuqWYCSTwQsarTXW5qOIzditx4Y/U
	P6DKZFbmKBMCiGxlvLODcyogx6h/Uvge9r11eSY24xmup8xsasTWc4o1gXf7RYPzPLsauwLT+be
	KZuiKS3Zp5555bQHYDlZVZcqckp+YRy8lNM1sqdfE+KDrm2lR2b3Eh/HtYiqzJ4f6N4uRQFfctC
	U582T9hfDQ/47BEFpX2H4xrSLpXZKjarp7QOsyPsbreuDjHS0v7HjOFS+sO9oGnGQQlDFGi+33V
	gWI64r/Ui+vuI5/roaqM+AHssNEDVyK17HzTJoNkNsVNLU8gxKk+h6NG4LdOnsm7I7VZd+z59Wc
	v8zwTNN9XFn2U0P/zWKRsZ73f6eeEhbHO+dOnhpnpana5ucu1nfQ6NItT30VfywlkdgE9TVbwk2
	xRNe51/Qp+09mLVIi3Pqqzhqr2e9dxw+gVYMC+B/0KH7XvGRDvNNDA=
X-Received: by 2002:a05:6830:67d2:b0:7e6:6ced:992f with SMTP id 46e09a7af769-7fb7bba55e3mr17226582a34.2.1789010491566;
        Wed, 09 Sep 2026 20:21:31 -0700 (PDT)
Received: from localhost ([76.187.192.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a49sm19758315a34.13.2026.09.09.20.21.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:21:31 -0700 (PDT)
From: Andrei Aldea <andrei1998@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH 04/15] HID: hid-oxp: reject invalid Gen2 RGB status values
Date: Wed,  9 Sep 2026 22:21:04 -0500
Message-ID: <20260910032115.28669-5-andrei1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
References: <20260910032115.28669-1-andrei1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not replace the cached RGB state with a Gen2 status report whose enable,
speed or hardware brightness fields are outside the supported ranges.

Fixes: 252c4bf1d931 ("HID: hid-oxp: Add Second Generation RGB Control")
Assisted-by: LLM
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
---
 drivers/hid/hid-oxp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index 86a559c..c3cfa95 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -415,6 +415,10 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
 		return 0;
 
 	rgb_rep = (struct oxp_gen_2_rgb_report *)data;
+	if (rgb_rep->enabled > OXP_FEAT_ENABLED || rgb_rep->speed > 9 ||
+	    rgb_rep->brightness > 4)
+		return 0;
+
 	/* Ensure we save monocolor as the list value */
 	drvdata.rgb_effect = rgb_rep->effect == OXP_EFFECT_MONO_TRUE ?
 			     OXP_EFFECT_MONO_LIST :

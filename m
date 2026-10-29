Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793292861;
	b=rF5gsreitJQRDZ83GP24TJz4TYoJ4kU4i1DGAGZqmIT+SJQ5OMvFLmyX1h/52ZcIV4IR
	 zn3921oFMCx85RRj4sgPX4bbeIF1DpbW4d0EPye70xdHLXHC1Iltz8KVA39rxQsnFR4tI
	 WwEg+wYxK8CKBF+I5qSEpOnX2H+3CIN/vTnjRohM+2gMM4pFFwc4Xk1yZu4Piifa9e3Uh
	 YCegzmHmfj6yVl25Y1mwmggEdVawziDHYKd5jDoI5+JF0g1XHaQcZ38JC8Em34uEUUYYe
	 LcSbPp7xEF1YJnqWotDfjxZHaHfRIGMBE4wXq7A1IDy3FWfvKzW0oqLZrZrX4S9NJwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793292861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=7FmX03iXfBjs2acD2wbrodl+Db1Ecz5K6iKGphZPelI=;
	b=xViw5U6M+MKOhrClBPdMLKeJ764TuB7WhvkPQoMvPqYeLU+88XJf6k3D5Wm9qhiLOuTO
	 0exhm3RLNazMlc9f1KZ4dXNl3u2HOHkLZ13nsSgP6PzxE0vlOY0W/r4184XzGyvQr1EzF
	 8qp/+LmwoI0ms2yvjDge0IJAwrIfBLYyU3IIIk2yqa4HHP4fQoBHZuMEL705sRPsXMuai
	 h5sLdUvZCXDIABAGXGn+/NYF/iHtUKJjIFbzGOtV6RQHRT5fp1xwDQpEbbkCOqnG5xQej
	 jsnpcGiVR0/S46WPfU1XtW/3nKBMKOcqCatHsZU/nU8MIAMoEcOTB1zk3yQqYJ46Apw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d0dXWeQT;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE7F606A335
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BE7F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d0dXWeQT
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1913091f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1793292860; x=1793897660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7FmX03iXfBjs2acD2wbrodl+Db1Ecz5K6iKGphZPelI=;
        b=d0dXWeQTPA3I9LxCRetbWSO+c75R1NGgnPphSHlgM7r43LOlsb2k+MFX1mj4fv1/Oc
         dS6ZUD1DC+wWz5697SZsva2m2B5ReDoE0cFzphUEkJhAGnKJ0NH5OrdEJ9248LpvITSH
         nRiRs02F904/XMFH07S5LcNJQ1vbzv9kGDFKG4zzRj3v/wZUTdQA15kpQe+bCPd7Uvts
         pqHEdYi8opI2u0vNNoc+9XdOU6QZ5JHQQ4qPu54pTh3meS4/ByEkxAap1gITmzMqfou/
         8b75yR79r4TWsuCYrtYmve50f78qKYvmrITmuhHti9IuQt+Co7z/vkqAI8rdPmgxAPLa
         cwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793292860; x=1793897660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7FmX03iXfBjs2acD2wbrodl+Db1Ecz5K6iKGphZPelI=;
        b=PZzYYVS2/upV4R/3fCEBLUr/zkeGDsLgCrLC1Y25dxy28203MAoySHhgScPz97To87
         gfTQ3QitLRnSADyOU4uv05OhJV8fH7wbq6BqWTVLrabH6gQYptY/axLKLpDO9sNiBiNj
         wsxPvXlELldgK70XKu4xvxE6UIELDV7aH0VMMjUBFJ1rPYKByWhNB3X9CtmArw6huKlC
         XQElULHdPDtGofxpcJlHXhT1B9lbIMltynPnOtYOGZEmYVj8muaiGzr7dthE+GFD7OJX
         sdZHd8pzxn8mDlo/yXeVBIDxk/ovCjgUfyusgbPekKaWVaeb44trmddT5xVW4A9LD6q1
         vcGw==
X-Forwarded-Encrypted: i=1; AKwUvBySwZuJ/d3f/Hh2+RYF/GIBz96dZCSq8U3ew4D6n3/BXuO2P57VCUTyGSWwaIbl1bZLS7alhs3gJT2oUgA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlEZpR8pvLFnGuhwFFLRC/2H5TZvYCsy9LDI03WmbFPqIJ3Gfk
	4cZkjk83a4WT+60DGfAJc2Kf4EJ6Sksa94+Zm2OvJmPTiEvvLt6N4UwyHF6KailHufE=
X-Gm-Gg: AYBFou3wSKa+Vv0lZ8zfJfQ9X2ts7lce3z6tAJbFIDFG1Qq6+ZWrLymZRybtqWPH6q/
	gnDbz6PRugw6hPV8EYQYAXiIP4PnuaMYVCGogkU3MgyOp5QY47or+N39c/70wrEHz9MzOSUesdq
	7KlOU605+D0dZIAHGX+i/ddI0NY8g5qwPUygmx9AI3wXNaF+h5i+oVFUPoKstnMIhCmX4TWl2OG
	IOR8XrEpFq0vuukQXUVKh0SC+oVdkYIQom5DZshvjIQeTc5sLxE9gZ9eaN8X1DXxvyeysOxgHNe
	k17Y6o4Eqz7niuESWJ7AE8bTjAnZXvoS4T7eWp8Z6aUlWC9mce8V2klee4ABS51QsEOJmmAmb93
	L2x000E1i9NdUZUIG9Es35BjQ07LgOOcKbKJkPwjJWMWZre5XifPx9oFRTh984bOyzxtLDyCkHE
	bGnr/bUeAD/vAAdcjFoyCK/j7oQBuz//fexZKdta7g+RwKMjxXfjKANmxOEgl0zOH5VjKtppP9x
	KnT6MtrK6cd++H5WB39bphDp2KTmVEu2E4kTQ3aPMfVcMvfK1efsxYQM44/8WNczWwXUCVREyGN
	BVEI7eckJ0b4mFhX7o3NMyHhqLPNC9mEbE4xQwBesO30MxNt+p4wUVxq/Topu2IF
X-Received: by 2002:a05:6000:2284:b0:48e:69ff:b8a3 with SMTP id ffacd0b85a97d-48e69ffbb32mr3565710f8f.38.1793292859627;
        Thu, 29 Oct 2026 09:54:19 -0700 (PDT)
Received: from [10.42.0.1] ([2a00:23c7:1d1a:9c01:db5:c0cf:53f4:d20])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e6df87fdbsm310880f8f.13.2026.10.29.09.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:54:19 -0700 (PDT)
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 29 Oct 2026 16:54:14 +0000
Subject: [PATCH 2/5] media: i2c: ccs: Unify list terminator for
 acpi_device_id
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-acpi-media-v1-2-eb50f0a34e36@thegoodpenguin.co.uk>
References: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
In-Reply-To: <20261029-acpi-media-v1-0-eb50f0a34e36@thegoodpenguin.co.uk>
To: Ettore Chimenti <ek5.chimenti@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Miguel Vadillo <miguel.vadillo@intel.com>, 
 Antti Laakso <antti.laakso@linux.intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Bingbu Cao <bingbu.cao@amd.com>, Bryan O'Donoghue <bod@kernel.org>, 
 Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
 Arec Kao <arec.kao@intel.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Kate Hsuan <hpa@redhat.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793292856; l=744;
 i=pzalewski@thegoodpenguin.co.uk; s=20260430; h=from:subject:message-id;
 bh=t0GyuyhTv3wyjVaMRgM8lbfgGeqJnYVzcR9oV8F5u1w=;
 b=F68vU5fTxp1Q+eDr58IdP7wMG6e/bepL4C/7bAuZi9aA6n4EkpIfuXDBaOGIUQMHaR2ovIMw4
 ItJhefv6XYtCINGOcV8I6tYBDMUUQqyAZcsLvsit0GX37aH714e2t/f
X-Developer-Key: i=pzalewski@thegoodpenguin.co.uk; a=ed25519;
 pk=vHq4n9IonORH2GTzLv8r6CWAFHzgfBuNkQPXA8NSly0=

Unify the list terminator to have a single space between the brackets and
no trailing comma.

Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1cc4350856fd..2151f62daa68 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -3666,7 +3666,7 @@ static const struct ccs_device ccs_device = {};
 
 static const struct acpi_device_id ccs_acpi_table[] = {
 	{ .id = "MIPI0200", .driver_data = (unsigned long)&ccs_device },
-	{ },
+	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ccs_acpi_table);
 

-- 
2.53.0


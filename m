Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0070F4BC010
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854685; cv=none; b=MfWcXZqlyZK3t1zR4LT3pw/botwZq6mnOnytFdTOyv23qz+8NpizeYx0dpZxTgckyAs7m/EiDPJK+k120zp1FfQnrs9pYhY3J0Iijxhj/yDLo1Sdb/qWyuqEkRGoZvqTQapkkEKmAHLiaSpIVayr0f+2ophqZudQu33/eaehae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854685; c=relaxed/simple;
	bh=6EF7z2uySlV4sLNAOPuHFw8GGYhKTCfnk5/Qxtc2JUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjQgOLlmjx+6dBsszJu5TDngNBIfZFpOd2gf4vBBS85yfqdMk7nnXBojE87jWR8tkoQ5nGNP8KOkVdwyi6XiqDgj6WzsqVf6Er+HJHHMeT8GWNmVVb5Sfjlm/Q3uEGy1+VVtPMFQ5UEnJT0+1SdiReVXgV1NjQPXVUffZUrtsI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKgPoYBE; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKgPoYBE"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so187765e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854682; x=1788459482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4F+3K7V22Kkap0KpdpvpqiCWWLmTdrD5YToY0teInYs=;
        b=BKgPoYBEz5gySK4FzvULF12njfJAomVy/xulwX97cKbvPeq53h/WbbiPKlxhxkE+fZ
         l8c5L6bwc3B5LUSTMW+jV47CzAnyvz18flKSNSPRLf0nbnzckcX2HyeDPlHtTx575hIe
         OQb4HkU9m/PyM17GaJGau7qAjySalFAyYFArEIPVLSQlACIogbma92/GD/G//MCj38JF
         nkhmAa+8BRqB3IfkeRk1an1HjbSxt5vh4OF28xy4lf6nX9SE/mvyFNUd7MA3kNq48fr8
         WWr1bVKBbE8ATNGbhSJWng8PFdAFOXVSeX8WT/vv09Z75ORJITzGFNo1lgHxGeAWzi5/
         Oj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854682; x=1788459482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4F+3K7V22Kkap0KpdpvpqiCWWLmTdrD5YToY0teInYs=;
        b=Jo8JKU2iE8J3wR5ayjLP23inABXLmwD0gosyWgAZ0bAyEiLF5ZrpQw1jsXx2tV8tn+
         l6gOiAxqTyESm9TPfpZK6FTId4zMx1zCmdaVcb+WX74g3AhSAFAD14XDIXK98psvTnsv
         0oYhFmnuuXs/t67CnZHC5zqmK7SnJCrbGChX9Xm59eJsyWpUUoB1o71BpnF51frTYtcD
         uP0yn305oJGFTa7gydtCTrcbKP7Eepoi4NlyV0P8oMHRomtbH5CXC4lVJQb9Gh2ASR7y
         wMU7dG6GykN5LUybWPmWYF9Ksel/GcvetfTchioEi7/e5gcG6Rwmmw/XA6M+R3r0CD6o
         PAZg==
X-Forwarded-Encrypted: i=1; AHgh+RoFV15WiB3jMITUekcXFkW5Rf60tlI9ipj0GMFU/8G9LxxSnHw+vV5K+2Fw1XG0LyTaVC6pR8OaDmjY/GM=@vger.kernel.org
X-Gm-Message-State: AFuF++kAyhlYLizM5/LCChwpTaMPdCN7HBfN3tcT0taCnNgzB+H5g4id
	/ZafSOCqcWUqYUFcuUmGjYjxyP7McdWEq8RZD9HYqRsPWwSRPJj1nshH
X-Gm-Gg: AR+sD12z/8NPOSAdQpmQ8WgaBQv8Oh5jwQLRwUfHJeekpxMcOR9pzNsT4DwxdKJDl3N
	f1KSqKdgyeroxZHTkdST9gjZIVElwoRbB2LdqBwxnqxm5q6dDEk2G9QNRe0HTxAnteE74zf1iDY
	wM2VWvjMvayycdYb4naNFQKGEMTNloY6ZTBpiEA2T8wBYfRF4tQMAJA+tEsua/sGzyd2PhWzaE4
	DOaROOz9Avv9Lp331M/HYkPneqwxzcvdmRX2/FfEEIlrGQwaJQkl7LPd1tkOyCYBceC/eSitj0Y
	nGK+jyDiS96CBhpW4bk+j2F+WDQ7HHq79shnx9mqiSSSFJBYmB8pjCcXoxcvuWSy8IOMLCswuOZ
	9zh5y3ez6mlTlopDgjcYaZylgqcIUnkuJSHo7a5LlBKBHyVHRNZ/OIj4PbLCSgHNwSctJhaPH0G
	WcyN9vlz4F+SllyO6W9j6kKx77wlgqbwcgOeXZkc/wcxX+BQOeke08lj8qoLcnqYBkBjDzBmgXY
	6r+NdGzWbzmipyXmaO8fGG23MgO3fcWF0ixPTRuwDMa
X-Received: by 2002:a05:600c:6091:b0:499:484a:98e7 with SMTP id 5b1f17b1804b1-49b91c4b3c5mr14656215e9.14.1787854682035;
        Thu, 27 Aug 2026 11:18:02 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b497fa9c5sm66270655e9.4.2026.08.27.11.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:18:01 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v2 01/11] media: ov8858: Extract digital gain programming
Date: Thu, 27 Aug 2026 20:17:46 +0200
Message-ID: <20260827181756.2430054-2-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
References: <20260826132256.3343451-1-mauriziocasciano7@gmail.com>
 <20260827181756.2430054-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a helper so
clock-specific gain handling can be added separately.

Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov8858.c | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov8858.c b/drivers/media/i2c/ov8858.c
index 3f45f7fab833..f0b3b4a5d3bd 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_digital_gain(struct ov8858 *ov8858, u32 gain)
+{
+	u16 long_gain;
+
+	/*
+	 * Digital gain is assembled as:
+	 * 0x350a[7:0] = dgain[13:6]
+	 * 0x350b[5:0] = dgain[5:0]
+	 * Reassemble the control value to write it in one go.
+	 */
+	long_gain = (gain & OV8858_LONG_DIGIGAIN_L_MASK) |
+		    ((gain & OV8858_LONG_DIGIGAIN_H_MASK) <<
+		     OV8858_LONG_DIGIGAIN_H_SHIFT);
+
+	return ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN, long_gain, NULL);
+}
+
 static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov8858 *ov8858 = container_of(ctrl->handler,
@@ -1531,7 +1548,6 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_subdev_state *state;
-	u16 digi_gain;
 	s64 max_exp;
 	int ret;
 
@@ -1570,17 +1586,7 @@ static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
 				   ctrl->val, NULL);
 		break;
 	case V4L2_CID_DIGITAL_GAIN:
-		/*
-		 * Digital gain is assembled as:
-		 * 0x350a[7:0] = dgain[13:6]
-		 * 0x350b[5:0] = dgain[5:0]
-		 * Reassemble the control value to write it in one go.
-		 */
-		digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
-			  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
-			      OV8858_LONG_DIGIGAIN_H_SHIFT);
-		ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
-				   digi_gain, NULL);
+		ret = ov8858_set_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0


Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CBD3DB630
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 23:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787872661; cv=none; b=Mjsr6V3eYncy/fJmebUQtFIiQpFfkUn0LksQqWTMnuss8nJ1b8SnZmqnPoFLYhz5AbuujMYKCUD0KPaVqJVDLgtxbbO8pUroC05jk799dqF9ttgb78IsokhxG0zUfpCiQQq0wrR+3oVj5bachtXP8w6B3KQiq7VkSrOTy5GOKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787872661; c=relaxed/simple;
	bh=xhrDm+Mv7c74PMtacFvusD+88J1ycuEMG7fJpBlsDjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYe7I1iUWk7OqjmEgp+Xk5aFd4rnL8QntkDfQxhAKzCWe4zWWm3TlZ/K7tn6qG2GDmMMDwo2uos/6ZR5dYVE0oMEIxSENqjd1Xd4tJvhO6hST8u1dgltGeBUNfCXoLXgglmVvTzFW83gBbF/31X23dlVH0LtZowrdZrSz3H7VW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUy6de0N; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUy6de0N"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso3212785e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 16:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787872658; x=1788477458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=HUy6de0NYTYNoMJ+REIip3ggO9SZgg/Z6ak4cxP2HmX4xRFXELDRJLIrjZRJt6HaT4
         9R8s4Vf0nMXwtqAujai8giU9mKzUPOM6hhCkhUlx4y4+cejSY942sMqUnCYvGR7SXBA/
         w76dhMcWFEQAvnyAts5xiwqrS+3LgCqiAh1lMf1sFueSAVITCwL6YdmV7pqtvpbOmwot
         DB113Z5Qv/IxEZK0hAu+GK0mWHh8vs+7GEMnkLUqjtDhPLQybKnTUpw4x022Wfe2Jsrv
         jb95vWApV5xrQpgBYb0NxjY2CeddAqVqc5YtYbjGqNX5xD4C5vkmVgscFv2czQy/uJEH
         qFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787872658; x=1788477458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=nqvX1tAimeppm+VMoN0NgSqw7HUWq2DhfttkcZNzgF3rkCbtSgzMt+gZd7uVT4kkcJ
         lsip3xKZYIFJUHy5MOMX0LpDb17lfE56Ch4eGQmioHtWLe7GlQZyIZ2M/Z9Jqhufh+ex
         gE177oRV29InWa1mBeW1kFQA+FIcu0VbQWlRJXPG4tiZVQfvySXyFHEyMzFisJPm1u0k
         PwRjVEJaG4kzpmD44kzyL4TwcMO/14tTKxaNln8A3MoJsjWTX3uPER0+ZO7Mvd1k/k9G
         KkyTKNMDuBJ6ncmHdwwQgQkGKQzhokuaYMLAwzj5GcjCh+wP8X/zlXYumndavsRWYygU
         1Ipw==
X-Forwarded-Encrypted: i=1; AHgh+Rpe2K7tfbtyw7883Ce5XwUalhLW5u8Jhbj4ZiSTg2AnSSgLkYUi4qskG/WEmHhQVneQUHGzWIi+nMQjueA=@vger.kernel.org
X-Gm-Message-State: AFuF++mqTUsGDOHyoKLNym6kmSiwtvunhFoYgWkWrwuDZQXsxULbbmL2
	qTpXWrPFu5n+5K3fq++ey//CYB+sFlVr00spNmpmsAfZ9dgWjZ+4FJi2
X-Gm-Gg: AR+sD11Tfh46TZlV130Md8Eeftd6GUhlDaB6toRDSTSnG+fP0hruB4ebmVdQt/lkfQL
	8m0Los9oKJqLtKZZGkX+i9PqMXMsezHh2idRtnqtCoER0C/y7G5c8sufGOTH2lYSV+q9VyO6BYo
	XuuL807YvFC5A22E9qI0aY4G+KIBmxLFFie0sp+QBuTAW+pVq6ImG64SOUEouM/6DnBb2lkgxW9
	g70F7SHHcbRCq3kAeEKsSVL//rnrtjKuR8XI6qBE3rTIx0+m2dhukxpAcTUb6hw8TozlY+0UyIt
	GmhuMhIss2Jijb4Ys2ppYYWwDL+gzL0elfGXgI4Meozqj6A05Ags/+q+Sb9AUbkBaF0UWIPRdbc
	D8kfJa1h/89ULx8rdd/fWWucIYC6VfbsPgUOfBN4HTSNW6MhWTKr9elrKQSFgjUsplIwlx4Lr+b
	Pp3LkJ+tFdK1XNeYLSx7IHolTahgJuOpCx28KRGfuKr/1S0JpbbwKGTPOUxvmwsRFZV1dzdFj6E
	+MSlUlwG0/SqhHNaFNsgCYHupqB3c7OzhkTswLR5h0+XKwSttw5Wvk=
X-Received: by 2002:a05:600c:3b25:b0:493:f783:c46a with SMTP id 5b1f17b1804b1-49b91a67d36mr26027295e9.6.1787872658358;
        Thu, 27 Aug 2026 16:17:38 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm7157765e9.2.2026.08.27.16.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 16:17:37 -0700 (PDT)
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
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v3 01/12] media: ov8858: Extract digital gain programming
Date: Fri, 28 Aug 2026 01:17:19 +0200
Message-ID: <6fa23c0b021ceb31e6137986bff139870e4769ea.1787872237.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787872237.git.mauriziocasciano7@gmail.com>
References: <cover.1787872237.git.mauriziocasciano7@gmail.com>
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
index 3f45f7fab833..d95f034de752 100644
--- a/drivers/media/i2c/ov8858.c
+++ b/drivers/media/i2c/ov8858.c
@@ -1523,6 +1523,23 @@ static int ov8858_enable_test_pattern(struct ov8858 *ov8858, u32 pattern)
 	return ov8858_write(ov8858, OV8858_REG_TEST_PATTERN, val, NULL);
 }
 
+static int ov8858_set_long_digital_gain(struct ov8858 *ov8858, u32 gain)
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
+		ret = ov8858_set_long_digital_gain(ov8858, ctrl->val);
 		break;
 	case V4L2_CID_VBLANK:
 		ret = ov8858_write(ov8858, OV8858_REG_VTS,
-- 
2.53.0


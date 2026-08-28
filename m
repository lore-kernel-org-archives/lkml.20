Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B016380FE5
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933707; cv=none; b=ZeAOBYxh5vtckEuiRzph5hD8htYdJbJc4GvmbFwzLS4izr9b/ai+q8b8XwuH4yErKHzZMldsWDqEoyLwz9W4uv+OpCGT5Fh7X0KVTGGYeoyZStZyvRglMJdSCQCi5Jn3CEtiIA3IdFcrlz+qnbPf49ubvyeNrtc0VFFtoRButnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933707; c=relaxed/simple;
	bh=xhrDm+Mv7c74PMtacFvusD+88J1ycuEMG7fJpBlsDjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o3D+rpA3tMmuCyMTbb9uTizZBYA7OplaWUHWYhrjq9fp9AE7JxNeylVvWbb0+BdqQNQ72maPLJ7U3GQaN9lcV9OiCisIsVtv6ZFC2O9c+HB+ZxCYt7PoCL9cH5xrhsY1jx/cMIj/EnWipvzqTt32fLcR4ZfMgVd1hWNlPKufkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQyPFXz2; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQyPFXz2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso12060655e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933703; x=1788538503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=QQyPFXz2NVslEW+QnLZWvKzzqn/btq9Msxr/KYCrFh/24L6BvjJw/5bk1Q4EQBt6GJ
         gRIWqRKFgMOoUlh8ClCd+bDFqSGzNIH3cN/x78g/K7SWq+10tuJ1mzdeThsU15HKyu1Q
         +d05E26zQsBAMNWAn8kV9OrrSaaaVdg0dVN36MF5iiBVuPcb/FRQkiwRnOXk7I0sBUF6
         ErTcWkg2ekyU97FbgdT+575tZx/QlGLJwgOPH2MnmrdMq7uVaY8oOiharCgobxlrXj1+
         z+8aDNkFgCfJe9ZpKaFnKHU3//G2+ywXw4qsRwRjL4F3sOhdehck/skrxvFKoU15CJ2S
         QlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933703; x=1788538503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KZWFTR8cjCr40UFMGvLuRrF9M/oaIFX/lTih1P5E7Kk=;
        b=LVl0qn7Fox9wp84x2jlVl3iOWT2S21sfuwBwvkh2nSDt/6Q9Rb6K0r/tn6cj4iTf3N
         dSonLiC0V7Rj2/9Goe3EAptjZJpy6bJXmPvCCQbo7p/fK0vuWXZyBcZ3krarm3qeNLnb
         7cUF3u1/kwARyFj+PKt5Tp2+0O4P4Xxei7pIpcI7rVcy/5bAdIdwvYI+MYfeJR8E56E4
         1/M7xhKCgNahLY9/u8yO0fLt6h8va5YNih/ggnugjX9v3r7H/0exP9kVjGTS/CsB9JeP
         C+ZMZOPxsvNbN6oFAtMeHeEdEUdhXoLKtshTHm2uWNg93aUXH95w0c8EQ/SWWWQB/61N
         QD5g==
X-Forwarded-Encrypted: i=1; AHgh+RoVgja1ntm7N+5eUFnN09Yn17CAVZMQvjNHIV8RN37BR/FIWgt21iFI0b9w6+VIZIAZKMwHM0O6ANdOwJ0=@vger.kernel.org
X-Gm-Message-State: AFuF++mLIUR2ma/c9JHhCNzfBz3KdA32IYkUvIVFsQmnQ7jvZd1gPQqx
	ci+Eb/LQGYt45I0tshjuRQw3UvouxkbZlWillt8s6CkMikk9q9hE5jWX/Nas/DYO
X-Gm-Gg: AR+sD13aHQPB/VkK/br+GiETAzsq7hXaMznCLE8AGJKJXe92U21IaGpjszd8dc7+mbj
	ZC+X9K1OyzXp5SrssyvpSd2cJGA1+uIMOHvchohm9i9M86iRBTaKyK8mbts/hy/XJzdwms3YvWo
	mR1iP816Aks/tHMh/H/lfjeeggzIVlziybS6Ssx+VDGKkHxwxwxCujZ1ke+DgTtl4UjJ+RqSDXU
	q81rarttV1rfHwztCyhSuQ+U2bStIwnRsKO48rQSZlnut5rTuQrcEkKJTseG6Nmm1j6OdxOhbGF
	+cicURek8heKbyrlo+iDY161VvooVHHIa5TrWjtMDQgrdwDVEx87C1+z4wuRh5YLJEn4aWqBJt/
	idig94PD27RE36ZypWww0OXR/e7JQMhlLshF8GTO9Pgv/9seRKJ5cjRtCA83UJc53KrdZrVIGjw
	JLG2brV8gZaxbm3JKlrKnl8Q+Aam6X6IMMN9UrH/bv3z1A+lkAA7LknqDJUkhTUqGGLDAH4Pnqc
	3M4r0lZ+PV54OJI0bE6BXeDeQ09g38dNg1wquvWsw==
X-Received: by 2002:a05:600c:354f:b0:493:c47f:3c55 with SMTP id 5b1f17b1804b1-49b91c1ece1mr134990155e9.5.1787933703419;
        Fri, 28 Aug 2026 09:15:03 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:03 -0700 (PDT)
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
Subject: [PATCH v4 01/15] media: ov8858: Extract digital gain programming
Date: Fri, 28 Aug 2026 18:14:43 +0200
Message-ID: <1a7c8fba6835b2191b71ae1d903734621626e1f6.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
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


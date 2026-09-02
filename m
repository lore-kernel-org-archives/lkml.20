Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C61E4A485B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 14:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360834; cv=none; b=c8cu3OvZK4jT80fMtkXTE0yvvZpf2SdplNA4qkKAxW3Sg6KWWqiRF654+0Ilsu+jvo2tcr1JWrlExDrWjHZZEj4wKcss4rXP1CVcppgXMbZFK0dHf8eaXVqhxIGiaXv9HGFsANIoJmypVTwkNhMpHGNWucBQHlG/76xlL+5sxCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360834; c=relaxed/simple;
	bh=IJTIjXefCtpyzFz642pELl2c8LGlNjVMmQXZPOjQ1EU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fgD4b/TPzwxjfV8kI7q/oZvCsSn1ORqNpjhvyWT2kW/X/4tVu385pFlPrSKwY6FmzGiblMoYAEVDsNqMQsKp1gHpNQgViPjKn70HWF6tueYSEE3Bh/lDxAZnm4aQITUWdF/OzPPyLwKS1FE5fom2yXmWoTnulD5Ems/K58Cynlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kjn15Bj2; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kjn15Bj2"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482fc3327fdso794003f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360831; x=1788965631; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=Kjn15Bj2yjumPTs6N6HCBlkrhqdHV9BZ01hLSpsgGL9jYTnT9PpSm5+ny3IBhlTUYs
         qzZNEZSM5Q45LaORuu2RXT4Tl8bbhpo2VyICKDkA7jBcyd8395qQ+p96OnBw3ydGFn5t
         iYxyaFMK1+iI0Me6RDQFLevTqOvqhmxEpC44GWgV78v5/MP423st+76P+0Q+lSDdhDVb
         Lkn87VMdzMuMvDaZYm5mJd57kJ6V6loBUU/vNfzTNfQf2T9pV0x/xYj8wzSsZe3EEEzA
         4mCfPZY48UbCzA4jZm5uCBowpHwPOdcehROpK68lyLcsDLRc4xs861awD+zMJORr70/8
         H/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360831; x=1788965631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kEYOKwOKleJni/53+3Zevf6XMaih8vPEj3mTYB7Fxs=;
        b=FX96s28+rcNCsnNLzL4ctC+RPa54Tcoo0erIt8dKcxmHN8WBM4YETfntD5asXx7klj
         DSrhWqGW66q0xCc7ZI+7KwK+059GkCrzzpgukVuSrDk7dQGSqVeg9dXN8Hc8aZh5KOZY
         mpZyyBl5y30ZcTsxBh7sG5z1iUvly5FYJ6wbh/sMBS0LblSFZ26ZwrinQVEJrHIt0W0N
         amy3AN8DPkLoxcWHSapDKdy2j3ueITEbpFGjORm4m5DHAvVPYqHndlOTQCYaT9m2i7VN
         FWNjjFNFFXaRmBGTKyS7FGLtkMhOhKznbCk1jtw8eNAO+0sXkwPm+skb2PT/GKxVMP4e
         Lt1g==
X-Forwarded-Encrypted: i=1; AKwUvBxqVVfNdwvL0ghoq4NTcXyyXuW+/Oew7yKK/Y2JSaNU83iqGeYlaP2nst9Vb7GBif07naC0+yU0u+NbUmU=@vger.kernel.org
X-Gm-Message-State: AFuF++mpbwzJ0FUr87ERtEDL5Sn7+CrBLDBjhPv2Hz/m7zEGtO6E2jYc
	LsLoIetebHniKTg+KDld1T0O/ejh8bV/mSN4z+svx9hhTpbNkKOpGaQJ
X-Gm-Gg: AYBFou0Ym8e9vNyRqyhJqa072X/TbeMt4zUocgg9S7DRLtJnrzp6r6wbT8pmlA2vTtY
	Ew55DvNA42Lr6j9RMRyhpdoGsxANkcdi7iJdv9f7Vgodn6KB1GgnAbqzjJ7zzNYgqQ50EVeuoRn
	u3c5RmGDALpKdtt8rJknHh1vkhtL4yymu+oo4VrFjCZ33mg5vEf03yzerMunoKbZV8dyPN4yNPE
	lTXaU5G0t4UPvn/4CZlmY7ujT+JvRizW4dhMe1b8u/hqlcbvKb68vnzeTF6NotpWNDMBDpUhzkY
	ipHzmbgcxtVI93eFNVUXyDybHaz+ccyFdWcTWo8yPh3jzTnrU8GGr37/EQwu4vUiNOGi9jyHEmT
	5t7Kz6f+663Kxkiu8n0Rfqo8H5ynCInxiz5Evd3R2s+XxBKNi1wfDm01QjTyb8Mg1uGZnhNEExh
	Kp3LXv2rOMS8Bl0VGXcxIuGq67WWYoH6SojSTJG3311IGPr3vvfqpA11OdI9voobITaxA9Xqukk
	WRWU/unKeyx0hslHN2bU9zTU+KW1uyF4f/e7sned4bd
X-Received: by 2002:a05:6000:2211:b0:484:3c87:dc91 with SMTP id ffacd0b85a97d-484913c33bdmr9871534f8f.19.1788360830513;
        Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:50 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/16] media: ov8858: Extract digital gain programming
Date: Wed,  2 Sep 2026 16:53:30 +0200
Message-ID: <517c4f11075debaaa3eebc4e8bed574ac832565c.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the existing packed digital-gain register programming into a
helper so clock-specific gain handling can be added separately.

This is a pure refactoring: preserve both the register packing and the
explanatory comment without changing the bytes written to the sensor.

Assisted-by: LLM sparse
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


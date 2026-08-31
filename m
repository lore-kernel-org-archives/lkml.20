Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B308537FF6F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199294; cv=none; b=DssYf3CmBY8f/LUZ+7z1EKni4pWCSmWxkbXAbsifKHpHLuoQ4/kW6JsY0NutrmD0R2ZDr6eyjUm49Pbr5VZenLMt+0LqyqwUjm1qoKDWl7Nw7OAYbi0mQH+zMUHGrw3Hz81uGhI3TzT7XCYr7q+poVI+6vR9QsL3e5QzHYRI3uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199294; c=relaxed/simple;
	bh=tOG/XM6h09iKbopfG4HSH27a9d3EpUpHmIenSbpRbCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OAKYwQmI3eKifmF+AAaS65u8gSZfPuquAUV4LUgmFqYJnez12dszwqx1+1mT4vUtyDBLLb62EaN4CR7q9HriXJ4THL7ifEeftXRmuA70WP6hKqSfvAomT94HK/DEfB1KjZxxz/2g4XwMk3qLV24SECCF+xQsFXzo51Cn9I/t7as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ExD4FVLQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ExD4FVLQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48436668d20so1047503f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788199290; x=1788804090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SB/CLgILdTURjzN6f7W6LHAoMmDLTtylLqF9+VZGOwk=;
        b=ExD4FVLQqYcFHp1VojDfPqruxNMaH/cHYRGMjDzAVXsWiDDTnquJhAA1wAH8At7l8P
         +gtk9zN/HbQ2nRw70x4hDL4UjXXsFENwMqNMd3JxSTJqy4kwvKJvlYX3Ig/wJGj7KfOn
         5ngjEEgKcegyqZYogz908kvlZZ69OjF+yzFXdL2VspG0UqC3CaflDkAd/WdG2LpvfoIx
         6hvq7DTFM6QBdca08ZFadUfERl5mU3HiRQZgyrbltChFGYpZgOjj8UMvJ6I68cmD/D3x
         g1RSicChU6oLaDMy9/rXDtLxjdbHKBMnY8uI4eQVwPqk/kxKrE1wyUA+ClKK83wZ2XZa
         Dg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199290; x=1788804090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SB/CLgILdTURjzN6f7W6LHAoMmDLTtylLqF9+VZGOwk=;
        b=iZUlH0fcen8g0PaYUOzTlLH/zNfrzK61e8EKmqD4gSjgymjU/2b4Z2q8vuN+lX6QhD
         h5kpnNsIrTf23RIcNZjSu5CwjrlgZfM9wY2ODALt8m0pBdwoXqnd7BvntancsrHfYdM7
         T4HqeJFwxhi4izHlYp+mHwPx7RSJil/lT6rgW0u0UNBBpzhS6A2BFINTI+J4oUw32dJq
         LrCLX49BkkR3xeAU9+68xUm6Hf9PW4CXngmcr4qtfVKCUXRPN3xPBfg6BBI8j6XQMN98
         z7cFvPHNfudYhN4vvfUji8e+C8zJyiBAQZxARizrVsWNrXjSyEHv3eh++/tOaEy+Xoin
         Fw6w==
X-Forwarded-Encrypted: i=1; AKwUvBzOEG1nPbxo5nwJPeI+lLnrRT8w38oQ50S3X3KLFIVeBD7++A/18xAr9RLKHq6fmIAbj7oMLyZTo2l9YJE=@vger.kernel.org
X-Gm-Message-State: AFuF++n84PotcI9z93NFta+EaZafkdOI723lKo2HMZcHW4BDjv3g2uxR
	JQTT+gyy0SMHtaad0RcR3j1NfSgETzl/A0teArgngSV/m1EECZzuEAsR
X-Gm-Gg: AYBFou1B0cKKB0BRxQlL2Ir70SQ8gGiNT/Jc3Oqx0oqnYUYUd2eRlaRNXaIRuglRnyt
	isRtsq8RN3EZvV4WuefUXoRx8BF2XJLn+HyN8pRV1lodXh+HRpS8e3dfPm327bdVImrFniYWZZg
	SqKHTQ+xKvp5RpaonfZSO69o6PKwuzRcdS1QXV416RzaQs1m9iF0R8aU2Gptww3797bNOwjNUPB
	worK8H4FrxFt4yW2mdZfOIU5OuNZkYuvZI8RsRFetLnVYWqt/cSbe3GQOTaGbpXfqQYeSw4890H
	P4TBfr1E6UjW9TECu/NJyecERGVmjbOCAMRamiOAvH8CoypndVh0FLtjAWkGVD+EOLHJSvea2rK
	JopbIKrvjgumpZWUPnkTpXIWziGa7JXHnxX5mtzU+cXzoPipYCBNjhWzuRSwWB7KuXO+/1QEb+f
	xTdK+cbFvXkfMr3vuQwxCHarByc+39aOasVXi5ElqJ6mF3WH57ImsjTmBaPqgxQxNDVUDm235Os
	baMcxdGgkk3uxh00yzTbyA9pSsLAGmEkrN+QZ8OroE=
X-Received: by 2002:a5d:5f49:0:b0:483:ca4a:530c with SMTP id ffacd0b85a97d-483ca4a5654mr27868570f8f.18.1788199289663;
        Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
Received: from 1Z10 ([78.213.92.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3fcesm22861530f8f.5.2026.08.31.11.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:01:29 -0700 (PDT)
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
Subject: [PATCH v5 12/16] media: ov2740: release group hold after gain write errors
Date: Mon, 31 Aug 2026 20:00:57 +0200
Message-ID: <20260831180101.3109854-13-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
 <20260831180101.3109854-1-mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Digital-gain updates start a register group before writing the red,
green and blue gains. The current error paths return immediately when
one of those writes fails, leaving the group open and never issuing its
end and launch commands. Later control updates can then be accumulated
in an unfinished group instead of taking effect.

Once group hold has started, always attempt both commands needed to end
and launch the group. Preserve the first gain-write error; report an end
or launch error only when all gain writes succeeded.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/i2c/ov2740.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index f3d91c87b3d5..5f381b7972bf 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -696,7 +696,7 @@ static int ov2740_identify_module(struct ov2740 *ov2740)
 
 static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 {
-	int ret;
+	int end_ret, launch_ret, ret;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
 			       OV2740_GROUP_HOLD_START);
@@ -705,24 +705,21 @@ static int ov2740_update_digital_gain(struct ov2740 *ov2740, u32 d_gain)
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_R_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_G_GAIN, 2, d_gain);
 	if (ret)
-		return ret;
+		goto release_group;
 
 	ret = ov2740_write_reg(ov2740, OV2740_REG_MWB_B_GAIN, 2, d_gain);
-	if (ret)
-		return ret;
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_END);
-	if (ret)
-		return ret;
+release_group:
+	end_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				   OV2740_GROUP_HOLD_END);
+	launch_ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
+				      OV2740_GROUP_HOLD_LAUNCH);
 
-	ret = ov2740_write_reg(ov2740, OV2740_REG_GROUP_ACCESS, 1,
-			       OV2740_GROUP_HOLD_LAUNCH);
-	return ret;
+	return ret ?: end_ret ?: launch_ret;
 }
 
 static int ov2740_test_pattern(struct ov2740 *ov2740, u32 pattern)
-- 
With Best Regards,
Maurizio Casciano


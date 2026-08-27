Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19926359A90
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787844157; cv=none; b=VQIGVmpQNqbk3j4uqouIKr1aCzSZ092k88DE2xJaczqVqFIziBYZ2o802QLE0VGjn+EPnkzjZXACcXMTbBZmZS1DXA64c+wC7l54jyaPXURq4AssSzkrVcCmOK4HW71wHrOx3NcS/38TNufuLXndwB0ouXw/dsZub+VUF8NxSeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787844157; c=relaxed/simple;
	bh=yXX9sw6BwVcjhFNvqe2Dgpc6v4uC7YguM0b1qU39ng0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bP59m22w+N90dWO5YzXAqHpJQDtnp/u/dVdEFolu0lNUBwi0SVCs3M/xa6cSde21Mv99Vj2gPLKxyzeb3c5JPwlKi7QmmNT0bK6g7tFXuLf/fmUdxhpoBPT4FiNoDEWSZZugrGYjPTXVS+lzsapWZBqE+fS38Zgpxlv4YiYd7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLITOOpz; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLITOOpz"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso6346a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787844155; x=1788448955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yE7H5T0qY9MPYjfzcvpqEX6uXmQI6Ezkf1TYa2yy6w8=;
        b=GLITOOpzZ8RpnTpy7mWf2AEBYhPLjGy+U32ObXLF9ANy92dGURQPhlgD9n/OfI2sxr
         PZRwutMKsULW3gOOjTeqz0c0738EEtdle7lgjzZsa9ti8EsdXfIdj/dRE5USIh91qBe5
         b02fweyq6uZ566e1X7S8x1xMSV8mpwdDfIsX8visapMlp2OUGuxZ+W4nDjdTOLttEMp+
         oOLh8hVMk1q1FxV1vTduYSbNv9vRu+eHM3//Dz7kihdlA9wxwb6j1UHFy32NqD8vQ3hh
         nkVVZY67ZTqfHC9qKVBAqy4L3jc4G7LFYDYdQ7vw3Uy1qEQTMjFcW4Cfab8+PRqvtFuR
         oVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787844155; x=1788448955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yE7H5T0qY9MPYjfzcvpqEX6uXmQI6Ezkf1TYa2yy6w8=;
        b=p1DQGLoXrKhMoeBABPC8dmSFR/bHObPk4J0Y/rGlAICdQzmX8B3TM5IKSKCX7syfE7
         Hq4c+eRZ1dDk0/OFwJSa+bwaX0erL+slYQlx8lelvq0UovU8p3+QUbDvOHYXEt3xB31B
         ZQsizXeJ9lO7Wix84xnAySdZK8fqQDlCnUyQFMqzs6s+zaGSBNu3hdGSQQznSz2qHOU9
         6PyfixDyeMvO09lIU/ncuQqAnUufGP8BUaLaZ9T9gbsrRUvz4+4B0928XNgxCAY+YtLf
         l5mXJeJgXkGaRZ4RV27q3oMphEu6uRoVzs3CarydiVoHOGm1f7VttKqZ3b9rQ8aD2O0U
         oS3g==
X-Forwarded-Encrypted: i=1; AHgh+RrEboMUmWelA9rlds1ucy9qEYSzVF0xxQLx+JE1EKtRvLxAPIDjBkAsZBFobd61KP/saEyx32a6jRMr3Yw=@vger.kernel.org
X-Gm-Message-State: AFuF++nUdy6Ns8Cn7IaB298hs1OLnZNcWtPPH8MWWLqVbMMDoyuzssiT
	YNFbO3Wt1O+Ygt7XC8wTS3pWdI1wgUr8bQbVJNHNCjzOzi4ovzGXkYe8ZybTul/K
X-Gm-Gg: AR+sD10iFxMu/j0ob8RgkgCVhiHCORJekVn3ICpFv69m+GhA8m4lph8LKl02LkskVgO
	JFtgeM9jbZkNMN1UuOSvb87uaDaptmRdXtvkvIIa5QNfBuzhdUyU8HzNiKn4cfDhmScQK84TdaX
	RuRKdtfF5vdoExXb7QCY+fdkPMP2PstSYASTmyHgydK0W6gZl+YstFtxi4WtF+jty3CHCdj/GhX
	XCQecWu1nq87vCZmCum/MXXwXbd5Q6oXH59G3lG9z1Myud5j7SW/V6pWlN5/R/3YQJEs5BGU1Aa
	TI3xxW4nR0Lie1v1hNxquEIYxj/Sn4u9KR2RJhleNbDMH28+Mo9yzovwbIydMxNynqyc2hniQBX
	sMeduWJzlkmZreeWRpPsfmLUTceBJLhZ9fkfy0iNl17iOeOMO+Xoc5jFCAbtTpSXeCAVHjWaYZN
	APiswuaU07260thQsg/0Xxm/KMFFxbriA0/gThnWgp7hS3OKXEIJq81Cx+iJIVsm3h2WBv2yyCR
	dXIicNUKhayVf5LpLBdFUx4
X-Received: by 2002:a17:90b:4b04:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-3966d5f900dmr31667447a91.8.1787844155377;
        Thu, 27 Aug 2026 08:22:35 -0700 (PDT)
Received: from archlinux ([2409:40d5:415:fb30:8fb3:a7e9:62b3:e2c9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a9035ff1sm16449505c88.11.2026.08.27.08.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:22:34 -0700 (PDT)
From: Suryansh Singh <technosfan14@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Suryansh Singh <technosfan14@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add OMEN board 8D40 thermal profile support
Date: Thu, 27 Aug 2026 20:52:26 +0530
Message-ID: <20260827152226.35186-1-technosfan14@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN Slim 16t-an000 (board ID: 8D40) uses the existing
OMEN v1 WMI interface but does not use the standard EC thermal
profile parameters.

Furthermore, it is the closest sibling of board 8D41 and 8D42,
which are already included in the table with
omen_v1_no_ec_board_params.

Add the DMI board name to hp_wmi_feature_boards[] and map it to
omen_v1_no_ec_board_params.

This enables the existing board-specific handling for 8D40,
including platform profile and fan control support.

Link: https://github.com/CachyOS/kernel-patches/issues/157

(Tested-by tag not included due to invalid email address.)

Signed-off-by: Suryansh Singh <technosfan14@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 6ecc033e5af3..fba6d202672a 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -323,6 +323,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D40") },
+		.driver_data = (void *)&omen_v1_no_ec_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
-- 
2.55.0


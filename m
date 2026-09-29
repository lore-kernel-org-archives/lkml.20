Received: from mail-wm2-f6.google.com (mail-wm2-f6.google.com [74.125.225.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41226527582
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687258; cv=none; b=C9ND3OKPmNsqD+tpReN5SRWSoviG18pNvoqwBubQNQJGDjQExLnf44OWf8ji5DAUJXHZ5It6IOt5j2iYv57aOElNegpmNyz7eDRi6li0A3DUMtyej3azAWJIFzs6Lk5jKY9TZju3OCadsUxsARTCKHWV2/d1KnSX9zJf/yp5Y3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687258; c=relaxed/simple;
	bh=OdfK6zPQifeqrDI7Dk172xxCzy7BT3/xi+HCCHXocTw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aWYTB5sFGmqQuEczuPhYrgX5VazFK/57cx+9kjU3f7Ldyku+qVqM/geuUFXgamu6F9QAnVaAeAL5CH5m9yOJ1saPEsr0PQk9/fpHBSD4YAvQIBveZHsFFAi6zkgugUIMneqI1BPGnS1OsoSG3nuGLuGWeQVAUtI1wi67LyWaD1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPnOzTR5; arc=none smtp.client-ip=74.125.225.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPnOzTR5"
Received: by mail-wm2-f6.google.com with SMTP id 5b1f17b1804b1-49b0dd21eb8so9655725e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790687254; x=1791292054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b6HCpdBVY9gbUFJh3MVkCjOH6d5f1ORSf0MCQzzTdUQ=;
        b=cPnOzTR5/JJDz0Muz10bt4wMjtxcEID+tMllGEuHCRlB98KaF1q+vCwR1eLJMe+DZA
         mtaB/2jARZc+qnGjQtt0ZtY8UgZoo14OgHqzh4ymsvc1na5X7dDXfvNj951eFnhuCoUv
         J6K+jflJRkrct0FM0nR5vLg5yxjItj25yjYXAshpcSVHswyah1s969t7JtYQ48zzmqPs
         bOl4zvuJBl/o0357nZvPwS1EYT11vrqt3yvjBhnVGeDPftI8+W+k/l1sf7hgSSborBRr
         VWcBfLhWkjyT8pR1I4bokrKg0FaVoYPrDywxu+iSJNmKq4BOvcweBjcz4z5OXd32ue+A
         Z5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687254; x=1791292054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b6HCpdBVY9gbUFJh3MVkCjOH6d5f1ORSf0MCQzzTdUQ=;
        b=mbg7kULCa0hZVowrsswjLtK+shFa0UTYz18zvckrcOXJ81ZLm+68/YGCZf4LR+Fnlw
         aHwRuFn9ii+JhOV6lWLFew9Zj5dzvmk8mV/YNg628n+160XbQ13jZsC7DrIZh95G097z
         rH2SEsdCiCDwCq+h6wa5qeyQxEg8ER7Th/9OdSLU0Cc+vgV6M7KiZQtButfZz27Jqacb
         ehmEDWgzjThvLeLz5gFo45nZ9xIEI9QPhS70vmSggdBea4zwTu2GZYiJWSbfNGI3h0VI
         XaDH1X6xvwDqhPk9kXqr5cJ7SmhVrDIiavTKRb1GjVEvX9Ueh/gaAVOTJGdlNEprRub0
         zjCQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbuZJtglgQ3seEdn7y6uOtj6njbUOvgedzA7EHRumnqekvb0hoDa1k/cd/DN8dtRkDiCL+qibtOqmN0D8=@vger.kernel.org
X-Gm-Message-State: AFuF++nCRIhOsf9XUrssBzul6b7RmCVclCFdJR1S9boWaWnkA7f4l5ub
	kJS3unSwH/Jg4K6b7iMav+xf+qcGumFOdINlgEpwsIQyk9eCNe+jxbES
X-Gm-Gg: AYBFou0oggrUgn6N7FxjuEfSoSvpdqmBp9jk+OfeN2/gwWi2D+MVbIsLCOxm5CZx6Jo
	0fKqF2KRSTrkQugG/QhZ8iJgLSRj23DsblGsiMTjpRIMikJASzc3h8kIL/hH9om4k/nJnEjpvDs
	CGwmGPBekmw+Sd4bOJeuGEe59rz0cXd2Y+0wova39AfgNbUQL9SBNhtvN4rQmhzcqjEJvp4zwyE
	OFIfHAYrWHXp0+EVDgvR4tEiOSNmJ0qjlK3vCCBKlo6BFOkBqaD04oAOBQlGghbWhNbWOnoRpAy
	+BzbtpMpwmYL4fHVMsgtexhRLEhLk4bjok0fmicgqmOi3dcXfCKdIxaHcRvTNGORW/A7oZUHlnf
	z4CcxErJg0TZ9sreYOMJx7ZTSrV88zbZ4NngG2R4aBE/87QHuXHH5Ta0m20rgvfGgIdbr1c18SJ
	U33VqQRoX72FElWR+VEbMOaIuPtj+nPZl/vpDkqns655mg+meFuH6S+g4I5A==
X-Received: by 2002:a05:600c:a15:b0:49e:7c7e:274c with SMTP id 5b1f17b1804b1-49ff06bdedamr225747385e9.14.1790687253920;
        Tue, 29 Sep 2026 06:07:33 -0700 (PDT)
Received: from fedora41 ([2a01:e0a:1058:7c30:e315:b955:cb8b:b86b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013d2d048sm1584475e9.3.2026.09.29.06.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:07:33 -0700 (PDT)
From: Timo Joannin <timo.joannin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Timo Joannin <timo.joannin@gmail.com>
Subject: [PATCH] staging: rtl8723bs : remove dead commented-out 8192e code
Date: Tue, 29 Sep 2026 15:07:16 +0200
Message-ID: <20260929130716.61119-1-timo.joannin@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs_hal_init.c file contains a commented-out
call to rtw_write(8) referencing REG_DWBCN1_CTRL_8192E.

A grep of the driver in the rtl8723bs codebase shows that
REG_DWBCN1_CTRL_8192E isn't defined anywhere else,
meaning it could never be uncommented without breaking the build.
Remove it to clean up the driver.

Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 6a4a13544ca1..748567059af8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1903,7 +1903,6 @@ static void hw_var_set_opmode(struct adapter *padapter, u8 variable, u8 *val)
 			rtw_write8(padapter, REG_BCN_CTRL, (DIS_TSF_UDT|EN_BCN_FUNCTION|EN_TXBCN_RPT|DIS_BCNQ_SUB));
 
 			/* SW_BCN_SEL - Port0 */
-			/* rtw_write8(Adapter, REG_DWBCN1_CTRL_8192E+2, rtw_read8(Adapter, REG_DWBCN1_CTRL_8192E+2) & ~BIT4); */
 			rtw_hal_set_hwreg(padapter, HW_VAR_DL_BCN_SEL, NULL);
 
 			/*  select BCN on port 0 */
-- 
2.55.0


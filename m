Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B863876A4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 12:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790427133; cv=none; b=rli5AISlRNxzHSREd6Bp9XKI49YKvICAhHTXIgip9hnzzSOCRTnlWvhiR5HXerKKqOosP+ECvD4FfD4xeZJHVCfcE3/dpIvKRzFsLDcp6hKWi25WwkSfqkBIVYMYDVZ0HJ2D4v1TLkqSaAkKrSBPnWOk6ZaCunMsSH5lWBOursY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790427133; c=relaxed/simple;
	bh=eTZ5DuYzgMC3w2K2nFxa/0/HtaOZqMC32yW/8AXoJMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bx6DXgGuOlrV4bS66BfjGkEGw+xvN+lLIsESAnvfsny+ud5mbI1JpcM0AioqeP/3MNAKwTiuZGoxVcKapTE0WeSgsAt1WdwCzu5nwdPj2yVOj5CgMd8ovEm2lOyQ0d4JYJVEZ2XLU+O9huoH39ahHbi/3WDngfJCjdqMInmWUZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wc19Rcyr; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wc19Rcyr"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a652e2149aso11585861fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790427128; x=1791031928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tv2uFM2roW3vT6//4Rn+XK2lNgMX3NDBuOtw2y4SaN4=;
        b=Wc19RcyrmxoOmI5WjCO03ET8XndOAw6azmvce6s+xkCnSkhiIC6qdVRTrzx4G+utm5
         58R/9XL2mdjPaTilYqO5RsmfjXBqSsJETMG/pwFnCR4+G434XTh5bfsA93eCTnqZMSlc
         BjlFmcO5DJkhbuKz0FmZlu5RuxXjH47DrXPfNzZHhyYUrTW/Qa4ODb3kmziQMqlLyB6W
         8F2gEYbgz7HspwOfqZCgyunYY5UQIQ/BvX66MbLaANPw6KmAflNKK6EbtiFr1O5msqO4
         ox7iDvSBAAuMlie5ahPL7lb84XGXXgGv31qBjzEp/vbXfRHE/8xYFqHNOXqWYi8WZYoE
         kHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790427128; x=1791031928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tv2uFM2roW3vT6//4Rn+XK2lNgMX3NDBuOtw2y4SaN4=;
        b=QxxwaXvSvp7Ex50DC3vnQGvFMeL7oi31fp8DJrzgDnIcMOgJjl02YlQtV4seM+G0cP
         q4kLGx8WJbzgvys6p3KmhhKbnDcPxNdJpWcgkMSfiJatXoK9dlF5qeUH0oU3no/EiUMa
         +FBO5rpKso5mn9cGXYlmIRaDpuzGDeFNfIRUPioNYY1jCUf2YMOZD5IjK8q+kH2JT3lW
         81fwNj0pyf1DtxZhsZLGLUU5xSzYzJiSft5JS2PbJ/eIrlKusK5BNYdM+gyIyPEy26sV
         3EA5IkMIZqBaO6IdeDdCW2YMBna2o0seoRNU6bCkNZMSNt1EZiG3dIZpFWnsOqdAu4IK
         DXZw==
X-Forwarded-Encrypted: i=1; AKwUvBw37zIUTPnCmWjRxNXlt1BfKf6HgG9XtIVGXAaz3PvgERNnNjBqQISmERv3uMR/mrZ0J3beJrXcpCsLvCw=@vger.kernel.org
X-Gm-Message-State: AFuF++mZLYcEAjibBST0NWZtsywPszxVa74x9RgbbkDRJ46QcihnN2Tu
	tM0o8J2PeBcrsim7FrA8z9gZcs3HAmRn+9sq5T4Hej7Q9T+i/AWxCnWKFQRHnh9vCyJgcw==
X-Gm-Gg: AYBFou3GRLPiOovSk/0aBTOMCWYHWwNB47pDj1jYi1oSg+4aLTCkOXiaiS8rFxITTVU
	wizzE82nRq/smpePlD4ulz1pnVDO/T3+fgjwPQ8othQ6oiwUOxYsEPh1+y2cJWN9rXZo5EEq5VV
	UBWKOIyKbx2BrwtsRVhFhFyxahULIpjte7ZRjW9MQKot5GAsVwLGPFSdduHCBYz57IfZRmocaqe
	jnR3DIIwg8sFARa4yJQ0vtQTaYCkvpXNLUl2xy/yJNjjb2AcAd8hpGkeoJqXcb/OY61x227nGst
	fRPEuGDGLM2mAwA38ixGdckgUtEYR8bycXEgYDqXrTK/mMrY9BSNOAr+f1QP/NvrMqPTMk83uf1
	+SxYKsIp168ZpvyzFWDHRKQ/i0QtGkBuMHVjY56JV+3KDgOm0mcaou3E/xP2IfYUzR4UOMf53VB
	tKIz01ZuiDBNkhBbTnwhw1a7BpoyYXJAxj7L5UALCSLqsAWdoSH+mx2BzhIu+8iShkWGwcgVZLT
	S4yD5S6YwoinIEjKP5H/i4mrIH5I0yktuHX5QvkJo4m6NoogQ==
X-Received: by 2002:a05:651c:2212:b0:3a6:6282:563e with SMTP id 38308e7fff4ca-3a662825decmr192391fa.4.1790427127350;
        Sat, 26 Sep 2026 05:52:07 -0700 (PDT)
Received: from Hedgehog.. (broadband-188-32-185-163.ip.moscow.rt.ru. [188.32.185.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a64b436408sm13731261fa.3.2026.09.26.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 05:52:06 -0700 (PDT)
From: Artem Shelenko <artem.shelenko@gmail.com>
X-Google-Original-From: Artem Shelenko <Artem.Shelenko@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: use unsigned int in HAL interface
Date: Sat, 26 Sep 2026 15:51:50 +0300
Message-ID: <20260926125150.161466-1-Artem.Shelenko@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rtl8723bs TODO asks to convert remaining unusual variable types.

Replace uses of the uint typedef with unsigned int in rtw_hal_init()
and rtw_hal_deinit(), including their local status variables and
declarations. uint is a typedef for unsigned int, so this does not
change behavior.

Assisted-by: LLM
Signed-off-by: Artem Shelenko <Artem.Shelenko@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 8 ++++----
 drivers/staging/rtl8723bs/include/hal_intf.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1..67b21b777 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -27,9 +27,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+unsigned int rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	unsigned int status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -54,9 +54,9 @@ uint rtw_hal_init(struct adapter *padapter)
 	return status;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+unsigned int rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	unsigned int status = _SUCCESS;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b6311652..b43a9c86a 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+unsigned int rtw_hal_init(struct adapter *padapter);
+unsigned int rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);

base-commit: 8444548bd905f22093729065408284a6b46f7eee
-- 
2.43.0


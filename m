Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3277940D578
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276150; cv=none; b=o8yEh5oJUidjvOZt5sT/amHLjUkbQrcPgtvqsgkHGqUkJVr2IekqWkruHVkQntVGQ7hmHXaBRJv3nkKygQ8L1GXeFCvQ+pjbyAjBOP7MwjXmx1QV4ctwHDh+r4xb+nWUsAsQD2w4CFVPbX+NoiqCdgiNmReV67e5FeuS/M/n/ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276150; c=relaxed/simple;
	bh=45hdTDUeNS+Ujbv5tKPSyFxUokDuaQ2QCyO7h77sfQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH+Np6Sp+cA8FHr3dln8ouEA8+iOTma154wH9QORbMT2hF1AaYU8kucqOS74uTw9fXymNU4LH3LKvHP3YjEK97yyXkNZAW+ONTZIb9nxb3dzecjpu652CmHzzCO03kOLjsBqLJEWhBbbOzdZfivelgyA7KfHyplq+ZP4xlPsVHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZADZM+V; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZADZM+V"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso12611825e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788276147; x=1788880947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n6EVCXJ1tmjiqwFVXXEhhtOumXmmMcs1NKnV3QIYUhM=;
        b=NZADZM+VCK18cTf7bxXK7pxSQ5WxSJKNyZUd/6qFU8NG3GY6u4J9bCXbj+3io3zNM7
         Th6hxtF9QpDxfv4Fwm2q8ru5ML5dlBY/eY4+soUR0VOToYwRkz4CFdqBObewbJH9YmNi
         FTqWjQKeuMDKdOv2fEUY+ZLpxJyUyiiMlNDCFi6WBkFsFQaAkj6ubuoXa6byliWvM+cL
         KAoZWAiRnwRLJFQTXB7MAOc0Afhqa0MlRJU5Yih33eHTagun4YE/ZBzYJA4IyqiJ6Eqf
         CsOT3whOhS2BKrWr05ug/WNzSBA1WGNth2iYPwsEozT6YBvrAuc405EmVAsWrXxRz+Gd
         +8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276147; x=1788880947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n6EVCXJ1tmjiqwFVXXEhhtOumXmmMcs1NKnV3QIYUhM=;
        b=HNRdx5ww4Zq0+xckGmVWY8g84RdnGchU361UiAW0osL0nhLhM9dpVhLs0hJI/GZEHA
         UcPe6xi9zn41U9mEPIOAR2BOhRPxIb3ZhhfvMnVSyVImekiVNCHtGtKmpHsVpAueAAfX
         KTqBjmHX0gJnt0HHPOTmFRMr8e4GkxeD/hTuMG1hEM7ise0THXIEPgR3pwH6CkSXGy9j
         lI46u9UCEKM1v0f/mYO2+ouHPRBRAoVHaKwZcoh+xPzB+jPBzhS29hjrPmI1Cx3JjUDO
         CBfVJWtU0AX3IfLG5/qs+GGd4NAkiYAOexk9EOck+oTN/A/GdUnqo5mewTRmr+DtB7Tr
         0Saw==
X-Forwarded-Encrypted: i=1; AHgh+RpKEoo9413vMgzU/RjzIvvQ+zSJPV+hQlmHi804JArg5S95oWQ5lg20/sYtjvYJ2eyOKSILkUzkHiG/Q48=@vger.kernel.org
X-Gm-Message-State: AFuF++lbn8dWlhZpMDxayNJcDqh6AbE7Ef+XcEw+xCS0HIA51GJtCqAK
	Lq4Tmz5uvlF2Ko7iq35x33KEruQVYfBMphRdbjHQHFAMm6IdJzLft62SKU8w7T3F
X-Gm-Gg: AR+sD11R0hY3pFGtQtD1qVS9/TAl7txIECRfaHVgAZOfkjaw2l92S+7CEVph7va71Dx
	bZbQm9155oPvHqEEl3TNcA6fQwrY7aaFC1FPOr8m10wMTqPnNm/1HpOMhrRzU1qobYRdCGq6kQG
	H6UVfojQkpgOXCHhNrDoLg2G9BDo0ZsgiuWkNL5oXq+lXBj3ex4dqpeI/PytE+LvX6fbK+b+22s
	833t/Hi5x+KuTwn/XHkegUM+iBQlaPc+aiIUL38GHSXKfo3ZQ9611d4yZDMtWk5ns+Z11K7CoQb
	86OKu98ZztDA0KWD6fNq4MEyInzU3WorOmQAM45GuzKhJ8Nx8pUcmUVWHUl60j3CVKvQ0Yrfa3u
	l97Q1csb0vC0ye08J85rXm0TCMIuCDT0vmUzJBP4VqDa7tckHpk0qc+1x1WB2U5/unD0NuBRc1u
	M/0RWLO4jT9HkNlWwGQT5FSgFt4R7NRRtksxkNZEvKZk3vBhgGtMWuVgePtGcekaLYHw+QcbKee
	EwQoJ/C+jBBjrrh
X-Received: by 2002:a05:600c:4e90:b0:49c:ced9:ab7f with SMTP id 5b1f17b1804b1-49cdd60df3cmr88005315e9.8.1788276147270;
        Tue, 01 Sep 2026 08:22:27 -0700 (PDT)
Received: from localhost.localdomain ([195.149.108.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce171c3sm77910305e9.8.2026.09.01.08.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:22:26 -0700 (PDT)
From: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove unused ifname module parameter
Date: Tue,  1 Sep 2026 18:21:44 +0300
Message-ID: <20260901152144.5978-1-nsvatoslav515@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the ifname module parameter and the corresponding ifname field in
struct registry_priv. Hardcode the default "wlan%d" interface name format
string directly in rtw_drv_register_netdev().

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
---
 drivers/staging/rtl8723bs/include/drv_types.h | 2 --
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 9 +--------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..5837c51ac2f5 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -151,8 +151,6 @@ struct registry_priv {
 
 	u8 enable80211d;
 
-	u8 ifname[16];
-
 	u8 notch_filter;
 
 	/* define for tx power adjust */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index dd0c5fc813c8..ade4576ea033 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -109,10 +109,6 @@ static int rtw_80211d;
 static int rtw_qos_opt_enable;/* 0: disable, 1:enable */
 module_param(rtw_qos_opt_enable, int, 0644);
 
-static char *ifname = "wlan%d";
-module_param(ifname, charp, 0644);
-MODULE_PARM_DESC(ifname, "The default name to allocate for first interface");
-
 char *rtw_initmac;  /*  temp mac address if users want to use instead of the mac address in Efuse */
 
 module_param(rtw_initmac, charp, 0644);
@@ -256,8 +252,6 @@ static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
 
 	registry_par->enable80211d = (u8)rtw_80211d;
 
-	strscpy(registry_par->ifname, ifname, sizeof(registry_par->ifname));
-
 	registry_par->notch_filter = (u8)rtw_notch_filter;
 
 	registry_par->reg_enable_tx_power_limit = (u8)rtw_tx_pwr_lmt_enable;
@@ -784,9 +778,8 @@ int rtw_drv_register_netdev(struct adapter *if1)
 {
 	struct dvobj_priv *dvobj = if1->dvobj;
 	struct adapter *padapter = dvobj->padapters;
-	char *name = if1->registrypriv.ifname;
 
-	return _rtw_drv_register_netdev(padapter, name);
+	return _rtw_drv_register_netdev(padapter, "wlan%d");
 }
 
 static int _netdev_open(struct net_device *pnetdev)
-- 
2.47.3


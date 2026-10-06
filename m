Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C733A6F17
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 20:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791317297; cv=none; b=QedLyBSaJHONEuJrjxto+APYIuVlo+nxilbExOBWUbDBOFSNd/4sYLQKZu1lSpy6skA9GmjNpfPLJqFp665CNmkrRP/oVuLHTqq/CboVAotzhv0rF+cSuBVeqQSACadDUlqurt5i96HAx82Wwk69LBxAeUcAtExni+GMfy5hDPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791317297; c=relaxed/simple;
	bh=7i4MfBif1YBMwW4P4YcIx42H2opYlr9PUCuKE67zzF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oj5bu7JWeWh0oaYyDTyO5PTmegEfIhdOnfnfEFrjxDkPuYjXR2nZPwC993gs2nLn26fbn9f2HrqSx3dGR09g+m44a/JIv+BRY0yMOjvvV2rffXR7S/m20TDdDscVVnWYmm+xJxOV7Gisfckn//RQ/NIFdBl/2vFapJTGhpoKVzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OISjucD0; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OISjucD0"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16079d54c17so832511c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791317295; x=1791922095; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nRFnytrAolaXx0R4qG3nHnA0DMDOLQyqllwW7qfiF5s=;
        b=OISjucD09bZyH8SU0Iyqa9zNXxKpyZRtTnhC3+L+D/PgMtTGO7nTXTl8pXj4GcLPYy
         55RAvE1n0of+fax7mM6OwC3Fqs5m2VjxZ5rpAGgesHYK7IFKQ3jG/di/2YZozcVoeiWl
         PZAppcEG/W1WBR7YZSUx35kSO7FgymLA8XJalEDpcm83ZPwKd5jrmSIqvRYJgPA1niRI
         EUuECFgljQ1cYZWKX5jlsZZdAkOyC8xEP5IODHHdzyFlOhTyJopFLnZ2hZROhkHNdGDK
         c4hPKiPPmkeaD7W4THDzjTriLMDLZZbvWp7PXBfuYylx29U3UFdP0Efs3AtOuf16mF5B
         4i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791317295; x=1791922095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nRFnytrAolaXx0R4qG3nHnA0DMDOLQyqllwW7qfiF5s=;
        b=HAP+YvfTKl5yYfLZbPskYvsEHegS3skJDJBYH29BGUgKx4yED2CnyMHH8gtya5Nkx1
         wTbproocGAnnSb+Q62fFXtiUCFy69uRUr5zhFI2sT3B9FimKCaslyFjpZPRUkrVfFGYX
         9vWTDlym1R1BhuO13OREsF8VQc0uu+VhPGLYgOkj67SPhtIOMWS5oEXiQc9mf0wl0lOz
         ZkFDalqwd2pUfSLW9Hap3yD527HaMWXHnNcw3+ORrP6GdSRTJNs6IV+B3IpRw5USG91t
         6qawJsFJtjtjRcAncQBXxgipBtOeT7XeEiKF+pKtB1sUG9sJUHRbQtQy3QzThPenwy+N
         JONQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfQBeywedpVYbo5rYXpDqfp8yGgesuY1EMNtvf9/vmIDNJCLoJUDXHh0zoPBONyQu4iqfd6/AHfU807to=@vger.kernel.org
X-Gm-Message-State: AFuF++nDWTDz5LglaILJTJpk8rgnh7xgjeZteszCjWGIVlfoC2bBUqgJ
	JSIJT6I37y8fT/ESqRa/CMV89aU1rbv2JSrYrhR14RS1J6Xchfrr2l1THEkynw==
X-Gm-Gg: AYBFou3sv3T+c09euymf1RkAjXysE59WZM7inqO+jCuqtaNxSvCg7psinlHf2pJPcu4
	xTtcPUycSSimB1uqwvvCezzTu3H/6Nf7uah+hwF+ZVGHSTCsiv2IkvzS/zFyoyfB45DUYtjWs6R
	UuosIZ1zJ4tXE3WBo+U20eGil0hV8H9QJ/i0KCOK6QSWAgFVD4NwGhiaaM3VaNu6wDAtarFDbM/
	FZlyw35gcd00TO0dpJYrjYZf5c2tCg1X7BT1iG+h8K5WCoBKIhiQodBglIMZr6aGxEyfx3YC8GU
	ogRrZHcYM17WIFB/K8xIvzeUrC2NJdOmGYpWe1r36IdL/6/DxBDNgjEPGGhkRvkMBeIbF5C/0Jx
	dYC/uw9o3Q4oc0o6U4IjLpYW/FS7Br3sXukm/nHN2mG2T5ubA5hblHwYiuZ3H4CnVMvA0olmyaM
	IHAK8mj14NwQQPL7gGQ5nEwohOFpXGMOVjNWFIBktPA0qDACSIrJ9D1jilZzKxP6IVC4+MmYt3B
	g==
X-Received: by 2002:a05:701b:4544:20b0:156:1d8:7026 with SMTP id a92af1059eb24-15ece6d34c6mr2813983c88.46.1791317294962;
        Tue, 06 Oct 2026 13:08:14 -0700 (PDT)
Received: from host ([103.103.208.69])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-161680e191esm804946c88.11.2026.10.06.13.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:08:14 -0700 (PDT)
From: Pranav Desai <contact.pranavdesai@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranav Desai <contact.pranavdesai@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: replace uint with u32 in hal_intf.[ch]
Date: Wed,  7 Oct 2026 01:37:50 +0530
Message-ID: <20261006200751.819332-2-contact.pranavdesai@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
References: <20261006200751.819332-1-contact.pranavdesai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The non-standard 'uint' type was used for the return values of
rtw_hal_init() and rtw_hal_deinit(), as well as their internal
'status' variables.

Since the underlying hardware-specific functions
(rtl8723bs_hal_init() and rtl8723bs_hal_deinit()) explicitly
return u32, replace these 'uint' occurrences with 'u32' to match
the underlying types and conform to the kernel coding style.

Signed-off-by: Pranav Desai <contact.pranavdesai@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 8 ++++----
 drivers/staging/rtl8723bs/include/hal_intf.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 1443875d1369..1290631a2158 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -27,9 +27,9 @@ static void rtw_hal_init_opmode(struct adapter *padapter)
 	rtw_setopmode_cmd(padapter, networkType, false);
 }
 
-uint rtw_hal_init(struct adapter *padapter)
+u32 rtw_hal_init(struct adapter *padapter)
 {
-	uint status;
+	u32 status;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_init(padapter);
@@ -54,9 +54,9 @@ uint rtw_hal_init(struct adapter *padapter)
 	return status;
 }
 
-uint rtw_hal_deinit(struct adapter *padapter)
+u32 rtw_hal_deinit(struct adapter *padapter)
 {
-	uint status = _SUCCESS;
+	u32 status = _SUCCESS;
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 
 	status = rtl8723bs_hal_deinit(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 7b63116525ca..ff2a9982a102 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -175,8 +175,8 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 #define	RX_PNOWakeUp			0x55
 #define	AP_WakeUp			0x66
 
-uint rtw_hal_init(struct adapter *padapter);
-uint rtw_hal_deinit(struct adapter *padapter);
+u32 rtw_hal_init(struct adapter *padapter);
+u32 rtw_hal_deinit(struct adapter *padapter);
 void rtw_hal_stop(struct adapter *padapter);
 void rtw_hal_set_hwreg(struct adapter *padapter, u8 variable, u8 *val);
 void rtw_hal_get_hwreg(struct adapter *padapter, u8 variable, u8 *val);
-- 
2.55.0


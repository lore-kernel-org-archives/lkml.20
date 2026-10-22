Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792671804;
	b=cFpWRdY7Lc9yw+QcI1a4AOJOXgnW4f3xoJAzbVSNohsosx3xFLVCJiaX0t86+B5M5Vi/
	 0uhS0z/JeW+f4g2DJushZqILAzMM22WGM0Sr42QJ2zkbxEgH+Bqj3Um/f5YD1a0wBRyAy
	 uInSdy+BQ8p0nOM9Q1m7VfxBtuqbkc6u09AidQLRTcpczE4gZKeuBQfUGVRxqPWsgo4LT
	 IMWG7zUq74xuf+LYmvnsSdBddbObtl+x4OjM6GCqlUKkObSjkYHTptMIuJkGNKzFwzBXr
	 3XAE8I2AVY2hlmEjnSQJxFOvraFMg2XDjr3yFTtEavbwgvXDcLunzUQKb9Is8vLY/PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792671804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fJgprVGDWF0poiYwsa71a9OD44gaDa4G8wp7yZTVF1U=;
	b=NOE4LCQ/haBKsqdPW2XCjcMGc3ELBLLLxvWNjBklJnxrpaSUZPG0haDRGi1uBUeAjxDs
	 oLuKQK89/8Xc6pAJbKFW8PhMj6hS+46bYOl2o2dwwSHlFIJ0IhrqrqJQPafU8mWnMzdpI
	 a2qvaB4bSgvYogGGfQYoFx2kOx9wr6/mh9vblGFzigyzuJysK6yVKyLHSNEtt3/Dcjz5E
	 5U6cm7EJosJyniATuoXik8S49Kn/p99DhRcoz/qjP+/ZCEklyT9WYPQQiUIsVGefXvi1L
	 rCA4++Fb029b+8XCX3pmIeTah6iZai0QhzHh5EvM84/Dp6Ahipvv7duXyI1VSUFMCdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qwv2E6w9;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0A7606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:23:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B0A7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qwv2E6w9
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso1183593f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 05:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792671803; x=1793276603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fJgprVGDWF0poiYwsa71a9OD44gaDa4G8wp7yZTVF1U=;
        b=qwv2E6w9gwXq8r5pvN28Du7V26A5oxnK3a8ipa/HyWC/Lnj/r159/CJ8CnNchC16Lb
         R9+Fnyz507vGfIOyu0Kj0FH70pNZN+sP4uDVQx6ySUwSHYEy+NJF0mVZ0ehd9ZPewhvh
         Sw545277xZilOMxWGzuY29sw5vZjJkknEt5xBm2l206lVslOvN3X9SJM2Q3uT/J2pvQR
         +0arqQiIEl1ZbNJkfiyt7jNreidjyVQAFDAUP0chHMD7peX5yavVZWgITKJOvcTjoJC1
         GLZkzSkvv/pYrdtqHBYbPHK+bh7BJ5whB0Ij8w7ykm8Phs13Njh6WJwZOXNj2KsoGEWL
         66ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792671803; x=1793276603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fJgprVGDWF0poiYwsa71a9OD44gaDa4G8wp7yZTVF1U=;
        b=udqxza3vskn3qZ+D/ZsTBffY/WYa89gk2xFzSqvwyR/e1xOAbDZIf+XS4Hdje3/5eV
         ZVf1t7FqXrEs14ljXr54YLGKhB5hMfE5LKGiGT2RBMc8gl0BKBC7e2X+Xc5uBfq1ZvsP
         uUV4ArnWD2jGzHH/7pfHJjmrcMadzrBjuEa11F7Uogq6I6SPY+kbJm6VwwtDluqvGKMR
         oKep5evQbWRwYOjOKv3i1vfW/VqVGbiI4SSNQIQAcQaa+NV0mFSgDi03ezcAl+3Se9xx
         4mOTZr6VXlg2g2WBNu1J8zcFmiSSxeB/XnWNpuYYe8Zv6nE7PCcF6REChWrePSPkLFv4
         ovkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkCeguWBa2koL55NHyi2DQsofR50pL0TV5PIJ382k8L8lMges8YfWuvWThrpyBJdyvbJW1tHoKBR9Jzss=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3bKzHClqtBF1/ozfje21umBnNK3k7v3TA+f/p5FnliSajm8tO
	OWpo5ca1VtbidPHJvsymF8l3P+UmEpIsaRGkdzpGF2ilA53cvsuzJq64
X-Gm-Gg: AYBFou3xIIQNgV8WEkV5rKue3fsNbS4OgFSJlZzrjD5ZzHd3NEvQXzMUGaD3gAMgW35
	nfLRyqVKDjQ3xkQd2NkXuPxRqWOQzSoQwPtNt0mrhdj+KpQllnPWWfIqdOx1ytaoItjc6bKmB/a
	zLaL3T9SEyieshaYsEyEEgCPNArqtHKfFfHs7H3IO6ITtCV58kaos2+I0vJvXErHRiyRDIbQFGg
	COsdg4CLNQLFq/j2k9/W7uxTMA1oDRjgPZEjD+5cTq/Ad4zpDOsM8u/a3SLIkwI+UcasvGR/zU+
	t9md4j+LPkbF3J6ABY675ZNO9j8Upd96GcbxxJS72qNlW1ijb622bsRbWUuAtoRSveSgmBYJk8N
	83Yvumw/YUSga8KROGwYiyFrVLddMSrQejXP2lJq+46reHsRq/HUwoc3+vOdJovpXPQe8cyCzzH
	lRMaRI/1/vZ05KBtcjhAq54wjAAs+D+asJ02L1HgVfPM/3c8Y9TgQLdt/RfkSrRPxnH0a0neene
	J19t//+WEpn2DAsUa4ExHedFeV7KeKpr13GjluU2Ku9EWI2+cbSNDgUVyRL
X-Received: by 2002:a5d:6a4d:0:b0:487:1256:ab80 with SMTP id ffacd0b85a97d-48e264f2c50mr8284125f8f.57.1792671802341;
        Thu, 22 Oct 2026 05:23:22 -0700 (PDT)
Received: from localhost ([147.161.188.190])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1casm9458499f8f.7.2026.10.22.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 05:23:22 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename rtw_setstaKey_cmdrsp_callback()
Date: Thu, 22 Oct 2026 14:22:34 +0200
Message-ID: <20261022122234.443631-1-linus.probert@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames rtw_setstaKey_cmdrsp_callback to rtw_setstakey_cmdrsp_callback
in order to conform to kernel code style.

Found using checkpatch.pl

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c    | 4 ++--
 drivers/staging/rtl8723bs/include/rtw_cmd.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 9fc62cb1ae01..81aef5ffe685 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -34,7 +34,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 	{SET_AUTH_CMD, NULL},
 
 	{SET_KEY_CMD, NULL},	/*20*/
-	{SET_STA_KEY_CMD, &rtw_setstaKey_cmdrsp_callback},
+	{SET_STA_KEY_CMD, &rtw_setstakey_cmdrsp_callback},
 	{SET_ASSOC_STA_CMD, &rtw_setassocsta_cmdrsp_callback},
 	{DEL_ASSOC_STA_CMD, NULL},
 	{SET_STA_PWR_STATE_CMD, NULL},
@@ -1876,7 +1876,7 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 	rtw_free_cmd_obj(pcmd);
 }
 
-void rtw_setstaKey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
+void rtw_setstakey_cmdrsp_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 {
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct set_stakey_rsp *psetstakey_rsp = (struct set_stakey_rsp *)(pcmd->rsp);
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index 75a774f8c4f3..9b801a61b69b 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -593,7 +593,7 @@ void rtw_joinbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
 void rtw_createbss_cmd_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
 void rtw_getbbrfreg_cmdrsp_callback(struct adapter  *padapter, struct cmd_obj *pcmd);
 
-void rtw_setstaKey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
+void rtw_setstakey_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 void rtw_setassocsta_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 void rtw_getrttbl_cmdrsp_callback(struct adapter  *padapter,  struct cmd_obj *pcmd);
 
-- 
2.56.0


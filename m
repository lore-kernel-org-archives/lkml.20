Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27085A0ACF
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 18:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788892491; cv=none; b=K26TRv0DeHll4eyyv0JFSgUQ2yB4tyIZuH8AH5N1H+mFUMSWnhrsiFkziVpM/BgiEYZ3kyVxXkTT92WZA/MPx4WyC/6DLDGwzkxQdjfM8Kx26tSL7PltXERANx7qCYNWZoVBHG7m4zWV78eqVi+z17M1rhpILl1afOxLhHP62DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788892491; c=relaxed/simple;
	bh=wsFGt27t0nLlo86eLGfzZenv3hwvBtq4VBr5Xshw1OA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FG8N4RE+P0c13gbcNcPy3djytfXCQKstH4EINo5hbg3WDMdg4MmCMHoJnqQ/+cx9efcR6UHgfAFQ4iQA1PJCOB8ETNjSHqjgPC786JkYHtWJV2bhHmhFNqMymjaJIv1OV4uzWdHmqVuYycgLL+vaLg9kCX5NAJWeoC37g9BwLgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C41rFOJq; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C41rFOJq"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso53164555e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 11:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788892485; x=1789497285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlZmMSgpcIUohFqmw3B856SSb33iz8H9DWQianW24Z4=;
        b=C41rFOJqDbV7BF9VLf2cdQHZVr/OToCx5+bPPRd8NCHybkvauXN/525fbvUHwePoFm
         5oXPCj1YZlgJmHRbkRu4sKYDmd93tsKSGi72ocqsjWK4JpWbKnpQ3D+iKWSeqf4fJPOe
         5Ayho7bL4Eq1jkJiOoC0DYBfQJ0+S5ICOCEOtJSWvxeEPE+MheCYu19OTFjdRb1GrYfu
         juA3RXyXoNJluXuYSB8gxcl1ia+B5foRmnGRgB0o+tY9UEMnXm5HTmUtuBFel0BwWlvJ
         yt/plPHwv9dzhxnexIUX+aMl3fWAJAjHv3V6zc1ri3vH93Hb/73Eq+XYQkDjLbawe618
         M0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788892485; x=1789497285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlZmMSgpcIUohFqmw3B856SSb33iz8H9DWQianW24Z4=;
        b=Eykz+iBnMOwM8hpPmYCvdtAzjMuT6GaG5n2hc8aQeH2Qwlif251QBLDfax5UAilrO+
         YenXGORM9a2G5kBNTjyVZN8vonMtNNIR7X825uMienFEsP8y+iSNKzJs5spYMIlONDxr
         pohE4PUKXSQAo/yxkI78Y7ySR8P1kj9GthHH/G/YoUOLFzEjpJyJ3MQQb4zFlACeyNgu
         jDBzZA1xFLXELTc+1e3wQ0cT4wxnkHsD8r5T7KRF5leWDXPZ0+ff0+P0aR51BDACYYOF
         eatLPqqtoY6ZYUdnqZJTy6oti4hcPmalx1XtA6KfKIbBdVcIhaobvRNsI7haTS3uUMB3
         gW3w==
X-Gm-Message-State: AFuF++kwn7ZGLCwMHk6PYbvP0bg7cBZX6kbDGmexZF7YWROHRgXSM1Cp
	W4T102iDyvDdpM8E2TlSXvh2aHsJWX1Darn/lpfSK2a8wlLW7Xegilbv
X-Gm-Gg: AYBFou14jMXJaHyNN59J0xe0Ex6cfupTwwJ9R1pUfdFxmVrxl2qOLncMD25qOizdXZ+
	8yShSQ0IcBL58idmhRWiYQzyTekbzriY0Z6ac9fyuj4OhFlk0PebiTLjmVZMymyOivjHimtg7wT
	GPA6o2L0YneCHR+EZY5j8a5kOIhkgmqArbp6YE2pB5h2KU3PjvdiE9RQ4GTUj/gmFO50GNY8PIv
	h6ZqkzYFvNCddkEA+KQLj/yovYIZVEBFa2kDH8H1B4RBbCsHce1QFZXEMMZE5avFpYmI4daWkEA
	SsGfsYA0slczAk4DpELUjkiJv5fB7sqpkSLImMyMjpRcUUdPPHXsMsMrVRcJXIDK8WOUay9wjzZ
	202R1xC7C3wh80kZxfJrrDNRmdu41TVtJqO1oN5aLc76IECgSPnnix9eGTtrSU0D44VimTq4yXv
	TXC+W6BEC7RCoWNb0qmwCDenyri4btyGDQ3UgOnm76RaXPzi/XFG/GWn6+geKzN5xfyrY=
X-Received: by 2002:a05:600c:1c29:b0:49d:15f8:2bdb with SMTP id 5b1f17b1804b1-49d15f82becmr92678295e9.7.1788892484587;
        Tue, 08 Sep 2026 11:34:44 -0700 (PDT)
Received: from predeASUS ([86.124.216.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5f912esm510511745e9.4.2026.09.08.11.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:34:43 -0700 (PDT)
From: AJ39210 <predescuciprian99@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	AJ39210 <predescuciprian99@gmail.com>
Subject: [PATCH 2/4] staging: rtl8723bs: core: clean up rtw_cmd.c coding style
Date: Tue,  8 Sep 2026 21:34:28 +0300
Message-ID: <20260908183430.3256-2-predescuciprian99@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908183430.3256-1-predescuciprian99@gmail.com>
References: <20260908183430.3256-1-predescuciprian99@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: AJ39210 <predescuciprian99@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index ce3dfa1fe..e3404bd55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -391,7 +391,8 @@ int rtw_cmd_thread(void *context)
 	while (1) {
 		if (wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp)) {
 			netdev_dbg(padapter->pnetdev,
-				   FUNC_ADPT_FMT " wait_for_completion_interruptible(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
+				   FUNC_ADPT_FMT " wait_for_completion_interruptible"
+				   "(&pcmdpriv->cmd_queue_comp) return != 0, break\n",
 				   FUNC_ADPT_ARG(padapter));
 			break;
 		}
@@ -482,7 +483,8 @@ int rtw_cmd_thread(void *context)
 				rtw_free_cmd_obj(pcmd);
 			} else {
 				/* todo: !!! fill rsp_buf to pcmd->rsp if (pcmd->rsp!= NULL) */
-				pcmd_callback(pcmd->padapter, pcmd);/* need consider that free cmd_obj in rtw_cmd_callback */
+				/* need consider that free cmd_obj in rtw_cmd_callback */
+				pcmd_callback(pcmd->padapter, pcmd);
 			}
 		} else {
 			rtw_free_cmd_obj(pcmd);
@@ -555,7 +557,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].ssid_length) {
-				memcpy(&survey_para->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
+				memcpy(&survey_para->ssid[i], &ssid[i],
+				       sizeof(struct ndis_802_11_ssid));
 				survey_para->ssid_num++;
 			}
 		}
@@ -567,7 +570,8 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
-				memcpy(&survey_para->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
+				memcpy(&survey_para->ch[i], &ch[i],
+				       sizeof(struct rtw_ieee80211_channel));
 				survey_para->ch_num++;
 			}
 		}
-- 
2.55.0


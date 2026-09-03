Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EE03890EC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 05:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412760; cv=none; b=NzppdYh/TIXAuNosP86svMWBZnPNS2/V+HXTLdKSev1MvDn2UR/iQ56zC2Q0nwxRNDfW000r+qxSwi8hXvEe+plKw8GzsvyDuqc1OgoXvW8lQduA5kQxeDMyGMht4dgJv697Csd1/XM/YJk/2cyqS/47GD0ZlcC0RW1hqZEN+8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412760; c=relaxed/simple;
	bh=fgw7dDrWS9xg2FXbO7pVBYf6+iPn4WqQ5ONzYmDhIJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdLcJ2aEYa2leK+Y+hmOYy+T8e9LsyE17u/YKRqpybfXSr1Cd5f1FaIgxkdHGaWYALJhsK1R4SldbFhkjVagDcZZfDoUD8FDzv6U8kvPkUMpedSvG1wZV7RYwX8keOe8qqhQjsU9917brncv7mDWo5c4nq4lKoH35csOkO1OkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIqZF4DC; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIqZF4DC"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7841b831381so461764137.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 22:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412758; x=1789017558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nam/WqXZfDnfOqNPwp5yTp1tZrC4y3zmMd78/CGgK+4=;
        b=TIqZF4DCbfl6nKvkEFU1arVVuRJJLks2ZWvnt0+Vu2RwEIeepDAiNKp+RQRYbc0nC2
         YAqp0L2h4l6gxlBvXvlyl+kPIy8RqzjWN9sqvWrgkFMfo7FdHmBwg5DE94+cWfhirm3u
         fftaQEqqOFepRqVPOGnjQP8Xfge/TmwPHlosJ9HDc0IVaMVSKCKG9mVucU6+3zmlfcUV
         cWEkoHd7jUHMOgjLaedP6h0tah0Ifl0Cnn2Z95QhPVJn9EO7Sde5TWYi2MjsW/WBY4he
         TN/+gwGbjZ5dnRGmmgjZBVAeeyom80fHHGs868eqyzZSvSLEBmi5IZNkybQEWcBiwKtn
         yt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412758; x=1789017558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nam/WqXZfDnfOqNPwp5yTp1tZrC4y3zmMd78/CGgK+4=;
        b=Lxaa4HfkU2/R5peVTHnKSa6weFeHZdLs+zYsBXgnZuTxbAavLB0/4DUf3VKgzpNsE3
         5vBSxjftCIiCq3rP2m+ZzbhKU+Cy9thl2XXkIrJNaYhzCrZG0/YFnHNaKRgG/z0nrRGP
         nin0Xc/hKVmLsvp2+fUK3pfRisX4k8ffiWVvhIahmwrNoG8JDNzAww3zyTqh5OPtEB1B
         25oEnglpZtgSmjNwAYiwaW0ih3SweDep6yiUl5hcx9/8IdDKG5QTa3ODCI0deYoj5W1c
         wccpARYH4mEJR3J6v2Ljc6ETyrTFXRowkQ1NdPZyafZiVkv/8WW5yG8symzzF6GGEEDJ
         AzBA==
X-Forwarded-Encrypted: i=1; AKwUvBxTWkKrEy/11dZNrZCqYbmMPtFSY38yMPimSf5/+7+nRQ1YAOD8LY4THUDfi9zOfh9sNgJyRnRGf96VGlQ=@vger.kernel.org
X-Gm-Message-State: AFuF++myhY/OMyZRlbV5W/+jZH1oLVTvOnQnu0mp8IB8xm8j7rXEWbwy
	4HQP1RCwq4DG8tdjnDjjEHhpyW+3oJKT9ywPESvkuOvpSF5iFQJbSbmkCNZ33g==
X-Gm-Gg: AYBFou0lKyG2uejWjGtx4l1AT01gk1DcsPZZsreYLZ0XtiyhYaZdflcFXgm0qiS1SGz
	8ns3Cbt44oEn0YBbnN3H5FT7nY603VoWPRD0NrlUaShbMYnLxxNKqqTmZLfmGFXAkV3XhEoB/LG
	ZQG2brf3Q7o0NOB/qJOXCcYTYC+1eeAJh1OfAnu9cStGLsjYk/EVmOzDXdFsdoHpT81RCjUv4fi
	3/P47AX4+1m+qVTmMdwS5nfvMqekszhOEwm1Z5NdfLrpyR+VM7fY4WZKRAG5WL6qVd4EGYjz6vx
	swdjGrj0w995N3qGzfo0n0yj/V6/j+JAnblMqDGCUrcRAS1Ko6MW86h+UTQEwal1BR0EhM0386d
	je1xXeKw/afyWfut0LTTaIyk9ynrJgOKz7nV2XF1TDshEDjDqxBgUfQPKTMRkS0w4ezKjLEKTbU
	NuTKYJmtwRQQhVtY/M6mX1VvnGWICex8VbgxevdD5Uh6RTv69N2bnt8ReKmbclRuDPe/nH+fXzl
	5sQIQ==
X-Received: by 2002:a05:6102:3a06:b0:781:9922:78f8 with SMTP id ada2fe7eead31-78a1f34dd1dmr3768941137.13.1788412757878;
        Wed, 02 Sep 2026 22:19:17 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:17 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 03 Sep 2026 02:18:07 -0300
Subject: [PATCH 1/4] staging: rtl8723bs: remove invariant parameters from
 issue_probereq_ex()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-issue_probereq-v1-1-82f153d157a1@gmail.com>
References: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
In-Reply-To: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=4591;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=fgw7dDrWS9xg2FXbO7pVBYf6+iPn4WqQ5ONzYmDhIJE=;
 b=tNhCCn4n/qmfbOw8/d9EsLYndee3oQ1sqzYNIIpCV3OL72Ns/qw+BpMSe+S4A3tgOz8nlo1em
 AtbWh62sUQ2AQCIMISG9UKJ3BS+zl0GL/qlUZP/KHDSoT1CGjAPPdp8
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The parameters ch, append_wps, try_cnt and wait_ms are 0 in all usages
of issue_probereq_ex(), remove them. With try_cnt always being 0, the
condition (i < try_cnt) is always false, so the do-while statement is
redundant and the msleep() call is unreachable, (wait_ms > 0) is also
always false, and without the do-while and msleep() the conditional
break is also redundant, remove all this dead code.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 33 +++++++-----------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 +-
 2 files changed, 10 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 0c00be09fbf346aeff82be31aae801ae9265a9b0..4bdd2ae24d274cdc4b2c6496f385856c6039c55c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2499,25 +2499,11 @@ inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 	_issue_probereq(padapter, pssid, da, 0, 1, false);
 }
 
-int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps,
-	int try_cnt, int wait_ms)
+int issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
 {
 	int ret;
-	int i = 0;
-
-	do {
-		ret = _issue_probereq(padapter, pssid, da, ch, append_wps,
-				      wait_ms > 0);
 
-		i++;
-
-		if (padapter->driver_stopped || padapter->bSurpriseRemoved)
-			break;
-
-		if (i < try_cnt && wait_ms > 0 && ret == _FAIL)
-			msleep(wait_ms);
-
-	} while ((i < try_cnt) && ((ret == _FAIL) || (wait_ms == 0)));
+	ret = _issue_probereq(padapter, pssid, da, 0, 0, false);
 
 	if (ret != _FAIL) {
 		ret = _SUCCESS;
@@ -3768,7 +3754,9 @@ void site_survey(struct adapter *padapter)
 					if (padapter->registrypriv.wifi_spec)
 						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
 					else
-						issue_probereq_ex(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL, 0, 0, 0, 0);
+						issue_probereq_ex(padapter,
+								  &pmlmeext->sitesurvey_res.ssid[i],
+								  NULL);
 
 					issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
 				}
@@ -3778,7 +3766,7 @@ void site_survey(struct adapter *padapter)
 					if (padapter->registrypriv.wifi_spec)
 						issue_probereq(padapter, NULL, NULL);
 					else
-						issue_probereq_ex(padapter, NULL, NULL, 0, 0, 0, 0);
+						issue_probereq_ex(padapter, NULL, NULL);
 					issue_probereq(padapter, NULL, NULL);
 				}
 			}
@@ -4899,16 +4887,13 @@ void linked_status_chk(struct adapter *padapter)
 					if (pmlmeext->retry == 0) {
 						issue_probereq_ex(padapter,
 								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
+								  pmlmeinfo->network.mac_address);
 						issue_probereq_ex(padapter,
 								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
+								  pmlmeinfo->network.mac_address);
 						issue_probereq_ex(padapter,
 								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address,
-								  0, 0, 0, 0);
+								  pmlmeinfo->network.mac_address);
 					}
 				}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 70fb161afd09efc197e3f59c72972d9a611cbf01..acea9cef7756e158c7ab9e357a06a7aab300943f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -542,7 +542,7 @@ void issue_assocreq(struct adapter *padapter);
 void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type);
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status);
 void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
-s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da, u8 ch, bool append_wps, int try_cnt, int wait_ms);
+s32 issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
 int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
 int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms);

-- 
2.47.3


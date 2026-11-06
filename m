Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793941109;
	b=ykxmtCABsy8rObqhZvGgCKKCEI4RZ+iOIh+kJWf0IsLFkDBCFOkjsYsMXceldTtSF1ST
	 pWRLIyrAd7nvgvVahcZUFfxn+lg2cnfIc2BY1kLkyL6F4QsL4r8qJkn+PaD94tTJWhCsp
	 E172BUuM7cK2Ge0dl8FNmKrtV6NC8mjCpQt+rW9Gb0zP2M4RTz+h0Xk1vgjJdYLuJQO1z
	 +x9dHQqJDnmqpSiE5vmQN2IwnmEDKAVLyF1JdZzA3ZkerN1PoUmAztIsJd2kQUGQpvchf
	 U4zpLOgbutLPw/YjrlH3yLbF+Frcvu6idsD2NFdeHyQ9Kc5rKOHQRTbO54VWmIR36fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793941109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=;
	b=dr7texK2c+uQKk4cuBpmMsbEUlLXnzUb7i1Eg9qAD1fa0t9bvscWTUOD/tKqk4gHfJl4
	 ZApX8VbFmgMwW2D32Bth8QdtUwWbxDwDgw6dGpQzEuxWul8dVCN/HPTRGj8cAWoZvYFAI
	 svFXjGyQq1zvE1xcXxI/3MU43LZRt2YSCKH/LsZFDdJI8uX9XN/ZQYj83gmXvp22oEVVt
	 JFHN9GPcF4Xb3vdTXRP9QrdOugRteoK+MiV/ayCuuk+BRootIElwdcHjONRbvLfTjv8d4
	 KSIqQIZwF4U6j5NYApFumY6DdTYk5MEScAiMzqYBgJNdn4g8tKoPnReId2AUP7aGKIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MIALHroj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=isiNyX9R;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A92B606D801
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 04:58:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A92B606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MIALHroj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=isiNyX9R
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A63xxCD1727406
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 04:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=; b=MIALHroj1yfpVm2p
	HLE4hw9VpKzgRzXleimNdjgiWSV+JAVH0WZQhO6DfLn/z275/dvHZ+v8/SlQ70kG
	H81uTJnb00sYF2jMPd4UIYY0duBH5McYvoARzJZPczVKsqnQw1PH2Ke9OQDjuQrx
	Hn1SczV2hboQLnB9bk3qbALsb4CtDEFMg0DUT40vqFaVejCvE8Tz8/Mr++19/7zB
	/X9S2omUaitRcWgW96Ecf/WNKfTKBV1Nr5kUR4bCAu7wS8alEpOrffrXrNL/0ToQ
	gRnDP+Supuk1KJ4m9taSTUB+hteFXvYtmi6dbKeEOC6dCTpDA50CW4AqnOLsj+Jn
	heMqlA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa8y7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:58:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3700be873ebso11829eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 20:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793941107; x=1794545907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=;
        b=isiNyX9ReUOr4l/AD4C5hT/Q0q/Y1FkLjcTDGrGRqufVp4yAeIHkvGomobko8cjo01
         2SGNE4Wrld+JwKSq6wOXAGAZbANcVOMPs4X3pMimODzqzGsScIWnatCxjfOJOKO/w95o
         ZaWqRtPB0QFU94q6ygLbfxpLnPiER0n6nyG2dQI1R56KlywddVsjz21vbt0k1/xCLmti
         1uiCOH7VOyjtYJYgi2/TrQT8aUx3e1B1v6PSMzEcOVOgQZOeIEYpRfKnfrVOeuPqSLrG
         Q60tbPw4EOqY40f8xGIx4L3MsLVyADNtogn5Qo7C7UZctk3uAy8Z5j0HGUInnD84yQil
         vwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793941107; x=1794545907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PwuKHcELMyLPFxVIV5lVQjxMlleCNVcLIZcMUwaPOrQ=;
        b=Mk2+817rYlPlkv25kj/9VB0H8zhpLLbVn6aO45FnX4MZLwUj8gHxwViIgjvpu3mW/v
         pONBb5e76AGM2gaosEU3CZ9Mp/l/YF+4nylThnmkdbACfep5PcIp4qVzMsY6PtWXuXN8
         HSLZt+syMYLqWuhJrhtpIf7GDgBK6NZ5CXW5cacZ+NzmuMtpvDopvJknNvn/+wsIc+wM
         P00ftBEzwQD+7ORO2PH7DoomsEQMuRMiewUGlX26Bc8dOzGpHwNKu0DcL3wd4yxGbvjP
         0tNAxPplcn8qEvedULzsbKEt1tegzu/uYOpsBWQurmdTpi5gq9SyxbdiChuc7XuGSwBv
         cstg==
X-Forwarded-Encrypted: i=1; AL+hErEgkfh1z2Z2VsHXqJhDRyJeF7Sd1mh2wFaBZ/YXZuFBgzPw+oc1j76IVxm3bYPce7eGcD2a6pZk0Ei0D2k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wna193kZa61wEw3yQutJccSlvFNAHPUxc6l6jnq+S43J1jD38
	nnNPmEoLo1CReZ6O8yTtfVuIOZcLj9s80e5HyNkYemXQO7I1p0DJpMtXZ0vV0iNURta+axFRNKo
	g8b50ugEpKML7WijWKyuoBFC0h1LMcBsM8RphBbmy414Y0GZasN69mbs5IEndy6oaX/k=
X-Gm-Gg: AYBFou03DbdDxY/DXIsBnslfdHwL5lBKyAiki2jUlLkRC7e8wtrqZ33u/jrDkC8RYIj
	CfYAXM+eGBFfLeo1cFp8rFPc6cTLNqE2VkyztpAdsz96qLjaPc7psNnlrATr92f/CnesElrXnxH
	hdZ76ggF7kwi2H4+eK4/Ds9KTxbHTH9jFLoAf8FHysUImDQ32jJUkr+NkdzjXYcTe/6BAd0vltn
	0UnssO5w1Eq8TOXazgntyffwcifdW5lYqUaRyeHtuy+DCbWH6uJreP0u18XUpfaT4PshJi7gbLw
	9bpp6pa0xCZ+3djGChPdzkvuvi4xl7O2G13YwP/MjJCRaTO9zEGqCtcXMMsMoemw+OZ0E9FXoTT
	hux6lT34awMZDo/w576rZLvkyheAqSRL2rqptdsNHXB87aCoes1hmnl104UDLJ1+RS7djaBTwlw
	8CrtmnWdVOZS8ot/vaQqqSSUSZ56g97oEWr+9xGA05zqpdxEL3X15s1SyiJzqa8NcsNxq27eQB6
	8/L
X-Received: by 2002:a05:7300:b08a:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36de695a231mr6085928eec.15.1793941106931;
        Thu, 05 Nov 2026 20:58:26 -0800 (PST)
X-Received: by 2002:a05:7300:b08a:b0:361:2a55:b94e with SMTP id 5a478bee46e88-36de695a231mr6085899eec.15.1793941106330;
        Thu, 05 Nov 2026 20:58:26 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a47esm3021327eec.6.2026.11.05.20.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 20:58:26 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 10:27:42 +0530
Subject: [PATCH ath-next 1/2] wifi: ath12k: Fix HE BA mode configuration
 for AP mode
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-eht-ba-window-v1-1-622f2272e582@oss.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793941100; l=2602;
 i=rameshkumar.sundaram@oss.qualcomm.com; s=20250120;
 h=from:subject:message-id; bh=mzoN3FdmoGcO25gjrPXpkBIbUBZJgWlfeD0OPgwSV6E=;
 b=B0OhH5oOIE9//pxYTDq/iUODgDS/RgAERSa4Lx8c9ck6ET9j+co5xKI2HqlsgbqhXvE4T3gdC
 qxcuzozRKVnCb3UuzV4ZrDeXC2LAvDznU6MImrNyVFGVnCY3cWYlGOR
X-Developer-Key: i=rameshkumar.sundaram@oss.qualcomm.com; a=ed25519;
 pk=CbWiiM4JikGBEWI7HtrEEE/Hwkk7TTcob0SwaFdAwKo=
X-Proofpoint-GUID: QMZQl8yA4EUmRr-EbxGh4XDVwzWJS9EE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfXxuCkS3Wg9e3a
 syhsC6Hy74Dw8H/NR6QwMsQZDtC2px158PYOrGYDuOhtilR2oV3aouxofwESvrbYz51co9U4cTV
 RhRYyAp2tIrXiSUbN4a7gCf7t08sT27XjO/f3Pv2lWtfnv4FfI/zoOev8YZY5JIgAW4Wja6Y+vv
 yq0q4HLUmOn/52ExP6P3r9X6QqsG4JWHJ8YQrk9Nw+ivNgofOn6PdaIgMcIrK/tCpIi5O72WFNf
 lvqxmvCB7nxduEU7tUJrC/oqMtvPyWA2Xy1+XMbUg09B8LqclAkgS/OPqZbrytZsXEng5TzzKQe
 +grEquJthC4k5DUt6X7KeKo1vULlyXPbCyF5YORi9mYQ8sIQRoAVzqrXjbM3AlXy8ej6mSY2/BV
 50quom3j2ceqRfNl3TiphbuaUR9FtnSnS0lfAsdGNmOCVNmr451bPiA0YxzelqU2LDTk7SbWkt+
 rmJAFDXl6PINw9wJGhg==
X-Proofpoint-ORIG-GUID: QMZQl8yA4EUmRr-EbxGh4XDVwzWJS9EE
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed5e74 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Egx7SfdSpjdNf9FE4GoA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxOSBTYWx0ZWRfX795vURQwQMGy
 bcNvZmxzSE6tYfdiBlu1oSKnFFHWrJ7LXFMLqbfCSw66AgJwmPct2Zr8BWo+3HV8j/F0L/Lui2f
 Cs5qh8F1ZIuz8JBWoh3Jk5TwaPdM5fI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060019

WMI_VDEV_PARAM_BA_MODE is currently configured inside the he_oper.params
check. However, mac80211 does not populate he_oper.params for AP mode,
causing the BA mode configuration to be skipped for HE AP operation.

Move the BA mode configuration outside the he_oper.params check so that
it is applied whenever HE support is enabled.
Without this change, firmware defaults to a BA buffer size of 64
(legacy mode) for HE associations.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4f16c78b52a8..711acb32a6ca 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4888,8 +4888,7 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 		}
 		ath12k_control_beaconing(arvif, info);
 
-		if (arvif->is_up && info->he_support &&
-		    info->he_oper.params) {
+		if (arvif->is_up && info->he_support) {
 			/* TODO: Extend to support 1024 BA Bitmap size */
 			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
 							    WMI_VDEV_PARAM_BA_MODE,
@@ -4899,17 +4898,21 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 					    "failed to set BA BUFFER SIZE 256 for vdev: %d\n",
 					    arvif->vdev_id);
 
-			param_id = WMI_VDEV_PARAM_HEOPS_0_31;
-			param_value = info->he_oper.params;
-			ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
-							    param_id, param_value);
-			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
-				   "he oper param: %x set for VDEV: %d\n",
-				   param_value, arvif->vdev_id);
+			if (info->he_oper.params) {
+				param_id = WMI_VDEV_PARAM_HEOPS_0_31;
+				param_value = info->he_oper.params;
 
-			if (ret)
-				ath12k_warn(ar->ab, "Failed to set he oper params %x for VDEV %d: %i\n",
-					    param_value, arvif->vdev_id, ret);
+				ret = ath12k_wmi_vdev_set_param_cmd(ar, arvif->vdev_id,
+								    param_id,
+								    param_value);
+				ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+					   "he oper param: %x set for VDEV: %d\n",
+					   param_value, arvif->vdev_id);
+
+				if (ret)
+					ath12k_warn(ar->ab, "Failed to set he oper params %x for VDEV %d: %i\n",
+						    param_value, arvif->vdev_id, ret);
+			}
 		}
 	}
 

-- 
2.34.1


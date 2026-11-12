Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482795;
	b=ETJdKG088RgIJ9vZb2TFkmYCjle9bUav5sN/tlA1U8aMocUwjMfn01ycnGbrYyMw3Mxh
	 HEFzxuWDLTqJ8cUQmCcMPIlCE/K+ZVcBNkhyXBAwdW9St30UtpYGMcwZeryrdf2iKnEe8
	 pHmWF/o6wtakKKfcqi2t9vq6JPFSm/3GeYn9RVIZYu4Ik2HtwhXkl5mj9LnmiRkZcGVMF
	 EQ3HRi5lph0dUdtjWrZjNdhplxfqBzu5N+jqF1isQgIlJmr3JClE09/UMpZ/zHShWpsTr
	 YbnCrCah1CmP2ZSH7/Aks2t5SDeorYNZjEhJDMEUfzebqtOCBgz8ulRq+TI9uLHQHkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
	b=0bzTFNvoZ5Sy6BD91HnkGG15bvi52E0uuKfqhKDDF9HE8rkzSZKDHwCq0uE1KWGbhuHX
	 KmZrNNrOJLX5zSKrJ1vsynxwrHR5yZdayYtq8qMR1fDrOZKL8NtnNPcO22Ehxp5aFYDIC
	 kY6CMqHx/9vO5b6vCvaXxkadivjAQzOjxAgxEFFoA5oqDa1c15r0h+tBRDC5GpU2Ur3Av
	 GWDMmoEcXEXUSZq/vt6gjWNokWuGH9wtwDbkULDNBMP7hKUwJwOUSEH7BLHjAoQJR2If2
	 2mps+zzyupY4WIOP01MHA5BWhjoX2Omkiuyf/+1qNxF43XRvYK1d4NMpKvkRnLzgF2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmF0wkuo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J7lyl/4R";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DC8606C173
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33DC8606C173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LmF0wkuo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J7lyl/4R
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACAUWgn1629193
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=; b=LmF0wkuoImZ6K5Mn
	CoMcB/Uwe6ghELLqCS1Qfg+3j7x/sXZC/jpKp8GcYAj3xW33cIXDlktbsaHYUHv9
	Am/yApWRxRfXp77II0V7SczhyJ7LS8o1TUWwvqxO5r1AEY/Z3lPJdxz4nLMmLOpK
	GN9+fX8sLhv86GDjJBOBrVKOGDfMG/8dmA7HI/ozopsetFxZvBXNrLl3+36aPnl5
	qnmtcoRoY2fJc7MZs2Y0Wr/jJ/ou5+KyB7En24kDjBYU5pXZFyeuZMte+aSNraxq
	lU2Pgcms/HpU7DnqumsvryZW8ucFEaxG9vyn3X3L/0vrvCaX1bwGKN0E/6SkKL+Q
	ByFRHQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbs005ks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6581813eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482793; x=1795087593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
        b=J7lyl/4RjbUMhTQBuEm0oCSv3otMAJfu+sF2d6OKkQGZXnfS9WijZwBjd0eReblJpF
         7FO/l3C+/TLS4JPt1PSaVbE5uERJXvnXk64gE2tgMOsyGmjizCSU32Fi6BKBWpCTHfmc
         xK6hcMnhwphxIJ0pvVQpRb9Y/iYGo23Vlg7FQ1MSScmA+MexIGQ96k9wKiLMtDBH67Xw
         XLW0uW3Uv57xyKuau4G3G1hTE5mj+GgRa11mmM7ifFQZqXQAU51uEHMnWKkclnCnBJzi
         fS8G5UNeZQsWZZAeSQHLBsdP5OkRMBCn/PibdPu277n6ohvSbJ7l7MG/ByjmKqyvmsuk
         2Ssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482793; x=1795087593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5fAbncqJtX82IhsFm2H8S1cIjewflvsuECSfWHLAZ84=;
        b=ZocDV/Cttjvz/8qLe1LCxYEJcPuS6Mz9q5UjAqYD3rpawymhM6iMEqaRafjQHLiCX4
         uquV4DSYhgS0BjwHsTKgHWn7M+igTStrZachlru+ObeI9iKw0s/1P0z04fi4jSCd9xbo
         A1sxaoWSnKiUzSrTFk27k4ozLUH9VrLcVWBoHr1xZc9BHoTvf70d0qwUAoPVLB7DbAeX
         GboDkrKeN80r9rCGfCjV6NVZ0RORneta59dfj5ekBqOuyErtrmahJ2Mhhfl/zLHpnP/y
         yFkMBLz0i+ty1SgCjicKmzu+W3v3PC85Tc6dlIYjCz4tmle2+HXMy1XkuHHifQmXvAVs
         OEyg==
X-Forwarded-Encrypted: i=1; AL+hErE4KqYFT/CDyaD4227XPfANG/zcRfmn2iWDWUMa1RckPWEC5uMAy87EiHtMKXJSIoOugxua9SK4dpGnhIk=@vger.kernel.org
X-Gm-Message-State: APuU4Z95ckGpw/3qcrH0Gbhf8AOsNTZz6ixbX5ilwFFgVrs7e08WtFx4
	QkPfefMhKYwv2hyIrqB+4roZulmCqlc00I44TiZkfVXk4aBJzIegckAEd82GcYyGmvLU00o+Pls
	tGrUD6USA/rdBcpwWfGk9WtV71YQDp2ojfvWTUy4H3srzCS0shVEsUmYV1gWBrYuYT1/ILzfmQf
	xKuQag
X-Gm-Gg: AYBFou2rk/YpY3TnyYdP8wNz4CF961iuMqsnlvto7gJoNZ4hVcnXJ/P06Rik7Zpkcle
	IRBOK5L1KCAJyv35HcJiAq53OLkJT3yzJJvFHda79ZLYa7BFJw4elCLDbQgc0lR/MUnU4TPgnQj
	VBeZh9r7SbweNQlU2q6UWAcL2GXMWlWvfW3XQ5l6NF6e350r4EqiQXSg9oiQfw0CD2F6GanQWGf
	LBb4aIvmO1X8ILQWrsNbloY98PrEBDP1WsDvtGuGTrlyk2mBUZPcd2UvpX8QLytNV2l7oeTap2f
	QZdv5x58Vqrj+muR3Ic+A4YsaoTQpmyA6BG91GFCJXUObB+RtxNxNg6iLufKTWBqJ1/a5pTX+5b
	mV2UC/NId1SosgFnDlA2Mc3K4oubNAO+6FPitRtXM3tapvuyPPUCuLc1rFFjml7SsdMymdGZwgs
	6xN8YHxUh7kzlEJpjgHmSFnc4C
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr5567242eec.1.1794482792705;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
X-Received: by 2002:a05:7301:77c6:b0:36f:d53:cf2f with SMTP id 5a478bee46e88-37682f94242mr5567223eec.1.1794482792057;
        Thu, 12 Nov 2026 03:26:32 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:31 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:02 -0800
Subject: [PATCH ath-next v3 03/10] wifi: ath10k: also wake remaining
 blocked waiters
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
Message-Id: <20261112-10k-sdio-crash-v3-3-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=3115;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=lDNxJn1DHSRkmNxna6PrmHJkPmD6XPQRW8oNa+Sh5QA=;
 b=ssMZwuMKrv028w7u1BxJ+eP4EBOzZMCmHoHHaWAawSaOZ2CmFi4amXXN6/0lJl+bJLyGZjp+2
 ucYt+nLpm7iB8INxGzmJQ+KCdjP5J0idjgjZYjdq7dSUcg0hvhReiWn
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX/chAsZ07N5fn
 N/c59W5y5wp2jmBQ0UEzhxT4dGOxekeP0K0d9YsAjnR1MExBbJtHMmDCadmj+zs13uyuw9ogriK
 JcNinNvfD8dvPFqbtnpP/j6TpImldKgQwWEmh2V/wxTw56fOxFLHwOIGxeYjBH58xFpjFCvBcJy
 VV/2fQK46SGFuW3REUHUEDms7nyofKeIi1SFIZ3lrao/vl7NIJ3b4qSQhDNuouuwiE8If4HSYK/
 kFBrDuZI5ltN2uyDEw2UF291dhQWBd5vdLUtO5Ap0T6hJxIzpsLWDAU7YWRxV7xnd+k8mjL0Vo0
 HdcUIvRZ4mgqGsEwH8Ilu6cd/z0pnDmAGOyat+aY3GtOneeN1vh7MHG0iS2Q6oRzBYA8RcQVW5D
 luRNRZIFRvyIWW1iUXlzx3qZjhHDB14Qjggb3ZIgCw2G+2+hwB3pPDmWtyCRgfzsHNoaefYQq3w
 //03WckB59nsd4igrtQ==
X-Authority-Analysis: v=2.4 cv=AsF7T+9P c=1 sm=1 tr=0 ts=6af5a269 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IOUMnZVgalWeg46eWFIA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfX47mtb3G9Q2Fr
 ZrefUisY6te0Hk8kMs+V+yfcBPWtSacZoSFBlcz7/R3HVyghuT3PwAvwIdAHruK3IZO5RgS+NfC
 Yo9+KVTplWA/P2yDIAy3o09Bi+icWnA=
X-Proofpoint-GUID: RtKcQ-5Ej3IE-3xTwUbdl0VlcAbBY5a7
X-Proofpoint-ORIG-GUID: RtKcQ-5Ej3IE-3xTwUbdl0VlcAbBY5a7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

ath10k_core_wake_all_waiters() still misses several completions,
leaving their callers blocked after the driver has given up on the
device.

In particular, callers waiting on peer_delete_done, target_suspend,
wow.wakeup_completed, peer_stats_info_complete or wmi.radar_confirm
continue sleeping until their individual timeouts expire even though
no further progress is possible. The WoW and suspend waits are on the
suspend and resume paths, where these delays consume watchdog budget.

Add the missing completions to ath10k_core_wake_all_waiters() so the
callers are released immediately.

peer_delete_done is not otherwise reinitialized before every wait.
A completion left signaled by recovery would therefore make a later
peer-delete wait return immediately. Reinitialize it before sending
each peer-delete command.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 5 +++++
 drivers/net/wireless/ath/ath10k/mac.c  | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index e32bacf5b771..d86c4ead06e6 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2500,7 +2500,12 @@ static void ath10k_core_wake_all_waiters(struct ath10k *ar)
 	complete(&ar->install_key_done);
 	complete(&ar->vdev_setup_done);
 	complete(&ar->vdev_delete_done);
+	complete(&ar->peer_delete_done);
+	complete(&ar->target_suspend);
+	complete(&ar->wow.wakeup_completed);
+	complete(&ar->peer_stats_info_complete);
 	complete(&ar->thermal.wmi_sync);
+	complete(&ar->wmi.radar_confirm);
 	complete(&ar->bss_survey_done);
 	wake_up(&ar->htt.empty_tx_wq);
 	wake_up(&ar->wmi.tx_credits_wq);
diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
index 3c45e5483b60..6179a029914d 100644
--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -843,6 +843,7 @@ static int ath10k_peer_delete(struct ath10k *ar, u32 vdev_id, const u8 *addr)
 
 	lockdep_assert_held(&ar->conf_mutex);
 
+	reinit_completion(&ar->peer_delete_done);
 	ret = ath10k_wmi_peer_delete(ar, vdev_id, addr);
 	if (ret)
 		return ret;
@@ -5898,6 +5899,7 @@ static int ath10k_add_interface(struct ieee80211_hw *hw,
 err_peer_delete:
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ath10k_wmi_peer_delete(ar, arvif->vdev_id, vif->addr);
 		ath10k_wait_for_peer_delete_done(ar, arvif->vdev_id,
 						 vif->addr);
@@ -5960,6 +5962,7 @@ static void ath10k_remove_interface(struct ieee80211_hw *hw,
 
 	if (arvif->vdev_type == WMI_VDEV_TYPE_AP ||
 	    arvif->vdev_type == WMI_VDEV_TYPE_IBSS) {
+		reinit_completion(&ar->peer_delete_done);
 		ret = ath10k_wmi_peer_delete(arvif->ar, arvif->vdev_id,
 					     vif->addr);
 		if (ret)

-- 
2.34.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482796;
	b=BWa/kRn/KxruCmwDcXiFJG57wrSK7fYE6iS9yYEW/gztjd5WRlltNw30whMCEOWRUD5F
	 ntQW4bj9csAOEdcez5IwpZzRg06KpeSnaevTKxJiqS+7zybZW3V8yMdENGvHUPC/oitpb
	 K15f1yUHXDktzdMBKmOut5a18/WHZkaDQgbLuxmtxdTwVCQTsKISdGLO+HlhYS3KUBrxl
	 Xz+m778NVSnIfTSM5LiKNxt+QmobOaPjI82g8IZxd5Sx1IFGk5j0nK3SJoL96YEsYVNy0
	 LSaRnEcnv/xPJPAy5RNkzrC0LNPn1m4D+iY8RsXO+NUdVKE4mMDGB75rpZR1B6CB1XA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482796;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
	b=vibE9VRuyu0DUEqn78Jq5kX3ItTnzW7dMRgq/sUiBtYCbOwt7Mo1eOu7jWFNp+fv/9Kg
	 eaPVg89cWLn6loAwQ1Go4Uki1W98nMaNopcIqDz8HkJHbj19rg98ITLOS0ypKZyFPRW/E
	 gQWuHnGf8E+2gnL+nf5aJt+e5hDVYG7CgSC6ozkhFnaWXFbD6UWI/ohdzieABKgSg85ux
	 Dnq7eOIeL67JaX462oL6X8KpX0clT+kWXpYNqFZ/JzUTDIq2S6mpAJNqmr8HG+LzaFe17
	 5QbSGRATCth4EMD8/2JlZc44fpVthCsBaFDw+fOVJH19YtpNy++jqZ29PgTVt408h1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUy26aCm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMWsCoIk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8B60A2603
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC8B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUy26aCm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KMWsCoIk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC4luDO3893074
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=; b=SUy26aCmhmq3Pkmr
	Y7uWGVYMI1/Mwo+Vx5LIuuU1vM5Ugq8n5v8Ia/7kpLOGSZ+OnWkmZBrAU6DH8yM6
	1xnuw0xD0OCj2lDfDksou5MrOMit5VNwb8cnnocgFK9NHleqpnu1Ap7jIkwN7UPQ
	V6X5WPDKWwxKzZyZBasYVxnRzgRUwHm6BbQWZxojbaOHQwNpB/nrBC/zSjUHb6cv
	dyWb8jdhOYAkSW32VzySUjDZ/ixFNsEerCMotdDmZe6L89jMy9BqceqEwbPnCnEr
	1WSXmd37wiDYehni+OcTj4tRiGiUT6FIbLuL7Cb8OOGvciTufXEo182wgOmMmQqT
	EAOC5A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6re1bdn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-37628596fc9so1068856eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794482795; x=1795087595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
        b=KMWsCoIkM15PWOJRtF7E+2Ptsqjou7vdpBCx6vrAla1U9iwiZ6lAVWvEVP2Z2jaj3b
         vkQ9b7ytplJPAiAXwSsTYgTKkjbKL7haOGA7zHYfO2AvziMrd+YSeLpV3pL7Tw7bJaJk
         PKvaXHJY4F40mJWMm5RYpaeDgqD1yOEGbyb7NTSBBSiQkvsMiar5zaKDSZ34HzYFSteR
         bucehmbbRcEbq2KKlbPNO2optdzrMt6HP2rQh4Lj/VlMAMGrmUOukZjPWOYVKoaVI06B
         UReeH0jXyy8YJq181GNk6v0Bsla3c2ZUoyIA7PVCjUlI4IQdsvBV5WBzYjklL1teFfzP
         n2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794482795; x=1795087595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUhczvU+wHnfm+9Fyorjp/rDMH/7fLllS5Jh1+JzEbU=;
        b=eKMFOQRtiSzaoiXwQJwn6HEyMRN20OYSgBk1oxwMQhX1BKG/oEh1wujM1RN7kVha+Q
         Yb5iP9+0VR1S7yNSl6VywOVtxKRnAiC6xDwjXivdJtJxcLE4fOfY64cf8UUGaGyNID1n
         y2xeWlPsaCSHQNHqvWzJZw73h0D5a8+hWyzESjPoAVre4F71cvHXjLYD/ATx0NpK2z5Q
         9AoBLrrFPAg4xBzCCUQitthEz/d1/1Akb/d98IptfekxiF9u6G4QnJPVDZRn0fLQ/N2K
         3qC+2Sbp4jm8vh3fymAxK1NJoctDZFHe90pHwSLMsOnjX+6wFVfsap6BPV4ZiwU2V2LS
         csrg==
X-Forwarded-Encrypted: i=1; AL+hErH8qt7hJYwenhxUMSMiolQC5Fk50Dz2e9bTf40xcxlJmIJX4LyRkexdl9L4kZwTTWV/9YYRfIyjW2pvRBE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/+rFQRpsneIHYH38VxHE/ANiYNArV3Y/eQELcL37++Ob7rM0L
	oRXxZej+aEt74+Ibm2EnVvA5Ak++m6jCAo9UAvdgObGPScron2ymQf7lkbHb3UsnuVtvptT+9XY
	Rvo36jyJ/k3Y1KAp9AzfMMzOFNbATZfiBSGydmQZbj8mndxvyyxY4NGTQKeZF3Sbeaeo=
X-Gm-Gg: AYBFou3crWO9gXgBjpn3ZepunlKN78lQCmOcspxNBa86tilbUv30fumomWtFM++ScgZ
	KzVeRMI8JAzzdHRwgNMqycLO+UN8QRRCryfE28eqqwGBwZJpiWGH+AuZfC5Q0J0q54FVOOHnK5Y
	TjfcIZ+F1eg7zP4MpqHzQcNeV2t4VJtWJz8toExRDYdajHDUhRFZIzzAp0tb51rIzYfI3TMXXst
	FxdaOA9/d7niY4h8MAOLTorZhXb6rpPG3ZMkxSHUrK00Uo+zSapqySqlEEQidJvuglzt1NEHRr+
	c/Z1RZ6W0cVC0U1gAIcFF5rICYKB4rdNNns5yI7w/3+Z4v8SKEAGNa3c0CeU0Dpx5pdLUyBgTme
	bu/GrDdVaXksk8wrFyZjRj6g/ulPgKWEPCtY9kt+w1zHn2O/BCVemC9bF5+oLq1dfVluE0EFbSs
	mgfj/SuVZwHol1kWPDHEWde2an
X-Received: by 2002:a05:7300:e915:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37685a88c50mr5250864eec.13.1794482794549;
        Thu, 12 Nov 2026 03:26:34 -0800 (PST)
X-Received: by 2002:a05:7300:e915:b0:369:fb01:2eb7 with SMTP id 5a478bee46e88-37685a88c50mr5250848eec.13.1794482793875;
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
Received: from hu-kangyang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfadsm30402359eec.19.2026.11.12.03.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:26:33 -0800 (PST)
From: Kang Yang <kang.yang@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 03:26:04 -0800
Subject: [PATCH ath-next v3 05/10] wifi: ath10k: hard-block the radio when
 entering WEDGED state
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
Message-Id: <20261112-10k-sdio-crash-v3-5-24f03f300bb2@oss.qualcomm.com>
References: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
In-Reply-To: <20261112-10k-sdio-crash-v3-0-24f03f300bb2@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794482788; l=1644;
 i=kang.yang@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=MWfUEvjZr46HYMaP11xduek9QR2GcZgTmlqW2Hg4VCc=;
 b=G5l6aC6zo9pxETS3U2CFCijsxu592zbVekuDs5xhEm9El0qxvySyOmmJDB8y/qMfkimIN+cyc
 q+IbSHt1ZJUAvY/Ch2Qdh19Y8PqEhplDl0ZHI8w/ae0F6C+1vDv+882
X-Developer-Key: i=kang.yang@oss.qualcomm.com; a=ed25519;
 pk=qz684ZqyU2kfjPKl3UVYeUcHg1oCLfFIhi0n3vK+MFk=
X-Proofpoint-ORIG-GUID: eA3KcCpQ22xzEKJCZY5OwQCttkrfIEra
X-Proofpoint-GUID: eA3KcCpQ22xzEKJCZY5OwQCttkrfIEra
X-Authority-Analysis: v=2.4 cv=NJhAaE6g c=1 sm=1 tr=0 ts=6af5a26b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=F3v9Kh8TxewD1bH5_NUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXwj60udnDhQFU
 1tELqoHA+3okdvX9m+8l/M5VlMr1WXeWgS4pDp6F1wRgeMXIhgTGPDAG7MVUdFO2762afVag110
 9Aw9las4ToNLRj/tqYD429pje82IiTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA0NSBTYWx0ZWRfXyeA2FWrITlPP
 +1Ww59azZ6V6ArDoQJD5ZYbbpJ+zveEF8SIyZ8kUbAsaB4RtEV4j0SxeL0TkL1PkTcrA6fHg+1U
 qIf9sQp8jkEaGkP1NdunS1RoYif0paUn4z5erSbHxKvNnLV2hZW5kjGBPO6H0S2jn6MQyIr4Bk0
 8aVeLX5l7hDWThMkBK8HmDkkWeUFZYhq18pHXWychi+7gIcc43SD/XcVkiOwrg3KdsEhiyYNHqZ
 KWlP65U50c0nzVqQJzsXhigyhipo7mYaBu+9cHJPta+FgOlxfTtykp4NN3WLEeOOalvJU12e80R
 ++kCDdvzvcxGiX3bbdkXDSQqxbebw6g6Lfbu+gpCtZGpdCfpZxKPFMTrfD2QwRuwERLBWliqcXg
 P6dtXtwEcZsxPsBNl03mgeuheUy3LwV9t/pUrlWAm+UIf2Y96I3roe6hIALABNDY63SPmCNc9hC
 Svc7SvykOA9+vXkXXDQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120045

Once ath10k reaches ATH10K_STATE_WEDGED, the device can no
longer recover and remains unusable until the driver is
reloaded or the system is rebooted.

Userspace daemons may continue issuing scan and connect
requests, which the driver can only reject individually.

Mark the radio as hardware-blocked through rfkill when
entering the WEDGED state so userspace stops retrying
operations against a device that can no longer operate.

Both WEDGED transitions already route through
ath10k_core_enter_wedged(), so adding the call there is
enough to cover them consistently.

Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189

Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath10k/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
index f6b6b81a4896..4eb91efdba41 100644
--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -2521,6 +2521,14 @@ static void ath10k_core_enter_wedged(struct ath10k *ar)
 
 	ieee80211_stop_queues(ar->hw);
 	ath10k_core_wake_all_waiters(ar);
+
+	/*
+	 * Signal the radio as hard-blocked so userspace (e.g.
+	 * wpa_supplicant, NetworkManager) stops looping scan and connect
+	 * requests at a device the driver has already given up on. The
+	 * state is cleared only when the driver is reloaded.
+	 */
+	wiphy_rfkill_set_hw_state(ar->hw->wiphy, true);
 }
 
 static void ath10k_core_recovery_check_work(struct work_struct *work)

-- 
2.34.1


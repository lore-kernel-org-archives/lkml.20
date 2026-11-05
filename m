Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907664;
	b=ODCVQh74hCqjvWDEEOjNquL1LS66U3+wRzn6Z+oTHpcXsmyUBlIAsYs5Zfmb4+P1dEpc
	 weB+oqoHGiCNxx8qP53YqnKrDNPPl6h3ROUy1VREdwuDwACbHbnxO3LKByabzvKN7Egqw
	 C77vXUlF8yesqdzvRNNbj5BnWtdxxgWX1DK8s/ucQsxM1xDV0HorFAagEX3yT0jP5nb6x
	 FEKTRosFndW0fqhFZsNy5YUN0E88JBb4JkQyrK/XM3CjLn+QDGyYhhZTf69SXw/VXy141
	 WzZgQGfZ9+Xt3iWZWIKUgexkhnjFEWsDWkwHUay/5UEeCCIJSqjfwXtNCKl6vfSf4iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907664;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=;
	b=vKwmunbra/8QfpcqpB5jP/0XdHDOu04fQOJ7LYdPBRUe71WM0NmR9v4X46qeXOoEWDb7
	 5fNGVlpMxHdC3ah5iMY2/D1fp+vlatkUHwt+XGUncxQCgXrr4Hbt0XG9oEAZIzu9BGb3b
	 FB8E1uTztSxotaqf6ew6s1khONdbtOU1oFrYDhc8lo3gmIFlwuuDQpW8AMxR9c9gP0GE2
	 FNmab/el+U0jdNWNrjmlEMq98uP7GA5lTEioWqgrums1zUraA1P+SNNwSAu1Xb1U7UNU9
	 MZPu9Vs1tUgsXAcaTRZBSVxX2Gemm5Gt56nG0u3ptHZ/xiP2Foz4/MTEBXSCVStC0cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqEV+2cY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Axp51gvx;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC07F608289A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC07F608289A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LqEV+2cY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Axp51gvx
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeA1t2433580
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=; b=LqEV+2cYvEB+TZob
	pMM8M+e+FKQFtXJd5ko/DBnaIzkXUGHWvFqgYK1t4I3iqbljn6T0QSfzSYJTMyLq
	k0RWLSkFP2jpgVQ0gEt464j80XtQ2/G8vkveLs8kNClhkokaX9Y/FoXobwTzG4gW
	/jfMN3q82QmoflHSX7hQ4jPLjzzer65S+AY1ORk48ErvrkH2602ezu8kwn1EktsN
	7qu8QJlrfJLCqu+OURMzXbiD7kvfT6jvVQnYfhwqBGYYe194TOiI8JNonnYoX8QM
	QAyAhDOpoVVIgjnTp9BsuVoC2yuxsygl3/MS6wRfcRIkmbpcYvTV4IGoelFgPaoh
	OK/WCg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd2h7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:41:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36efb506f29so669100eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907662; x=1794512462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=;
        b=Axp51gvxApOUoF0kuugSaUPcl/Ln2rDdDVMWtnUyDQHAUFKdRYbep/tBIwweQKKkzy
         p1GBI+xmGGe+VQeauuLrxak6QOV2KAddeAvJsdfcq16ugG5HF2K4t08pUs/BcF6vKK+A
         +9FF2nb1kLPAUiDaO2wVc6k2U9Wbf4jTt0PSLToxkDpt+h3bJMBfvM3E2HaRVjduYhUz
         vewCjP8ivuBAdnpfQx6Mjr3zEtwDeJR0SEEMYbfEM7jNnJkaLhN1L3bO1e9+HGVk+ZyT
         iurEy7iNAgirTAcMrrgMrzIKPEUaIw/YTiLRQh7XchUZGZgkjasIGD/I52IGW7cd9yvl
         VaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907662; x=1794512462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rT/d7+i9YSFZFfCF66tfzOlOFOmBtXy3cwDPZswL+pQ=;
        b=w7YtEK20XGa1vpKcm3LMxwQpF6tj5i1wkQLyzPE+rusKiWUxKDDO/iFhzu4Y7ijO3+
         6NPM3w1Ke3kCYxjo0VEVqWauNpIT8jufIwNz3N8CnmGnMmX/bjL/EuNkoKg3OT1gSIwJ
         KDE5qKVi4ch+VeNHisz8Ht79pkgUkeg+2Ljps4CZP5cMhcvssLwXge9+Tx6TPEw2SFyd
         y5TRIuWv6Up5NehMrsFo4UC+G0T1Smhy7i5alyeL88sTCeM23WTcHdqw+gtY7+QKMzSa
         klkP7xF95nZCsPxE/kOBI8aXYhsZ73xCrw7Nvf7fyb7vAKeqR2odprS6x5/mc46sbFu5
         EBsw==
X-Forwarded-Encrypted: i=1; AKwUvBzkU6kAtlSab/DUNSzFGTGG7fR2CtMl21MwhUFqOL/T09VUlvEYgT9brnxALB5TU2am4gKqwm+w6CtbQXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lDU+iDwobJpqSvpHx0vbpBTAfHpz5YMASh4Q4o/H3k8jFxtBY
	FF1Lfopx4JQyWF7pDGMNo6M/H313AuxHumzbLO4uKFe7m+7UriTSRu33WqbIlD28s5fMNZmwQ9y
	6xFCjxGEza8JVhEK5GVw67fjDcSVmdR95gEyonsvwzu3Il9CMEZlPxMisAS2/y1XArQ==
X-Gm-Gg: AYBFou1bS3mTbxBDxjMirs/j8YUqUnc9FXKEpmVp9PVzK8ZnT28aOLOewfqtCua+ddP
	EpbY9+6i4x8QQvwpA7ASE7drPWVNe/By/8s/WNA1yq9fg7NvVNDAA+r0Q/L2KrVQxELhmiD2CoA
	O8n5DUmqWtqZbTe/BKRf4d8ZyO/npkB7QGvHjEM2dP5DFYFbLeLP+JrHZZ7mTzvswOEAtOxO7w1
	ugnI7KxmJb2h7jquh9S46cNyUQn78d/vxds/g9WJo7jz31lIyWs6UfXwXD40scMd+3WAdqVtDZJ
	2s9pdj31rWW0rjD4zroMW7v0f2C1ujWDKRdJd1elGcwnk5lLsbKIUwyXMv6sfnV3ZQ5asz4tUoP
	Mn+R4pZ6LWbZs6xcL5al4HLYotZLu7CEu73wTfo4Fn1t/RGvcJmH8CIwfpzGIpcXIlya1JV25H1
	+NXcE1k89lggonfWpYz4MYkTRJG+/BfKOMsLmAtmz0VNNRJLu0GQqxwoCPEbykDOfAN1NUKA==
X-Received: by 2002:a05:693c:8815:20b0:36c:a321:9fbc with SMTP id 5a478bee46e88-36f72cc15acmr214230eec.1.1793907662213;
        Thu, 05 Nov 2026 11:41:02 -0800 (PST)
X-Received: by 2002:a05:693c:8815:20b0:36c:a321:9fbc with SMTP id 5a478bee46e88-36f72cc15acmr214192eec.1.1793907661484;
        Thu, 05 Nov 2026 11:41:01 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:41:01 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:53 +0530
Subject: [PATCH wireless-next v3 18/21] wifi: mac80211: handle UHR Link
 Reconfiguration frame
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
Message-Id: <20261106-smd-v3-18-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXzDhZkVxjZ/Dw
 eq3W5q7fYJHC2H/TNJTwJuSk8H/gWL6ARZniG5K6huK76tXXdnVDRmZFC6xW2+tllh0diqiwikN
 NM9OFbUHuqgD8j1BD+nDBYIGDlrTI/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX8QqkvFg1gVvA
 GZzSzgn+ndQXZjY/PAObDzF0Jo4Q0TfubjlH5/dlP1sJPEFvIIS0a/TIxWFc/4uL3umtsJzesdj
 lH30A5jkK6zCC+H9TQZkErjRLoMpBGEO9SOXCYY1S5Y0yiS080xcCSFIDcJIIThe5xjb6BG18PP
 h1/BTNZsBcOguuMe0hOKugOaerQREqP2etVElFdJ4SzTMjMhYMD+xH2lyKmUvnjla00USK1aQbK
 j614p0Sdmxs6NOyVWOpEn8hB24MAG0evM++wPRCFY83MJvt3L/h/Oxi2nEFxa8re1hiq0Q6rVyp
 0AxE/EpCDVE7mV28r62gxqmAYOntOjpUOCnt8BFktAyJaBLkj5lbEtCIsNAgqPXeKHXU6lCdqBa
 +zQ304FuiKHuD1zY0ImuwVFEd/88eXjM667Vsw93DRtCx0+y6yYGw/f6dBPJvuwtnhoeD/d0J6R
 vgRZX6eLGVr4Rx/TDjA==
X-Proofpoint-ORIG-GUID: T1kIsfwPbVVGuTaCYX491hZ2zA4yPzDK
X-Proofpoint-GUID: T1kIsfwPbVVGuTaCYX491hZ2zA4yPzDK
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aecdbce cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2D4fXk2DXaNhJLBsYzwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

A UHR Link Reconfiguration Request frame (ST Preparation or Execution)
triggers SMD BSS Transition on the current AP MLD. Userspace needs
reporting of the STA's dynamic context along with such frames so that
the same can be transported to the target AP MLD for setting up the STA
TX and RX queues.

Reserve a field in ieee80211_rx_status that enables drivers to attach
the STA's dynamic context to the corresponding frame. Since the maximum
possible context can grow too big, attach the pointer to the context to
the frame. Add handling for UHR ST Preparation and Execution Request
frames so that the associated context is propagated through cfg80211 and
nl80211 for userspace reporting.

Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/mac80211.h     | 10 +++++++++-
 net/mac80211/ieee80211_i.h |  2 ++
 net/mac80211/rx.c          | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 2a595126b1e3..2539b5ffd78b 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1735,6 +1735,10 @@ enum mac80211_rx_encoding {
  * @ack_tx_hwtstamp: Hardware timestamp for the ack TX in nanoseconds. Only
  *	needed for Timing measurement and Fine timing measurement action frames.
  *	Only reported by devices that have timestamping enabled.
+ * @smd_ctx: Pointer to IEEE P802.11bn SMD BSS Transition context information.
+ *	Only needed for ST Preparation Request and ST Execution Request action
+ *	frames. The pointer will be consumed by mac80211; must be kmalloc-ed.
+ *	Indicated by @smd_ctx_valid.
  * @device_timestamp: arbitrary timestamp for the device, mac80211 doesn't use
  *	it but can store it and pass it back to the driver for synchronisation
  * @band: the active band when this frame was received
@@ -1775,12 +1779,15 @@ enum mac80211_rx_encoding {
  * @link_id: id of the link used to receive the packet. Set and used by
  *	mac80211 internally, it uses @freq set by the driver to identify the
  *	correct link per vif.
+ * @smd_ctx_valid: if @smd_ctx has a valid pointer to the ST context. This flag
+ *	is used only for ST Preparation or ST Execution Request frames.
  */
 struct ieee80211_rx_status {
 	u64 mactime;
 	union {
 		u64 boottime_ns;
 		ktime_t ack_tx_hwtstamp;
+		struct ieee80211_smd_ctx *smd_ctx;
 	};
 	u32 device_timestamp;
 	u32 ampdu_reference;
@@ -1814,7 +1821,8 @@ struct ieee80211_rx_status {
 	u8 chains;
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 	u8 zero_length_psdu_type;
-	u8 link_id:4;
+	u8 link_id:4,
+	   smd_ctx_valid:1;
 };
 
 static_assert(sizeof(struct ieee80211_rx_status) <= sizeof_field(struct sk_buff, cb));
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 9906a62ee99c..82e8542973bc 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -279,6 +279,8 @@ struct ieee80211_rx_data {
 	};
 
 	u8 link_addrs[3 * ETH_ALEN];
+
+	struct ieee80211_smd_ctx *smd_ctx;
 };
 
 struct ieee80211_csa_settings {
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 78967ac95343..a3ffb08f50ba 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -3992,6 +3992,22 @@ ieee80211_rx_h_action(struct ieee80211_rx_data *rx)
 	return RX_QUEUED;
 }
 
+static void
+ieee80211_rx_h_userspace_mgmt_st_req_frame(struct cfg80211_rx_info *info,
+					   struct ieee80211_rx_data *rx)
+{
+	struct ieee80211_mgmt *mgmt = (void *)info->buf;
+	u8 type;
+
+	if (!rx->smd_ctx)
+		return;
+
+	type = mgmt->u.action.uhr_link_reconf_req.type;
+
+	info->st_info.type = type;
+	info->st_info.ctx = rx->smd_ctx;
+}
+
 static ieee80211_rx_result debug_noinline
 ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 {
@@ -4003,6 +4019,7 @@ ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 		.link_id = rx->link_id,
 		.have_link_id = rx->link_id >= 0,
 		.no_sta = !rx->sta,
+		.st_info.ctx = NULL,
 	};
 
 	/* skip known-bad action frames and return them in the next handler */
@@ -4024,6 +4041,9 @@ ieee80211_rx_h_userspace_mgmt(struct ieee80211_rx_data *rx)
 	    ieee80211_is_ftm(rx->skb)) {
 		info.rx_tstamp = ktime_to_ns(skb_hwtstamps(rx->skb)->hwtstamp);
 		info.ack_tstamp = ktime_to_ns(status->ack_tx_hwtstamp);
+	} else if (ieee80211_is_st_prep_req(rx->skb) ||
+		   ieee80211_is_st_exec_req(rx->skb)) {
+		ieee80211_rx_h_userspace_mgmt_st_req_frame(&info, rx);
 	}
 
 	if (cfg80211_rx_mgmt_ext(&rx->sdata->wdev, &info)) {
@@ -5630,10 +5650,18 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 	struct ieee80211_supported_band *sband;
 	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+	struct ieee80211_smd_ctx *smd_ctx = NULL;
 	struct ieee80211_rx_data rx = {};
 
 	WARN_ON_ONCE(softirq_count() == 0);
 
+	/* cache the pointer to free it later */
+	if (status->smd_ctx_valid) {
+		smd_ctx = status->smd_ctx;
+		status->smd_ctx = NULL;
+		status->smd_ctx_valid = false;
+	}
+
 	if (WARN_ON(status->band >= NUM_NL80211_BANDS))
 		goto drop;
 
@@ -5765,6 +5793,12 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 
 	kcov_remote_start_common(skb_get_kcov_handle(skb));
 
+	rx.smd_ctx = smd_ctx;
+
+	if (WARN_ONCE((status->flag & RX_FLAG_8023) && rx.smd_ctx,
+		      "802.3 packet but with IEEE P802.11bn SMD context"))
+		goto drop;
+
 	/*
 	 * Frames with failed FCS/PLCP checksum are not returned,
 	 * all other frames are returned without radiotap header
@@ -5784,10 +5818,12 @@ void ieee80211_rx_list(struct ieee80211_hw *hw,
 			__ieee80211_rx_handle_packet(hw, link_pubsta, skb,
 						     list, &rx);
 	}
+	kfree(smd_ctx);
 
 	kcov_remote_stop();
 	return;
  drop:
+	kfree(smd_ctx);
 	kfree_skb(skb);
 }
 EXPORT_SYMBOL(ieee80211_rx_list);

-- 
2.34.1


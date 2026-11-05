Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907647;
	b=3835M+T9sHelThapnliUvnD9BjorljfyGcL7j7dCtWn+SWGEhTyxYN1zCMPf11sDGLEd
	 OW8Pqwofah5wsH1Fg+LQWAy5CmcSQLVG5ZxY0taV6IrfBEExl8f6QekGMzXoXQK9wQZsk
	 Jyd5v7LhBWi96H7JBFhJJC8mQYZT9D7P2WxRDcV4aInUp5a4as8I2UNV879sUsINMSFR1
	 7DDfgb5zuEI49lEBfkJq6i6pYwlgy8MM4qeRPCG2m6xRf1lX7FCHX6k7JUrcR52eb9UGO
	 ywAsvMRmR0HozAHpfWTBHQvdYEQGi8wnECVQH0bQB5+0MTRGhsM0Ch1/QN/22LeiNqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907647;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=;
	b=KWSBbxDgPLzUGV/raLraq4MB7V/9yYgpLdag41fva9hBEhhz8smS4Ayb5gpyLY1QX/VA
	 Ky3MwH/ssNRTFYPnGjWBGrcuyFP+RL4j1s6r81YfbL1J2gDji0r/fov42H6alsITr5J9g
	 dB43qVAkRj5/zFxYpy/8Czn4Q1DW1D0Kmv5BiZOIdSCwm0gTTBfa0DpeSUaDQQirfKGMh
	 OkCSeIK5JKusnhTqUeebd0jss6OQYBMPd/5vEp2NlLDLHXbCLLzQPiUvwcR3NLSXV3jqW
	 8JLsCKApCV7FT8q8NEpM1A9FK3nwHIxKly1HNqtoeK2O1GCr41GsU5TEGZD7YuDnvHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCyPmQe4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yb26WKpb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE436080680
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CE436080680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BCyPmQe4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yb26WKpb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5JLOdU597595
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=; b=BCyPmQe4EqtuWN/N
	TVdExSHor+GMda7EzJRoDe5GTZX5Gci5CLAiprCjTtFw9XPZ/gKxsGeh+AHFCY8w
	aSclgTpr+jYUr2i0Cc8ct1Z24q02oCJPr0LTY/HEpvkdMvEuCQYtxYTaPZIM8mSW
	jwi/Q4/LosC/4klY0GgCya7582Eqs3DRjvzodJ0zgKFX4q43CjwOIaZmJe9egHCc
	swAPULcjNFhzLf8S0mceKSoC5TMqmd/rTikvDR8NMRD6E1m+9M6dtFmGODEf0EqN
	zWfK2wMJ6dIj2ZIe4Mbu3J9Mh2EAR23yVn4S2MAWwyDjCN/xxRvWq0oK40uGcvGd
	0bshGw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hryvv02tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:46 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so2749812eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907645; x=1794512445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=;
        b=Yb26WKpbANa9BzdQLynVcwXOoz0OylxT2o6z2GGgWPZEedJTSZ63SQbsGGJDw8JXc+
         /2FRCVy4Bz40csDkWq4cLRjJ6390VPGD/ddjYkpYbOMQzYlO+FKPsLOWpqyeeLp3Ru78
         mwFcwNWv5bH9tk8MZQw13CiQG9xm8ZpHrg8t74SUuQWfn1xO21icbQKD/m8n9k/nVcMK
         Yds10d1r6PUiYRrB90/pkSdQKRy6NULctRgecOkM0fMTGf9/fvcgeVgTfhZZawe/AgrO
         bs1QLXuPqifd31kSeCFvWX4Vi5za3+Rl+A7u6YhOWqQHH+Xh8h5ul1/7sxg0ofOf7mEk
         pR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907645; x=1794512445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=;
        b=0shtD7gcSQwSGqMx2E3b8wgmfOOZPLD2/4+8bmcpeMxz7ItWIgbgAhXWbfER1wmal7
         Et6nvyyQbQDzkSaJJ4L7jZAHkSaPOTrrt/Z1uu6DLeH+1DXb8U+Zybak6+HvW2jBHZjm
         J3QWzIy43FCpBIRPLl1/36w+1vuQRZWVTMZimGdyIsGFfVwxws8vSKRva97oda5DA5iv
         zdcV86D8skGsv3g/7Ir2tcexFm5J/hZ/Islbgqaqr2CU+ZZSzyhz6pVwi0q1xdYZbk7u
         f70mveWKtsFhigD5APUe9OgVEHeMLXuLaRFy8BEd8S1YOdfvgjUKgRRHA7HHjhqmPJ+P
         xHGw==
X-Forwarded-Encrypted: i=1; AKwUvBx5R/Ru2j3zsxuxWQXKXYJ049xmqiQjrB/lJODycW+/iMyCtSYp8s6VKCV0pxi/e5kApBFV7fdHZ12V2kE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LxGacXPUiI2cftfeKllFnCh2nVXHDTB1coWSDCMXeEzNZSPQq
	mWRAu1N28P5gr5Ur8asJ0b5VNHAQmuN1fie1ePKg3ndelDHTKiUQ/O9Yueq8LrvXdwUEForbLuU
	fnON5EpH6wv8ZE08eEa/2nhJNEXYqzG1gDhTV+jBXgt/k4GopcZxoIYPgCLB2FNsxDw==
X-Gm-Gg: AYBFou1Hw3oSxhqw8ntWkPEf43WqjiWQfU0rrUmy+11IOWj8lmau3HLg1FeX+luC3qd
	zXkkLpaWlWlZL0MaGSqvI8t3Sa1XzkBdYb81Je5oCwsX0UIBZD8u8qLmQSZOU4aOglaL9odC+ur
	ryG8UyGeV07D+8c1rA9TMePaAckLb3N6X1k6QE5fwfK49UU+Erns1ceS6DvSLrAIdntzF5nS8FQ
	ahO6TbCBAHE+PQgNJ5cJWI+U0DOZeZ8cE7+AcP6aOod0wEV5Gb4pX17xX1hCQ7fh87xPFgWFK+N
	czg2EPAsAQwU1oQv81ZUyiuycxWfR4+0Yf2HGMv89KRjn87LFhPtv7iOmRtTu7fkN+l5YHXhYZ6
	NKYFlutE93vTUSP4ADOZQTiFJBSDjMtzWEAKLJWadmKw029wgHVuJXxJNjXyC8DXWFe8f5f64AN
	++l4E/NB70w3is2YnN5bz0XDjxMVTjTrVTSn49AuYldYOPLLwqgAPtmYoJ89J7e/r60Kh1aQ==
X-Received: by 2002:a05:7301:1a87:b0:369:e8b0:af85 with SMTP id 5a478bee46e88-36f77fd7ef2mr165852eec.36.1793907644893;
        Thu, 05 Nov 2026 11:40:44 -0800 (PST)
X-Received: by 2002:a05:7301:1a87:b0:369:e8b0:af85 with SMTP id 5a478bee46e88-36f77fd7ef2mr165809eec.36.1793907644191;
        Thu, 05 Nov 2026 11:40:44 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:43 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:46 +0530
Subject: [PATCH wireless-next v3 11/21] wifi: nl80211/cfg80211: define API
 to notify SMD Drain completion
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
Message-Id: <20261106-smd-v3-11-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfXwSGAU4QT+mIW
 lU27tP0D74hA4KuR3fwutJaKOOQZ2P9KSEHj6B+UoBJurM8r3nLU+12y0MkYGvDso1g+WG+7MY0
 GTeIfd6VTtvhRQEEMhUktKbHMzx1qT0=
X-Proofpoint-GUID: QWAntWohG1calthMk_v7zsgj_BsUhYkD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX2k+I3s3sNX24
 X25Mm6tT8Qsi0DIzFW2w8Vu3yFsloX9OT9Qf9TceR4ATery990wVNBHap6SCfXp/emcDU8L0vK5
 nZeYI+k6Mo7nZ8Sgg1fcDfC5MVlZy2kQQsbbf5Q5YGWG2fxEINxsNBIeqP0PNQ7ZEum4DlWDHnx
 sTzcZ+7+6w4OJhg7/MWRswcW2yhvbHfiH6PIx7MVpR+RiMDjiPZV1aRbqWxbTJpzePaoSzWBJq4
 PyGI3IngVEAICm1hoBNh79rBYKwf9KBt1tYXnC+ABPIfi39xgHu/zgs9/F0JNI8jMycALqRHx3H
 +6iuJhsI059HxM4oD/ODLuM4vNUGwKD1dpPFyCE7Y7oatlVAVgGlRy1j3CTeo8naWcoXAF17obR
 Id+jdA/J/VxXVMEA4kfJwUNUprXxMclV9DIA7+NvU0LpydDKySDxVKBrz90iweOo7pe+8c2U8vH
 uQh4PdD9dOVTx8h+b5Q==
X-Authority-Analysis: v=2.4 cv=dKUzC+Zb c=1 sm=1 tr=0 ts=6aecdbbe cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=kjsMnnNidseNLnQZ4twA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: QWAntWohG1calthMk_v7zsgj_BsUhYkD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050078

The non-AP MLD that has started transitioning to the target AP MLD (ST
Execution) from the current AP MLD will be in downlink draining until
the Nominal Maximum DL Draining Period Duration field advertised in the
ST Execution Response frame.

But if the AP MLD has completed draining the packets before the draining
period completion, the draining can be terminated early. Add cfg80211
and nl80211 APIs for the drivers to send this completion event to
userspace to perform the necessary clean-ups.

Suggested-by: Rohan Dutta <drohan@qti.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/net/cfg80211.h       | 11 +++++++++++
 include/uapi/linux/nl80211.h | 11 +++++++++++
 net/wireless/mlme.c          | 11 +++++++++++
 net/wireless/nl80211.c       | 32 ++++++++++++++++++++++++++++++++
 net/wireless/nl80211.h       |  3 +++
 5 files changed, 68 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 36ee10ebd62c..7ffe2b8cdd3d 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -11304,4 +11304,15 @@ void cfg80211_get_smd_ctx_done(struct wireless_dev *wdev,
 			       const u8 *sta_addr,
 			       struct cfg80211_smd_transition_info *st_info);
 
+/**
+ * cfg80211_notify_smd_drain_completion - notify userspace about downlink drain
+ *	early termination.
+ * @wdev: wireless device corresponding to the AP MLD
+ * @sta_addr: non-AP MLD address for which DL draining is being terminated
+ *
+ * Should be called under wiphy_lock.
+ */
+void cfg80211_notify_smd_drain_completion(struct wireless_dev *wdev,
+					  const u8 *sta_addr);
+
 #endif /* __NET_CFG80211_H */
diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index fbc23aca006e..993bf4fe571e 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -388,6 +388,12 @@
  * AP MLD can request the context from the driver on the target's behalf using
  * %NL80211_CMD_GET_SMD_CTX and the response can be reported back using
  * %NL80211_CMD_SMD_CTX_EVENT.
+ *
+ * The current AP MLD, after successful execution of the non-AP MLD with the
+ * target AP MLD, can continue to drain the buffered packets if a non-zero
+ * Nominal Maximum DL Draining Period Duration has been sent in the ST Execution
+ * Response. Drivers, however, can terminate draining early using the
+ * %NL80211_CMD_SMD_DRAIN_COMPLETION_EVENT event.
  */
 
 /**
@@ -1529,6 +1535,10 @@
  *	(requested via %NL80211_CMD_GET_SMD_CTX) to userspace. It carries
  *	%NL80211_ATTR_MLD_ADDR, %NL80211_ATTR_SMD_CTX_TYPE, and
  *	%NL80211_ATTR_SMD_CTX.
+ * @NL80211_CMD_SMD_DRAIN_COMPLETION_EVENT: Event indicating to userspace that
+ *	the Downlink Drain for the station, identified by
+ *	%NL80211_ATTR_MLD_ADDR, has been terminated early by the driver.
+ *	Userspace can remove the station upon this event.
  *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
@@ -1815,6 +1825,7 @@ enum nl80211_commands {
 	NL80211_CMD_SET_SMD_CTX,
 	NL80211_CMD_GET_SMD_CTX,
 	NL80211_CMD_SMD_CTX_EVENT,
+	NL80211_CMD_SMD_DRAIN_COMPLETION_EVENT,
 
 	/* add new commands above here */
 
diff --git a/net/wireless/mlme.c b/net/wireless/mlme.c
index 0631e42e2fa1..2a1e00c6f56b 100644
--- a/net/wireless/mlme.c
+++ b/net/wireless/mlme.c
@@ -1607,3 +1607,14 @@ void cfg80211_get_smd_ctx_done(struct wireless_dev *wdev,
 	kfree(pending);
 }
 EXPORT_SYMBOL(cfg80211_get_smd_ctx_done);
+
+void cfg80211_notify_smd_drain_completion(struct wireless_dev *wdev,
+					  const u8 *sta_addr)
+{
+	struct wiphy *wiphy = wdev->wiphy;
+
+	lockdep_assert_wiphy(wiphy);
+
+	nl80211_notify_smd_drain_completion(wdev, sta_addr);
+}
+EXPORT_SYMBOL(cfg80211_notify_smd_drain_completion);
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index f30110d998d0..004ee5c6ef6b 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -25273,6 +25273,38 @@ nl80211_notify_get_smd_ctx_done(struct wireless_dev *wdev,
 	nlmsg_free(msg);
 }
 
+void nl80211_notify_smd_drain_completion(struct wireless_dev *wdev,
+					 const u8 *sta_addr)
+{
+	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wdev->wiphy);
+	struct net_device *dev = wdev->netdev;
+	struct sk_buff *msg;
+	void *hdr;
+
+	msg = nlmsg_new(NLMSG_DEFAULT_SIZE, GFP_KERNEL);
+	if (!msg)
+		return;
+
+	hdr = nl80211hdr_put(msg, 0, 0, 0,
+			     NL80211_CMD_SMD_DRAIN_COMPLETION_EVENT);
+	if (!hdr)
+		goto nla_put_failure;
+
+	if (nla_put_u32(msg, NL80211_ATTR_WIPHY, rdev->wiphy_idx) ||
+	    nla_put_u32(msg, NL80211_ATTR_IFINDEX, dev->ifindex) ||
+	    nla_put(msg, NL80211_ATTR_MLD_ADDR, ETH_ALEN, sta_addr))
+		goto nla_put_failure;
+
+	genlmsg_end(msg, hdr);
+
+	genlmsg_multicast_netns(&nl80211_fam, wiphy_net(&rdev->wiphy), msg, 0,
+				NL80211_MCGRP_MLME, GFP_KERNEL);
+	return;
+
+nla_put_failure:
+	nlmsg_free(msg);
+}
+
 /* initialisation/exit functions */
 
 int __init nl80211_init(void)
diff --git a/net/wireless/nl80211.h b/net/wireless/nl80211.h
index 2855d30ba354..8088785f0b2d 100644
--- a/net/wireless/nl80211.h
+++ b/net/wireless/nl80211.h
@@ -138,4 +138,7 @@ nl80211_notify_get_smd_ctx_done(struct wireless_dev *wdev,
 				const u8 *sta_addr,
 				struct cfg80211_smd_transition_info *st_info);
 
+void nl80211_notify_smd_drain_completion(struct wireless_dev *wdev,
+					 const u8 *sta_addr);
+
 #endif /* __NET_WIRELESS_NL80211_H */

-- 
2.34.1


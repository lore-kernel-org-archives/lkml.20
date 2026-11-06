Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951998;
	b=rTY/PbQsOlGJGEgTuyi4nYYCljFO5+O/sXfgO+X/Y+EfvRJBzF+6WhjYzOwN039CRud7
	 T/NqR9IY+mkb08WObe/D/cycz7D4oWPUdFYN+/pnfEFbi6ObaAly1JbaiEj9rty66/uO6
	 TypJGyYjOEL0Lpi30lPk4pmTstU6WKFk7aYg24MYg3QtzRtX/T/16ivUfJ0MtCWGwjS+V
	 TGN8cXAy+R6sSXDbhTtoSHqMK/ZVMtTd6Jo4LYtORAaYfNQSOK+jWbe18LOLcxHNHmNZI
	 voSSB2hV5FW83X6zEj6bR+66L7FLCj6t4c16Az+tE+lqoU95Ez4ChMqxcj7UR8XAWkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951998;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=;
	b=IJfRr67ZFV0mdQQWIhhPvcPUteIkJS0WMie0Wm9zg1oPOsBJWldbtFVO70zIsuUa8v4M
	 LThn0o/sApz9W0Jfh9oFQMmIhMOH35Ph9E+nule4WYsmj0dlKA+Pl1F2x6ZDWfMv47NZi
	 4qqRntM4qq+B3tuD7t6vM5BwkAkMrjE9eNAxj4++tiUpGkA+0Yu59ys82iqAZUhHhGPzx
	 XcgWGABZ7312oJO1dgkIOYhKNG/QOQaNRpT3LjKcO8viEiofF174ZJ5sYq+RXxM1h4eGu
	 IOlBLo5Aaibdgxc26pPHvRYYRgIrox4dh4oNBjypP7quy78uzUxswQ/9yYpy5vAELoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SP3XSop2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lg7omrsv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D26082BFA
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:59:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE2D26082BFA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SP3XSop2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lg7omrsv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R7WC3243902
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 07:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=; b=SP3XSop22ikIINBE
	iSHF64ttjGnlJzvk1WcKZjx97etHsSt7cxhK41IdN9gjszRtnyh7XeHolHHolZ8I
	3zGXJoFw0ldf1JgbWQxekl1kLl+sZSo/665FfpSIJN5tZD8ad0ssH+6qJHWyMsZ7
	8nzkB+5h7jPartg8iokGMiNfMml5E00z1/QXjvQaL49w1mMoQJgDRQfJdwvYJpDd
	lYwBuv+mbOwkz/xD+fH75/wEWDmybhyKx6PCr67QBpxsK/lfhAXGeUCFZeZ64V4J
	KqaueLJzYB+gKeNEkf1LDIhg33FPXDtKgUystp+/asnMdL1w5aBG17UrJJRib1IF
	92e8Wg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa1pk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:59:52 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so504993a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793951991; x=1794556791; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=;
        b=Lg7omrsvnkiWB+2lY3bCKM1AMb4Zu17ObJjp3ZyaQI4TGY9qgNNDzYkSuk1PoND9qN
         aAxm5cpVcOOO5BvkIV+qqycSSO1QsrE9GTPcWB7MvdM+6GgFXCsEvRxC2bVb92Nn8Jgs
         KfAaQhdkEHYAvi714+77wFcIiIgiUEkM9GdJKfT2N10MWjgCPLUKdls03D5ZnOpPrPNH
         pbCx8cSxWLFlInfTDmzXHJz7oy4IclRHonfKrHCz+h8wlpj3bfcLN3lYeLmsr4gLgPzV
         gVAhj5LoAff71EzR0oj+hTjMr2bBpbdl6wARqWbSA0YIcaRlrMaz+0M683b6OaVErYVc
         Us0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793951991; x=1794556791;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Yg0+W/ZUmL/NhPphu9P99TIgajYjwa9JI8GXTbbHRM=;
        b=2CDZa0vAy2v3KvIwy4yc267MOjps3HwUokL9EaVloHINtHb2g1xI4e/JbJNNuMP0V9
         wfxbdYq0Ii7QnWKLD49ZV6KVroAOJz7L6Nf9iYUAseuG7OL3D2ljoBvNQu9ArFX06TnB
         Q9wMVF8asUFsz/U2hjL+qVEk6Cb9BeuDU4+5nTwODu0dGm4iAQFi8u5qmHNZDWw7IrAF
         fCdzIN7opaWVQNOPYmYfikuGrIfVSvyidaJ5LlpByy22ed1+I5h1lWQUodzgT1B/yzFw
         QiPm5FFAf2L06L5o8Xm2dDo0DBGLLqbAudGFJDlFHQk2twz9mBFMeCDdQWXykVxyM2Bu
         zhHA==
X-Forwarded-Encrypted: i=1; AL+hErEXwawtq7Cvd1icMkMpkNg47oudlXyt3Ud9y6ilSfkP+L8zfunUqTAbJpfxYJ58cPs1U+2WE/2nR9WpOaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AEBKzDBSA0KlJanpXO0UlJHeq0Dddl0DbTWMHAwGGSDu7HJSv
	iXG5wwDDQrHTTVL3495ydlBmVVRuDFP2N9YAa5vAb/I6sn6aqp5s0zRBMZwtk9AA7Vu+KCugtli
	wSNo222Pf6p1SoouGhZJO6dLRDUIuiF1Zs741DrwPuesmNgZxnlK/4EhE5cf6I4k61+Y/teHPbA
	==
X-Gm-Gg: AYBFou0a/AkGvFMJf96QkKRHmZn7w9hYBjNC4pvpWkCcMQRO3DECpcgP/psNRXKfvFr
	YFgzJvVdz251P5k5DJ2ZItDoq2Y/21qFhIvgda7W1sF0x1ZJ2kM4So/qkqaxEzh+sJOJyLV4dYM
	FO+jdCwzDp6fVmuyMeiUW4NMepAEfl52UMqowU6eBCzFoNAZyqMqwWHPhvZWIs1Kp0yo5PWbnE2
	H8fR5s7zLXZFZ370mjmT50epG4iDQdxF9wR2BGxa3uPEBiktM0bbA1+CJIUxW5zY0aGA+fklc0J
	D7KrkebFx8qYgqM/+0jVvtl/K3FYuZ0J78YAsTl+Y9y/tnUbtN6e7gm5KogCVcFd50AagjvTwfY
	ZbVk8TuZOsm0xNwsiiSO8bcVNwDkw94I2nLnHh/6WacF3EXwFPd9f3DdcSMJ8Yp2QXM/TnXUwvY
	N0THoazs3th0pJAfvIucRG0i1xKOUJHtW7XqjH4S4ZvQauSj495Pov89lVWiGvjoWUkUaag5w=
X-Received: by 2002:a17:90b:254e:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b0db6fc409mr1573187a91.42.1793951991480;
        Thu, 05 Nov 2026 23:59:51 -0800 (PST)
X-Received: by 2002:a17:90b:254e:b0:3ab:e588:c295 with SMTP id 98e67ed59e1d1-3b0db6fc409mr1573164a91.42.1793951990984;
        Thu, 05 Nov 2026 23:59:50 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e4b3cf54sm321685a91.2.2026.11.05.23.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:59:50 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 13:28:48 +0530
Subject: [PATCH wireless-next v4 11/21] wifi: nl80211/cfg80211: define API
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
Message-Id: <20261106-smd-v4-11-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=PLeaavqC c=1 sm=1 tr=0 ts=6aed88f8 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kjsMnnNidseNLnQZ4twA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfXxNy/Hxnbvzd0
 N8ND5o3yqTh7btwVWExo9dnFsaj82M80J2WAG6ssMUu215dmzcSZSpNu/anG7XAJDWB9JRGhi0F
 icn6UjcFnYzKovJEflzduCVw3DNh/uo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzMSBTYWx0ZWRfX2M/R2bArCV7+
 zBe+6N16fTpuwY7SArCnAnzeLVAICa5rZ2mcf3CU4oJXsGg7ebVgPFEefqMUUklqGyXABLbuFvd
 XohZMu0gygAY8Tzc1KjHEVLaurNFrju3aPMdB+N/uRZcttHYGsJcMok4W/nwWda8Py1Htz3hnxM
 5p1e8bEcd3IrW5kQimqEU0yxYlViF5NxcDwUayexeiV6HBoZ+9Xx2hx/N3/dZksaxRi8MiLXXxd
 cr+pV2ztVkBCojEBZsSZSVXlsOhS7wfiujJ0495gZ5HY2Owure51Fg0wXQlebrce1e0Y7YJ1K9c
 X2QLp8BMLNrAtoTkxi8vq71L38GI9eEwU6Ejy7P0uKzDAILJqQ1m04huq1/pEvEtA9BiXTN3YYg
 5zIulf6/14aXVjUhSBni4wJYtSj8Y2MtnejfOPX1AIEW2b8qH2aGQ4RVrXenC4dO6GDnS3iNAQx
 t5pwhmopEfdecFWIXXA==
X-Proofpoint-GUID: eGRILYMYtfMms8E3xdHKwh_3eBmb2Tu9
X-Proofpoint-ORIG-GUID: eGRILYMYtfMms8E3xdHKwh_3eBmb2Tu9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060031

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


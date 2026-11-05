Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793907632;
	b=stvBW8pJmaEhxrHSgcs+Lv0FkVDfTZswFOrS47xtk2lVj6r+siZAr/JjCcbRqG/vb2iR
	 JA2akdWP2ZkbeT1FcwxCOQmf7m5eY5h+fFVWSYhVuAKoHeVykWFetZAzVJ//fWjynwBus
	 Fp18xsg4Rz3hinkUAP7CakHbAaMuj83V2ibF2KTqitlAFIHz/sZswP1oC8Qn49QufIAPR
	 Xitl011f/4pj3+gnZKnyiLnYMBd9W9e6SCj1vucR96RmXAm8bB9F+jxMnXuk5k/uZdX+H
	 t/LcK5lmiGe4qESXb1ttplzUrOptnfSuTzPFAdhwZHTzH+t7gdc4tq6arO8dCCAhBOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793907632;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=;
	b=UFVwJ72yve6E7U87uGpuUaQxIomK5zHh3ob7mkiB+9b4QRLuYWqkaW6DzYRgStSenRjG
	 IfSPQ3jnExf85slO6eXGxwirGrhnhXM+Mllk9aLfb67T97DqP+0c3jHGirAggyXJotF2H
	 0sSo/ojYSoO+IcZEwImyFegxzPEHAyPj/vrNinzJAevWKib9PHng6Rbqz9kIAejnAq3Ku
	 RWYsQx3Y2eSK1gKKI9b489imYWR3+EWWymVRimtVdNqevkSZYChnAaPEgypQeI0PnHDhG
	 AmnEb70x3tildP7mfVAHBHXilMGMufKT3YhZsBqztGFjwc8E/h5/x9RLQEfz1Brs1fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MmHyqTTn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QuKJAhO5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF356075322
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 19:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF356075322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MmHyqTTn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QuKJAhO5
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeDMD1474574
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 19:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=; b=MmHyqTTnvbps7mPL
	aJz+MPNemEn0W6ghS+7DnwFI8+rRaI7olwppDA4NuXeTmmwnDKbZi5JLO8S1lhTl
	ShN5McEJf+R3TG4Np8g0iK4/PFpmfMzZs7fOdiTGJsDnw/PbBJPCL9seifOgmVKl
	m1mAWULSyKiRMYdMo3jvo4JHIuSKo0XlgQ8Vr7XEY/KHPRzpYEWle831KmTfMU0W
	W4XJ0zMk1lxq/oNwUuLPeEvDGBzokC7GJrG06PBaxpGY5sq0F6IYgJrUsfPJzeyd
	U49LVddv87HwK6dEH0Ywa/DA5EvSQNJhzUpximwKWrvFrFhhlYLYyFwgu/c77V9C
	sRLIBw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcdbfhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:40:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso2343570eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 11:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793907630; x=1794512430; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=;
        b=QuKJAhO5/AGHrCBi3LKGAvZoR07ilaGb0hNWRxryEJTgQKSHPyVJfVdcRfb9JXsf1q
         v6Ehhx3YnbM9QkbY99pLJEA7m7zYSx5OZ1S9lnYPKNy1cYV4ihcBKTvDLZPqaxU+AMYT
         jgQxQAgli2HDl32nk1Ib/iLqzZspqtvtOGPrABxFLDF9W6zvNLNobOmHTxT83y6Bo5kf
         1LuPk0RyCEa+kPfkdGEmBFEEtxDmCyx4l/nWoFuTeynz9dKsxNOEVO4gtf8FqBBe24lS
         fwxRrnmw1CwC26J/4C/5l9uJTMnKQ2JqCtYz75dd9Ena0KuHkzQMQ62SDVYLnmf+p0I2
         IcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793907630; x=1794512430;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0QQjRlNHP0O5PIlx1OdLW0gzdTLxrN/TWp+snq7vsk=;
        b=nWwjDRLdGpirFko9/eyqwH58k/rJ9OkVottLFF5LMoHfGM1D72JYS8USYX8mEXOYeH
         NtMLNE8Xeu4lnWQkoHMFB4pHZ5rq0nLHlBoospv6CwFHKBJt5dk+EG0EOOtSu61jWilG
         ipzgj6K9vmcYG+xS4owo6v4cjtmNkyE3RVzJUDxe+2SZYjwp8LOhmnct78NhoMBFsm7C
         YA0PAmT9VFiJZM/Heok966YibZo2Z0cNIeyVO8Hzt4XvrLVIFVcBGNrEJPX7dwlyeWWv
         f8HOg8pex6ujMDNHnIjXj5iZtjTMpqa7ao4l7vOck9dt3ooTcMr8xDS8BP64x0gD85L3
         36Kw==
X-Forwarded-Encrypted: i=1; AKwUvBwbm4GI1FGR5MHK5iFP1eKm/4jbi84wpQzeYI59WMS3YhvU13uyFXxFjqV5k10IirbgXI2lWsJy/621n5Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7npH0mIMiaCaIt0lv2mDSF9BiIUtT7HLzz00LULLHlUTDMLZa
	d8UvJG7bPI/SSpsNG5cYBRHMj0zwdu8moFix7RSGfUCiF3A2UUZsCpaPvtc/4YouMwpxI+r+eWJ
	em/RoqlnIavObbk6n08Osa47VkdNyynYOc4Y55OUi5M8mxuNUXGqggLCEToxNouhjWg==
X-Gm-Gg: AYBFou3anNLdVQwkEDhBTv7o6Oe0Y0FbYwHNKYfFd9LpI8wcL6DnVwxNKo0npRDdqka
	1gbs3dFKCrHvNYgmLKSeuVpB4/b37bMnS+JZRn6//7JsmSmhbLLBrncOC5lMUUgRWaexVMiuIWw
	tTL+s4LZGq1T3vWxb+ht5ppplKlVn4j2h1pFRhdrhVy7h0F47csVa3RIC9+6dURBPTxRcFB6v51
	jIHV1l8bqlmzc1I5gxykDpjKUFQPdAyFcZ429QqQC76ldfGgrX2dtdMFjodKn7X1sCui0xuI7sT
	1/2IzbLa865L+qN77/UIV2Bj+g36zykhIvjuhSutc3U4U0CxEemiA9kr1QeCYlBp0+R3IbQzKOD
	BIbl1LKiX8qlZczN3ZLBu6i/lg6vA7ctzH7mMjMkCqC444ZHlBD0M6TWP3NUmpA5mgaqVnp9vD3
	gQeMQkzgaqTxGUOZxzYaE2FfBWGd5SqEFEkhdGs6fu/vl1hVN9T8xcNDgr8eSCO4C9bdpaaA==
X-Received: by 2002:a05:693c:808b:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36f773f204dmr165729eec.41.1793907629317;
        Thu, 05 Nov 2026 11:40:29 -0800 (PST)
X-Received: by 2002:a05:693c:808b:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-36f773f204dmr165679eec.41.1793907628582;
        Thu, 05 Nov 2026 11:40:28 -0800 (PST)
Received: from hu-pooventh-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72cc9b88sm357284eec.14.2026.11.05.11.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:40:28 -0800 (PST)
From: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 01:08:40 +0530
Subject: [PATCH wireless-next v3 05/21] wifi: nl80211: define interfaces
 for SMD BSS Transition context transfer
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
Message-Id: <20261106-smd-v3-5-1723950e3cf8@oss.qualcomm.com>
References: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
In-Reply-To: <20261106-smd-v3-0-1723950e3cf8@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        pooventhiran.g@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aecdbae cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=A4pAW7IlmD6AYZ-BFbAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: R42wDdXuXkJaIMG_ViXTjMCIJHoAjp6p
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX9rGFoYbv1hPI
 GLeZOMK0glz9PfwyN9cyM97eGkACWgEbuGCba59W3vAT3kXcmGisIEfOsz5mvnxo9KMAuqIu1A9
 vHqIQqmyiEzLazNqaW1U354KN33tLtI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA3OCBTYWx0ZWRfX2EfS3aoExogt
 gFcnwQ7H0eim5LwBKksK+LqXFwkrV7yoGrRxQoM1U7eBfmBazVVe/r1a3ttcOmB924fF1azutnZ
 UVCgNY1SAfNtlCKlqwBfjNkSsjevlEQ5k0SAcKtAOXeqVxQTaFkzTtNhi5C+GUKZwGGMob85JPX
 azdlq2r/ipzHHYwcExRTHR+ddszvZSDHYH3NHDEORMfIJhjpln2l1/o/QnWcQxCPsQbgm2PAr6i
 4yiwe3t2fiHxD9q6kNyWgOibotPIe6lmt75zcWNf52YH15e4T0YbZ3bYDs4n1VdNxjP4WDL6Ay0
 eS1FAgyFJvRZOH1BHRoUOZWhTpYvlglsnxWsM1LPdkBmnjtAFVdqSF39khlISIS15IVTWl2eakH
 sC/YEmc0T0BmOR7rGZeUaKA0TBcNrgqxbouVprQ1D9uZ1BmnmRqeEkQlwhaWdlTRzCf7D6g+KmG
 JP12aYYVX1XsxFMvLAw==
X-Proofpoint-ORIG-GUID: R42wDdXuXkJaIMG_ViXTjMCIJHoAjp6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050078

Define nl80211 attributes and policies required to pack SMD BSS Transition
context along with NL80211_CMD_FRAME to be sent to userspace, and to set
and get the context during roaming via current AP MLD and roaming via
target AP MLD. Without these, userspace will not be able to transport the
context to the target AP MLD, program the context on the target AP MLD TX
and RX queues, nor fetch the context on behalf of the target AP MLD if
the ST Execution frame is sent directly to the target.

Suggested-by: Jouni Malinen <jouni.malinen@oss.qualcomm.com>
Signed-off-by: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h | 190 +++++++++++++++++++++++++++++++++++++++++++
 net/wireless/nl80211.c       |  48 +++++++++++
 2 files changed, 238 insertions(+)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index 81c16ea2fd34..fbc23aca006e 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -375,6 +375,19 @@
  *	on the target AP MLD while creating the station entry.
  *	%NL80211_STA_FLAG_SMD_{EXEC_CURRENT,DL_DRAIN}, on the other hand, can be
  *	set using %NL80211_CMD_SET_STATION on the current AP MLD.
+ *
+ * Drivers can use %NL80211_ATTR_SMD_CTX to pack the dynamic context of the
+ * non-AP MLD along with the ST Preparation or ST Execution Request frames in
+ * the %NL80211_CMD_FRAME event.
+ *
+ * On the target AP MLD, this collected context, received in the
+ * userspace-managed backhaul between the AP MLDs, can be programmed using
+ * %NL80211_CMD_SET_SMD_CTX.
+ *
+ * In case the non-AP MLD executes directly with the target AP MLD, the current
+ * AP MLD can request the context from the driver on the target's behalf using
+ * %NL80211_CMD_GET_SMD_CTX and the response can be reported back using
+ * %NL80211_CMD_SMD_CTX_EVENT.
  */
 
 /**
@@ -1502,6 +1515,21 @@
  *	and multiple can be nested in %NL80211_ATTR_MLO_LINKS but then the
  *	update isn't atomic if any failures happen.
  *	Only supported with %NL80211_EXT_FEATURE_UPDATE_BEACON.
+ *
+ * @NL80211_CMD_SET_SMD_CTX: Set the SMD BSS Transition dynamic context for a
+ *	non-AP MLD sent from the current AP MLD on the target AP MLD managed by
+ *	an SMD-ME. This command carries %NL80211_ATTR_MLD_ADDR,
+ *	%NL80211_ATTR_SMD_CTX_TYPE and %NL80211_ATTR_SMD_CTX. The station must
+ *	be present on the target AP MLD in the "prepared" state with a default
+ *	key installed.
+ * @NL80211_CMD_GET_SMD_CTX: Get the SMD BSS Transition dynamic context for a
+ *	non-AP MLD associated to an AP MLD managed by an SMD-ME. This command
+ *	carries %NL80211_ATTR_MLD_ADDR and %NL80211_ATTR_SMD_CTX_TYPE.
+ * @NL80211_CMD_SMD_CTX_EVENT: Event reporting the collected SMD context
+ *	(requested via %NL80211_CMD_GET_SMD_CTX) to userspace. It carries
+ *	%NL80211_ATTR_MLD_ADDR, %NL80211_ATTR_SMD_CTX_TYPE, and
+ *	%NL80211_ATTR_SMD_CTX.
+ *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
  */
@@ -1784,6 +1812,10 @@ enum nl80211_commands {
 
 	NL80211_CMD_UPDATE_BEACON,
 
+	NL80211_CMD_SET_SMD_CTX,
+	NL80211_CMD_GET_SMD_CTX,
+	NL80211_CMD_SMD_CTX_EVENT,
+
 	/* add new commands above here */
 
 	/* used to define NL80211_CMD_MAX below */
@@ -3282,6 +3314,13 @@ enum nl80211_commands {
  * @NL80211_ATTR_SMD_ROAM_STA: Flag attribute to indicate that the station is
  *	created as part of SMD BSS Transition and not by typical association.
  *
+ * @NL80211_ATTR_SMD_CTX: Nested attribute associated with UHR SMD BSS
+ *	Transition data. Used with %NL80211_CMD_FRAME, %NL80211_CMD_SET_SMD_CTX,
+ *	and %NL80211_CMD_SMD_CTX_EVENT. See &enum nl80211_smd_ctx.
+ * @NL80211_ATTR_SMD_CTX_TYPE: u8 attribute specifying the type of SMD context.
+ *	Used along with %NL80211_CMD_FRAME, %NL80211_CMD_SET_SMD_CTX,
+ *	%NL80211_CMD_GET_SMD_CTX, and %NL80211_CMD_SMD_CTX_EVENT.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3892,6 +3931,9 @@ enum nl80211_attrs {
 	NL80211_ATTR_SMD_SUPPORT,
 	NL80211_ATTR_SMD_ROAM_STA,
 
+	NL80211_ATTR_SMD_CTX,
+	NL80211_ATTR_SMD_CTX_TYPE,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -9253,4 +9295,152 @@ enum nl80211_nan_peer_map_attrs {
 
 #define NL80211_NAN_SCHED_NOT_AVAIL_SLOT 0xff
 
+/**
+ * enum nl80211_smd_ctx_type - SMD Request Type values
+ *
+ * Used with %NL80211_ATTR_SMD_CTX_TYPE.
+ *
+ * @NL80211_SMD_CTX_TYPE_PREP: SMD BSS Transition (ST) Preparation.
+ * @NL80211_SMD_CTX_TYPE_EXEC: ST Execution.
+ * @NUM_SMD_CTX_TYPES: internal.
+ * @NL80211_SMD_CTX_TYPE_MAX: Max type of ST context.
+ */
+enum nl80211_smd_ctx_type {
+	NL80211_SMD_CTX_TYPE_PREP,
+	NL80211_SMD_CTX_TYPE_EXEC,
+
+	NUM_SMD_CTX_TYPES,
+	NL80211_SMD_CTX_TYPE_MAX = NUM_SMD_CTX_TYPES - 1,
+};
+
+/**
+ * enum nl80211_smd_ctx_ba_param - SMD Block Ack Context attributes
+ *
+ * @__NL80211_SMD_CTX_BA_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE: Required (u16) BA buffer size.
+ * @NL80211_SMD_CTX_BA_ATTR_POLICY: Required (u8) BA policy.
+ * @NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT: Flag attribute to indicate
+ *	AMSDU support.
+ * @NL80211_SMD_CTX_BA_ATTR_TIMEOUT: Required (u16) Block Ack timeout.
+ * @NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG: Flag attribute to indicate
+ *	fragmentation support.
+ * @NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL: Required (u8) HE fragmentation
+ *	level.
+ * @NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE: Required (u16) extended buffer size.
+ * @NL80211_SMD_CTX_BA_ATTR_WINSTARTO: Required (u16) Starting Sequence Number
+ *	of the BA window.
+ *	Applicable only with %NL80211_SMD_CTX_DL_ATTR_BA_PARAMS.
+ * @__NL80211_SMD_CTX_BA_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_BA_ATTR_MAX: Max attribute.
+ *
+ * Used with %NL80211_SMD_CTX_DL_ATTR_BA_PARAMS and
+ * %NL80211_SMD_CTX_UL_ATTR_BA_PARAMS.
+ */
+enum nl80211_smd_ctx_ba_param {
+	__NL80211_SMD_CTX_BA_ATTR_INVALID,
+	NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE,
+	NL80211_SMD_CTX_BA_ATTR_POLICY,
+	NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT,
+	NL80211_SMD_CTX_BA_ATTR_TIMEOUT,
+	NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG,
+	NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL,
+	NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE,
+	NL80211_SMD_CTX_BA_ATTR_WINSTARTO,
+
+	__NL80211_SMD_CTX_BA_ATTR_LAST,
+	NL80211_SMD_CTX_BA_ATTR_MAX = __NL80211_SMD_CTX_BA_ATTR_LAST - 1
+};
+
+/**
+ * enum nl80211_smd_ctx_dl - SMD Dynamic Context - DL direction
+ *
+ * @__NL80211_SMD_CTX_DL_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP: Optional (u8) TIDs included.
+ * @NL80211_SMD_CTX_DL_ATTR_SN: Optional (nested) next SN (u16) per TID to
+ *	be assigned to DL individually addressed frames.
+ * @NL80211_SMD_CTX_DL_ATTR_PN: Optional (binary) starting PN (max 16 bytes) for
+ *	DL individually addressed frames.
+ * @NL80211_SMD_CTX_DL_ATTR_BA_PARAMS: Optional (nested) Block Ack parameters,
+ *	nested array of TIDs (uses &enum nl80211_smd_ctx_ba_param).
+ * @NL80211_SMD_CTX_DL_ATTR_MGMT_SN: Optional (u16) next SN to be assigned for
+ *	DL individually addressed management frames.
+ * @NL80211_SMD_CTX_DL_ATTR_MGMT_PN: Optional (binary) starting PN
+ *	(max 16 bytes) for DL individually addressed management frames.
+ * @__NL80211_SMD_CTX_DL_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_DL_ATTR_MAX: Max attribute.
+ *
+ * Used with %NL80211_SMD_CTX_ATTR_DL.
+ */
+enum nl80211_smd_ctx_dl {
+	__NL80211_SMD_CTX_DL_ATTR_INVALID,
+	NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP,
+	NL80211_SMD_CTX_DL_ATTR_SN,
+	NL80211_SMD_CTX_DL_ATTR_PN,
+	NL80211_SMD_CTX_DL_ATTR_BA_PARAMS,
+	NL80211_SMD_CTX_DL_ATTR_MGMT_SN,
+	NL80211_SMD_CTX_DL_ATTR_MGMT_PN,
+
+	__NL80211_SMD_CTX_DL_ATTR_LAST,
+	NL80211_SMD_CTX_DL_ATTR_MAX = __NL80211_SMD_CTX_DL_ATTR_LAST - 1
+};
+
+/**
+ * enum nl80211_smd_ctx_ul - SMD Dynamic Context - UL direction
+ *
+ * @__NL80211_SMD_CTX_UL_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP: Optional (u8) TIDs included.
+ * @NL80211_SMD_CTX_UL_ATTR_SN: Optional (nested) last SN received per TID
+ *	for UL individually addressed frames.
+ * @NL80211_SMD_CTX_UL_ATTR_PN: Optional (nested) last PN received per TID
+ *	for UL individually addressed frames.
+ * @NL80211_SMD_CTX_UL_ATTR_BA_PARAMS: Optional (nested) Block Ack parameters
+ *	(uses &enum nl80211_smd_ctx_ba_param).
+ * @NL80211_SMD_CTX_UL_ATTR_MGMT_SN: Optional (u16) last SN received for
+ *	UL individually addressed management frames.
+ * @NL80211_SMD_CTX_UL_ATTR_MGMT_PN: Optional (binary, max 16 bytes) last PN
+ *	received for UL individually addressed management frames.
+ * @__NL80211_SMD_CTX_UL_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_UL_ATTR_MAX: Max attribute.
+ *
+ * Used with %NL80211_SMD_CTX_ATTR_UL.
+ */
+enum nl80211_smd_ctx_ul {
+	__NL80211_SMD_CTX_UL_ATTR_INVALID,
+	NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP,
+	NL80211_SMD_CTX_UL_ATTR_SN,
+	NL80211_SMD_CTX_UL_ATTR_PN,
+	NL80211_SMD_CTX_UL_ATTR_BA_PARAMS,
+	NL80211_SMD_CTX_UL_ATTR_MGMT_SN,
+	NL80211_SMD_CTX_UL_ATTR_MGMT_PN,
+
+	__NL80211_SMD_CTX_UL_ATTR_LAST,
+	NL80211_SMD_CTX_UL_ATTR_MAX = __NL80211_SMD_CTX_UL_ATTR_LAST - 1
+};
+
+/**
+ * enum nl80211_smd_ctx - SMD Context information
+ *
+ * Top-level container for SMD BSS Transition dynamic context.  Carried in
+ * %NL80211_ATTR_SMD_CTX with %NL80211_CMD_SET_SMD_CTX (target AP MLD) or
+ * with %NL80211_CMD_FRAME (current AP MLD reporting context to userspace)
+ * and %NL80211_CMD_SMD_CTX_EVENT (current AP MLD reporting the requested
+ * context on behalf of the target AP MLD).
+ *
+ * @__NL80211_SMD_CTX_ATTR_INVALID: Invalid attribute.
+ * @NL80211_SMD_CTX_ATTR_DL: Optional (nested) DL parameters.
+ *	See &enum nl80211_smd_ctx_dl.
+ * @NL80211_SMD_CTX_ATTR_UL: Optional (nested) UL parameters.
+ *	See &enum nl80211_smd_ctx_ul.
+ * @__NL80211_SMD_CTX_ATTR_LAST: Last attribute, used internally.
+ * @NL80211_SMD_CTX_ATTR_MAX: Max attribute.
+ */
+enum nl80211_smd_ctx {
+	__NL80211_SMD_CTX_ATTR_INVALID,
+	NL80211_SMD_CTX_ATTR_DL,
+	NL80211_SMD_CTX_ATTR_UL,
+
+	__NL80211_SMD_CTX_ATTR_LAST,
+	NL80211_SMD_CTX_ATTR_MAX = __NL80211_SMD_CTX_ATTR_LAST - 1
+};
+
 #endif /* __LINUX_NL80211_H */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 5df145ab4ab1..d2cd03d8b0c5 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -789,6 +789,51 @@ nl80211_nan_conf_policy[NL80211_NAN_CONF_ATTR_MAX + 1] = {
 	[NL80211_NAN_CONF_INSTANT_COMM] = { .type = NLA_FLAG },
 };
 
+static const struct nla_policy
+nl80211_smd_ctx_ba_policy[NL80211_SMD_CTX_BA_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_BA_ATTR_BUFF_SIZE] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_BA_ATTR_POLICY] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_BA_ATTR_AMSDU_SUPPORT] = { .type = NLA_FLAG },
+	[NL80211_SMD_CTX_BA_ATTR_TIMEOUT] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_BA_ATTR_EXT_NO_FRAG] = { .type = NLA_FLAG },
+	[NL80211_SMD_CTX_BA_ATTR_EXT_FRAG_LEVEL] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_BA_ATTR_EXT_BUFF_SIZE] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_BA_ATTR_WINSTARTO] = { .type = NLA_U16 },
+};
+
+static const struct nla_policy
+nl80211_smd_ctx_dl_policy[NL80211_SMD_CTX_DL_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_DL_ATTR_VALID_TID_BITMAP] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_DL_ATTR_SN] = { .type = NLA_NESTED },
+	[NL80211_SMD_CTX_DL_ATTR_PN] = { .type = NLA_BINARY,
+					 .len = IEEE80211_SMD_CTX_MAX_PN_LEN },
+	[NL80211_SMD_CTX_DL_ATTR_BA_PARAMS] =
+		NLA_POLICY_NESTED_ARRAY(nl80211_smd_ctx_ba_policy),
+	[NL80211_SMD_CTX_DL_ATTR_MGMT_SN] = { .type = NLA_U16 },
+};
+
+static const struct nla_policy
+nl80211_smd_ctx_ul_policy[NL80211_SMD_CTX_UL_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_UL_ATTR_VALID_TID_BITMAP] = { .type = NLA_U8 },
+	[NL80211_SMD_CTX_UL_ATTR_SN] = { .type = NLA_NESTED },
+	[NL80211_SMD_CTX_UL_ATTR_PN] = { .type = NLA_NESTED },
+	[NL80211_SMD_CTX_UL_ATTR_BA_PARAMS] =
+		NLA_POLICY_NESTED_ARRAY(nl80211_smd_ctx_ba_policy),
+	[NL80211_SMD_CTX_UL_ATTR_MGMT_SN] = { .type = NLA_U16 },
+	[NL80211_SMD_CTX_UL_ATTR_MGMT_PN] = {
+		.type = NLA_BINARY,
+		.len = IEEE80211_SMD_CTX_MAX_PN_LEN
+	},
+};
+
+static const struct nla_policy
+nl80211_smd_ctx_policy[NL80211_SMD_CTX_ATTR_MAX + 1] = {
+	[NL80211_SMD_CTX_ATTR_DL] =
+		NLA_POLICY_NESTED(nl80211_smd_ctx_dl_policy),
+	[NL80211_SMD_CTX_ATTR_UL] =
+		NLA_POLICY_NESTED(nl80211_smd_ctx_ul_policy),
+};
+
 static const struct netlink_range_validation nl80211_punct_bitmap_range = {
 	.min = 0,
 	.max = 0xffff,
@@ -1203,6 +1248,9 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_ASSOC_PROTECTED_TWT] = { .type = NLA_FLAG },
 	[NL80211_ATTR_SMD_SUPPORT] = { .type = NLA_FLAG },
 	[NL80211_ATTR_SMD_ROAM_STA] = { .type = NLA_FLAG },
+	[NL80211_ATTR_SMD_CTX] = NLA_POLICY_NESTED(nl80211_smd_ctx_policy),
+	[NL80211_ATTR_SMD_CTX_TYPE] =
+		NLA_POLICY_MAX(NLA_U8, NL80211_SMD_CTX_TYPE_MAX),
 };
 
 /* policy for the key attributes */

-- 
2.34.1


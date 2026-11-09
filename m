Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187686;
	b=3eM/0OTcHEOn2VmnbrE+E7n2fl/Wecr23zzCJM9F5tQpmXNeuXbWfzlfAjVgjg+QAttU
	 yRRY+CIjCjYlyHkx9aDnNEG7QRs07Ewb9wkhYCSLhFr2jmim6irzdhXKXjEGjzQufG8Jg
	 O5TG4gJBImjkAJBMlUoW3nEEKoRfm5xB0JmXnZn6PYpkz+FxjD+9fPUbDiJGEVz8iGhhu
	 B4Po6THwL2TRwUbbdSSzy+J302RuBDvkU8TDyNVy6ek0krsEQKgekjzZxvTrpUdaN+G3C
	 7bL//T69pP51ACdMGqnR6CUPW+CoRZKlUGlTGaiO7XkT1T/p6A3M5mmuw0W91a+HO0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187686;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TnVffv5ftnrKDypgYhjq08z0DBCZEXdFmLgCVQ0SdmQ=;
	b=0CSxqt1b/40JEr9auvhgZ7e/9HmOD7YUTksKFh5isaBouv2Gt/818G3aODKrMV46EPf0
	 fzSqVnpLP212D/CK/XiIZSsS8e17IWUGReJw+mXZTE8zIT3OIRaX1wO+lam5ibZz0XpuO
	 Piw2uLjZCdOIpyBw8HSLB5+9a4aYKwH0J2BFHRJZwSLZ19PhWZRGV2atN8Tqne1P9emvi
	 31842RoKpPVMPDbuq2UPNZViIMhzHnLIQTj04p2dE0XU4M6RfCRd2YOkg5Ssc5ycDMtrt
	 BElDPo4KcNBzCflI6ikyT+B71Bnj62JjTdwqNJYz9ZPsTcHNrsDd2+dtcwpglkUSOFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yifb31n3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hn0fOot+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5603B606CCD0
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 01:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5603B606CCD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yifb31n3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hn0fOot+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A90HF9x2890188
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 01:28:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TnVffv5ftnrKDypgYhjq08z0DBCZEXdFmLgCVQ0SdmQ=; b=Yifb31n3pd5tY4Id
	SOwL02WHhZN7Gxg/PLRBZiaW92q9fNL58x/JxorHJr1h26BCwC9P6E7W/zbBbDyH
	klJTQC3iw8FUHzG9PvAyy6kijnIZUiIBl4Y5HmW3r1Rrua6ads1VmA83e/xuTbo/
	xsCqPiGEXZZBjQEVbKYpofdgA/oIXl8Um/nn2AkEJwEJU2oHdTm2tX2byyj2odfg
	XRQm1PSAkpdE5ZT/y0xyUdh2CKcT5Z92Lcr/GCs8u65ugv+CsTRSFyr/pCn6j6ts
	7wAoU0hkTvHX3XEzJcVnX0ocN7qcmZ7Mu3WZRFKkeUqQbRMmd82MOqFuAtlUkZJE
	yxSspA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv2uc4rp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:28:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b09b223c70so264595a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 17:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794187684; x=1794792484; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TnVffv5ftnrKDypgYhjq08z0DBCZEXdFmLgCVQ0SdmQ=;
        b=Hn0fOot+LiZ/8zXFwSAa7Ga1sbiwrMY6jn1NiDJOS6/gFbODGIpRcefXEFCZVOBzxc
         jnx3cb2Fn+EZkCo9RlOY7Yzr+5I4ns9h3c0h1rDorzfEdwDw7mmw3Z7tj7DPQqWpVdWf
         kXWy9BaRkmTTeWupBCvX4AjlwphmhFNTLplQsjSCi7Wd6R2/ylPXxI1Hk+h0KPcw+WZR
         fUlFchQeC341eAaiyA/tvclHaC+bVofWRxtJtvN6A3QyDq+v/wH6oQiUx78VhAzx7NnJ
         UdLreWImNWYsQOdy53qC4PnSiyZdloNKGoOZeQW/kXtf+5SBF8BH2ENj+2nfbvSlIp8Z
         2EHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187684; x=1794792484;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TnVffv5ftnrKDypgYhjq08z0DBCZEXdFmLgCVQ0SdmQ=;
        b=S6Zm1REg0dKs/VYx9SbWN64SQ5CXm1JJiO0Pr/ol3B2Rvcvu1L44VRR5/MgPdfHe3G
         m4pwZC/kNJTb++gphsXgTTVWuucyxwGSO8To9QLfWMPM1jih0QgjjAqUpQS1KlyCk7jI
         Rvev/OVvP/tMdjmUi2I2Hnw2Ep1ySCZRVu7c8m8Gihz8YHo/iA4nhdUYUgMd9TVXVYDt
         cwrk7YF67GETvD6QmesatWL+h/5DtIrVHcGkZpM8WG89bDMiGupfLipQm/GBJuw0H2RO
         zJtFaa/meRun1BhLfnQ7qILvxfCbTMQXnHkgo1ywWqu/0KFxWQkSBRvg+dCwtklqDGMl
         bEJA==
X-Forwarded-Encrypted: i=1; AL+hErF5DU2IOS8gN6o6YKOE777JYPlYpmb2HP0SFoSgPjLeND9a5Y+BMibsa/Sd33Y5Eb/pNn12wMo1KFcg/ls=@vger.kernel.org
X-Gm-Message-State: APuU4Z8csiIk095pwhYuOgfEQKI2DLVfMZlgIKd+yQ1LsmTRKYb0aDqp
	HRM0+WTVV5GvMJrnuJdRJTb9sC6niI6e6Hru7PtxD/Ou9HOawDbQ+6cpxsP3ze1OYpC5iVJ8PZw
	8mstVobONbFk6n1eHW25UU8AWhLnP4EN8lUjizvFXgay4gd/ZcnOC4K36scymW8FDAJs=
X-Gm-Gg: AYBFou3vMgwAzKyqEoV13RRAZ7itc3Hphe8/JCn91DnvSw7pwNKPGP3hvMPO3h+pVPv
	Ize29zrKLIJ8NgG9Q39F+CwukFXbH3V3dsFLd/oVnX9I30cjpV2Wqv6JzBBDhgzF8Cn6ypvrgD3
	68qHtixMiNm2hh/+GdNysesd8JUjrLHMsoIItUlfx7WVYbDtjIAUrwwmBgcCwwhX0KCAtnPBni1
	xyaqLk3j6toxUTGd2hnBu+OgVfJihoAg9e74V8LaW9jOXmq+8WF9+mhMMwlv/PiMZhHAxC3Rb/o
	4CyZmTrYQACtQ4K3uqvJZDkBHFaUhiH5vXF/fDThdul6Z8ExRIhtNQwgfEJEG2YNVZfWPBUP3I1
	K2IIZOwVX5Pa4Wn+Mt+6XGy3N/WqSa3J1YvpT5SlWSSHtUpFKfDBMrstiFvFtNgovzHql
X-Received: by 2002:a17:90b:3c01:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b12d4b4a34mr2374688a91.30.1794187684160;
        Sun, 08 Nov 2026 17:28:04 -0800 (PST)
X-Received: by 2002:a17:90b:3c01:b0:3ad:b86d:dbad with SMTP id 98e67ed59e1d1-3b12d4b4a34mr2374673a91.30.1794187683644;
        Sun, 08 Nov 2026 17:28:03 -0800 (PST)
Received: from [10.64.68.243] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278d1191sm4983218a91.8.2026.11.08.17.27.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 17:28:02 -0800 (PST)
Message-ID: <02d06270-ce03-412c-a85f-4af8385de9b0@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 09:27:57 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] fix clock refcount imbalance for all Coresight
 platform drivers
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Proofpoint-ORIG-GUID: m9ztong2smlchcURwuahG0UxvRx_mULa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX06Q3RYwrmbRX
 kOuSUQXd/Iv+VS66PfVRkGICpbaAPt+MQwfBOKNMnq4Ynm2nXUAbPEnbR4dr3xUZpiPhU/thANG
 t64WuEAeMxrnqLm88KyNM3etx/CHW/o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAwNSBTYWx0ZWRfX3kz/8Jz5ewJ/
 1OF6Zg8pnzJv9C0Cuxht9ul5hL0GtXKcr+elQBokD/s5dI60pgAVULZr8/VxuZQrgAxN1FH7NEq
 KXh3bQEc+0leQgVgq2YHglMj/vzcib8YdQP+cscFuXDTChIQwhf/7Jte/uAUIGxQI7pKmeVlvBb
 Zf4m7RyR6MArIvrRuDxgC1akLczprUiH9r88FWdFq2MTrqFqlZZMeLhw6q3UUxQTAW5Jt8gtFQ3
 M21a7CGhbMQYj50JUbsDrNnuDswklO7KVHwM8/e/0Ok0Ssl8sABDjVLi/YaDIWp/VTJwNndBdGJ
 FKO/SvnTaspc95EnyEiXAuxoRjt0DJP29y3JkfiSmh1tgk1HvEs+HJH/3eCPV6SwEQJ1PJyR9q/
 axdIdj/FA4MvshMosEEihVZkW7QP6bgRvbCcigYAH/RxPJi0If0O+SiQrgT6PTxTzmyesOwecME
 DUNmjgojjByo0orJBGQ==
X-Proofpoint-GUID: m9ztong2smlchcURwuahG0UxvRx_mULa
X-Authority-Analysis: v=2.4 cv=f+rdl+yM c=1 sm=1 tr=0 ts=6af121a5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iLbzAW0jkWTVcrWTFk4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090005

DQoNCk9uIDcvMTAvMjAyNiA5OjE0IEFNLCBKaWUgR2FuIHdyb3RlOg0KPiBGb3VuZCBhIGNs
b2NrIGltYmFsYW5jZSBpc3N1ZSB3aGVuIHJlbW92ZSB0aGUgQ1RDVSBtb2R1bGUuDQo+IA0K
PiBjb3Jlc2lnaHRfZ2V0X2VuYWJsZV9jbG9ja3MoKSBlbmFibGVzIHRoZSBwcm9ncmFtbWlu
ZyBjbG9jayBhbmQgdGhlDQo+IG9wdGlvbmFsIEFUIGNsb2NrIHRocm91Z2ggZGV2bV9jbGtf
Z2V0X29wdGlvbmFsX2VuYWJsZWQoKSwgd2hpY2ggYWxzbw0KPiByZWdpc3RlcnMgYSBkZXZt
IGFjdGlvbiB0byBjYWxsIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIHdoZW4gdGhlIGRyaXZl
cg0KPiBkZXRhY2hlcy4NCj4gDQo+IEFmdGVyIHByb2JlLCBwbV9ydW50aW1lX3B1dCgpIGFs
bG93cyB0aGUgZGV2aWNlIHRvIHN1c3BlbmQgYW5kIHRoZQ0KPiBydW50aW1lIHN1c3BlbmQg
Y2FsbGJhY2sgZGlzYWJsZXMgdGhlIHNhbWUgY2xvY2tzLiBEdXJpbmcgcmVtb3ZlIHRoZQ0K
PiBkZXZpY2UgaXMgbGVmdCBydW50aW1lIHN1c3BlbmRlZCwgc28gcG1fcnVudGltZV9kaXNh
YmxlKCkgZnJlZXplcyBpdA0KPiB3aXRoIHRoZSBjbG9ja3MgYWxyZWFkeSBkaXNhYmxlZC4g
VGhlIGRldm0gY2xlYW51cCB0aGF0IHJ1bnMgYWZ0ZXJ3YXJkcw0KPiBjYWxscyBjbGtfZGlz
YWJsZV91bnByZXBhcmUoKSBhIHNlY29uZCB0aW1lLCB1bmRlcmZsb3dpbmcgdGhlIGNsb2Nr
DQo+IGVuYWJsZSByZWZjb3VudC4NCj4gDQo+IFJlc3VtZSB0aGUgZGV2aWNlIHdpdGggcG1f
cnVudGltZV9nZXRfc3luYygpIGJlZm9yZSB0ZWFyaW5nIGl0IGRvd24gc28NCj4gdGhlIGNs
b2NrcyBhcmUgZW5hYmxlZCBhZ2FpbiBhbmQgYmFsYW5jZSB0aGUgZGV2bS1tYW5hZ2VkIGRp
c2FibGUuIFRoZW4NCj4gcG1fcnVudGltZV9zZXRfc3VzcGVuZGVkKCkgYW5kIHBtX3J1bnRp
bWVfcHV0X25vaWRsZSgpIGxlYXZlIHRoZSBkZXZpY2UNCj4gaW4gYSBjb2hlcmVudCBydW50
aW1lIFBNIHN0YXRlIChzdXNwZW5kZWQsIHVzYWdlIGNvdW50IGJhbGFuY2VkKSBvbmNlDQo+
IHRoZSBkZXZtIGFjdGlvbiBoYXMgZGlzYWJsZWQgdGhlIGNsb2Nrcy4NCj4gDQoNCg0KR2Vu
dGxlIHBpbmcNCg0KDQo+IENhbGx0cmFjZToNCj4gDQo+IFsgIDE5NC4wNzQwMTVdIC0tLS0t
LS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPiBbICAxOTQuMDc4Nzc5XSBxZHNz
IGFscmVhZHkgZGlzYWJsZWQNCj4gWyAgMTk0LjA4MjIxMF0gV0FSTklORzogZHJpdmVycy9j
bGsvY2xrLmM6MTE4OCBhdCBjbGtfY29yZV9kaXNhYmxlKzB4MjM4LzB4MjQwLCBDUFUjNDog
cm1tb2QvNTA4DQo+IFsgIDE5NC4wOTA5NzZdIE1vZHVsZXMgbGlua2VkIGluOiBjb3Jlc2ln
aHRfY3RjdSgtKSBzbmRfc29jX2hkbWlfY29kZWMgc25kX3NvY19jb3JlIHNuZF9jb21wcmVz
cyBzbmRfcGNtX2RtYWVuZ2luZSBzbmRfcGNtIHNuZF90aW1lciBzbmQgc291bmRjb3JlIDgw
MjFxIGdhcnAgbXJwIHBoeV9xY29tX2VkcCBzdHAgYWZfYWxnIGxsYyBhbng3NjI1IHR5cGVj
IHBjaV9wd3JjdHJsX3B3cnNlcSBoY2lfdWFydCBxY29tX2lyaXMgdjRsMl9tZW0ybWVtIGJ0
cWNhIGJ0YmNtIHFjb21fcG9uIHZpZGVvYnVmMl9kbWFfY29udGlnIHJ0Y19wbTh4eHggbnZt
ZW1fcWNvbV9zcG1pX3NkYW0gcWNvbV9zcG1pX3RlbXBfYWxhcm0gdmlkZW9idWYyX21lbW9w
cyBxcnRyIHZpZGVvYnVmMl92NGwyIGJsdWV0b290aCBtc20gcWNvbV9zdGF0cyBwd3JzZXFf
cWNvbV93Y24gdWJ3Y19jb25maWcgdmlkZW9kZXYgb2NtZW0gZWNkaF9nZW5lcmljIGRybV9n
cHV2bSB2aWRlb2J1ZjJfY29tbW9uIGRybV9leGVjIGdwdV9zY2hlZCBxY29tX3E2djVfcGFz
IGtwcCBtYXJ2ZWxsIHZpZGVvY2Nfc2E4Nzc1cCBjYW1jY19zYTg3NzVwIGVjYyBkcm1fZHBf
YXV4X2J1cyBkaXNwY2MwX3NhODc3NXAgc3BpX2dlbmlfcWNvbSBpMmNfcWNvbV9nZW5pIGxs
Y2NfcWNvbSBtYyBxY29tX3JlZmdlbl9yZWd1bGF0b3IgcGh5X3Fjb21fc25wc19mZW10b192
MiBwaHlfcWNvbV9xbXBfdXNiIGljY19id21vbiBwaHlfcWNvbV9zZ21paV9ldGggZHdtYWNf
cWNvbV9ldGhxb3MgcWNvbV9waWxfaW5mbyBncHVjY19zYTg3NzVwIHFjb21fcTZ2NSBzdG1t
YWNfcGxhdGZvcm0gc3RtbWFjIHVmc19xY29tIHFjb21fc3lzbW9uIGRybV9kaXNwbGF5X2hl
bHBlciBxY29tX2NvbW1vbiBwY3NfeHBjcyBwaHlsaW5rIGNlYyBxY29tX2dsaW5rX3NtZW0g
cWNyeXB0byBkcm1fY2xpZW50X2xpYiBtZHRfbG9hZGVyIGRpc3BjYzFfc2E4Nzc1cCBxbWlf
aGVscGVycyBwaHlfcWNvbV9xbXBfdWZzIGxpYmRlcyBxY29tX2ljZSBkaXNwbGF5X2Nvbm5l
Y3RvciBwaHlfcWNvbV9xbXBfcGNpZQ0KPiBbICAxOTQuMDkxMTMwXSAgcWNvbV93ZHQgcWNv
bXRlZSBudm1lbV9yZWJvb3RfbW9kZSBpY2Nfb3NtX2wzIHFjb21fcm5nIGRybV9rbXNfaGVs
cGVyIGNmZzgwMjExIHJma2lsbCBzb2NpbmZvIGZ1c2UgZHJtIGJhY2tsaWdodCBzdG1fcF9i
YXNpYw0KPiBbICAxOTQuMTk2MTI0XSBDUFU6IDQgVUlEOiAwIFBJRDogNTA4IENvbW06IHJt
bW9kIE5vdCB0YWludGVkIDcuMS4wLW5leHQtMjAyNjA2MjMtMDAwMDgtZ2E0NjcxMzI4YmEz
NiAjODMxIFBSRUVNUFQNCj4gWyAgMTk0LjIwNjU2Nl0gSGFyZHdhcmUgbmFtZTogUXVhbGNv
bW0gU0E4Nzc1UCBSaWRlIChEVCkNCj4gWyAgMTk0LjIxMTc3MV0gcHN0YXRlOiA2MDQwMDBj
NSAoblpDdiBkYUlGICtQQU4gLVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZUEU9LS0pDQo+IFsg
IDE5NC4yMTg5MzhdIHBjIDogY2xrX2NvcmVfZGlzYWJsZSsweDIzOC8weDI0MA0KPiBbICAx
OTQuMjIzNDI2XSBsciA6IGNsa19jb3JlX2Rpc2FibGUrMHgyMzgvMHgyNDANCj4gWyAgMTk0
LjIyNzkwOF0gc3AgOiBmZmZmODAwMDg4OWZiYjQwDQo+IFsgIDE5NC4yMzEzMjddIHgyOTog
ZmZmZjgwMDA4ODlmYmI0MCB4Mjg6IGZmZmYwMDAwOTcyZWI1ODAgeDI3OiAwMDAwMDAwMDAw
MDAwMDAwDQo+IFsgIDE5NC4yMzg2NjJdIHgyNjogMDAwMDAwMDAwMDAwMDAwMCB4MjU6IDAw
MDAwMDAwMDAwMDAwMDAgeDI0OiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsgIDE5NC4yNDU5OTVd
IHgyMzogZmZmZmQxODFkM2RlNDYyMCB4MjI6IGZmZmY4MDAwODg5ZmJjMjggeDIxOiBmZmZm
MDAwMDgyMzgyODEwDQo+IFsgIDE5NC4yNTMzMjJdIHgyMDogZmZmZjAwMDA4MjMzNGEwMCB4
MTk6IGZmZmYwMDAwODIzMzRhMDAgeDE4OiAwMDAwMDAwMDAwMDAwMDA2DQo+IFsgIDE5NC4y
NjA2NThdIHgxNzogZmZmZmQxODFkMjkzZmIxOCB4MTY6IGZmZmZkMTgxZDI5NWMzYzggeDE1
OiBmZmZmODAwMDg4OWZiNTUwDQo+IFsgIDE5NC4yNjc5OTFdIHgxNDogMDAwMDAwMDAwMDAw
MDAwMCB4MTM6IGZmZmZkMTgxZDRlZWE2MjAgeDEyOiAwMDAwMDAwMDAwMDAwNGNmDQo+IFsg
IDE5NC4yNzUzNDZdIHgxMTogMDAwMDAwMDAwMDAwMGU2ZCB4MTA6IGZmZmZkMTgxZDRmNDI2
MjAgeDkgOiBmZmZmZDE4MWQ0ZWVhNjIwDQo+IFsgIDE5NC4yODI2NzZdIHg4IDogM2ZmZmZm
ZmZmZmZmZWZmZiB4NyA6IGZmZmZkMTgxZDRmNDI2MjAgeDYgOiBiZmZmZmZmZmZmZmZmMDAw
DQo+IFsgIDE5NC4yOTAwMDddIHg1IDogZmZmZjAwMGVhZDk3NDI0OCB4NCA6IDAwMDAwMDAw
MDAwMDAwMDAgeDMgOiBmZmZmMmU4Y2Q5NjExMDAwDQo+IFsgIDE5NC4yOTczMzhdIHgyIDog
MDAwMDAwMDAwMDAwMDAwMCB4MSA6IDAwMDAwMDAwMDAwMDAwMDAgeDAgOiBmZmZmMDAwMDk3
MmViNTgwDQo+IFsgIDE5NC4zMDQ2NzFdIENhbGwgdHJhY2U6DQo+IFsgIDE5NC4zMDcxOTld
ICBjbGtfY29yZV9kaXNhYmxlKzB4MjM4LzB4MjQwIChQKQ0KPiBbICAxOTQuMzExNjg3XSAg
Y2xrX2Rpc2FibGUrMHgzMC8weDRjDQo+IFsgIDE5NC4zMTUxOTJdICBjbGtfZGlzYWJsZV91
bnByZXBhcmUrMHgxOC8weDMwDQo+IFsgIDE5NC4zMTk1OTZdICBkZXZtX2Nsa19yZWxlYXNl
KzB4MjQvMHgzYw0KPiBbICAxOTQuMzIzNTc4XSAgZHJfbm9kZV9yZWxlYXNlKzB4MWMvMHgy
OA0KPiBbICAxOTQuMzI3NDY2XSAgcmVsZWFzZV9ub2RlcysweDVjLzB4OTANCj4gWyAgMTk0
LjMzMTE0N10gIGRldnJlc19yZWxlYXNlX2FsbCsweDkwLzB4MTA0DQo+IFsgIDE5NC4zMzUz
NjRdICBkZXZpY2VfdW5iaW5kX2NsZWFudXArMHgyYy8weDg0DQo+IFsgIDE5NC4zMzk3NjJd
ICBkZXZpY2VfcmVsZWFzZV9kcml2ZXJfaW50ZXJuYWwrMHgyMDAvMHgyM2MNCj4gWyAgMTk0
LjM0NTE1M10gIGRyaXZlcl9kZXRhY2grMHg0Yy8weDk0DQo+IFsgIDE5NC4zNDg4MzVdICBi
dXNfcmVtb3ZlX2RyaXZlcisweDZjLzB4YmMNCj4gWyAgMTk0LjM1Mjg3Ml0gIGRyaXZlcl91
bnJlZ2lzdGVyKzB4MzAvMHg2MA0KPiBbICAxOTQuMzU2OTE0XSAgcGxhdGZvcm1fZHJpdmVy
X3VucmVnaXN0ZXIrMHgxNC8weDIwDQo+IFsgIDE5NC4zNjE3NTNdICBjdGN1X2RyaXZlcl9l
eGl0KzB4MTgvMHhkZjggW2NvcmVzaWdodF9jdGN1XQ0KPiBbICAxOTQuMzY3MzA4XSAgX19h
cm02NF9zeXNfZGVsZXRlX21vZHVsZSsweDFiYy8weDI5OA0KPiBbICAxOTQuMzcyMjQwXSAg
aW52b2tlX3N5c2NhbGwrMHg1NC8weDEwYw0KPiBbICAxOTQuMzc2MTE0XSAgZWwwX3N2Y19j
b21tb24uY29uc3Rwcm9wLjArMHhjMC8weGUwDQo+IFsgIDE5NC4zODA5NTZdICBkb19lbDBf
c3ZjKzB4MWMvMHgyOA0KPiBbICAxOTQuMzg0Mzc0XSAgZWwwX3N2YysweDU0LzB4M2EwDQo+
IFsgIDE5NC4zODc2MjZdICBlbDB0XzY0X3N5bmNfaGFuZGxlcisweGEwLzB4ZTQNCj4gWyAg
MTk0LjM5MTk1MV0gIGVsMHRfNjRfc3luYysweDE5OC8weDE5Yw0KPiANCj4gU2lnbmVkLW9m
Zi1ieTogSmllIEdhbiA8amllLmdhbkBvc3MucXVhbGNvbW0uY29tPg0KPiAtLS0NCj4gQ2hh
bmdlcyBpbiB2MzoNCj4gLSBldG00eDogYmFpbCBvdXQgd2l0aCBXQVJOX09OKCkgd2hlbiBk
cnZkYXRhIGlzIG1pc3NpbmcgaW5zdGVhZCBvZg0KPiAgICBzaWxlbnRseSBza2lwcGluZyB0
ZWFyZG93biwgYW5kIGNhbGwgZXRtNF9yZW1vdmVfZGV2KCkgYWZ0ZXINCj4gICAgcG1fcnVu
dGltZV9nZXRfc3luYygpIHNvIHRoZSBkZXZpY2UgaXMgcmVzdW1lZCBiZWZvcmUgaXQgaXMg
dG9ybiBkb3duLg0KPiAtIGNvbGxlY3QgcmV2aWV3ZWQtYnkgdGFnIGZyb20gTGVvLg0KPiAt
IExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjA3MDItZml4LWNs
b2NrLXJlZmNvdW50LXVuYmFsYW5jZS12Mi0wLTIzODNmYmI5OTUyZUBvc3MucXVhbGNvbW0u
Y29tDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIEJhbGFuY2UgdGhlIHJ1bnRpbWUgUE0g
c3RhdGUgaW4gdGhlIHJlbW92ZSBwYXRoOiBhZnRlcg0KPiAgICBwbV9ydW50aW1lX2dldF9z
eW5jKCkgYW5kIHBtX3J1bnRpbWVfZGlzYWJsZSgpLCBhbHNvIGNhbGwNCj4gICAgcG1fcnVu
dGltZV9zZXRfc3VzcGVuZGVkKCkgYW5kIHBtX3J1bnRpbWVfcHV0X25vaWRsZSgpIHNvIHRo
ZSBkZXZpY2UgaXMNCj4gICAgbGVmdCBzdXNwZW5kZWQgd2l0aCBhIGJhbGFuY2VkIHVzYWdl
IGNvdW50IG9uY2UgdGhlIGRldm0gYWN0aW9uIGhhcw0KPiAgICBkaXNhYmxlZCB0aGUgY2xv
Y2tzLg0KPiAtIFBpY2tlZCB1cCBSZXZpZXdlZC1ieSBmcm9tIFllb3JldW0gWXVuIG9uIHBh
dGNoIDEuDQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2
MDcwMS1maXgtY2xvY2stcmVmY291bnQtdW5iYWxhbmNlLXYxLTAtMzIxZGM2M2MxZjkwQG9z
cy5xdWFsY29tbS5jb20NCj4gDQo+IC0tLQ0KPiBKaWUgR2FuICgyKToNCj4gICAgICAgIGNv
cmVzaWdodDogRml4IGNsb2NrIHJlZmNvdW50IGltYmFsYW5jZSBvbiBwbGF0Zm9ybSByZW1v
dmUNCj4gICAgICAgIGNvcmVzaWdodDogdG5vYzogRml4IGNsb2NrIHJlZmNvdW50IGltYmFs
YW5jZSBvbiBwbGF0Zm9ybSByZW1vdmUNCj4gDQo+ICAgZHJpdmVycy9od3RyYWNpbmcvY29y
ZXNpZ2h0L2NvcmVzaWdodC1jYXR1LmMgICAgICAgfCAgOCArKysrKysrKw0KPiAgIGRyaXZl
cnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtY3B1LWRlYnVnLmMgIHwgIDggKysr
KysrKysNCj4gICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWN0Y3Ut
Y29yZS5jICB8ICA4ICsrKysrKysrDQo+ICAgZHJpdmVycy9od3RyYWNpbmcvY29yZXNpZ2h0
L2NvcmVzaWdodC1ldG00eC1jb3JlLmMgfCAxMyArKysrKysrKysrKy0tDQo+ICAgZHJpdmVy
cy9od3RyYWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC1mdW5uZWwuYyAgICAgfCAgOCArKysr
KysrKw0KPiAgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtcmVwbGlj
YXRvci5jIHwgIDggKysrKysrKysNCj4gICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQv
Y29yZXNpZ2h0LXN0bS5jICAgICAgICB8ICA4ICsrKysrKysrDQo+ICAgZHJpdmVycy9od3Ry
YWNpbmcvY29yZXNpZ2h0L2NvcmVzaWdodC10bWMtY29yZS5jICAgfCAgOCArKysrKysrKw0K
PiAgIGRyaXZlcnMvaHd0cmFjaW5nL2NvcmVzaWdodC9jb3Jlc2lnaHQtdG5vYy5jICAgICAg
IHwgIDggKysrKysrKysNCj4gICBkcml2ZXJzL2h3dHJhY2luZy9jb3Jlc2lnaHQvY29yZXNp
Z2h0LXRwaXUuYyAgICAgICB8ICA4ICsrKysrKysrDQo+ICAgMTAgZmlsZXMgY2hhbmdlZCwg
ODMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gLS0tDQo+IGJhc2UtY29tbWl0
OiBiZTVjOTNmYTY3NGYwZmMzYzhmMzU5YzIxNDNhYmNlNmJiYjQyMmU2DQo+IGNoYW5nZS1p
ZDogMjAyNjA3MDEtZml4LWNsb2NrLXJlZmNvdW50LXVuYmFsYW5jZS1lN2M0NjcxMzZhODYN
Cj4gDQo+IEJlc3QgcmVnYXJkcywNCg0K

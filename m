Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993586;
	b=3LJJvS3bJzdCrHaZHr+2fhLI3z3voRkfBW/58JYi7/C7sFjrA/f69dYaVpYeCJ8jSRwA
	 QIACtS5xqHfnptfnZQ0q6ekphMfrOizFa0IOxlXar+1ku0J0ltMIE0+YCeJFO6LnOoyZK
	 eb02tkG4Y5yDBSfaRbRlXNmlDin9MP/bZsH00XfwA098os/wuicz3+UfOsOC6WNOxliL5
	 C/RxWlUeyKEEcSW1AaVXvMOf8y8uEzIJlO4eT2jmvANQ5hH1YZZJ4MCblGqhMyse2DG89
	 h/KgTNYcTFOOdMrBexByCk4B8RqLX50Kjyg2v6nGV6XtlmcnKNj8tnK6icGICQnXQXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=;
	b=GG/3VxCnUpyQqQMqtZCxZ3s9v1m3Pbcsu3n2BJjfEiDqhCJ7pqVotXhA13U788/vWpk4
	 jUN/TPI74mjlaHsPOXE1qIK0vToYPDNfVjprwjdVLos3P71mgsivoSvBl6QuM+b7ygzwX
	 d4iuACLSbBv3HT9HzKD6mWHR8QcGlHKwSjrU+9tYfDkfypkhhR70fHeAe64fs5dkYCxfC
	 T9Jld7rYZxtAeGz4rJbdM8apNYcxuJDpAQeMIdSuflZhqvvwD+m1yUf8S77zaWDVuEZLt
	 kktRHx8hmZMHDZ6FSjqaSKo1cTPeUvYN9Ls/pc2SBaNUUUp16MQ1xO5FehNVjGs+wnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TKAdjAT/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvOPeJg9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8EE3606A32D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:46:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8EE3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TKAdjAT/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvOPeJg9
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b70d1907915
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=; b=TKAdjAT/NFKxQ85q
	4Uj4JIxmCtBzzE4PAxeAYekjoJLotQQuPLLBm5IxQ69bEFKWhsXCzUB4O6p0jfLO
	R7re/X6NTyMr/tifE3X+vkPzSTthx1epnH/Wy35ufrnvDExjC89TQXVUf73PRuEt
	w0kvVVNHRo02R546Tz9c+mCoXIvvN+CX85NqBt8Hndm68PNBO1z4o3fHJF83e+jq
	ps0CSeiTvnQ8OAMomF6gKom9OzlDhsIDSf1gsDPp9XLB8603XU4WK83/NdLPvlK6
	KrHBJVhdcZk3lc5UmAfmyAXsBR1hZ4XKm84VkDZ4ifXAxqSdbAJGhCf5NNMFfZX2
	h0ARiQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gn0na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:46:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so1004028a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792993583; x=1793598383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=;
        b=AvOPeJg9BtggZeEsWwa3zL5bgueWgKQqYe/UkWh3dFiiJRxggZUu5HeW7yMAmIzEN4
         8w+wnD2z4+eP+5RskOfIe7YfpjAROypKbeikjnmrpwq0bJWJ6eL6NMM6p8fH8N9tWiTj
         ZgpeR4iC2P6Nas9lrYUukEGs+xYxG5uO/5GdE2LOo18jerQDzh4DFUXrZ2X3mtFWQxvA
         YPuIeABRw+PY+OHeDJ5Jou+VeG5GzItRftlgnjtTNEj5pa1YpBFbwHbEGB7WRR7ghmbF
         3FjD0+dWpdT6ETO74rNGi0kfrPyUS05zCMtuZ6iROLt+VpL7wUYZeMaMllajLOvIAoZL
         zlrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993583; x=1793598383;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCaEBLM8TF0N7QOs/wlJYrgcdnAFOY0k4hubewGb+Zs=;
        b=fJO0e80pgq4kMLVKBcPn0R2ioSHl/hb9qNuA+fvZqC/NCEAKDknm5Eo6/HdXbvnySL
         E7BF1aaLAW4PsgcH4akgvw6WcfJ9YM1MXnwHxObUfgSWDmht0QK5jkpTCHHTRb0pxZnt
         VS8N/kyL9SdNk/pD/+8HyyJAxMUQCVL86L5+IfcSSeJ6p1caOaAvjnC8hJYspWSs2Hup
         NzOzxKhb8Lx3SphZAFs6KlcmGQpMk0l5i/bRKf423YREvsRiYTQGLTnFPz91y4yIBg7j
         s9mSHMpF+E9EuRfXD0LGR+/tdzgAkpxovyvu2XQYGtpN8BLFW7Uk3zNVZ1O7BALQwDiS
         4jeA==
X-Forwarded-Encrypted: i=1; AKwUvByBrc8ZQTemu0MCW3G8qlss0uA5WuO0ROrDlHhXz+PHpeEgDV0OUC7oVtYTACSoZ8zFrD93oYDh4MVBEyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJqG5y82eve3fUNjh+vpNm/PxATJC204VESYXLRbhhPpGQATaQ
	yF3pAaAAvSLk1QxW8j0hCYGG4N6hr7Uael2oiWFOaelLDkypxg8L1S0SoUx0s+ukagKYubdELfU
	tzlhxAaD8deBjAt6vzF7FNNaJ7fewYhOhU8X7nB3vKgL8ywx163BpLuWM1MQtGEMDvMQ=
X-Gm-Gg: AYBFou2Hf00J9zhExgJj4Nqw50re/sY58OHDDjsX3FNUfa5nbqZqWYSY+idMogrgRD3
	ytzvNJTTKET9r1HlL2l2WaRS6V4tzL9H9WYBS/kS9YHBTdINNU7JSFMDNmfsQOOh0JcgcrsTysN
	SFgP70Bi5pIU9AKdZIhjOGurffib0Qo6iZJnIP2u14XSmaZWUmQGiZNcxP6eCZ6uiSEek2hi2RE
	pmV8v1Fc7+yvlsv/thIuZdUDUuBsFNDP0VxTjVaf7NtAb4k6VfAJQsWS/pNMlnHagPNrMfUekOH
	QibKDnYGh4tcvjAjAcsNGunhameWoYbc32xaj2VGkLQBTXqtZNNI1CQA+vQOUg2NNTiUZ8TQLXD
	KgQgS3AvmKFzz978vQLmWUG2gENJNqa9KJcuOU8Qqg6a66wzjmSv97j3AlDGk1s97Np3PJlp+
X-Received: by 2002:a17:90b:1b01:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3adeafbb11bmr4747441a91.38.1792993583540;
        Sun, 25 Oct 2026 22:46:23 -0700 (PDT)
X-Received: by 2002:a17:90b:1b01:b0:3ab:1b1c:8a70 with SMTP id 98e67ed59e1d1-3adeafbb11bmr4747431a91.38.1792993583138;
        Sun, 25 Oct 2026 22:46:23 -0700 (PDT)
Received: from [10.133.33.143] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeba32f70sm6741206a91.1.2026.10.25.22.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:46:22 -0700 (PDT)
Message-ID: <d4e86e92-9cf9-4fbb-8f36-56db9c6f9a8d@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:46:19 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: set MSDU payload correctly
To: Kang Yang <kang.yang@oss.qualcomm.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261020-msdupayload-v1-1-1ca9a5936727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q0KCodK8L1TJaOovtV6Robyt4UtndRPJ
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adee930 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=grpZdo2CoZbIzhDbOCAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: q0KCodK8L1TJaOovtV6Robyt4UtndRPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfXzHpY00PuRJJ4
 H/KHDTC3scS6MrsVpYR86GcSnzyk7UvsFNv7mzpWXoWzT9iV2NlZ3fIskfxFCGQNt5GjGq+s02f
 o5scWqhOod29fkmLUhB2tfOduUD98+/4Mk1K3hGDGLeHOdxdY0HhgxudjoscpOU99vDakbST+ho
 wuXSphjZqvSPJaWIy4Hev5oCAUqhCiNC0nGH1eo+0uDpEgsoupgeaBVY6d3Fg1rPzax4kVvIV6Z
 XWD/oWvbhzkucWupUzZ/zLp0DkupwwA1LEvrjZJRBdxTY1r+4RaSoFCggp2Xwdd5GVd6HLeJdbu
 /0DgYFr9LXhO6bcgddXkuHtDNBkyuxyZtP4SyXGaqK+Y7wUtWwAuk3WAvhxVjgmwjDwq6E/Kc1Z
 VRoMK53/sKUN+K2Lk0k+Jsgq3EW0HnvDbKiWeXOjS09cU4TacEt2IuQ5sOHBUcqktyGWscvrYFf
 Mg0Y7N7SRlzxIIhDbqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX7b2THX2+vZFE
 sOVQGj3r/HFNXnrDiw1S9uY3YfDMzApUStOPxXzLXT4k6vS8s7IlCE7JYe559fmpOAX/1fa7yjv
 PKYEjx0TnTP1loXAamNXuRKSQEIBbbo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260022



On 10/20/2026 3:52 PM, Kang Yang wrote:
> ath12k_dp_mon_rx_merg_msdus() mistakenly passes head_msdu to
> ath12k_dp_mon_rx_msdus_set_payload() while iterating over all MSDUs in
> the chain.
> 
> As a result, skb_pull() is applied repeatedly to the head MSDU, whereas
> the remaining MSDUs are never adjusted.
> 
> Pass the current MSDU instead so each MSDU is processed exactly once.
> 
> Also rename the helper parameter from head_msdu to msdu since the helper
> operates on any MSDU in the chain.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 1cf514fdc790 ("wifi: ath12k: use different packet offset for WCN7850")
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


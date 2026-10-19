Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650704F055D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792412542; cv=none; b=gfgI6/uhzCpj8qGZe6XAF9F8Cbx/f+unMK0p0/6MyvwzM++GpSgOtfszl99zqu1LhWLKGfNQBFWyuNrWo2rgDZXVoM6jhQnB7GoCUG2jyzpN7s7wfsLmjiWXSOQDAsNMvvA9z693Km2Q788hosBvAPr7H7J7S468zgPQ4kxhR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792412542; c=relaxed/simple;
	bh=GlX7baMHCqJ7RcPQiCBzxasm4MX02saiVgEKw0psFvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sRFdgo6o1ljqVb8AemN60ARC3qNceVy6Hvm4LW/K9tgJPKkiqmJUf10wbP2B17UNaWytw0P1Kw4C1EByZLABcY7ukXY9zaQfUeYq0C3YtrNhN2bJGI98B18uh86jYvjSKcKMNxeKNH+12w1Gf1tKuOpzrKfnCbMuaDr9JGGuCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/8V9kvy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DYRlZxSL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/8V9kvy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DYRlZxSL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Ot8e2752277
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Hd+3ei/BCjNe6g+n0gXXNGO6XYABxjLWgQMlr2RSe0=; b=O/8V9kvynwE2sp4z
	rHdRQfkIFwB3AIKAOoghx/hZvq7tBgKxo8m5G0d9f/yM/zgszA+VInY6obwz/i+J
	49xThQaVj91nDnI0dzAimXHNUSdtKLXkwh+K2T1fKuT98/r5+mm4q9LL9h+XA54a
	Xe6th8rZ6uyv/3zlX3rkjM3VLEVzIvbBOpJjYe5/Um8vqzPII9sj/MtkhqyZ/5Te
	Rk05MTeabj6irJSW1P4PyXWJ/GTGXErwqdtUWl7fxCyoxsBa91R9B23VRbR1rfU1
	EveSVbJmXAMzNg8WCGua1zO347HAkTAcEwUn4gPXF8xrKe6AibMt3L8AiK9lWaL/
	YRaWJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48h0hy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 12:22:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so74064185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792412537; x=1793017337; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Hd+3ei/BCjNe6g+n0gXXNGO6XYABxjLWgQMlr2RSe0=;
        b=DYRlZxSLjqyt9nULAv9rY735wdJTHCa8TxmaZDBnn/D0uDXaywPOMbHKnkrWESKpvr
         0zI7HP4hhTzEhlcBsBSgoDuiGRg0R1a/CD2BHfHlQm6+vj2YLM1HNZWAWHpQJxDQ9tut
         /Pax6EbFk3iGX9KJuX4x215APyiVxVZZyAVlgWz5bEvkJo8N8ZoVaRO+zl3VKlJpEc+X
         FtlwFyXvs/t+YpkiYERgluhClDTMoDt4p9x/fbS71jFuEXlTmK2C32PQVn071IggqEBI
         MD+cmAiICSaV0P2O09YGMBsJxMnSiwGt0FzxVFnfixBWFS2B3mgRpyTixIAg6AEwl6g3
         tFFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792412537; x=1793017337;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Hd+3ei/BCjNe6g+n0gXXNGO6XYABxjLWgQMlr2RSe0=;
        b=qPOE8c43mhQafpt+j/JV8sTMnOU4g3urRisdyM5GEhQVGmTBgzrJJLy6n+Lpyak8+q
         KVbn+XfEwkqeEc8dHTxj5ahwGAUpgOJJPNJb0ZA1TzRFvQP3G6BtQcehtA0N2F3b5K9Y
         MVbFeSoBppFRg9KhbBz6HsLr6uWPEzPNnWTHZuMez1g2zh7MrYwuF4cS+pY8NhGqoX+Q
         /NeBHSbM+r5mTBhQmOlbdKMVbsEux7T0z9kVwueeV1G4Bgy3qHDS0wj6EVrvr/KhTnsd
         0s2h+8P5J0ugq+IZz/DBcG5pSAm2v0p4gP14yMP1m29mqNmpsiywaWoJ8ra7H2q3QUo2
         THTA==
X-Forwarded-Encrypted: i=1; AKwUvBzJgt6ZUu8DBT/vaUlwBXuBjoZqdI7sUEZiznRSvBunb2qy3uGhTNW939eTi+fUlba6MX17zX/DCjqFAZM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu/1VCIfVs8hKPIaP1TRM4DbtD+3iR+QlkYGMST5/Tjlji7cD7
	+FiS4uw/tW4Eq4+EQeI7sOym2q4tGERKII0hqkzZulsWDe/R+6IGy+UtRIMJBrylWvFIdJ76ba2
	LvSQGKr4AjyKMB5HAAdjsK9cvKNcDOcHeZ2r/r7nqWBKyBmP8YOYTG4puq6AMJW+PlVw=
X-Gm-Gg: AYBFou3RPeBJuX9zSnI8/9Aj5VVEp76xIEOiDd+gavA5s/Fz0hsS73jvpmVUyg6seje
	LEy6hWNWCrS/2DJsaONRj7jGA3gL4hpbwwTl21Ei9Gl5qy2LuHWzWCvXHelgFr3P8A1Wzsz4ssG
	K8H3vw2SrDTupo3BkygIdCdHhl1F6hueuvmM2WBFpN5j7kweszfspKt0EKqsyC3tZfx7+OxyNl+
	uyf9ER/Ei29O3eIw/ujZLgU6gilAgZUPZL4PvoZuq8Agu9WPKMNcFQ9M64I6lx1x50DkUgvQAJl
	3+DYBnDFK+fGskSBfaq5XcM04LteWKj0dlp9cigmR3yxKXOGB6uZNPX7SFgQHYaScFtOQ81IE/7
	TCOA6HAVSEh5Dw0fY4RqHzw==
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1501017485a.1.1792412537197;
        Mon, 19 Oct 2026 05:22:17 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f29b98f5bmr1501009885a.1.1792412536609;
        Mon, 19 Oct 2026 05:22:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40913c4c5dsm351465566b.39.2026.10.19.05.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:22:15 -0700 (PDT)
Message-ID: <d58c1d15-49c3-4740-b24c-17b850b3ddf3@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:22:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] interconnect: qcom: sdm845: Drop the bootloader
 vote on ALC
To: yoxcu <mick@yoxcu.de>, Georgi Djakov <djakov@kernel.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261013202611.3070778-1-mick@yoxcu.de>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013202611.3070778-1-mick@yoxcu.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfXyIfuQUHwiyjS
 NP3eW+bPlmWp7jX5qGOi/JDaZxQeTwMtTi6RaelJIFNPFCc/bq7kZyuKEs/y845+V9C9Yu0fuME
 xsiQRr86hBbcaGDpmeUTfOSPsZYHTWSdfr6okJ/vynjFzIIqZhQKzZ1hiKO6ztanqWqYCWnSPFb
 pVWkbBWPIlAOBDv2GU4aOE9/l0bp/T1xEaWmajtp32FBJQLD6FKaef1TqvzNrvjuvDgRbDn/szh
 a50EQr6VIh1Qr6l3ePeNLo5ATWReKZUacyRhgEHYgyZs3n3QTGARqW6N5U/+iXqHDyu726gaosB
 3KHvjGXaEaSML86MCGSSHMAzyQoog6R2NaDlwTS5lpMZ/VkPlZTIDl10gCgjkFonyX+KmGxSQ9T
 MSgWqSlACK9yiHGFVBFf2sgdBFOS5bjRthcU21dqYMQbdTHsQoxldP5SLImKmBUW5NZEW1ahRXd
 H9aKpjzR7XYtZhLXnjQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OSBTYWx0ZWRfXypZDVfcjcICw
 lZflyzD9QAzypQCZMt+12AwDZs0icgKt/YiKGq40vMLf4Qvwy5rw6PbnNN08NtIcZwZtdvN3jwM
 v1blI5pELmHEyYxvI3bthN3r8ojspKs=
X-Proofpoint-ORIG-GUID: kYHmozUJEFF_xDx9lcc9PQeHQ0UOQQjq
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad60b79 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kufxfYgKunYpcdHy3O4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kYHmozUJEFF_xDx9lcc9PQeHQ0UOQQjq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190049

On 10/13/26 10:26 PM, yoxcu wrote:
> From: Michael Auer <mick@yoxcu.de>
> 
> On sdm845 the bootloader can leave a vote on the ALC BCM. No icc node
> uses this BCM, so Linux never writes it and the vote stays in force
> through sleep: the SoC never reaches CX collapse or AOSS sleep. Found
> on a OnePlus 6 (rpmh_read() of ALC on the APPS DRV returns 0x2000000f).

ALC essentially translates into "prevent DDR from sleeping to reduce
latency", I don't know what a good framework for that func would be,
but interconnect (even though it has the plumbing for BCMs) doesn't
seem like it.

> This RFC adds a node without consumers on mem_noc that owns the ALC
> BCM, so the provider drops the vote at sync_state like for any other
> BCM. The node needs a new ID in the dt-bindings header. Android's
> sdm845 bus DT has ALC as a node on mc_virt. Mainline has no mc_virt,
> so the node goes on mem_noc next to ACV and MC0.
> 
> On icc-next the provider reads the boot vote back
> (qcom_icc_bcm_get_bw()). The vote seen here has y = 0xf, so with
> enable_mask BIT(0) the node keeps an initial vote until sync_state and
> then votes 0. A boot vote with bit 0 clear would not be seen and would
> stay. GENMASK(3, 0) would match the vote seen here; I do not know
> which value ALC expects.

On msm-4.9, the downstream kernel for sdm845, the driver unconditionally
writes a (x, y) = (12, 0) on the active-only context and (0, 0) on the
remaining ones and that seems to be the right set of values. I don't
know how secret their meaning is, maybe +Mike can help.

Konrad

> Questions:
> - Is a node without consumers and a new binding ID acceptable for
>   this? No other qcom icc driver models ALC.
> - Or should the node use a driver-local index past the binding IDs,
>   so the header is not touched?
> - Or should the bcm-voter clear bootloader votes on BCMs that no node
>   owns? It has no list of such BCMs, and cmd-db has no API to list
>   them.
> 
> Tested on a OnePlus 6 with an sdm845-mainline 7.1-rc1 based kernel.
> That kernel has no vote read-back, so the node started at INT_MAX:
> ALC was voted with y = 1 until sync_state and 0 after it. ALC reads 0
> after boot and suspend reaches CX collapse (qcom_stats cxsd counts).
> The average current in an idle push standby test (Wi-Fi on) was
> 35.6 mA, against 43.7 mA with the ALC vote kept in the sleep set. With
> ALC off in all sets the phone has been in daily use for two weeks with
> no side effects seen. On icc-next both patches were only build tested
> (W=1).
> 
> This is my first kernel submission, feedback on the process is welcome.
> 
> Michael Auer (2):
>   dt-bindings: interconnect: qcom,sdm845: Add MASTER_ALC
>   interconnect: qcom: sdm845: Own the ALC BCM to drop its boot vote
> 
>  drivers/interconnect/qcom/sdm845.c             | 17 +++++++++++++++++
>  include/dt-bindings/interconnect/qcom,sdm845.h |  1 +
>  2 files changed, 18 insertions(+)
> 
> 
> base-commit: 3fd56a2833c22f62eb84297d0dbd47739632f1a0

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503842;
	b=HtTcTL71V+KI9zvzSx6zyXnATtyuB84xNiWMyJoPUcvWGquYjiLkKWnTgM7zADL1IOQg
	 LxSdD4o93oRoz0NqtHT76lunoGHckTtYUeQ2+IP0fTJ+a/m+5fsrJBTjfaOEMEdeAOZyX
	 fdDPtAjHeS1w2MzHNIvksCGBjlpreErL+3YnzR+quyIl16krvnUlAB1FgDLTlmGV/KJ71
	 F2tpbEVzvDRoAGpoFTTUfj1rq66Vo7/pexH1lp1TjxthgVaSZriAx2+iDmwwUKUCSYinB
	 pRlOzUHu1gTlFdM+ehzSEicN9FUbDZxk/W5TcfzUQ7/TBcPpO0f1GL2JXuahDmxrFPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503842;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
	b=DxPAiMDYqqkdYuCU8u+suk3dsA4Va3at375xHSW5bLqFBmM1QdRvqtyDVRHaa2aznfTz
	 ZkN4DUQoE9dnubPFjO4LU0Q6VPejWvjzw+Yj9Rhw5S1fmcqeYEaq+LbQ/u7BZUHkEFmMv
	 rGorAWcUwuvxdO39JU1TQb4dSSpGx19ZBXNs3AZ+q0Pe/amVAOwXjPGVY7LQNjfVK9fSp
	 UXd7OvILQchYrRm6N7THOHKG94oaEXjj27NJmyWEVSb0z0KgbjG/t+Wt6aBpOOPT3+hhm
	 zAflNUuH1pA2zkUdPj8uAIzHHttSfuYQjvWoJMLuzaD66jkTyc57bMLnU1ufDmarLXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpwEQU38;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvI3hUCR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71A6606F46A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71A6606F46A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JpwEQU38;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvI3hUCR
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDDp5X2305717
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=; b=JpwEQU3882d+dIg8
	ktMu/sJh9xwbtTmoE4Rvhr7dsQ32fpyggNlA//15UwZd19H1RfvQ7BKXHCUMQqGY
	6RbCbtJDFo9gA85KYtsVkYnUvNsNRtwyshYmgvxVvVeSCBT3k3qmQUxHBI0nL5Tn
	zuxT3HThECAQsniXfUqtG2LXHIZADsQNO3siSb2PoPi5KcxBjawbLKwrAF2vZQG1
	lPW0Q7RILtqOuvj+9kWp9oBec4Y1oQS1OVMyQj2cIIeQqdI/FtT6A3GCl5wZjt8t
	bBkD9Fwn8141R+Q0qqR1dICdFKs2fDTZan8BJxpvvfKQtHClJsvXKtMlDNglpfzx
	Nyj9RQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjqym-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:44:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530cd3dff25so4037141cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792503840; x=1793108640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
        b=AvI3hUCRr7cAp1J0PdSuCd/SJKlyeWUy58WOZbzwiClL+vLVjBnBUWX7B22qHWPWaj
         tDw6G4CXiLmBZz4IZRHO082ert8T8jAUPTPhuEKdHJ5IiPHvlgEJrjWSHtMzkLGaSbFQ
         PwOTpYDuUGjfU9fXZMAfeNCjhx6rlFTab4Xb4FPXVq9Gv0aYx5rIp5e3uzQda4lCbael
         6gE/IeooyYLmlIkZdfX3wV814sw9s2K4GOF6e+9S8hzQOuSBT6JzsIvGNtIkWsL7zf6y
         dtC0eBZRzwo+kerTbLHUlZCbciyr+hhd2FVUyiKYImrvhq93yag2db1rI+sN4cLmjOcP
         Jdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792503840; x=1793108640;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=90cPQy1RXUCyd0qA/++VQhZjEso+RPuRMyVzvI/5W+4=;
        b=w4YQuMgrv784hXYyeYwYUe2hHDpezlvUOH/QpqdRdX46qmwi2grO3uA+L0xGgypzVE
         s0sghASuDZv1+sTHlm6uFcd6UD1f6JZDZBBTjFKd0A+A8G6tUJPdVrMBj5rjPaCIKq0u
         K36qQ1A+1BlF8n4W+1CiSpGvq6rJGgjNW8W+FxgAkgvCHCCLcxaV6HieNEk9FgM+WuEx
         t7bzaqMDiWXi/rx35j7WdzowZ6QUDIbUKI5j8MOVN6R4H2SiKkCyg287asJ6uc0tMJJ9
         6yKqikpGjvtvsVuHWQOA+Zhurx3FQ7OIGqqhuNonE9XMyub+foWj9o/NQgRCSzFmd5Sq
         xPDw==
X-Forwarded-Encrypted: i=1; AKwUvByPiBrR3UZDHrmDsWhul8HErrapcOTwoUkD7pMRcNUoonn5iSUgV35CfApDT4r7gGlb7BI1uGL8B4oBsjc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLB+ypWwwIXHw8uBdCsaNUzlXc7n74GanCXWkQK6EQ81uwqbj8J
	ZW+4RuvrrNa+8kN8ROja0C9piDtMA2I58QLTLnd+aOrnwsRLTa7C+7E911AQhQt8W8k0pP/xDNU
	TxL+EoWm24+QY+6lLX2ftGLahb/aa5oIbVTjUHAbVBxqvtTDJzFDYQs2SGxux5J5sguA=
X-Gm-Gg: AYBFou0ByKqkp4b8ZzZKKMaM9elldUc727qOiR2n8Da/lCI+qI449wgeSBpPFMEAq02
	gKt1Bv0sUQFLDHOIEW+A6nq7vsTNwDIOPC1Ykm4oABvm9cdFG7vvG5m5vGdlbJ3PuCk5lL0xiJB
	BnEOrTX4/fv+KZyW7n2P8/9iU0U8Pejfoa/btGUYQS6NwKy/xEBftuSSFcUDJ3BcztiEVmN9XVN
	cB5yUg6JApYYTzm7rZzTIyG6CBfmND7qq0QjDaIf33eI72otDXBBSQYqCSaGlxhlXAKQR+mNVb9
	hJr5+PGidm+uaTFKh9RQsU9CGZrEVE4XhaX3LoQ68hF8298TBdc3lCnOgDssSmUnqZ8tiph7JVv
	86BkEuKYjGcwKhtVpywZnMA==
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2180701285a.3.1792503840135;
        Tue, 20 Oct 2026 06:44:00 -0700 (PDT)
X-Received: by 2002:a05:620a:800b:b0:939:eb09:4458 with SMTP id af79cd13be357-93f29ce0b63mr2180695485a.3.1792503839596;
        Tue, 20 Oct 2026 06:43:59 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1337d2sm5441811a12.1.2026.10.20.06.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:43:58 -0700 (PDT)
Message-ID: <11891012-6a4e-4d7c-8155-cd8266e00bc8@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:43:56 +0200
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
Subject: Re: [PATCH v1] arm64: dts: qcom: kaanapali: Split cluster power
 domains
To: Xin Liu <xin.liu@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com
References: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020063721.2306679-1-xin.liu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad77020 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0piBkx7tkWQQxamy7twA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: uAAimOgT3pJX38m4AgBCadQ_NszyJ-B_
X-Proofpoint-GUID: uAAimOgT3pJX38m4AgBCadQ_NszyJ-B_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfX1Sdl/FqJmSDu
 jCrxTaAb1jpJ4YrPRoRVX2LD+SUUOfrV0xPciRnaEMrFmWVTu/99mOicSJqlj4KbTtIbuKwFAel
 A50plfJ09DcAKfG3EcATM42m4qhkaECV72t9T0nrXmO/iYSbqg05DAl2nHK1hG0RNlvfwPh5jKr
 6afWLCCrolb0l05fmaVjDX0m2A+rsyx+FlhkBI4Ps3x30EyZNTZbcevT3ssobMH5GiCUkewuAT/
 3DLCcOp2C2gY6gQDmnSluw+8lVEEyAn7aHkjOo0gHq0PF6LoM2EKoraNHtogtpNO8C42g3wIJBr
 TNnsL8GWYQ+gnVk6t08m+mErjGthn3GoTNbF+ECyoGRgqHMO8EAOYuqI3KrgE8cz6URhdGcJTwt
 sdgu8r7Llru2WbW4/p6PCAqGJznV3HkIVJqWAGPOpkU1/VwBcb7V2k+xNIQi0Y3Uj+79mbk7j5c
 iMEWwr4bvrSR5r9aQfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NCBTYWx0ZWRfXzZ/Dm+jkztR8
 /Py3PaXq4jvcxzRMZU4ccsN4edVp+LDfTX5+qQ3QOQKags9aBt3YfOWDequxC1cyrQDA+6JkXqp
 PoO3yzp2Fr3QjUSQT+2QTmuub9yn6HM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200054

On 10/20/26 8:37 AM, Xin Liu wrote:
> KNP has two CPU clusters (cluster0: cpu0-cpu5, cluster1: cpu6-cpu7),
> but both share a single cluster_pd. Even though their domain-idle-state
> configurations are identical, sharing one power-domain node means the
> kernel's PSCI domain idle refcounting merges both clusters together,
> preventing either cluster from entering idle independently.
> 
> Split cluster_pd into cluster0_pd and cluster1_pd so each cluster is
> tracked separately by the PSCI domain idle logic.
> 
> Link: https://lore.kernel.org/linux-arm-msm/1ee9b624-4580-4650-8e48-d517ce9eee3d@oss.qualcomm.com/
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
> ---

Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


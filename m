Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0547ACC5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465993; cv=none; b=T0rse3EMLeCZkqkESkMKZY4HRGY6CleoKnvawBlCsGQBcNoGDzerITeQ2JtvOvj9GGP+Kq8I0iLujB4Gf6h7pu4OSzHwWGzdNVex/LZYin0LlVRDjxTcicUT2pughh0foU3G8wQLg4voibBt3RRxVL91T+aci02ZUturMmjJwvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465993; c=relaxed/simple;
	bh=MFBwAbgMkOFYCA/PTPGkjgXNbqfLFJ8kJ0lsNhxyPYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgvuiEpvK6sOP87vUeP2pKptr//nIXGbi5tcmsGmjiqq8WUxuN81GlfE2z582AliMXfZnw6UzqViTb/Oovhh2k4m+suieGBWK+yn0qO/h3MAHUfrpjUIxB67xOtmLFSvjSHM0RSoK8EPB58kBUE7/8AiL4Y3UAeJ32GHd/Q3Kw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UwK7sicc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MJmoJkcg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UwK7sicc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MJmoJkcg"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hJXJ2674967
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=; b=UwK7sicclThnmSvT
	RTYKA8A+wcK8W2jGYdKlq7CKZ/rBLkBB1OA4SBC9MIDv5z0YvZlrag09FqzFdq+W
	JKnhh9bwrlz2ciP2rOmcPYU6dRL9j3rlsuLKCFqrKnegsk1UyrkZnXenLq2f+ndv
	5hbaS2z1zbKExAlyEXdAF1Dgk7n0L8sjpSEK4b/3GVyH+ceKFu0LHH2XlkbRHzIB
	XMK/JkU3w7QPYXtkk2wcBELXVi5TCjPA3NVZIIGybsyNHOBzxKS/OTBhObsk5vOH
	odF69l8AnKiD0BP/UJejlwTamNYcDE9lmHg9gU0sYO49O74ioo5AOASyl4NBsKvJ
	ouA60g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpye715sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:53:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so2962790a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789465988; x=1790070788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=;
        b=MJmoJkcgNtzfRTOj98jS0K7wOyHmEKO0VASG6W1mB3geVSEk/f6+ZjzzyaABo8UPD6
         nplj+sO2aU5D4CH905bvMpHLLNOohwLDYFy/QAjhTr3oHNI5Xs/35hyNZAms63lT2uWl
         w56ehsARn+cvfBg5lgFTKgJU8bVhQLe6lbvxeeb8cLkpE1LfBVcjdAkJ8Ev1D6RkhWbS
         ud6N4niwKyzCR3+q5+5b8nXST1SBt6fufM73mMiJwuT/kJiHqblU8JTRPyV6keuH+GV3
         4p/zWNuGnTaZCI5q8aFn9/revhfbx+ZBXWHPs60NxHLJKa1Vg4Tn9i6WcznYqP1RBxBo
         +6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465988; x=1790070788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTcCgoLPWbWHdUyc5NakV3yDJeiPqNYhqZCxQG91oaQ=;
        b=cuHP7hTNYOz54TnSVjzSWfdJtH32WzAuZ+lw4Lz87GESNrzhDV6tfVPU5roibLeiLS
         6g62c6hCQ0sVblZkQjNZjAF5C/1fk54gDsx7zpkxqVI7wtbRXgZOuWJuj55BGhmH1n4W
         bvt2sy/O7onafNDdfTiNu0PxCYZEQ+D4unoKB3ZtK5tqw4/e7G7eoJPMEUF6szuPycRw
         StlmbjNx3hUd4zOuByqsLzb8z297Lmn96u0IuahPhQh2dN3uJ/2hsexLpVD+QCwe0gHU
         AS4aQpWHLh8sZd/yk1p09jZPAEIaX/RcjamgQG7C4HxM5wssl/wQVzVSfWzp94h3DFSz
         UtkA==
X-Forwarded-Encrypted: i=1; AKwUvBykVaXYEbrzJQ6B/fw8LCyVMnqKiLNtDykfl8znKbUzvA0EHTLh99qe7/GFrFq5Lt/AG6gjDmjmo7y/3OU=@vger.kernel.org
X-Gm-Message-State: AFuF++mwTpShjdC1ZUsmLIQN3JsiBEEfYgx2Zk8JTeGnOsCaBMajNd7e
	epR/Kj5o6rRSzmgwfH9dkCoR8HtCgBnKveonw8ZFh1a8995UQUV/ZHiixj2/9fbRmvP7y+WVu+T
	PrpYces12GRocYN3BnorRgGjU3o6sbGtJD/hF/wzZyHpWzZYoPuJe/Ga8fPGo1kgkZCc=
X-Gm-Gg: AYBFou3pyePMuz0mpvIQN93agkoBJpJOYMR777S+cL8OJSJoCDPCxcaov+zIZx8YYct
	4MJx/jVKd5uxpclH61dWmlDBzCYJAkUOC2D5L9MKW5dV/F4RS6ed8pkVZtb0mDZCE1ySta4gQq3
	3xxMlIYGlvBaNA1CN7oE7hUbSMJhU/yzE7pxQkrrDmt6JcxHmUiSdPpYeBMFNZgpHDgO5DmhaPK
	DqrAca9QsFvhT53rUmbFNP5S6ynKaLBy32Hynlh+kFL/cnX+TgoYdVEl1KqDaAYskl48FNKurvJ
	TLDNVonultWeLSrLltRAd/M8Dv6n+plRgvg5WjxxTPvu+yc+NK3x6l8YrUrCqaBG6b9ukmFXjOw
	GNf/59ipCP8DE4thXgQVlK7/gEtvK/8W0
X-Received: by 2002:a17:90b:2692:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e10c936camr294276a91.8.1789465988306;
        Tue, 15 Sep 2026 02:53:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39e10c936camr294223a91.8.1789465987854;
        Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1439110be78sm2856174c88.4.2026.09.15.02.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 02:53:07 -0700 (PDT)
Message-ID: <8314e3f4-aaa1-4eac-9fec-9becda010120@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:23:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] clk: qcom: rpmhcc: Add LNBB clocks support for Glymur
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-2-cdff2c67a8c2@oss.qualcomm.com>
 <he3muoyyhyd4rclkrvy2ut36rzvp4kdusabpvevcrfo7tw3plp@yddqy4afyuym>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <he3muoyyhyd4rclkrvy2ut36rzvp4kdusabpvevcrfo7tw3plp@yddqy4afyuym>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX6b5oeMI04OnQ
 kJslMBhUTIo7Ttr2v0nB6tiGF/SiTpvMbkJaQl5WGTsCqaBDFdzkzGnzOsXYOEJzfY9N0QaKmuI
 a/KeDQCRG9U/kGL5UPSVfPuqN1tw5BJ3USA3TxTqG4WvZP8MhbywvyCVgw96YFuA5kVEsdxRsxa
 2HHBJoE3AwAPT4zwUlb0Yx1brrflbz2HxIT3J9AvE86vlbyqj26tQqvDepQR5Mhb2yC4l1QY6x2
 56tFZ07coxfbg6meDkMijHiM+KK8p+fd9NDCPG1yi0dIMfj/PVwPQfiG8vJ+ZB1nnJtt+3wqF/D
 8vx9Wc07LOaFu1fsv8GMKrf0yO1olXx8EyEkzsgic6cQ2x8TMkhIKTI3pzIy1twoglJ+CoGD3R9
 dPDObkjD7YTDAwN/xL4FwzcsQD7cMCUAZAXpbMKoplyl3iS/uwWjQgKaNlpWwcVRP45AyeN5tnY
 ux3/myCym5TdfABmmMw==
X-Proofpoint-GUID: 6gZNeilkbQoerJvvSH5gPrAqT6X6cvaW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MSBTYWx0ZWRfX25LQEr9u1I/z
 TI/BT1h4d1e9AtHb9cCqZrY8FvnxVggm4NWh1E5CySFZR2dJ8y4MlwXxOG9nUbTejZd00qQlwxQ
 N2N1dmXyeTffOMLMBXEiliS6uNVogXo=
X-Authority-Analysis: v=2.4 cv=fck4WEQF c=1 sm=1 tr=0 ts=6aa91585 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=r3UcPH_kFabEW9HR8wkA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 6gZNeilkbQoerJvvSH5gPrAqT6X6cvaW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150141



On 9/5/2026 11:22 AM, Abel Vesa wrote:
> On 26-09-05 00:20:43, Jagadeesh Kona wrote:
>> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
>> platform.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> 
> No fixes tag?

Thanks Abel for your review.

Will add the fixes tag and post next version.

Thanks,
Jagadeesh

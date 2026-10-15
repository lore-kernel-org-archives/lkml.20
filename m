Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F12A52E046
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792072853; cv=none; b=cg4rQwei01vfq3zrQCvS7Ioy0skiOhghay6HbNTulQUDDg5AvRk7ZNAI5C/FZWPidrKQewCD580eeNl8aP4uJF4nEUf0SzJ21r2gfJYoCrVWFjoTbNGYktFV7KtvGK0Wc6WtE7jtcuLPqdsDu1emA0Ap4IhAyg/cU5YboBdhuJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792072853; c=relaxed/simple;
	bh=AX1weSWRV9L7p95o0pE/jdekN3jEDZy7K6K5FfoK1Lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JKKxC02UT2TGL0EtmJ1UaauevTx0Sc2Os/LUx/Rb2GPuRtYLUC55lxD/Hgsc3Ck8Hn/HzLM+aNqQJwxOMXOcMOKSEq5uGwTHIO13Gno6+QoC9n5pvxP2Q2mPThss8nbGTOrxFxbngLoXFNqmE2bxQmmtjc58ZIxdH2wXgeVfyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zp217iie; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kpUrm60L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zp217iie";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kpUrm60L"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FDYOJR3462799
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=; b=Zp217iiexVdzugFQ
	6uGpP7ZvYbwSQKIsaCJ7mubpI3FYKoj9UqbWJ43LZ6TSBOjV/MnaSvMBVmAvs4UC
	igBPFB7ZpxFTmml2sNiRUOm1p+11/YPqmH/pShFw1/yk4s7ODSdMa48WRiZWiQpb
	63Umd8cudmniKleaJIdoNL5guTH1lh+7QdQDUvlw5Xn2Fs4lqM4GpHF4Ty6Xn79n
	uiuOmZVAKADF6H2wztyVGTkX8SroHaLlXsj+HvcfvtTUabthHoPVoOwODj/ymNPR
	CSl/VWyLnjvWktfb25QEmI6F4CXvpvh+Bx1CeY7wv69EIPTZ820DY0CiWJJjxm3a
	Z50fMQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hayu683hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:00:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91bb074ed1aso46679166d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792072846; x=1792677646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=;
        b=kpUrm60LnqjN878d68/nKg1VelqQ3TZ1jZrCfR2kJV5FG4DTlUuFb3axXEzuf3q1/4
         u8eszwSGkCDy9mGb3anI7/w56tL4y8FOdGQStkiBX51KyQ7c+rVKc2/qzZ7B6w2HQNlN
         98gq3JCWLI8Z+XAoDgbevGVyvqdhA+2ZerIsAnTRmdpyAP68GbMyfP1AulCSrESZNqg2
         NsiEEiFlqUb5EB4ghaYmCqLqECQh1s/GmCs6ekez8xEHjWTqZKe4ojkXCu25OODp88rt
         /A7Q1eHIgDMHy7R9qmkdWjQo6E1uHx6g4V0g0UTI/MaIj+FzsWKanyWVUQ5ylTCdfge1
         EJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792072846; x=1792677646;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyhG3f6yky5p2xQIB9m8xigN3IiQFU+DTNcZd6h+JBo=;
        b=GGmeX3cCE8sPcBh78s+M5W5hiF/FGP1EiEDIPkuZzcapwPA3uMbuP1ej9oj/Ve0Ysq
         tQJB6A88enUV9gYXx15rXBK+2FYHlRfePFnDN0G3RntmYBUoIFPanppkEyn921Xv6OLX
         ud5z8IuT03B1QzkGSal6hb/izG5Qr6ddjp9RPz+0khOjJX/aS1JRBPlTSrCqaQXjS6uu
         FVZG0fOBglV1BT02xcCBjMA5Y0ND5mAETaIBrADowcihewz+rrFg39JVGcM+bHYG8i5d
         hk2c1waXEEaVB0kEaZ4O5T3hd9aerCq8O1Ci4Vc7tzkUMQq0WRjLjyTLFLk+6JqTLtXo
         IFdw==
X-Forwarded-Encrypted: i=1; AKwUvBzWYlg0+rUbi4PrPKt/0gedJIcMRXmHtfSB8f4sWH7rHrml2q8BMsXUVAjouurvkpArLlgOO3twUFXEE0A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvRE6nLqZX8mCBXOAR+ZOCXc3G4hc87K2iAiYU5NqoHmFH5gEi
	3RjT4FZEKlGf3/F9wSaCBgNOIjW5HcKrSg5n8Sn23LeWMH+rIaGuIslk9QNLAd1jCQyjRBvudyL
	UIGBzRQFec+JTIp2xYLS+v6nXSj44YryYUro57LkeUFzQ1C8Wpi+wWZX0LyKhVkQtHNk=
X-Gm-Gg: AYBFou3ifxc9wQ99sETBWcdGZG8BljBRSsHWo+8PWqm6OJT9wcxxuDusovZGHGTqWW5
	Ow+sMWfixy5KmQWdsuHgkccZY9BSd9kvYiU4WebbLxelXfOH/ITUE5nECXU24wOpqBkYQsCX1Qg
	RBPeSvzyqOcsuqEqOfQB8mBVDdUl+UVEczetvVBr1zNaUNZOU57cDBwsrJElBEv1rCBmHi5BGOE
	RQfqE8WO3b91U7tLiac1Vw/fY/RvPDG99f8o8U/V/OHn7cJRKIe2K0sEDuUJooKi8HsJSExuc9A
	GiiFKfGUar3gNUt0YlkdpCqt8vHOpUbmwDdMYqTTRPh69VVT1nb/QexkMqbvivutD9hqM12L8ya
	2uVkdiDaUZVoCMazN5LeazpbniH/Iiw==
X-Received: by 2002:a05:620a:438a:b0:93e:a8c5:1340 with SMTP id af79cd13be357-93ebd25394emr3089513685a.34.1792072845397;
        Thu, 15 Oct 2026 07:00:45 -0700 (PDT)
X-Received: by 2002:a05:620a:438a:b0:93e:a8c5:1340 with SMTP id af79cd13be357-93ebd25394emr3089496785a.34.1792072844394;
        Thu, 15 Oct 2026 07:00:44 -0700 (PDT)
Received: from [192.168.0.195] ([124.123.197.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b32ffbsm129953566b.34.2026.10.15.07.00.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 07:00:42 -0700 (PDT)
Message-ID: <1a3f3b8a-fe88-46be-ad23-38c4da650183@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 19:30:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] clk: qcom: gcc-glymur: Mark GCC AV1E AHB and XO
 clocks as critical
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-1-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hcWzqzWIfuUMjbm1iwkJRdQLJ3cSBzeC
X-Authority-Analysis: v=2.4 cv=ff04WEQF c=1 sm=1 tr=0 ts=6ad0dc93 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=/y/JNeyFYS62MWjl30sOOw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=erN5cKggTshIPlD3kWUA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: hcWzqzWIfuUMjbm1iwkJRdQLJ3cSBzeC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX/ztqzImTKpVM
 lHc3WYLfYsPXNcXKsomDxlZEsvw7V5RhFxmaDqMjPjglj5BFMI3FDjQLYxM9C4QTqRF7A9mXxze
 U4ha3BuWhRa0ohHc6+xeZCneSrsSrqRIcilTpEeqZINB+KhNKiBzsYXR0dmaz8JiXXvMRUg/r2w
 L9Gdisd7AOAUcilBEnjpzb88ApULZ38xv9fFIJpFecYBmLc04GfTR0ilJBph9ZO8We5YF/EKDM2
 lt/J2XiWkhMhec89mbJR7Ei5Y6EXp+fUAxyUiLo1xiU8+oGHqA+v5HtWfDZ3t+z+SqFniZBJr/t
 mp7Rd9lP6TIlFKhKT1gXQlcs6TSp3l8AWsWzLrwZDOg3kmw6btRLOkISApKVETUZdHXiaN3yvoz
 WT9qAOxfvcdv8SgTFiw6CYSvXrMAWgzWgoJl1yicDa1HEruiQqm6ofMME6sWhwEgF8T+7NwZMl+
 8UA9Mj5tIWvuLB4ByGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NSBTYWx0ZWRfX/jFxFqsUJcVl
 l6beftWYWpGg4UZnRrecvhpQwlGvxxNp+DnsKNpgPiL495ZfvHWIYH+ohlUQdx4fNI60NoqDrag
 FDHbf9nKQUU4neB76eLawcknrLCCkeM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150055



On 10/15/2026 7:05 PM, Jagadeesh Kona wrote:
> The GCC AV1E AHB and XO clocks are required for AV1ECC register access.
> Hence remove their clock modelling and add them to the GCC critical
> clock list.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-glymur.c | 32 ++------------------------------
>  1 file changed, 2 insertions(+), 30 deletions(-)


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


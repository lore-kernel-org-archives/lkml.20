Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F034165B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633140; cv=none; b=Nj2Kjx3yX0C4fJ6Z+nYruhDPzyKOsRkkcKJThDGF/icqYCuPLBQ6F07hNM7hv4upcCuQxs9nlqH8ewIcATjF8X0UCpneqAyuLUMFwtumDNYl+5SWUzirSxed4vJRe7otEzJLyCpJykdFmmqkXAYM0lv+rf8zC2jpQNkaK7xSoMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633140; c=relaxed/simple;
	bh=svLOB8z5R/BwyX89ta2NtbKu793JyHL+NgAfeilHccE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATG/D7Zh0nQSkeSqTNnYQU4zrtcCM8IOHu9TjRCj/VSWGKRadIa8zlO0tCY/FHykLjUmIlQGEsLzkOROckNgr3vrjI/eHwMcWetrAavzNbcrBfIaXaRg4cKCSe069AIqrEjZDJv50cC3p5ZgNCz2IMfuq6iuykRww6Ej18l2UGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PPeLs8jC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j3Mttbhd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PPeLs8jC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j3Mttbhd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 685HtXY02486355
	for <linux-kernel@vger.kernel.org>; Sat, 5 Sep 2026 18:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdT82Q2OxcJQKOg747qv3HE+fHx6+rKNd/Kv6KtVxkE=; b=PPeLs8jC4qKtUTmj
	b1S5Mgsi5rwjGyyfBKaL1nbEBRfURolCXjx7wCfu6Cq1lWAhinnfaXNJM+owOgqi
	eBiIuNy8HC0MHr5IjPVHkrFu06MD/8KuRLRDpjovaK6Hq8o4g1IIaOvBCv8YYVJJ
	1cH+gb3pMu6RjF267O/5Z6a+QV79+DTeZn/6ppTSY/3w/vL8Q5/ijy8mDJEXOKtw
	oJSI5ypFfcBuTz4Zqb1lddW/MLuMlVCJFjfDYhFhDCd8gEUiDxSAIMOGffDSRIyP
	s6TJj3gt2YdCQ1QzOex5CTJa4u9kTqfh8JOVjgCxTn2ino1FIuCLRgpyz/+AlKZ/
	anx7eQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuehyjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 18:32:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbee6bb8408so2599450a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788633138; x=1789237938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdT82Q2OxcJQKOg747qv3HE+fHx6+rKNd/Kv6KtVxkE=;
        b=j3MttbhdXyR07esdD1Gijz64KL1K/fZm2YpGLUFLsdI9ceMvv3Dgxm5SW0hEHcw1l1
         tLPRetaB89uc0TYGp6lqDw8+FE5eenauN2JjWDyxbPQFwXv3UVTgi6tHaBE55LttgHH4
         /CL1Yt4avizhBnstsYWzdb5scgFKw10wMw2J898iZROt9K33RgXbcdenmfnbwX3DEJQL
         aB/oUog0pr5CNUJKJ4avP3wsgCcXnV7A2TLoRgZqByGJSX+H9Jf0Nq4Ipr22c99qoamg
         eWG7S6CKoVpq1GMDU7UtLWcAXPCGL5aUymzw95uHpi8tVlMCkYw9Y2dnT6yKYoaGpVjS
         oRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633138; x=1789237938;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdT82Q2OxcJQKOg747qv3HE+fHx6+rKNd/Kv6KtVxkE=;
        b=LcaDl6E7LpEg3mMfurZyDiad7TkTQhcRQdvtQUa5lW/MTgCbtDhil9P81kt5G4XQ7g
         2+BiZLnDblR6H7dDEcy1ZpoWhWA0YRZqwOFavtJw+gOS6AUgRbJabf2NbGmQavc6N9CE
         K6v2UDuc5LVUf7hRoq+pnDeOnyrzitow0NW8q7aa1FmZvFSb/IOR7F0BEVsc5ssGtD9H
         6yM1xyihWkcHygHylIlaoNV1qIqhAkny7YwFjDhjgmBCJIFFJTV8fkayLRR8siz+W04q
         6WdkHnDlA+yUBsv2II/ek6fDcU0YDnYVPfvb3pn+dJ/Ojddld7odpx3yyRWPAPBj2i7z
         kwLA==
X-Forwarded-Encrypted: i=1; AKwUvByRmjWsi4+JdVUpDwtj7EsP99DVS6qJYWS//gfUf2KnwI05MN0WPOdiP84K89Q2bhhmIS+RKqyDVkESTrs=@vger.kernel.org
X-Gm-Message-State: AFuF++nDSpbciPn5GTk4TbkWLz+kILjexMK+pEwDADah5B5K/uq2c9V3
	5GoPERDNm6C5HDsoBJD1BbzoIEUtuhFumawsWbtlqWgeWneYwP3xibRDPpxgyKunmCqEHdN5cOn
	0r4b9p+k7j0ht5pijE6NJ/BHKrAZGzyaOrhUUAvCpL5iBgaZZ/izmpr0W2AXACukcl9U=
X-Gm-Gg: AYBFou2TlB/KNFXfPTNxP74LJHBUgrUYBPemdUCbCPPIFuMBzX7R2hZucWzODqur1jk
	V/KJJDahyNUbOm0mM7YhHdP7XoBl249oH4n23AOszRdXrQevOQlpUVRd4JzgikkFK9bpD1Q/iU4
	aWWBe4icp0HzRZ2GSCs7sJ/HNXM3cBM1m8uzYisr/eZoKPD7rT1rJRzD1V/4YwpQSH0D+dZnCo0
	gjvrwCy39cRklYCRCKcHRRDJsZ5wjly7Ljl9YxzlLnVnv6I8Hf/yyim3q6bBfEiDTEs2wzmZOwA
	0lG657x70+lEzaO4m799Q6/rdOdzJqOiSYU64vlksgjnCg+3QSrpe2OaIKtF325ZxDWcQbKz8GF
	M6ovgBLCHjcwr/JS1vpCezbYsJKsv4Td5IYFyLNQ=
X-Received: by 2002:a05:6a20:5681:b0:3d0:5305:4fb9 with SMTP id adf61e73a8af0-3da39bbfa1bmr22943678637.7.1788633138011;
        Sat, 05 Sep 2026 11:32:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:5681:b0:3d0:5305:4fb9 with SMTP id adf61e73a8af0-3da39bbfa1bmr22943633637.7.1788633137626;
        Sat, 05 Sep 2026 11:32:17 -0700 (PDT)
Received: from [192.168.1.14] ([27.34.253.202])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm17250412eec.30.2026.09.05.11.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 11:32:17 -0700 (PDT)
Message-ID: <c7282846-cf0b-4a7f-928a-7a0d12e88153@oss.qualcomm.com>
Date: Sun, 6 Sep 2026 00:02:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: use 64-bit SMD RPM bus votes
To: Konrad Dybcio <konradybcio@kernel.org>, Georgi Djakov
 <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260904-topic-icc_rpm_64b_req-v1-1-37e24f1991a3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDIwNiBTYWx0ZWRfXyPY4kwhoXa1k
 tbl9JmuXJY0vjOjsyFnXeKyUjM1rhAS/bBEvxGL8Cm/qaoCSlsvUZLdVYtGlp6P77L9D3fdLHIT
 hBQ9uxf0kObR8tXx+qCC6ffG5ONwJwC3K6hOPFvP1SoL2HqxIU2wZI9Ouc8miYzcGA0txnOi+OU
 BRQFnuABQ0q0uq7knrcgw2TfMklIeqmMN5OBDquH6sRa8WtRW3YdGAAXlhyp7mttqmknhVe3YuJ
 0X3HftHIpvoGaUh9xgV5M48RXUo6Y3ZdlcX4QOCCRH2ZVvTtiFN25zqlXlU8qagi9OAjMLjvCMy
 KkqKsNRAEmuiS9TepX5lsgyd+lsqXdx4oEBp6IWG9i2QbnzVMafdJGgx1cLkiWB7jOiolzU9Qbq
 DIDiPOEbsplr2SEeQ+jGHIf1VFCiKVu9Bmma4rUDIKxLcUngAOeoyEj1v2dq2n9na5BMZbdufIP
 FzbHEedHUqdu58h3CQg==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9c6032 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=3XoJp54woHZrTNLqd2i5nQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zrAAXKNDYC0mzo9CIGYA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 8quoKhcYFmmm68hfdYhNJJiYMUifeh-Z
X-Proofpoint-ORIG-GUID: 8quoKhcYFmmm68hfdYhNJJiYMUifeh-Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDIwNiBTYWx0ZWRfX2fKSp+IbwLt6
 KG9GrHOTotKgll9aHbY6r8CJw6FzTk8HEW65ZNjx1tL5pcozybsGOIXxcvuzQ3oXnkQ+hPNyZPT
 9z1Ru/0gumX44BcrlLsceVE7ZZJ5bFA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_06,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050206



On 9/4/2026 5:25 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> SMD RPM bus bandwidth requests carry a 64-bit bandwidth value.
> The interconnect proxy declared the KVP payload as u32, truncating
> votes above 4 GiB/s and advertising the wrong payload size to RPM.
> 
> Use a little-endian 64-bit payload and accept a u64 value in the proxy
> API. This has always been the right behavior, even on msm-3.10 and
> 32-bit SoCs.
> 
> Fixes: be06f8e7425d ("interconnect: qcom: Add interconnect RPM over SMD driver")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

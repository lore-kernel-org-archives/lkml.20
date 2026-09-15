Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CEE3B42FD
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477325; cv=none; b=CcpIkT5faq3SBZM6EYZZ7u3WK4/BvAGkH0fCaH8RuvC+t9WU/JqrGns++Uqe5PmwhXqBSv2+ldUxhPDcUIllm4xIgOVuxVDpUlkaa978HJJD9d+QsQdqMGJGQqfZ1fxbXI28jb0YSc+2kFUXjjnPgG11EaXXBln4W/VyAgxEhCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477325; c=relaxed/simple;
	bh=iQGXphKryUmb+DAlTxCnwPtT4u12722nCx+SciMAuww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAOnMhr1Fne+JjtOONrWO5EGCpZHkuNbfB7dGVlkLF8+6Di8JDL05H6X/k8bbuf/KyhoT0Gh4pbUoTnGEuoWpx6z2L5SzXuz3QU1A4eyqrtNFZI/YK4ElT9AwORb22BIzED/ZOSEYozUvfN/is17OCbUW3/XLcGkiPaqgSp+iX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aj3jLjwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/IHlG/d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aj3jLjwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/IHlG/d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD0AbH3015909
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=; b=aj3jLjwAu7ygID7T
	vH+3qNmJKZDwABb/57fLhQ/8opZQhO+DaLSsRox2nDPpDcnrmthDhqWXNHYb22jp
	xLs1SoBIn4be9TmfFOxkw4d8qTDiZgy7/IZe5D2yk4S4E/EmleBDsZcXpdtbaZqc
	cUV5xhWAWWamEOrv+CL51filHnuj0HD+MNRbbQ8BYlN48DivDzlMA5j4AsLEK+pr
	FoZUMZJ8cdIjB/nRvV35la+weNEn86mTB+WocQyZyc4K+KAnxufMxTYm9WIpKYUC
	wbq1mWV24qOXEVeRLAAu0kUb8deVlar41fgcUqzKANnFPsbwUUJxobc7bDOYTn1G
	AWv/6g==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4sa40p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:02:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-792cf44b865so6694137.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789477322; x=1790082122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=;
        b=W/IHlG/d44soI3m2PlWcz6sLhQeOzREj1kcxoGzpOrdcudkXkTUShMTlvs/uphIWmd
         jlAbM0dhdMHOFrYf9rA20n08wqPp5M9uSkSRJDrsrOZtHTfSgLERYfb8h7kA/0K30St0
         nXBdqm0BGTbDPSJOkoe+CnXFr325G2hs76CU5kRmnwsWC8wq+BqlFn8YiegxuFhzkgYl
         ZXa7NiZbAK/fkFPW7JZpvu9YIQ4n5LHGrM2i7P2Ursm1aZPWfa2Gxl0tyPzp1bWvmmxl
         VHBlEI2LjI35RQkdlW8/gzN3dXyGCDtOGFMyEU9L5rgXyEdq02MIeFdzM0j+rvQjRerd
         CpVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477322; x=1790082122;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0TACi45iWjML+NP56x0bPRivduU8gk7mMqeeyrAStfI=;
        b=rc6iPNvVnk74pxC9I+KeelHXqBdUGKjgWzJwcxVO+k2clI1MvoumDG0t6Mf3QEwytn
         DmM4yMEynvwVj1nNLs/wwuDgjmPAPbM6Ow5+pGBsMjxuEpVEaZp+nVOVq8yW6UFTXgkt
         h23b6P9l8kT5l/vlDR44ObmlzZ5eIr8pmkOtaHrffd0ukTuBtsoYvHccoPVsecwFNbPL
         0E9JE6iFu2TGHxM2JmrdJ1Q3vvJ0QBTWbJtgCFyxvqDRXTnWaNG6TKNijURPolBeHVuz
         aU0Yug5zwus7eWjK+AcsSPBrqn57Tt8m0I0DsNyInDrVUcTUoJ/KQIYHAohsfIzP7pk4
         YYDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQTw/UXY+wNU6F9brRgniDjHTW9hseAhk/OKYdeZYbCet0Y7B3TX6WOqGV6JV6u0mTOO3263voQaUJ6tk=@vger.kernel.org
X-Gm-Message-State: AFuF++lfuASb0gG17kNtuqbLNiprNJQ0R3wM0ZfvMHDdo8egxRSsVIf7
	Nd9trVQJraSdgRSNQgOhNTCu1hQ8oPt9BvvbAFHSKd6/ISZpRcCotGytrEmV1WLOrAT2eYwkYHu
	SZZcYeuLdJJoEUDOLJKyjS/bBAjEgEtNSF6johy2n9f0rNWlgPUZbUBEiJUSrCn7eSVY=
X-Gm-Gg: AYBFou06s1G7m/WNAMtNCd5ErSHcyEmTu2ii4LlMBlAcJGNOsf7pvbquKUFa2ZHWCxe
	VXMykWnP8vrMpbN7RBuy6vxFeylDB5TxzvjxzqfdKxJW3lW+t/ubsdAqtCJpXxH4Fa4zgBrdY8J
	84Z7WEsdKgGnhgL6QFxHTgMwdYJq7F4FTEomL9P3+R0Q8GORWUp8b6vIQMWvDLEux6oC2WQzM4T
	qpfhAuqI2BLp6x56GMhV72jnfggCpmRr/Ho0GgjxCh6CUDDhn1Gyx/wLk830zxlTCy8QDdmJxog
	MyOLn8MxwLvRHuGm9k6zi+1wCY9gQih8o2IqOsKrN3q3qWtoOncC7JALuTJMo0Lx+YvDwfnMwq6
	vTWkZBPp0WXGaGqvppOaDvA==
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr2190646137.1.1789477322031;
        Tue, 15 Sep 2026 06:02:02 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:799:e864:aaba with SMTP id ada2fe7eead31-79b58b76fc7mr2190529137.1.1789477321202;
        Tue, 15 Sep 2026 06:02:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3357673sm33700881fa.31.2026.09.15.06.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 06:01:59 -0700 (PDT)
Message-ID: <4047a1ea-f105-4b8d-86c6-8176ed58d9b4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] clk: qcom: rpmhcc: Add LNBB clocks support for
 Glymur
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
 <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-1-d0aa1c60c269@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX0BCAL2pACuxl
 kNSrC7sVhLIO1C8YsDSL2Eh2CpatvrGaqo+QmsO3XXm0UBQytE3kURoLfA74YdmYgvP5Uv4fKLI
 Soxr8nG3iQSuDjxtvRXZSRCQzaqfAFo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4OSBTYWx0ZWRfX0WH9Jw3Nd5Kq
 dpQ1pkfKn9QJIKogToRTAD/GLTYQryF9MgTqf8iruqwMjZR+JyACyo5VAPV/U1a6vh7UfL2cZte
 ppqpjJfK3OPPHxvraEF/L36NFsufq8iLwO+sAOYbTV8hwL9KBuDvmYJL+yEgRB9SU76PfcL3qYC
 HR1PmYbzfzoBqdHMUWfv0cZ6OBMIkoYjen3rL+N262ja0efviITImqlhgm1iiwvXrTN0HlQgnio
 Eyki3NfCRe8tsYxDZDzDkG2SOapBF835I5sV2tGERcjAGfGvbvKrc14QZKgfywYHyNoHdH+FPNT
 QSH6ts6tdRfjSUy6hNzPD1+4vEa3nST5wRS6O+l4UtOWzqYRQfvWc9R9H48dnBFmrQukHadhsVM
 S+Bm9w02AEr23+B6/vzzeMiQ/G+DVkhtP2xS3Hs1FqAj13o5p04myjN1CUwxk+o5C+3BreH/cOq
 jWUUn55Wq2iHbgf0W5w==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa941cb cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dHuaQup7kaPGrqMl_VAA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: sEJfxgvvFuHPhdGv4eYGCIj6Cl9TCF6x
X-Proofpoint-ORIG-GUID: sEJfxgvvFuHPhdGv4eYGCIj6Cl9TCF6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150189

On 9/15/26 2:07 PM, Jagadeesh Kona wrote:
> Add support for rpmh LN_BB_CLK2 and LN_BB_CLK3 clocks on Qualcomm Glymur
> platform.
> 
> Fixes: ebcb9db98bda ("clk: qcom: rpmh: Add support for Glymur rpmh clocks")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

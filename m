Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792578881;
	b=fDFAnKsF3kbfW37BmIIzKEi6wQkg/9ok7IKx61QdqTaG/Xy7I1nrWunzZxqCKv8qLsRL
	 LSYKI+1HP/websRjFk5GW0+y+wkXQnzGfMEY3V6BKwbCsCq0916Ks+ukPXUdWHfdM8MbC
	 xUxBBj2JBBPX/pa1t3wueO1wLTsBa3SobqPzucTQv+s99ggQl5NRhZpIwOxZgytHmGENu
	 3qceq6T0Ag+XVyHE7yx0+cr9s2UWu5ESBvqVNAYGcYbZ7UnUanmIN1ZC4DwouZiOZoAtL
	 sQkOCEGAedbLaD87BlLxpsz9RFLHItmsnnTQPlGpYagY/4KXl/sY1pXHPqxT3iPVPvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792578881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AuVFNaKOTltuLA9Gjq4aqgFIKD0er9JDscoOKBdM2kg=;
	b=Dg/1ZZwmoSS0hBybOuYRyMgwPU6sgPtDXCdJWc8iS0xweuYZ82rG7DS1sTJji3YChdf9
	 XxiUB166q7gUKW605bOz0yZjFJcdIr++kICS1LTqiFrN9w19iDokPFMArEqyvH0bw7QXW
	 SCS5F8GNqNMLu8By0w0U6p1Uk2OwrHx3YsTLxbuMSuLNf7enZAPFyUx/zVBM7i0hjSB5o
	 BCXnHRSCN1Cwpm5vrcU7H7Y9mR8OaBSMvKEZN8d4bgmE+9reMkTQGrauO1rmVkwnDYfFK
	 RrCJB3Go3QVCFOsBIc7aVimiOq6vTjlY3MTpEnb8CGlzuUG53FHTqDpNXf4p5IHwjpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mqZsT/UV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cs597UxU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FEB606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38FEB606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqZsT/UV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cs597UxU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5opp3620537
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AuVFNaKOTltuLA9Gjq4aqgFI
	KD0er9JDscoOKBdM2kg=; b=mqZsT/UVbyb6xJ2sOUDW6VyZkWEBUWWn7tTEBT4T
	Mj/J2h2FI/sd2x6QdAKs8T++jbQyFbUMnAn04k4UHBHWPCbJxavdFDNH0rd7XDFA
	9G0ffL1+2Bagk8vDH/GwaF2zbFc/qhJO7qxEd9WaDf2WpBhB+vgVv6OMtk4pekzR
	e22W/CsqqFIBiQbhn28TnFoTpHahMHej7zKDoDWsO4YuHzfGVh47wHjfchi0hANV
	WWzFBylAg+qM7KsWvpwOcnotJLtp3n1r20wR1G6et0xlysrPNbrB1zBFmXxzQFVp
	sVR2wxveT9hYp6diAB2DvuHj/02/rapY6lWj7lPj0a6+nw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3vy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:34:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso111230185a.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792578880; x=1793183680; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AuVFNaKOTltuLA9Gjq4aqgFIKD0er9JDscoOKBdM2kg=;
        b=cs597UxUtHSBMymdfDpeQ8X9BS+9Wdt7UJSRu80icmPcP46VC3ukyS0ihjAyF277wI
         wcKXhtcOusmAf/yXToUuzX425C3Q+NSNJsv4cW0fG0F3kMsu97qCgtWaWeAaXaW43QRJ
         paKCuvvXg1s33u5xirP+2rLSArCBPfKf1pNkpYyM5glT7C9vPYhKa4BvEDhss976DapD
         gMS7GH0+S9+V4ICTyCoZ3/LJqrZQL7E+O4+D+76BClOgikxgSOvVlT3t7OsO+Hfx7eX5
         cM4DcS3fJPSf3ySwvjIkw1NqkUPE8iaFsa8mKKCQh8AHlpNKiHA7bSQCjLxS1TP1IjdK
         6b1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792578880; x=1793183680;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuVFNaKOTltuLA9Gjq4aqgFIKD0er9JDscoOKBdM2kg=;
        b=AMJd0Te1TtzVW7Vv7KPtf++fwIi1upbwo612r9RHoC5WEXmrgC6eblk6vKQM2+vhkT
         oGK/N/gCmZwo+FYVSVnmJgw3GpLtPU2qk0oUHY277oAAUZnsnrEovtnx2IMV2NeaxmG9
         +nM5i7touzdhk8jrL22DI7g6of/KzmLPPM0LIiYx2sLItucuwsyPu80sSk8zn1sZ/87j
         xzd1P+lFWD48MZnkI2N44eE+fMzZfeER6f5BTKNzMOMg1iSA+0LOuD86QONl1bPPccqi
         +PgwjOsZmE5UnKAMtKe/njMjeSjG9nw8GO1+b4isIS+LfgPfpOoMaSxBklR2zV+A/oc5
         a6Gg==
X-Forwarded-Encrypted: i=1; AKwUvBzFroRnYAA9D8a/0EKjpRw1jvWuWJmg/V+Mxr1mii6PDld71NDOD791Mo2S1LQ5gNj9gYDqdJIuzzBNSlU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpfmbhXeRZjn6yAXKmZqNkqwfDr4hRJwdEea2OJKbEsQgZu6eE
	WwBRp1+bIsloXnL4C3JsmYQ4yAI/sXaQsvVWz24JA7KFFnTC9NlazZMSfYN+Qplw/fScBeLN4yn
	TdpA39qsFFF8xLn6AI4zyD8bQSIk9FlrTPMV8HbPNxJprTDUTtISmg9XJQfuFrHBlUQg=
X-Gm-Gg: AYBFou1XgU3F//0DU1F/HA7veD96Pfm/y/V75NSrGODkWfj6wk3LJX69gbNd4fBYBTR
	9meedJqQttyUTtWApBONgbZSJm1Se1TFYHEh8kEMe8BRixyYRfAS1cX+3y1IAudP1X/yp48oD1X
	Gt0TcsdJXT8zjbq1eLS9hhoumHtbC1eNVYS6t2tOgvbwnsJD5no35QL95GsDDoBKGEKLKLtLcm7
	+sBwH6TunZhbxs/DxGCW2m54j1ZYEMdgaUScxCCRPqjedTZLfglZmI2Mq10fV5joWUlwYPcFCtb
	G5GMBt8CmMArwHSA1S2kciRtBnCK4CT2jbuEXfMC47kVqRbskmDTLFdYhYvn/HcWRX2NjMRFoc7
	QUYXrpfrWodov2K0Y
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr338404985a.55.1792578879510;
        Wed, 21 Oct 2026 03:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:93f:5445:c667 with SMTP id af79cd13be357-93f57f6f700mr338401785a.55.1792578878901;
        Wed, 21 Oct 2026 03:34:38 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25834086sm4741185f8f.34.2026.10.21.03.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:34:38 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:34:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: llcc-qcom: Use lowercase hex consistently
Message-ID: <iqcuopp4vcirhjjjdrnp6apn6tfqb5ziof6nic3u24jpz2jvir@jmhvioyhrznw>
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-lower_case_hex-v1-1-bfac89824646@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX741adPdh+2J5
 EnikENu2/fbxucyINri02bK7GKWiYBFbj8OaZNTKIO0xuMr3dIpMrLLLenlHysWqwP95LSctgOJ
 GTpbYOEJt4cfvw0JddPC5rjYNP9ScKAwMhqn4UwWaAG9uJq+/Ujv/DN0x7E8zPS9zxHPOBAGAUx
 H1+lrGF/m+Si554niYOzQ/YkpFAi40kbn/NubLfInpBV6/PT9NXiYaeiZfQDGrjxx+q2xq03+Rv
 t+eRVkU0UziTGtnkIcb2hvVv4fLLhrxQTwhaeatp1kHXJinPbs9GI3zhyMfmNa7Az/R6oWkxPwk
 QvLspEZ5WjGWF6xedsQ3F61TqDLz9yJgJMPu83e6XkBs0xsYsXCwd0jjaAstspTruOPDO5aTaeV
 TFdYR9TC8B8lQxKsSW1Nj7g8bZmnUTiMR44yhcLsq94eSF1lJbW/AdqwhniIgIkYOakrbRRCJog
 12SFYeTGjxPTGlxVaKw==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad89540 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YGidSu86xR9A4gBwsLMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Nz1pfiBKpi9j22GEilksbgiq6mCjV5qX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MSBTYWx0ZWRfX3oCI5wUyzkYs
 m7FUpwhq70NGOfsKIU5MicqljkgsIT6eV2uyEYjv4xm4kSRi19qJdyTouUxejbBwDUsvuVyvxza
 xYQiumoG2fHwkV3csjTj4G/nHniLSVU=
X-Proofpoint-GUID: Nz1pfiBKpi9j22GEilksbgiq6mCjV5qX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210041

On 26-10-20 22:24:50, Kathiravan Thirumoorthy wrote:
> Convert the hex values in the Glymur and IPQ5424 configurations to
> lowercase so that they are consistent with the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

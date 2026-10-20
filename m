Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792498371;
	b=LHeKFFUemjIomDbwhq+jJI+/PJm9u9OIJoBjIXUOIcHoPqyxyG5lTT45fCo4vQGOYUVd
	 XGV+Gd7ZFWtGAYRXLKcJBjLZ05AARd662qyC25zhhlRC6d/Ac+PtW9MH79O163zVOJXnx
	 fxP3QpfA6QOUnR/KSNQ+OTXxu9YfHXKBeCXetOM05GiFmxpUSoCPDzGKfsDSqJMBRAaCP
	 kD59Gc8ceAEsLGn3G9vnV3Sj3RKgElb4KR6TON1PfdsnR6K8Wbt5ex7yVKxOMqAvmdrpC
	 KrPQ+kSEG3zwHWJUZPfSgdmokdugtwwqllliBOVE3wWFvSk4tPAYPhWu4Nul3O4Fu7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792498371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
	b=1fekK6FyO2SgPuhlAsUwByB7dHfoY3nHdLcSUfh2q99cN9Tsi3eS37d3womQmHwzgMbA
	 To9mdXUmkqkju47GjnLjw07FrsKE6zTON8NCNedRgtHpjfSYkN2Q3SN6XwpaAa9CBM1k2
	 qVnbNaUqyAiYOYGRlWAmyXl8zrorvWv1Er7+K5RfiYUnWhyD4ydQ6czaKLXuh6KKaMgzY
	 3xbdbgqe+CBuS3rxYTcSBEywbEJzEyz5Rul86Guh6HnoA5nD2yqlMDmquRhsxAxtOk2Fo
	 JHx9vxyjszOc+jfFPDdH7o1mF8vAutMUbhoLXAzUjEkMtytnCrIrWRi2DSgpxY9+hPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xohs3uYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6XNMzBB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73EF606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A73EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xohs3uYI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A6XNMzBB
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx7RK2013827
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sUryX+0FjHEbTNaymK2iG7rA
	0dEGvt/oJcLWzKkS8io=; b=Xohs3uYIL0ww0NyrblbGtm+PpOq40M2vBPAFANL9
	PY6Eqm3X9/7ChEA2n0TzRcCUsVv/C4lVqK07HW41T49goqZG6toiutmJefxqJFSp
	zkHnBrEd4BqI9jDPR2Wv4V0Em2VDxSXsBylfZlslaZmrJgN6XYEIZ7qikUl68z9v
	FeGcqR/dJ6uXs6klBisbV53pdFOJmdA3sHflqCSr/cWj+sTPSYSfnJuIDGDCxuPi
	mZ9HOQFpjnZQCwGBird1670WQshX75ljZmPFmKGEqPJrpx8vP2bIhvHcwIpoAJOa
	UGSKbiQmnxEjJo3J9FAGXRDjEtXruMgy8AaEeZXqrHd3lw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjd8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:12:49 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc3a482af7so2633352137.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792498369; x=1793103169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
        b=A6XNMzBBO8GYXQ/i/E7oipglgXHT/Gxh7/83J9Y9fREB+qu+AN1ophY5babQYUHZwl
         JiZUQ2NyVi3fBqk9Nli70vfZQzHruv5V8p09iJKY14/O/1e1QzeG6DmR/Cg4FRTU/Gax
         L0qjd7NaYcOrKVYRz2FC/C57x3KOJTdH2/Aa6TY5PnkbuptO9Jqtl6o1FMHrAcPmpWc0
         lbI7dLBJYxvwM9fqquNUnas7UG+H/UV1z6paLg7XLnxQUCnlPKg0EU2WVLxDixovBXrd
         FejQEZwl3sDsoeWBUqvisvnFhYaVr+JN9Ye1fn2sgAcTmz4UbTIeuX9j1lHAjI6E3RPP
         a7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792498369; x=1793103169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUryX+0FjHEbTNaymK2iG7rA0dEGvt/oJcLWzKkS8io=;
        b=ouRv9kQ7jxySuXdUfv+jBSM7CNzLIcf3t+bC3eVl4w1HZyMgcfjXKKeK9kfZfmXHxA
         y0sq0OA4DHtOzSnUnKjDuGTKyQm9V2a4m7qgQZsO44od1SN5nHvGHnRz3pM1P1Swe5n9
         Lzqci8yfumWiMtf5SV5U0cA5B0Q9yAOaw5AryQUoZhLWPwfpD0mHUzvJWyutn7ZUQguQ
         NN31j5ozvE85dpmNDtwrKn8rp5fUp8hEOgJnRjaiGff2et1sjAMpAV9ATflwllkedJZw
         tbXeSA19Fyctbtsh0hKpYViLUgmgEIZCttb4b2HwUNtPaXAhNHW4zw624gzzIut1UppL
         qfqw==
X-Forwarded-Encrypted: i=1; AKwUvBwTHDuXwutqHgKSLLkMUjtGAqwK7qSVSNFr6jIrMnmfix7cF3gKA+Aw+KB0z2mHoC54eZKJeO/idm7KGOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyVlIKvZkOyQsLuir6dVmnWO2ewL+hwE92fcE44hTjnr5usL7N
	IDE+JRn/Mw8g0wc9AoTjCcD72B52nr/vpLt450vLPJUGqaotG3X7GzsDrmZPXHKqLc7MSB/0DSh
	1AKHXzNtZ5D5eZlTf+g0AsKAuM5KX7huVmhRy2H26RMSCFb398QZCtnDw1eYcqAwaVkg=
X-Gm-Gg: AYBFou0N9QdLQ3Nn1yxcASXmDNTs+Be6YkKdqkISrrTfQ6sSli+fE/Kk+GOdHlSxNOG
	NpyoUV8jwkMLfdYVX9uV2n9TIsOL/a4+6xXV8Oo/zAZgzXkM2J7oUSnSYIA7XW5mUNJYmvvtYZE
	E4ID6tdFB1IR0rNnIFoUeFIiyzmKckdVuxZmvM4Ob7zG9+73pnV6K2UGAjuwIN9Q+QU1R0aBei7
	028CvReSYAu8XFg5DvYFiKdgSsHc0Qj7QUBBuXhs3NoKp2fTxq4CqLqyobiSMtEimSOoZI152O4
	nhQY75suKkR8vDAwRtLdcYmUgMPg3jslzgdg7rv5XA2wJJU4e07jrOne9uUGZz6LExMPPPivj4J
	UkgG2QyV0+yrFCZK8
X-Received: by 2002:a05:6102:2c8e:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7cc36a4cd38mr3055825137.23.1792498368767;
        Tue, 20 Oct 2026 05:12:48 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8e:b0:7cc:2712:caf2 with SMTP id ada2fe7eead31-7cc36a4cd38mr3055811137.23.1792498368097;
        Tue, 20 Oct 2026 05:12:48 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cdf2f0d1sm205783705e9.2.2026.10.20.05.12.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:12:47 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:12:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] arm64: dts: qcom: lemans: Add label for firmware
 and reserved-memory
Message-ID: <rhh7s766m77am3yfktpeaikyswehfn5pa3l3hsbd2ugegmq4te@4rea24zv6an2>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261015023711.721837-5-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad75ac1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8WBkPR08O5TzQ9HkguUA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: cRzT4NAQconxZWi4TH3eUkTQCqUtROEF
X-Proofpoint-GUID: cRzT4NAQconxZWi4TH3eUkTQCqUtROEF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX44zjMDvN9U6i
 YXifmSAgi0y2lA1xpW0Dnn0Ud5HmV8mhit9uTlQtGEF4Izgl06UgMt6mGd49lPS1jQR+pF/Jjye
 0C1jgrAHoZ6/vPzbv4n3tJiiQT6Wjk3OxupE97zULIZKqjg9P1YeJsxo2/xeF2scba4h24uiMvu
 SOklRHy0DSNfJEfLWOGyH7k1zLHPYoRVKypHsEnUL6JPltyrT2sSgcguf50X6OEW2dzcz9pXFE/
 Y7SMGzTq1S5+Soj1ALtKkdYPqJfvqPtMRkCLh5urWHvghc+tHI8xF7GBeJLp8t+ESy5IifAdgmc
 fdUf0X4ldAmWAi/t0p3imLodupqN+DRBSGYtxaOLEJkOELOCD3ia7rfSKaSnBPK9oUpSXPbteEK
 RJ4dtgw+3bZctLaJjZ0O7DcC6gv6vkxOLbkTSiUtww/ZT5etlNAFcbnHtX+jUnHbTDiwYZy1DB1
 K4++YorT2r+Bzlc8yEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0OCBTYWx0ZWRfX9dNPDdtjkrX/
 7ONbhOmhzj8IpMlrstgTGE/ad4wIoQpPE3bBW7B2JoGZhcV8FljKXtMIoYJL/uurANO9tAZHVoA
 A4vihHjbBVQ/h4cVYi7RKL7QHByCYL4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200048

On 26-10-15 10:37:08, Shawn Guo wrote:
> Add label for firmware and reserved-memory node to make it easier for user
> to override the default configuration.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

This could've been part of patch 5. In any case:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

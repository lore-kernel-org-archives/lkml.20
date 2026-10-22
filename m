Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665300;
	b=PWr0IK1JSECl88SaJSPx57fsmGlL8vRSbcJGj/2j6RyiKTNvhnz6ngVHb/FmE2dj24E0
	 Bv+Hrk/E2awkpq+6i/tiwcoxDXF738hrmy/WvScGcUw4UpKhloUuZok8+RJO82VbUkJOZ
	 JN/Bsv2qwrC3xmiNgRzCzQvUwW7XZgbMS0gFI1e2lXC/dYZKu3d44NM3sxxHQ0YthgIm+
	 oQsGF049FKYXc/3EoaL3DzKLx0qoVhJjClAfD1EigsEGHGcjplwiHbmziXw28sydwDGDr
	 LpjR1tdjAJMeruYvad8cs6VQvfyrOftrGpVPKqM3gKztvXYvbPfucmOQQJLxz9PTICQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665300;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
	b=uf+08u2M5dKQPt5bSNY9aAm2gZG9VJHpPdH2GLWugnDKzt/QdEEWccaetlIVbB3g6ABv
	 5CzoDF+k0zU05y5XHFRkpJkZa6pN6HaBZlHtM7SEFYSiGkPocx2WBgB75tzm0qdr5R2yi
	 gRqkmEhoxytL5pQbRHMV2eclU/ALLFN6Xx2rPfwdgV9h1vVKxWm04ijFxe+UT4XD7afIJ
	 A34hb2/LH7N20zoyhXjo0w83ggIyXwfqgqvsl4SXV4/NnXaIG5pUhXMOhBAvQOnusdGZp
	 rMzyMxw8SZFLMeQSdwaZMakJ/ZxHGRSvYrLkWLgnWJiRrBFetc0mRe40nLw9gh8YQKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VWISRxhN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikd4WZlb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A3606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A99A3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VWISRxhN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikd4WZlb
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA06i13427093
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3pHu6LTjqoRt1XRVtGAiHjX9
	/n4iotAtMTU04HWhmxI=; b=VWISRxhNU0Z9f8W8Eo6YwzGdm2GxsJYopgUdjPsh
	ZoCXQI0503VJ0bqYyuHXv/7q0Tsh6AWOhWlVQzkOeB2gzvQmqTDzW8N3ySstNWlQ
	FbhJQBKwwgm1Ojz7QITHtIS5ffjzZm1s2u0FLuhKtVT8JXSIltZ+VyJYu9ZlmqPX
	cv6KZt90S532TJ3Bui6H0RJbpz74gL1Cm92Eca4CQFNHMbFvpHOi6Frrq7pOZ9Cm
	RI/DzjokBPMjfJj5wL3A77vpvODd54QIY19+bPgxfZb8aLhgQ0NWBC/4UN3EXgQ9
	4zpfUbM6B0xSr1o9wC/1NbAx+8fmrnYXXV5QiX7QQ2fVrw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0rgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so163288985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665298; x=1793270098; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
        b=Ikd4WZlb0/PPqkdcx7fozeeQSdoBK9WayV0/fpfo1nkysx7ADVsyBGyRNjx9nVa2HD
         KMXGTtI8nyUT7cd2+0ESvBfUQ8tMFho7XiazmYH5HNqb32zyZMV5O2GLu1T6lUd0qCLM
         Po8uFYjydZxVr8F9jl7slfe35mQCcBlm5b9T9hdEbXcsw6LS1KNFVFzofuqKhyI3FlR/
         dhCRC7wPmRfJOTbV6PUIkunoSkuGT7cUi3sRIJVmxcpsZ5elVyE9MobIlb9TzBo/px4A
         WqQZcQ6NBaZTjrrDOhkX+2af6U5i+lj1IQ6hXiHdyNwGt5MV1it9hxuPLPs77YJhuEG/
         HBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665298; x=1793270098;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3pHu6LTjqoRt1XRVtGAiHjX9/n4iotAtMTU04HWhmxI=;
        b=pXzaspWQRHZf3DF5APBdUxQAK9V4Qv79yU7R/WLAkAt5bWyGqKeNl8LrfA/VUyEr0x
         QWQ8Fpk42NfP1P+WM7AHS1PALND2Qj4NPfCdaMGcLE97qBUkjKWjCGO2dTFNsDgEeyl+
         bJNE8fkiD2o8faB5z7pjL4JuLFe7HR224EyV1CQOd0KwG28hg0rEOzYLb16In/ywDXBh
         km/06hmXaQ2H8Unbmv5o5EZNyRI4wcTRtbg6gPikXW8VDzUaAHB5+UbT+ffrQsIHSOHY
         kBLz3Rb1QChQHnHnyd0WuDlvSsPHeXqaOghv3kYVokEbdxZwRCH1sHlkn5e4K6Ffk4LH
         ZGrw==
X-Forwarded-Encrypted: i=1; AKwUvBwOe7p29/NtPzWQiRCulliesmrDGCUr4Pn4nTr+LCy9doQ1sLCWQT/kyNH4BmhzM63Cn7ZY6rxx+GmDcfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJkDi1TBaaDIVb4Zol3edxl9QRcJ3+rGCZe9rm6Ql+NDS7dtNNY
	DS4j34xtWj1HwfDjCgq6NrdLmmyai4LZKP6wVSI21UT7GwgyMmeWLAtnOsrN9dPNL0P63SoLYaF
	WSshoXMTqvcGydP4MrST8jKIzw34fTlsfTIk3dFtEuWGdjvyXmI0GNTpUgLg9K9HlMxFIaj4wMw
	s=
X-Gm-Gg: AYBFou1u5emApzXXAJTGJL3TLzr3DEZFak0P1ltUytymhhymohKbexuhHhNxqGpUltO
	5n/MGUnfYi50GjAnBMuqtwlY00NY6OL+6lm/Z3u+hPc6+g4B/NWqMT6aFFhfCI9g0SMTZOETN2y
	f2P021IolWRjjmJ37M7nUoCT3YBgZ8Z/chwRwbk+/lwpmW5mGfrSz5QCq5Gsm/QqaGALZcxOIu7
	O2vjBMinx/G6v+5iZncDlfOKyvEWa2aG6KNnahywJp3Ko0e9wnUK95FTcxDPrmuULA1HaruhYtM
	tmWHDQpTKjv+S5Z89XhI+PAtU4O6J87PgCkcuNzMcln4HG3+TRe/gI1rOWB7wCEpcmXKZEOubHB
	lT/IN3ivXKN3qlq6qKLOarykoCCXGyHzDv7H3CSgRFKo6qIr8saQ1iNyjvAoLzchvMtf44cCtdZ
	RciDA1YyeAJDJ0
X-Received: by 2002:a05:620a:4481:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f57e3fd7cmr836830385a.12.1792665298239;
        Thu, 22 Oct 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:93e:60e8:c9ad with SMTP id af79cd13be357-93f57e3fd7cmr836827285a.12.1792665297749;
        Thu, 22 Oct 2026 03:34:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1b94eb2sm951886e87.45.2026.10.22.03.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:56 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8550-qrd: add DisplayPort audio
 playback support
Message-ID: <y2llowqlazb7phr42o3v5qvjk6qkixgbc5el5wdcb6knoru6rx@qy2q23s5d5wr>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-3-8a189c71938c@linaro.org>
X-Proofpoint-GUID: 1d6GgKFjE2Eii6B1arfeedRiD48pcVuW
X-Proofpoint-ORIG-GUID: 1d6GgKFjE2Eii6B1arfeedRiD48pcVuW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX00eJHdO1ILg3
 1kr0jrSS2zvcNGuhFZziH6R6kZ4HIWP+9ptbUocZwWacppKkjxDACB0pJQnqJe2ptNWQgyHQl5e
 tPtX2zWHyk7YHkpW3qL8ysYOyeEZ8/c=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9e6d2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX30YXgMgccvRi
 rmDl1wOoouqATBh3rh/oH4ge/B+eq+4rSKPoMSKjWWLdLIQWeoTnsOGQHCPsRQ3y3Kq4K3qXtef
 DlFSj3V/mjbAi5TTdU9MLdrEjSnxmQe1egVyoNlyKtBBaJ8nLRaOJdGk5DEcq82nUKm5HN7C02f
 xkBfhJ8yC1Z5IO/6ntkCseSMD+dj3L65rScR8vNfWIhOGmG6vVJ7Rz6dlwPNE/kmZjDYLFLlB3M
 moq1tacyj3SiPxst/J0CpVpcu///kgdBlPXWIjH4DsDC3XN3RWxgWE1f7Iy6xXpJwVcH0bjdhWE
 Jhzd6kfihCGGCWqRz+ng2btpva9OqRTc3NuMJcm9jWPSd5BglKhXr/8HMMVng0M+9azziceP8zw
 sS8kItAExGHUk5IYQgm2luwcg/wQZhd5lSbKD5QcxnLgD6MpXakPOE0gQKa/a7SrrlGvaHlMdPM
 S7PiNdrEEkenZ8rce6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:23AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

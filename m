Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655838;
	b=u+BJQvj2SWBir6rO9JqJGp++sVD9xJteU6VSmxVsAmFJMaVw0QyNQZ2r2UdV+pSCXhsg
	 e1qlXuoy6kRsDKddVTSYvwVUt7uIyoAXoHOahzDQWU5GHV4Cd8SLWLXHSppYdz5JXm3xa
	 RI0SJlry5U//t4oH2/DtjU9dXfU+L4NWyQLy6FTR+BiWKp8CBbBirHixZk0sJN2j7XrGA
	 1G19Ee6q1GljmKnNwgFYTYQjZd86IzfgCAI91nepmyZwYaO5ojm6HGvdrepk3DkmHwEHF
	 bxkg/QvbNFPivgIRGl5VMF1QmX96tU/wxj7ae7sHHqg4qJXCf8HyNU6Dxyv6wVODAWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
	b=Q3sp2mfXH7JT9KUQ5Hj4MzrFHulHWUrstD+B7cClCDzdLQ9aTh1nsbHC5jGW2xoFRnyw
	 e3sW0xgiBD/lTyRxdw/xQ432A/MfesfKXk+J8JnuA2RuimOu0Pql5lGQ+sDX/5Bp7+6pN
	 S9FLhNIjvsnLTkDeHxBZl1fMqLE/2e51VLeL2PMr+OBg4zqpJzQozVZPfdU9EYGpcdfoG
	 Rwr+j7t1eBEriZ6bj+SjMCS/A1821bhjwounpMcRgkEz0TR23z1HP9VsMGz/6HdHxisuk
	 E3X8bVmdwar+rBffirGfoqyZS0p4bJ/KBrVKDFN5MtxMxLg7wGNCy3r+TUaGx4F85Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey0mmwdI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxTi5qOy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EE8606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8EE8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ey0mmwdI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QxTi5qOy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70FeR2516207
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=; b=Ey0mmwdIGvQ01Sx6
	4L1N6VQ9B66ThUSSp5oRGF0TM1LuUIpSFQdcJDgxDW0qDc5I6BktlskV+x58Rjui
	YKATMBnfwyoV0P+1fHLGXony60TXEs3CbqBwCsg1kAVU0KbH67qV7Ojpn3LnyZTp
	KvOJa9D6v6qgvSV9lw9AQWYb25bdhWkPcT9usBjiNktbLLpn41LsWHePPkhrxToe
	nYlFa7koonTz3ACgSBiOlsdUdTDJ6N8YHtBj6lWnL2fR55UgEczmfRJr6Wt/Nr69
	JPRJqPiMcwICnKoZBnzZtQ7cXSBhe3hG+ndKMZD8uwyxr49+bXSWZayIdtzqolLv
	vqWsVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a9bq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:57:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1440e081so37372085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655836; x=1793260636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
        b=QxTi5qOyh42Itp86UZAeExknuxu//wDA0xEJhAqdPtYl45cynBRplNhNlKJwAc66me
         iz9n+hd8tPD8O8JzjZ+YpRNBlikKev44/fxJXRohhDhs6NVoHWKmS3FO4WdT3E2TJ39v
         1zWwPZI0CQZ5+3g8KI98Bpf+ZkoSJwexGMyRSVUpVGIU2oHPlSLxX44tvjoaJdSyMewz
         e+00ilTo86PvDAYwY+CSU4gy9axNmt3qYWds3eh5mDZqvq16CGsSX3aWVGD65tHQEmnn
         10CS1WkZm6eIlrrzeOYdqoxAOohJPUCGcsvHsCkZeii5fLKoLQUmtxWTdDKxH7Lp52V7
         B7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655836; x=1793260636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J/8G8u/GUEqT7hbge7ssUJBRPJYsFNJKrWSeXNi30Q0=;
        b=exuyY9kFEIuo1DCguZ5OWR9A/wUBC0nn49xcAO/NtT66tgB9g6IuTmnkZ7Tkjc0pa7
         Z09PXlAfeCLTCqr/rJ+7OdyvMVLINcJEt4nGTo0FcYE0NynMwiuoPT06+sjVwk35qRl4
         iF3ssOCzHBcM+OIh1ahkQJ9VwiB47+d3JGyJV7nl2bYPwIEQObN2wvNNCjvrFiivmbuV
         9ewpaOkOllJQ+ji6opVgEpJmmOl6/1yn4CUsp5UvBh99B87J2vss3FSIFp1g7yYQkdJt
         9TYy+//2reYjqihnmDvPOgq5W7qo+jDq1b56NeTqyglNv7q4OKbi3+FGMPUKZLQe+ENC
         q6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBwJU7vXzhcjA1swN7A7q5LH3HX7P3otPYkcAyQM2VlDghC+pWQrkc4xEryaUv2L99aFQuzqOzIb/47JvkA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6v29TSQKzjDn1PgJtseqHFXWiyk/6oYnqK4WXW3sJsEcy7SCh
	vGa+NCmAMBl7d8yJWK/SDJjowwOZJx6DvqYqKU3LsP24nRTbC6GFkDZaWeVK45jKXLXY5FdiMOL
	Uq0JsHX/Ss73fClWBEkcQ8ME5lerrDt6Jz/BKkrX2bZNC7Jp5xNPG59zWlKQmjsoZuMQ=
X-Gm-Gg: AYBFou3YgastJ/gQ/N7SE1l9EXly1Y3FWGQYmxR3Dlao1VCyOctUq53s+hFRn0Fi/mM
	5xCkhEIY52GEori6UXk609PAz+1Xwi4bvUWEeQQ1FFuFtpDiwSabACmBhW2GTMlLUS2TlHsj5Vb
	xeTzeQCb9KVYnFl88RKH9Tm6H/eEv9a/QuZrzwui1bSU7wE46LYjbdlX0bYQI5f1jHIiCyOYA/x
	qQTsBaV1GM0tY0XX+w/5i+jHR0Ih+3OaskOnuDgajH/TpRPPXUIg5m/LRqz2DM5VeTVwo4koIz2
	FfYluAi5Gs0DuWPJjMmGG5jZF3JHwo/fzyszKZUQnr5cvKgwGgry9U9togRbZE6w+tZcisy/KF6
	qmaxbAMgqELfo66gswWez/Q==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr929995885a.2.1792655835832;
        Thu, 22 Oct 2026 00:57:15 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr929994185a.2.1792655835451;
        Thu, 22 Oct 2026 00:57:15 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a61a2bcsm75777166b.87.2026.10.22.00.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:57:14 -0700 (PDT)
Message-ID: <1b31946a-9170-410c-b882-34e8b2b8c812@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:57:12 +0200
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
Subject: Re: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-2-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-2-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9c1dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=9Jw45f44HywjUvPVWqEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: OVUCUEhUMapjO0Iu7kXqem2b6Bfp8xWH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX4E5s99dkHnch
 GrkFaMlaU2b8rqLHLGZxewP1WAyYfI4RnN6378JDDSG4Gbe3smX0Fd8HgN6o8gm4C5mp5wID91I
 lnVirRhbHL/hipVXX5EzMbXZOB+3rvU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfXw/g+0uhFrZNC
 zhLvtzbq7gpbPLMkywOqdrkXSBdLjSrnpUAlmGocBugNvxAZMiB1YVltH6cjVp9/B/gIDxmgC62
 Di0XqHRVryPP7FJKkPkJRfCKNcQxXPW0ThzpkdAIVBlSOY9MDDEopjkdZJ25KW2auSziqbgT9gC
 w6y9rLu1xmW0wlYMqL5An7xL6HAhXmiFZI0yAodjc0bHTfB8h5Vl/j03as5HZ3wP719/S4yGxuQ
 YJ+ih/1tqnHbV25TkMJuko37KKKv2j8ntK/skdbvYKlg7+9iZv8uEbeVkh19T8zmfhnpszGYcho
 2BInDVeySLB8XvCBzhIwOMlU/xzpZH4Wq+5kiTfihA3wNSmjZX2qYAKnE9+RUqtvNUAU82LocYq
 BOYL2DjgJ9JDQicl8iilagr0sI9XGifN1cXse7qljMNtg7dZO1bt80jQzn9+fugWIGmcwG2z/bA
 CZH4aQ0Dj0jGhMleR1g==
X-Proofpoint-GUID: OVUCUEhUMapjO0Iu7kXqem2b6Bfp8xWH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


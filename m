Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793864785;
	b=0+JcXYxELXCJ+LXL4MEu16APtF40v7wOmPHotUqi77ldkQv/4TKINEdP2DSEJ1lmHVh+
	 L+lqyCj3IaOlrU1TVNaWEZaAaFa1X4Wwt4ENX0idTdtW+YjnFiahfRzINl5tMGx+Nzn0S
	 t7J6fCWXnRfuZgom2aFfzBEfFtSVbZjJw/FBIDeIzAyeNv2gCq1srwGvTqplLZUB7b/Kk
	 WaH4kzs7jygEiXMhrE8pEYx8af4coI7m46ER6dG25jKT1YZYEXqmqJkiWJ+Ml/Jq5TNMn
	 rSGW9Os6/a9kvbkeVdJ6DGhgmmMwykZshUmI/TgUhMyKnAgd1ZjIVEcEqBh6/JZkbqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793864785;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=;
	b=UJTSYABujGYB7myFIp8fNTik+KBW0yqOH6DKTZnQXGGDW5sJ6rBOokIbrBxC4rrzUv6q
	 vs7TykwNK+VoRXVCiG8Y4vtmXQn3jkZQm06PKhvHrqrwWQliEiZxYp1Bx8fYwuukc2ewz
	 CM+91NXreGBDUwjoXbi4AtY9/QPdLOpqSNpDfK5nQV+5SF7uI7BEKeJtk67riw+4V/2VX
	 KYv6teYxQNxpyEv07ebdACWlcdyWtN+PmVsZfv4y/BfN6we21OLI4hDwnAHOG4dpBxfUO
	 sfxFheREUq03zoY89qWLDCU8CuuXyyinqofLJ9khMy6wpWij9+xOQliImYq93oD0arQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ny7Pn4T9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QalpQnIF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE687606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE687606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ny7Pn4T9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QalpQnIF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UCis3819755
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 07:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=; b=Ny7Pn4T9zNTbttOf
	S5u4oGKy5yo1pVDCEdksBS0LxD+/oxIbFhBrki0GJSDGdvUWj5YostoFvUy/tLRf
	aw7dGtHJpgn3pcVsgdixt2kdChsfDE+wRD9m9sA6SZxSgGP83Yxt5r3szAB7PSQW
	XhnJ0WZO0pWydJ7EyA9Ev+XlqcHaidaXQFPFKWMskjBJ7ErWnHdLNgmOP5DVxmp5
	NQv66AxQIR1I80PD9V+06qdmo1t0BYSZ9Z2PUYUGV9X85re4NVHYi25w0R5Cpj1m
	lyj6u8Q+S3z9RSOweCp9FwUIKthJPi98CBx4ne6O7DABOYKXAleJjrccLPnmxY+l
	0wlcbg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tjs4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:46:23 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01e2962a1so1550794b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793864783; x=1794469583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=;
        b=QalpQnIFJQEKxPRgTy/Gzq+jfWTbm14/TVkBsUphe27wfVktjPoTCvIFYDiVVPbLeH
         NaNVflaqv/OZcVP4EAS2Xkk+OEPkrddxIZ1A5rZqbKQuBvABpx0fiGYMU2x1x2X7BDDH
         E27lsHgGWkTbaQLspUw4M91CzvMaved5CZWsirma9Hb8H686JOSQ8acblVWRx+X2DSSj
         pc2O09YVV3lqVhHzbhdjN2xnywqSFgW9sWpmmTOmIs+HJ8jeJOjam/y3c0HKWfh1Di4J
         b+HSEkOqrI+qxcpExp63haaX2Y2UTwBkDm5ULwdoS/YXpu8Rs2AMuWMoOi2Pusue+fW0
         k3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793864783; x=1794469583;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7hmEknDApjfBB760FHE5yV7NCo/d+7W5Ac06Y52WzTk=;
        b=c3Uno2p/nRSrjmlvUwRnFoocPTYs5yJlaBM5UYmKR91vZjHbxP7QG/+odklfhqi9eI
         PSD3/x1cYgYwKRp8yvR7nBvqg0EkWRpyBmfqC0NQab/1W5cPg1Alhwbji0/3x8INtxj6
         yAfXFKwdCUJtr4LyyRaeBvZ7fDccme9rF6d81e298MAnPTVoNy0dyqkexTrfyz1i4jTd
         X4HWq1osxFMKfL9nG/X2Kquk/VUD1OfqficfF8lYFl0BBH4b5l+hsztVVyQJzBK9Gae0
         XSJLdkeyL+pQGqS3W3odbDqYiPOZnc/Az0359Dn+B8tc6D3H5UTj83CK3tDQb9wzIaER
         KYjQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3T0hR/fXD1yqyO8pmnT581WTsT6/wsFoTdElqrnkKUvVkn/4nFC8mS/RSzqDEqOOl6+Komz/vg2RA/6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DJu9cUnumjUTIwm1lGJFKQ27OBrMBGCHJG+YSIIPDlyDBVptU
	5gd3YR6yOpRCfMLsEEK8pgJFOiBp+R0QZLzamlpFkEOBfd0Kf6JTRzM2RqC9qPOoZKJMF3kYsck
	hTtc+dlaJYvHfNkZAvotvFJTB6FQOfPIgCFZ3qwdUZmjtCL0C9PtDPCOX2UGAn2+LUg==
X-Gm-Gg: AYBFou2CRb4P2pa0z4RM/Xo952Ze4Rb3FDfHYT9LTU0AIPuJ8UQ7ayHZxJsSePo3k+M
	VFjL84OvjhI2jsQCisPsULN5ObogJmPqk2ZB92F4Rj9N8f9afRFxuS3/9Q6jPQ6ClNinhGs1CT2
	v4oXhPB2HbDpYs2Q6oB6iCn8wqUJ5xWjbGG/SP4XIDg+naFvgr4eId63HJCc1+mdHSceC4EsLUN
	6ZUT7epzUmUv8BsNB0wbT64UjqvAU4boqSeQNpwrjwT0rtk0AzAwVTYbmJyT+ePYm4o3goRP7jZ
	c/6ygm2QLsjH2aOMio6OLE+eGR4IpxTenhrwn32WV95P99rOsVReihl22QWaJSoxJ09bGTLZHJA
	/5/qIls7wvS4Dl+9Nc+Moeg6ps+kXAsxtP3Q5c14ofMuqUsAV5FnodlsZVZ6ZxAY0rT6cnMqi8W
	kYAdMr
X-Received: by 2002:a05:6a20:7f90:b0:3e2:6ee4:a758 with SMTP id adf61e73a8af0-3e928de07a2mr15987014637.54.1793864782663;
        Wed, 04 Nov 2026 23:46:22 -0800 (PST)
X-Received: by 2002:a05:6a20:7f90:b0:3e2:6ee4:a758 with SMTP id adf61e73a8af0-3e928de07a2mr15986999637.54.1793864782211;
        Wed, 04 Nov 2026 23:46:22 -0800 (PST)
Received: from [10.218.26.184] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb4693fef8sm1887983a12.17.2026.11.04.23.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 23:46:21 -0800 (PST)
Message-ID: <14d9e262-c3e6-41b4-a408-3d12185b0d48@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 13:16:17 +0530
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
Subject: Re: [PATCH v3] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260227111051.1789439-1-pussin@qti.qualcomm.com>
 <7a92ca6c-cc66-486f-b297-cb2907e1c0e6@oss.qualcomm.com>
Content-Language: en-US
From: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
In-Reply-To: <7a92ca6c-cc66-486f-b297-cb2907e1c0e6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzMCBTYWx0ZWRfX88epHQftFFjC
 T+/cHId7SqRZZsTGjE5CVoNQwjLQz4Lj6Jn2VYLJbuzBjjJQMZrXSa2wcYWG+MxbaUFtQQe3SNQ
 zYM7Okc+720QVF8UeCTwz3EVnfugp0Q=
X-Proofpoint-ORIG-GUID: C1U5Po61TkeaGbrpUNY2qtOnEzKCvZSz
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec344f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4pBTPSVEyfT0CdRydYkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: C1U5Po61TkeaGbrpUNY2qtOnEzKCvZSz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzMCBTYWx0ZWRfX+YhX15n9eFjT
 f6o04C3Sy3YzyMSrLzxvnDh3fr+jvEmo/aePlXs0zSGQX4QGGkmruJzZbID7xNY8cQzlmcswH5B
 NgPCUJTmRhtuQp7lCeaE684FCVsR3ZzWbkwGH/06ox+OpeFzdb8h23RddxH9uJlLYBLSZj84TdK
 dFqt9/56sbiiQnB6fDcFzmN0Du9VFy2F+QQLam8S2FkqOBXRQGD+XAnzfegCC4NhoxExkbLKEKE
 O7fRdqKPfgVFqWNruF8vWDg1FCpYnJBZTRC95mcW4Yp0Vlo6RuiqfD9PfkqAda9vGy35PeQnVKF
 GziLQ8NIsvmPPBtxGUbU2g/wmuAhWR86TQyurIHS+3CMAmrqQjENIKZQrrGs7XD34QSgH7nRZUe
 2MK3YhdQQJKLL1CR1gFKbt0Lp6A7Yb+gdfdiz/duqECBJV8Xe66nAY2P9vWI+9aGxDHMp+cUKQz
 ssq62OmwCQE+/gU/vEA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050030



On 6/16/2026 5:09 PM, Konrad Dybcio wrote:
> On 2/27/26 12:10 PM, Pushpendra Singh wrote:
>> From: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>>
>> Reduce zone1_thres_count from 16 to 3 so the driver can lower the bus
>> vote after 3 sample windows instead of waiting for 16. The previous
>> 16‑window delay (~64 ms) is too long at higher FPS workloads,
>> causing delayed decision making and measurable power regression.
>>
>> Empirical tuning showed that lower values (e.g., 2) made bwmon behavior
>> jittery, while higher values (4–6) were stable but less responsive and
>> reduced power savings. A value of 3 provided the best balance: responsive
>> enough for timely power reduction while maintaining stable bwmon
>> operation.
>>
>> Significant power savings were observed across multiple use cases when
>> reducing the threshold from 16 to 3:
>>
>> USECASE			zone1_thres_count=16     zone1_thres_count=3
>> 4K video playback	   236.15 mA                  203.15 mA
>> Sleep			    7mA			        6.9mA
>> Display (idle display)	  71.95mA			67.11mA
>>
>> Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
>> Signed-off-by: Pushpendra Singh <pussin@qti.qualcomm.com>
>> ---
> 
> Since this patch does not seem to be moving on its own, I will gladly
> hijack the discussion..
> 
> I was wondering if we could transplant the bwmon devfreq+governor+memlat
> setup from downstream. It seems to be way "smarter", in the sense that
> it keeps some hysteresis information, unlike icc-bwmon, which is purely
> reactive to immediate signals, in addition to (in my brief understanding)
> sampling other data sources, such as the PMU 
> 
Thanks for the suggestion.The downstream solution explores a broader policy space with additional inputs and hysteresis. It is an interesting direction, though evaluating such an approach would likely be a separate discussion.
For this series, we are focusing on a small tuning of the existing icc-bwmon behavior. Based on our latest validation, reducing zone1_thres_count improves responsiveness to decreasing bandwidth demand, allowing DDR and LLCC votes to be reduced sooner and resulting in measurable power savings.

Thanks,
Pushpendra

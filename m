Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577637;
	b=uNnF09JYgEYQRRJnHeFoZqeAhHayk/1ASkxHY0zh78kUeR+EHD68FEFUH4KjccwdTaRq
	 hi/K06z0A6QnWx+yZVOSJNyyu1Hmbsc0CMQNArmxUzw6TGV2JXLmsMm5DBtPlAXCgMG+R
	 LnqGWDwY0SyvvpGVPgWqqjA1KL71teqEMc1KQ+vI2E68Te1QNjvRXeJFhovMia62woMku
	 z26M60njdII2A2MsywX4cGMMTz9QSy8dII+70YNfLvyMsqPN01QXTjEaW86qztl4rfMmq
	 fl5zT/e9djyQZ8GgGHC9s3Z2Q6Q3mmshcfv3wcFKEQutiXXrK+8x8zAwOGSEuPutJzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
	b=3ttbeGh+RmSn35lGgi+vMBy8OfzjolTDTEf3akUzujcMmRk/LaOFM0BmB08rknNzzveR
	 W7DaJZj1zBsUF2VInJQh3022mCEUHcXguboxzvYTDBbfrGHh6KVfMm2QcNsTCZT070Xla
	 zBOx6wuT/wv+yIZfr5HDxcmAgwu0wAvJO0PyNJHUAqVHs0je/Mo2cKUQAohQV0LUhAuhq
	 M165cT9PhEKk8GV8ZymFEhtpmdw8bRpIxKn75QBrkiRBGRaGfho/p8UV5TL3BpW3CuuvB
	 HQgz6hGbXB07HuojIbmzNHalr2afEojF3puprZZ64Q1HgBNZRYIJdN/kqyLukO0VqJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVzNUnuj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRdCIOL2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BCD606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:13:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BCD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iVzNUnuj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRdCIOL2
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA6HKx4170559
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:13:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=; b=iVzNUnujYHA3V9R7
	hcOuAWdvNdtyjm2mjF82GXc6S3/HAqgRlEIhBzHwGMrldPe2Rg8y9hVVTLOVG/rn
	sKAyQVFsSLh+z46A8K4s2Teiwxb//N418PEZtFBUu1mwpfc2NVojXjVgl7hqwUhP
	VB/me1qJd8dZhjBtKtvMXNFScA2uA5gofh2thSqjMDKD7BFOVXxuzPXZcWffSz3b
	eKKIeCuh7HBegJk+taiZNXJXoxAoa9HQXzAw2Z1Yj+N2JaGStAJOTvRLTKymxb0c
	4z4Y9V/Mog5cym5TYrlKCOTa5hVeLHAHqdysoObK/EelBrgE1DAZT7oPsdIdOfcS
	C0JMqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hudg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:13:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so8989185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577630; x=1793182430; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
        b=WRdCIOL2DLoIdAdg2NhJrfORU8NKBUCbqn9NVMtLiDUA6sUZm4fZhR9rruEcGz/4Kn
         EWoxzihxfwrqnzMt5OEF+iADdp9lAYASBYv3aMvbEg/IM2/Ml3r68Db7ZZiz/po9Zqz9
         ZXEPE+4svlE3eL8imjn3jhZh1+i36cG/YVOizbT0bn3eibE4X6jsiZb7qqMk9A1NuTD7
         LvdX8ythKCWUef4g4BwPKjnjsnaGGwBSo1VSdAqVUMTEM903NjB8ctWYjwuhSjZ3Rz67
         eNV20GxqOUDihQLTSyc6OSXv362pGIBO2eaezdFFNUOwBpPZmEtbb1cHlqzJHnHps7jo
         M3uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577630; x=1793182430;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DsAf1x9yGOnvdEfTkWRdjJVmWoVcIt4Ct0cvIU8vs6I=;
        b=eqU0Pjz54dmGIDwjkFcEfSwhZuDkJk820mv13ZpuGxI3pjcQBf5nFFrGyj6UVEZF9n
         pRYTD2zds8odXHCllJPxp4YSsKvPE9a+MFs86rwYvYVi6qQBbqz7bywNQnD7irWL+BIq
         FI/N4LpZZQGmPSL4tqLQL7I/N8wI776uFRsxKjld9ZWQE/bfTCB1DsQKuF6oJai+PqJQ
         RicTjR2bm3F9o49L/9efahptiMYcWQWcWpeiMwchliTLnjtf+XxX92XcHGE+bZg0CiX/
         DCmlyXmjlUedzvaqnxiQqUGUo8tOK1VfZTFJAmjO/5vUT/l+xAUU0P8Ngz+x4D3c7StD
         O7tA==
X-Forwarded-Encrypted: i=1; AKwUvBy3bX8nIo+cuIgKvkEYDwvsHSglZGPWFc7rIMxUHLzRymRFgKwinxbEe1DOQLyxfgdW097GqOcjiVVf8Bo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRKMhndmDH5IOQKXK6LDoU+O5qaAJSytRkke6pHEZChqVrFfn4
	NBT3fKHyGSHPz0HGe1Hn6b0I1z27NP1ommGfIjmpQCu+5mqBaQrn/+gVOgE0Qe/vv60R3kGwjVh
	MP52sdfILGiNVEojHN4wwYWAkF3WbwvCfZHg8+DxSKZFvwQbIXW4V5wxU93OJev3R8XaqCVllq4
	K65auv
X-Gm-Gg: AYBFou1MsGbBndwy4uCVhAyoJwMvFrWA0PC0+H1eZ5QgnLhlJdfUq9CkvE8qKy76IM1
	pPhJMEHJ8KfSVC4FYCGMjFzIHa6uGx6duWwJVAdPulmNAnK6RjkSkle/YyOXdufhiQASRRDwYs4
	CvB+ykMXsM1HkWQ/074A2ZWWH2KYQToWLvlbFA1HiptS2hpk2SGyc/20V2uRr8fxqG7xNqlhPdM
	/+f9S6i0ifF8ADC9ftwFh31t7cvEoDpuU4Eu5xIjrIfGVsjsFMgubchXjSfB/d8vi/wNDjYk/KJ
	Bju2VjGFywiAiys8X4SBIMBNEHjCuyl1msrD2utS032dsPTtKW6DziTIXX1YqfUatJ5iDSymMoG
	dRL8S1VIUs65lf6e0WufAZQ==
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr355237085a.4.1792577629912;
        Wed, 21 Oct 2026 03:13:49 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr355233185a.4.1792577629343;
        Wed, 21 Oct 2026 03:13:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678e5a82fsm62538766b.4.2026.10.21.03.13.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:13:48 -0700 (PDT)
Message-ID: <12ea4915-5ecb-46e8-ad56-57ee989e1efc@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:13:46 +0200
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
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Fix 64-bit address
 truncation in dump and translation
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-0-f19b4b947bba@oss.qualcomm.com>
 <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260921-b4-q6v5_address_truncation_fixes_upstream-v1-1-f19b4b947bba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad89063 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX1GE59mHVMR+Q
 ex6d8BhWnQF5Dt1v//XR15FPPUTBM+NWtheN4HFeQS9JnJ81KMaY/yCwRS2OweLX8Z1Rh7SRMdr
 9DNJDCme3zJJ/IVxwIV+ALlDYlNBkXo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX//Bso/B5ahOb
 koMSMxrOczGFActTZ00ACTf7BOAjHc3h/mEUpzAv10+l0VY+82iI/HR3cS4ANlsbTdhwBafRnE5
 RKaKBQ0tMDjESFdLpJHtfgM46ArFpul56TnOzyJPZYE/Uvel47Xhp9py1FAg51cTwgVC+8S85l9
 e6Bc2QsDfVlESftcdezUrtxvi0dFppm6CltzzWW9eDeRE9UtRoVEONDh2qlNZnImEV5pGKHI9hJ
 aBjfGdY5e4m8yipEFhOYaN9znlJvOfMlmhql7EQpM1Lnh0e0HhHe9SKrUvh/RctGHYMptdYgrm0
 IIzwTEN0tJkriqjGDNBKXjXkH5C61XaYXbem6fAnOSowKqI04nX2YKj2KnPQlzYnkOSXrqjeDLJ
 o+lCVJDWDUoUPCWtVaL5byCiPH9KjrdqEsfeUA8ytoQP0eXGfVSw85ViDqpyoSYTVBdjbSa+/5/
 zpuKB+mKMAgZMLuvpxw==
X-Proofpoint-GUID: p2s9OF4nYBK7s3cbe5j-iAoPbwHieraG
X-Proofpoint-ORIG-GUID: p2s9OF4nYBK7s3cbe5j-iAoPbwHieraG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040

On 9/21/26 6:36 PM, Anup Vishwakarma wrote:
> In qcom_pas_segment_dump() and qcom_pas_da_to_va(), the offset
> calculation results are stored in signed 32-bit integers (total_offset
> and offset). On 64-bit architectures, this can truncate the 64-bit
> address arithmetic result if the subtraction or addition exceeds 2GB,
> causing erroneous bounds check failures or invalid pointer translations.
> 
> Fix this by using unsigned size_t offsets and explicit comparison-based
> bounds checking. Check that the address is above the base before
> subtracting, and use the form (len > mem_size - offset) instead of
> (offset + len > mem_size) to avoid unsigned overflow.
> 
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

Fixes: a376c10d45a8 ("remoteproc: qcom: pas: Adjust the phys addr wrt the mem region")

Konrad

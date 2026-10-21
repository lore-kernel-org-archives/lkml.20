Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577432;
	b=ZyvlZAbsj2ehk3jo2ecxeNKsrc3Rt5caWkZ62taAikgwSxTU9LLZeVgBtZZ1AdbzW0zV
	 scfVi1fvfT26Ak+kGIer4go40Tf6wm8xxD0Zish6QTftGVWTbgaO88ssE30hmje1uqB/w
	 wEO1jAJB4Xl1Y5E9FXAPYgi6rgEgpzp4B+lNNqybQT1jO/kFxb1SfMSkCUHIpCpL7RBqS
	 zVecOSh+5+ngsIwQ7iAClP7oH236BonM20t4crwko4qh06RDRRQUmRp35hYeHrdAMkkUe
	 CVwkcRp6pY+PXmaaQOOFtH7cVL+4U5WEQauDW56yKJy/qtokAE6Snt7lV63lOznR9ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577432;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
	b=N7RDyvvrtAIDeYXWpwbKQn1Ofeo0xNkU1HsSc+EBYRI2O6XbKJBT+HjbnB0QkGObftVE
	 6M9Gx0wQ8Cozu0GOxwKGmOGJoLAIcJOov4xfgXuIqaTZAOis4JlmLteVepWkGx6MqAX3F
	 /aIT9uZrjp944nYcsbD4QBGy0GEeEJIQeAbKGYwcrxvKrRyEBWc2CWyPlnZTn10iVyVXD
	 QxWryMk4FaSbRIZKVRVMgykTqtt0IFpQvVZhTBl/E967rwApo/vnAYeUQsK2dYIYWeLZ6
	 43WyVFFw9tQykLc2mxum2N0T+px5JCi1F7LPQgAif89a3GlGne+cc5VfyhQkvAoFf2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmspqwe1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chZ+TAtF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380F1606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:10:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 380F1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmspqwe1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=chZ+TAtF
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5vXa3958154
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=; b=nmspqwe1evtvHtRG
	xBo/HHDJkLRvA+UYlJHq9hBB4zxxK2olD9A1xpcpnw0E6GWlaQyNVR2MQjlA8+Lm
	AyDXBIfXGDUIdYn2i58t8DKmXxQkvXCvUlZL33Q6HryH9WWsVrwCtzdnH9B9/13k
	gCBwscQnZ5HNSrhagSICTwDYp1YBmbjcgyicjEDGo9XtwMJIli2bV324CzKhLza7
	Eyrg3DjvPQhZzkNXYc7DEDarF8IULSXHP6+rGCx0ozrvYzmXLenH48f38cpxchjv
	lAGuppfbcmAPWU7dKPFN9kFtla9maLtFQj5zVQ8pTmdQ3RjDGSJ9k8aCvzG7gRUY
	bve31Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0kd6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:10:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so8930685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577430; x=1793182230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
        b=chZ+TAtFUH7j/UnROmsS/OOQ8WWj9kXXKsKraqSHcs7JOZZkNYDEYrkk4Z3Erh5H5A
         sJjaL/rv5VRmrK47x0zMJ5+5f0u/wwMUTymQXwa56Og8TCFjsR10v04B1dbgOyf7/UbY
         TwFjy5T8WZcWRM73Igyhh6nKHkMLIQy2EFRcQhGJw9wo61epDMkRZOxfriAdaHXbVqrC
         RAnCJss3w9d/3/L7mNyZpdBbiRqCA8Nhu5P/Fyh66UWG+hZsnVyAgJ0ZEJoNFeazeIAm
         p7WAlfYGFY01mx76papDOqDt9H1dTjIxk97ahyTle/7uersjDflHdaYmY7hvQ9UmiTB4
         mlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577430; x=1793182230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ScjAysI8DSUS+F8bI/lSaRhztdpWJyIBGNzjjIpWdXI=;
        b=GVSa5W1RjQ6l80dJwuCs4ek6yn6oyemXhhM/wx5sJOGbSLlEbeCclqeWM6OWAdowSu
         xmK5b2awMsJl+ZhaaHlud3MfLEvI5GDF8pnZx6IZUDcNFI0WOxRKplcu2WhHBoH4XhWZ
         ad848IqaaIWI9Fo+dY8kJYs9h/47FQLgHNg6e+Hka8HhMfr6JXJmYT3GFSvBLwGT5qDy
         hUZ2ZeLYPL5zZEM4G205wNErkmP3Kzopz+VHLWxGHGWJ3uvc21Q+6cWvz7oMmahILWjS
         FGuyv3PBm/hCzQY2G/ycNVK66Xlq3lE4J9PdHD2+VGfJZfAdg09j+mFkMp2iqe7MOCrM
         Y6IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxV3nJFMSQ21zoP9MRDiw49K2/zzL0WIXZ0h6tm/l76huJ70p++wq8CjuforA2CL7clYyQF4oY6ezoSPP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs+vbKjDNZBKSqlbX9nVExxWJumZAKLY0lOdXevlZSkkkrIgnG
	V8ogff9oBy21A7PK9DZYfbIsT/Tbf40NnQNAHn5WvGj3VM69vDW2mKwCybMTWd7irldQxWcLp6W
	p9T7hWVRnAvj92kra68S/BbDykdgCRI9NlE51kEnmXZsIo9aEBzP3eA9RG64wc0yn7OE=
X-Gm-Gg: AYBFou0jabVx3UNdcT5S5FnazirDCLFvOpIks1b7eqZAnt6xuFfCI/doiXPOxdABs1N
	/CKKEMyoDKfBPj7nTbmXUO3FvgpmAM57Y9lireafn0m8SFbNEGNqpgm5/AeQLZwcdc4v26WKV3u
	HKvipjoBAuJxaYE9Xne5n4RvSYvED4YWAkdBwkxDpwPkIjM5yu6z7OlCuTuqeMH3vb+PU0p1tGy
	MJ3i6CgAzHIxAi4kr5cN+0r9ibThl13u3De6S2bis5cmjJzC9GxOyezQYwI/l8F4SszjacXG38T
	v5GrYQDuxJGfmnY31siTmq++up/9CBu8u8AJF5RAhrr+oNaE5AklFzKMjta9mubM37XQNINclAc
	HWrWbyQ4+yHDiHxh7m3/+mg==
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr356252685a.6.1792577430327;
        Wed, 21 Oct 2026 03:10:30 -0700 (PDT)
X-Received: by 2002:a05:620a:17ab:b0:93e:54d2:2283 with SMTP id af79cd13be357-93f57fd125bmr356247885a.6.1792577429799;
        Wed, 21 Oct 2026 03:10:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c467900818asm61438566b.79.2026.10.21.03.10.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:10:28 -0700 (PDT)
Message-ID: <349feee5-32ff-42f4-a3f7-8cd6b0d9e750@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:10:27 +0200
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX+NfTCc3QTHHC
 N4o5RNbY0qJsE6djOCjaT+RqbbYxhMo7E/CX8d7kGIrU1v6SYmU5unqmHS5Gxa4hjyDt3/dPKuW
 gaQqQOwy4CR8nm3pUjl0BCoBYhatiyfmoUU6zQXbhRzO09GLX8HDCOOys358XlRDdp9kKkfUnXX
 hskrzfvG8JJokJAzhRveD13zO42nJkyrV/fCG8mhYDZ9dupGDSH2sRU/RlszQ1wPBYihtjKsd2S
 7o/mRbeHKw+nHq542Hor7Mlpe2L7SWCJRbb2zucJbhluvAEObs5dICwC7SiUMBoMVjepsgp8zGz
 Ba0y3Hdhjimj9BgFbm6km9bEc8+mafNZHDHAB+GWbQPi43M2x81KwEeqEcQAoU73xCDPmRNroB8
 cBY9+Ta24KJj92Lwz/18Zyz2SjkQyZA6aM/qKkc0FY6D5wX8DbIKMVZjzYOlg954kiP+GbznuYv
 b8cI5pkwgxEZq1uAq+Q==
X-Proofpoint-ORIG-GUID: _F68v7EfwU-mHD1_FgXyhnlF4ApO-Bss
X-Proofpoint-GUID: _F68v7EfwU-mHD1_FgXyhnlF4ApO-Bss
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX3h5p4DgqkUto
 nt139G4YoE0Xmu9jPdKYIOyTX+1yzXsvoGR2g+hMA8ALS+aXSGwHBY95usuJclDAfJBZpgXGlli
 e/CsMRrouPt7rAzj+KNi/zQcDBGYmAk=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88f97 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1FkldgVRT0rVbtvJ3NUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zZCYzV9kfG8A:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040

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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

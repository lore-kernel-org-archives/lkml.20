Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A416A488201
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397052; cv=none; b=rX/bOCD58DAGrLP/ge66VIiQzcaeXoDF0stXi5wUq9GQhGtPBZD0vhgMYc1J0+vUbjWSnOo7HKmVPlIsmKeb+s5P7PilMOkbRscE1rmNnsfHHYSl7vj3UYeKS+f83dxCfrCwajXUIzf7mqL1INJIyhYkR2+7iZT6MtxFz2u50e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397052; c=relaxed/simple;
	bh=h6nlkJoPzVKd8h6dzLkTqZwkIKkhE1p4bTB/eUHc87w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oJ3f510Ky6OtFJXx1mvZe4Z3+NaVOYjlIOZ7cz9WbY4twZCvoSy0QzwIyAej+VcLdSCU5hKRavm2vq0bT0wxOFa+S/9S3CkDgGOHqQdzL2WAvdZaXBGdveEMEiPePxiNuTt64jzfcRhZmQ44U82kLFTLk3Ywn5OhC4SZwTeqJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIPH00wY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hEsibEM9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIPH00wY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hEsibEM9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jRBl1555803
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWKI3Z97Spe9Je2GORJJYQmguy8I1qXKvg/zIa4rlPM=; b=LIPH00wYV74vjdud
	9vYQUzOoqEuKygeeqWmgSkwZ1gHx25jNAd3G8XEEPXBnDt+I+PP0WhA6NkX54SLX
	po3lMOrayqY+xaBS9xchPMK97DvP7wajAbaqaoqWXnj0MVWemrSgKWOcoVDzEqLU
	FPokH9BwL9KbO6Nd6C6ntwmm6PRS5o6Y8l9/g2ERtZWif6+7ht6U8Q49O/kJgi0j
	5yGtsWZzg/+3MhpJ9YXYwOC8Qy0YMOJoF2CnOVTkQGhBHjHcEm9j7Z/JV1PpS37A
	ZNVk7Vl4x+kPaSNNGC0eneocBzitAK83sE4bUZsCsBMAkP9S+03cifoFN6SRI/Sz
	qUbzCA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur1q1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:04:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93ca9b53afaso661651485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792397050; x=1793001850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aWKI3Z97Spe9Je2GORJJYQmguy8I1qXKvg/zIa4rlPM=;
        b=hEsibEM9Gc/2OYYB7y9F+oDKSsVEbLuILNOH2Q0IbKrh6CizMCNQSJ+5LXpUqfbmVo
         w/QwbarR7tfjwjgqBueF3UnyHepU2/apQe9ln8aoxj35lkUdDNNxRff/9q/NpasVGEnu
         KVX1hulhToYpxBWXHkiwTg6moa+h+RQuXMAAIbh8xy2VetLAgDi4O0twTP/KmcBHPIY4
         6seL2t1AUMs/REoz3yy3bzkSBg5qeFf6FzGbWapdQSAMhw/76hyrgdIf+31LCDyttxiP
         t/zkQOgPUjtbHJuFfOYKlrXfFIikAHNIfpQeeDjmaTevrGXKP416wWzeqmCDZ69TS+zT
         DKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792397050; x=1793001850;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWKI3Z97Spe9Je2GORJJYQmguy8I1qXKvg/zIa4rlPM=;
        b=muuoUpLzdOrzQtFYcz4qLv5z7MwY+Va67KUcsyoN0LRF0UgTAwnQitYwsg5GVwfrnz
         33BBzGf3MDBRBq/vwLiVAAutGCaaU2NzzxeqxVRW98xTx9tKO5Um7KptDC7CM1E+gRfm
         s+s74pP0Xu+0GBbsRi4RpY8e69DkMQ7shq6nT1bHgBZ7LhLcDYE6+oBIUQ7CDbf6qhep
         OpKMa/eC5vYu130CiNuve3c4g/dRJLFk8H4jY5HyYHpoSu6z4VwwlI5FAEZk4YQ5OtIz
         4ppXKIW+MDg5/S+4e9CFlTYUvDbHZaewVQqEzG9B8gNf5q5+i66932AoP7kdLEwEcp5x
         lhqg==
X-Forwarded-Encrypted: i=1; AKwUvBwSa4CFhoh71IxE9X8/dA2Wy8MovZa4C5vqiOZ2uvYAH9E0/DUb/2t1WiaATUWbfqGk6GVVKW5G5TH0vyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlLUTmH36IkZiu823pzlNJ88t9Dx2v9cMXn+4yw/U9kDGBeZDc
	mIfYHVnYGhvpt2reuh2umz3L28Z7areS26AtiQiKYRetW1TmQAqW8OZsl5UKiTHaZcn27g/c3LZ
	3Xx53MI/HINpfhUUUvIDxq0i7CAMik6bxYpe6SlThwkslKP/wTapSREiwVQrIX7FovYc=
X-Gm-Gg: AYBFou2l4/IKWrxBHB/sSzYkFNHC/WSKRfOcniIs1+nMI/bzj33qNalpj1r3SAgt78L
	nyR5eOYMnwwbFeR9kgUgiWsYR3A63uaIC7n7SYOoQB/s65BsxtI7aXbH3y4SaUNhxPPzAKNcF6f
	L5HMcePE+maoIIQa5PexszHphs31ZJ/aeLG3+AH45pS9KqjGfOslWihmSQ+DhvAGJZr5q714v+x
	XgFyFxwrujaTdCgALrHrvi62zMY4G+ujYaQ1RfrYvk2a9tA/4uilL11PHaTjL817I/tPoGWNO4A
	K6noycFbhuAZn4c8M0V1/9SxCnFJphdChY26Ww0MzO1IR/QsFeDEXU045FyWPbBaeWDga4VI1qE
	lN6iXhbOjA1fdIU3A1JdsmflNXpk=
X-Received: by 2002:a05:620a:3191:b0:92e:8310:7369 with SMTP id af79cd13be357-93f29d4832fmr1093242585a.37.1792397049853;
        Mon, 19 Oct 2026 01:04:09 -0700 (PDT)
X-Received: by 2002:a05:620a:3191:b0:92e:8310:7369 with SMTP id af79cd13be357-93f29d4832fmr1093238885a.37.1792397049404;
        Mon, 19 Oct 2026 01:04:09 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b303csm340148335e9.8.2026.10.19.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 01:04:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: cdev: don't set GPIOD_FLAG_IS_OUT
Date: Mon, 19 Oct 2026 10:04:06 +0200
Message-ID: <179239704405.6184.15539610214075150982.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016-gpiolib-cdev-direction-v2-1-aambrozewicz@nvidia.com>
References: <20261016-gpiolib-cdev-direction-v2-1-aambrozewicz@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX9e71audEdqS7
 urvrkHHt7sAsow8DQEEcwozzryO+WBh8mNs2G8/DvUEnyAWzs22W1WbbdQUbTrFKJZcbn4YeJNT
 77K0bkFY9FwAJPdnV9VGAQCgOLOmarI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMSBTYWx0ZWRfX0Q0NDmp2Tk13
 nKET3f3tpAYPQ2fmvMa11QblLgvaV2pFgVP5sdZmHiuoG3+XoYqYPMP+lmrT+iesek+aBb5H62h
 nyUp98Bicjxe9H6daIeelYw3X5BnmREKPtr0yo3hozrbQJOGlyw8MiJCsCe7F5nQNDyxoinfMTX
 zPa14m80NOhGeIKO/brk0kG6SWotwkRssHB7xhHfLk6E1r0RNvI9egCXak6RO7xHIyp/JnKlfvd
 G3HcMvZfsJmrGenQSDgFO4aQk1hq91CEJlzRiGsJ78PIWQasLnscX/IzuMbEKiW4uKTrZOReaGo
 2ruPHAs2JPiBInRjHcgg+zEHNub0z8lWiHohPM08TJhkptFbcvVX/YI63tXeT2ZMUgR2jCFgQ/7
 iacbB+ERdinV3VgTzmRjroP5Nhp1K+1YI1nuE/uF6Tl+HlwY8MW0MsT8oR/IKqxHSSbrejCNye7
 hyz8EWWa6gL8weDr9tA==
X-Proofpoint-ORIG-GUID: ljFq6XIyVxnk2tW-fExTFMczBei6-K6F
X-Proofpoint-GUID: ljFq6XIyVxnk2tW-fExTFMczBei6-K6F
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5cefa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XMsmqHZX1PzcbC8T3f4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190031


On Fri, 16 Oct 2026 12:22:58 +0300, Adrian Ambrozewicz wrote:
> When a line is requested or reconfigured through the v2 uAPI,
> gpio_v2_line_config_flags_to_desc_flags() copies the requested
> configuration into the descriptor flags, GPIOD_FLAG_IS_OUT included,
> before gpiod_direction_input_nonotify() or
> gpiod_direction_output_nonotify() asks the driver for the direction.
> If the driver refuses, for instance with -EOPNOTSUPP from
> .direction_input() for a line that can only be an output, the ioctl
> fails but the flag keeps the refused direction. gpiod_free_commit()
> does not touch GPIOD_FLAG_IS_OUT, so this outlives the failed request,
> and GPIO_V2_GET_LINEINFO_IOCTL reports the line as an input while the
> hardware still drives it, until a request without direction flags
> makes gpiod_request_commit() read the direction back from the driver:
> 
> [...]

Applied, thanks!

[1/1] gpiolib: cdev: don't set GPIOD_FLAG_IS_OUT
      https://git.kernel.org/brgl/c/974d2712cb15014019595799b3ed68fef5fe9695

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

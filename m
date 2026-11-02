Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626371;
	b=E/yrD6ZqrYvutglOnqcywQZkM3E/me3dOZIlDU0wER7njSRgvydjjLfXKz5Xe0T7uHRc
	 I/7xBeIxPAobmulxwWdABYsxy3gjpYhbbB244GQhcZGw5Sqy9NAlN9WvHMxUVT+j/T3B9
	 UnHSMZ0Gdgtm333xZGEnusfNGX8PCHnh8f+lRBp1XrECerZiGU0u8YtTUZtfXaYseH7ba
	 VSFnzi3Ffaz+zvQis4KOZFtF8B+1pNq3auJZ2v58OPC9cN/ozwTgJwt84gFlSAhYLagZo
	 4njDGXuBiXIHFExAfG0oXDcBieYzLN8zB1hctMz9flZJRIkanKAWFs0VAyMq7qHg0mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626371;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
	b=YeOJXJ1tZLFGxrW90cPG0yYHhgds1O5+NBeG0MHUMmTjzfswqG36rUj08f7xhnKXX2LY
	 /xKfS3hoYdnizgl4vPvmuTptL69CNTGBcMSt66oFwnm7X47f83uaFCfcK1zYwYpvqAGpo
	 1/41n9Xtd3hK/jrvvy4aAlWQqKNnqWHnk6B+byDj4bj8BXr/nLa/MYlC9mXBmo56u6voK
	 TMMlgWSkYyZe+JfnVPuiB3G3ytY9IZEg+9of2KeX7tsUrPQAhuQ8yswTM86i6uee5UxZc
	 Oc4siUvN5O/Zm5qj/9JvozN8sM2ddrrUvEkVJIEASoy16YNrcbmXODOoZbEtSrHCieA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGqHquVV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=axB3ldXs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFB7606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEFB7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGqHquVV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=axB3ldXs
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAmjY3014867
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=; b=MGqHquVVfmYGpZUf
	UHJfPKtiltdD0yKxc2fIXQfjt9UTfEzqzFKdIUbRdGKDQMSFaJShA/ae4wrTmx4E
	+v/G3O4Lnb4ar85ZF397Wvi2Qr5JOoiD60EYPbKlJS0H+luWBfkr4FXboqs5p2bD
	VtmWiW5Oqr5/HKmXFMaLSR0gkR/BMJ4RtYj6PXW0LksE6zjtLMSrypBGtuUhFPyL
	XW2i4+3qXHUCV0JMqVAKAft5qHgbmkrW3Zm/RH8pkI+v8FNgihIfWlGZcmFkzxu0
	PRq3LudY6pr5Dfeib0rzJ/GBmbQ7IDmGS43TNHIG1afdhJytoRFsbHYyL7lWK+KX
	p8arDA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rj101-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:32:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5901320eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626369; x=1794231169; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
        b=axB3ldXsT6HgawLc35F+XD6dMxxyfvCdcCRLE+i807gzD4NSGLm/7mxXVc0WlkRI/d
         ZKTHGBdUmoA5MBjGkTZClvYDC0SiNNm22iuSdhXjsvX79YtywtOxZtRNQLF8UgPQHPFi
         fABfAtjGtqAxhbCJfL/YYCHVVeG9s+Xqu29i9DkMSPSIh6ciUUnxoQ8bSqhTHQFuQywh
         IZ0XIko3m4Jwl9eCkidQVHGgWrDFaYtVCBg98TljTcnXAN422vCUD1Lu5OsMBDlpaLVL
         j15xsfy2zKXu2B5cHWytFldaBOyycvxWh9t7hVMUCDH8AzIetu5H5UiUBmRf5lYRjjQG
         056A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626369; x=1794231169;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cFAKXDSGQkk7BEgESnOUdhReDo4Ll1s6Etz17oC2PPY=;
        b=EKN6Er+IsgUpEYJVVCGFdm9E5hCY8s94pR3EABJYm7g4gW+Ugrdnb0S2c6ydZ6oyFG
         /EC8QSoRl90RHWGDVA0Z+ENhnZvu4wumRrvSuOzAU0dgmZKI7tRgdnZC4lU5qzB4+wls
         FxI0miVQGisYOOx3OzClISeZkvhWRuZfZKh7DSE1Lco3vG7ez1ILJf68ICbEdViuhI8X
         SPhu0ncjuZ0+K6/sGAESKnsormzP27S5T31WvJ+fNc+jS7MS00NoP8j1+22HJ9lC1jDH
         wNwD18yLIhVGUIt1sOZWIbKv2xXoehrPNdX2kdoEaeuuoIi4+MOnNLWwGtYYHtq+/24I
         +Anw==
X-Forwarded-Encrypted: i=1; AKwUvBzM5TcIo8xWlmIbUESI35chJj670lsgp7fiCgw2xfiVbVQG4bb7ah6J3up+rc1zsRjRan6/9TEjAE6JTKA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eb0774mQsLvuRuFYr5tPIw5R3plEJHBO++zKN4Q7mw31Oj0OF
	xiEK5hBqzUjqSkYIeu5MqhAXeso7PEQCzel7o17n3lIt1JsqKllNyRvtZ5D3IZxOv5bpzGsAqd2
	GmkEUEJKUV6KzyEhGfvzH/cQDVD6INClBmX2FFYCrai5ozZMbH8CPFU9ii9PHIqwRZIk=
X-Gm-Gg: AYBFou0c7MEnDmif6zCjNHXZCfyuf5H2/otsuLpPpSdhvzNvWxBnbTVtyfvOFcIVCYJ
	LtWJ62ccGnhb6krTYkWiEXWf+ED3ZCskNGwX6XlJwbF0klW7D5fYzikCMVgfv4axP69hzH3QwvR
	DK2PM3OWOSzK3dn9lpNgtxXvPCU9MtzLXmf4hneNMUIUHLAQ1aItj3yviyVbEd2QJvJxR6rFAb+
	aYAqX3AdoF3fK3J/ttFNBft8My948NK6gPUJKxtR4ZOD6ZiNaV1I6x9js+7e1rh6L2PCN9F/V6I
	Gz4Lq8iN0AYEtmk1tZIydlcUx7EdaYrCv2LPVOjdKlMTf5BvVvfJ6IAAfIuni0Sv5JkANSEdrmt
	NwZigZJbznRp4KU89xl7arRdrOA+H/MYgKsFN/2DdDPHFleJ7NbyW/bNuSHRipPuRIV5YI8d9j0
	WJoPATyQ==
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17425559eec.12.1793626369402;
        Mon, 02 Nov 2026 05:32:49 -0800 (PST)
X-Received: by 2002:a05:693c:83dc:10b0:365:d42a:f415 with SMTP id 5a478bee46e88-36a423454b2mr17425524eec.12.1793626368612;
        Mon, 02 Nov 2026 05:32:48 -0800 (PST)
Received: from [10.204.101.201] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm17186741eec.17.2026.11.02.05.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:32:48 -0800 (PST)
Message-ID: <74397996-99e1-423d-9a0c-dc17ff013239@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 19:02:42 +0530
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
Subject: Re: [PATCH 1/3] media: iris: Fix runtime PM reference imbalance on
 failed resume
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261017-iris-handle-unbind-v1-0-7809148eb90f@oss.qualcomm.com>
 <20261017-iris-handle-unbind-v1-1-7809148eb90f@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261017-iris-handle-unbind-v1-1-7809148eb90f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t-3kqrzhcFErS1OgLIlTpcT-EPU0eKfn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX576G2+7WauZ1
 3Z1vk8kcQ5Trxyu8dINrF50cCNwLuIwTeE2gAN5VcAtmqAgz7rw4qYb/zybs5N6SFZa6V9WOx7+
 dXW2wb4Rb48ltKNWFZ9XyrW/SqY/3klxR/RX3o5AZ2LoTRriI+s0KIpTN2bV1TdGybFWJhTOTLa
 1UdvT8ADFPqvQDf4idATtDpaJcSHGgKyJ/wDAyUHy5dDrY6djPUOA9dpYDTAv932RIsT586hYWF
 bw+BqOP28+rwByCKx8uvRcJvuKNtqY3UZo4iE2owtLiV/ugPasoTjLg7xNFu2SFUzGIkdSqrd/+
 0xxvIb56+IufJJomdNRgQO1k7h1Pq16Mr1mnJkCRru0E2exznBkwpjlCVH7xazWVT0ccvfk4TSB
 mFZbsTJdEohOUvii9K3AMUKkJsI81bD/JIeor+EcFtSHGMkm9/qSKkZdJT42vGQqyw6k9pQYePQ
 0Q0I+f5p6eMrTnRkU8g==
X-Proofpoint-GUID: t-3kqrzhcFErS1OgLIlTpcT-EPU0eKfn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MyBTYWx0ZWRfX1KCQuFU0Tk3e
 wxEVx6WtFoYpVlTTaO/qR6Shyrt+bqP8Ou95IeabIm8GuGK1J8xQixYTYVYr0Ye0qdzof8Dxq26
 UnC8IEy2BZSVQy4Jg56aeLd+ko0bzQ0=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae89102 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fnL9iuGchlDLWTthXDkA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020053



On 10/17/2026 8:46 AM, Vishnu Reddy wrote:
> pm_runtime_resume_and_get() drops its usage count when the resume
> fails. iris_hfi_queue_cmd_write() dropped it a second time on that
> path, resulting in a runtime PM usage count underflow warning:
> 
>    qcom-iris aa00000.video-codec: Runtime PM usage count underflow!
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)


Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

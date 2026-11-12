Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472386;
	b=P8UkhsaiIUOjtvjY9Hsc0ACwJSkhybAPt8z16oPgenrgUiNmYfx6gwpBa8GcFvPs7AOE
	 nE41zLNzgVLg2V/PPN325hpfyIVzmSfeMJ95QVgtzaDCY0m3ph/4xLP8j1LQVDdaQLEgY
	 Fij+j4gcTZo4QEzFYjcu2cizQkbLEWhbCZQFQhGaIHsjlBivH0QJhLCfRIekjtB/WpNmq
	 kBGJzGYcyWnt/nis/j9a1vbio0VeWeLZW3rRl71xO/hM9o3xsj46Epjq2kQPGXn/EHCxs
	 xN27vgrT0ZlCSBq4TT7hu8BWHNTgXa+h2M0vddIb47rDP6UBreaWw/AGkPOHY5MPbAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472386;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=;
	b=Y17NOBSj9t2OxhGO0ioAXfCgrZGzwr6orQRNqR9/UIPNVXkd/1xR7esXefvnnhWB5z38
	 3qzln/R6IYaDhivZJ400LxqdhD3AJUVadiwlDip5yXTjsnstfHaLlor+YRvKtS+ocDxhm
	 NZwoWmS3n2VsZ9udPs1imVwtb/dArlCslsMmr0lqxtRxg1oWy63rKlO0j1KS/2/WsIqdH
	 PffI4XTS2JFQ0W9p30PDwELX7mXPEi5VHoYx6zMo9uZX2Kyzxjw8gtVbN0TylXFlltzJN
	 Xy/aN1L+x0/HmX53Kq71bcVNZv8oJDp7jvlONpSpenklpgb0xD0282KcXcLq1c6R3+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDjGUTWu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwH4+mSz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600C360A6F73
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 600C360A6F73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nDjGUTWu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EwH4+mSz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZQsh4092470
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=; b=nDjGUTWuarL0gomG
	UiYUJvOfTJzCppFIuH04vgZteDGys4xua+WQ2rQvyrPYi3J74KvkjbBx+kVUOwds
	t5cZth1KVAxpmdBXvikHsloUpL5yKFQ5A8ZDzalpxse31oahRXVNA+yrbCm4y9Zp
	S+mkzi6A5iFR8RUAPAeQunWmS1H7/JtwDXq5/oB6HllnoevfRCeNWro6AxROawqV
	7QP8xdIXVRh4Te8Dqnl75vH3jn21d7OjC9cs8peg+RxsH3TMj612uLOuVy8vW0CN
	AVfCIKZzuAw+JUtf+Iquw+aZUJX0vuLZzXiWV+yWPJkov+ZtjhWq/u30KxDN8IVw
	OqBWJQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8hy5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:33:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f62934ef6so916475685a.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794472385; x=1795077185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=;
        b=EwH4+mSzdFw0Fiz8KNZkU7w/+uDzB+PZ9h4gO3ou5mu53eqSGp51JEwVaXOa45P1yI
         3WLJTbyjmApHDs7xPUm6Hr7+kGA089n0Ixx5gDaXuoGsrYue9ZJXeJaj3NRdI9RReBcE
         4K2X0NrdEp2qPES7yQsdBfOmcIh6KJh7M/v67i+aU2hZOyXW8tXkGtZt3/7kAurx4lRD
         ZuYAavcRKqdpoCj4jSr+1LIllsUSsQ0ztoGQW/aEQ1gKW45SFXUZ0rt+3mPop6rSXbQs
         0jf0aXwVtjXsPTYKK3QAOy6mfZtd4Ak/P9mgsnBtHlNbn2OeopORKXGRBBJHzQMj9IQ+
         Eh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472385; x=1795077185;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Len3Udn6sbD28+Q6LTbgf/hUErCOXt1JZSbfv4wLLms=;
        b=MatjljsqkLH6gx/t7edvlU+InrOUf/j8boefYy30lnRwDZxkv15hbbY/JRWCTnZHHo
         FRc+QmkHgVrX38VWqqsQfcpnd39J8rDD9ssljdw3gG4YCfOisxLG5fYVRf6CVgicttTD
         g3xT5dAeLAvEeORfwKveT5G12jXH7zFXk88ANdPcImJFa4R1H4/Ma52Rt0kCejNBjfmo
         lZYjkfjoJf+XaFlKUMJ83kHyIcjcVYe9dU/37s8TL9B509oj+C5kCKLJzBekvJ4KOL7N
         sD6NgGXfy/F/AEOOV3/HnCyRiXwuN84CTmB6X95mEaFp6bApmXiYACW5fQFNZY1xDSgu
         lC/g==
X-Forwarded-Encrypted: i=1; AL+hErGqGI8Ws08p8R/7Lll2zQNZ/iG3JypeDq3z8n1QnKPxVNaVyokq59Nhkjdw60PHmhxwyMS4Q8NZ+FRmv3s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KFA6U0GIb47nRAOiTF6PIzqL58JHJRewraWbCX0pZSqo+ZG5B
	kiKmWQ8lytDJ3GXz8BBxBdCuKPtoyaTn5nqvsTx17sNDVtlllJGmlZTurf66dre5swhHSMWKaT6
	+l8ywcN2Djk2dHfshQWrjyzX9Jy0rMdzjjPIbspmq0kUN2OdAsuW9KctXrTpl5iBTQrg=
X-Gm-Gg: AYBFou1ofQhbPX3aen8RP2NzhRmh4RJAeGsZJ02YbtkLeEC/GzQ0XSQ+tAjvfgZPh8s
	9UVsmOT0k8j+TQvWvKH2nn4eNZKYkP0SyWq940BpLU0JaSFRcQm7biSswcCcNbKIIOj/8zDuY9Q
	0T/riaRxro/L1K6QhNelXiWUtGI/iNAOsd/w/TwvsgHfSYSof/1THuDqqAD3HZpChzMwaoOHTMs
	9wetW3QzeYviEFZAi2I01F5Bu8apUqcWRlTq+QJO1TBRoaZUAbfGT/rv1M7sWoydNKGZQTAyv2Q
	YyEJUzO32n/tjtcCmVIRIxG6ADRgqIt+b2LEUhceSB6MXTsFnK13ciX61G8vB5uQrBeJCGhFhD6
	wrc3cnenJWg/bupV5I9flL6fDwRoZy+1Jpjb4JnKfzJuAe4FDfKLQfo3Z0CgYJExd+CXz+c1UH6
	+7
X-Received: by 2002:a05:620a:258b:b0:93f:2463:f784 with SMTP id af79cd13be357-947b00a70d8mr830039585a.66.1794472384895;
        Thu, 12 Nov 2026 00:33:04 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93f:2463:f784 with SMTP id af79cd13be357-947b00a70d8mr830036685a.66.1794472384376;
        Thu, 12 Nov 2026 00:33:04 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49bad3cd31dsm1070593f8f.56.2026.11.12.00.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:33:03 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH v2] gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
Date: Thu, 12 Nov 2026 09:33:01 +0100
Message-ID: <179447237994.4979.16703071994688693548.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
References: <20261110-gpiolib-hog-stack-corruption-v2-1-c5b28cb8dc8e@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfXz63+qJgBxZJT
 i/H6t67uHOs3PsCancVdhJtuXir5Y+nqZanQn3FZPI8tyhAw2OhLCbD0/+gN9gu5PtGYaFELOIQ
 q+ECXvgsH8pDZiVANWHniJKea2Bqwoo=
X-Proofpoint-GUID: VgiNxBc5SEdxgCOG3r9ZVDV-S5Lm9aKn
X-Proofpoint-ORIG-GUID: VgiNxBc5SEdxgCOG3r9ZVDV-S5Lm9aKn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzMyBTYWx0ZWRfX0Rvh3bwSI9UM
 rKN16e48bWOPSdL2bXLk0YMQuCsiXOtMBoEoe87DFkNORaXhHW6xHQYnKtdf+NPJcuPnsnm7YUr
 3Sw0ts2F0pEpG6989BtfmFex9i4r3GILFrXtbZhLOv4SEUzydPSJxWk203hQr1sd5Pfi+ocowbb
 YDvyljErXo29Jdl/HMdCa83VBsf5eXM+xO10Mv/kuOp4O6r2h+kIvePuApzblEJhQTzp0edD8C5
 dkccFEBENkj8WTWr5hQbl9GKFC6dQHgVGEfMr6hpMWnZPQJc952P9lEGQCk5E3EDufUSCpjJSrw
 1l1O7yi6GwZnIwjATz14fNJ5QBaCfaIp4vAL5gK8ko+1IDwfVqVfE2HOZDgbllWprIzvkGcD8RU
 fm65AcVS6HiRD07aQPuZdZFM/41RRobYxxjMn2whW6VTn+AnNO882ZDvvyOmNgFcW2oWw2G85pE
 PJGP0jNCAEcvF7Mhr0A==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af579c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1Ip7nPS8rvKNqrQfddsA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120033


On Tue, 10 Nov 2026 11:01:10 +0100, Bartosz Golaszewski wrote:
> In gpiochip_add_hog(), parsing a device tree with an excessively large
> "#gpio-cells" property causes a stack out-of-bounds write when populating
> the GPIO specification.
> 
> The value read from #gpio-cells is used to copy the values into right
> places in struct fwnode_reference_args but that struct's args field is
> an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
> make the loop write past the end of that array.
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix stack out-of-bounds access in gpiochip_add_hog()
      https://git.kernel.org/brgl/c/f8a4fdf57cedb9cb3f47d94269ff27fea8e819e8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

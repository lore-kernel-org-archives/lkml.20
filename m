Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793708879;
	b=T66RYd0V/khrm9nOKoGmAhOazjHYZ250wz9V7MzG8Sarox79/h8SP5bONA8C3IGJWosU
	 nHVH3BSCAAFqhYr0REok8dc9qRgZFrH7Hyfia6lefxdK77iIOgea8tbLwx4Z5DRXmu4AK
	 GWCI+TTEIi5lH92RnKohlZjEBsU+EtKW97ALK0GlDuGJrbxPccp3PMFRZNxMlEjpQv5dn
	 9kJ5BuqLIFNgmVjKZxLPCT9Lik4P6UPfAU8jtu7gR/XbCEyGfksWu4uBEqh2mcGNL3eRM
	 TnDCz2oNcjYCk9TWo7PoIWSozochWBBXIafPLLHY5B/pch18MfUlm1IrHZVpX5cqmag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793708879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=;
	b=aWTciwqt7JHAILo5Gg+pvoMbVROnHc0r/Ir+iZy8HvWcwB5iUTaEWYS/laMo147ULdYy
	 ybPoCfhfO1Xz1POCTYPQIwgnbbXOj2SBL0iVz8TccJyekjPAx4WZCxmxhbRQnTyh03QRB
	 aCaA3u0MeP6+8WBj/uwVEpKflMvol8POiOCW2Ej3M9URV6hSMOW4kMgV6pW+AE9U2m5s9
	 q8tqh1sfmraxMxvs7pKKKcU8cR0VtFFk+fIq+/ZMW04mMFBswH5t3ciEFu7NNUWIcpmNh
	 6GNVbzZ0fO7/9QDjrRDEKATurM7w017CEoRwQcWylK45JY16ZoimqWmz8WrBm5HgYog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VhclsXH6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1VfbRAr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18850606D80F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18850606D80F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VhclsXH6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T1VfbRAr
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CPGhs2848341
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 12:27:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=; b=VhclsXH6+Yv91vvl
	EovOPCN2eJHAfCD21gEdkn2kZYuhYi6kBl61YPaDGYQW6bQXrCOOnfxjuUPTKCq9
	5GtQxDtwGp0IcxgS3S0Dy0i812sgRwDh+uyPNRdHPY9vLAiLEGus0uIP1IUiXQVq
	c2DzhlU9pQ6ySXp4/munh385bNNY3EnYG2Q7zCFCVaoSoK5FeGq0GTaP1VS2CEMU
	GOzpSOkLFXobu1kGEpRWBv/OQuTaed2ZDHUE+rOazxS2UsjN4EGqzlZ4EBd2DkyM
	E6Azuf8OF3QIHB4Mt1JTlar+vOd8ww4e58KMkJdhTaHbH3UiZ9CLo94fqBF7BHY5
	fR5HDw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873p3y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:27:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so2055568241.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 04:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793708877; x=1794313677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=;
        b=T1VfbRArcKsKizfIpdLl7lKFSM/CUP/KIbyAc2zR6YIGMuJ8NRgk4grTDXLEVt7vBq
         9Nyo3M81FepRfGx9MJGb8kBsNALSv1IgTI7pdXNzzfIll4IUmkErpinmrgvZcjXxm3B/
         laJ+udEMrgXY3WvmZ+mJBhDe9V+1KyEbmBS3Gix67TkQcR/hjE2dgKj0J41lc+LsohdY
         DdqERsG4zhePD/a9J673qYBbC6vsHqV8a7trDNU2wQxUkpoPwrzMiNhjty8mEY8VGma1
         H0OA6+e6Gnxc8C+FfIUpBHr1P/6gKzQxS8dBfB0EVDbjhARwQ/HaBlPITnknyWSuO/8+
         I8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793708877; x=1794313677;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jq9z8RFA4dazThWyCz2uhR2f4H9dYXNX0jntKIXAKg0=;
        b=toxbrouLa8GXBmcOhK7KMyxC9C80jK+WMJtpc7yNB2Sq7WjbwS2VMKuZtioy8+Tvro
         RE2PAV87FeNa1CN+h5h3F9JOMrBYe5ZuYnUFHG3IT0oOrZ54Vy+jtOTKRqb3T38HISBu
         uLe2gocESe6qO2tlxn/QyIsNLh/C+E1GIAwyj2XSnaNfGVY6CeS+zLUB7aRcpY7a8CYD
         kBZkVtJa/EXOCj9Vh99awTq5UlXKjjtpGBpb7kxinkVUVYEetwUwagoECVWhlQ1gH45B
         4FzfXU7y+Ld3aU6a6afAHbSVHLQaOYAC9nqTG6Y4yotuMv2G6yu2pJSJ4nZmhRCyj6EQ
         Ollw==
X-Forwarded-Encrypted: i=1; AKwUvBzLD83M6PqWwYgQ7EmUxbYdc/JGaAQyj7G77LjPEHmCws4nVfWciR2FNJUnGT6PWa6/mlsGjIG6Z1qHak4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TwwjE/R62gSMKWv13kHiHeR6PDDPgMMHSqmU1bFC4UjymbUqj
	/DNTHxgOJh8wlwYXvX3m+oBZEp/mS/Mn7PbiZxNr3W8J8gJVYfkxV6nqp1Z6PDh31zWJdmd97OL
	GM042cTzubbA+7UkuCgWIPHJ3avdNLlroOS5mp/fJOzqgg0SuJA9mRlwwi8uCK/uFmY4=
X-Gm-Gg: AYBFou3vl1ezm+Th7ONzSh/QCSNTvBY8GVORT3WU4ZNEWd3f7/xJJDgqOryk4eRJBGj
	RzSyvEFvt8RFV7zK3t4OpuDpfNhLHbXsqrfpz14OnvUh0A33xWpYoge74k7P+71stmfOcvx3ynx
	ZICGph6MTY/tmyGY2fD8DXkt0XxwXF9+7bWNSNlV1GzIpWnzOktLJ/ubpxkuBIRjmVPvJKkc6I9
	KNaojGGdjv5XvtGKRZJn6EM5KgGXi5bT/Yc4MFfTa3zd7ohlGhNQnd8cuoprGOimy4/1CwcSUw5
	iQR4m6tEhzj1y4iIkhh+mRrNklxIHRQUq8zznBulMO/fFdeg7E74Z18w4cPXP8f59jUesj1KE6D
	/L+dcbj9iergmVCAzLLqM/2zBTGAtXf7HzXd1nJFMTohhW5caDYht2XXGYVx6PBYQvRaaWSAIPm
	Yf
X-Received: by 2002:a05:6102:358d:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d072d5e4a4mr6184609137.36.1793708877312;
        Tue, 03 Nov 2026 04:27:57 -0800 (PST)
X-Received: by 2002:a05:6102:358d:b0:7a7:198a:c2bc with SMTP id ada2fe7eead31-7d072d5e4a4mr6184595137.36.1793708876792;
        Tue, 03 Nov 2026 04:27:56 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789ecsm23906739f8f.29.2026.11.03.04.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 04:27:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yu Zhang <yuz08559@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: remove the debugfs files before freeing the line data
Date: Tue,  3 Nov 2026 13:27:53 +0100
Message-ID: <179370887056.27597.16992402623638417415.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102075707.41742-1-yuz08559@gmail.com>
References: <20261102075707.41742-1-yuz08559@gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX4gEewnV+WElA
 wN4jhzZ3vVZVbylVTEkJVq5cv77hwWyKJugUPXqSwNcdW+R3SSUGyxFzS3ljpxwdEqQdmHKPWoU
 tEt5t9rn1zSC1qlLlj2roFOd1mAN7FU=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9d34d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=J7LRkWeI4YL75y-5Oa0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfXzeXbWj1iWwR9
 oJUFjWw+2GxL7ExFH5gLGT0zerj0Rcj+dZAgdMG4kbmvrjHncOOZJP9/b023QOymNJNWOjlS5QP
 anhHU0WbtYhnSJfmsZ6P4MK9YTZC+jieDmejjdsAc75L4BZUp84yR7Ajnw28g+1uegKQm70m37G
 w8YwSJIhYRkWvsiIkXruGye4qI2JtHKx1f3yEhA+MTYAjaeiBBTr+k6QJ8iDuXFPQmMcCFi2tEh
 6vh1sT0siZ5jgrHC+BmFvb6skwYYFH4QS3t3ztYDMuxz7qhyy2Ow4OKKq3AuRYvBbYMcht0zY7j
 OMaRDwQ5wjX1JGDmkDWPUSr+RCJymr89oo7c8KOXfsLA5mg/YGYT+wxwX7Rqimb/Te6sG1k5H8X
 6HCWw8zasFzZdG60A0tsg5jzBZLJzfnIrCgfPw7k13rVOf6c1LymnV6UobbiNzISPW5RiRbnTF8
 SVlkc0MZ0bM/XZZNjYA==
X-Proofpoint-ORIG-GUID: e8FIPe4To-13W-HOV3aSBgidawYCtY42
X-Proofpoint-GUID: e8FIPe4To-13W-HOV3aSBgidawYCtY42
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030049


On Mon, 02 Nov 2026 17:57:07 +1000, Yu Zhang wrote:
> gpio_virtuser_probe() registers the devm action that removes the debugfs
> directory before it allocates the per-line and per-array data that the
> debugfs files point to. devres releases resources in reverse order, so
> on unbind the line data is freed, the consumer_lock mutex is destroyed
> and the GPIO descriptors are put first, and the debugfs files are only
> removed afterwards.
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: remove the debugfs files before freeing the line data
      https://git.kernel.org/brgl/c/c2d0710318b8cd57d0ef6088d0ee4bbc1e827fd3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

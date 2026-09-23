Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCC95383E2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790174537; cv=none; b=u+0GAk9lcwzCsEFMGKyg+tR/7wgkbNXDDVzBkx8U7adXJck467Z1gzxBxfBi/jh0HWSMdwKhh2vXGcxyvFW/MjKKTlLvb4ej9ERVDQkQZQ1J+vwAUEPBEate3UBqxE9F3WaZDP9QoKSlia5FYRNwd2uMDzNbFzNyKn+iOjXea5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790174537; c=relaxed/simple;
	bh=3Uj+B1NgxgU58OpZlj2YX/Lnv7Y6GkrNPSxd8oQ7guQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iDqwcZvcLvXdMKUQ4rgktHIx1RdfTTOFXdz6lj038ZwvhGr1yuh/I8KYAWUb7CCryFMEVXXr18WIcGqFQWkHwNK7IASanyEWjsZEQvNaMzVISL7Eij+YWQJoNyA4GivL85/nT1U075jlEuwAxBSe39LC2qPCVicf9Qi2pB6jlMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ksc0vwm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akgVYc5s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ksc0vwm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akgVYc5s"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbUmJ3413862
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGf+MRsaXm8VLXvKHe+lyfwUTfJuXmVtuDhAYC8JphA=; b=ksc0vwm0bbTIijxq
	3o5bW273wzguMNDnOnaaZrH9ilPdnHjTF9CD1yX8g1i3r3N77Afg+gZSbXduibkn
	1zbn20CVDYWevvd6RYf91VEELDjvX+94i0ePS9kITvm9seFjLZjqNM8V4EtTwgKG
	qFzgsVqkPS//FdCWRWTGmXR33ziGGz55vtbEoedQQ0gSP2bKiS0LqZoOREJAr53f
	ExSzqfCD5nSOlvRuacxMi5HfMtNM2nGzfIjxnqaaDFs193CcfhHY8tjsvQLmB9/A
	tWM2I7wfd3ePtcqBveN4zXkof3+gY0zxBoeYSsz2evUdu662gj2m+C9zGj8ssc+h
	FEylNg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv78n2h2t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:42:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a77961b860so262880137.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790174534; x=1790779334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zGf+MRsaXm8VLXvKHe+lyfwUTfJuXmVtuDhAYC8JphA=;
        b=akgVYc5sovooQs1vCGcu6LhOAcSl2ohO/1OuoMdaaqYAS4ZfSqL8nUGN2CIzvxsYn+
         28I/Ys+cPniX/fx434JtSQ9BvNRP9N4tKiBDYFYNasdWK1wNzWaZDCAiH+4duPyG2564
         uzThh0CrZnhH9TSujlZaw8qPWvQMN2UzY2dOlvlvflmNeD+c9i0judB1O5HZTEkjXooc
         Jpy/fg2lO1vwWMEhsyCwmLIDc+iJKtbm7ZKKLIAu2rPBEJxIWnDmD+6+RbZmd8eIWnwq
         XG/4Avi93gqH+qZ6TISFHccmsKUo0Xw+yQ7Ds9LGkNvD05q9uUYr9OwhVscgcYsg14MI
         gqXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790174534; x=1790779334;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGf+MRsaXm8VLXvKHe+lyfwUTfJuXmVtuDhAYC8JphA=;
        b=tzbfzbc79Z8uGqxugTKSqhQpZgB1eURJj1CCDpRAafuW37wxc/vAR/iJN6YxpKGkvH
         WyKV1XBDwsrOo7QrKhJoWRN8WBAYRytKWsPiJgoCP8yhX014xhcjqbz9HJK9tovMXmIQ
         7O1yiDNbK4WDk5KSMErpvhKza+Uwij8+EdLIQMvntMlqVI+8TbRccC2B/4on7sOkqJwN
         vWCj0EMIH7KBE9T5L0seUKxZ5z5c0kUrQlxQ+TqHfxQa1zizLq8FigK/OuF/lWzikkGy
         hVIFr+IUvaBhGTQQjwSeaJzN8EYBm3vI4RmvxGVsYlvt4jjgpjtq/sAexIl30Tbktiy2
         qnZA==
X-Forwarded-Encrypted: i=1; AKwUvBxTh2W0Nlq75rLrDt9euN3ug6bD2qy7QwKJqiDhn063W0zUSprAaJllswgk+p6fg/8FVY7EIMDxtAWFJ+I=@vger.kernel.org
X-Gm-Message-State: AFuF++ltVRiAvRoqjNWvVsP5YMqR0nBXnaeWVOTtmS4DAmXPpQai+JoX
	CM8J1Gxkx8HLNM58K5kY6EIU6TAg084wrBPCRy7+uQwDSVMaBOxaCgVYZE9JkFlGcA6LyttzLJc
	K8eGwiAbxeW/rBLB9k1fwxexDEpxp/tpOcfv7ZCdVpiiOQbUTT/0A60N6ms5bHiqVLt0=
X-Gm-Gg: AYBFou0SyXOh80cwrth1r5rqXrBw2dbnnLDC7Ryyr3dlah+54AeWYokB0XIgWGDdZ5i
	i809ELKW/4O7kl80RRa2xk6BQ2sqkBtLr2EYeqho/wEO7o8O20Zik9KdnogzvlYuaUq7KHyPujd
	bwArMYk5pyIjHt+KSQrQaoVYgLLiE0/SdzJe/WYPFO8aF5TweZwy1O618rKvjg5bLmutk3WhYVp
	EHHo4ObeoFZT3ykvFHAxYAjpRDqW2MXWUZ5UDqgwYdcuhQCbAGVzPpcEyX01eDb19LyMO9Dbki9
	0VGCpHn+dp7QZSctshhRvL11EQVVM325JO2ODQ78K1k0PEE4tcKgv3j00IJeCK6wa4DKGRpafRc
	lxAKdSIpEi2vvKBcGa7JGZpZ3K4k=
X-Received: by 2002:a05:6102:162a:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7ac1b81cb78mr2670601137.9.1790174533710;
        Wed, 23 Sep 2026 07:42:13 -0700 (PDT)
X-Received: by 2002:a05:6102:162a:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7ac1b81cb78mr2670574137.9.1790174533193;
        Wed, 23 Sep 2026 07:42:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde134739sm76935275e9.0.2026.09.23.07.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:42:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Karl Mehltretter <kmehltretter@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Jerome Neanne <jneanne@baylibre.com>,
        Jonathan Cormier <jcormier@criticallink.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Shree Ramamoorthy <s-ramamoorthy@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] gpio: tps65219: Fix TPS6521x GPIO handling
Date: Wed, 23 Sep 2026 16:42:09 +0200
Message-ID: <179017452737.62498.16565807565260585932.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919171100.90430-1-kmehltretter@gmail.com>
References: <20260919171100.90430-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX/0fN/uyMXc2G
 xxDt6vox/vksQqRI/x8AJkzjJKkUH0vQIgA0Uo4TvG5GURYyzTWgDUc1YIF3ZXJyjwQ477uYylq
 1TThhymZbYP+ASeoShnTU1NiF2KJsSo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1OCBTYWx0ZWRfX8F14bos9Fefj
 XSrFLmodwsgxVyR7vhOhbYTqTAcQyTz+mmfiDx8UaNDAm2SDNfOfc3eSz5zPY3VjKEEZb5AhTKy
 lFGgkxKZVA/NwQDeVIwRlb3PZx87X6WERhl0jGgSuIuydw6lqwVE2672iVmp95kNZuc+8KydcVn
 YvTnRkdMNR9oplDP6dvC2ep6AyKuz24xBO5gYCnFNUFyRCC7msz8gXt7SFTawTCbcVkxSbSDGec
 om9/dTN0Ts0VrH2JeY0WFGCe7gJ1d4jUFK1g+hWMv9cVrvcXGXRsO5+V6lRt4y/y2EhOHYGVu0g
 k7BRiPTKrSkHsA2+gX6D20mOnC5IdRzLUZw/lG4vLr9UYCaTnKJaX5YoUW4U30Ovv9CbkM7cZi5
 E5/GIr9dfjjbBtyyqwx1ifmsElqayb4eXQZesSn9kSa8mECkPPtI0EaxTyjBCAXUIHppwQ13wEZ
 d3vbtk0xjPZ2uUHK+3w==
X-Proofpoint-ORIG-GUID: ycnOaOS8b6ax9lj3lGelsipSteW78b5F
X-Authority-Analysis: v=2.4 cv=aNFlOr9m c=1 sm=1 tr=0 ts=6ab3e546 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZxkUJIZQlAJGTDoIxtwA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: ycnOaOS8b6ax9lj3lGelsipSteW78b5F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230058


On Sat, 19 Sep 2026 19:10:57 +0200, Karl Mehltretter wrote:
> I found patch 1 while looking through the tree for code that mixes up
> bit numbers and bit masks. Patches 2 and 3 turned up while checking the
> nearby TPS65214 code.
> 
> Patch 1 fixes TPS65219 input reads. Patches 2 and 3 fix TPS65214
> direction handling.
> 
> [...]

Applied, thanks!

[1/3] gpio: tps65219: Fix GPIO input value reads
      https://git.kernel.org/brgl/c/4cbe530c0233c7413aaaeb029a4f32dd6aadacbb
[2/3] gpio: tps65219: Use the variant-specific direction callback
      https://git.kernel.org/brgl/c/93cf8cedeaaa05714f709b539cfb976e0b80c830
[3/3] gpio: tps65219: Fix TPS65214 GPIO direction programming
      https://git.kernel.org/brgl/c/270437f3fe62516f16482742a7762a075e7a9457

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

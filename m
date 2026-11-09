Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216335;
	b=rTcD5sO5BLxA556ei5g3nIQWG/MZM08ts3+HH9KZWkULOTj161+TnFfqCeeQbBWc0Vhc
	 p+rWXhr85tDrSAeBSVzjQs0kugtcXXV0OeScZ0cXETsh7z8iN18o8cecrSF8lKjA9mKfk
	 Eqo0VIyUCJOXMdgl+rev/IXbvAIzEXDY9HcYvLdevGW/9EeRZXAI7/LfyV5N9M6FpHW2r
	 2FZm6ed6NCG6dtq6pzXcNLh1o1h+NNMITNLIqoYbo798pcXySqwQgVAC2Nbsqk/pANuiE
	 HRkJqtswVk4xYYnJmUhdIb2733WmTCqHCY1dZjLGAws3Li0tHWpX5vj+8F6imZHGllg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216335;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=;
	b=3p+QnSGBUs/YAOnXqsLBgJ+TTC0MMD5io6IU8MbLbsLd4sRfhek9udMXDA4H/c3+ca05
	 SXy7cu06cNOlOK25AGNFIGlX1t3X2g7WxQXHYvjudoXVrtvtfHfx5cAzKbw/REH/oIHPZ
	 nuqgvxRzSmd4Dl9ByJqBRqV8PuN9qa5PoOFuGebLmjCCf+VmBp6oINj8H69XCISp7l9Gy
	 LCuP+MeiFBeeKp3HBkbEr/bEb7f+Z+4rbfw3VwiKIX1nbc3/oVnqnqcXeJw+3FtKYN3tg
	 sBXPclsI8OrcRtKyziKf6AZyWWkyzzlYJNoOIBGD3xbltdAZqQdm1tNGonDKLOU5nrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PEPw83tW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwfUHZlP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261E6606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:25:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 261E6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PEPw83tW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwfUHZlP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969wvj3611035
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 09:25:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=; b=PEPw83tWAheJ+RYk
	VPKbSYQ49fG1l+3xCMk6XKaUFpa4BSVMc+Y4RoU+auM7bqokYR/NjB9yybDwPO6S
	PhDDjEtPaAvn37hyHwlZESjLwkhhhYUXMuOU1lc5TTN+gI4PiL2iUTrFRL30C2XV
	AUrrJF5G3/gaJPP7xofpx7WQrqHwftjKEIzYLLStzrYLIorYeY15bDHWkxWeWSOW
	A7e7uU+ESMp6388TabEGeJQIWT6z1OsldsCONofaNxmlkUzDoSaw6+Ro67MYq64N
	U6QX7TJh+xYWy/JuhZCZM/soOU6zu8HnK6Qm3xG1Iqg15AU5uR7/fnY5+f5IT2BI
	4zvnMQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hssbnx2kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:25:33 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99939c0007cso76384241.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 01:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794216333; x=1794821133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=;
        b=fwfUHZlPhg1gYjm7wtioJf9FON+BX7iXH1cM4FA11mDfcZ98nVe2BjIWBe79fEZ0i8
         NOS9+xHLbV/gneStYYToL2LpH/Ge79ycvX9Lrs4o1Ahun8G+Q52nhedG9VV/TjXcPNvV
         QV0+8h5ieeHXx7XZwm984PO7/b80x0OODYeDUVz7ZaBikacAFKRFGM1IriU4QkYrCoB9
         kHe4BcIwQG1OxVwFmUs6i9uAjqjxI92qcedOt5kQzwSfuZs2PJBznidr5+P08442FzYM
         T62g8DkGmJF4cIWtWDgJkQhtU7U6PKzJg0EiG6W7CjI5HAEWkzdTi2U9IpErZ+CPXQCj
         US+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794216333; x=1794821133;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=17v+OoQf3Jdgs1t0m63O7kLXI7eeNSBiKl4ByK4Hn5E=;
        b=gJMocn+gdfAQuNpK0YWXxkhK2PnmBJ81pAAKmSk5B0AhB8Jfnc0cncoCYAr94Uj1da
         mB6c32BVpb44gQT4msOR3OMz0OiFJKxpieqIDxoW2jwnQVU6zu9UrL3VyGemxxDZJfaH
         BjP3ixljsmY9LG8Pv95LiNbAcVuogqo/LVndDp95s8KpnwULSsaPD+juzEc3PtC6eslq
         Dt3BA29j1V4S4+x7KUCvNJjORCDuYTIqk/wfMjAnZXS/LdQ5Cd/TXLHGS9MIpImfKD8u
         6/vwLU+6rAXeH/AzfleNDXF+7ybts5jkfdCfnTIta77uy4mGMiTW9iA1sAsprZ2Ez6sl
         VTXA==
X-Forwarded-Encrypted: i=1; AL+hErH/nZ87Ana+eR1Ruo3vrWd30Q+riG2WD8pflkVfE42hWh0qUIaGCIJaEVjcWg6VV3ajsN3Bdwe+DogMqaI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cn90D8kjv5XnILnXoae8DPGq4ZOIoiZfswqngnPq1E8LuwBmG
	His5mB+aMMmATZr+zPjFBmcK7e1ilhxkEaCPqpUXuCC7S+MDg59rujzTZABGjAECLTMF54u5uNr
	r17F9rhmJVe27EsSK6PvV848vT19RMUp68KWF7i4FPUyOfpKL+2F9TaGa7nGLOoTNUic=
X-Gm-Gg: AYBFou3e8eEEm4o24ro7NTslQt+kt2HGvHpKFmf5gWCAcYlYbfOc0Mca2xQZfT/mCwZ
	Z+ZaGFbVkIkskXbdlMVSbkIM7CIwNQPe6D5QXDJqAcXgUZbSFvEbiw2L8DPx2bfvpTeF4kT4oLY
	VCg6TEFTWA3mL/hdzDDcqAmRhU7926JnmhcSKXp1QbTxlFEx0GT//i3/tOYaxue8b2eOGpdFjnR
	9KOn1LYLdEmEQiLFNf6ZsO80thPaTlJ6hHbrDnTYMVpE3xJ8os5fx6jHp9hu42Bd3Ek1r3f29PL
	fQmJ/lX1hx2h/ytYb0T4kbOa6WzeVTIKOaa+nRBHtJ8yWR/tb4BEaubY7cURt9rmwUBhBue1nD7
	YvibKRiJFFZLDvJXvUnvGbxdVD8Ax6WQXWG4J+IcwWIoeCK9cxkZKaN7sN5G1+O87y0ciGZQSRw
	9Vnfpq3QzQyfCx5OUKn+xiZmN0+sXGTOhNwoifJ5R7X9DM6gkeUYL1PRAg+SHcpg==
X-Received: by 2002:a05:6102:2922:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d2db11e9camr642873137.24.1794216333167;
        Mon, 09 Nov 2026 01:25:33 -0800 (PST)
X-Received: by 2002:a05:6102:2922:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d2db11e9camr642861137.24.1794216332605;
        Mon, 09 Nov 2026 01:25:32 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495974660cfsm8968027f8f.38.2026.11.09.01.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 01:25:31 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andy@kernel.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: (subset) [PATCH v3 0/8] gpiolib: scope-based management and cleanup for GPIO descriptor arrays
Date: Mon,  9 Nov 2026 10:25:30 +0100
Message-ID: <179421631091.22822.17268223007589060557.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
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
X-Proofpoint-GUID: YNEJmLAi6ZN9VNoWNuaumaDiP7ty6TrA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX8LRqUWvHoi9u
 xrP6REQmOWmbEplza9B3ayqMnVKndV4IY2ClgNCey6Q9ahFfwXyBAq7/zbG04QcKFdCYNIH5NOt
 mWnKfb75lDHQDBHQwDE8SWAND1ugixpTpOaZr0NKZqgCAOj3QW1APdSm/vqrZLmZkRRC8q4GSg/
 phIhRmnlD2CHX0DGaMDMovTRkHYxd9OdZq6Al9gTYhyuBJIp45eABCmkT3IthE2dlsYYRFuFIvW
 H/+tV9b3BSBl7owlflya8HUIYiTzUMZVcG/0dCH6/dIz4kkAmGQXtJcWP/v19mHArNud812NqFG
 Ph3qXut0KNsoZq8zLJqdebxJKLnLaxEBd4WVZPSeHXUCwfuU6olg1UlJQTK4Ae0dDWCvVMoZu5z
 D5HdPLCrEHvrZSLEHn3uNI1RqphQmy6+c0rY6JTTFEKjGZqyrS10spU2de8oUlJjvmNcGUUxJ9z
 x+ruNiazqNCv0o15nOQ==
X-Proofpoint-ORIG-GUID: YNEJmLAi6ZN9VNoWNuaumaDiP7ty6TrA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNyBTYWx0ZWRfX+91jv0yHz5+2
 y856Si5FU8ZqxlD4LDZnp6m8yQsHpY++bqM1bi6PKk3QgKCcCFJ1lyg2K8zJu4sHeOXq0SNi2bF
 Oi6n/spzBBE1JauZ2V098bcpMsLazIk=
X-Authority-Analysis: v=2.4 cv=JtBkP84C c=1 sm=1 tr=0 ts=6af1918e cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8ZxHLKPBVxxFydpm5EYA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090037


On Thu, 05 Nov 2026 22:30:14 -0800, Dmitry Torokhov wrote:
> This series fixes a GPIO descriptor leak and a fast-path cancellation
> bug in gpiod_get_array(), fixes the !CONFIG_OF_GPIO stub for
> of_gpio_count() to return -ENOENT instead of 0, introduces
> DEFINE_FREE() scope-based cleanup helpers for GPIO descriptors
> (gpiod_put and gpiod_put_array), converts gpiod_get_array() to use
> them, reworks descriptor array allocation to avoid krealloc(),
> switches fastpath bitmaps in struct gpio_array to bitmap_zalloc()
> and bitmap_free(), and uses the %*pb format specifier when printing
> array masks.
> 
> [...]

Queueing this for fixes first.

[1/8] gpiolib: fix GPIO descriptor leak in gpiod_get_array()
      https://git.kernel.org/brgl/c/b2a161687acdc297aa91fec7fa0966b5aecf0d16
[2/8] gpiolib: fix fast-path cancellation in gpiod_get_array()
      https://git.kernel.org/brgl/c/51c85306270972f672737dc5e28332e2b41b26f1
[3/8] gpiolib: of: return -ENOENT from of_gpio_count() stub
      https://git.kernel.org/brgl/c/e20e4b8cda2b4d7dd32dbd2c0875a15d92545f04

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

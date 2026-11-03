Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793684837;
	b=4h8uQZMJVGcVvT4cwOTj7RX1enf3btXANJdTrnOOEbn9GsNobgJn3ZYN9ZRg6que0uDB
	 GoYkY6Mk6V6gZ2+okq6rhxBr6zFD9mTqWoL0V4vIeTsJJlcaeW81O4Kl0jUvRL5PRy5aC
	 2nMq7fs1TFI70Vdg21uZhwlpKNJTaO53fv88xhbZXGgm4zX4cK7HZ1+RzHYZpcgLN/5/c
	 jf9DlWiH5qphHzVWptfGZmVPvY4w1Vlr+g+yOQc88uWL88wZKZxdP3SEQWoSteUZeFV1Z
	 NfoG+EWERqF3dqUvD87xfnfnyoftd6VnmQIJf4X3J/ROvqyQ2uSaBjBCdTY56NNd9Vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793684837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
	b=BVoOzMon1+LVKyqjBMfovuPSRDN5LCZ0S+kQKJtidBfinGYt+zM2bv6wFRuL3tQLgXnY
	 AGrMKzT8uptgeFfzEXEhvfpJk8GRkZN//Fr5o7jdlxUsOYi5nfw3mVAK/ZoERAk/DBq96
	 lXwTI6V/Fa5n14osd3vnjzdN3Z9E1DtLYgU+I28JFXqzSGKrE2jB+VV84XvEBkaaCdZ54
	 pC9fwXYmsSuzfAB0OE5JsLmtsPR8INcguqVrc7G88MsE7sAVqvjgac5wqFlIgOH2Md6Gc
	 naaOMWxf9ec2OpleY8Lupc/HXzGCY0npBhsvzoSLuifpDYOyGs7mJgnJ3p0FAXMy/pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DAB606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9DAB606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B9WPCRoH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g56Tr5nY
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A33hutg1141809
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 05:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=; b=B9WPCRoHyNWKGB9D
	L4dsvqEUClvH8NYUkX61OcAYrQ7xjNf8OsnFL8BeS8ivn8fOebHh8j2Gr53ZrKh6
	6ctTJdl0ZoS4wmHYDLR+/08RvCfJxzW/kPXa0K7cW41jngrpCOWaIY6LQkDQwyJX
	pc/oqb9Sfa1/hL935YqWfv8iL7ENTA5UNB6XUVuTVOZ4NG1qYy0RYXXAn+i6+JaE
	dAtNI49uAU+gger0nd4XxtGguv6Heck9tdclAGjAIlIbqcV9UwW5+P+biYRG2YaU
	pDVTCiB7IXKU61B9PByE9Cd8wuz4R9xucjIUAAdWtJMAiw1U+M7kvVF7/je2dwm/
	b3H4Hg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycrdg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:47:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a03834d8ffso4792198b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793684835; x=1794289635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=g56Tr5nYTBRguwedEcBQiCAihdNQBz0x3U8KSv4CKoD5x1qbdtDlrpaDDpbgYZ1Bd2
         U9GWKN88ADi57o/kysshNxRjfhR7SMLlHQbngl6W2IoEhjDDPWGxfSGqd18v3gY1bMdF
         Ro7XaCyaL5VfZcBjrnztEZhilDGytP5PC5QGT7oMSctJm5TZ0u0VK0cXsBaev2ppMVir
         bmW/hj4+dzczrAGOcp3EI8iRoScRqtp0sET9Nofp+ZLAf0oO6qRafd93lXvd+NL8nvLr
         1D59Fqh3ddTIPT1yQEVU9QrH3ByI4F5tq7F/Am3kjAa1jDQjqtIupr11x4T1EMqd+5D0
         396A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793684835; x=1794289635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CAUzZfGxBOdGVKQARymZnvw9tUEu8Gk9GBeF1+1UKlY=;
        b=wZzX1XjRwZhTN6nh00ntnjuXi8tGDcp3tfCkJwxQ8+thVjuhAMWkYGB6Bbtgxc5reI
         4KkBqeaFiUl/Pe9+sTBmupG7iQ3uX07mC5a0rPOyJsbNt2O/OU3raYhso6pCjDGu0TMj
         wsRcOzS7xJFzAGCdzMNZbgxKwJv/EbZzZWANB3TMBoypr1xs8Pq7X9kGrD7hA8X2wH0D
         A5qH8pMJ6sNfb2rn05VPhKlhH99QPK2yk3mDcmq7bf5qitDeD9uZ8WKl/l/Mvljb+05U
         l5gXMNqjrDY1WCLLtUZk9tYOxl563bZCbulXaeHQkh5CnlLE/PIjVNcWkkoZ6F7VJRfs
         7rjQ==
X-Forwarded-Encrypted: i=1; AKwUvBydteGz4axqTOecMWVTqDI/ulQJa53zl//R/zJ1do2epdHfuJdNYTvYqwdw6kuS9qJ4V8toxbo/36qzx/8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hiqO0hT9gd05m7qEexNP/wbeM7xB5L5Z/XYqrl6Sa1b3SYf1l
	qHtsDiIvkpXbGIy8slqP1lew9qrcLh3W7IH/C0BNx2W7zAyLqG+sZuBazYxkpXJWBefYJ2aS4U3
	leKlNJpD51eCT9K3qRKwL8VkPZL9saeLJU44+hN0ffQccVOrqw6+olRmww4temU3Zejc=
X-Gm-Gg: AYBFou3xX6zw5MU3KsZbNH4QSAD2fCV7ed0FTCzs4FCp4EwqAoP+c6LLAmTtJYFS/u3
	J2hQV2M657iMNG5noCKEZhs3OyZzWQwBDfLQThcLNmqAUtWhdK20FbXwLqMit5Q20mAykJczq2N
	3U+O0PBXPmVH0zVwhzrNtF/Eb1ipIx4OylEKX265KVEDdpIoE2bVJyIGy0nY4CuPLF9uABowaIj
	tCK3U9mVpWDk+9fCMBMp9QFuq+0JrTDUePrPNm1HZmTl5nPe7Cz9AKLfIIvFCxRQBVZNnqwzX0A
	jsU0gHbpjUJf61VXoR2VkaEO3a3Fb8rmhnRAu5liOhmulem7i1ehywBbtfHX04RAkw1nsBQJ4yc
	GdVXVJfpkIJym43h0JAPGnyTZYzZQYZ+CNz6Y8tBKFctwmXxk4Mb2nkirFXxgijcGteDBIAOrD7
	CUnoqJ
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570087b3a.15.1793684835533;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
X-Received: by 2002:a05:6a00:1f0b:b0:899:67fe:3c52 with SMTP id d2e1a72fcca58-8a9be1a4461mr10570053b3a.15.1793684835043;
        Mon, 02 Nov 2026 21:47:15 -0800 (PST)
Received: from [10.217.219.98] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad7801a53sm2896689b3a.2.2026.11.02.21.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:47:14 -0800 (PST)
Message-ID: <e44d3e85-8dbf-4ca2-9c88-817f729fcdb8@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 11:17:03 +0530
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
Subject: Re: [PATCH 1/1] i2c: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com, Codrin Ciubotariu
 <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Oleksij Rempel
 <o.rempel@pengutronix.de>,
        Viken Dadhaniya
 <viken.dadhaniya@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:MICROCHIP I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/Microchip (AT91) SoC support"
 <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:FREESCALE IMX LPI2C DRIVER" <imx@lists.linux.dev>,
        "open list:QUALCOMM I2C QCOM GENI DRIVER" <linux-arm-msm@vger.kernel.org>,
        "open list:RENESAS R-CAR I2C DRIVERS" <linux-renesas-soc@vger.kernel.org>,
        "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
Cc: vkoul@kernel.org
References: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20261102170004.3852546-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae97564 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=ibj56h0FkVxt_nO8038A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: kKZv6TYzJoLKLQD91x4a1VJDvyKJiZu7
X-Proofpoint-GUID: kKZv6TYzJoLKLQD91x4a1VJDvyKJiZu7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfX4VyfbuUjt6Rj
 dJ34qTNRw+fqW61qvRdHD4JkCuxtdz3OOFxYonantCZ2RDUrko5YtmwkhK2iDkc1BCE6BXx8Tug
 pw68PG3hLHAJJpmuADpuMhFqLVVoaPChIonn47YezP3Azx7P/G8F2H9BA0jU9hpm+5MrcZLlpBM
 83tr1FYhV6Ke2yOe7MxuYLIiCS42uCL9oelZAllYyvmcmuN891HtUnKxNR8PD9cioDUkFWxPxRL
 u6sYs3FAX65rN4Nk6Yk1AI+BF6xBFdasQMNF+puHIrMMJQSxqAmV1/N3XpZs+65lufrsuMOV8FY
 T7U+BwoMeIXf8Gt90tl8N/AaAe/sewwjdTpDFFgsTiL6nPNJrr3QLN2jwOiDwfAimbHav2IX36I
 7mT20KotgQ1T6FFr27DrgRzS8R5dtQ6McTslJ1M1KTWlSX6cNsG0UyMa2G7Oa/T2L4kVaSUgc1R
 EkoTFZp3yXQ/MX5hehw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMiBTYWx0ZWRfXxgCJoQDJ99Yq
 xWyh0xb53yyN95v9mzDeDjpsVvBUJB4CiWuYEK0q998qj0nBLkh76YnNztm3d4V4TmagCbj90Ei
 rtF+o52/uWV3q4on2z6dPk/UJZou+Zo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030022



On 11/2/2026 10:30 PM, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across various I2C bus drivers.
> 
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>

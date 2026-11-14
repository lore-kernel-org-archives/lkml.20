Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794657014;
	b=O3hBPCK8+fFz//RtTZOdQnpB+EkPMjXB7x7VamnIoK1WAnCnj3AKCkvipLYciRza2UUl
	 efe/8KcUP38rxCs18AhaaXaKD1ovggikU0/Ffcu4PJvpSMXFFl+SwzjbuSaZquUuTAm3M
	 mxn0Y5W5tYpGTBtejBnTimAED7oAT/IVrr7qLz3fWqcoNDTTN5Ah7k/gRgCJMpfNW2oXv
	 ADu9RDGIfcRRPfAqWnpen5V2kUHl/u/oZbZF9dwLcul++6AliB44DIm6tlWaVM69Qd6dB
	 pZ45ZQc1s/wm1Brku98XygyCDFGaELoiuGkSO/uv/JAbkCQMSUF5KeBpFrRGaW1aDPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794657014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=;
	b=D64J+IDWM0Ov+WmkaHbm9lpXVqlCJUqEOc6OSk18ON72m7K85URFIjhne0T2L9Q0I5Uo
	 m5ZNdKb8jUnH7REOJbeQDlaGRXnMZXDZUXtXnDDufRR5tsAiF3Ruhp/kU28HjKRFzvalP
	 hhrkWBFsE7RK30yz7vFiScM0KhFOv6EcYVvulBeQ7b+xIl9zeVphvtTbpXgamhYBN7Nz7
	 WBhxqooOllYxljZ4BL5ee5AbNelSs4MrthW1RsCxFxONr+VAWTgNfUefSW5XbIs90+3n7
	 e6ackredRbJqOWbMnw8wP2mZ4A4G2M7VB7pGuGaNPjzthJkwLt9db7MYMvhFQLUlooQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PiBqRjkM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BmuqHx9S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDBF606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDBF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PiBqRjkM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BmuqHx9S
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9whvE3845465
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=; b=PiBqRjkM9SPylZBt
	4LD9BvT6t4t8REbdmGqwIYc/Ollq5iLejeb8xDGD+RFr59mzoaWq3uhTy7UYITKs
	MnhtYpWRbdBwtAH68Y5AoaaBkSudeMnzZPWJwsf5E2IiNQnBpHYeQdBPQHWUHhTS
	9XO4mqOnpn7qJSfIpZ6SW+WJ5NIJGdRdNataVC+Z0zxpeV9BJV7TjD6CNNT0L3s6
	01ZLJl3TCsz3eVOWMqVzu/q0i+tu423bKhPMn8QZ4q9sZnpRZKZ6+gMt+SFnnDXX
	c/rHVPQX9tWKPiOnNR/7qOfnxK+yzRXFCAMxGVkobtJGbo3+OoR5wJFr09QI289T
	9mF8Eg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqgp66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:50:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18165dc53so2721902a91.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:50:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794657012; cv=none;
        d=google.com; s=arc-20260327;
        b=ammlK+QzkoElm12YVxOO5vSNEY7bTfZLoxd0T1DOG7HTmCPkKqeZgrgZvIW6VcXvS6
         nwPYObtU68Q+XV/1oY2lbXuxCrG+D8T6kjgBDPBVULlKNrYGqXHH6wZXXt9O2Mu6kmIT
         jEgXbfezjr4TVYM8LtDxtANy6lW8P9FqAL2qEPPFAl/ZYPzJXSqJqLhWd8FZrYCF2QC8
         ja7gsax0kb001i9VOmCvqzvnDZP/5kE+H/Twk/2r0mLFSSojupI2NqXWPCWGRPgu0Qxm
         8SKzaWm2TVnCAkNk1O3dX4eFq1LY/nFgqhk/MevqEo9gXGn/Ybnf9ZTmkn7tRQ8Vy/Sb
         h1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=;
        fh=khTB2t0dExQBEIHumB1bPLzV1xOYKwVwzvYP4raPu7U=;
        b=G8e231LLRV7Hg0K9bw2i+xwOOtqIEhbJSq3MinP/x1DiWrRvVdd6GM9Nvxr6Xkbx5q
         /JkFwsBbGvkPZiov34/mv56HlcDEUCvfeWcEmnZvDgzOY5lHMq20NpATjaGlY4ZT6Fv+
         MQK3pQ01/U11CmqYTzVtXAJnUTwP5lcvX1WoCbqa69nsymsEbdaarI4QCxGv8LbAUb3F
         v551CKuRD79wgI3kNnAyaYyHXgBH0ggAFfffKgOudyAOl3kvccPznZ47bU9WTTcT0yHr
         rabeyOC7LZThXByOJanZDnoKZYbmRUxblrtKlbl3qY7TnTWIzwviJKn80S0WwhSa/YV1
         FKNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794657012; x=1795261812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=;
        b=BmuqHx9SFSzf0TqpqiCv8ZHXkMeunnrMk16NmDPtxf4eLbPAN6KqKzOvZP6sF+qIXv
         NgXe5HLO786VpZpMdklZR578Uy9tSiJucNYDEvYvIKqV5QqT1/5qMOVf7MVE98/lZ+U6
         Kudafa2jiOKoaGtPRfG7Nm4tvr7gApEo0hLbfGiqS3y8dcP8pUOB9ZWZEV/eEdCf7tkH
         +mhkZeZIyLn7iqmzI7q9dT95tp2fZRYWWQwrXsOW6mos749j0dGf/5TxfjN8rJo6WcNA
         AZr437cooNFFeJ3EM9kLyovEYTyD8BUJ/nqWKg6kcSXp9XSUR8gFr2LRGzShjS/1yXae
         batA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794657012; x=1795261812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/1WLzYMEGYQaXjv2m5ge60WfeRW/hTmJOCmO45FGgk=;
        b=VqHiyACruywT5gCbjy2UwGhkRN7ofCU3J04et4Eo+OuD/SEQoQCvEH/T9XrfGKKeNZ
         j9hX6yZfNf9t0Bq+oXduMudb9d7OGfgSdvjcNs70tcKvflYUmfSI+5OFjN5HzfgDI+Ky
         MLMW6bJJoxeVkKvqaPmqvn6lTxdHN1qVfmndEz17lzPLWccu1871J+MlF3e3kLmU+VUh
         OAQfjJxIT0A0Lmm8/HKHGgt2iAizaO9suF4kqLDfBxrNjDY/L1z0gLBD7mj9K0rJ8UhL
         42FqCm8P8OJQ6QWUkWpjDpiDXKJKSly80fQQzI2Jlm8IHj/ugFxibMNqD1xef7CvGk3M
         WXeg==
X-Forwarded-Encrypted: i=1; AL+hErGZVUbKeCOMvxZj9+Q+1iMS8/NuOrnIQhsF6M2zYyam7SC3V32d0IYiQahddPFrLXdaq07mbc4h5DiiEgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d7UeJlIuX2kO1EeKvxK7PyRVDsCENxjR+aW8Ac87nmLCt8jFK
	Jnzt4LRyy+IYJtt5US6XbQPik5t+tM2J3SdBUDDzek4LgrEHkv3uhwRsrT+3b79vwfUpM8wvJ8q
	tuSJSd05CEALhrmFHa14/X2bg2TayMOXpB3AkMj7h86cY4IzzqFJQw1QI+ilSllIPvWIv3njwyY
	Vi/D6c7aw20KONIEj9rUzpJuMf2Od8SzdxqvIODaOHMQ==
X-Gm-Gg: AYBFou1ZWvRGVgNafb+WNBJspVqI30ttxIDypcG5oBgpHt5MNFyeWNBSjjJhQzSbX+t
	5q8n0v0MxpKPi6+xoiheHr5PnhjctO5FQVPqKHuUIom61C/ZdIqCx4J6BTBfKHpdl4SQhjJddrR
	mWLuEes+SDH6ErGWf+UvIE6obnRydhw3wOcedFhLrXMR1FqbMMrpOW2zdYQw==
X-Received: by 2002:a17:90b:3ec4:b0:3ab:c80:9370 with SMTP id 98e67ed59e1d1-3b1b09e5ed0mr4929476a91.20.1794657012163;
        Sat, 14 Nov 2026 03:50:12 -0800 (PST)
X-Received: by 2002:a17:90b:3ec4:b0:3ab:c80:9370 with SMTP id
 98e67ed59e1d1-3b1b09e5ed0mr4929447a91.20.1794657011622; Sat, 14 Nov 2026
 03:50:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105001257.1368266-1-me@ziyao.cc>
In-Reply-To: <20261105001257.1368266-1-me@ziyao.cc>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 12:50:00 +0100
X-Gm-Features: AclHuK_M9u9pSitA56QWlgF1DmcZaRUB93icyXp210YoENL1vh_SV8siUFJBQLc
Message-ID: <CAPx+jO-OzHrQ2GXfBzWLRHSgyTpyphhvRONCwohg_F3OM8YgQg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Error and deferred probe fixes to Rockchip PM domain driver
To: Yao Zi <me@ziyao.cc>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Shawn Lin <shawn.lin@rock-chips.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Sergey Shtylyov <s.shtylyov@auroraos.dev>,
        Midgy BALON <midgy971@gmail.com>,
        Finley Xiao <finley.xiao@rock-chips.com>,
        Frank Zhang <rmxpzlb@gmail.com>,
        Chris Morgan <macromorgan@hotmail.com>,
        Kevin Hilman <khilman@linaro.org>, Caesar Wang <wxt@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: BzaRNm3-6Tm_JnxqC0acg8YULWatlE5z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfX+Mshp7ycp23A
 NcKUeo/ahXB8FYVJ7MToIGvnvy8WmaD6HNxxRaHUNYFwNJYoE4nTyDcIa9qMK02a8esWU5hZ3+/
 c9hr/Y03xXtMFXiwBD2deYG8tivFMpuf9krzvuEkogEKKKbQQhhpCyNt4giogVBLOx19DUExOBl
 e42P4lcJwjbgbZgVl4wIHBEGP47F4IDO8cddjsA6EeH80ixHjbK1PWPNw2PzbhM+To64qZ5LH4d
 iZGR2tZHYhmywgvK+Ov9lwlvWOtNkzD+vE2ziXT7+rxLYPCMFJGyc1+toH4JyOgojT8QCQlefH1
 9V5qDEAPMTlzG4RZBEWLVnPJqesU27EhD6QrwE01Kleqc/oro5i5CTjSmBW/8y6ZB39l1TukZZO
 0bfjyj/HbCIKEgO5EkCSvKXMfUEa6+RC/XNrt9812l9M2dH1ssHUbE6eULuwDsb+0+BtRn7e/Ym
 DFpLzD306YLlN/qbuuA==
X-Authority-Analysis: v=2.4 cv=TqJzFzXh c=1 sm=1 tr=0 ts=6af84af4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=NEAV23lmAAAA:8 a=LTGKUmlCnc3-cF2NnXYA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: BzaRNm3-6Tm_JnxqC0acg8YULWatlE5z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NiBTYWx0ZWRfX+UqExIERsvzd
 2CuAM+WhKBLMPMXlsUHikZiYA3lWqcOOwOaCgOxUSKQlVZNXngWRoFDCa7ujC+YmRz55/7+ixfn
 m4xc2SqoLABmZusFzpQIthuAEv2zl90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140046

On Thu, Nov 5, 2026 at 1:13=E2=80=AFAM Yao Zi <me@ziyao.cc> wrote:
>
> These issues were found after I upgraded a RK3528 board to v7.3 kernel.
> Here's a configuration that I used to reproduce both of these two
> problems[1].
>
> Thanks for your time and review.
>
> [1]: https://gist.github.com/ziyao233/a5ee8862d1baf21ad756cf4e959e14c3
>
> Yao Zi (2):
>   pmdomain: rockchip: Only put clocks that have been successfully
>     obtained
>   pmdomain: rockchip: Don't log when of_clk_get() fails with
>     -EPROBE_DEFER
>
>  drivers/pmdomain/rockchip/pm-domains.c | 24 ++++++++++++++----------
>  1 file changed, 14 insertions(+), 10 deletions(-)
>
> --
> 2.56.0
>

Patch 1 applied for fixes and patch2 for next (by dropping
fixes/stable tags), thanks!

Kind regards
Uffe

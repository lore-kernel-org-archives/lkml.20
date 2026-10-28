Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190929;
	b=w6jp2HIwojUZuU1JQ9Ufkawghe3pXdva5nxYHlpR0u7nEf/NFgbYP4yUt1IO39FjerLT
	 U7ImxDwNq9Pcb9frQ6fvqBTZ0MTI9FRU9CquOan2xbbLVl46zivEin0kLJ71jVr1EmezA
	 V4/RQfewHNL5NfpgEStUXcyAocbMnAoC7rlSh6k19klhcUU6xo8b9EXDe6XlLqWopSYo7
	 NMBMBnL4oyiCerBkZkfpYOgnn9Ueh8VuZUhwuDIaYs4YzpjhschtAOFHRRYTb8M/b5hNG
	 HZabAYf570YqiaqUUQy8ICKc2O1FeBZwhFXjw3i3cDUfU/Hq861aKj532yYvSTKQeAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190929;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
	b=tuWiRPARdENpmvWFr0MUdnW+1TgyIqyR2KFYZJqQwUISs7yxhjABDHxQ22vn9aM2QJaJ
	 7nJn7wi+VIacbfLGFO5H9mSptcy7Lkcq2khEu/TlU6L4vi5M+ESVzj5xrDT6f9tDIasdH
	 Nn+GTwa+T1jiaNzh7muVOkLn3DYPIEa+ia4kjNPbX2sn6S9JIRD/kFEzt4B4RI0YLsXEk
	 xkCiKS5MvLPpeS35sPB/yf9UnQPD7kCEAgjgikB5J92ZlRaS5ym+fELJcg85NILEJ0bNz
	 gx2KPkCx1tpZdaV6PgjIaIoFSQLVVevGR2TSUrgX9zz3EHqHQqeeknLcp54+XHBGDGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/fwmexY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMfzDT3S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77155606A332
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77155606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/fwmexY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FMfzDT3S
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdxmF2082404
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8dZBtwoDTbd
	VakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=; b=N/fwmexYAOajBjAkEkq/HeTf2tS
	wGfIct+N/AhRJ7bO1rNXIHGKx0xHm2ON4K597rGlmhAOJHvRcfatyhdB/U1tL5ab
	r2zkx2tnbCECd5xcR/1e9v3XK003peuZ/KamPED2cZ1cPnNTL+pcwXMIN/JKLqH7
	UVhUrvrB3YPo1dlOHYJHduOWY3tjM/lYaipCLEma5l4KaN/OtCtpYwQbkSYzZH46
	Rp6jBJyhk18+8P8jt0DKSD0onpMP16M72Y5Rjg5RIOUusYXidEiakVBqCrfjBiH7
	GJMLagFjQdlVm1iS2JgCajfnLOfE/yn4U+GrQywc4vz48FvWe1H+1u0iVBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuywc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:35:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so1082269eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190928; x=1793795728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
        b=FMfzDT3SmbT660gnhD+pIZkahKlw4QYjtgc6H3a/y8H22xDqyLk4q8shWASbg69XSe
         DToJZBnve6+lEtFPBegmQpzxokYfphPQY+P9z8f9YTwMwTZKsTVthQItczicnX88nXef
         aC5Jq+DfrynzyJ66XvT4zceNUiFsMMvmlbb+mhZ8uy7kJ53Q/g2pi2CZ1uufaRRHfMJE
         4xXYgkdU5SO8fvOo4PQTnlKprT2qEZ7gXlOpcqVEoigNq/D+i2e9pff1OI90VMOVZPR7
         TCX7FXYBvG1W6hojyzw2rrNBjq96wMwuCxHQpN/cGyHgsDkE9DyoNaiimvygijbKwqKK
         UDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190928; x=1793795728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dZBtwoDTbdVakPmfemOCNglz9ddlh3DmB9XzHZ3Trs=;
        b=cj81D6m0FEq1P1XpnYGzMSRwAg9J+Kl3nIgB9U3Q8MVKNVyBd9ny1N5zZLlFRthpMj
         tVI9ytBF7v4hwYZwLPDkliKMUC3ojs/t50mVLKzfErTXEBQ5ilE50d7o+QTUuKB7xaTe
         SMjYWEV/SphE/AE5EVcNsHTIZYYU7ixPxZCGZLAhis+fYdbwkSLECQKB6UvymS5qLRzr
         IBFSfe5ODGWsbTDJBBH5BYubZA8N6QZJZIzMj3jBXI5EBIcdJHpEd5x3xwVeXL+FbicQ
         Kf7jO0aGdiI7BB0ogSs6XNZBNze03JUXtCH9OW1lPQLx8isFGL2SPvo/Rp+KR1JY5rUj
         5TQg==
X-Forwarded-Encrypted: i=1; AKwUvBzn+o/Lk2WDRVAIBXx4+FLNcuuF/bu0mh29wo6JZ2Fblq3h1JaUVY/l0HYBSjZP61iQFlBeAnrAK7bpdok=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7PIf376ftK8lTobB8yVhFRop14AYTPwa3ig9Pu5VqwOwcM+el
	nwN89WUT3BUJN3/3wUqwfJ2/QTPLrHfQ5VvVdP1OUUUTHfxfWq7pU01gsUlBFD/R2kNBhaGxhuc
	E5L7wtL3jSfp+mDnmBnYEk1dDICgC7s6dmzFgFmtIvRhlyHYl4HSF60hEP54pKR8JUm86nBS54d
	q1vw==
X-Gm-Gg: AYBFou2SMDsqUB0yZ7AhbEpEOjOunwdmvrTgGCiR8cdXZ1O1RrwAN2Vdewic3Zn0qJp
	miLtpxg6ozhWJcUkUjwiOq8wchsfwyrC9BpTF4DPHPU3WOSEtfLAIu940422s33NbYuZLD3XAtw
	7i7Of0xr0pMuGnqgHYSqjcqhq3lSlhn/M7ETGOfLhzpHO5behKMUg150uxkIYhy/AaIKRSdmDb4
	Xq6c44zG13byhVl9I7LmeMCvOqyJcyS+rZoufJLCNDyEGJ2StQHUW6478Aqc6J/bONsUaimlGGL
	BsR26LmjdXQIJyYtOBLzvVWQjY+Gz2+/wP6czeliA4K+G1AsiqXzB1pLE7eivdam4cU4UE0LhD9
	70OkonETdNUSIe/+fZcYBdSuhyXIt0a7Dwg80D33OypPFUnpfOs0CMlfX8DPs5wU0S0b2IGx8kD
	zZ7y1vXHupltwo4SqhbmW9kJASbEgOsuRk
X-Received: by 2002:a05:7300:f40c:b0:341:c383:9afb with SMTP id 5a478bee46e88-36a0f8a9ea6mr6840626eec.20.1793190927667;
        Wed, 28 Oct 2026 05:35:27 -0700 (PDT)
X-Received: by 2002:a05:7300:f40c:b0:341:c383:9afb with SMTP id 5a478bee46e88-36a0f8a9ea6mr6840593eec.20.1793190927094;
        Wed, 28 Oct 2026 05:35:27 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:26 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 4/4] gpio: shared-proxy: Drop the vote when switching to input
Date: Wed, 28 Oct 2026 20:34:48 +0800
Message-ID: <20261028123448.510401-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX1rXn4oTr0Sfm
 Ib644tysH830pSlL6gsa3ykaDTNeJvGEbwfMSAnaZ/HGKRJsbMabHwJUMZqUIsBzz87FlIkU9Qc
 wnYiaFVQj/vUk0jfYo8bzpFd83x58fW1gLeoJGspP4Hs8AGGDydu972NvtjS+NmH+S4Mqr4pSx7
 HHFx6h98EhsaOJB2UatxTXX2MoclkVWqVMMNwOV7lI/+dfzIsr1KfBdLK6412xa31cmE02+PWPr
 3/VSTWiWX4ZFZOJy8Mkq+cu/4MM+txmbZ205Bnd3X+mplb/uAIuNgyl1+K1hx0RSRU+BtehGPnn
 syfIVPl0VUacy1hJldOf5oItkM13EX7h7pTQV4meiG8yXR4J91gIqY4ka/5ykGf55umcpRUWFhn
 KPV/0F4E9D8gGhPN9MdkYUZQb/oyKhoLsqlxlIGVNIpj319SxDw5wNXcHPvj4ImnDvnnDPF8vua
 oX4ULX+Rh+fFlxITg+g==
X-Proofpoint-ORIG-GUID: KVWw6lqG2Wfo7ZfcTtnCveg1C8sPC8Kg
X-Proofpoint-GUID: KVWw6lqG2Wfo7ZfcTtnCveg1C8sPC8Kg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX24CPGpnpdqd0
 AgrB5RAR0qSwOdA3rbkuyW73bTDVhl4CYTj8R02VThPPQyRiaxKGyaSRutSaRRUaCikN9gI2xup
 uqKAk66PFoSmEQ0YLHnINHYDqew2+2Y=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1ec10 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=ZGWLMo5Seu997gzVtjEA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

A proxy that is the only one to have configured a shared line may
reinitialize it. When it sets the direction to output, the proxy
resets the vote tally, but when it sets the direction to input, it
leaves any vote it cast in place, although an input line carries no
value.

That vote outlives its meaning. When the consumer releases the line,
gpio_shared_proxy_free() tries to withdraw it by writing the default
value, which gpiolib refuses on an input line:

  Failed to unset the shared GPIO value on release: -1

This happens, for instance, when a consumer votes for a change with
gpiod_set_value() after setting the line to output and then switches
it to input.

Clear the vote when the proxy reinitializes the line as input, as
the output path already does. No other proxy can hold a vote at that
point: voting marks a proxy configured, and a proxy that frees the
line drops its vote.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 75d0d617941f..b2f2301e9e64 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -211,6 +211,9 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 		if (ret)
 			return ret;
 
+		/* An input carries no value, drop any vote this proxy cast */
+		shared_desc->votecnt = 0;
+		proxy->voted_change = false;
 		gpio_shared_proxy_mark_configured(proxy);
 
 		return 0;
-- 
2.43.0


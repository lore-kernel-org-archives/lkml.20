Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869995;
	b=IEqRJ+FCjIGMaY9YQa37tbdQEmc+GGBQq5OvkWf7Ld6o0HPkooA/X+Sf72L85ojtmmw8
	 cv7jPuvbIS5J/alqr40CMChmqsoj5Q1SEyHcfHRVkLN+wr1K8kNPctDmt2yWVfERBW8lO
	 G4p0h5MgxJFQm6x4tlXL1JhroaPX5xr8PpHPB/unZEiLjIvzxDW8pw/k4JzkIsLj5xoay
	 3SbKhqdsMnB92FuyK5WpyC8J45eGBOVzwXQrVHpTt67Tbh8UDldeXBg2EQRzZMzKQyXCo
	 OaCwwI72TdaE+6IhYgWPGc5IIctaEzYuYL5Ib87gRtwCNP+TeN7+cozYgUXgLnvRnXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
	b=B3pSrd6Kz/laIufKhPPHiwmhePffY2RLTnMAtGQnWBtODKvb3a2yli2TXd1PmXLclkuM
	 QjjWKTaPvCGQDjSrNno5jvlC0LYz6hEkdj6U5PS7TyAFXmRh6//8nsT/qjKFNaBe7kl+s
	 JO3WzslbyH04JBACYhrLfc4iP57mW/XhZKFTM8iMlFg7lvmHAeN46BeosNwv8wTHoGnir
	 RppsUH8glPIR4iq1sn8b0m5NaaoLyL8QUGgu8bMTcdQVflke5/RR8ZoraMlYDmNWusgGK
	 D5egDTyLDHilFAd0VmvPDYKtWlLdjmh2JK9HRh5kaztOezcSeDneDjsp04H+UK16OJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQY9vFS+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1SkfBGp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B48606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:13:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64B48606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VQY9vFS+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1SkfBGp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UePb595529
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 09:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=; b=VQY9vFS+f916fsBm
	rX3P5iE9IbgB/XThZDvdwekJ7uK6K5qkEEV/GOdy++Ybca0QLidKN3svnWQjIFuL
	e/sz8tVl5tbtUIEcZ4UNlG9au0DU5Kmq5aXsfIGhSmnn1vDPZ9rHxjUgt7uxhmGz
	vpJnyA3qo4Cv5bY+cZ0xVctvGrEbRZqgPWkyC0hVrK8MJ+Q+r+zejMh5GdfyPxCm
	g65/vC6yBgHSZByj+mjuZNByeCLUy49DmrLweKGzv2YsfzeLxooAvVsa/GMa7s7m
	zZfgkrDd1yaAEHWh+P2wJ+7/VkdCuHDoQx/CT0BKuBKe3D0mnR+aXtr3FqAi7tsx
	i5WkEQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr8rv3nc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:13:13 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so1354147241.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869992; x=1794474792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
        b=Y1SkfBGpVwIMsH5vGDMeMLMNceqWWnCtDiTEny1XVCCdTAZoVtOyk04LAD6aJiJ/3a
         XaCOKjPhO62jZpUe9kd0kp+CweUBMZ7sMqijoOpeteTG3U++Sfk8hsQLumaUCeDNJZCA
         GITNfWKZgLnyiyvgav8rgwhJ/FyKHqtqVyesXQRQy/mn+TXN3HmBNSTJR5sCntmMOwNf
         zOPdiPgZRFmGGWQRC4qN0YIEMe9icI9IeJzM1qr/uwG6LyrySbvv9tqwmXKCPZB6U0hJ
         0UXp5oV1ChZYGKdVvpgQZhPnyfU/RDxeJZjheLeVcndLzxL8j+17WyUlEMDAFyMW/usy
         gOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869992; x=1794474792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9yfY+/I3R7K6u83bmbStsO2lPmehAVb28U13aAr0q4=;
        b=X+H4UK0p8OKPDZ/KlYG4wMphL8hYnLNSYpK8b+GVZsHgl/qod7Dmui0a8M8SebvHM8
         eYUD8KtXNl1J+HiioE/ecw1Lx2yciunkvRXvXQP6y3jr/wKA0ll1Ty5jb55TUhjVNvmH
         5JTODMSBZkyjC5umPR1P+xsn5XGasFPctXbZ0aR7uABbs7nK0EYIFmBE55u+YGZIC9g+
         IiFnfR9ES6MkuZy7TXKc6+W9T6u2eblP8DH1dCPeET+/3KDAZxJZMKj0+nGujnCTzr+Z
         qVQLd+seOTlthEeFXX1hBPU/7TYy8SqFEKNHkF3hmZeJVsunW6lbPf3byMGJHdTIjo+2
         jRAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeBK/aMMw+t8gE1NYk8ZdpGeQIOKdeLq7kowL65Kzer8RrpOSGVt9qW+RiUoh6pgeidKlM4aU/g1WNsjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z830HpWDlMphbNeikHc4mV592xxj4ZriErAXWj3is0hrWuJAWIv
	xVn+sP4Dn/yK9q5pJj20FwGAsXJ3oZM8bSAWkPlkZ1h9j6Twp0D+pPnxP9iw69ajnOk6R4oPvcC
	y2+RF9oWFL6PjBE0yTfHxYk1vKXv2iWe+iOaka+eAaor8SzUvT9Tw0UzDVjRdQNfrGX4=
X-Gm-Gg: AYBFou2CCQf8HoqIBym2nf5t7gecZ9FH099nTEQo2PYQtYCqBhK7OsYALEZEbXmEE7O
	VM545p4A9J1aSwnPx8IoOcnX6JOW4dc9X/dNRTQSWOKJOj5TXNmPrEI5zXLj769b+Lf96M3R+rG
	dR0ooiCWUi/K4VRa08DurY0r6RaXjICabzRb+fuq3q9FE1Itsf6hY3O4WGxac3s4sT4xmOCOc9l
	GZFnmYmvhYLeg/2JL+ZjlZXTauB03ADweuI8aCEbolIlviBZXCqmiS54Wy7DAmfr4MmJWBWpxPC
	PXmUnBIvONXTifH2d7hPDphdQ9Ve4+oYEy+b4jsKL/iTNAFLxrMzJQ+DWyTD5Y180F/pVo1t3Ph
	6ri+mQR4HxfkX3yt2yQpG6X11MRg6QWcYEfcJBpL5JVWuj5P2qq0yIx5GucZl4oKFj3nIX2NY2C
	/t
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d072cafbdamr8260487137.25.1793869992568;
        Thu, 05 Nov 2026 01:13:12 -0800 (PST)
X-Received: by 2002:a05:6102:5243:b0:7cc:115:ddf4 with SMTP id ada2fe7eead31-7d072cafbdamr8260470137.25.1793869992117;
        Thu, 05 Nov 2026 01:13:12 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fea18175bsm8523052f8f.7.2026.11.05.01.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:13:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Aaron Antone <aae@amazon.com>
Subject: Re: [PATCH 0/2] gpio: aspeed: Fix lost interrupts from write-1-to-clear status bits
Date: Thu,  5 Nov 2026 10:13:09 +0100
Message-ID: <179386998646.14190.12898260042958043905.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
References: <20261104-gpio-aspeed-irq-status-v1-0-9805645f856d@aspeedtech.com>
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
X-Authority-Analysis: v=2.4 cv=Vtm2kO2n c=1 sm=1 tr=0 ts=6aec48a9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=voHqOY2aTaljLMbC2lEA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX7EU5kk8MGky0
 vaFExCoxapMX9arBv7Vb2S9yEMpSlJG1AXuMnFWeUeWAfPv4eHeJHHNobIOzdl/Qu4qJ+E4+fy3
 gue6D4urAHHYfSX5eIvke8BPXttLFjw=
X-Proofpoint-ORIG-GUID: lNsTJdoi0DErCpAD9Qv6SbCNoua-sLqP
X-Proofpoint-GUID: lNsTJdoi0DErCpAD9Qv6SbCNoua-sLqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX1goJzqky39US
 aTfcKj2Nbgs/AMFLi0V1xFnOl3W1gWb2qrJT0iaU/yT7FclAShwJ318Dd6A1isRiMLStzpzOV94
 EBuUOTTZdwI4T9sHqjtEyX7W61npt5Rm9KTOUKTZpTi4Rv61ZqafY4G1pGTRGzxn5y45TB4/w8M
 nnIxA9jcxEeTq4MwKlsIu2PVRZE4gIqV7VjAe250CJyu1MBrjmKS5akkH8jNI7moY3dMLRMLX8d
 V2LIbZcD4lkgieU6iWU3AV6gvsRkrSGVPqLIJqiPASSuJcK+9xjW0m2tgqYV49+gAeABa77zpF8
 f/U9BgTJA98ixTvrPKtLf/cvQeXcaQRM5LF8Kv88rwwb335xre96PadsI9TNY8eYSXXyBNL98+F
 t4iFjyREkJEY2dGuiAhWu3xA7Jv+Rma/w9CrbVQeG1z4RQaVBE9Umbfw3AL7opDITSCUjlboMUL
 rPRoD5Of9/QgwxAnuCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050036


On Wed, 04 Nov 2026 11:58:34 +0800, Billy Tsai wrote:
> The Aspeed GPIO interrupt status bits are write-1-to-clear on every
> generation, but the driver updates them with read-modify-write helpers
> that write a pending status bit back as 1. Each write therefore clears
> interrupts that have not been handled yet.
> 
> Patch 1 fixes G4 (AST2400/AST2500/AST2600), where the status register
> covers a 32-line bank. Acking one line clears every interrupt pending
> in the bank, and an edge that latches after the handler has read the
> status register is lost. This was observed on an AST2600 BMC with two
> lines of the same bank toggling together at host power-off.
> 
> [...]

Applied, thanks!

[1/2] gpio: aspeed: Clear only the acked line's G4 interrupt status
      https://git.kernel.org/brgl/c/5d362564bd2982def7e80d7f1e756a97440c7adb
[2/2] gpio: aspeed: Preserve the pending G7 interrupt status on control writes
      https://git.kernel.org/brgl/c/18cc1d1ad94df8a6760fff2617d3d6923550cba0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

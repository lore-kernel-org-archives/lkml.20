Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904094;
	b=j6a2BXZKaF1PGM6//g2iO/jlQlWP2JHH455PPoZgW++AJA2wcBLWOWIWtCuAMLUiLcSo
	 mpwpidiDrGja7pOuoAt15mB4oKpDlFbOruVcT0tXFOzzvkKsszoyv+ld5fFoxQztbWjFo
	 +t4/zxjPe/V5IDchpNu7RfWUh2uWDRHQVJyxNGMF2otns4KttXat5wA+TH5a9gSEUtcX5
	 ek05OMsPmyQnh6XLlVQhpEb68A8dhWQ0wwuz6gfx9vF6FQDNreoH92/3syaYCsUg73BtX
	 4uugvobufjPVa63HQkSqvW/YrsbSRizczHs8gIioZD+uHbEa5AXke0yW30WUeFH0TkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VZAKVQ9Wk/3PRWBaBX60YqHirCfqcsw8oH1gOKjzlRc=;
	b=yrUwkaSctv9e1tFcIqaLAuTRcKjhoYJCG2GNSCuTAUTPJDLpOXcvEwm9wNkHB4OYVyNH
	 EE3FMPquZ2vtFRSkptQOsG3Q3JvC3RGpc86Chllcc+yRx1qcTanP0JVpB4PWxWq+7G4wh
	 VQnm0cSHOgtZz8NQdHrRPXpyHkJ3PcCuPFU72fxD9RJtJlE9iOeuskngDQGcj6+jFsN6A
	 7V1jGcREgzoEGnr/1E8kRctHL0CLs6G5k8bBfW4QpQHlTkmgW/I13WgcU/qjKr/520sFC
	 8IPdbYtj9PMiMTKLJXF2/cXq/KPE/u+taKmYMOi6EXTl1SS+DeUDlHdZTAPanFPSfFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lY8u1rIu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE8BvPUZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2601460A262D
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2601460A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lY8u1rIu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FE8BvPUZ
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6LgTl3980592
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZAKVQ9Wk/3PRWBaBX60YqHirCfqcsw8oH1gOKjzlRc=; b=lY8u1rIuFDh9Qc3o
	G+xSp1V8wA3nByNZ1k6tyv2kz2nD8XND6JamyN7gIEKw5mzpYxQLmf4eNfr7n+sA
	NUKbd1XO7mEAbbqgNu3ShKRar//+Z3Dnk3iWRp6mLffgCfmhYNKLSFdYvsWe1FG1
	qB5trr5C4W8N46O+vKqkSGjpUlSYl+tYTF4jjZfCPSNfrER3f7QJI7xFJx8/QRSv
	APW92JALwbOHcuXIAxPKU6+wz1KCvuBr49A7zlIgYTUqn0cKLVda4XN1Eh/gp23n
	i/3SZHPYKhQhokvUAMx6GC34V8AaUVsh+FauPEGjNIi2gsocx5HbkTs0P/xvE4Tx
	+5qMbw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hkd0f0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:28:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso584894485a.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794904091; x=1795508891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VZAKVQ9Wk/3PRWBaBX60YqHirCfqcsw8oH1gOKjzlRc=;
        b=FE8BvPUZ1lntBS8FUpe1yu4RrrlBzlmCboRJYvqkvKQMEXJQr/ydR30WMwXn3LYYGY
         bUgtcBrwWU9BaLxOsrfdilQ0y81J3nFyHYx26VgH5ETdZnFq3FrLAD8k5jZActgaIZDc
         nNySXKYUqq7FbJudjMZGnkb/LZaVCnzWglezmJYaeyB6E3kJqpkjGatgNCHl7/JUl42k
         BrNB4A1MU5xx4HTV/LHT8zR/4xxZrz7QRPMoRBBrEHDex1hn0tOPIreBJSIhRtH5tn4j
         oVopHz+bpU0lqVmFc227r1vk+vtezNmtqPO/4DHsfsg6DjjAUvPsjJSHly91c9Al2qDJ
         3e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904091; x=1795508891;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZAKVQ9Wk/3PRWBaBX60YqHirCfqcsw8oH1gOKjzlRc=;
        b=ZvquXQTo22rB+ZXv0cKtYld3p6gr6aAsB1olvRAUw/iLd5rd75KPdGLXzWC5f04l39
         dm6qoNPDYJNqss3mQPHPCplnJu9SXRKjgaRmtZKd5FOFPwHT855r9/tf2kipIY33wyc3
         wahrs+p5ltZPYn8ESCmbbyq/g925ifqz6sE78GGCkeSWQPTxq466TZFSQ0qG2CTK4vIT
         etlXGQBJ0laszaXIR4s/6OTipfDmXhbqCjdBafFgSrKBPBuW2r6vesywWqXZFiUSnn7t
         giYBor9wj1tHdFTrpZcxt0FsPRWqBxKezTj9Q1+JwI50K+xYnOQ5lM1W4H+qlGTsjhzp
         jcsg==
X-Forwarded-Encrypted: i=1; AL+hErGGEUltFLOLsTSCtVdUCEJhV4bw/6Qzd/wn5Q99bgFSuWN3JSWBpyRQji+4SNQW9vkX7XQvpwEEtezEJc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z95nnCKIsSqkrdTI8a+xUzl/HHrid3cbyP09SDeGV8WR89MF3Rs
	zZqM3l9yTBkpFPur7mtNENcOCbpPbD8pULTk3fmG+k/wGU28OAArptVd6zkQrHpTV1rakjl8D/c
	L433mZpnRIwTYNqW1pPfwEP5XnfTRO1XtgXW3q78hgjiYlYNPkD+/Epjyc63BweGj2iUCuDc9NJ
	ORgQ==
X-Gm-Gg: AYBFou15MfasGqC5MrwyoiGX2QAf/YcWen6rJdrIw4rtYWnjXdHGjrA0hOwxWZLU6ur
	UGlmbDtA6mso5O5zn9e1hjpXjwdhPDpWTnpve3xpMkmjH5WJ51trgnnWPJQNTkhw6swQ8Yeq3PB
	NzmjelC/gRMmG7QD+AikcV/x+42NMZtazssEHzFNLUSo74eS/BYWkDLCbQ76wGB39Z/4QnWYsdd
	ycqW5kmwfPZeECGH7nxHwmCl4BLho1qfEd3FwP2/A6VZ5FuPoWrwJdH3SM8lF/SoaRMBswSx/3t
	XXbGB1vC/dVnmcmwJsZK7oDVDOu2C8SlUEbftVRsLlh1eVrFbpbOQxt/ajd7xVRC/g6+2K601cb
	fTdoN2N0So9McCf+Z6ijDA3fG+nHBz7FTfLAWiAVjVZ6Kd7DuN9Fuyn5D1JOETp6biT/GrlTwHU
	k=
X-Received: by 2002:a05:620a:690e:b0:949:6d95:f63a with SMTP id af79cd13be357-9496d95ffb1mr1337953285a.78.1794904091247;
        Tue, 17 Nov 2026 00:28:11 -0800 (PST)
X-Received: by 2002:a05:620a:690e:b0:949:6d95:f63a with SMTP id af79cd13be357-9496d95ffb1mr1337949785a.78.1794904090783;
        Tue, 17 Nov 2026 00:28:10 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a2ea918d24sm5393966f8f.54.2026.11.17.00.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Lianjie Wang <lian@is.s.u-tokyo.ac.jp>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Takahiro Shinagawa <shina@is.s.u-tokyo.ac.jp>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] gpio: virtio: bound the line names block by its configured size
Date: Tue, 17 Nov 2026 09:28:08 +0100
Message-ID: <179490408585.15375.11644754395954645362.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
References: <20261104195632.1702765-1-lian@is.s.u-tokyo.ac.jp>
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
X-Authority-Analysis: v=2.4 cv=eqFKXYpX c=1 sm=1 tr=0 ts=6afc101b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=cV_xUt8ozR8xq277GC0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfX9P9+As119boe
 3gk0oRXXCv5BQjb7ZXahp/n9asQO+8O4rDoDMNzDU7VaV/unFvjDldGwVO+ByqA1vCKcG6NDTht
 S34+Y+wIFl09DGPehI3M5v+yXRyKqNQ=
X-Proofpoint-GUID: ZZ2p6tmz3feNziAUYH8GFRAY8MINl5_g
X-Proofpoint-ORIG-GUID: ZZ2p6tmz3feNziAUYH8GFRAY8MINl5_g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMyBTYWx0ZWRfXxCdV+dISaTSo
 uXUlGlu+AexX6hE+01m2IP+o96Lxrykn9rBORW8nk5j4ybxb5cwr7I3riKjV3prU6Ig1snzg9St
 5r3KwnOku9hh9ufw7heKM+S2tCGMFIPmksOfqCCCrJvioeJHWNpfhrhHRGvhereFNRhUS046vuW
 kZNrNL9ob9ktJoEaiyYezbCiXQ4py5EhDh3Tmt+xAMLpnTEyERyjkl4BcLCGsGIgwyc5t27L/tm
 q7AIkVrQmMNLDGPote6Utrq6tQhxomJLkHttF9H1h9iDVw4KYJQnWntPmoKXlLFTHBuut2Y1Lqk
 BMGq321c3LKTnGC7YKPdGYlf5uMuhw74LT+5xiQrRbm9LrBZ/02EmIVq2yoB9EhHjNqriWGYVUB
 sdoY6uPOT0EIyWP85wblIeA6iFdFySYUp9GwPrI68UHijNSOChX5UBs1uVcFw3H+WMFHLPGG713
 tCpY9Ax7IfTvQm9fhBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170033


On Thu, 05 Nov 2026 04:56:31 +0900, Lianjie Wang wrote:
> virtio_gpio_get_names() walks the line names that the device returns in
> a block of gpio_names_size bytes, which the driver ends with a NUL, and
> checks each name only after stepping past it. If the block holds fewer
> than ngpio names, the walk reaches the end of the block after the last
> name, and the next iteration starts strlen() at the byte after the
> allocation. With a block that holds one name for four lines, KASAN
> reports:
> 
> [...]

Applied, thanks!

[1/2] gpio: virtio: bound the line names block by its configured size
      https://git.kernel.org/brgl/c/74aee8e06277df39ec10ed043bae0ed5b7a83864
[2/2] gpio: virtio: compute the line names size in a size_t
      https://git.kernel.org/brgl/c/9e3032dc4d92e6214ae687b4c474de9270ce74a2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

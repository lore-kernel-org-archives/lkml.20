Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806880;
	b=gmkQ9hf1yhUsFUoGwAugqEvmYC07it2VCOnXPX8IlT/f79o0i0GdJe+BYyxw6ufOaS8V
	 1j/SjTr+TlPPwppJGbKu8xgZZ+ldHDSyk6GrrI/DnfxpW5htpc+GCcKIHD9Moep8IZQHH
	 BwqtdSDAs0n0HaxLXoL1YMLJAx7bXgC0ovb9KZfhPUrfb+/ZdQCn6SOPw/YXOw9We4OBf
	 mqnQIvdznR79YLOZuYxLfBNPtE5ML8lPHi5EF8gB8kWGDQUjK1IVVehoufIYUzqFMG2wS
	 UKGkHnVgszl8Q0ua6HqxVKAWoH3uf4ANY4TMIQtB7pxhnhNSGdJ2chiHcM62zVI5HlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
	b=VCnv8ywYMXFmOR+2JxUgleUqIsa1M6iL+gBwa4NweM3OUrEUxiM3WA8qv/hrkniSmVSD
	 /9fwTQqVO4OFap07G6kOeuNpraPa+cKlioci/QBDhzb++VNsawWAPZUBbKTMDxsEcH8wr
	 QDm3dMwADnBUF3SBOXeGcza6IZ2qepeV0e3TxbBBdAcaDtdzcX1ztxTJUETWkzfD2iMWk
	 Mcv6n80n5uGgWgrye52OeRQ4/qvfxQHNp1ACl8nhqfrreUDHaJX8y0HsiUWXXXJVJvG7P
	 1Dy4HkGmrZxcA5IyP7WqktjfX9hWBxQ2/FK3d2BH/r3n24/o97KyARWhuZiMV8u8O4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFC4606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFC4606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hnu0e8Ca;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gRQh3tXW
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LVAf1585499
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+weSNdgV6tyUTxoHk6wCxY
	0+uFMGSPWr+uTDp0Ozmq0=; b=Hnu0e8CaUWlDnfFFRPHUq5eArNphCs1EIWdpQu
	9Xq3HonxFTlBt8kgDrV1w3cPlOpIHUC9/ehVqHV4r/yKKcuP5MVPesE2XAlZtOwV
	WZlOgTvtisKbrAqvYhEkBXt1yCKFs1vb/gjPy8hxOazAv7YUud4Q4v4NHgg5VM5u
	aiYQ2K/ZcLPjh8OcmW+U/CciXkJ7w7R+1JBhP1e9G7dtnfoA3K8oxNEkT0BWYcIW
	SYc/NOirU651yYiGlGchxcF45D9q3zPTpALOqtcUANfDZfNinZlYbYfNgkpgNiBK
	yAmI6m06HV5unUFj7MPiY/c/0nOT4sz7gD1KpgI2UUun4KeQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhdvu8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb86c39250so1513156a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806878; x=1795411678; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=gRQh3tXWDi19GaaY3LckQIvctxQqriqHApjB5+26o7s/OEBIYUkCAoRF5HRDCGR0te
         iYMFa1xg/Bq1VS6M3Sx8xPOrE8EmoKc1Dj+vDxdKJK62LIsMuEp7tUs0OhpIpAIVqA6K
         ly6JxBZ0VYCoOqCvYMCmc/6CHlm6LTeczDwjPz26yoIpyOEASXnRncJGvhOeX3Larwx3
         BJB/CNsszg0EehCB9huTGkhJ5MY6AjGyHpqIwhQsV6BL80RwlbD4GdPPd8+6nNkTpk3D
         gd877+prVfX2oAUPqd6Agf/hlxkL9xh4+y0aoGAkqmTzHp9mt1G9Y/WYYiG+6LByQXyx
         CYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806878; x=1795411678;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+weSNdgV6tyUTxoHk6wCxY0+uFMGSPWr+uTDp0Ozmq0=;
        b=al0wsyVN4rbD+f+N77QO/S4PKEbfgJ0+7Ik9sEliCjpiDaH6/1RSZi2V+Nn9U07KVD
         607lEvVbHaIdm5pUnZircUQmTJhDqRf11VVS+bTO/UttPSuYUbu64+NEzhW/PJo84jpX
         jCK7dP4EEXz2QMGjJfheMYHXy8u98aa/N/e/pKJcQ5EIz37DaNTAhTjC3jkMHct7L7W/
         rN99vK7S+J2+7/RfrGsx8DpyihylLeQhq40vA79NRYP5uRYnIEgbrauflChsBxoU1e7v
         HnWolarbqDyrwpKvQSAoaWNuFEd6CbsAHr1c4Oy7YbQBB0btdAFymTTyUO744du40omq
         y6jw==
X-Forwarded-Encrypted: i=1; AL+hErEyTeRTEuDdy8ES6W8BaSQFLXAA7BMgCtADfg7wfHqGCglZ0QFBA1H5ov0vp3PwagBJPl0XCb27cUTZN5c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KnXJZ+c12VaNisefK1tF6HinvKrF/ur2RWKSHirQnd4vONHNK
	gXsQggAKLzVcS0LlW159zMb15YKDwG3JYKZjFJCdpOmF91wk5gtKYm0za0pjq1e73hb9SqH767q
	6iAlRsZcEv1hREJ6g4xH3Og/CfYY4jZCvcuYh3MiGV1xlCgPm7QjPnrTmLLMfeXmE/n4=
X-Gm-Gg: AYBFou2hxLKAcpHoaFzkImt4ksWoZfh43mDrZwlb3FxyUnuPM5d6qiNjYDsVxUeZWLc
	XHelG1BeOBmSwukfxjkaRYvGsYV+wA7HTJz0kMseDU6RlGf+s9VDnc/tI45dce9wM6h2WQVdndt
	GJ/uhymgk/5xvI4r+8gGqATFeRqiO8hahGcmTvqJpy8XNxCTyKXqmjtlKGlrzbUQQ5pEq3VvzgL
	1kqmZE1LK9twC5U9DUanlezoBNFAnS24o/rsn+xosGNZ9Y+dybBxc9uE7JSZ6aSiOFcDY1cX67T
	k6CILdDHnkvmiu/KcLTgVOcTKPuzrO0AiDfoa8QXgefvksH/8EGu00nHVMiHdkPeD6KiEXgQ6nl
	Fo2JXPInIafNwzi8/RR8bsBdLIrthxwvHrhGR/N4RCPSB817rvasHt3OB35aObagwX3FQrfIqKw
	==
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023275ad.68.1794806878433;
        Sun, 15 Nov 2026 21:27:58 -0800 (PST)
X-Received: by 2002:a17:903:41ce:b0:2dd:c100:7cc8 with SMTP id d9443c01a7336-2ee0dde7798mr94023115ad.68.1794806877971;
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:27:57 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
Date: Mon, 16 Nov 2026 10:57:43 +0530
Message-Id: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE+U+moC/x3M3QpAQBCG4VvRHNvyIcmtSFprMPltp1By7zaHz
 8H7PqTshZWq6CHPp6jsWwDiiNxkt5GN9MGUJmkBoDDHtbZu2d2srU4ye2uQJSU6IEfmKHSH50H
 u/1k37/sBvwa3N2MAAAA=
X-Change-ID: 20261116-pwm_clocks_shikra-13081b11413c
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afa945f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=P8prvrSLuabxu7ghDDQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfXx+Os3iYyFCt0
 A7OIZcCz5w1N3AV++89j1NjZ+cZ8hkRN3Q2GaK5it94/AuDvDEd58ogqpQu/MlpC8IJVsI4hi0o
 9fPOo3GmySGr9xtf+RQmNpt8vFVBl6o=
X-Proofpoint-ORIG-GUID: zVZ5r7sTEqXK04p2QeYJjLJo8fPuG5j-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX/JX+ctuEK9ie
 LYA9YG+FuM0VzpSBICVTwU3dvQFiLs8dxYqI1pmh9O1Sut/twL7appNyg0W5SD4CHoWIgZ+91mP
 HpYBmKAPxkxp0JvnYEr0+91cqKA8Ex3krusgpcQgoed9YknV5JMl6tx6dzZlfQvxfWmBtP6hI1q
 NnHxJcM1XfkHucLVl4UisvPgbEXyupR0DXoSyuyhoL0hqtD202uGVMiC9j8M+Gvn+3FkiTmgwRt
 nZe9Vzj2LvZ5cZzPJSXSL2HjAyv1T4hjrc876N4DlUhxxcci+cQXXtEP9ize+jMsbuELMw6aK68
 V9RDxg7hUlluLCg7sql9wP0+fm+7KvZOoXZ5+JsXGZPBmUMxnrkiqwRkEPoM/etPYv4FtZ7ZyXr
 VM48EObdVx9aKk8fy889EeVCJu9crCC4fkXeCWgT/9EtvZiKCb0LsL9GYUzsQN4hqtulKDIFwKs
 V9LtJ9IgUmNIf0hZ1hA==
X-Proofpoint-GUID: zVZ5r7sTEqXK04p2QeYJjLJo8fPuG5j-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

The PWM controller on Qualcomm Shikra SoCs is fed by the GCC PWM XO512
clock, which derives its rate from a programmable divider sitting
between the TCXO and the PWM core output. Model that divider as a
dedicated source clock so the full TCXO -> divider -> PWM output path
is described and the PWM core rate can be configured at runtime.

Add the clock-ID binding and the gcc-shikra divider clock implementing
the source, with the existing PWM output branch reparented onto it.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (2):
      dt-bindings: clock: qcom: add Shikra PWM XO512 source clock
      clk: qcom: gcc-shikra: add PWM XO512 source clock

 drivers/clk/qcom/gcc-shikra.c               | 21 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,shikra-gcc.h |  1 +
 2 files changed, 22 insertions(+)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261116-pwm_clocks_shikra-13081b11413c

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


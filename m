Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794811193;
	b=RqtR3iUtm4k9nDXyUO7wkm0Nlm31U4v5kLhW7ZRnpEFihYfuUch4faqbGvGXEifCZmF4
	 3JgF5rYm2lvhJtR6ncPdEz1ScFWSUcqDV/Af3ygtwiSd5CRa3+YBOLHBkHRYguAkJkFkq
	 iiN8SATaCrUqFR7t/n3r/bAFda72//D6wvKiazXfeZosFBsZsYETnBunIkX95rSCIPBIH
	 dHezbvfKqcZ7+JXfG/CjCS/gvfWVd25CY6UF9HZhhfMCglC/AtaQoFuU2td20xaQPp9ok
	 rPwfNPybBGw13fSmKLSXnTMNquaN0pGiFOnSGZzhZkKxPVdZK8m/WswHCCZ+HjSJkYw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811193;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
	b=qOLEQnoGfRoDhdnm3ikx9G5TPXsG6EWMG4EnVyNTmHmVLVaTI5IG4VVxpSiulx/ytIXM
	 LgCfkZ4vkf/SxSuAoL9b6ufA1mTMZXHZ1GgkRdDfOWgdR3hxlyC7ci/D0sqv+ey3CriLC
	 1VP1xN1vaSr0QSdhIf1IYPQNuUL5N60zF3/RjhahR2hANS9FcBT/4Lnk45sbkejwLwzpG
	 uvhZdcbDSx/5of83yuMAIrvYpySsGkG54sPpqqKtrvV8Drzw0OHvpb1zVyX0t0I/qks9o
	 j+x4imtsYoRNcYthOXNgegx9MvIZFIi/wrApnP6nQJ09HZ+1ppq6AMosuiOr6OHNoFQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60C9606A32F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D60C9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KccI8a23;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X91ZcNno
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5MlnX2233705
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uwe1KYw1P29e1DCVb9MjyF+M
	XhbVXhW/CrTXu68G5dk=; b=KccI8a23szTMbu2QuoBOEIyxSw8xRhiQsWZt+YWM
	gJr6Q+7cDA0uZRq301gg1OcPsNktR35+u+olq64jhgCdcbhDhkUIM5q/1w3HSSzt
	mPN0wgGtpP7EvRPwgnpjAOcchvltQ5N9la0u+G4CBF6cb1eyAHkRX5gh5sZ2KbnC
	QUH75P9/8S+AXIv31PqwTDyQGYEVvAcasvcj68WpyMItV+kWSXiciVxGLg9h/ncE
	tat7c/WacjwGk+qYkFb+wyi+u3m/+q7o9V1yiaYpvYrhIsByvJtNKW1VvHe7hqic
	ViY+VwHU8wXZao42aj7krdea4owxpl6DVTuvXhZFMkn5hg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8w2ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:39:51 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d304016194so2766407137.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:39:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794811188; cv=none;
        d=google.com; s=arc-20260327;
        b=IsyzP2QMPutOLJnHpRnIeF2UZNinrprEi64sZJkhyYAydjTzBupdpGvDqil+eHDSSt
         fmKnAiouKMQdjawvZLijj57KvVdVckWW66REOTrYOKLsG76gyY+0CtyiAwis9Aw2wR3S
         tyA9eCQAO+ZAEN5CL7fvQmUN4B8Gstj1757GRBQDFwEkrQpHN0+IcJrWfCMnjAbH0bhM
         ikSABK0p1pIAn/DEELLKab+UcPzq7hfS8UP7W98smU0gW586mmng7dDbtOmwTiQYcmfs
         YM8pjmBAkJH3qIWuYvvD9gHabpZE0HLewMbpc8zE39oHPm1+eUhivGqb3yBMayXm7Rjh
         RH/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        fh=Nxk54shKPkBoxChi8LXOM8Rsb0czLCMOejM4uCLI/bg=;
        b=M9Xbm9J9aYyYd3MHzkfdzW5SddjQ/UCzmWPXOT85RyU9umlKUYvKTFlZhJDva78nMm
         w8dhGI3i3TkeMStU2lC56TNqLon8uqz3FQuYI3CaklQ7tosOxn5c2jeDlwItbWRyBsAr
         NOqhH2EYFMij6dm2JSNr3oRjo/Qh62vZhX2siQNNddftRTilfVr+Q9ERCeNO8e3z5lAr
         w0CsV6OwMatboJseds2unOvg5V/AfBdzoNvG4P3aVsyvsFCxEl8uOyPpYSvm/Aio7J7B
         RcD4i4P1uqwg/tgOrdCtgtndTmi8lIZgdJbHp7Jgdh2DLLduMpspnlAbQ1CRzlK0xe/x
         Q55w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794811188; x=1795415988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=X91ZcNnoqmYRaR9fw5AcAwuOTqOGF6u/nl4tfg7dMwf3ZOTioiNhtxpCfRSeYxxyXY
         NnqzdlC9fN0gDzml5e3FYrBKura426jYCnkYrtAmiBb7mR9ImRgf5kvi1qcgaYSTsNkn
         Ac3wZ9A1tYBfTj1hOgM03MUlro94ojHr7FeYTXJYlGoaFaaVc3Sz9Obb35VS5y+DWv2S
         O6cG7xuEbwlQt06LD3X+mmcWP9/UVqT/NOiwX8X8futD/Gewr4fIQSDM0Q4BxcbZnBVy
         voE63Rev9JBkIvQ5sANjv9+baXxXj7ggjTZgG/8jfNAdqtYBRY+uv1exOms8JsZ1JW/+
         UL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811188; x=1795415988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Uwe1KYw1P29e1DCVb9MjyF+MXhbVXhW/CrTXu68G5dk=;
        b=OsWXdIu+O79iMB9ccvLe2szVsN1fnuIqsH+bPhjEGpmAO7h8Ot4Za0X5Hau0uEPpbJ
         +ZxkzI6gcuxwc5/upqyRvAr7jBKLnsL1LqclPli7RyFcpzBigXZ/9f4JU1MRksd7zT9Q
         Mrj6K50ADCznBKZNsw0SGHvFEDNsaz+Cxgm4/wqwstX5wbByOoRWU0RDBYWRrjQlhm4D
         XeKDEDFAgi1gYw6mwi8wVZAYy6EWQ8kJzJh4yiHE9SC23chbWpzRH+/c0msBZMHo9cZw
         PvqqNcJ5SEfMHOhrJDGNqPbSEG6J3bKr2iRfjLFhgCiwR/AcufNZ170HUu2W//IcXvLx
         vC8A==
X-Forwarded-Encrypted: i=1; AL+hErFgLhAwUTYds8y6yPgAMfdlKUj+PPnFGFwk6QDug3Dxn8vxp0vxT2gJhrIJ6EUwb+KFdcSyUwKYtEUmMrI=@vger.kernel.org
X-Gm-Message-State: APuU4Z87MxRm3gAZxqTgi9loyENMw38QHOro8grWE/8B1Mq5SV27PFzc
	vMqwZY7PQ2vbqrpVHg8uXnjuQzVtdTftQ7KlJ2PMKN4C0Bb2P/9/G9VAZAOK40EFAM1EV4ivbuJ
	4OyfU7Ozv5GbhPVtm6BxAEVU15CY+Z7ufgBe+cka0J1SD6JWaW+xTEJds547IrA43EDIEEiFNWs
	mZlYmsoZULg8yEZIe3sccbD4T0SgnmFHNyHzsqhglUNg==
X-Gm-Gg: AYBFou2nmNgDiwXUPQTPrh3FD9tWODY1YZqmHA9czvy1VhdWWPf9A1gzr3aldMW8Zrd
	KHCFkTpaH7rFQuuSTqjJAlxsq4VipvtR3YhD+DoGcP0XiUOUk1/3cNdmFrKQTNnVWc/lMrgu8Qc
	xCw2G3hZq5+rG30DVfS6k1IAfXkclK3ZtoraG7T0nuiw2Ja1lhNnmcbllRp+qRTe0vt2PVX5NuR
	3Z9Ql/v2NaAOEkqEA==
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id ada2fe7eead31-7d64d76c2d5mr3162564137.18.1794811188005;
        Sun, 15 Nov 2026 22:39:48 -0800 (PST)
X-Received: by 2002:a05:6102:c86:b0:7cc:2fd1:7122 with SMTP id
 ada2fe7eead31-7d64d76c2d5mr3162538137.18.1794811187555; Sun, 15 Nov 2026
 22:39:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
 <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org> <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
In-Reply-To: <ea2dea8f-e696-4e86-be9f-248cb6ec86b9@linaro.org>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:39:36 +0800
X-Gm-Features: Aa3M54oy1Hdi3jJI0vYcKhvRYWOd_gLd_nvmiZaADn1RpRApqiz9QprVKg54Urc
Message-ID: <CACbMrhqnjEhFzu+Y4OUoNVv-XhZce=cjsuFnUJNQD6FMN_ikRA@mail.gmail.com>
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID 980
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afaa537 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=f4uaJoA6WFbKVHIvzf4A:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfX5PImrRfg0Knc
 i1V5u9QjkZmDI7GyefM5eS/VlVPQQ94vuEbMNZL8OD6xAJxQqB56Vkvn2ZMC7JdYc6g1MacShzb
 ocF4o+Bwixu6EXZOv5h0lfeY2O9OqY0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNiBTYWx0ZWRfX/XJw+PAFp4PE
 B+RI2n6mHjvHru0dMbWgOk9Bq4yyXsLKzw7+Szc/ij52DhW+2qAryPU2nYvt0oI94RElDa1I+aZ
 /f34VSkBNws7GBF/P/1L26roMT9d8dK4APQ6/hBCwwk8zEHum2xzH4Fl/4Stz1k+eh8iBeyRhXz
 YcvluaNE+HdnVd6fbSxV84NiysIL2gmLLxn1riKgG3THnVVLgqD5u4DvJhAXf7vK5jyYZvno/VJ
 vCUJldLshILRE7aVKJp2wEIFwA5F8/3lpeNgzGj3e+jqp1MlxPWi2fLcCSlKpzexa4DMuiogbhm
 0b1U79VH0lCeF9Hwn+UN3oKC7Z8guQQrEEJ19uRYIGyeN6+NB5gMrDch77PPMGRPg1e1BRJ0XuB
 nYkWaH4Rky6VLqI1XAFFsub5GoFsNXmlBK+kNINEYMAvdgaDlLSK5q3mQEuKn8ClxFUkh2Ct8am
 EqhWmp4zsXCacFEum0A==
X-Proofpoint-ORIG-GUID: 66dEMDx7w1dXYOUgmjJg6PIKTvkE25f7
X-Proofpoint-GUID: 66dEMDx7w1dXYOUgmjJg6PIKTvkE25f7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160026

On 11/15/2026 8:16 PM, Bryan O'Donoghue wrote:
> On 15/11/2026 12:14, Bryan O'Donoghue wrote:
>> On 14/11/2026 11:29, Wenmeng Liu wrote:
>>> +            for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
>>> +                __csid_addr_update(csid, i);
>>> +                __csid_reg_update(csid, i);
>>> +            }
>>
>> Why does this run twice for the same index ?
>>
>> ---
>> bod
>
> "run CAMSS_INIT_BUF_COUNT" for the same index ?
>
> You don't increment a buffer index. How can this be logical ?
>
> ---
> bod
Hi Bryan, CAMSS_INIT_BUF_COUNT is used in vfe_enable_output_v2() to
queue buffer addresses into the AUP FIFO.

Based on the hardware documentation and our local testing, each AUP FIFO
write needs a corresponding address update to take effect. Therefore, we
issue __csid_addr_update() twice for the same port.

You're right about __csid_reg_update(). It only needs to be called once
after the loop. Will fix that in the next revision.

---
Best regards,
Hangxiang

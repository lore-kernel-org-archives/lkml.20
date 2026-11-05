Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885474;
	b=cHpzCisxLq3d6IUD8k7A2jICoUVOVBT9B7uFF2uWSZ8kIeoMxe1fNMBS+0pngd9U2TQE
	 AhsSUjml5QM9fi7koCfabyOL8qKViFb0oOdEQUAf5aH+CHtwEc9x4mNzVBp5BSufQg5XF
	 9HzUxh8maO8ipxv69a6uXxdb+ypA8eVgetDHLcIsu4CQQbbSSfKTRKMXZExMPAhHabvrf
	 XHhdmkrwIi7v35bHB4fcMHww4ntW78Amnp+BDMWf9qz298hhaclRH4ef5AA5m5FlLQGDU
	 6E2lFUjJ3W4N+cfyjGXlj9ajhEay8elqxglwVvr7TxrJsBwu1HfNyRJjxGaV6R0JWug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QvBNxBniZKlP5d2kcfp20RqdHGp6PKnHt5QodKeOHlk=;
	b=2l3mdIn+MyVFMYKHEPE+LzWYLQ54KU3gdnOHqbMz6V3/Txvrkq2dPR1jpCXGnAPuk5nZ
	 RWQ28/5IpNYE5OFrSmLX+IIR6NWc9phyjyKzldqSd6Eh5iOhRusqhaOA8LK6N0P3GFQsS
	 OnkbzIAkOrMJ9K7RHRSUby6MZTq0o5nHtFeBloo+kJlAnHzo9rHfKsf84Q0EnuSI7mEYO
	 dbb7s04FOVg7ik/JW5jdAUGUxyZ4U+sa+CKEI3w4UaQiBH8X30fvNpFvVPgQfJGnXuucX
	 Pad8B16YZIU+/sSliJbGGZTB+WtUdtw+pIG89+/eo9/Q+UOL++DFOAjCi+xVJpc9fdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3zlkwE8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3kGP1JQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A6C606A337
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A6C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3zlkwE8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3kGP1JQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5A1ZGg1416602
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QvBNxBniZKlP5d2kcfp20R
	qdHGp6PKnHt5QodKeOHlk=; b=F3zlkwE8Pd2JS4uqxhQdOTYdHPLMVL/TwG4YIe
	M1II3yxwuDBOay9mC3/SIND9L79nn0fO5b1oeO6VZLM2SNQwiVybSRmHLfcndmCD
	qsqZ1+C6kBEc9UXBrm0IkXkR5zfgnJZaMh3D7Ol2S0spayrUy5Akz4ek9vphwmaR
	OaakvvjZlQqQCINImxB8wRDZCISU2KiGB5JnHufo+IFaWGEQq8huNH0+a2rdiut5
	6xRXn2BKa3BFkZhMeBF9mhXk4VhSL4zqxv41Hr1IkhWQYznNvFNAAbTTNylAURQz
	Z168LQvo5ZFHFqdigDnNVUDBnirGhvl7SAoRR9D8pIM3eGjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqpd0usf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:31:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so394222185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793885471; x=1794490271; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QvBNxBniZKlP5d2kcfp20RqdHGp6PKnHt5QodKeOHlk=;
        b=T3kGP1JQnJ6poqn+uHrhvER9Uztd+EhZ861VDI8tZLcsklh9EqvmFkvd0EH2cCylQp
         7O1RJZ+FxTXexwndgIs6rFeBGBwqEDq+CApE5JEyFSwM35CJYPOS731nJ6uJKB2uyswN
         t7zZU7J8ucs9afGV72wLm8uIF9850BbbD8JR+HRTesyHpMJ7XnGKWMJHOPVd+MM1+cMH
         /HEWLOeCH/g5n+nncCOHfTv5Y2GzwHLytBKO8PfgYB0kNGJAnpbbWwKlx9pIbAl0n6KE
         E0CuItK7cpJaW8LefdSF7W4zD+fpmlLC8DbGNN+Jp0SXDi4Q5lIXRblSw7X6Eo6NhGYh
         AuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793885471; x=1794490271;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QvBNxBniZKlP5d2kcfp20RqdHGp6PKnHt5QodKeOHlk=;
        b=U2DOg9DWQuMhWiLdkV4WKMMeewPA7bS18FAeiFZ5/LFH4rhiaXwaGAA5/DKcfE0KOe
         9HvH8pTRPJaar6s/7lnyjnADqpbvNhsYpDZs1CfcHANNWrKfmTlJ1Whrn96K84DemgYE
         nuYLXR9kDnP/KwedFg6yyiQvA/GrUGUSRMV141Kjei+j1/dEhWPzjiw7unf8V7oOvOw3
         hpmMfLNgKObpvoN9DxwyoNgaBKTfLjRxjBD2HILjoIOftHrctUl60Ua7lvO9DxuOPiUN
         NU9Vu3QEjS7AQ/u8TQPYfEd/Ggddgwz2I5JQ+cDDOAEBgNxSbC8dVZ5LlpEqqUdXgY5L
         unig==
X-Forwarded-Encrypted: i=1; AKwUvBwaHTJo88CHtbDN8oPIMnaDJBNYhh/LRWn0UZpSlqrQnBHDlMvlMgG3rEaGGkc9xHx09XGUOZQVRuEqdf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/zp1QMu1/V6hf/RkCeZ3Fych3NS3Z8caEaAXrSUvbokazXqmXZ
	OZmxvRDqUwlEwiMrTCMdGlD44Z2/QvyesKWKGZud+IkQQ0LuVyXL8RncKifq7dj6Iafc51+0bdU
	STYcbBPRYB6nTp8L5WfUoXCSlfseQF5ZAHGs6YU/POFw15esysft8GRWMFgKC1O6pvd3m9VwFfn
	4=
X-Gm-Gg: AYBFou28Uj9aKpPkETCezFpichOS9CArH/0uOQ2PcS4zjdK8ewU95IhsOagfyQUGxAA
	wYsjoWbx+imkddPeV0DHk+U3mu2hRDQN1pIww/JEUF5ziO54qfpeiLWeAcvpfoooM60okw4o6fI
	XZuCIZn+HqLimcDNvj+O45DOV/tMYpny2WPA0aq6oXMXI5277N5OkEQW8idBQmJYAgRpzQDeqUi
	PY4C3BryB/SFuhh0wvvDjUsiCDpoSvg4mawj8gMXgEDOzal3yDW13j6tkKnR/fPHGOe8MS2xWqw
	gbrUH1JGsIgtimVjd4XcWVmPpFOo8EZRCrpWMexNWehZAsy+ZvASxuBCk0LiHDiq4vS9e9ggkhe
	DRQio3vBTn4Wn0JGwhEUjyRoBbzesjmTnJn5mGHxNFGxAqGQZytV4wGayafIgRMlFPuY8pAjldA
	Xpvw==
X-Received: by 2002:a05:620a:45a2:b0:93e:c12c:f131 with SMTP id af79cd13be357-9442180665bmr3079126985a.76.1793885470972;
        Thu, 05 Nov 2026 05:31:10 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:93e:c12c:f131 with SMTP id af79cd13be357-9442180665bmr3079121085a.76.1793885470323;
        Thu, 05 Nov 2026 05:31:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b572505e84sm63292005e9.6.2026.11.05.05.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:31:09 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 14:31:06 +0100
Subject: [PATCH] gpiolib: fix stack out-of-bounds write in
 gpiochip_add_hog()
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
Message-Id: <20261105-gpiolib-hog-stack-corruption-v1-1-a47af9c51965@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABmF7GoC/x3MQQqDMBBA0avIrB1IrIngVcRFTKfJUDFhoiKId
 2/o8i3+v6GQMBUYmxuETi6ctgrdNuCj2wIhv6uhU53VWhkMmdPKC8YUsOzOf9EnkSPvNcT+pRf
 bD+SMsVAXWejD138/zc/zA2ZN+rNuAAAA
X-Change-ID: 20261105-gpiolib-hog-stack-corruption-431b647ea556
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VaSatjKhIucK/x0c2+EFH0QePD6fzX9GOqoaXfy2lXk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq7IUcYHJH1NTLw9y+HpKyiKHCCa9HhnnUrok9C
 T1ttopHudqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauyFHAAKCRAFnS7L/zaE
 w2dJD/wMYP+cetabcmRqmrV1q++gULqSzp7XbH6neqE71XRuDIm0RALCLnjzcABPm3QNmDUJGP+
 wtQ+Ixfr2YRh72IdfDEJ8n4JehLopV208L7cvcD18PYy/oyw89r+W2yzompQ/wp5epxYAyYN7bm
 VbHG2zEM8BVIcudwP0NEnuCE+8YdRoAm+EDs7EpbfQZH+dwCkdKanvTCacff/80yeG/OT1lJfE+
 fLxRGHV4Ko3u5ISzcNBpJbNm0TgR95q5lwrq4RoRzOFDcfd1AC2o5oMKDQtG+lEx93DNRmI5SUy
 wd3DAZ6vQ9zYIlR5pXryfwT0VlH1X2t0uW04jdvwmShAhls1mxOPx0QJ8qOvQu/ZyRYoMHXQbMc
 8ZmCzBqyNm7pW7Aantl4cQeWMyazM1L6YIVVohs9muedW7mDGlRWKSzi7h3xMhncyA2GVKD2OIz
 dXGquSRhEQUxCTPioUQaFtHwCx5YlY1Qi2iN8mwQtJDPdHzyi7nppYIb+liFbK6cMdjLnrgLm0U
 pkSBNgG8Gzcdcj4YgEZKQwpxaUCDdNaMTTbdY1gobD1zh/fyQdIcoJ2KQdoR3GNewmcadOcyKuU
 kYTYYW/xp9ubwUJs7cMRmGHAiMu4fD8XNh3fZ3rPsbYcXEKu0ypD5nSIrSXTNGGq84MQEh8VLgu
 j7Ef7iwfrriVlZA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX5ZnNgPSyVAtI
 JuQn+BW+L4E5WBP2mCtFLnNnJw+Apk6335DRi/ixyd8h71f5NoA3sB6TwmDnt90wdZ3Bjq2aze+
 kdTImQzUqg+7Fm1suvTaAJKtUAKylbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MyBTYWx0ZWRfX4Vb8B0sY0nBw
 vmnQqFMH+BXWNOIOBWxrZeHJkMbz8DftY3KbkKo1Q3Bn7vBE0dkCFT6zDF2MJDMTNonj6XenvvR
 3lFR4e/h04gRn2oYX3vkxZPq4yu9DCiFO/sj/ChWae6we/x04x6ddPEPDfKKxYpqDgfyQz2Nang
 /vT0U5knEYx1uDuQvjHNLlLQR3blMPuwtPgJOyiUrkbi7R9Gaw/XRodT7lRF+yTP6clN7A7c6Ou
 n4m+jpY4/YmM309bUKwm2WIsxFR0AGya8VnojlPmMFnQxwTz/P2p46mEBNz64MBoc51XdhSK33x
 aR76ttFCZIMYIqTUJsDfn5ApwO3/coucr9yuZFQibNXY58L29fSlmFMFycewuJ4PGnt/YzLsH57
 7x2R0v9ITCCaMpROVtZEnSvM+d7lDArKiaJbU8tCcyELJIG1IsyUTIvcueT0LxSvK/Xu22VSmWq
 UOks9tsWdaVUk0S4PsQ==
X-Proofpoint-ORIG-GUID: ui99NtY21jkLGDiGpxtNeKscAYO5N5fv
X-Proofpoint-GUID: ui99NtY21jkLGDiGpxtNeKscAYO5N5fv
X-Authority-Analysis: v=2.4 cv=Y5JtIReN c=1 sm=1 tr=0 ts=6aec8520 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=it0pbt-dyIlpk3O7H5UA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050053

In gpiochip_add_hog(), parsing a device tree with an excessively large
"#gpio-cells" property causes a stack out-of-bounds write when populating
the GPIO specification.

The value read from #gpio-cells is used to copy the values into right
places in struct fwnode_reference_args but that struct's args field is
an array of size NR_FWNODE_REFERENCE_ARGS so a value larger than it will
make the loop write past the end of that array.

Reject #gpio-cells larger than NR_FWNODE_REFERENCE_ARGS.

Cc: stable@vger.kernel.org
Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Closes: https://sashiko.dev/#/bug/linux-fdec1c0e-c6e3-4eb6-8746-d68a3f951374
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f278713a47c2e3d2a6640f387f6d92227..698f86fa14591be484f36999e9b578cb4946917e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -986,6 +986,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	ret = fwnode_property_read_u32(gc_node, "#gpio-cells", &cells);
 	if (ret && is_of_node(fwnode))
 		return ret;
+	if (cells > NR_FWNODE_REFERENCE_ARGS)
+		return -EINVAL;
 	if (argc % cells)
 		return -EINVAL;
 

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-gpiolib-hog-stack-corruption-431b647ea556

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>


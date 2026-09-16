Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562BA37C0F5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789516821; cv=none; b=aGoq4t1h5hXVQ2NRZtbAuT17VGlFcruykVgmZTr/Yaiqfb2KIATRxGdX5ZyIZWO8nbFLTtcbSOdGmsk78IGW8PRnC3l0ZuS/DFKM0X3J1bUE063KIYjDQjww8JaUq4qKJTkbZzu44rH/YS+INs+z3cfnTuBWkqmb+e6kpQ4v924=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789516821; c=relaxed/simple;
	bh=26C+ToikrdDEucP2YwD27WA7DtsKW71JwRXumcGVaH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m6zMAz3ePnSz9xce+TIXh6LK3yGLkLg5wnzY//ZtZ+jxX3MC+BysvzVxLwJ4pHd/dyjHVSNIccz8TO+ugAeftxWVGEAGR0GGspX4tgGvurbZZLYyNRbffQWBZwBJiGW8S7py64tB7jOx/GeDeo87gVsMG6n6OJl1wbsqlTmcbqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvTFTQdr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7KML/I+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvTFTQdr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7KML/I+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZ5hC842151
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=220jgmOFT1NOZxBi5UiZyD
	ErfSIXzTYSIYjd/SsRggA=; b=dvTFTQdrkxom2LSqwjRpDw+cshoPKlI8+yXZrK
	WC4A9+C4Qo+SBc1tNzcct3nkWpKtb7f4+5OpJ+X1G1UP4BPfZr/NMA2zXTimpTZw
	cP+f3dHQuOuGOjAXtHopd0MJBHrnevxMbUIjG+y86OvzQlbfmljqhOU2WxYhCsBv
	xDs5tReetOco0dtGC32e6hB/aIcGzLhYHCIPQDytmyH3k25bl6oAqOJo8n/9o3/K
	0259uww3LqHdnJJo7WOHUKw9sG0HgK0X3gV6DGoVoxE9A2JnqzJkxQkSdtbRVghY
	ifI6kRDOzl/F3KBJV9A+2wnGKcozViYOimj6y0r70ONtC7Ow==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdyw8ep5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:00:19 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46617932071so2797018fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789516818; x=1790121618; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=220jgmOFT1NOZxBi5UiZyDErfSIXzTYSIYjd/SsRggA=;
        b=f7KML/I+XmbtGB+l5fOqJQvjhkFrFEWKOPxXP7oWOqzZuyW0C3tr+AJyOn/e951xSR
         l/C+yAlsf8v9EoSgielexLzMSQgAvS41ktsDngBgktBN4sfsSYxEdURFUvk5xJxd76Ee
         jGB+vrQDvuALeqwDyg2G/J+WuZED1e5fBLB/NvSKJdZRFNygy1C11OJ5WQgwBCk162Fj
         9BJVlTmq9M8YQuIEujwcVC/pOcZyAliuyzemsVvbQcKfYal2VGbz0zoqoWBhuminMYQM
         GexbwwTgI7eh4Vng9fcDPIvhXIoBhjhBXsMWp4p5CtBTP/UWILawR0lG1piJ9FjfRs/g
         UEvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789516818; x=1790121618;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=220jgmOFT1NOZxBi5UiZyDErfSIXzTYSIYjd/SsRggA=;
        b=U+jE2lKoxaFLZZk8NXJGtwcRjGuGw2N3qZOAZRGMXqsi+53KGYHQTkFoB7UPgBdOla
         SIPK6P1r1on55+0Ow2aRLySkbW881xHsA0AQopf1L7MdvglB6VPSeY7GmMWoH3CecilP
         38KZmkmCaiyMLEGoewE/w2HdECKgRjf6Cf7FQFgIMHudkxs6sUCDM94a6keLtMJykZJc
         ncgJqE0jgYj+sFLiv8WWz567dmRbXLdUxdHoucmH5GxmqLxwujUl1wtqVhsMag1HTjCf
         5WrOb0FRrnKYNXQvJaSuMG+9LqxUeUlKzXMIL9GSKeflx5UEID+PP4pePgALHsr9ZVB6
         +rVg==
X-Forwarded-Encrypted: i=1; AKwUvBy8YlIguI7sn9/nOh6zuUI+GInfNc0cHHND3nrEzZTAEHdlMqiqH2JgK2dHvD7ANYR334DBKzXkyOAUxhY=@vger.kernel.org
X-Gm-Message-State: AFuF++lyC1BciN1zj2JfdyTy5Rm11EiAlsY/z/mqgR9m3I+0gmxRKKnM
	HXjeB6LW2aEX8Iy/lGL9i33FRgvxrOHqzcAmfqPvFhmku5c4GeZCOislbq31ydOweIDGsvTS7iy
	M4QT5o+54v8HNH8X35oDWldJGvfRhn0H0RIyIGDpwccK9V4H4FeSFVPUJxCUBROb9vXHVVDWjb6
	Q=
X-Gm-Gg: AYBFou3AKXG8o3MpFlByeufOK0v+wX83K0Ty/og6r/vEIks6fJ3flQuvOdprupJHNhZ
	l10eLYjyFzr4TAziHFiCMDFsAAsm3bv7jmrpYLSYu0iVjFies+3geJWHSxjiLjhA2+NWcAb0wjU
	lKwgV6JrTaiM+XcdmZZXw7Ey7cOUAF2fEJCZYCO1m0Yl7pY+/CUb16DzziiptXfcZqJc6n9K2sx
	tAyJJJQBI65TQ6gi1RAQe+OmafiwaRIJaioAKgPHmYwp/G98JkoKKo8T/JDnco7pAdX4/BYJ0Oy
	1mAnczAAqqM6BswKl12SVMZrvVLF6juslE3vvF3Jd4pDg7wSrK3NUJn/j+RWyUbmVqLGhh4VgTn
	81JvlQJw9MmpswumloLGmTJY=
X-Received: by 2002:a05:6820:1899:b0:6b7:46e9:9702 with SMTP id 006d021491bc7-6c7d44e4575mr620294eaf.50.1789516818409;
        Tue, 15 Sep 2026 17:00:18 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6b7:46e9:9702 with SMTP id 006d021491bc7-6c7d44e4575mr620266eaf.50.1789516817972;
        Tue, 15 Sep 2026 17:00:17 -0700 (PDT)
Received: from [192.168.86.45] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4842a67ca40sm1242613fac.15.2026.09.15.17.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:00:17 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 19:00:15 -0500
Subject: [PATCH] pinctrl: qcom: lpass-lpi: Include value in debugfs output
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1g2MAS16ldJFHKONyHSYqAji3
 R3b5Vv8f4BJUjFoiwOSbGr6DRnlowD/4TAKap8N5Kh2TVlh1OCXNOMc2Qx76dYRn8zEDQ2OqIJ
 cxiSD7r/r6/23rd0kfrlXcJ4XLr0IVncAAAA=
X-Change-ID: 20260915-pinctrl-lpass-debug-7aa2a92f0225
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1601;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=26C+ToikrdDEucP2YwD27WA7DtsKW71JwRXumcGVaH4=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBqqdwQaOgjkhXIQD/DyXMlg602HvhNPIWeWhYUw
 pNJnAMhhNGJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCaqncEBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcV9JQ//eAWTfCIdBFv3DyViURTiQSGaWlMOiuTTSYEZZzy
 pscM86Afvr5L3i/YILd5+wP5YKzoEMAleUaR+JCGQrCW1vpbOh06RlG7wS/8pgYutIJlir8PD0J
 8LAKDZnNiYGY9P/OEQn7TEgT9p930KtpThhkVK4bj4WxvgTrDgkMdv1PCUanVTEKFe+Ppbo0pE4
 yvT+INsCnuLOG8E+DKrK4Zvb0RgCtiBQciJ9gH7aUbdG/b7H8LkmZRmwBNCOS9OMNb09YqtZBAo
 pzLH1revkUVIMlghHZyb6yCYGiZWfUwn/WwRWXQQBuCbJUYPHvA7e98zXNQCdzScBpYFAlf0acm
 R2bYt0HYqzsxaeafoEwTVpVajolS4f7ZxoXCUOoeGSiy5EQSA5n7VFQ3oe8V87dkMYYHJRIRukz
 QjaauDxc3CUQS9WhAlmPixuRK6vGbUxZPwU+aH8hbQHfZiCyc8VhazSLSan0YBMfdCfIf2OBMz0
 ERue/sWUGkmAOKHdgmL+AcN08pMSuS0N8VzrCy/KbA/Qw6R5fFNfAgm8kJKL7lTbQ/zW2CTo8bO
 xNFuJSzOV1Y12evl1KtB9FNIqs1xNnmsNVeO++gSAgjGDmXoGYmDMdZcy/fHd03MTzRa37YzYCY
 NvucUrKOvBBhnB8gQX9me8oY4Dkhy1qakddjfBJq4f2E=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: -WCtmoGINgx18Xf2MYXKg3zKE9SmhniX
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aa9dc13 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=P3g009chSsC6MAKsTMIA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM1MSBTYWx0ZWRfXy8xGAAo/pCHi
 82hKcTpHQZVFQFHgJ9tJQe71dknJN7xCY2sP8LrOmgIHkQWFP8eeDuRiBuoeTvbzDlMzq62b42z
 qeaLdN7lRofm07X2oX/0uD7VBlzERmd7N/09/ERTH9XCVRhktM3ETZwmpomawvmB9xY+FCnqUcA
 Sftv4ml3QPKt7Wa27s3WzXVJeYuvA5L/aEjyIbtwbuR2kAoPVuLzlu9PiSy7yNHQ0emhnZhuItr
 PJQS4FiId4Q4IoJ89b9gS/rSnmf6TX7MltDlerIVuDjUuWX5EkhaCn5MIp19GVk8eILI4/rGkJT
 0rFEc44cXiNUyuQK6b1kR27T9vF+RT+lrL/xRNLMDWZTXP3cEN+8LAuqG5xUVvTebmn9HOoemHE
 WGU2LkrBMKoHYdtnQrEio48lw1foCRDdilW/TZQn5ClsVbUFdub5QrmTs7LmhzGZaE16wlxxoPB
 RzuwJZHdbOHlUb9INmA==
X-Proofpoint-ORIG-GUID: -WCtmoGINgx18Xf2MYXKg3zKE9SmhniX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM1MSBTYWx0ZWRfX41tr9gN0B3dw
 iUihP2J4VJhVZGv6CUttl+0osBV6okAQ4aUnrS6xodTEfZ6msgU0AX5u7yzWjKW/BilsSRj9Qlk
 MLer+LkDDoMqfTiO5ft/MXLaWZMi7gA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150351

As with other pinctrl providers, it's useful to be able to inspect the
current GPIO state of the LPASS LPI pins during system integration and
debugging.

Extend the driver's debugfs logic to read the current value and include
this in the printout.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 5fd4a4eba654..9412fd36a4aa 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -421,6 +421,7 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 	struct pinctrl_pin_desc pindesc;
 	unsigned int func;
 	int is_out;
+	int value;
 	int drive;
 	int pull;
 	u32 ctl_reg;
@@ -443,7 +444,10 @@ static void lpi_gpio_dbg_show_one(struct seq_file *s,
 	drive = FIELD_GET(LPI_GPIO_OUT_STRENGTH_MASK, ctl_reg);
 	pull = FIELD_GET(LPI_GPIO_PULL_MASK, ctl_reg);
 
-	seq_printf(s, " %-8s: %-3s %d", pindesc.name, is_out ? "out" : "in", func);
+	value = lpi_gpio_get(chip, offset);
+
+	seq_printf(s, " %-8s: %-3s", pindesc.name, is_out ? "out" : "in");
+	seq_printf(s, " %-4s func%d", str_high_low(value), func);
 	seq_printf(s, " %dmA", lpi_regval_to_drive(drive));
 	seq_printf(s, " %s", pulls[pull]);
 }

---
base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
change-id: 20260915-pinctrl-lpass-debug-7aa2a92f0225

Best regards,
--  
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


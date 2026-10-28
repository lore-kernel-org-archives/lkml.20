Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193274;
	b=hvJPYWEPZxBStS1f778fi7hM+TuLvdQYaMF+q4QZcitZ2YBgbVe9kzrNCNyvx7YfPdOx
	 sFbD1LiEjXPrgTTd3a3fRPq3oer0+DmbZSqqscWyJ5v1we/7YL/Oqo+QkBOrXJDmH1Ajr
	 4eMJjBNR0bOjO8c6lCj+XJCuFUzUDyFbYFGOj7kpAHKVH+Sn+hQoGxYz2fKXQ9CXP8OgL
	 ppIgiV6cBnDvObGF+gjP8MsotKHJtVotluKt3CIn6vWD/ilFzKNtlR+pFd2PWaVW3aG1t
	 koJyOCiJEMC2SMRRjKCNZZI2JPpLZusWkWuiw5OQo67Ort6luRXw2RfBOy1IakdiEjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
	b=v/uBPn5eFboSICi09oBjP3d3W0WGGaayK2lX7XA9LCqEbVhMjPCT+Crhphnz69XkBCU4
	 cuM2U/nvG5NsuU/fzKTlLXarEF3NeGDTpY/71rssVc5bIo83HJSUAS65yRiDgFtCAvVuM
	 Gkm9TTSF5+9PekaOWnbpl29vAmujWZdNJLE13ThnRPyndZFoHWCNZQT/sYsh/qq3EO8Di
	 3LaBGH6h04hwNTdxbtKgsDOe4J2mRVBUNmlqCEwwihYAQi1O4cOelp3LZntq8YE/ocnho
	 Sn+qoPO6bRBSs/YqssOB1u+suMDm7ZR5faBLSDBowKVpF6EY6GCne9p9SH+WM4H3Gsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9BEfN2x;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Vvdl+u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F419606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F419606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D9BEfN2x;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4Vvdl+u
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe56f1539006
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1x8NaV8HTu5gAeslmvpR8F
	GTVuxugxIE8fzlISP3bnI=; b=D9BEfN2x/o5w0fry8gHuNT+065VJseNTU4AECb
	tI9MxVxRvLwD+SX/3G5IxMMQvuy6+e+S9c1np1Qm5LkUamkZqRn9k6apfDfpVVbj
	nn3S1rR/H9VAVQt/tBAO7eUQ8QH9DTzJy6UTQtGwrcoNtfMGrJ79hnVvfM/JWXib
	HB+rMY7+fmQotBA+bCu9g7f4YbBgKbYB9cjL8qdyTeOGs6LyZBDNqsnaOQObjfBG
	y/iHys9SfqO3SynMjNa7TrXJN7qayjqtjkNYGgRZQ1l0vYhdRizIMx6C2VlkZy+6
	JEvPYM67qoGQ/5jhO/0FXg+A7ng5dtzTVzjNCKncjxvLBHAw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7s225-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:14:32 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-70339873137so962325eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193272; x=1793798072; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
        b=h4Vvdl+uUBawzI83pkPIQuPRjI+/hWTab2r+6ZEOjhKX5TBH1tSvaSbpZYyyoEla51
         PnYzdgNbSAOR8YOZOu4X+dTFMtSQH3VhQuRX2bP8fVynLqJlDgFt9ptOTp88ioCcwFUZ
         zyJhFf2YxYTbPkbtHSoqhtrcELxrmWDaWj+GOfADzUcmM/BWL1OBGw2y8AbvVYTzo9s9
         15URYorqEkAoyH8BLO0B88tjUH9lVWlWGYfkj/JjSR6eq4VOHZIXKBvpdbAUOjUDtpKO
         Xb9qg+yYEDY3Ky0hUDb88GQKCSu5WlLPAENeIv95oP9eRraarXHgEEL9LCgsNmzEaLew
         l+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193272; x=1793798072;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1x8NaV8HTu5gAeslmvpR8FGTVuxugxIE8fzlISP3bnI=;
        b=pD/1stVUwqX9Ix0VKUtSXdaxnFvEUGsD+Qaz4JcCeR8JC0702BKaImb2xT5SuzeQTK
         lL/8kVPZPsHkRERDkM2/6THJew5O38rcMr7w8zkFyMg2GUboBaTMNbRdgsjRocIpsxga
         9gJkuLAajjpYzTFDnI01BmzVvBaYzR8V8oG43gXs9Z+Sxdrd7Jn8NpbqymUvAV0bJcQ/
         N5Uxp5+wrEgwVJjkWEiPThg7jk5y+D3yRsdYIYLF3zL+LMUT9fR0elf1holh/pwYTLLI
         fNHEn4s5JzEmODkRX4u7Zlv9UV/AaSYoG6Yyj6BnwB55Fpb6S0+kHuvAO8Y7+lILmrNi
         MB/w==
X-Forwarded-Encrypted: i=1; AKwUvBx1PCSYnN4FNXNo11mch5wl3uoDHVh0WviVoskr1yTbJbza8vse2BhueeQNpkLks9R3p6+6hojgEqh1nIA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbIaM8vGQj2D3dFpO6hl8bTPtAFhKSKQpykDGjF2/P42nDaMLo
	8C/sMvCHLCAFreaDYTRurOL5uJvk/iZSlPCa1b3Ad68LAZomKL5o8mlV7WzTw+zTuhsh+kyznkt
	ez3V1poU3dQnM1W7w2vJTjRXWSN/X74M1RqS0qecyYOeX1CApbUzS0VQB7Kq8HQhZhY8=
X-Gm-Gg: AYBFou3odC7v73olzlFoFC0PGI5CFKMD5V5e9M9LGaV3GhMpLWEy0V4TPT079obK9HB
	dvvKxiP76b75uOUOhMDNElbjD2oCsMLTScIeZ0o+MLLepD7uZzQ81XZ+1IphgHZMEwDFikorATt
	4F9aPPIgHpTcOfm4zUbUKsmKNue5uyBw2feOh3rsA4ueiZzvTEeD8ueO9xVFC4W59uKKjvCqefe
	4j+IVlaNy4JTqHBOVLoHVptNiNCVY71ly7zH9XWNvKy1RKIBf+eS0bwjoAMZ5ewSAWEHVZ1/S56
	8p7G0cv9fDl2IB5NOJn2ZoSOAuIXKSjnSnCyp6Ji29gjWU+xkaxkgJd5vi9Of3RXjBFdd8JW2VT
	JH1qBiuPS42u8wS6HnFu3PvhaBWVGq1tb3jRImccKeYbQmFMi9gSfo69rQ6/QsFiiZ0bbo0g4Z+
	HjVa1ps+1U
X-Received: by 2002:a05:6820:4dc3:b0:6f8:a519:d932 with SMTP id 006d021491bc7-7126ca44809mr3108352eaf.53.1793193271831;
        Wed, 28 Oct 2026 06:14:31 -0700 (PDT)
X-Received: by 2002:a05:6820:4dc3:b0:6f8:a519:d932 with SMTP id 006d021491bc7-7126ca44809mr3108326eaf.53.1793193271362;
        Wed, 28 Oct 2026 06:14:31 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b788a09csm2388074fac.10.2026.10.28.06.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:14:30 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:44:20 +0530
Subject: [PATCH] arm64: dts: qcom: glymur-crd: Add pull-up for SD card
 detect
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
Message-Id: <20261028-gly_spu-v1-1-1b5b4e1f8341@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACv14WoC/yXM0QpAQBCF4VfRXNvaXZH1KpIWg5HQDiJ5d4vLr
 /5zLmB0hAxZcIHDnZjmyUOFAdS9nToU1HiDljpRUqeiG8+Sl02YpJWRim3UGAO+Xhy2dHxPefG
 bt2rAen3ncN8PYNq8HWsAAAA=
X-Change-ID: 20261028-gly_spu-96f0315a3d99
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com, mani@kernel.org,
        Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793193266; l=1176;
 i=monish.chunara@oss.qualcomm.com; s=20261028; h=from:subject:message-id;
 bh=Ty8iQjHsGQajgTDh0m+gmK4J0o90jMAVhZuq2fkNuPY=;
 b=6x6YWK04xaRVG0/5I2sTwxDR1sy/HprH5IUZ2V3JqBhJQEHnbOWi3R8P2hH44si9M5d8AB3Qr
 yHS3KJlAuF8B8vKiGahC1x8/Fi0S4smi0qKL7VPYJo/QSm5u3j2mz+G
X-Developer-Key: i=monish.chunara@oss.qualcomm.com; a=ed25519;
 pk=R2RFu13c+46gfzaTikqwEg+aoiYYnnwa2sLE2QOs+lY=
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1f538 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=06sbhgvwvL4e3_yMxJcA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: wiM9-QpkqGjdIlWb6exJ0dCTS0xtIlNZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX+XCay1M1T8Kd
 0pINhobMb18uuxWzcvB8r2OCsSM84MVy1hPZccxlrxqJ6ZdIDs8xham0wTE4xeaKRu/2eF5q3VB
 zya7ubWijew5qGbhfeKaNXIm0gd+Wng=
X-Proofpoint-ORIG-GUID: wiM9-QpkqGjdIlWb6exJ0dCTS0xtIlNZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MiBTYWx0ZWRfX+Mn4tkQ8fPDY
 LE5LFhwqTCRAYDCCXT+6rZnmNMdYePehOvsQBNIueHK0tKEoHwDCJHM9XrVIMjgYXo4h+HukmKq
 V1++C3SpLW8HGES4WPYS7DDEt7dmyCuy6vjhoNxXBa6kRgEw//0I5euUPJKxn1ouFDQUplHr5tN
 CU7tvUZ0/R7vZqESKiW2erJkI2ec0Z7yM9d6rf/COBpPMLzdx1cQDuFXNNecJbZHgMw2w84CAgU
 Ykxij/X+C/RmUxM0F3vnP9I43sFF/4JXqTiu0W38lGyEaAICk0fvqEDnqQkxpZxV1aBDvz+f9I+
 MWLKIoNo/ND23AOoSLI3hcSYF1W6Yn5OnsYODrR0MT/erbaw1zgQk5obBiBYZcF0J7TVQbDrk8z
 nuQEDzuJ6VEvQiCbMX6HvY3Zq/0ANZvvUmDhar+H81NvnX1enzhRipUI/J4enH7LvMevjBrfeW+
 cqRmPEmGAdUTEwIhowA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280052

The SD card detect signal is active low and requires a defined high
level when no card is inserted. With the GPIO bias disabled, the
card-detect input can be left floating and result in spurious
interrupts.

Enable the internal pull-up on the SD card detect GPIO to keep the
signal at a defined level when the card is absent and avoid spurious
card-detect interrupts.

Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..a8f9425d8c77 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -1110,7 +1110,7 @@ sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio221";
 		function = "gpio";
 		drive-strength = <2>;
-		bias-disable;
+		bias-pull-up;
 	};
 
 	tpad_default: tpad-default-state {

---
base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
change-id: 20261028-gly_spu-96f0315a3d99

Best regards,
--  
Monish Chunara <monish.chunara@oss.qualcomm.com>


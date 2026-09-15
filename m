Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5533B3BF2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789491841; cv=none; b=ZLA3vD/wmqSvi9mBbChXjpoLnZn31H34qctYumFoBXt+TkQN4Uhyn8gYLQcihlCXmJpCGIP0vF76BBSNmJPy7IEJx+/h+o/kcHoEc94bIFnyatrhdCaeHczBFNfEHnHDMeBki5PP5B98nW9N0MQ+ETKx80VrvfBF+BmAYvokhD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789491841; c=relaxed/simple;
	bh=ZsTLVmYcJfwJ+LUNxUB6e0SUE7Q4keZTOI6dN7BJC5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VOmqxX82t6CeAN9wpfpfNTfF45toRmJiaNsZe91+ouAwQ8YcR7hH1Ze4qqvpgFk70B1/fbpqLUiggfA9ZOjtVfKkdKLtoSNG4nx/wFCnLM9KFkTFm9Bd2sgpJaxdzfe8leNWyK2DNY2/ofvOLKNeoXE/cP8At7C1oW2AiM3mqIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OQasOg43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FmAbxz17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OQasOg43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FmAbxz17"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FGXWw03577086
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X5jxlx/AHYFdWLiHbInnDS
	JvTQk44NPWUfwCjyn65sQ=; b=OQasOg43werB31lcwuYqcSocWb36zRqC9b1OEI
	kzCp838v3KG6dmZCMmG1FnONkFJkWxx91Gx/BRG5jWxg/GwL5J7UNLhvs1LiAaz9
	xmD/uzJEv6oxhQGKyZ7m268VeETVoalX9F2PP3fdwsWUTQWkZ7kGHx5/8QgrY004
	i8EOL29q+PIlpeLmtCeneGLZofSN6+d1GGHEooGWDhm5zge62F2sSBFknP958YyJ
	X2SepOjAa27YrWVipSZ6ukJbii0usxeUmfo+GnaeSuHiuxLD40pCUlepfPCFBy35
	dLjDGU0MmTdb93KWzJH7nd5Rbz0BAW2mtXv1+iqYpFsBqH9Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq9n606p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:03:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso817521241.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789491839; x=1790096639; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X5jxlx/AHYFdWLiHbInnDSJvTQk44NPWUfwCjyn65sQ=;
        b=FmAbxz17DkSxx6Pg6VXP8d2eV06dy1nm2uWt5tplo9upsg7TtnWLt+HOVDgkSXfqYM
         u/m+gdljOYOzwOOfkYqTjvrQ2SHKxwTafh8cKd/eNd6/GmyWOnkLeXEfUQf+BotZ+b+D
         sqM4+zZ4z2ZD8xkLjhkKxM4m09p9khQ7kWuXyCYf4NDyOVHAJ2mbfXsl0OSE7zQ6ecyf
         fV221AUcVPhGy22k1dxnixd1HWSpWfLnlf5LhfQ4mpLIdq2OHq/582TC1zSVgbaTeHL9
         iJp6pAeeIatSqvMP1yPAsZwBNqtEWT7fFAcYwC4jws29mEAQHmcWEDWZbSrg7IHjLjw4
         oEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789491839; x=1790096639;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X5jxlx/AHYFdWLiHbInnDSJvTQk44NPWUfwCjyn65sQ=;
        b=TJvVA8jtDjlZE/BKybCHOTBmH/ClW0994ttE09o5zdKnrxGvUrk0Jm9Isb8REEEPsf
         v/IJm8z2sBH6NjMGY7twuucBb82rb6uL8P56PHF1ckVhhv3yhGqAjjdQwxi14i0P7hTn
         A5Hpdzl0vzV8vn6LrJSBxKJ9jA82+4BMVwZaz8HORqRJRNA5CL/4EFxR//WTE04G8Xpa
         u4JtEbpjuKnFEkk0uFCVmpKo51i3UDRHRA2HZQunxGVmPSy3W6eoNqpNIbo1e6O+4dtK
         SQNy4ins29CEFbaRCx9YG7DKajZLocjjEtmojGGLa5vaRy4UMuMiPvvZ6MrYUC4Vvvwg
         WLzQ==
X-Forwarded-Encrypted: i=1; AKwUvByKJh2r4A+pixV3NdCDtjuQqu9bykl3JvBtXwc4TTfGyu+BM/zHef79xkeFdIt1K34JEGWvoDL/fFiREoU=@vger.kernel.org
X-Gm-Message-State: AFuF++lpvcUulu4TCXreI+3NY+VkZH1L1Zx9NLQOGqKslHVAhqTs0ynI
	6gUzqh8lPFRmI5mQRhlKrZeU5XVIqzA0eV2hPe9gf9NfX7Q/q4jF93husehQJSu6bv+1KOeFqii
	X5fxFgE/8kR8VjzbhZ/zcvOXMplwaPDYE8oGUVOofCiyOaK+Gn6n7N19bVIyKjsDQsL8=
X-Gm-Gg: AYBFou1aLvHA05oxaswmlPvromzYZkxLC/TzgVEImXgpjsV35YRRJ8u3168MsgE+95W
	AwLd/EzdByY3PmONrYzNe1K6CSa4Kcdu2svD0YGpxJdCld7qqW7ivBGdhazRvudXvSvgHUbGOPP
	SVLE5vkUxlapgHWIyDM+zMY64MwQEKUxgVTbxC/tpRryPmc6jVbJtGGPtUl3m/uHUbCZOLTSJaF
	bOQgrB2N2h0QPLZ9+W7a6pyg0f8zNfC0JfZLHzO0rdGQbiSW6uf6C2VWXVVLrt8Aw2uGL+Bm4SJ
	MA2o5hSnZvLEsoTdJDSfAuhzxnH1bVj1eTNj5TaxGR0xyyBX2ScVkzgjtVYeWhJO2bFg2jxkrUQ
	L540UTn/LmJxcrcrUVf4Xdl4=
X-Received: by 2002:a05:6122:50d:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c981884dedmr11769304e0c.0.1789491838463;
        Tue, 15 Sep 2026 10:03:58 -0700 (PDT)
X-Received: by 2002:a05:6122:50d:b0:5bd:aba5:3830 with SMTP id 71dfb90a1353d-5c981884dedmr11769220e0c.0.1789491837987;
        Tue, 15 Sep 2026 10:03:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf27df9sm391286f8f.19.2026.09.15.10.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:03:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
Date: Tue, 15 Sep 2026 19:03:44 +0200
Message-Id: <20260915-b4-dts-style-checker-continued-lines-v4-0-5b8e09b11ef2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQW7DIBBFr2Kx7kQIYxqy6j2qLmA8qWkdaBhsJ
 Yp892Any27azUhf+vPevwmmHIjFobmJTHPgkGIN+qUROLj4SRD6moWSykgrLXgNfWHgch0JcCD
 8pgyYYglxoh7GEIkBzd523qHfGykq6ifTMVw2zfvHI/PkvwjLyn42Mp2n6i+PmvCOqyCdTqEcm
 kiXAs8NWqyIIXBJ+boNn9X28beNswIJ2KHXaHvrjXlLzLvz5MZVuqtn88ztf9htZetX7X2rtKO
 u/YW9LMsd5a3GvX4BAAA=
X-Change-ID: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3215;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZsTLVmYcJfwJ+LUNxUB6e0SUE7Q4keZTOI6dN7BJC5A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqXpzuQNGu1e0K5nAZIlQQxKwOlQEJWQk9RWVY
 7U+dqtIhxOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaql6cwAKCRDBN2bmhouD
 17rRD/9ayDk9/qzPMrCY07LnxJUzTybPb+QnfTUMPi+KmbSx54e6c1D11xzkXRq82rsOrr8ZGsu
 eIN1S2sjZmg5/5L9URivUDcLSx3GaEecBPGZ3IPrQnShmi1kGqJ0JRj/DEoBmMevGJuDBlA/S+5
 F7gro65ARQpIC4q9AieOzIDdNn7LGqBm03ZIHk4TDBbb7SzB9oRR+j0FR6CnDZ+Mrh/JZ6WK18Q
 TwaUDSHxgRfb0LmCT6GDM2kyt64zP4kM7MFbXb5p4QByoKzrpKGBObAafXMHm93cmZJp+h+301+
 COqKxabISd93mWbxqfaSG2QdnINvKI940t7E28aNIixkd2iPh8gM0MoaJcLA2nDHhdmT6KSRShg
 9Ofhn4VvOiJUSs0EWIMdmaK/6dSL1ZvzVJSbtcn5aIbwUEJC+WYZBHnVEj3DrGXMj73GijiwJIi
 6Prg8P2ybyoMRpYwjW+QiC2J+pnmkQPEdh+oLccAEhi2GlIc2XcuROa8zDyzz25eRys2nwr3ZBE
 DLVtraktjxB2oCtkYYZYnG97JWSvzffbEhtl5t6e5y9dELWG4jhijtHXxGNAZHY7S6hUSqrn3y7
 W2xMU+JM1sY08cotN6urrajJtJbwahGkztfsb3b5BQ/zP1wLJfdLHPPLPguIHPhft+/sJdd5uK7
 9AJUqMYANb6LvCw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=BdVNQbt2 c=1 sm=1 tr=0 ts=6aa97a7f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A1gXvU92uO_6QKaMkjcA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI0OCBTYWx0ZWRfXxmJRQ7ID7OkF
 mPcMys/AasKzP4Ql8qzYLlA/3JhN8/1VARKjR2BtTtbvX1VHCrh2klzTc5xC8w1cGQmLCVP6CfE
 k8P8Wn0nPANwj5hSIC+b81xImTJ09W3EcIOv+o4gy8zaOYwhLcIjhdbNQ/DmMBy4iGgy9XSC64o
 bd06NlZC0LyJJL3D+Dl6/VICM0uBnggvuF9uxLh0bgOfAJFfryVBv5vxd5zg17YvgMtC8to8uce
 aeLb4rZg+QhUrVKmDfCJHkIcZ0U/Oc57AmMNTN4Eujl2NRAe/iypTRVfSKO+giGEQ0qotaoGFZf
 +dtBwzNc65nBQRO7QDK9gUlXnUXCc2RxNvDEaFATkjIDxNy9O8uOiDBrRJGX6GS4xzs+swXp/9n
 C/sh3PTLZX7bmiHdcjgwfSNp43Jyju5Kn80GUOWL8PG1V/sw0FOtCDhqb77LrDRESaog5tJK30r
 GRlAATELhYwflaycOIA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI0OCBTYWx0ZWRfX5LJN0ePvsxKD
 +UcQnNhTFkjXSfK6pdHS6GosBVwWRNGynRhLjTHNvnN5RFDWTl6406jL9DB1JFHntc4GXicAHsm
 8AwtvccV9AqPAHuk8VTfiTC3GaU0Jb4=
X-Proofpoint-GUID: EOTKxBOEBQU7Yfy1fInLWUBMNKExbOPo
X-Proofpoint-ORIG-GUID: EOTKxBOEBQU7Yfy1fInLWUBMNKExbOPo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150248

Changes in v4:
- Rebase - drop WIP patch used as a base by mistake.
- Link to v3: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com

Changes in v3:
- New commit:
  "dtc: dt-check-style: Relax property ordering rules (drop alphabetical)"
- Improve commit msg of "Unduplicate checks in
  check_mixed_indent_chars()" patch.
- Link to v2: https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v2-0-c5cb4c9d9b66@oss.qualcomm.com

Changes in v2:
1. Four new commits 1-4
2. Drop last commit
v1: https://lore.kernel.org/all/20260906180437.166760-6-krzysztof.kozlowski@oss.qualcomm.com/

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dtc: dt-check-style: Handle continued lines in check_hex_case()
      dtc: dt-check-style: Handle continued lines in check_line_length()
      dtc: dt-check-style: Handle continued lines in check_trailing_whitespace()
      dtc: dt-check-style: Unduplicate checks in check_mixed_indent_chars()
      dtc: dt-check-style: Right strip whitespaces, leftovers before comments
      dtc: dt-check-style: Properly detect comments in multi-line properties
      dtc: dt-check-style: Relax property ordering rules (drop alphabetical)

 .../devicetree/bindings/dts-coding-style.rst       |   5 +-
 scripts/dtc/dt-check-style                         | 240 ++++++++++-----------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |   1 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |   3 +-
 .../dt-style-selftest/bad/dts-property-order.dts   |   3 +
 .../dt-style-selftest/bad/dts-property-order.dtso  |   3 +
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 +
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   1 +
 .../dtc/dt-style-selftest/bad/yaml-hex-case.yaml   |   5 +-
 .../dt-style-selftest/bad/yaml-line-length.yaml    |   3 +-
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   5 +
 .../dt-style-selftest/bad/yaml-trailing-ws.yaml    |   5 +-
 .../expected/dts-cont-align.dts.txt                |  11 +-
 .../expected/dts-line-length.dts.txt               |   1 +
 .../expected/dts-property-order.dts.txt            |   7 +-
 .../expected/dts-property-order.dtso.txt           |   7 +-
 .../expected/dts-trailing-ws.dts.txt               |   1 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-hex-case.yaml.txt                |   2 +
 .../expected/yaml-line-length.yaml.txt             |   1 +
 .../expected/yaml-prop-order.yaml.txt              |   1 +
 .../expected/yaml-prop-pairing.yaml.txt            |   4 +-
 .../expected/yaml-trailing-ws.yaml.txt             |   2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |   1 +
 .../dt-style-selftest/good/dts-property-order.dts  |   3 +
 .../dt-style-selftest/good/dts-property-order.dtso |   3 +
 .../dt-style-selftest/good/yaml-cont-align.yaml    |   1 +
 27 files changed, 188 insertions(+), 142 deletions(-)
---
base-commit: 2b74cbd61ba866a42f7274bbaca27d59998bdd2b
change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


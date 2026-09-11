Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5483C1F5B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126934; cv=none; b=uXdv1UrfiLueQ2XwC8kebEiEPK5Dy/FpgWtRUekq2/GXAi02Us1OCE3Z0cW+8pwcx6HdMzq7mFTHKOejw5R1/bUfdhOK1SaBcLDblaEeR1pOfbKxIloJtrv/2hED7jUczrXg7LMoyg2EjNMfMR38FCovGIeihm/EXg4xArB2MWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126934; c=relaxed/simple;
	bh=ntP9albCYt4VwlR95YMYwfMGo3qOSfo8vdb4V+c6rQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CMZjp0e513+ukBGUSRt3h1rmE+z+4Hb7dRxiBkdG0jAuhMUPkcGlHOpNjUEKNy3TSGAle/EKVLo4JtDFr4GGcDybJvWFnOjAnfz5UywuGgl8QKgbsRgoD+RyHQowzLdjXRSKLppX9wb9UNEZpk/ziCCMIoCQbuzwEgKPnFJGKqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d9AxvEeO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iaoIvm3w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d9AxvEeO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iaoIvm3w"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqKRT3220213
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=085pynRbEM4QtbfeniVLSs
	bE6+qhFODU8JmemPWGzpo=; b=d9AxvEeOBHLezQso/1O7f9OxPxjgeOL7tR1K8a
	j2sGDiHceNoiYAvOs0tw9Zh10wU2Jd1i4W5LtbOxkdSnaGZ9iqHv9foMIol15AcD
	pRsqL83ucJ5Fx1lCIK9cHjALpj/WgxWF18fI2nG5QmJpgw2JVuzcjBKAHTtCQA7x
	Y6ONSveQfQz9n4JbC9sICynJHMj8gr4jJINHV4j5oKqNUE4QTJGFLllzgYX99n2G
	sIKQcqTCLEjN7jm5BOLP234kypQNvNOJePzKHkhgKS2JJR/5Ce6ZkwCOD1BZgcdc
	HV350RpHEDRsKvfX9lJLKQrHxt2WZ8x0xq5TtvEdEMkdAX3w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm729jekx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:42:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9393ac4961fso103719285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 04:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789126930; x=1789731730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=085pynRbEM4QtbfeniVLSsbE6+qhFODU8JmemPWGzpo=;
        b=iaoIvm3w9rRa5cdUqSxgNQlIq+G7hcCyVDjPxLSP+rbcLp2hiQDTGMKJj4UnJ8QvAb
         H7d1sqR0j2nnRfOcpUFiZaDEsElzCJHkPaHYmM0+PafIZ7GXcoEk0fviN782uEzpQYwC
         PiUNoz+7/L20fJrUxhmEPLeFWMc5PHbCHbx3Q2o+CN1lH1xu1Vnw9bav7EN5AmouCRDg
         H8e/EL+vGdR7GahlATrK81iYoAaS+r6YNfqV7vyr/EL5qHl6AXwceoxzWPYuYuhIolML
         rDPRFcxhKgAZj9VSn3b07aEd+HeddjNLKn7xT63vVNsGRnGFL7fpArepGMDUKHFT3rXm
         eyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126930; x=1789731730;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=085pynRbEM4QtbfeniVLSsbE6+qhFODU8JmemPWGzpo=;
        b=F0zJfkDGqxb3xJeQL3lytFTSKXoqEQxGO60o7l5GY+GrS8XctT0xxLl51izzuldTar
         iM0KlcsfEBi2H8tr0zN3aDvDuCCEIGXUKzuIGTJy9VSEIKRnKatU78js5LyAs+hdx9J+
         9N26TT2moCYdrep2bP85CQNm4pXBgmW93Fwz/DtqtcmdpYpFdZtIyWW5jj61sQEO7yc8
         sLNkOoYcps8QRcW2jHAe9EOh75SgCixR1oqhEGqz4KfpghN475Z8vEKu5EAT0ryr8WG2
         hF4ISsGuJnVbNmKLkhUjvLNxRWhyvEpDqaqeyZm1rQQIjgY7HSlt4/qOTuRpy0dOXQSh
         yUVw==
X-Forwarded-Encrypted: i=1; AKwUvBz+bMK9rBtJzD+xOJPHSOoYz7EbNd+AyB2oYXguocVgwgoG1bSd6rdMUqSIbHkjqcYAX+F7GNO6xmSwiYI=@vger.kernel.org
X-Gm-Message-State: AFuF++lPYPF5Qr3OmfH2qdWr+R0x0QXKWVABSYgrTCZ6eR7Wp5q2W4mC
	W/lTsfTtxxGBTZjVHmSyq7LntYyssmoAbLnsE5jVsNySdngU4RN/sRXyMKSl4X8DCZzSoFOVtiS
	vgU1rOGzYfHtjoL2MbakNrKe9lu7zV9ouAYMJjC98hzcGmNEKtaEYTikj2J/gz51p0EY=
X-Gm-Gg: AYBFou2/E2GiZ6fEz+kwVWCJDQk/gdA59YM0qggMTfhIWadSiz/rhIgeHgXVDqfvMU1
	PM+ppoeXOX1dAfsxUnplSLotdKUNvaILsuBSKdsy79mY6g4FhHfwfGHzlQjyt3S8XrjJRmIfhrC
	zRQ6RRRkyjg80EbXxs/qSLA7o8zqPVydbxd+Da0PLBPfDjsN/IozVH8SaxxcE8guf7rcgg3ExLs
	YYoyeM7Fi/KYJ+7PAyuO6z38fi51FmlxcKOpPv8pSycC6rti6lHdIG1zQEDd0gOILlmAwIKWr+O
	UaA1xp0HAbAyw0dGXUFvqqbe7J4InoCN/7cFcdBgI2iZ0JrFwyTtnCzd+ym7js3RODwfdpIB0sU
	cHsg9PNDzL8+ObMWCw0R2MiI=
X-Received: by 2002:a05:620a:288b:b0:939:8856:d8d9 with SMTP id af79cd13be357-939ea27cc52mr447168385a.41.1789126929704;
        Fri, 11 Sep 2026 04:42:09 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:939:8856:d8d9 with SMTP id af79cd13be357-939ea27cc52mr447163985a.41.1789126929268;
        Fri, 11 Sep 2026 04:42:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm5501948f8f.31.2026.09.11.04.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:42:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/2] dtc: dt-check-style: Improvements for continued
 properties
Date: Fri, 11 Sep 2026 13:42:03 +0200
Message-Id: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NQQqDMBAAvyJ77kJirBi/UjyYZK2pEtskSov49
 6ZV6KXHgWFmhUDeUoA6W8HTYoOdXAJ+ykD3rbsSWpMYcpaXTHKOJgYM8TUS6p70QB7V2LoBR+s
 oIBe8kEZ1lWAKUuPuqbPPb//S7BxmdSMdP9HD8PSY0zju2u9bZ/uVSVTFn7GeXLRuJnPMdVnJs
 2q1qkpWLwKabXsD7h7WTOAAAAA=
X-Change-ID: 20260911-dts-style-checker-blank-lines-13149dbf830b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ntP9albCYt4VwlR95YMYwfMGo3qOSfo8vdb4V+c6rQY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo+kNB32pZiDz8dZ/yW9awlAbU5ch5ZYqEUqa9
 GQI4WTehxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPpDQAKCRDBN2bmhouD
 1xQRD/wJtsrIlBu3JjKF8azeUKTliOiSV4ok5FJTjASZXWwMqE4o0cTx2L2QvVY+97IhAjeAXlf
 92dKClZ86Hbb920mWtV62hcwHkw0kh57zj/Jj1jQDbO9vFDG/nqB5dSo+rtUkulBZIPxgOauBG0
 sTJeaAfowPgCjjtt3KHerCttnbWVr0z82cWkhl7eM4FfjHnu76xALuHP3Gf+Vtajc17/i+H1tLI
 YYygPZ1GVd77fTUgGhwz/QZuMWU70UNibuazu/bb2DAQtQmzHllOcQ8yiHmufQev3Z+b4Rw8+ZH
 +tBdAxddyYnHrBgbNgskrqhgDz9qQT5nJ32syqlMeVzbZT9oUT4QNV9X7/5ZNJMBTqJ62CbKezV
 71WG9nbD9VH8da1I9HMuA4rKmOimCRD82yC+jPS3uLlxJVCSfVa1wplQ/ejXv9nyn+iSiDUezNp
 eH7S82gK1Gm0PEMz3Qbs2d8A0CuoVxHISSaW89igTaJKAqskp9zQ9Hs9uG0jzlUTatZ81OwYcTy
 z61OUuLfqCsxM94SQ5YtAh+w8R3uDrTGm1ThVKgQgLfGw/+MQqzC3R+DArK2IfpZRxLfDgP8rAW
 7xmVXX0ia4fI7XHa3VSYwtDUfMv66DwTy4lPt3FGDHjIEKJ6r3pkcqSEOLUwDv/K4UNvzC0qeRj
 D4EAhYd5Fa1EJQg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfX0VGy6oPNjiB7
 lYLl85Nn0+MmxtV1xaqYi0uuBZ5R7jh7+F82In3EmuOfUygdBYOmlVVhPuFhKgKlIdRdMp8GkjC
 Q9qRbOuaGAZNedjaDMcjfR9cKUf0DoU=
X-Proofpoint-GUID: VmVKiU-3TzZjRDPywS32XqSy0V_vnbtu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfX+pwzNO+xzwk3
 hnjLKipQ/LMJiz4CopULSxsmcW67lpzcjXjaWZWX6aS0Cj9HsNCGnC+FsA+L8F7osvvvhYgYfpk
 lYOhWQUplqTokf1SlgK3Wrxef91Yu/m59pNuWW69aKVSCJz/VoS3FvdE+W83EaKOsh6izQeiFgD
 htcwF0go/MrkLoeNM6rID92Gj6O/YDFgcAlPTlMo9WY2TEh09tEDXUdJ91yhirUYmiUNrhvwKoG
 d33DklTG8jyTjrwppe80roRjIozFYEDyhjWMbfg9BoOwWC+JMV6KrDus6zBVeU+t3+OtyZaJRIz
 nXMVWIXVtA1T4UDN7RB/22ymUw+/238ohQv/XufzbGxIZy8Xhzug1AmNXRf6iFbXBhO1JwOc3cn
 rYURsI3wkaeq4Y2BsjIQKoAc1vFUnUlItXmjPI4sJqUF1uF0F7edb6hgvfLNKmmzs1rkQjb9Rhd
 ulBalatZ7opncNSDT/Q==
X-Proofpoint-ORIG-GUID: VmVKiU-3TzZjRDPywS32XqSy0V_vnbtu
X-Authority-Analysis: v=2.4 cv=AfwkjHXG c=1 sm=1 tr=0 ts=6aa3e913 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=PLN1zR6FEDqKOhwiWdcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110164

Merging
=======
On top of:
https://patch.msgid.link/20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dtc: dt-check-style: Re-work classifying property continuations
      dtc: dt-check-style: Handle multiple blank lines in continued properties

 scripts/dtc/dt-check-style                         | 42 +++++++++--------
 .../dtc/dt-style-selftest/bad/dts-blank-lines.dts  | 37 +++++++++++++++
 .../dt-style-selftest/bad/yaml-blank-lines.yaml    | 54 ++++++++++++++++++++++
 .../expected/dts-blank-lines.dts.txt               |  6 +++
 .../expected/yaml-blank-lines.yaml.txt             |  6 +++
 5 files changed, 125 insertions(+), 20 deletions(-)
---
base-commit: 664f1ec11b4dc75f6de70a52e8219f812b6e57b3
change-id: 20260911-dts-style-checker-blank-lines-13149dbf830b
prerequisite-change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860:v3
prerequisite-patch-id: 14fa558b453aaf560eb17d163500a433e38890bf
prerequisite-patch-id: f8ccd89f399b61ec1dc867ec7955a009c8c7b694
prerequisite-patch-id: 833114edb0c81877ed1182563426ba9695b81081
prerequisite-patch-id: 2ee62b9fd3ca36941fa9191b55136afb2bd699ed
prerequisite-patch-id: 464e2f568391edd2c3a39ea0d8920756a19e3159
prerequisite-patch-id: 0ddb7cb6bf6ba3503500ba8735ef77169a403edf
prerequisite-patch-id: 1fe3a764be34bc423a0e6abe13112948d0d948f0

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


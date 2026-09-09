Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F0D55D88B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959458; cv=none; b=E/O7PkB1LRVOh+58iErfbqJyQzWA515R4Cpd+TXyGo7msgWfsCU05LhGkV615e2dFzwxr4QpSrUyIDmBZ9OerSXss8bhcGkPpnt460VCVvIJPegvSLlk58FSDMUhJt5bz0O/SUDGlCzq2csjv35gN46vnKOe5WInXAym2ZlTV3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959458; c=relaxed/simple;
	bh=mUFl0NwquxVSDzph/Jm5z2ZBB8m6nGd4T8WbWI3OEhs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EAOQnuwID1FvU3+wjHpD0a44oUy7ed9KSKGBuxwiUDBb1rrAs5hvtbSR+jDB7V77WTtZZP2NJySqoMkgdOlEqFUI9lXHmT8BKQX7edRu8OFIQIK2xBEvPOY4N7oOs/zG9TxRnLULC+B7dzCP6pA532XSvdX4uqZuk7BKPlMxHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CXfy1dEu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wo0+LXKY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CXfy1dEu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wo0+LXKY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCj1E1400912
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:10:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aUS3+wVO1plGRk+rytPkXU
	UtSPRv7/F40Myna706wX0=; b=CXfy1dEuYo8fpja3Bvnk4/1mEEWzYjYUOBA8tU
	1i2DBKJiKbVl2gHv0Yh70kpynKbtVmDh9v5jaFt0kRCQsjTiOX0JXzKwtxvyj54f
	6x3Be6/MB3DX8xuha42TIa27c7QF4C4cA5bWDXiVEgIFgS8837+7yV3zVThyxK7g
	qOK98/tRw2BwZ/JobnqCtDw5adh2Fe7/7xzQ7al5PJ14g9RwqVc/L0TiJYIXzK5r
	F5biwNCf6GrCs9kOO/EY548SJuxt/eqvszU8T6uY0CkDhpXngEqg50Z+a9B3gPbF
	ZFcJes6UK3TeVSZ9t5uNJYfl2VNpGZ8b0FnGH7bZvt/0OeTA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x06wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:10:55 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97a4824dd83so4750013241.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959454; x=1789564254; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aUS3+wVO1plGRk+rytPkXUUtSPRv7/F40Myna706wX0=;
        b=Wo0+LXKY1BmmJ8pI1LK8T9J5OGC7odV0miGTSZJ3whNehUUsx+TxlUIBUrsutbCXR0
         AEBeyWdABb4Oe19Njs2/O8FcQZ/fPzftcBxHkyxdiLY900PWmyi7VeZFCBL8Gl+emfhr
         ykZPaKZx9uLlhgdI00LDszx8FZ0FlWidyICbWahQvo89zfMv/IIGKvhaNyczc10w0nZZ
         WHhQgTU8vqxbkYIkJjMd0lbwubQ81Psd2JM3al+HzlHqWG2BEYoTsfL/jaTzN85cGGJV
         F0yb96REkkX6Dz37TMQ4j8n/OmASduJ1wVVIDagDkBFdz2rOq3U7+j9T7vpEnaU73g4B
         KghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959454; x=1789564254;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aUS3+wVO1plGRk+rytPkXUUtSPRv7/F40Myna706wX0=;
        b=NH48dSoKFU4F2aSl7AiFavPoplHiX/mccW+s9n2mLllLd1bPHW2sFXsn+/ApDLyPi2
         wspNHmqIz/PxCylxaACc6Y8hn7aMFOMqKrnxBL6iNpxWzxyCOD4CstEDwct2PeIS5ZaO
         px6S6PuFZ/OFzHqOMrKTLqj127VLfGNuqb5ANDmLtkLVG62QhJJHT9EClnIdJCdckI4B
         pXSG1ebHSDx+Nz19B5o5F82VSylxoaVSkI8WghR44a/YtrvCejvPn+9pB+sfFHzPOhqL
         ihxQkZTK2q4jeIYB4xOXoIIAvKJJun1C2QlyJqwcx73B51rftPQg25rHGSvEg36WnaqA
         Z/bA==
X-Forwarded-Encrypted: i=1; AKwUvByMD+Z7AceNfEAhI4rjgAt2sDUUOJFgVXmRU6RD+wGts1Ct9xgzg59IJUZOC4svV/laLIWH95ghn8jmYjY=@vger.kernel.org
X-Gm-Message-State: AFuF++lZg9PfCzxbJvN1VrkJ1BsfBQE+xvxW2RLYvE1piNXHAu/twLCK
	tb/tj9lrUiU5pFv1IYABRfrNV5Q1ldu0nhhRLukZTd/rujLMLIMHI/y/hdQF7AcP/wQIKgb9+Ht
	bfho/Jn3BMgDLU6beKLjl+rjjAznsQ/YtmMwifvL8lVWzYuW9bmRre6MoHFTSfrJsdP0=
X-Gm-Gg: AYBFou1l9448vQ23f7QLiM65dv5910+u7i6QobuGmPi2vnZRcA9N+JFT6FfwhrparNT
	Q0NSa8RzHqs5BFQYkTloyqt3aJYqu4XuIrbYDd2kJQKMgc7y3vqINa7aMATHB6YyxwIFzKoLz0n
	0PSp0I6o7MRSram46vN7M5k4qiPgnMdlHmFfKWGVnEftgg8pcQAOGBGc9GKURAYpnq3g2oUfwzF
	j7a+kOL2vT5EzKul2VbIBCrSjMYT6iJuSp7b/1c431+jRuXFLfMEBa5X+5WJJlz8IblLAE/WaZT
	EkDL/ZnvMehlWxJfYK2ZACCv4SgeOVSyx5YmG0hTNbtzWJK/xUQva3KsGvoXad5BfOQyPsnkB54
	t3QuwGBpwyruubeu073xMOTM=
X-Received: by 2002:a05:6102:4bcc:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79076bcad32mr501752137.5.1788959454304;
        Wed, 09 Sep 2026 06:10:54 -0700 (PDT)
X-Received: by 2002:a05:6102:4bcc:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-79076bcad32mr501334137.5.1788959447227;
        Wed, 09 Sep 2026 06:10:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:10:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/7] dtc: dt-check-style: Improvements for handling
 continued lines
Date: Wed, 09 Sep 2026 15:10:34 +0200
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOwQ6CMBBEf4X07JIGsbGe/A/DgS6rVKGVbiESw
 79b1MSzl0neZDIzT8EULLE4ZE8RaLJsvUuw3WQC29pdCGyTWBSyUFJLDaaEJjJwnDsCbAlvFAC
 9i9aN1EBnHTGg2uudqdHslRSp6h7obB/vmVP1YR7NlTCu3d9EoGFM+/EXay1HH+b3ualY3T9/T
 AVIwB2aEnWjjVJHz5wPY92h7/s8iaiWZXkBqhUDCQYBAAA=
X-Change-ID: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mUFl0NwquxVSDzph/Jm5z2ZBB8m6nGd4T8WbWI3OEhs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrL1MVCRGqeJxaEtuSeN+1zHqXQ+PYFljQ2I
 xe2MEuop9yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFaywAKCRDBN2bmhouD
 181AEACETfakgsrW6oXf9xQiQX9c8ghUe79916rsly7HL6gnYjTOK8eFGJ/XEp+Pzed6Z6/TkCi
 xdc2M34affJhGaCRWohNP2ApRgDUkrdAiGKRjf8zt08c1/hJsFDvH9k43+LnWjwpdWO5VXMv0qR
 aip+eX5KUVNORvyGdbamJbgssgyBFyMDChMvg0auP/PYQ7EUD8ez7Ssg8FwJhcXXz7aWfexOwB3
 0v/uC6ji9+Ws1Danh0xlQx6wMpXhE3QytwP54jPHwNR0P45KeCk2MRlf/DSpOeThuej1kO46SqC
 JZp+8rEYURTZXZRz0PFTyOrLg5TOduVLOmWCW1I9FliatVjex0i8OmdtSKMNSJE9dFhv0PVSmQC
 k+/A0TbJ65elhCtolAmAHiAJtwvenNj9b9e8YgMPOvLxKMg80PRf4yYbLWrtyhu5kJOgNICDC+i
 Ugrv1lwwMFaMqkRfMn60S3UgvFmUukXV/tSJ4mgTuPmmuTNn+yxSsRneJBv71AbWB1kzUWMc8fb
 0w5KH81Y7S/pzShveQyyi2mlmolCrZmIMXu+0o+pbcbeVpsZxNx67yFQG5idYrSy0TEFYLjgZfH
 PcNroLlzMp4fJOpSRjidVzWAZi+OD0wtUt/sX5iCQwR/oK+iHx+wrzoqdlSPXwvQ81vIOrMrawA
 SyllNbMkZtsPwNg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ZNJqUeyDcTScgSIyjSnMkt9vOzdy6Cmp
X-Proofpoint-GUID: ZNJqUeyDcTScgSIyjSnMkt9vOzdy6Cmp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfXwpx55LvhQ+5D
 cWto2383W7COL+P854FgyPoaKr+95bakRRwSMeu37E6XZAulCVCk7YOb16EYoZ8IvFph4/bgbZp
 l+YE9m1V88QKS2nCeZ8ssm9xcjnyG9M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0NyBTYWx0ZWRfX1jD227RfcESR
 ER/PIiJd8sPhxrWXP/G/YEAklmdlP/ZZvSHa9atCeZbiNrKdwOBO7qTFHT+A8C6tEh9Dnf/aBhK
 Ry/0cKLK5kbYpJDZdgTjC3Dvt8ov20V8uZ9yBSMwT1JLMZVJZaTSaP4YKnmJbCAMpNmvvd0l8VB
 4ChI0cC2suK1v1hpC8KWcRZVUe7PT64KQ/0dFbpSendty/gnbg99CQagGDYT0NiAsSQmsqnmbVS
 mgq4uhy7LkDp5EgDuVO0lW9zXIo3GFVWOj7sG8VS/UjQwilf34DI2Ne0aUiw13WcQ/99c/NsV4j
 75afbNncdCXNxg0mL6oHP7z9DkSRTCcHhQtWqhce1YipeJLkV83Bj5MZPEz0Z50Ge4WSGnVGSK/
 MZRdGoXrmA9jRf7nnz/4JGjmVdlNBZIHiEpX2DKl1du3Zc34M0EOaO4aOQxdhdrW8hg56yRhN97
 qb8PEuLZ8RgtkDDzDDg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa15adf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=A1gXvU92uO_6QKaMkjcA:9
 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090147

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
 .../expected/dts-property-pairing.dts.txt          |   6 +-
 .../expected/dts-trailing-ws.dts.txt               |   1 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-hex-case.yaml.txt                |   2 +
 .../expected/yaml-line-length.yaml.txt             |   1 +
 .../expected/yaml-prop-order.yaml.txt              |   1 +
 .../expected/yaml-prop-pairing.yaml.txt            |   6 +-
 .../expected/yaml-trailing-ws.yaml.txt             |   2 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |   1 +
 .../dt-style-selftest/good/dts-property-order.dts  |   3 +
 .../dt-style-selftest/good/dts-property-order.dtso |   3 +
 .../dt-style-selftest/good/yaml-cont-align.yaml    |   1 +
 28 files changed, 190 insertions(+), 148 deletions(-)
---
base-commit: 694b801ceb1bea205878f2136e8b25c888e51be7
change-id: 20260909-b4-dts-style-checker-continued-lines-c6895bacb860

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


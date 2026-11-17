Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895483;
	b=AQtaZMoIQ4Ubb9zMOMbzaK9rv6pP0vP8JjdxSgqXRkez6hgtouaD8a8DmPTlgMj17EVC
	 tax3+TxOcoHMUMIb0SbmDxar1FCXdR0WLs2YRDpmoMrCVP+NRcgvBB+TPsI+aHRIOBFwS
	 U35YYWawCaLHQ3gwnNH3DwZnbKoVog8mHtrJfQZbH/fsWSVl6fm2VIpve2XWMElA4NXOq
	 5qsynYOrOWpS1GGH5z+k92MNePes1kp1TglZMv49r4cooK+UcCNGB31J89Pussmh5JayV
	 mwCtosyX8kFQL3p8JxP8p0cfE07SRsqFH9JoGQNyS8VnWRu2ieNv/1fLrXuuwTVzh8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895483;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8z5jz5ju4eTvMH/Z7NpLz8A5PlCsPZS7bWOvvpNq6zw=;
	b=CSm++9tB2TKDQDK99H6u0wFvIksVbmQEK35/hR3rIJJitnjEGcNgQ5U8KNRf8H3NYyeg
	 DS6JZW4ZgH/Yx3CfosTWTf8VHwcpBSsZmTbnALcEjkkh1On5k16iigiBBisIGPzDMg2pe
	 f4Yt52SMeLE0/6Nqm8lozYKfV2iUCPYQ3pWfsNWvIyNW4gUepfwe9sH/0nBM/lLIWBX0b
	 Mn2n6iJmGcCdxfCQyBS2z5Qlmohsuwa2Kcccz/HhsKyZDkBEAj87TLGiBi217Xb7owPyy
	 e2ll15oflr6UmTLx5K7HXMpotoFNXxlzLAEj8KeN1QBeFu1s7kD+4Xz965Y4zdzS2EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeLcUwdy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoNjn1oA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE10606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE10606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YeLcUwdy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JoNjn1oA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aKfb1800826
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8z5jz5ju4eTvMH/Z7NpLz8
	A5PlCsPZS7bWOvvpNq6zw=; b=YeLcUwdyToszOXgg0Xaa3xkNJtBs67w92wFgR3
	WRAUqTdgjp4oJBLcXcp03EbD9EZ32ZJTIdY9XzZxRKQzcrufLjzX+OS/W5hqBjgb
	Tot7pjx9xr6ZIfiyopF9LhGhhWLF0jIoozlfH9HZ3Qyv9SuTwHntaAN+EHZz7WPw
	jw2+mf8M/K2fq/rfn4+r9MWFRdSQKpks3uJ4EFrrfi037K/ULM/IKCvK5RqHDuo+
	DkH+a2E1SiHZLHLoZqkYvQW7RGtPBkWpZNJUFWLL8rojUXlprCvkieAAxhwPR0d9
	V9uLKKJFCeLR4sGPt9b6zz+mFk58e9pnLFhQO+51xU6aF/yw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j034y3bjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:04:42 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso4799270b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794895482; x=1795500282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8z5jz5ju4eTvMH/Z7NpLz8A5PlCsPZS7bWOvvpNq6zw=;
        b=JoNjn1oAmM9sGYHSQKtIQOBYYdPArX7lh2WkoSdfv1GYhmuItpqLR4uFrOo4ebvJkz
         V0nXKfpK+y9mAF5CdvLXb7wK/qstvaSgo4KT52fiYZGTKMZNqqZxKw2XtcOIs5K3m8Cl
         C2x6ADH0lD7thIdImnvOnmqIBibAGjESH8OLLej/+ulbUSOIh+f/ARQGMEkmwSC4cNwE
         NlzuUM3al9iKlPWk42lr0RNydv8NYo4+8CJK7wUDL+t5Y34z+aQ0xhXNn5VIhpUr/Zbe
         ayumG2SgmiO6NygVvLoWIezcV3YYGYn2RVtvCGHCkdYdOL38lIrEO8nxBmXbofNkIg5T
         KL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794895482; x=1795500282;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8z5jz5ju4eTvMH/Z7NpLz8A5PlCsPZS7bWOvvpNq6zw=;
        b=YYuT4K+69Zy8GslsWFJTuqcB2qEH+Nn3LzkbJDUa2xeSDk360VBgqR0flQ6r/OkDT3
         /IRhbhR5XxrC5y8eLN8fbBxagh6uVee08xsr+rO1viPwYenI1N2K8I36wb3/2I1r1WdQ
         d693MFPPvo8vEUhdUKGHFNLUO4PX6LXA2tcz46wMSwHruoGMfLw7uiEeoI2qLRlMq3BF
         eFmG9Ob+Je8JHr7RLzEWbxfiIsO2ibTjPhozyyMgquJrgLaEcdI1+txpU+amaFzcQ/Mj
         XAR1RpRccGcxsyq9TOCoxHmiUNz2zHSbLho8kc4Q6Qgs5krd0UvSFU09nAO2/KpCxCOv
         /3+g==
X-Forwarded-Encrypted: i=1; AL+hErGoY2XUNbAiHXi28E3n+BWPtA+q4zBtj5W9iKny3gdPfSVyiAj9KUMEYmUJso/oKjEJkAPuyvRf/1ohcv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8B0T4f99/b1fQDjagmQcZuaNuzC7iXuxdK23Ua7RQf41CQiCmd
	zcUVg+HaKRzEmg0Rb+Qc1vy25YSueGE/77433ON2/h8JjnnzN07V8r0S6Niy3Pco6xPBP8L9Rf9
	rj2XdAXbk8bBHH7gIgQZDk/W/+4JCveyJ/hn9MgvpzkFMXBJWqiPPZCnxDq4DEIR1VnQ=
X-Gm-Gg: AYBFou2Ce17FPUnZ4vV8kphH9In4JGCx5huzKhMNUOQgbAD64X54P9EMAM3xDM2240E
	eyT6bTcyFU9CM9k6K0XqnNXagxIZi4wyOIhs1qd/ClJTpTzx3PuSzo0FcR3Ao9BtUN3w8aFGH7P
	LfwCZLT2Bf04wrIguinQqt01bfKMS15E7cYtjzHv5Cra+mUwIh5gEg7OIJ56pHaieccY+nLUZ8p
	hraCP0rLcEKBGFqhaEJ09pflFJ7rhLdz57kdqpGcLLv6/H4jFy1yBOMfYvCvacjrcUjpH56sxRa
	DTpCAIJksTZGm4k7TWRMg75dK9TYScr29YoWIlfQ1iS/Z8vdhJnIhKjr4I2i4GEO854Kif6E6Qn
	AtZ6HFCcbpAQBxABSM68oeLT0tFHSsbgsBFlWgOhCmXGXHp2rS7k9KCUloZXEyHB7GsEnQKCgaa
	7M7xDu8aqbp7nYLBJqX0sEXWXM+DlL6hVV
X-Received: by 2002:a05:6808:c236:b0:573:8745:a983 with SMTP id 5614622812f47-5738745ad03mr6276260b6e.27.1794895481680;
        Mon, 16 Nov 2026 22:04:41 -0800 (PST)
X-Received: by 2002:a05:6808:c236:b0:573:8745:a983 with SMTP id 5614622812f47-5738745ad03mr6276240b6e.27.1794895480670;
        Mon, 16 Nov 2026 22:04:40 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70243e1bsm11903464b6e.7.2026.11.16.22.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:04:40 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Subject: [PATCH v3 0/2] nvmem: Add byte-mask support for non-contiguous
 byte selection
Date: Tue, 17 Nov 2026 14:04:33 +0800
Message-Id: <20261117-nvmem-byte-mask-for-split-macaddr-v3-0-c02177658f66@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHHu+2oC/42OQQ7CIBBFr2JYO4ahFdGV9zAukIKiUipTicb07
 lKNiQsXbiZ5yc9782Bkk7fEVpMHSzZ78rEtUE0nzBx0u7fgm8JMcCERkUObgw2wu/cWgqYTuJi
 AurPvCxrdNAl0LZdKo1B8vmDF0yXr/O3V2GzfTNfd0Zp+FI+Lg6c+pvvriYzj7tOr/uhlBA5YK
 bfAuUNlcB2JZperPpsYwqwcNmaz+BbLf8SiiJfS1ZobroSsf4iHYXgCTn/oekQBAAA=
X-Change-ID: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794895477; l=3437;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=sKS0bpLc+nWqs97ul0E6mvJlQy5l7TL0Tm+7/6NOoeg=;
 b=CSq9Yqlsc1IpPRHtINKW5yEAoxVspRg1mmSCQT0CFLIAuSAHM6M994xf7ozow1QzKKA83vm1e
 Gc9yVTFQ/viCTRzuLY4M2xMyl4YIGQ8AZ5C7kwvEEe9La7ocwhuk86C
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-GUID: V4Qnu-_l_S9wfEuZWu6TOwgd9dySw9SD
X-Authority-Analysis: v=2.4 cv=aNZlOr9m c=1 sm=1 tr=0 ts=6afbee7a cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=XmgH6ap6i8K7Bl7ZSpsA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: V4Qnu-_l_S9wfEuZWu6TOwgd9dySw9SD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfXygjAk7jI23a6
 R3nBzz245aUAEeMSjSW7WB5qn8ujv73UvRftsPiOPNB+qBrfZCPrS+5i7/SsrDbZnoHgqOcCasm
 8U3iNwnLt2jpTyoTKHhFPoNzwm3BbIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyMyBTYWx0ZWRfX2N7Xf1dKaL28
 L9kCiCgRdOU3Mvd+JGY4KCF8LjU03Xqz3hlovDrrftSv3Js2zf9BCQu5nqNxB1Oqi+ssK883cpH
 Wsc+odNkTJdqhYDd++hqODic3gGLkzaBObHZeRccNrv1ifhyTWvH7M8BPWbr9xkQY008U8y70SA
 53Rchwd6IndUyC2AcyxvTBkMIDzm325+zDiMumxbih7TmU52zg+Wt0bU1fATMrghFxADDtXaG3G
 c5CAL201TbEk1c+D82ewrvk8vvm38HIA7BLr5tGw71iLe+rIqvYnFboUJmD4noCRxhKAKSv9/kL
 e0Nba2C6WoI0DbQFoRYAsD6heUJ7wpBMh4xXs6rXjTLPawtPyYy+yvru08T7F+yZk/1kQiDRKwC
 8tST6N+dm8VsIcTh1DiZuNtD5W7LrLzBAFSRvdE2OG6X/1s12kb51V/c3AafDKfVz9H9YLdJ1li
 TMfbEFRoW+p+uk9h4Bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170023

Some hardware stores NVMEM cell data in non-contiguous bytes. For
example, a MAC address cell may span 7 physical bytes with one byte
unused, requiring the driver to skip that byte during readout.

The existing 'bits' property can only selects a contiguous range of
bits within a cell's declared region. This series adds a 'byte-mask'
property to the fixed-cell binding and implements it in the nvmem
core, allowing consumers to describe and read cells whose bytes are
non-contiguous within the NVMEM device.

An example: assume a MAC address is assembled from efuse registers
0xFFFF4320[31:0] (bytes 0-3), 0xFFFF4324[7:0] (byte 4), and
0xFFFF4324[23:16] (byte 6), with 0xFFFF4324[15:8] unused (byte 5).
Map the efuse region as an 8-byte nvmem device and define the cell
skipping byte 5:

  efuse: efuse@ffff4320 {
    compatible = "...";
    reg = <0x0 0xffff4320 0x0 0x8>;
    #address-cells = <1>;
    #size-cells = <1>;

    mac_addr: mac-addr@0 {
      reg = <0x0 0x6>;
      byte-mask = <0x5f>;
    };
  };

  With byte-mask = 0x5f (0101_1111), bytes 0-4 and 6 are selected
  (byte 5 is skipped), forming the 6-byte MAC address output.

Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
---
Changes in v3:
- Align cell->raw_len to word_size in byte-mask branch to avoid false
  unaligned error log
- Remove redundant nvmem_validate_byte_mask() call from
  nvmem_add_cells_from_dt(); validation already happens inside
  nvmem_cell_info_to_nvmem_cell_entry_nodup()
- Fix DT binding commit message: remove misleading "multiple reg
  entries" comparison
- Update cover letter description for bits property limitation
- Link to v2: https://patch.msgid.link/20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com

Changes in v2:
- Move nvmem_validate_byte_mask() before the nbits block so byte_mask+nbits
   is rejected even when nbits is set (mutual exclusion bypass fix).
 - Run nvmem_validate_byte_mask() after fixup_dt_cell_info() in the DT path
   so the provider callback can adjust cell info before validation.
 - Set cell->raw_len = fls(byte_mask) instead of nvmem->size - cell->offset,
   limiting the physical read to only the bytes needed; avoids large
   allocations and read failures on providers with protected trailing regions
   (e.g. sec-qfprom).
 - Tighten the device-size check to ALIGN(fls(byte_mask), word_size) so
   word-alignment cannot push the read past the device end.
 - Zero-fill output bytes beyond the last selected byte with memset.
 - Simplify compaction loop guard from i < raw_len && i < 32 to i < raw_len
   since raw_len is now bounded by fls(byte_mask) <= 32.
- Link to v1: https://patch.msgid.link/20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com

---
Hongmei Xu (2):
      dt-bindings: nvmem: add byte-mask property for non-contiguous byte selection
      nvmem: core: add byte-mask support for non-contiguous cell bytes

 .../bindings/nvmem/layouts/fixed-cell.yaml         | 21 +++++
 drivers/nvmem/core.c                               | 95 ++++++++++++++++++++--
 include/linux/nvmem-provider.h                     |  8 ++
 3 files changed, 118 insertions(+), 6 deletions(-)
---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>


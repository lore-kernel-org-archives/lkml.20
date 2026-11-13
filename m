Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556365;
	b=BttTiwsdQ+OqdWoxbvddEBGjLrW1pKzwjLCH9rcC1gkMdFlz95/TPQzXbfcX7uebd0xu
	 QCDSsrhZ/3OnVpjATwFCheb8QvgJ8VaAjqEFz8jN+b0Snek91vz+nHyqYTFiNLMlaTmmr
	 FxUWeh0JH/FnE+wt1t72m1uix6LP08XZv55xlTYgunBW0jTRM4yRx3EhaueswIF2oehwQ
	 gZjtcTw8TnIyckUFTekjQw06TRXaQJl2ZwoRF04oUbuKEllb3ox1xEHq2c8GOCRuEZE3O
	 zPshp7saZ5Jvi/XvM8LhYd01+/n5LUu5IFhaBr6s4bUTdd4hPNLK4/xjTDqYXpjwvpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556365;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HZHScfnAlgv/UU4jIpErgdkHU0rjdQ4KpLOK/M0xwpo=;
	b=4sU/gXE6UV4iZ6RHJ826bj6UmtHZ6bUDufZViGh+RYn97i+uJgFsmqX3sv02tkHmrlTO
	 Su25nRoxkaRKT81ccwnSJp39GTHsLNpdmyLjm+AZuAJo+yssbI00MD4L66oyeqALZuHhj
	 EB+IwHoG6AIxb86VorXz1yeAENYEAcX8lVAJLnZdz0jutImdoBuV0XlG51/jsVX/OPvcX
	 6yRwLtu/E5IAujT69314OREyMi6d/CSBVO37oei21wBO3dwDNuqL3H6BgbC7N4ryTKEKL
	 HScKHcr+llZQLwMuOczBCy46tGl7NsCjLSx43xCT0dLR0ybJiI7j0MODas2MZx0Blpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOvX5rj8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYAwSlyE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB945606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB945606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LOvX5rj8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hYAwSlyE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57AEu3615962
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HZHScfnAlgv/UU4jIpErgd
	kHU0rjdQ4KpLOK/M0xwpo=; b=LOvX5rj8Uo/qlLqAiiV4PNj/a0Md5t6hu3qUUp
	rWT9FV+wFNrEw5rzO3+UpRFC9sg6NGz2qk1baMtxmURtOtPkJGlgnSKQN4DPoMW+
	i4otZMlhviAluu3K1WG/TQ/2fg26QRGA8sYkncxAKB+iX29Jt2hVON6vJSXhp4AV
	8SmCFXhnuf7PvXmuOyLZvg2UHKseQoT8mI6jMR4HPSOdpcpw1HuNigeu7QAA+mRS
	Z93KDwtTHguwFC9a40sejZdNs4DIKwpdj5m+BhiPmAH7CrTSWJYqnZu2zT2lY6Wu
	7fHTAwMQUe1JwDhzDgw4v2/DC9jLM8Jfh6OXUIHzVuEsbg2g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0ajrrr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:52:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so690809a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794556363; x=1795161163; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HZHScfnAlgv/UU4jIpErgdkHU0rjdQ4KpLOK/M0xwpo=;
        b=hYAwSlyE0YZGGYC0him9UTiKGsqEQLy16braZeqWab7rA2q6XBCVspPqUj7y0lPxAs
         7xQol5QziP48aEW/breewv9ViOKiZzU4oaOANJ161hP9xv2ia6wgY13kf0hz13VsnLFb
         fCmiZ+780cYL1VN5jBe8NVwaS7XIYrkT1vfKmVSU0Mc0fltRjC74nnUAtMPV7fSuooky
         YeCOoW/+130CRkYRKmQyAr8sPEnWrI9lhSjDlnwEkAy4XknmygTA/jZu2MFyOxPo7bxb
         Kz1y1Ptdbt9e4oV6Q/G0MTZ2Vj0HIdU9mx7WBGYkPW/ewp3gK5M82M1vthlDc6axMHP/
         RLTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794556363; x=1795161163;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HZHScfnAlgv/UU4jIpErgdkHU0rjdQ4KpLOK/M0xwpo=;
        b=ulRKPkWI46OLhicakm9Fr5kqnR6rybx4pfjohmX1FTYdP7OSShzusLVCmWXCL3UAly
         +tvingGT38k1ZG9QbDHQb/6UemVfvare8mPy0qvIHENvMAtWXB3l9k4pEvCZqiKtrwEq
         5CkBgMbDX9GdgAGt7hCTh2JoxdfM1AExCUY55VT0VE6QaVqgzx7TI36jlqpQJHdIhSuC
         NuRPxEsftr4ETxwEtf2HYMIZzspGKzTSmxeaW/5Hot8N6E+bFkqEXtMriCCpDMCMXt2H
         Qse6L8v0fJa5Kz/8cgzIbxFjwP+9E5To7lcbznKmGhL+OaHziFjImNhiZA+7a6xEZWey
         7Ujg==
X-Forwarded-Encrypted: i=1; AL+hErES/n2RzLWnRfajEvTDGVUxH+zxA+vP7kM4SvAcknojcfD+JAvJduTETNct7jbm4N55m9iykTeLzUtmIc0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FyIAc2E+LyvVt93by7+zSc6zwXtSUCiRCen2p6TasJ4sQfBbu
	Brk0qKWHTHQO1824g0wmAzkIT1g+eijKu6KYT/ld+zMUISWh+vbVWxPxOzrlWM2u2hviUK0/7iP
	rh6OfeScXKUHLhvoFgrG/QKzF1U3OI2Mrd6BQvhT/HrIPgxpUlv0kD5SF41sZbhx3E4g=
X-Gm-Gg: AYBFou3FDYIKa4vo+SXsQuXRGiofpX8I2xGdVC4RN9p8Ue2RNbAWlXYjrkoYnq+8DbX
	1FHXXCSqJMVs++LBW81VQ/ExuDkOGUDod8z74TR4P5FgsYT9fTwLAIvEkDPR4l/Yz+3ujuVEWwo
	FDf1em4VKruuIRaLMzPz09ywkKn0jHdfth+pP8Lj5rqZc0xPvz7uFRIWjlFOymmtq5uLIdTPESs
	I1TxigNW8SzQThyNFbe6ri1CPlyfPEFWRjcMEz4CNv8iPooTrOyOr+cYxp5bBt1n4ajQeT2TkF2
	816VQqjUS92U80o/s19SLiS85HdLER06WgQOGHXkgJaxQfTIJBi8zackwGERXt36CmdCiloMepY
	p+jrf2aXbbow37nD03j0ScwBvYK+09G5jKAieJcITUj4DYRX5Gm9PVCokw7QCLU6kiDzax7Su+i
	HoxFCi9Fa+YRI4bmbtjJnpD2CeVFWDovg9
X-Received: by 2002:a17:90b:3c4a:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b1b0d34b9fmr1020768a91.37.1794556362703;
        Thu, 12 Nov 2026 23:52:42 -0800 (PST)
X-Received: by 2002:a17:90b:3c4a:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b1b0d34b9fmr1020758a91.37.1794556362256;
        Thu, 12 Nov 2026 23:52:42 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b24938bdsm1277107a91.1.2026.11.12.23.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:52:41 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Subject: [PATCH 0/2] nvmem: Add byte-mask support for non-contiguous byte
 selection
Date: Fri, 13 Nov 2026 15:52:35 +0800
Message-Id: <20261113-nvmem-byte-mask-for-split-macaddr-v1-0-138f715f18c1@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMPB9moC/yXNMQ7CMAxA0atUnrGURFAKV0EMaeKCgaSVHSpQ1
 bsTYHzL/wsoCZPCsVlAaGblMVfYTQPh6vOFkGM1OONaa63BPCdK2L8LYfJ6x2EU1OnBpTL4GAX
 9tj103rrO7PZQO5PQwK/f43T+W5/9jUL5hmFdP59jq6aFAAAA
X-Change-ID: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794556359; l=1807;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=2mY9aI5E1G4zfF2F6CzfWvCpn1twV8Mrl64m5MG9Gys=;
 b=2mP7NFpsZDCkfE2NIgOC/RzrgW4X2MTp9Rf+ktGnOIK9nP4cyt92QE+C5APjQ5wA8+s87s9zT
 PayMQYieLo9DIq+TBIHR1/DaMi04f6rm67Schdy0ai+8JaC8skVhC4D
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfX2io7ehTA/zZX
 A9AoJAFbSIlnrBAXB/qH74QKXACYUwr4cCNQEsLrBv2vok/dPF3nVMGTA4wCkRWNX86dj5thNmw
 oQuCucWm0YzlmS5X6YV4Pjwck+uQo0c=
X-Proofpoint-GUID: mZbcHHvll5u0XK7I1vl2K5Gsg7FQopBx
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af6c1cb cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Qa36SSpCRuh_uTHRqdoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMSBTYWx0ZWRfXw7/svzAu/DTi
 TIgPKXMhXkwFSHID2VRINg3XUrwapb4qy78l7WIhsUkyPhSKq66+dQwI5Ly7oR7U3y1DRLDbcuh
 I9sHSgDpiTl7CafXI588ya0LrsR7DyAsex5cRvCOphV7MdhBHfw6Ook9Urv1AMuzb8jDYPLd8Eu
 k55I43jQVXFKXt6jDdKh4yyIJfMjw2ANeehtFpg627eH2E97S032E0DdZGap/oU8pYaONavgj/f
 C+7aHkLB0N2S3LzmWXNTokR1C0c5++Yt28DKKF5gS+ACOZ5YxBimA3sQ8TlYoymI++0HydgIU2m
 OY4uSy/p+sRBAETIAXl7lLHLQtQYkRBSJ71qpsxxTydXZLf3ns+LLwbm/WkBbkB01sxemzkLxlX
 +UfVnNCS67MyxbMYHDPeDSZFsoS0j5/7b4cTzbxwZ0mSULCEHbrSgRhvlCY7ZK8uEdM66Jf2BoK
 7d/40vbfhH0cJsYOgKQ==
X-Proofpoint-ORIG-GUID: mZbcHHvll5u0XK7I1vl2K5Gsg7FQopBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130031

Some hardware stores NVMEM cell data in non-contiguous bytes. For
example, a MAC address cell may span 7 physical bytes with one byte
unused, requiring the driver to skip that byte during readout.

The existing 'bits' property only handles sub-byte granularity and
cannot express byte-level gaps. This series adds a 'byte-mask'
property to the fixed-cell binding and implements it in the nvmem
core, allowing consumers to describe and read such cells.

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
Hongmei Xu (2):
      dt-bindings: nvmem: add byte-mask property for non-contiguous byte selection
      nvmem: core: add byte-mask support for non-contiguous cell bytes

 .../bindings/nvmem/layouts/fixed-cell.yaml         |  22 +++++
 drivers/nvmem/core.c                               | 101 +++++++++++++++++++--
 include/linux/nvmem-provider.h                     |   7 ++
 3 files changed, 123 insertions(+), 7 deletions(-)
---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>


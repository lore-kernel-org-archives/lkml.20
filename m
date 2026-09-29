Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636524DA9C3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672137; cv=none; b=XlAqg7iKwptUcsfchefFptAyeQRc0VjjneHdHytANE4V6g2ZoMuf0TUEdZkyAe53dl5vPc04Ny7yGPDxfkzupQ8/G+C8KmpTUTJnOl7YC2sF+7z996q52ccqC1dhT7mIxA6QLkddls/5hn1kwFjnThrrL9o1NBomEgglrYrXyck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672137; c=relaxed/simple;
	bh=WOxJ6Lo0wAfwLEa0W+6u790Sja0fGTF876sOU1ZE3OU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pl3m0KM0sh/umDat0GBbBmNSVi3a1rmTzAAwj5BCuRuqj/V9GTCf6HDmd61w1seA4kzux0sYbGwXTtZYyvtiRTFNODr+r/0TlQcZzf7LvekeugbLSJR23U+gu3KGf+FTSw9TeQCwSSk1Da3aBF5wIMOSYbzTwDxbMkU/eL0KjdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SxwwWJdo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JljEdXED; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxwwWJdo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JljEdXED"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7ThtG300784
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:sender:subject:to; s=qcppdkim1; bh=YYysSFbntWirOw1STKVl4DrzLwzu
	CO73/HGQAWPAgJQ=; b=SxwwWJdo3tGTRs3AaiGf1j/VaAqnsgMbWZMSWtn74vsD
	zwqiDSxOpJaOws2+xJZzDHHuMqxvqlygctslhLdl5Xp3uTBgYmY0chpWOb8YChJB
	v1bE3R96lkI6MpgdMA9Z1yPJxzmsftMBnHaMUxem8TvkIMl8YmqVVxepIttO4Mm7
	y0kRTFv0TMRIuT73a9i+uQ/XPdLV9ooKR0BvqSZEIQRasmqyVnKuy5H92ZQNI4bj
	9RlqpcyokCzii6SaTNp6sVYYi14bXwDmyQJwqGVjvDqC6PJ2Fq4YpdwQHhAVSSiy
	6XT6EYyAueRsQqbgFbE/ViVOUWtuoKa9ndXGLEbZ2Q==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h05yxh33j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 08:55:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so8109434eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672133; x=1791276933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YYysSFbntWirOw1STKVl4DrzLwzuCO73/HGQAWPAgJQ=;
        b=JljEdXED9Z7dgE76lY+Lna/3M+Jw7aAYZLRzpYffg/CBpHrV0N9vb1xB6FOnfg6lxv
         kNzCO/zv68vHol3S8uh04+K0ljZwkwrAjCvHinRkBHeJ1HSwkZ2f+G3xOwim1hsTa88J
         aw24wmCrX722YjwaH30r1tlWVKIjgBQerLX0ZkOtrtXf8sbPmj6gHl+We4DD6SxPIKrS
         PofEgQCrV7kLeYmLDaWEH65/rK7qAhTtAs9lZOhU4poe9jMOgO3/PSLcunJwBVCTlhsj
         ORuwecWG/w/XLmLP+ndyp/vzOuhcFMpGuvcGBDJw1E47hrPrisgLI8zGSKqKKGS98eLz
         JPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672133; x=1791276933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYysSFbntWirOw1STKVl4DrzLwzuCO73/HGQAWPAgJQ=;
        b=V7SE4Z1LrCpRYtoSYzVtiAOG5NXK136L+XECNUOPVanGu29x8yO7LqmUBzlpX1KcJS
         twjonoy/L8y7LrJpC2SjeKlK1V7+8By5FpBPJd8Apzt25gT35Fr9cKK2oFDyrd0TTIpp
         a5ZRp2noXjvN0d6uClzrtYllq7MNGKW2Qa3bgyLp0R9ffZd56GrX8C/fQhC5NS5H0bDc
         JPRvWVh+kivo+o82Kc+n1s5dcv1Uje7VvzP5+pq5Ll7fov8bSXh3DP3QEdjl9CSVy4pp
         EuMVLnmHWsIwyb/LDT/o7fGdgCZ1MeIx3eEvTF4xYaTKvBrLofikFatKT3tTldEAaaMb
         B4vg==
X-Forwarded-Encrypted: i=1; AKwUvBzy8t476V9j8uzgi2OG/CQHi5VjBoUlldQ1dLfH3YJTlItlfIhpHwLZS721GzML/JnMPJLjxKs4FB4Nxo4=@vger.kernel.org
X-Gm-Message-State: AFuF++mSB18JYa3QB595ilgzGjjvdVmckMWvkyMS8eJITf8Af6JnimGS
	GePc8+5pgxTEP3cWgVVM0ikaQSNNa5v5kO5QfgTadHdEhQzn4W2iNYFs5Ss3JyEH1Dt0t3E8WIl
	kaE19gT4pkZofZIpc2GJdweF02gDd1dPZPPwmdCATQgVpDC6/yxXQMqmkpIzxKSSucjk=
X-Gm-Gg: AYBFou0pVgTEGWBr326i0YmIa+sN+FF9PirSyJebxphrN73zL9TZkrqkDqa13ggCI45
	6ER+HwtMPY6ZK9Bwp7WdaVd+6mFuGx2K4vuQQzCscwkm8xkBZtW0MocjC5A1CIYE1qQDqKZKC7Z
	fc+CqmIrWwHTFR6N+xuqz6GDNsiNDuEJEewy3Nw5JP5Amu5LW68smLt4T7K+XiTS0E/ZKHlbB33
	TE1NviFyDDL+7MdAEooCXhohI3pEcK0QOP+hN3HEPoKHnDiTZUZ9dQ/fJvhS25uqSPyRl9Nt5O+
	5lC3DHDlaz33/xamaGdqBUjDjzktjaz5tey2uCqO6YvPIBvo9RJ2/GZVCYRd26dOkTo5WHX7RrS
	vOPpt4BanwdCReo0+ncv8bAaeH9jrOti7RVXXQ74IMdJoLPdHYuhPp2Tl
X-Received: by 2002:a05:7301:b0f:b0:341:f87d:4bd4 with SMTP id 5a478bee46e88-342701c003bmr12253859eec.4.1790672133141;
        Tue, 29 Sep 2026 01:55:33 -0700 (PDT)
X-Received: by 2002:a05:7301:b0f:b0:341:f87d:4bd4 with SMTP id 5a478bee46e88-342701c003bmr12253819eec.4.1790672132479;
        Tue, 29 Sep 2026 01:55:32 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:32 -0700 (PDT)
Sender: Sunil V L <sunil.laxminarasimha@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 0/5] hwtracing: rvtrace: Add ACPI support
Date: Tue, 29 Sep 2026 14:25:19 +0530
Message-ID: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX0B6V9y5RPBMG
 RPHf9qo8UIdOXIrt43g3Pa5jVMBEhYKUbhFjMxYLL8oFsk95P5oPwENxAomX1TmDsMd1DQW8vhA
 J5PR6YPeEUekWylllufOaMws9kCCKEo=
X-Proofpoint-GUID: gYVxwEV9Sa7QetH7erdExKxrBGE1w5T0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfXyv60B08Sjxqa
 vb0ZcjRkcy6O2u+egBX26vF8zvoHap92ExBjJ3/zzKTtKVMoHXNmtd0KzOCMyayAJ41aqxFU+Vn
 4yZYb1tkFxwOLNu6SsvpSnfmWEvw6/f4qIqY/dBEo8DudVGhSIR9eaFcztLApSGqTi7MFw5I0JN
 gpE5ODvvjB/GMX9tlJBdlQPwd0NCtOOE1qtrliFt2vTlFuPlhwKE1Ig/fRMSMfWEHrG9xbg6I1s
 Pduksqqv3YuDIT/VPQZVsCbG7/piQeHk2nQ/NcVSqz5xtQS5/9vFBGB5vspTd55x9agBoFfecxY
 nmOsmZqydyWvRPyq7mv/bFEi+hA6TDcgbgNELyRorZ9upTu0+hzFiPf3gmBor2rdvCL8QyVaXK9
 bd3/ZLuQw0BSEb2wOBH0oX9kYQCN/dOr8IMjUbSsbo3siTsvgDS6W6axWAfm1XGSFyQC7jWFLhz
 M2X/1g52z6xKKTWtf4g==
X-Proofpoint-ORIG-GUID: gYVxwEV9Sa7QetH7erdExKxrBGE1w5T0
X-Authority-Analysis: v=2.4 cv=SaFi5fRu c=1 sm=1 tr=0 ts=6abb7d06 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=vF7HM7XGAAAA:8
 a=EUspDBNiAAAA:8 a=V1jnuoLLAAAA:20 a=Zpogi3qlAAAA:20 a=NEAV23lmAAAA:8
 a=YG64nluAAAAA:20 a=wDIQ8p4OHAohPmJ-3qkA:9 a=bBxd6f-gb0O0v-kibOvt:22
 a=bNn2QJc11pDkoTYzAKk6:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035

From: Sunil V L <sunilvl@oss.qualcomm.com>

This is an RFC series to add ACPI support for the RISC-V trace
framework. It is based on Mayuresh's v5 series, "Linux RISC-V trace
framework and drivers" [1].

The RISC-V trace specification is proposed in the RISC-V BRS v1.0.6
document [2], Section 6.5. It uses the Device Graph UUID defined in
Section 3.4 of the DSD Guide [3], similar to the approach used by
other architectures.

When I started looking at ACPI support for the trace graph, the obvious
design was to follow the approach used by other architectures, such as
CoreSight. However, that would mean duplicating the ACPI graph parsing
logic and maintaining separate DT and ACPI paths in the rvtrace driver.

Instead, this series proposes enhancing the existing fwnode_* graph APIs
so that the trace driver can use the same interfaces for both DT and
ACPI. The main idea is to parse the Device Graph UUID defined in _DSD
and create synthetic nodes that match the DT nodes. The ACPI-based
fwnode_* APIs are then enhanced to traverse these synthetic nodes in the
same way as DT. The ACPI fwnode_* APIs already support the
"Hierarchical Data Extension UUID" defined in Section 3.2 of the DSD
Guide [3]. Adding support for another GUID therefore seems natural to
me.

The series adds the ACPI device-graph parsing by creating
synthetic nodes matching the DT nodes, extends the graph parent handling
for in-ports and out-ports, converts the rvtrace platform driver to the
fwnode_* APIs, and adds ACPI matching and CPU binding support. In the
future, other drivers that use the Device Graph UUID, including
CoreSight drivers, can use the same interfaces and avoid duplicating
this logic.

One question that may come up is that the DT schema [5] has not
standardized the in-ports/out-ports. However, the existing OF
interfaces already support in-ports and out-ports. Therefore, I do not
see an issue with providing the same capability through the common
fwnode_* graph APIs.

This is an RFC series, and feedback on the overall design and the API
changes would be very helpful. We have a slot to discuss this in LPC
next week under RISC-V MC track. I hope this series gives better context
before the session and we can have a fruitful discussion next week to
converge on the right approach.

The series was tested on a QEMU virt machine with the required ACPI
namespace changes for the trace graph. These changes are available at
[4].

[1] - https://lore-kernel.gnuweeb.org/linux-riscv/20260810152223.3946743-13-mayuresh.chitale@oss.qualcomm.com/T/
[2] - https://github.com/riscv-non-isa/riscv-brs/releases/download/v1.0.6/brs-v1.0.6-20260928.pdf
[3] - https://github.com/UEFI/DSD-Guide/blob/main/dsd-guide.pdf
[4] - https://github.com/vlsunil/qemu/tree/acpi_trace_rfc_v1
[5] - https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/graph.yaml

Sunil V L (5):
  of: property: Add in-ports/out-ports support to
    of_fwnode_graph_get_port_parent()
  ACPI: property: Add ports/in-ports/out-ports support to
    acpi_fwnode_get_parent()
  ACPI: property: Add device graph support
  hwtracing: rvtrace: Move to fwnode_* APIs
  hwtracing: rvtrace: Add ACPI support

 drivers/acpi/property.c                     | 516 +++++++++++++++++++-
 drivers/hwtracing/gtrace/Kconfig            |   4 +-
 drivers/hwtracing/gtrace/rvtrace-platform.c | 191 ++++++--
 drivers/of/property.c                       |   4 +-
 4 files changed, 657 insertions(+), 58 deletions(-)

-- 
2.43.0


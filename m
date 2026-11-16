Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797923;
	b=hhazjFVOxdSKthv8c1XNVfGjUnfWIqun2mJGZUIsbzn9JB+WHzPJZzYwuT0J/hAEJIUl
	 qowr7rTwBY5QcK6vwuKCh4avKp1KTkN7CjyJp6tTdFO4WD+hqpGBSsYPH3JTyUjk8DT54
	 HgvBjjHCrZXuOPICw+myD+rWjr7Cd/CFVRNQkUjBHYH8P97uCu+MjC7ONDuqvxgYFi6SZ
	 BoVvVOM5yNvAxSnqZwNWV62OLuLasvPpop7yScX3y7pF7yRAUM1bQm26CBnaDdLY/HY92
	 f/+Dt2w5uyywzHIAALNFPm8kijxaTlAkkGYT3cMuTKeivysKb0+YAHBLtNh4ptFMW2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797923;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Haz0Fg2WReyUFl3UrvT3xGXco+7bbkOy00joM8Ssi5o=;
	b=Z54PsON7heK0MwXZ5SsyqBNiTMYI2albbM6/g6T+7vlMNHI8d5c1Dn9Hl5JEFri1XiV1
	 +pUouUVcpeJ6ICP/EcR+x0Y0GafjZaHa4UwpbZTqkRFmHSqVbLMDT7Avc0mMG3gqfBYGP
	 /NH9ACTtcgTUaa/RqZMYqOQ51VFvNKOR5P6z4tW4tOArBwao3gRvBf+0cxgVscuHSgZch
	 +tsNyqS57abFDX0q6uoB3OeV5YzYKUyyXd/yzPlYav72A9hlaXJdnLkF5WEvHKcRmQ9MM
	 RAFEFjCe32GxHI6b7glmLtJwkg78xZXx53cVZCDxtjgm9n+iWXMJUXzExzk1GRjytYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsNBGGwj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmDjM3ZS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DED606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89DED606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VsNBGGwj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmDjM3ZS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG1L53K074075
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Haz0Fg2WReyUFl3UrvT3xG
	Xco+7bbkOy00joM8Ssi5o=; b=VsNBGGwj8VsW9CAPE8PxNYw0e0JGqCMqSTYwE/
	mXjxCC+ek45U+99/ZXJ64e23So8XPRlvT0GY6O3KeuZJVh4z/UMSA/+5+uIOBoi0
	JbBsCJ0f94ZWxCdGzvJiTD3IM90USJl8/5X1Tb0unpROjiuNyGG6zUDfTDSolxYX
	58tWaqzlLMYU9ZKyyp655+Sd2nJPDLSfQGBfj0pz7CODsFStV8TUZTBUgMBHt3+g
	q73OvvErnJTRXU3AcD9AaHlnprzDki6vucMZ04e8fts6W+D4n7FY+6onsEhSLZz7
	q6inJ7+C73HayIl5Gm3zbymIktUho5qkwxgY9w6ZyhLgyllg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjvh7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:58:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-375bac6bd21so2411768eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794797921; x=1795402721; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Haz0Fg2WReyUFl3UrvT3xGXco+7bbkOy00joM8Ssi5o=;
        b=UmDjM3ZShy7qdAGO2gp9Qucsi7ThikvTdz0vCSKR8/weHhw3fN3Ptzvv10t2iMbc4Y
         jOJq6bELD8CQQMSp0jXIkWXL1U3KD03qhpUTUlP0TmHKvOgg9SsQq0+v4Rp422cGIh8d
         ENp0UsEk3Ejg2CshTe+Rxyn4FL9/V40gZ45c2t0av45x0mSMxhNCPejhs6hyuqiWo1+K
         jnzaHne3FKkw/GW//zSfiTWkDYTXytsEuRf+ctljBugp4pVHVmmlcVASm7gZ3gC6ukeM
         s4ZmoldVuxGuYqG7QjmD37C4N6prPKRgOHy9NOLGE8oINuj43cyIMbBODYjrLpJGrrTO
         nWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797921; x=1795402721;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Haz0Fg2WReyUFl3UrvT3xGXco+7bbkOy00joM8Ssi5o=;
        b=CpFHj8ytC/NAPLU4qX8f/k1/QZRvi4UyoelzW1s2P921T7fKKEzENQZiK+QNieOFsQ
         yuQVIwOaCIzwdG8c3GtRilZ2r0d7lg6gb9sxtgLmSUOuZsbncel8WnWKbf0QEwrqGdQt
         RWtm39afSJB19soAxARJp2ua0NnSTbHMhJBIuAD2zkdFkgrniRzH4BzbPXOut5HKzxpP
         FHK8C11Cb4I+LYRHl1HnitopZxqvRlfoYZ943nn0YGqWvYXCBfijhsxsjWU7xSZMtX3X
         e16d6RvqTwEkZQ8qdLC5iHI6EDfaU9udIU2mdbneDCgDU+sjPFQ8Bv0o9qLgQ+lDFIuQ
         91Sw==
X-Forwarded-Encrypted: i=1; AL+hErE997rOry8IDX+ZcL83kCVXrNC48OxsAk2dRYk9whWK15CVWEeVL7ldcGP9JNt1KaMdUTxQ/CC9jC2y24U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8xE/uroU+wXN0P9tziWDbaFSccZw/1fNy9JKQ7OPt2+dUkaSTu
	pAt74apMDID/RjYUgkErFiLYeUQh5lziiZntxqSiSLLrU2nqSVF/BRtgqrvQvT1ph+CBIfl+jJH
	RpgVoy3EZLNFtPNz9E6mmbdXys+IGQLjFbZRSzVv4lQfv4Y4bgDoMgGnl4IBFxCeI+bY=
X-Gm-Gg: AYBFou0y865ygR28tM5WfA7/LsfyhNcJkuSlthyBzvszsec4NU1wBsocMKXtyjwoVCo
	A5Ys5w9YlOuMEalePI28jXzMwZ2Tq8qhxgAxM2UpA0CDtp1zh+rmuzH2B+KUWpmF2IfOuZg98Qw
	XQ4gC6CGsjlnBMJbH06npZ17EGqZZ7ChfU+nLVhEyUh9ElHqC08ogWeHyzBa/z1b6WL+aaszx0x
	+qbE2n71CIFi6fB2g9j0LrXUjkvktN0ZI/nIVqqHAamSkYGD8M0XEhE3SZfuHrDGBGQLEcrX63l
	vXL/RiEwaLhM8Tm+hCvjPWv00QYmtYWEGGpViUV0OkhkUeQy6NsqH5X3ce03cTQWJieu+OFzaMG
	hu/xy4B51AL2lOIqrQmLvjuKSuHoH8AW3m5YEzvp7hJ9w3DYgEZ2V9d0R/FtJOVRpde2Po8VsT/
	zBmk9OVkO+JgAGByI/C1BliOBtmBnGtxU3
X-Received: by 2002:a05:7301:1509:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-379658c798fmr8478153eec.4.1794797920683;
        Sun, 15 Nov 2026 18:58:40 -0800 (PST)
X-Received: by 2002:a05:7301:1509:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-379658c798fmr8478134eec.4.1794797920064;
        Sun, 15 Nov 2026 18:58:40 -0800 (PST)
Received: from alfred-sh01-lnx.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm30469991eec.14.2026.11.15.18.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:58:39 -0800 (PST)
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Subject: [PATCH v2 0/2] nvmem: Add byte-mask support for non-contiguous
 byte selection
Date: Mon, 16 Nov 2026 10:58:33 +0800
Message-Id: <20261116-nvmem-byte-mask-for-split-macaddr-v2-0-96f4a0c08264@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFlx+moC/42Oyw6CMBREf8V07SXcIg9d+R+GRSlFqpRibyESw
 r9bMO7dTHKSyZxZGCmnFbHLYWFOTZq07QPw44HJVvR3BboOzHjMM0SMoZ+MMlDNXoER9ITGOqC
 h0z6gFHXtQJyycyGQF3Gas7AzONXo9+64lV+msXoo6bfhrdFq8tbN+4kJt97Pl/zhmxBiwKRoc
 kwbLCReLVH0GkUnrTFRCFau6/oBe6GvNesAAAA=
X-Change-ID: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hongmei Xu <hongmei.xu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794797917; l=2830;
 i=hongmei.xu@oss.qualcomm.com; s=20260917; h=from:subject:message-id;
 bh=9bHAFUxMBt657MFwPeyz13mHNWG2VjYLRMZ9uEy3PGU=;
 b=mI/IggdDkPaooFYvfMEPq4yH1OlFF77MKXzCSoGHhj9mHBrs4apX3vvdOYVj+R333NWCmcKAy
 U8MMdgztHRDBDe4Afw4orZM+VyyCOZ1bWNYwce6nTwuOA7oX9QOz3bQ
X-Developer-Key: i=hongmei.xu@oss.qualcomm.com; a=ed25519;
 pk=8J3IzbyuOOHSwLvktng8AEQIdStEQDAGNCSOlkASmk4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX7vZ7mkozdkqm
 i/oU3JiM8fE8KXUWGEd6yX2c7balaRONxnC/0Nr9ow9aVflMD4mryNWUGTgUJzzQfhA8Mxn0JCj
 NvxWR02SubXibCcSHMiuIjz2nsFmsj9qJbkGfQPFvTCFjHo+s55KjRflLUtWpnry/QUAvVzv0DT
 ycQfFeJMsq+trYc9VMjpH5QuE+ecpcNxBjzNUQg0AbfqNniVrNxxZYpK4ybv6udX7oSTIo7jjv1
 AtfdUGA9qgY2zsJFnPVFh1+aVxOSzTtMEn7/e0Qy9MHrcA1FMIJF94jKb4xgWSsUmrbORRSoEw9
 yUylPoQnkNmQjGxPLRippeytff/FZ2+9hu7OI+sKKBgbJA+oHwZYc7q5VBq7TbfSwDjIbI1hOfS
 clZRp8wrk7odUOEZFlE///eP353xsucGOdNyCKswkbjfcwR17yXEhph1HYDnHsl65M+WDrDN2Rc
 8R+d7574AYuPfj0bjRQ==
X-Proofpoint-ORIG-GUID: feKn6305P0QHWEW6ClTh-DmWYZbU4LEi
X-Proofpoint-GUID: feKn6305P0QHWEW6ClTh-DmWYZbU4LEi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAxMSBTYWx0ZWRfX7tLBmBGH/cBa
 1AtazqKUVdVhSBqC7O1oJ9jxdasEJ4m0bQFq53U25H2g6EWPkPA9696+skK+DzqOTFgBvyiE8Rk
 mRxSMvhc/XpGem+ZIJa1eC4f3DjXjfs=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6afa7161 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=IQdZWaMLhoiH-qDjRLMA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160011

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

 .../bindings/nvmem/layouts/fixed-cell.yaml         |  21 +++++
 drivers/nvmem/core.c                               | 105 +++++++++++++++++++--
 include/linux/nvmem-provider.h                     |   8 ++
 3 files changed, 127 insertions(+), 7 deletions(-)
---
base-commit: d26955e57475434b59d43ba372b2a50d33d5e0ed
change-id: 20261110-nvmem-byte-mask-for-split-macaddr-a4698a128057

Best regards,
--  
Hongmei Xu <hongmei.xu@oss.qualcomm.com>


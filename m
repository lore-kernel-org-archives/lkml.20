Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793809607;
	b=n4jZCqezbGvu74leBs8VrDaIPHrTUxNpmGkYBHx7HoI3Jl0K6y+V4bfSwGquQQXaLpes
	 1hDTyNZkeBCEWLaBKvbvHFrz0jJnQCndv2u5EZITiuThI2RRdgYDPRBLKuPK+5iE7Eqhy
	 xiCImmVX6aHfqFDhDKK6AcOPFrMzoQe/CLZXEix1c6tHd0PvrHwj0K9YJ1xNGaOQIBO5j
	 UEXuf4bIKn1yMrDIxrJeiD40RvLkKNPT7ZNkwh7Cjrqfo0jsuP+XXm/xYQ8Qyy3V6qI0f
	 htahVPL6vk+m8S9JHyNVE8CJNcCbzkdRNHUOq06/sLphjEsgphqhNMrjZMiye2Tagnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793809607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6rgO4gTJYE=;
	b=473MGZUSWoYnyvrbHCaeg9PFuBpavSM2HMHtEW1l5rfU0NmsHxUQq8FX4mjd8dWNr28m
	 /J6cPJVBpnRw84v38QRihfl7+psT36RMX/XJz5sP5mvrr81nn91xjUGq2rEUL+DhtytNx
	 yJd1qCT25285gB6siI/XFkvBCLl8q/p2E7mB3vJOuh3lbcfr8wbMm6Gi7cPYbUaZsMqHo
	 Vm3kg3VD9GcvexrFjfRbQECsp6+gSFxhF9Dct0LBBlPWJp7qDT5fvBt3gHU2byt8m8LBS
	 g+aXiSyN+NwaB3FyXW319w7wV8GjbQ5Ye5vb1LaLBN/Jr77pxqYpj41U2+4730mCnDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jua2jF2E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="J1K/iJK8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DC2606A32F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40DC2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jua2jF2E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J1K/iJK8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FiwfU2250937
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 16:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6r
	gO4gTJYE=; b=jua2jF2EPSn+F1gPrl1hsEzTBJ+xWEyGaboYkY3aOnhr04zzOwp
	dJbhFj8NWi0DNFhsQ1V8Yog9pc5Fg9QKYSDOPnYKcEXyDS22328qNIBdINIcvw51
	IsIMrwQAe76M40qKtu+qKmi8II4rDE9Kg3rNikBDo3/xgU/YAD1UNmTi/DpdGaK1
	dK+4VbVOSjSpUysbGLD8ANzkMLpcsh6SMGwxEDXMLfXcNitlUI5/+2hWzxqBETCD
	mKrcyB5M/Tv35275Yx62m2f5+je68cbLYM+KXwfi0yK6ytocFapI/pTyNbmHFFlq
	dp4uVhF+FOj4PilKDNYUfI+Y5fcBA3/N61A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr4bn129b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:26:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ecdc701a2so135774085a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793809604; x=1794414404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6rgO4gTJYE=;
        b=J1K/iJK8/tp6X/UDpnzud4Jbg/XMF6i0skRrVjL3SICCFt5eM+4IF+mFxlXhDBTPCP
         P3ZPv/izMHeL9JuRC57emurbXei0MjE8jChLXjRDZN2eG7ICaJvSjrKojIwBWXYBRJ32
         qCQGpczd7/up+na4pi5yeb4s0U7FfALbxZJP0MFGpqTRQSyYOi9rudQJ9w5WNzEhIBRC
         83X6DyIPA3juKpOLugdbJkQLOnI9uPzs1+9tgcYDT8KqUEPk4SN1pOJ68T8Aj0lVnvPV
         EZPC1WBW6y022x0lUvcr16Fb7TSbWWXYZjpH6Hb6ta4lHyKWXuWskAvcEkLOmetbM2qN
         V1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793809604; x=1794414404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LWe7LLGWKYiomyjVbfwSVUnBn5B9O2xyF6rgO4gTJYE=;
        b=Fv5WWDGfb8JququHBqMVuR+Cm8YSJuDyCLHgSSck3M7SsB9AUwsYAD4d/S/2Z3/TKL
         +RdHN/TGIrmUKfs94wx9YPjWKWH5Gr+NRz6fu0/fy3dVcrAJHzU9Bc5nalCsEYbhdjnV
         Dy/nR9g+1Q79Bp+NwrC2z2QRHsOTi8/UTxbmQ1tct9GEjF1MeaeQc6bBQfFfhL3mntia
         Vf1sxf3UuqcoIVTJ+JGOEM/UEpceC1ryRlbHWkPBRtLgLgNHvdt6pEgNSeld9Owvtf/a
         /CcB/pNo0EpeF6U6SB6dOyN4U7ab0c0FxuCMmCAqv/64wLU/GpCrO/OPeDx3OwIsaIrC
         bMaQ==
X-Forwarded-Encrypted: i=1; AKwUvByNnyuBGCWSq3bDyqEtaeVvh/UurCQOBEetNxzy/DnveYVVLyww0DuKjrW5zSX+E1I6VMotfxRSKt/EkPU=@vger.kernel.org
X-Gm-Message-State: APuU4Z942qpl4UbDy6JY6rS8lI2Kr0dqVfNZfqgoSeGNfQso69zgHIAE
	lMs2zZ5wbwwJg5TxDQXr5nGWViivOUJtdGHwa+uQwirb15pdQxuI4dGl+d+F7X1YmZT7ia3W7SX
	O6i+U0R3OyuMRUUqt6dYc5qx0GSHtPzBhCl1heMNnnorekHSWByZyOlc+A6EtpiYZC04=
X-Gm-Gg: AYBFou1S6GG8lPyrvHSmao3aSXxd69ZTm5D5KOJUayJ4ySJRXXEMm9lDOuJgTKUmUqd
	ur+k5vkieQe26+vNm+0QlG90CHrMran3DoCj8px1wC3agvCTnPiYQcWGKcnHh0DzdBwbAhPF4uk
	7CF0+8zYQxqJ+lZDrXLO1t8XTZfnB4NXv8CjluTPEpLHoT1guyv1puDuH+CJedhyXzom9t6gC3/
	/EfhvGdgRhAl4qKMOhIeMYAY0w4GMqnBAV+0qF2X/cgtGFflmJ2kt1tW9Q013PQfS1zLHkSe+Mk
	p7THvDJWvdYn4KOz0s/rzo10AE3PnNKh0vXKVxvqYSU05binr6HweU9Oa0FwoaXUxbuA4EdLdWH
	P+StL1nQp+Zu+P69Qh+G+R7UnE9yv1yK0vTJ2/7oGhIpQxdqPScmcvQLzJeHqng==
X-Received: by 2002:a05:620a:a887:10b0:944:2f1d:950a with SMTP id af79cd13be357-9442f1d9b98mr1690607485a.47.1793809604281;
        Wed, 04 Nov 2026 08:26:44 -0800 (PST)
X-Received: by 2002:a05:620a:a887:10b0:944:2f1d:950a with SMTP id af79cd13be357-9442f1d9b98mr1690603085a.47.1793809603746;
        Wed, 04 Nov 2026 08:26:43 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2ab010a66sm202596845e9.13.2026.11.04.08.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:26:42 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>, Andy Gross <andy.gross@linaro.org>,
        Mahesh Sivasubramanian <msivasub@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] soc: qcom: cmd-db: Validate firmware-provided offsets and counts
Date: Wed,  4 Nov 2026 17:26:37 +0100
Message-ID: <20261104162636.406949-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2844; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=041BNTqVKtRVarLz7gLjBUicIKRSya9ySTIIEff+L4s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq61y8f5KGGwYdjmdr7UZx5TKiyosF2uyLC0dGc
 YNg71D0nqaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautcvAAKCRDBN2bmhouD
 15dGEACY3PqT5ijuNxWF7oBmC+bqcGG2PADfv17EcGYLGIMSweTtp6Nl2C57Ewal4BN+jZDYhM/
 ACjh3y1vXCq7zTNBnvCDAwPmIpfrFlSP9osQd7OnO+Y2l8o7PKpSJZfsm0AWOXaBx5gs2JXdXnq
 HPALFWlHYKcWrEuzEGASjNyIPe8EnYXqAz7kzqcWNQ3cBhPb/sAsG00nW0BopAN0H4/iKH15aRa
 gPV30B/B7yWZeP+i/ncyHe+OGyYjaeDcP3EhO3iiHU+61VYcBbS4OcANKVqlidDOMHR5B0XBqLz
 xJOKmZdRUNEmdFVvXWUxjtBBa9uP+urBIyvgJLrYoT27epGFI48qCyLgyciE258hMPXL07R6Uar
 Ao4lbtgSoB8o0woGLM4KgWuIOfr9S/3huBT4Wi/2DX3jaoFdTWzOrUVEXNrXduAcgcnozi0RrDR
 okPMQRUaS7FgVom7cR3zn/uOLxNZiVrllu4CtdgHlo4YGbUc6P37IgIf24dsjPEmVH0NgBoFg8q
 xNYppMW0i2hOIEvjNBjHu0hyPiEzDKfxoxZEDUkBn+BgGQNgm/igq685/Q49x6Co/kTSINulUxU
 5Mav7LpbwOmVGJvqitT7i3klgfVG0mfOh0Uq/xNqs0gjtasEQ5NrlF8TOQiDyQdjruxpF7DhNuW +BZVPG70kY7JjGg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX6YnhWrMJbA6M
 Se5GK8UeBQKQVhsfkpRXsMHZfFmixgTu1JCtylQniumf6nR6I3kGrblg7xHlxJTsitlsDQKz1//
 B4T9xQJVzLQvNLmnzLNa2pBfZD74TMGc37E/7xekXvCdlg+eABQGnrmy5cxJg31Ry974mqYg41+
 sTPC2KUk6fsBsCwJ+3W7BjEDOABZbwLOrWxW5NDPBDZeBsXrypVr2DWEdS1aQ/t3Fs7tjAZLb8b
 tx4EsTV3jy0qCgr+9xesrkSDIR2+QfwQUK7Gbv4bTuQUAQbhzbSepg44ThEyCH/ysZ5LZbWDRXs
 UsxfN4lc93VO19ajIMppVKBxtX2S0d1yvxeZTMkdAH1jdcn2Aj4O7qNHBCFToU2SNc0Q2YZDumq
 /YzwvHZyElABd4nwwVn/Dl2PQj9Xx5ei2X5f+DQ1wnwRYfsq+47Xf/TWk+qj6mFLcR0xu7z4Svu
 DqOoEy6kay9vWgkbBBg==
X-Proofpoint-GUID: 86udXNpF_QJoAvHBmSKQ3LfMXri8aNxa
X-Authority-Analysis: v=2.4 cv=IcUSymqa c=1 sm=1 tr=0 ts=6aeb5cc4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JF2_t5xmk2bVYqND0VcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2NSBTYWx0ZWRfX3xAT04hc/DU9
 O7HtP7yajQp4rwuKvX2P++ko/c0Zw6ioTDZa+AOEBjdwNX8/43o/SsSGfXJERM280B1+HZFKu+i
 BXBdgHiDPzf/dVcDi9HbUxJ/z0WBXec=
X-Proofpoint-ORIG-GUID: 86udXNpF_QJoAvHBmSKQ3LfMXri8aNxa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040065

Validate the data provided by the firmware, before actually trusting
declared lengths and parsing it.  If a theoretical firmware provided
malformed data, Linux kernel could read beyond allocated reserved
memory.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-fc833525-3bf9-4274-8dc7-2cffd5b4338c
Fixes: 312416d9171a ("drivers: qcom: add command DB driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Not ccing stable, this is a theoretical bug.
---
 drivers/soc/qcom/cmd-db.c | 50 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/soc/qcom/cmd-db.c b/drivers/soc/qcom/cmd-db.c
index 5d303ca0dbd0..c75567cea086 100644
--- a/drivers/soc/qcom/cmd-db.c
+++ b/drivers/soc/qcom/cmd-db.c
@@ -338,10 +338,51 @@ static const struct file_operations cmd_db_debugfs_ops = {
 	.release = single_release,
 };
 
+static int cmd_db_validate(struct device *dev,
+			   const struct cmd_db_header *header, size_t size)
+{
+	const struct entry_header *ent;
+	const struct rsc_hdr *rsc;
+	size_t data_size, end;
+	u16 cnt;
+	int i, j;
+
+	data_size = size - sizeof(*header);
+
+	for (i = 0; i < MAX_SLV_ID; i++) {
+		rsc = &header->header[i];
+		if (!rsc->slv_id)
+			break;
+
+		cnt = le16_to_cpu(rsc->cnt);
+		end = le16_to_cpu(rsc->header_offset) +
+		      (size_t)cnt * sizeof(*ent);
+		if (end > data_size) {
+			dev_err(dev, "Slave %d entries out of bounds\n", i);
+			return -EINVAL;
+		}
+
+		ent = (const void *)(header->data +
+				     le16_to_cpu(rsc->header_offset));
+		for (j = 0; j < cnt; j++, ent++) {
+			end = (size_t)le16_to_cpu(rsc->data_offset) +
+			      le16_to_cpu(ent->offset) + le16_to_cpu(ent->len);
+			if (end > data_size) {
+				dev_err(dev, "Slave %d entry %d data out of bounds\n",
+					i, j);
+				return -EINVAL;
+			}
+		}
+	}
+
+	return 0;
+}
+
 static int cmd_db_dev_probe(struct platform_device *pdev)
 {
 	struct cmd_db_header *header;
 	struct reserved_mem *rmem;
+	int ret;
 
 	rmem = of_reserved_mem_lookup(pdev->dev.of_node);
 	if (!rmem) {
@@ -349,6 +390,11 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	if (rmem->size < sizeof(*header)) {
+		dev_err(&pdev->dev, "Command DB memory region too small\n");
+		return -EINVAL;
+	}
+
 	header = devm_memremap(&pdev->dev, rmem->base, rmem->size, MEMREMAP_WC);
 	if (IS_ERR(header))
 		return PTR_ERR(header);
@@ -358,6 +404,10 @@ static int cmd_db_dev_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	ret = cmd_db_validate(&pdev->dev, header, rmem->size);
+	if (ret)
+		return ret;
+
 	cmd_db_header = header;
 
 	debugfs_create_file("cmd-db", 0400, NULL, NULL, &cmd_db_debugfs_ops);
-- 
2.53.0


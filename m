Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794218859;
	b=g7u1w4JRJOkvdpa13tltvguRxeVozRiOhxvrmJ+AkWYSbC7KrSr4ANp/p5gKsIBQ4nu6
	 z/mZn44p39tyUeTKe1vqHx9i9RNpRt8V9fix/4rHk2pArGOcrEu0SbwnHJVY32vGZgjI7
	 1GFe4f64pLfSuGaL+pn4D4aWkfFYrezDYwYVtQr09x7o1js10XPgOmvttTHF/1NdZe43+
	 Wp/+sHYo3GHQda8XLJHnbTBjzAtBM4bKjeLeFO9v8yQ9hFsZnyavoNJpHp8qBz1kMW0HS
	 NQMc0PfhcTdZQEZ7NoeH8ODI1yOLn6eMoKU0FGtfyFCoAZR8dK3Hip68+a7BVsvAGjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
	b=MXrErv4c6ZJeoWXFj/YRoQ6VdqHFylIIe3bZdrvOBTPknVxiWnKLDEURS5mB+daopDQ1
	 +viggnY6Y6bV8+sGTSBkIjh3+Cmp6SqoU3sglS3xmU7Go276IeN4gVVA0Uy4T/vD3wRCF
	 qq+p7pmXR8tpb4ZJXZZ+lTuvGMTBorLTeMtubyHzdsVQpueXD30MmLF5xlUtP6vleuaZu
	 Uh0SLefRz2vo0Yz9EFCC3crP2ToMlW9dfvd/ojCetzrcM24RSldb8u9ZTm/ElFntLjTlx
	 E6uyUICu9/fmBFJQTG1Vl0ZorK6qsuhgWRsIRKP7XuRUeJMGxop8xZ7auTxd0q1zyLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpxvYk38;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEKGak7E;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535EC606D82F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:07:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 535EC606D82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BpxvYk38;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEKGak7E
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99un2S4077629
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=; b=BpxvYk38WwQFit5t
	MFSedYMf+M6QN4cY9tsRoTLUuEXXXias5NIYNgQDZSK4bjL9AGt9QMCGHJtab3tT
	kKWv7cFCV5TNdR0TcWWXQSUW3skkYk44cvXZAb0116+e5u1BNU4CENqYahNCZ2ji
	cUKyDGbgikgxNQ0kIsK2o4/cZf/KExK8EdAZjI9V5TgoMBv2Y5BvkEP0lQvaT5Ic
	ZdcVD4VVLybnO1Jp7a6gm0zL3lOQ7hvAD/AAVb3B/SD5cqBfImo61qjJv8k8ZzMv
	qmAKRsKYbSP3/zQejqt9G8pc4vkwDLpHIc6h2rUKD+ndJqJA5ZGplkMvz6Sj8Yy3
	X2x+Lw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735s2n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:07:38 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b0a13ae043so1017228a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218858; x=1794823658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=PEKGak7E15b7Wq9s0ogKhdVyAbs2rNjvAA+IHClrl7uUbKJAeSMkqbHMHvn9M1L2K1
         ogHFj/W7dwTBOPZ3+Ow9XViTyhexsyA+lY12+duWrYrqPWo7NupWZg0MQP+/FOSzacQm
         5DrKdb9CRAuVqS6U7j9brrV29aaaZ9wBIqAnuPddlYOnO5cIBi1Y9usMRDRWOQgOgBDC
         LOZn0EWKYDc3DDBq6YjPkm4JctiKN9kI1Woeg6TR2akezRXACHHRBtCEsH3Jg7W01HL8
         zvhi7AHTIlmkt/lodrH3/vFdbTSv/EcUz/PgeWozWbmXFwpf33bExAe4jfEZKFHI+2jt
         V8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218858; x=1794823658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W+wg/a5ZwgKKNYYwS1Dw3dUpfSu3d8rfLf+UvCUK87w=;
        b=XeiEMOYwTXOD3NWMjGf6LDNbl3l1BxZG1ewky2jIeDRnw28apy4ej3FQ9BzLeZ7TnV
         BU03ynU1VSOsT5ZxX4TjNqfDENSR15MDGeH7F88cY5dsoPx7tcl6DYen6H0WWJNN+74t
         C7h49U+I1jFoabXeo8mVuzK0IuLCzhZT92rWkMBu1CCI+s6KWXVQ63i0HxjXxCY3n5My
         NtMY+VDSHgWyro4zG+Y/NqQVvtNUcdmSkA4M3JwTCTVw9Gwf2J/JOpGXmGJpbtVsoMk7
         iJz9nCWjr3RkwqIag0wSSF9f/dHBk2GP/hsOHkb2EJuNjzbcUCEqrItL7WZDBVu/crF3
         CNtw==
X-Forwarded-Encrypted: i=1; AL+hErGthlZZrsofupOr/f/c73XLcgACwtilf3/mvN4vLDHrQpCFqO6Z9HpNTd2SbuC/B44DpdbC+f5W2DAiKXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qt04u3LNay8vMEvh6O66CmSmxsrCJOK82Mrnx+eXR3x2dVB2c
	xKybRKc6GpZ9k/JQfUHnLoLmAGsq+PQY2bhqWTrbNXnv7beIz58i9ULk2HDvoh1QnoNxo5025Xk
	qmS2SCGpJX+YzIORGLuFdNzC9jUUCQVCPFKZPNwAt2q407AqMQkOva+fbBgZSJnuVVWQ=
X-Gm-Gg: AYBFou1q6TDIzMCt1ZrwdvDO5ycPK5ucC41HInae6UkUkJ+O3V4YygnhjqFiKEVDdWa
	QuB3eBrYNUiK8955MQELWisOYn+9VTpBSFgyYztgTPiFhNTCnM8pKm/75nuHyrMsIbHSbAJ8wI/
	saj5MraD7ONM/N+6RaD9OWwegv/cnTHX1s2qO+3KX/8zHN0oO6UDx7vbPvL5hgVfKIi1jsibAFX
	0NzVn6HaUQXAPprAlyDEPXeHLXC7xIudtGK6qEV+kLwHrP1qET7E3iZ4Z1d3iTHvAcIiX2XhjiG
	sj8S8y6YDI6TV9RPQ6PjJ7u3CwDXaGJfSzGVToT41nPN1Nbo7rUkgcuLX/TkGWQ5biZ/0l5g7Ss
	yPRxlKZSmwu7JRy1qOv9YFV1K/zOCJIhcJFq4CvjYvehjZx5mp6Hkl2a/9D5urcML95XN4+ChHx
	sD/sIzO0V/hsw9lBWjkUhVUU38JWpr
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421386a91.36.1794218857984;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
X-Received: by 2002:a17:90b:4a4a:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3b12d4c6db8mr3421362a91.36.1794218857503;
        Mon, 09 Nov 2026 02:07:37 -0800 (PST)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1054a53e4sm10034531a91.0.2026.11.09.02.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:07:36 -0800 (PST)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 18:05:35 +0800
Subject: [PATCH v5 3/7] dt-bindings: arm: Add MPAM MSC binding
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
Message-Id: <20261109-mpam-resctrl-dt-knp-support-v5-3-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, Ping Li <leeonion.muyu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794218816; l=3700;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=e/4WBMxVgry2cHgimqp2+MIUEtdd8lkn+3G7LQuRoRM=;
 b=f7oXCWEU+g/ZNdVHeD/l8+NR/IDH0Sl7swroTY77eRl2qzAAyGazVFI9LO/ffeLo635HtNwpP
 bhjjbeLvUOUB7vajoa9VGVl80HYysz7epaRiuR2ArhXChsm7QQ/KZhH
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfXz+OQHbr208pk
 xsJzJvs8E5aMqGQEHAaXIT830X0t4zBv3t54G1NVd7E49gYV49tIM7a9vczEsYkCt28F0xiFMHk
 sjW9CnNORlqbWwyeuaHgRWOanIO6M4xOJIR/g7ZZENqmk7AytUY2vf11km5PuuX3TcZO5B8q3n8
 b2b6q2d71jo/2TZHAc1pKYPqDhWvBZWdimahkg7hMsu8XxqxSfJWK0cw73bT+f9XKgqnwJkQ1iF
 DxcPIK4lvnOhDEQ2IEqJ4iA8qDF1CIB+2dDerlThL/+yIZHPEDb9QDnqSDWYfOn4uID7YaAVGsT
 VbnRizT53UgRIRNxyBOyVBFy6lNxkMk4DFZTHPRVwihrqYpQJgAgmVOjwXIGXrW5QDgwhm5eNO9
 PMJ0JftPSquuq2wamIXVIqZtc/SXHH7bzcFcRM/2+ZJhmTD6cq6tPbhYTEcwqBJpdB30p4M2A4s
 3w5/QMbtGJO/xLdl6FQ==
X-Proofpoint-ORIG-GUID: Oop7O8gdkkOfwjEC2LIqBY4JaR2kn3Pw
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af19b6a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=UiIo4169r_Lw2UoxLg4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MCBTYWx0ZWRfX9NjpnQp1YKDE
 svRMiK0D9fZPSVjt9qYPJIn/LUwvv9BZJoAiVmkdCzPv1SB6QR8pa616KK48An7FC+Tfb37vSDf
 N9aEph7lISoSc+nN8y+YaCbNHA7tjTE=
X-Proofpoint-GUID: Oop7O8gdkkOfwjEC2LIqBY4JaR2kn3Pw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090040

From: Rob Herring <robh@kernel.org>

The binding is designed around the assumption that an MSC will usually
be a sub-block of something else such as a memory controller or cache
controller. A memory-controller MSC may also stand on its own as a
top-level node, without being nested under a dedicated controller
node.

A key part of MPAM is we need to know about all of the MSCs in the system
before it can be enabled. This drives the need for the genericish
'arm,mpam-msc' compatible. Though we can't assume an MSC is accessible
until a h/w specific driver potentially enables the h/w.

This binding covers only the properties currently used in practice; it
can be extended as additional features are needed.

Cc: James Morse <james.morse@arm.com>
Signed-off-by: Rob Herring <robh@kernel.org>
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li and Huang Yiwei: use oneOf for the compatible to allow both
  standalone arm,mpam-msc and the two-item combination; fix schema
  field order and yamllint spacing; reduce to minimal binding covering
  only properties in current use, dropping RIS child nodes, the
  explicit arm,mpam-device phandle form, cpus and interrupt-names;
  replace the memory-controller example with a new top-level one,
  showing the MSC as a direct child of the root node ]
Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/arm,mpam-msc.yaml      | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
new file mode 100644
index 000000000000..b52599b47a1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/arm,mpam-msc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arm Memory System Resource Partitioning and Monitoring (MPAM)
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+
+description: |
+  The Arm MPAM specification can be found here:
+
+  https://developer.arm.com/documentation/ddi0598/latest
+
+properties:
+  compatible:
+    oneOf:
+      - const: arm,mpam-msc                   # Further details are discoverable
+      - items:
+          - const: arm,mpam-memory-controller-msc
+          - const: arm,mpam-msc
+
+  reg:
+    maxItems: 1
+    description: A memory region containing registers as defined in the MPAM
+      specification.
+
+  arm,not-ready-us:
+    description: The maximum time in microseconds for monitoring data to be
+      accurate after a settings change. For more information, see the
+      Not-Ready (NRDY) bit description in the MPAM specification.
+
+additionalProperties: false
+
+examples:
+  - |
+    L3: cache-controller@30000000 {
+        compatible = "foo,a-l3-cache", "cache";
+        cache-level = <3>;
+        cache-unified;
+        reg = <0x0 0x30000000 0x0 0x2000>;
+        ranges = <0x0 0x30000000 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        msc@0 {
+            compatible = "arm,mpam-msc";
+            reg = <0x0 0x2000>;
+            arm,not-ready-us = <1>;
+            /* CPU affinity implied by parent cache node  */
+        };
+    };
+
+    ddr_msc: msc@40000000 {
+        compatible = "arm,mpam-memory-controller-msc", "arm,mpam-msc";
+        reg = <0x40000000 0x1000>;
+        arm,not-ready-us = <10>;
+    };
+
+...

-- 
2.34.1


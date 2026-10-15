Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B04B4A2A5F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048549; cv=none; b=KK0HTRSrv5o03dXocqb75H2JmWNnsT2bkP+lRzLJRxoYn/DcgE/bWNNhQlO386+AtKWOz971UhE1meGmaQKUvRL9G3xN2ham2BzpDuCeZSgX8NfAtrJNsNXh0XEyMCeYQSo7UFXO7PlOoY9lsqjikE4yfhGtuvVW/eEbFD4fw40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048549; c=relaxed/simple;
	bh=fMCM/EJ72WgLCh0VQxXmiSA4rBjnJY2LoLwbQn2sGtw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TkCNmZrIn6PqqTtjzy/S4AqnbHKHb8xrBkOP+3aDLzaTw9HB3n5toGGdkMvscs+RZBWdI71v2Qe/KMvgPNnwW0kPwhE4NXXmR0Kh/nzCfGFmhgr64Xqo9RM9V3z/VJiljphI8pbQz5YbDMNoo6hc9VHGFSAlRUq1VluSbx/i+po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UNSVTqel; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gS663qyl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UNSVTqel";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gS663qyl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6wDU71672259
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=++KZLL3kpeg
	YS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=; b=UNSVTqelSyqVOBQckw3fEUzRYQB
	f+ClcRa9QvQnS9Vzu83wyNYRn7MTAzhduvcngPFXgANf9tzGivSmH6ydVibmTbQF
	7Q7oLaf9WBdUCvs32oJ4L5rq1yxx6xf9kFBLAJBvA86JyIpMUKmPsjmTx2TArH/7
	nPtgDffjsV7mlAotVvdhK+wmJtiClc2fMHm+CZcFt96Z0PlxKszPzDCLv2Wcupkd
	atPH2U+o+cXstG/Zm4S8IMvdJ1e8dwcTZVoDP3sQUYEHVf+YXISSNy+Db+tLNp6W
	W6hyN6KnS1A4iFk14wkvgkPsZMRN0yPn6ZbMLynrs+ymf+2SxlZyaqQbUdw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrhb2vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:15:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so2596567a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792048530; x=1792653330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=++KZLL3kpegYS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=;
        b=gS663qylTgtzYb91QmfMniTH3ZH9VAaFHlhPAvHx75EhPiU/RUzSf2l1IFMjxzCPn1
         b4Lfux0it8ALzQ+gWlHZPNUhQbNl6y8ir6wxUGW8TVh630ZPt2N7rvcnrHIFh10oC+cW
         Jh17ujXModb1fmYvwB8TZidmo7/Zzz7jezscoaMZRm/3bc95D/9/ESzfmFLtFgwA33I2
         1KlWwiYTEuESwU9frbb8hEW9UBXsX/bLcUBF13o6GdWqiI/HLwmyUgymhCr1oSpkn46a
         MWT11EBfFDxBRk/nuuy7bV29OOcNyPVyFeKB2dnA0vaitvo+AKnBFrLszOcnSIE3A8IT
         Gi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792048530; x=1792653330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=++KZLL3kpegYS0V9HP0IjvHnsmw1E79JdBNilYSKGWs=;
        b=KKoQQ1yWDjyVjQNA0XuvlkiOa3Tl3iaxZAn4jpPpzfNSl5WR4PGcXyF0Fq2Mp5Z0E+
         KXpy9dhzDBRgTk1PlzTcRfObig/3vgBOe6Lp0tYnej3n9bd6fOS+GnwxiJUOyM8jKp3R
         1c2vq5C9hxswqBvWir8sQLkeQlyRnMWKSMNMZF9vumLzjyySCE/1UXxgDnt+ez43D1uu
         DRcwls7uW3KsQ8Sb0yGztRFDWY9+gO+IsWDsUpp4SopsHtiCNQFOMZi0AMgWoh7YGfsq
         9iRCdtJJ53KeECXbPff4jXcPHBrUF2865qoYFCFqYZ7tFWTD/xA+4pL2efR3wEFK2BJt
         x6UA==
X-Forwarded-Encrypted: i=1; AKwUvByw8Qr8AEPBx4mkn3c6XTw9QFe7mEAsbTsjd7AHRQhwSXd78lsOrL8bnQnvZciCmVa8A/9UlOhgFjPgGUk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPZa2HjS3pItQ/8M2Av5ABrUmnfL69MNs6vkiGpBr2iEJRYebi
	O4/okwSm6Ax1At7fkoMal9kEJLNCbt99LjbF7BdEZcOImLWOYbknbc/l/x5ehq3E5RFDs6GfF+s
	edQnVY0tGQ45drkIwmTKwly+tb/pi6u8zfC5dHZ4BDQJPS1WMrnlD2rBdy/fIgI7g8ow=
X-Gm-Gg: AYBFou08TtZMuJ5Wr8qlXyX96vofY5ZoasQbPIFzKyztjzo1dBBFRDdlU4NJu60eP5m
	UzDh/qBPtX9xtZrf4bzpzibjM48db8BaBYMXLmN9XJ8RmZvDWguFb5e9AcrFmqK9HYmzcYAD2oi
	7ZxPBcUxwnj4U6DGWUWiEoHMyHmwFldy6RfeFMPil67ik8kFSbTene/8aM9UYw7ar3PLJm3f44d
	X9EyytkV7ThsciXbW5BNIrobZi1Z8NiRk5MSJ2dxD6D22kVNtT7P1wBS5Vvj+s11/ov4MndapK/
	3fuUzK3H88dUPpbO538Bws42B6Gk7mENCk8xFAq2kN+Msb/V9XyvlYuRivOY7oGoCkCYxhLUEyO
	a+HNragA+4775qKYAk4nGV4wwz3Qel8FRD0jH7n83qMK11YzcmmnjwN3LN/5+b6WIlcr3yKlI
X-Received: by 2002:a17:90b:3d4b:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ac945c9996mr1593997a91.66.1792048529521;
        Thu, 15 Oct 2026 00:15:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4b:b0:3ac:945c:7f69 with SMTP id 98e67ed59e1d1-3ac945c9996mr1593971a91.66.1792048529040;
        Thu, 15 Oct 2026 00:15:29 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944511c7sm3223475a91.10.2026.10.15.00.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:15:28 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v1 2/4] arm64: dts: qcom: glymur: Make the ADSP remote heap no-map
Date: Thu, 15 Oct 2026 15:15:09 +0800
Message-Id: <20261015071511.977-3-jianping.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
References: <20261015071511.977-1-jianping.li@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Xm9gpMP2i6cIPAWnAA-LC-WYvN0eWKNw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfX1LCe9hThhAmj
 bvka1E7UC3w3wDFSQqjbXIikzR5DGM7Lh7DHogmPKcNIwTu0jMnlxgSlhnnOEGeX2YAi4bF+Y5c
 4zWSTFmMPXDCbjh3dExBWg0gadMpmSg=
X-Proofpoint-GUID: Xm9gpMP2i6cIPAWnAA-LC-WYvN0eWKNw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyOCBTYWx0ZWRfXwpuuAe+RiYm4
 QJayvg0co913xTC3BR6XtE5NVhEN173yhbi8NG4aix733E5BvXfCVP0ZT5AN6xpMh2bvWEeIccX
 vo5wjAfXYX1YSXCJuu+GknVmiZRcMq/5HeSXH2EZY/L89uI18VrIBg9qB9O8dIyaa1m9rSLB0HL
 O9K4QOcAqYcbPGvRWBcKuYTo3waN0xhqZWgbWgiPMirZAIlpnI/2P2/3cxlBmQQMIW/KbeW0fGh
 vIpcF/G2JFEjaWY7WfhiMG4Wgbx3TqUcLZ42GoqaL+x/H1Wihi50WL7JcXCN2F4CrDypi3fThSl
 I6o/0Z3q6zMRn4ReM/Ks4bOVXTNWJmQd1k6tE0k2RptKWMyjqm8jEKCxwQX3deN7QC8HBFRfXho
 TogMDQscG2NkZkOZK9vkYEMRd/5nl0XeObwD0RozwllXEeCoozLgEPq+oNgCR0rtuBy6EaASLKQ
 I6hel6qnVnBFtCM9ByQ==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6ad07d92 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=CgcdhG9ooiE7Jmpo-HsA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150028

The ADSP remote heap is declared as a reusable shared DMA pool.
Allowing the kernel to reuse this region is incompatible with handing
the entire region over to the DSP, as HLOS allocations may then access
memory for which HLOS no longer has access permissions.

The same configuration has caused synchronous external aborts on
other platforms when the kernel accesses pages within the ADSP remote
heap.

Replace reusable with no-map to keep the region reserved for the DSP
and exclude it from the kernel's standard memory mapping.

Fixes: 67641246eabd0 ("arm64: dts: qcom: glymur: Add memory-region for audio PD")
Link: https://lore.kernel.org/all/20260701-glymur-audio-v1-1-2c3862d95a09@oss.qualcomm.com/
Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..4b7907cf9c82 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -690,7 +690,7 @@ smem_mem: smem@ffe00000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
-- 
2.43.0


Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63344F563
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791960081; cv=none; b=JkZZ0v7Xoa4hbVESwVs/8yFt1iAjHO3TosrckUdDT8yEbqKwJcwKM0CqydrRgrcvJzSmTHhcJAba8NqYFTzpbGOBc+5NEOUR8uwbAdTR6zuAfa4uT9VZzqW9HH833Bif6QOcFhBBxVEjDoZFwLDhDyWrFA64Qi5YYtRod5oF+Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791960081; c=relaxed/simple;
	bh=JEjls+AUhDEBzSl1ZPW4WOgZahhSkF3N27UnRS9UlAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2bP6koZwq67lA286PzlQwCz5J9zEQ9P0YUVXjbX4P+F2dxwx0Hf7q33ak70xMQTF+BKTaV0MjklqdwQRP0OU8m0hx3aKWAMBdOiHts4chwMBy9C3SLr0IMVsykZ9n8NcLjpn/CP4n2IYTC02/x1gSdeGQbqIDL4w6UU5BflQrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BvDyXmu6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UWbfHBKr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BvDyXmu6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UWbfHBKr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E3XW2x2222162
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xwb4/DRPYW+
	UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=; b=BvDyXmu6DqKr7z3izPuxoJAp/tS
	zJcl+6ODjahf6UxsBFJGeMSL0xRIM/8EX/+yOrkpjSFcMngpIqmRPNzuYqGsZ0oi
	FImenWl+w0sgQqkNEjl1LbUlQMp+PcLjfOnhSvSGnnj5iV6z6y4fXg26InMPxtBd
	l8DmHU4wbqE+ZjpURmoE54RyB9KfT+bZyKv/3Ff/wp8JktgNc2w5Ld1Oxiiye0K/
	UiIMzhL+UcbpUdzxOe1NybTe0k2A5wLjpHftdKs1QD5/oSmhrkJ3cFoKwE++5kkb
	3Cli7E25KDVwjS0dOov2SchVrcDr5R7iAusFIS0EDXJNZeYejWKE9PWhLYQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsa5q4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:41:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88d2d26a8d5so3630186b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791960077; x=1792564877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xwb4/DRPYW+UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=;
        b=UWbfHBKrH9WONMvovHR0+aBk/FVmMm0GGIsagKob6vdS4MIc90wCrcs1xVbJ1jGJu3
         IWAz2ZZgmGztsI+gXTUu2CYzE2KaEVHsxzRdynw5qdxVWanvJfV1ns2KpP9PtaY5z7EE
         vGnpidzWn/G/YF2EUfLYKVGRVnC9kd1b4f+sfaIOWrrSawTjKtaDtxegCD1GFc6jLkaG
         3XGSTSUjpAKCrU9rCk+IFOLIiSnWQDI+uAp8xLUiTDCSsgzQN3fF8MRE2W795yurEzGT
         9ymYYZaWKEstoTazy25t/VEKQ98GqsBDJRYImnlzXshkrzt2UtZSXGgo3hsJY5dhBafQ
         sxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791960077; x=1792564877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xwb4/DRPYW+UTiXUpVK1aUHLPNY84dNWsJVEprnWpRM=;
        b=yZ1op9QQS6CovgSHO3wzfoNxwD96lcDccvpRt7rjhkvf0X33uFChxeir9Xih8DvDx9
         i+m6T2/0byvINms1Gg8W9/dXJWsPz+nYSudnjiDgI4ddqMK/eNN7VChk6ExYuzJZ/DML
         q8Yje0+Xqn+8kj5PQ7jIUnXhNOHz7X7S2/zpantlWte0zrNfMsKsX7Tzwmmb2yxfXmE0
         SRiXhcDoHwSNTzYLsWrxgyVrkcpEHGOMnBhvNMVgGEUa3RlNG33CjMuan15m52L3D7On
         M9XYyPEkUa6whusnum6wb9CLhOn4KMT6aHaEss2QUwIdtqkrAKRNKiD3IVleR2xGpaHb
         IjxA==
X-Forwarded-Encrypted: i=1; AKwUvBz9bCeMYPJlhJ+ukmp7ToAmB+TNM4iOBciQAJck5YioLWfHsPPnQ+wPoAoMrVKAJXbLB11mJK9xJgNsgGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJA9U+Qb4MXlPHBYAKmTWjf8/XzocSzQgorih84gkp/uZEMSNYR
	fCkQtpb9C5jdxWBmsXdX1QeeJ0dbhWrKyJqlHcEFTp/TOzTFla77zoSLFvY9IVnkMGkviVfTqMG
	jQWxYkVltXhBGyBGtbZAba5fbOUnVGLo/H8gXMqSQ8JJx+0AWrjitomjuk/zHVCGA2W8=
X-Gm-Gg: AYBFou3Nl/Ixeq94tNm05iptdjigfyQCj6ZH4QkZzMxTALU03/to/bbasFNoI3dqAfz
	+S14bUXxVc28z8+zhvlgMCzzKcEAg2mT0wrXZLTti7jl25oTXX44ejcBhCisf756sizQC+wOrTn
	/m+Kn2uh4MUVN4XLRmzfFLnnNMYM3+qWRSeWxSYtWnugm56pKbB1C7LZnRgGeLV/O0kCJJktPYX
	gI0DUO+G2N4Q/jNhKwhG+TenwabAHVjozePe+43vq2yr8htU7/v0WQyF4TbOEUtPyfRaTEvgX2M
	KmmSeccuz1B6os+8pzP4lYdfgYnSsYKtWdsYrdu1Vux11h8a/7lanrif7ifPc9bE5BkOv7MAadP
	QjcBrWFBx7lYkE/sUR2YfW7deJzsqsmgdPO10bVFd5swSN+UMnMW1BgsTA6w=
X-Received: by 2002:a05:6a00:7442:b0:880:8fe8:a3f5 with SMTP id d2e1a72fcca58-89695dc56camr7771648b3a.22.1791960076809;
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:7442:b0:880:8fe8:a3f5 with SMTP id d2e1a72fcca58-89695dc56camr7771625b3a.22.1791960076334;
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d7f518b8asm733221b3a.2.2026.10.13.23.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:41:16 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 3/7] arm64: dts: qcom: nord-rrd: Enable ADSP and CDSPs
Date: Wed, 14 Oct 2026 14:39:48 +0800
Message-ID: <20261014063953.549379-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
References: <20261014063953.549379-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX4Ar4YBQLGPbm
 GUW/NnjfcHf/cLP7d/B63iDzHGZWrCFldnr+pwyMvmLyuX8ppgVUrjhxQL0P96fC8CFi/Baz3zg
 qKTHTExkR0iPKVuN+SENL6bI6b51D25zOsRCE+ABNMrxWhPDHARYPmLszeBw8dBXRBoqNydc7Er
 EUpwXVLT7hDXaHe0zDqqg44nBAn4wpYo734lbPLzxoIvDnzhwATwx/c9B+WnabSZCv5U0odau44
 /hCQ66MmOEg0BDykKnPdvOsK2mKyG36Fseg0iHN5JfqUaliCbLHSLp4V235HLPDLgl3VRAdtNYg
 T4j7iGFZ3/cJ7DB/KlmHjZ6A3ViPCUlcuQrziUhmEfEa83s4HGsMIrOKi7Ru4jxib/a7cx+Hf/H
 ysOPCXImKBQ7DqnmeRn9A95DKUv1fYdzGERnZrK5FZBuaYqHSZSI7BR77ScyL7TaUOnQuc3xOYD
 bJZxY6B9sFYXMetedqA==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf240d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QMtlPPnfQmPOGJbtzYwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAyNiBTYWx0ZWRfX4RMPvhhcHF1q
 YRmtgVBJowo3+KM9jHswV6OcuYRT5uTrsGMd7nCeiwHxTVdbKwy2P0luBaG1OZ8tjQlteRTTtlL
 bFTOFSC2eDkUWRM4XYKANkkcbWor6vk=
X-Proofpoint-ORIG-GUID: PhrWh4aA-6p0Q2FC_Be9ZTdKgRpoJxDy
X-Proofpoint-GUID: PhrWh4aA-6p0Q2FC_Be9ZTdKgRpoJxDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140026

Enable ADSP (HPASS DSP) and CDSPs remoteproc on the Nord RRD board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 35 +++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 3673003c8b21..0b0acd33a2e1 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -393,6 +393,41 @@ &qupv3_2 {
 	status = "okay";
 };
 
+&remoteproc_adsp {
+	firmware-name = "qcom/nord/adsp.mbn",
+			"qcom/nord/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp0 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp1 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp2 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp3 {
+	firmware-name = "qcom/nord/cdsp.mbn",
+			"qcom/nord/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
 &spi16 {
 	status = "okay";
 };
-- 
2.43.0


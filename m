Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6363DAAA6
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792307838; cv=none; b=R2+r5KR1lqaJjGO77as2PTIFceVW/PrHseKM2iI9F9nM+497wwU3z49RMZ+jdztSTwa+TOSttaaC94ty9FtjL0t3lpqdsFIHLO+telNE5vl9EEHaRDTqqFw8L05KDbpk/3HjJe9IFiwYxEw5REcUFlqru0FjtjrwXL4tPUpmBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792307838; c=relaxed/simple;
	bh=ms71wKN46jx1oVrs1DdtFJngmBDeqxFXGYDoL9en57M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KS9B4rwP+30mzFm905J1ePajT+L7AvbYA2oRdZqsPqIQUV6U+wFg/uFwgUUcny7JI2SD6FEThOLoktzeh/yH2IaGkhcUWOS3tGKHdz/4byi+uCOsfYQRZhpNFTXQvoEj3T5L9XYy0f7aNE2hcaHjGvdB3Nu0/ubeKYn79wcwjb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N2+fdcr0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BtZzgsLF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N2+fdcr0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BtZzgsLF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69I5suvn3168734
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=; b=N2+fdcr092EMYViA
	8Wtc1lgI+fjDXJ6WOM8fPMK9YHZijx2GBBapioW3q2YxjsJNPKVSRqmUdwZ8w74s
	/ur8J35U/daYZMSJijP67BU+75gZopfhCWqDxClhScd9IsdESB5DAcdaX/a+Rv0v
	T0q+2lxOYkSLFgZRD6luo9R2MHKzHpznLwxvK8uS5LTIXE4UI4a+PJY7LGHV7Po6
	T8NGgo0V3Ajbnd/fZpf3YkwYWIRfN3+JH47ta0SGwGSO+bXLeCMLdflbRdZtCIx/
	w12rLSi14M/SQ/hZ6+B7VCAUVJ9YXABuFpu4izxw5Bslk/GZkVroreF6TuUWp8VV
	DaZDwA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc183akt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 07:17:16 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso3365881eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792307835; x=1792912635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=;
        b=BtZzgsLFoqDapOYRP6ZdVJBJ09uhCuwGvguiFM9yMUi4u2MTxh9OEcJ5a0RpxfbIby
         sDp7vz4sHIjz7xzdrM0fw7ETu//s1rlmF72UvZbcGHT0pOW2TV2cEUwuS1KI0kPn48e6
         3JoJ584fsHbX8MW8fn0IRT170nYzV33bwx2xmwfx8wtw9lYjx1i6jSW50C1bsETdruEp
         SNrYwISVSlsMZLA00ampawigjvu57jxzKbyNRe4KasuZDGoTCGauGXjsAVWWjZowgPpd
         D5rt1oVp7+lUyS9w32OKH8sOh1BnD36GaRKG517VX4oXqaURADCDoAwN3LUuRIHymIMJ
         d88A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792307835; x=1792912635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ygf8X6ffossj1aI4TsRytKCkY0uZ+PHciaOL1GWigrM=;
        b=ehBhrN6d/9BBrmEmEGtFJd0Mesqi4o6xvkDTasG7GusuhcRdt1cS1Gbs2IZSpcnZRs
         PtdjpT3wdeVz6reHPlIgIHYnMEsdKb7Kgcz5sf8IkAFzjKSQJDt8rzd9VFMaPz6dcXjH
         5Vyvi1KOEkNkTddg6vEhkmvBnXGHwCAEePbrhZVDnTauwx4HQlFBNNGdy6SPMMgsMDPE
         9P19AsiXyZsD99YGZCfq6pqkDVrMzJNQRWvwcnjXloDtaFHE7bWaJTFFgg3Yh4NCp8Lo
         IES37dZmRNx3DKZvTaqtklTEcSpWklwQ63hec+CxJbZIPu9nl9WfhJzCyEKZHJ6DX+ij
         Ua/g==
X-Forwarded-Encrypted: i=1; AKwUvBxUaiIy7+JaWoQHLRExgO0S/9Y5GbioNuY+QqzSxxVDFs3x/WTmnWcXjrMl6LhFM1MWvmeBadmgq9Am9x4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXc4D+cB+ped6Wa7SarvFTy+dFZvNsOZvRGevGBk9HgX76ciG6
	AMg60hcq+jJA0EQTrx1QdshHt/q6BU9VQX+KF7nD4MnVGo3U2WIzCmyRZ32sW8OHuCgUhhes7bZ
	YuiOrWdmkk6j1w+pbHl/LhsL1kcPPXZ2IAQi3gdF9zAl6x+EXwyiEBuUS6EhVYo0J/vI=
X-Gm-Gg: AYBFou3FxqwiuDfA5O9SMuHFZw3B9U1TFiyQknHOiHV5ZejQq1xrDXLwzdPRYPDlHMB
	SOZOBwA63CRvMJFPjGdf4kXI0GYC2EOfcIHJgxB863TLhL8zrs1JF5tDH1fZ/S+D/cXhuyUPW+f
	wNfbapUiedL6PJ9NHh86mK5CMggLkpBwyFXeSioayCaAOR3cMmzKjqSmW3WEZHuUudJq5pnhYp7
	GwUpqTpfss1Wh1orJt4zHrcA7/Sonm5RhcNxqCbHeRkmgmQkEZxALZN3pe+FuJV7NvQ4R3ROT8G
	8/fUpzWh9cPt5W7FvcoAPKPIjHM/UPzDvcAa/jxgeKtoPlkHb6MHEDRa3lRarsqTg8wqdky58rR
	Vy35ytfdskC2o9JSct+ZcbyTcX3j04pyzX8s=
X-Received: by 2002:a05:701b:42d4:10b0:183:388f:c653 with SMTP id a92af1059eb24-1850fafc54cmr5788323c88.7.1792307835465;
        Sun, 18 Oct 2026 00:17:15 -0700 (PDT)
X-Received: by 2002:a05:701b:42d4:10b0:183:388f:c653 with SMTP id a92af1059eb24-1850fafc54cmr5788293c88.7.1792307834812;
        Sun, 18 Oct 2026 00:17:14 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm18646776c88.5.2026.10.18.00.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 00:17:14 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Sun, 18 Oct 2026 12:46:47 +0530
Subject: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
In-Reply-To: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfXwZBW4wspYPX7
 grbKbOn0quqwRvYwZKONZT1Fj5tbh3peEGgOMgApWm+XM+bSfLpQUC78zxzdgnlCtRMmFgOHzpz
 SU0EBwIorZMgQI5CkIpxh9+PItzKeuA=
X-Proofpoint-GUID: j0iDWhTpzZDS1LrekFJy3WH55jKuD5Gz
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad4727c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HtUtNg7S4ek9MPr1-YwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDAyOCBTYWx0ZWRfX4SkN/VxVLJtC
 AhoVPYarIeitV0n2zlxcgF3AxpLDFOVBejnvSUx/QHzd4VwxR7VtkOY/1Zqte1f+r+H/RSms8+8
 wmf8LpFTvO6TJbLISCuDjLJv+ntBtAs33QQZ/BzD9wGQ+gQAIS6oXIDBftv1O3DD3jnNF9+q38L
 ZqWGx+mCJ8ce3NtdB7vkqtRidNaQ/zqzzfvV+KfxvvhhTmqCRUKPhHJAgCKem71MXuehtgB4zSx
 9CGOAtCwEHMqSym3NTPHsrajo9ZhVPEbdLKeloPMuo4eivl2R24DIipk4ygKTe6ZddxZ5NmFkAn
 a02FTWN2onOtKZ/virO7ZOPWkyaMn19vh4v0HX9+Oaao+m+N7cXOryLlP7KDoV1+PIwAQVICRVg
 Pj+myPWUHYbdYjL+ATJpt1U0BrUH8eztAr1BrwVjaPVyymwR5z1IaospeDkk8zoMBCJ4bArSDTV
 KxyBZDxp2FU2LoWR9ag==
X-Proofpoint-ORIG-GUID: j0iDWhTpzZDS1LrekFJy3WH55jKuD5Gz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610180028

Add the SoCCP remoteproc node with its firmware path on the Nord
RRD board.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..89f8d36ed812 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -434,6 +434,10 @@ &spi16 {
 	status = "okay";
 };
 
+&remoteproc_soccp {
+	firmware-name = "qcom/nord/soccp.mbn";
+};
+
 &uart4 {
 	status = "okay";
 };

-- 
2.43.0


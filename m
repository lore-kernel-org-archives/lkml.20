Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577947;
	b=toi4d50usQgKd85tvs1mKwhyTHB4YFPt1DwhtrpT+1Ftyoy0M6ICRYfkMHhUpTIzPwqV
	 sjdsndfjvNfKh/U4EWDWMte43AFW3LH18NviQAkqM1Lsv2GNGQIGx9j0NXamIoCHQTPlG
	 d33befGcvizQZLwersjWxtAhb85/8SRid4VHdMnXPXGTc7rnTdgQGEoYhZS/S6awaWzUk
	 gyOOF0DWeRhzww/nxySalE21XYFILKQkp33/2ob0v+TFy4JboTHZ6ELFgXuwWz1WnYbDw
	 Th8JdigBIi44fN7OOnXMe2Ca4CCBJxXaeoprvnEyr0a14F9Puo41+T2kL/SaFLcG8Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577947;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GA5PsUYzNPSJmIWORaGujdrfWR53/PknxcLDPZVXqzM=;
	b=qGHGJXxLXsHQTGTRCAv95gsQ6wagEkHgY8j402YwH8qfgMdgtxiAlydVuPHB+9PSRfH8
	 rZPNBQuWW9MA7EJCqJyoBstYMD9ojjZmUnMB87UZC3FQE7cCNUVXfQF1JMLB9CKkyvPdb
	 03gCQIQpIPEnt+eshfdOUfiDeu7UKGJMyKwPry6Ju/BVxLAdTRWJyxi2NW4m+zeui+ccn
	 ZyIHK39S3YfJnJEHwfoEQUHrwXJgogHcVKkLl25MAFyQ1NSeD6tetLRRFrgkW9MKSzYch
	 pysEqYk5EG2oMuEqbBUoctwkQQRzd+DDA8nVoJ4enwEEx11x8MvDwVPLkBnvR3Ue92Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRlYutNM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRL4RI7w;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A006606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:19:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A006606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PRlYutNM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WRL4RI7w
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5thh3958129
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:19:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GA5PsUYzNPSJmIWORaGujd
	rfWR53/PknxcLDPZVXqzM=; b=PRlYutNMLyyGTLIESbgj/+mljAFtNdwo5XaiaX
	ZrCkr1WlW/pwC7olb5yukxSFPrObgvMVx4D40SmkZzlDSW2H9O37rDvaolcS/HPV
	h6yG2F4YkRoQrJ3mQjxSKnGc+k77knkrvAkHOfk4dyLzcwTdwpf5lQGKAu/A3fHT
	lG7jkHAMZ1oePF66qJGeMhxfUHeRkyI/6av/vdOABxs1dymuWEXrP7pH+htssyuO
	vzwl1py47nE0uCtQNqVs/S3QF80W0Rpm+tyFITlWLIs5keW25Y1EnUD6JJScvvRg
	uNSikRJxL7qjDy4FVFBqs+ud2Rwf/Xkcw2+QPTp+OoEbKf0w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0ke17-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:19:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f37c94ceeso300271985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577944; x=1793182744; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GA5PsUYzNPSJmIWORaGujdrfWR53/PknxcLDPZVXqzM=;
        b=WRL4RI7w0S6k9CDEMXu8VXYc1VEpKjSlqSik1eSNNpYMo5UpN/pQ9KHEEO7lagu1yV
         RIG2G7PyavEMSMww2bacXmUTWZEJsruqUVfipmgqgCfb4QUyEAxn00U44DuTTLJcgSli
         pdipNcOhCaHbeHjNDHpn+r7SedvhxNF3xEkX6ZUaKUubbOqb53kX2ndOF2SpgDqgDbku
         HG0gJ0mHKN8y23xFvaXaSbM9zCogD9BRENsji0ON0WmwGqWAXpqJJ18H63IzizZEt5zS
         UbkLZnYu4FKVCjbMA/Rtj5nSiK7Tzj3yafvJL8YyIjYQMRynv1KxyUzk+auwvcpMDJuo
         gPQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577944; x=1793182744;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GA5PsUYzNPSJmIWORaGujdrfWR53/PknxcLDPZVXqzM=;
        b=bM73AbYQ7Ia3ENboyy9fThbSlM7fHJ+nFDQDvMSICUcT3kZHtvnL+EhxAFSRAlT06W
         vjSPKEzwECUT/5QnEVH7cGBxf25UFrPAxbJf7THnRuNWckjdTeSt6bi8Q91u4LtOyGfp
         EaOhnL0T74f576/3KB9pbE0tS2RkMxlAo5/NxlB9w07LNLRtVLxWfcr15cpQ5EW4OeGj
         CfEGS/aQJ46hg9Lcy1ZPQ0c5vqRQBzr52NAG0DOpsFA15axW23VTGjiy1HM4P2zk3bRs
         shalbSYrjjpxC6/6sX04fuvnal5I61mnS10KYgLAO7k6PRZ8OtaqBdslVxvRg0rzWnz6
         20bw==
X-Forwarded-Encrypted: i=1; AKwUvBzp0njFUOzIteOLXaddHEI5+FsW4HYpTWv8Af0SkIDpweStynVb65X/2hfqntHBaSC1qsztZvITsxam61Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Fyu5Qj801XNXiZIBINVR/zb0j20suDwRyVK0UHG+16kadW5S
	fKMPLcEcoTIFZra0QOKmqaocXpxj+P8XnSSIGGsGBG9MImbItonLqetoNVmt5YtxWgu+mz3Hnka
	xrQKk83PJBOnfy5xI/jyWv8VW6nb1l+HHBMp+JJJkdn0WB27EhZasTjRac+o6/kSYHec=
X-Gm-Gg: AYBFou017pLQb2d65Ot5XmtaZYgrEvR8UPhD13Vfl/3gHtR4qKg2+7H02gdNmYWGS8H
	876MiI9ez+sbwy1u1pdOS+GuiJay3df4H39LmcCTeQ7HB6wCpKYtf9adIa/yAIKuJ/UGMC1cKGf
	ILyFwTNTxnygfI6uAxTCuHhiNeiJfJFd/o1PwOo9mkEb+IVb74Nlyvyz7haQHZDe78JL8cfhfRT
	40A/LKItCboKNB6xHMC1KuzhWS9e0lDUiGjn32/1mo3lit5zP3waKqLPmO7WlX33NgM5SFAfNds
	NxClWG6nhqoMlCEJtffrO0YwfDipS9JRmOoUaO58sKU5E50DUtDgYADU7ugSKC1IuPmP4GCD8Pa
	wl14OOyFvXA==
X-Received: by 2002:a05:620a:4554:b0:93e:c12d:4ec9 with SMTP id af79cd13be357-93f4c9a31e2mr737700385a.41.1792577944011;
        Wed, 21 Oct 2026 03:19:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93e:c12d:4ec9 with SMTP id af79cd13be357-93f4c9a31e2mr737696685a.41.1792577943345;
        Wed, 21 Oct 2026 03:19:03 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2d85a9bsm159267855e9.15.2026.10.21.03.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:19:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 13:18:52 +0300
Subject: [PATCH v4] arm64: dts: qcom: eliza: Add FastRPC support
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
Message-Id: <20261021-dts-qcom-eliza-add-fastrpc-v4-1-4d33839dbba5@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIuR2GoC/43OSW7DMAwF0KsEWpeGBleRu+o9ii5kiWpUJHYsy
 kbSwHev7AbJptOGwCc+HnlhhCkisafNhSWcIsW+K6F+2DC3s90bQvQlM8ml5lspwGeCwfUHwH3
 8sGC9h2App6MDx402Fq1rXGAFOCYM8bTiL69fmcb2HV1exGsj4TCWq/le20XKfTqvL01i2f7r+
 iRAgGvRauMNctE+90TVMNp96R+qMtiiT/IuNkL/KsoiNo/ot7wOQWrzg6huouB/iKqINarQaiU
 V59/9OM/zJ0ybwt6WAQAA
X-Change-ID: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6164;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=6UpmWzc7yaSMOx2F4l4aRKI6f/B121oR9MFHt3tcZRU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq2JGQvg1FtwWDWezErxhq8m8f6yGZQAym6RTTB
 bsyb4VUpP2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCatiRkAAKCRAbX0TJAJUV
 VhDDD/9DmADk0bRcB1Z+hDy3FWnojJ0/seRmyLfcAuzhtnmH5d7abTCBqYaY1AtYfFItlnKhCu3
 Nznxgkg0LkIDoMVKbf3fxLellv/xpBHSlF5cjTc26LEKn6TW7bmEXC1EnqbktAIOJw21XmqBlHY
 nRb4r2oSxmT02sln946W55zYOYukyRMTI2IovsdYEaF1QK/4kW/x3Vb78+k2yJzCbfqPfwAhyax
 cVlQnoNnpklsLBKhyEvUXc736gLhymeUD6h8xu4He90aMdEaafR1vpDIIjW90X6nAIE9sOdZ32y
 TABg/4OAxHtxXxReFpfMoX1t725H1DWIX3xTF9uXi0xivPOx68SHDlHGDtBezGA+tHWZ3oDBb4h
 ZYhY5j8kKvmOdCbOLOgVntvQdwKXJPUO0mgUHptEmVRr9ALGfHOmQQS6DZlxD9ot1RSFGUwfGNF
 BSl0RdSKScAmInNzsPtHaO6a7IAq8L6VuyFVAISmjTJEHww+nxqpa1WkVrhO6X3Y5Xg451izFVs
 OMie7WfVUR0t5HZNNfiA9fh1HjUTyeuTCncbg+1GE6lzVSt9KYCO0fVM/DJF/xnET2dV55Z/l7l
 EfILo1mYPHfobg2NEEipnl3MgTlE68KTfX7i7R6uGAATTgLosF+WKhjJpCEUU3HeScRsf24Tdj/
 V3j+lE4Pfas6zcg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9Qess9ydlp5K
 cip+NVbwKaeNHF84Tp3gnOvdBYYz794/Qfm9wf892yAa34/WwZLCO/FLb/n+TY1LF7lQIFLPtU/
 5kfKdhC0ZtQ0id5ZUa5WDv2Zbt3FJRMXFs6P3+w3TvHTPK6dUshArlMfLMcO9oMPwedh9IYREhU
 BFV55alnlMImMzFG11BqbYXVd/8JMYbIeSlvdiGWCYfpJ4tRzYyhQQAfMDI/tajsANM7Ctb8HPg
 UVbsdLzfOeT/naMuF0JZCCYUAvNoQoeV2j78hCPvzdFnp/Ovkk81dH+20PWn26datCCTzifuRU0
 +IeZF/3hDepdkzBeU4leXbPmFEMfk2i9ZjQyRhMq5cLd19ZnUQ5p3jt6glpqwKsNzsD3a/pEDo9
 nOcmpqkSn1VJZ9mSuCp5wBW2wx1W5Cn++c08iWggPDrQodtypHwSngD4LUKT+uH0RlyxrPlrerB
 JyPL/o50F5aEGvG+Y3A==
X-Proofpoint-ORIG-GUID: gPqSxl0WCzNnyzF2uDPQ6no9Z-iY8Igm
X-Proofpoint-GUID: gPqSxl0WCzNnyzF2uDPQ6no9Z-iY8Igm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX35WUC89aXv3Q
 XDyqy5ISKkw7fDfn+knI9RiijVFVQ/xk+mXKc2GXTfHSNxZtOqDef5V5kCEIJepVPgLq4efo+h0
 VfDXILN0n0ctCgfhcRlhiGO6xILOCeU=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad89199 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=iNmt55xwLDWB6Bi4V4cA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040

Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
the ADSP remote heap memory region needed by the Audio PD.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v4:
- Fix the off-by-one in the remote heap alloc-ranges size so that
  0xffffffff is also a valid address (Konrad).
- Link to v3: https://patch.msgid.link/20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com

Changes in v3:
- Rebase onto next-20261015.
- Add the ADSP remote heap memory region (no-map) and VMIDs.
- Link to v2: https://patch.msgid.link/20260916-dts-qcom-eliza-add-fastrpc-v2-1-95ed704ff268@oss.qualcomm.com

Changes in v2:
- Rebase onto next-20260915.
- Drop the CDSP glink-edge description, as it was merged with the
  CDSP remoteproc support.
- Use the documented 0x1063-0x1067 secondary ADSP SID values.
- Drop the undocumented tertiary ADSP CB7 stream (0x1087).
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 160 ++++++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..93e922de53cb 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -615,6 +616,14 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0x0 0xff800000 0x0 0x180000>;
 			no-map;
 		};
+
+		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0x0 0x00000000 0x1 0x00000000>;
+			alignment = <0x0 0x400000>;
+			size = <0x0 0xc00000>;
+			no-map;
+		};
 	};
 
 	smp2p-adsp {
@@ -2432,6 +2441,69 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				label = "lpass";
 				qcom,remote-pid = <2>;
 
+				fastrpc {
+					compatible = "qcom,fastrpc";
+
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					label = "adsp";
+
+					memory-region = <&adsp_rpc_remote_heap_mem>;
+
+					qcom,vmids = <QCOM_SCM_VMID_LPASS
+						      QCOM_SCM_VMID_ADSP_HEAP>;
+
+					qcom,non-secure-domain;
+
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+
+						iommus = <&apps_smmu 0x1003 0x80>,
+							 <&apps_smmu 0x1063 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+
+						iommus = <&apps_smmu 0x1004 0x80>,
+							 <&apps_smmu 0x1064 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+
+						iommus = <&apps_smmu 0x1005 0x80>,
+							 <&apps_smmu 0x1065 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+
+						iommus = <&apps_smmu 0x1006 0x80>,
+							 <&apps_smmu 0x1066 0x20>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+
+						iommus = <&apps_smmu 0x1007 0x40>,
+							 <&apps_smmu 0x1067 0x0>;
+						dma-coherent;
+					};
+				};
+
 				gpr {
 					compatible = "qcom,gpr";
 					qcom,glink-channels = "adsp_apps";
@@ -4571,6 +4643,94 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 
 				label = "cdsp";
 				qcom,remote-pid = <5>;
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+					label = "cdsp";
+					qcom,non-secure-domain;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0c01 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0c02 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0c03 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0c04 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0c05 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0c06 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@7 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <7>;
+						iommus = <&apps_smmu 0x0c07 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@8 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <8>;
+						iommus = <&apps_smmu 0x0c08 0x0>;
+						dma-coherent;
+					};
+
+					/* note: secure cb9 in downstream */
+
+					compute-cb@12 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <12>;
+						iommus = <&apps_smmu 0x0c0c 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@13 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <13>;
+						iommus = <&apps_smmu 0x0c0d 0x0>;
+						dma-coherent;
+					};
+
+					compute-cb@14 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <14>;
+						iommus = <&apps_smmu 0x0c0e 0x0>;
+						dma-coherent;
+					};
+				};
 			};
 		};
 

---
base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
change-id: 20260721-dts-qcom-eliza-add-fastrpc-c0868aeac9cf

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


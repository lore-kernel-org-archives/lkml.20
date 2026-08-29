Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F3F7367F2F
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033216; cv=none; b=CdedxwyOVZEIHJujNlI6tJxYBYLuiHU9H9j1ZVNsNSRPQcagUo8LOqGVJXqyPK+0/LgSvt35ba0X4uyfAON2FZjVXL1oLAmbXqQhCLczrUx4B9JBL90UMnHggHc9+HYPIJTg6EWam42ICIbhVSiHl+XUqqe62u2enBjO4521cy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033216; c=relaxed/simple;
	bh=TVcXu7RDJopZcJee2GwdYLHMG2S13Hmlkx2/yEL1aI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZY+He3VLSyKIrraijcgt5Vja2vWgLZpAiHNRvaMhT5tFTdB2ETAZi0eCDpe8Q7pwIXDOS0Xg+GusLdN0TvPmO5Wr0GDmCevSknbHTYpw7G8oCWd6Y1BjvRCmlDLvU6yRcgMKXiwbUXAicPfn4q7G7K9O8+R9mejkrE0fz6IcjDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ho/YZlQc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ihGNxG3j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ho/YZlQc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ihGNxG3j"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJktZ12799972
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vfurxFiFyne+wCoshVktX4
	1VWBdR1PxTmnAj3EPIz0Q=; b=Ho/YZlQc8SlY3veRfOhDKXNKW6LrUq+pig6QMh
	+CG3llG8XgxPlGewSVOop3oH0UlcHSGaoCf1Bfm81HgcVdC4SCF06R+f6rgw8c4v
	kkvvUE5WqPQtvXDqJpoW9/ynNeAHAr16SVYR0G6NPvxknBmUrgDcqUZoFtwAsm4k
	XYEy7ZyrNaluw5yecSQmPND2Bfsfn508xcbfe6GhZjyevw5J7k8M0EogO8dYaQxG
	QckSZ/M3QP+bSV8qLPZUAkfVoFd4fM0d8Ay7e9UJ2A3t9SwxaTI2i6YsmVDvC45l
	4Wcylg7zSEnx1rDdqHWo72bGlo6rf7o25LR+9pF7gk6DidrQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhw9pnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:53:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53000c06184so11555131cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033213; x=1788638013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vfurxFiFyne+wCoshVktX41VWBdR1PxTmnAj3EPIz0Q=;
        b=ihGNxG3jRIyuoDXG/KVYr5cImVFeE61kpIqK/R1F+7ntQ/5tn8Vw8P/m4gLo6ASIZL
         eEKYP5bRRSJeWnCjjFW/NS+ySfS9jl4s7jRtrbNNih7DWyrxKBriOkhiAFqC6EKxibk+
         /hPbXzrzels8tN7VSRgtR7xvjdWUFWnlvQfd4XokLzMbBsCM34wASNWt+RsNs5aKB/2D
         lyQEc1GidY1+BexSX1OH1vPoFV4pCvu5lvyCVsSm0WrBD6aN6jw+Llx+OjWCwgYf/WvE
         frXY1wn1J2blJkgNk3HGpKWWhvbLo1Ys2xMz/7K18XuYxj/u6+bF3ufEsxA/pjOKO1vL
         i/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033213; x=1788638013;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vfurxFiFyne+wCoshVktX41VWBdR1PxTmnAj3EPIz0Q=;
        b=RG2An3IQQVe3/OSLMp57huLZPZMT0UJvPGwFrQ6msFEMhrB2uj/32j6NFytUCj3TDG
         7FKLDHNlMdp6LDxpU9PbD5ua9j08uJSSe14muD8FEzv/TitnNHeXWhvcIM8p1II6HmoN
         dhfsdSFONjGhC1mIolM/5CFLG+BaZn7f1OzEHNk1r/K7UramTqU7zB+6lsCASJGscRA4
         Pj21bWE59XmIPSN/yCMD16/WrdElvSYF/3Ii+WaS9NOVcA+F4GSjYX7TXWMQ5Q3mmRsS
         YdjZYkluYtmlcEAjfNjQUxpbZUdbHc535kLWTV/MvDSE+yFTLjU14irzjCeGXDaIA2M/
         moUw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2ujr+c2D0jz1Dz5IdmgvY5Q6vmi+pViwSwYuTDlZKwPdFnH0uwE+jikQiBzVO/5fVzTE9XZ3kFEsnbXo=@vger.kernel.org
X-Gm-Message-State: AFuF++lLZqFLUB3tuvsP0Gb0odggZXvAcww7OAIgo8UPCKk7mZnEtMHt
	1Ui5DbbYJ/DwyTge2Wwb1su5H92i/34EpHfyjsBAD13W42cbXJ6erULkIDoqMhcBxldmPq/IoEQ
	6rz1h8e4fzAM/rzWLBEcXG059u98UBETcyPmxIpZI5uQW4iszFDm5Op0Irn9qmRChTT0=
X-Gm-Gg: AR+sD11UkV/jJ77AbUXXAEHT+QDQd33ZL57uxqB6yvVaFZzbeF7NI15oIyc40YlEZqp
	OND7O+eG5LONh9P05B+CKmZHhZf0zJuXgQCTs114CLaz7Nxw3Alj2Iu5Xqn3ODH4WQ0OlZNwDwY
	KsJ9wv2l+mJL6E1xXQN1Q4ZZenv1+OnAagiZhwTe6Sx2bSDvOGWFVgeKZYVPfpz8mKABEmPzPST
	+5/Vr7sfr0hpvw8E+xCxf7t2rz+AapTYBiEFEwLV/DhciYAOVMEHcmQuvi1qEs8TKolw3X9c9dU
	eRiJM8dgPwMQ2BsCnoOR6zNdVUedzMXKdWxu4tOWeYdEm7Bg98ZBmwG9H1OYDQqCVwCI9tkB6JF
	T230tQcBTAM4MtcF+zrBVIdw=
X-Received: by 2002:a05:622a:aa81:20b0:52f:f916:b7cc with SMTP id d75a77b69052e-52ff916ce9amr41637411cf.0.1788033213605;
        Sat, 29 Aug 2026 12:53:33 -0700 (PDT)
X-Received: by 2002:a05:622a:aa81:20b0:52f:f916:b7cc with SMTP id d75a77b69052e-52ff916ce9amr41637191cf.0.1788033213146;
        Sat, 29 Aug 2026 12:53:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/6] dtc: dt-check-style: Cleanup plus new checks
Date: Sat, 29 Aug 2026 21:53:16 +0200
Message-Id: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CQAxFr0K6tslYFdCrGBcyVKka0LYQDOHuj
 sryJe+/P4GxChscsgmUBzHp2gTrVQaxObdXRqkTAwXKQ0k51m5o/n4wxobjnRWtU8fNdh92VBR
 lRQRp/FS+yPgLH09/tr66cfRvbTGUX3169EWb5w/ro3vZjwAAAA==
X-Change-ID: 20260826-dts-style-checker-sort-349052778b22
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TVcXu7RDJopZcJee2GwdYLHMG2S13Hmlkx2/yEL1aI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkziyG6xBaHGCwW4wqM2XSbZRciAc/7B3w3c6q
 53UXlnXw9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4sgAKCRDBN2bmhouD
 17wRD/4/WIy9COi+5eYKXVn4KP652+IlUQmYfwPiUS+7vKFAcQmNNtSThF2I8W7F2wqcyHff4hb
 Z8eKY3enTij5Dnzz9GwluFV1mPBmIimn3P8bHGEmw8fcIq8tdA9WpSMS/ZssOV5VROGleSnmbBa
 zdMDGnM56aNC1WiFSIAcMPiQCIEiXeIKb7kHBw0Wfo+5WmwWZafxzs88jybDXotl2se6PyXK2o2
 FsmzE7VVZ0yTSFz2Ms9pXCvU7nRv2KAXgA17lOrtgxfv85Sk9FfPYhgTX+Gm+jHBEvESYNwv3I0
 ij9sh7qQwO/xZHLCCVn4MAA2s0l4U2QtbGrRjNDKWqGK0VVr/lXNTRMX9Ag9tS4t+wrJdKpLR8L
 sCXaizQ1YFmduZjTYejgEl9KFckU8eq5ASA95cZe9uysX7K3atIodY0eWJzNnfxvcE3BfiTWn1O
 8AkWxkBNrMGvyqycxLWJYukzWAICY/NjB3UWq7HkIhSiFauT5MdHE/hYGQgwd9/HeT+haVTwiam
 cjOBmFSMOOM3sbfGa5lCQ0KGswB2qmb3ajLO1vIjyliSLWXvDENtxWfhlMZ4Ioa7Fm8OaxP7Cq7
 hC8Z+/aAEjQvRUD2WeuBNnZ0LlfHcTqm5NDTPqR9ivQANp9zlmHxom66G6Hneiq72mVUrPUhVfY
 5+wu//Km+5KRC0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: BQL5Jsvqhy9Iq4V4J-w5ns0JLcLf3TYC
X-Proofpoint-ORIG-GUID: BQL5Jsvqhy9Iq4V4J-w5ns0JLcLf3TYC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfX03hTxFMVJZfd
 qG0vVoJUk7Qw8McNpSj1vTLHQ90KchJ0SJELXk6GybgJkjMlBLmIjlETOa4t288RINh0fsPN8/O
 qiS46XgcusARR7RuojDTmHZmq3agkI0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MiBTYWx0ZWRfXzkYxTQ3W2n1h
 xs/wfXRwx6uuQf8lKg/Om7JhEWTK8DPC4OSGaqWLwjj39Kcvk46EWLzAYcclbW2Nipet4Csd5lV
 bE5aFY7Swblx8oAO0wvADSzc+DsH0Oq9l5QBBcVyc0MhRImrtoMOKpyKKJuKDd6rBQD4aGQWIFj
 StuaFCxsFljAw2NkZQVqQCAFu33n/p0ONr0lXnRhgm3hQYn24Rzy77E40O6rwJPKdNNmMoV4cil
 hpozObAfZJQzXucN60Kjk4NRGjk50rrf6SXzWLOAwCOyDEtjKhhdrZ+Chym5NADn1j3iA5WO3JO
 Ciz5qUERacOCmTCNE1IGnG8yWkWI8jZLerVXICd3Ow93js+zec6TrWgvqq0s4+/zV2aQDH+Mx8x
 R9CYxD2vjarWqs3m4cyR1L3UCHiIpcLC98/jyJEgW+WVBwytpq6KrzgODP9DnlK0rE4SANU7NVx
 wJm14sFgcv3qcghSXqQ==
X-Authority-Analysis: v=2.4 cv=YKKvDxGx c=1 sm=1 tr=0 ts=6a9338be cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Ti1yvCWcEA5xIRQRbpsA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290172

Minor cleanup, more checks for node and property naming, improved
checking for whitespaces/tabs in code.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      dtc: dt-check-style: Sort rule directory by name
      dtc: dt-check-style: Sort rule functions by name
      dtc: dt-check-style: Process property names with a question mark
      dtc: dt-check-style: Add test for node and property name styles
      dtc: dt-check-style: Check for indentation also in continued lines of DTS
      dtc: dt-check-style: Check for indentation also in continued lines of bindings example

 scripts/dtc/dt-check-style                         | 740 +++++++++++----------
 .../dtc/dt-style-selftest/bad/dts-node-name.dts    |  60 ++
 .../dt-style-selftest/bad/dts-property-name.dts    |  28 +
 .../dt-style-selftest/bad/yaml-mixed-indent.yaml   |   2 +
 .../dtc/dt-style-selftest/bad/yaml-node-name.yaml  |  54 ++
 .../dt-style-selftest/bad/yaml-property-name.yaml  |  46 ++
 .../expected/dts-mixed-indent.dts.txt              |   1 +
 .../expected/dts-node-name.dts.txt                 |  13 +
 .../expected/dts-property-name.dts.txt             |  14 +
 .../expected/yaml-mixed-indent.yaml.txt            |   1 +
 .../expected/yaml-node-name.yaml.txt               |   7 +
 .../expected/yaml-property-name.yaml.txt           |  14 +
 12 files changed, 629 insertions(+), 351 deletions(-)
---
base-commit: a5795bb908d1b8b125a59bbfe9f27f93929dc647
change-id: 20260826-dts-style-checker-sort-349052778b22

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


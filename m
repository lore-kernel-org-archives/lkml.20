Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF42499F35
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790102704; cv=none; b=TpB5B/iG8DaX533gKS0raMhymMHYQvaSj+sXt6Uzc8REmvAbsDHck8gKjlYOJZbjBV/YIYKyJr+Lws/CsZ7sKWJsaSQQrq8qIwGFEZp3va1Onc6B6i1i5Xid20JU9ed/+RYcDS4s4rXObo0yrdKnEAP7QqdHV6rBs55ua3+PyrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790102704; c=relaxed/simple;
	bh=beVjqaoP8TPHrm0UUdxAvZVYIgV0Hkxe0FspTEoaFKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=soULiqyvZhc0MQote2H9njr/9l567WfUDFNmVjT2Qud8bdq/TYInht8iOmdYTL9RDJpzsMt8FLOUj10+CxU46hLGV7NqMDHhji+RPjLcFEipETqqG52zNsnVZI9R2Of3pvcPnXJ8b+xVreoIjeVkdvamr4PfCn726sDf+vwC67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/BEmNio; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c+7LMEae; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/BEmNio";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c+7LMEae"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI79gt1024450
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBV
	MS6c68iI=; b=W/BEmNioLHvZD0El63xaW8bKTT7nz1nHm28dGP0TayMiwkXymTJ
	Pw6aGzv+SVRid7WqkHVDaybMcvdvVlOnxRS6uljFiTywPoTfhbRK2/Z2ExnrRe2Z
	c33OT5ikZWne9HX8ia0rn/XoQqUWZfCBx9H8qzMPhJaL7mSkJE/ouOXbFUD8g/Sp
	SidmD8B65tfm5jnTa9eIxQhHOwu5ZYYfV+G1OttG8Z6KtVExaPnSukVSNZKifxH2
	LB9pPqRSJFFr2nqbuLlOvAFDVFIxgti55nySnzp44ZIyLYIPl5eKffQ97GZDGW8n
	Fxrul8zSze2TPfRA45nh7+Ev9FBebFnLj/A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gujkjbuq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:44:58 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c96449cc2aso229692e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790102697; x=1790707497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBVMS6c68iI=;
        b=c+7LMEaezg7xW4RVKfj5kG2KTn9vxzuAqY1mvui7DA0aGoP6Q73wqQgrtsXY8B+718
         +EfBhk6hTtH+o6UkND6BnWxQmRPoJyyACodaoaasSc3NEYAtJBxzzr8nuw3t9XgMokQz
         MUzt2h5bgJtfz6Gg8RhCxtmT+KjBa63IYMqozdZOUSIqlGe618KSJaMJQug6hzFa3QCD
         Wx4ASYg7Ywdtx+JnC+k78ssGi+6pgEEBYHqgqEduvJDn1bZzYrdspl9pXIaKWZVLAtcc
         +FXqWSRjvLGzfJsKRUduQ3ffw0TjEbl4rYeb+NqKYEQiZbhPIrhaSpCX/mamnwY2qn+U
         yy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790102697; x=1790707497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVx2zn+6kCGTxEz1Q73Ti57VUd99JFhfmBVMS6c68iI=;
        b=GuDPk8VXNxalB1Asvgt+aBKww2Xfxy2HNpXRZMwatD++6G5D/WNUJWWRXd+Rc4fdlH
         I/3PSgLOhJGYecA7ytn2ekiD9xnp1jtyLpO8xmtfvU3LIOmZ9iDioL86WXhf5A5G86RN
         Pq16CcLjhJryx7oGZYB/iLO/H/Kob8bXnWrxUrVUYKiR48nD6qv5npvrSXFAAS3bo6xR
         A6lSxGG7giO1ZpYRDSGsOyLqlAm6Ejh/OZBCYQMz0mJSzJm3ATT/u3kO4t0G/Jh/CPG2
         R4s1j+DpykiZIFL0yH75MskxHekpQr4bBzimVYw8sV5eH/Rfs94NGdrivSiNeximIukA
         LlZQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWAkfh3tGdJCp0pq0zlyV6Ng+LwAV38QJlXgYTKBRSDTvrnxUmCuz9H5KoJE0HdAc+9jn1g/RwJc4PCEo=@vger.kernel.org
X-Gm-Message-State: AFuF++l5aDINyA9QQblO3vQv83HVODYp3jV5xwq5KwceEZ3gBO8u2kwQ
	Nmglzm/4GPA2u/tzeJpMFuPJel9QW7YHVAg1rebMohdMT5aWpoSggEoP8t4OpzPihDl8+UmtisY
	+NIYKJijh7bL4v2KIR6KdkNuybIjxrkjh/ZLqEIPEWPBrWPlCdKruyDHiTgAU6ePQH8g=
X-Gm-Gg: AYBFou0A5l8yfDDpa9HEDqk2yo48bIOW9maWvR6lOhZTDOvd1lRQPcAMPBOKNUgICSJ
	Ze9RSAJq0ZpNNoInnxpUzP7PzKv0F3Mm12PTsr9mY65ZeZbXKT76TlwxmQ/nrGzpxMJSTIDnYNs
	/PCHsV+peO68Za4PraUMjcfUPZmsovoJW762lx7t8lXABMRvjMN05elcWG+3IhmoNEkr7R2hqTY
	t3u8K5FruWuu5pkdnzkNRuywPLrIviURNUGm1ZrKZfzHGOi8d07vHyWLwKF5t+CWesCbp2l3fmG
	GZTVBCrCuynpOb1BzRUmmwJvcSq4U1XrK5J9hEH1EPYPsaenBmBU7iV8PMHHhV9Qi4ImQncqo0w
	vhCKaEqijJ9sDvKjB4xY9StSSym2gYTNrD14JkQ9GjI05CpV5R9bhcZ2fPhE1TP7lrjtz8wVnFD
	U=
X-Received: by 2002:a05:6123:5c5:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9e3655d2fmr3477501e0c.16.1790102697623;
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
X-Received: by 2002:a05:6123:5c5:10b0:5c9:a5b6:27b3 with SMTP id 71dfb90a1353d-5c9e3655d2fmr3477475e0c.16.1790102697195;
        Tue, 22 Sep 2026 11:44:57 -0700 (PDT)
Received: from debian (cust-west-par-46-193-35-178.cust.wifirst.net. [46.193.35.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm374681f8f.19.2026.09.22.11.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 11:44:56 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] clk: qcom: Add LPASS clock/reset controllers for Glymur
Date: Tue, 22 Sep 2026 19:44:21 +0100
Message-ID: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FXhyEleomAVPJEoyUhyuEP_B4bnV2xrM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX2qvm5/A6me6i
 AGq162XHKgAQp1pDVryd9dCFqIfc6mbGd6yfa7RaT3wKHlNI7WuZnGb+KL3qtICANgtDHBc80S4
 MxxMiDs4NR3OYxi0p6xtC6Xbl8AWNU5Uzt+9frc39aRc5zhx0jYZcWQb7pdxP912Yue/es+e4jX
 u78JqC1O9jK9I+PeEqsD6DTCZtQ9Tmz4P6EmN2Q+9GJmzTy9XM9xNy2im9gcXkXRg6mWYfdjpmO
 7Z1OzVty2yRvElFKuYrKJuUIM57CsLeS8aRWTkZnyeVFWD+gI51pVu/Al+hRl4OFdnXdNxF/FLq
 EUGKZewF+4aas1wVP2Fxy7DP48oTiugywbSbC8fPUFM12K7KrVfAG7TDzElgt3rl+C2CPrMVv5f
 wv8Zx4wpvEuvP6y3ecdN8eBEpp7LTYXKHCkY6Gzaa/NYTP9h00rodLwFJavoVCPYZ1RaR7grpAi
 htGaVm5O5pl8hV5ivBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3NSBTYWx0ZWRfX5w0ZJOG2fe/A
 97wPPddhIXLSTu8+2bywuUzjYnw3O6kxW1IAKU+K06+SWdOi3x9NoMjEPozEigVu//2DEjtLg58
 dwMGNSHyICBqJnbj/E5sRQOXABNWURg=
X-Authority-Analysis: v=2.4 cv=SuAFe/O0 c=1 sm=1 tr=0 ts=6ab2ccaa cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=Hji71o54RgNgZYqDgtlrhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=68KCznAa1mAgJHz0fDQA:9
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: FXhyEleomAVPJEoyUhyuEP_B4bnV2xrM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220275

Add DT bindings and clock-controller drivers for the two LPASS reset
providers on the Glymur SoC:

  - qcom,glymur-lpassaudiocc  (LPASS Audio CC CSR): RX + WSA1..WSA4
    SoundWire CGCR resets
  - qcom,glymur-lpasscc       (LPASS CC CSR):       TX SoundWire CGCR
    reset

Only resets are exposed for now; the Q6DSP owns LPASS clocks via the
Q6PRM service on the GPR rpmsg channel, matching the existing SC8280XP
pattern (commits a5c9c3ba243a, c2ef1ec97c1f).

The reset providers are required by the LPASS audio macros and the
SoundWire controller to come out of reset on Glymur.

Srinivas Kandagatla (4):
  dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
  dt-bindings: clock: Add LPASSCC and reset controller for Glymur
  clk: qcom: Add lpass audio clock controller driver for Glymur
  clk: qcom: Add lpass clock controller driver for Glymur

 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 60 ++++++++++++
 drivers/clk/qcom/Kconfig                      | 11 +++
 drivers/clk/qcom/Makefile                     |  1 +
 drivers/clk/qcom/lpasscc-glymur.c             | 91 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 19 ++++
 5 files changed, 182 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 drivers/clk/qcom/lpasscc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

-- 
2.53.0


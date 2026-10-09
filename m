Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C483C060E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 08:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791533773; cv=none; b=Rjs8IldtKUQet+LbHWM4zBvLfAy82gs6m7HshPGC56whz/HTckC+MY9knWpSy65+3Ydm9ga6Vun+zCvHHcN+2zraH/fGJH6TS9p2hZiAzGyYWCwN/GVk0dSF3nQdkjkrYjNBWVgnKCvWJPDOteep6M4NC6JK3RqgkUY2fcn3xbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791533773; c=relaxed/simple;
	bh=t7qRmqHdMAl1qk4MJVpTg0mh8/vY1dTo8qJcR8916Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VPmrvI9JnIVq333Y6WMDEtNaWUWjNqeje9E7ut9fpy++SnPc97CdrmPpcoDsleJeoLhDZ4QfKUIsqclpwxanY5i0/eRMD+FclZRCqr2Qz/oYTdtGc9aGrCrNxhg9SLEz2UHPYATSZGMkQ3sCkmi3RWCplGpJMDaVYwgiXiADjZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fp/K5liQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BGDC2rIQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fp/K5liQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BGDC2rIQ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HIF4564672
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 08:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=; b=Fp/K5liQZd0BPbPo
	6C8FYm6+sKesgHm5jfJqOTCdAVQ8fmBZiCmOHKbt03g5iWpY6jVRjMGpdqczBh+x
	EGi2/VnvoVuAjx/e+EdGKmMrhrUXLhCWh1fBCfGwqEplnnDBMZOD/vqL0ygyM7t4
	/C3vlTRsN7F80iAT8QoXSGCAgRST5zWa/l9xaNGwMReTiEXTnUOeLwUAcmID9nBF
	paC6xLZuPglh9Q+A9Vj+u8j7Xs2S7f3uNrV6bl5SUl6d82UJC/Dw11vBM3ojVPfz
	izx6rMQo5dVHZSBLnz6tpMNHDavOr+cbzcgpDuaGXMja/Fn4EMSZ9A1jpnCeRhJr
	4XIAog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxkahx5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 08:16:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso460359185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 01:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791533768; x=1792138568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=BGDC2rIQY/3AZvToa+mnV+I3zJgzXJx9cd8RKeWu2ChGnrq4ksFJ50cKLhIfbY7Ksm
         JkiUQgSAq3Olk4i2ooXg1YtLbSXLwq8v4kgrxzTcNiI0z7goPIhHx2hOXsGSTTL5/3zC
         FBaeetlF7noGbKsRKOfh8CR+ofkFV3DkKFzJzkJ6B43hRLfLuMZjmNIa7N0SG9HmdVB7
         DNJx+e6gyYxN5LAjxBtlKPW3sz//VrLJYn+w2L4sZguLXxNO/e7WkFv0zlW8r3NQHIaB
         +QNuwKLaDVhOYQmh1RhztSLwB3yG7+i0EgEP2E1Fsj7k8y1TfDMUvyM4ySnYzZXf1cCg
         Coaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791533768; x=1792138568;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T4fGb7Hz2boMwAT6WGpk0OCK8tzz+FcRa4JXQhQJpJk=;
        b=zzUOhJLw6UlUMfDuDxgzwgchzaHjekUf65KmU+qPf+Hqv7Bnx7GqIsjQY0p46xSJZB
         q3ZrhWVSwqFc3NMmMO8/NKyOQo0THEWpMcXIx2rmgRJZitSibdixVS8PT3L68GHZb+KW
         nZzt8GtcVBCD5G9a9J/mOqeGzKgXiSktP7sYekgld6jW0UhalR5p+UXZ3cTcl9VqDx4n
         1eMcLIgta2CKwJVlodu8GmJ44/HYYFp/gco9nYZIKxIm9qSmxyvV8R30K9Abz3oeYtBc
         iAYgIOjYx8/PV6WpQ/aNQPkmSMXKA6OMlOmQOoVUe24Kj/FexQXkFc1463YhT00dG2BG
         1b1g==
X-Forwarded-Encrypted: i=1; AKwUvBwvD2/enWPzM4jjfokfKgHceWnI0uVkd4eYsWZzg3nYPtgg1bhfxaDo/FpOAUyysUA0UvddcpY2MV+WHEI=@vger.kernel.org
X-Gm-Message-State: AFuF++k3b+oclUvzOOOEM3rNSrbTsoUlf7b4a4V+r/LdXIQ6bvgU619x
	7/Sv/JXSTeskzxuah/dziNi/WGEtEIv+BPDeK+dySbVKzw8zNPCaYXvxLyjMN0gf5+eM5Zm20TM
	Ltp/MIkLvygQ4vMdzM29VttDGIwIoQulEn9LN6Mx+K7paINAU6Nii+jgQUkSEpFQ22xk=
X-Gm-Gg: AYBFou1eLQrqUeKW4fEP1ZtHKBwGDPcmNtqjHmYVxyOmeDyZnXZWjpeCtzeQQmTcUj+
	XKKYk7WBrye7Tml76nCOOo2Jpq5hSkfXmUo9exAPmQQHA/qz9s4QFpESg+RS/kaqjahAZ90d6o4
	EEEWZkqyUbbXGDNCnzvpBbyC+MCeSAZUgKFGLTpQ0bz0E8opMkWt3luWbo9HsrdCEZQKs6KTevD
	my58jLMmAgF8ahVALkJPe0yyym98u8GayHQYJrn/cDafT2FDLcMbt3Xek1gjBmEFy5F2yQSL7N3
	0RWeA5TA1LAS0doQjc89qpZstodwMYLT8eArfe/o7ggREbi3iapikiPlc0JLY5AC8aStUiC3THs
	mQkFLoTiqUftTJjz3ugOLkPkRFcI=
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213374485a.27.1791533767687;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:93e:4f45:6fc with SMTP id af79cd13be357-93eb965e53amr213371585a.27.1791533767082;
        Fri, 09 Oct 2026 01:16:07 -0700 (PDT)
Received: from hackbox.tail37bb1b.ts.net ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm69068565e9.8.2026.10.09.01.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:16:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frieder Schrempf <frieder@fris.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Mikhail Vaniulin <mikhail.vaniulin@axians.rs>
Subject: Re: [PATCH 1/2] clk: imx: fracn-gppll: Add 350 MHz support
Date: Fri,  9 Oct 2026 11:15:59 +0300
Message-ID: <179153373231.1996373.14178239298073465630.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
References: <20260910-upstreaming-v7-3-imx93-displayline-v1-1-bb9446e6ed6e@kontron.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 86Df41Vt9KsUKH9gvBspMYHW3NI7xDLp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfXxnxfXsMHgHzh
 V95/AysGvXpZfmuqrgCL5D7PTElZnh0mRch38cjMVv6mIeDRdd/h1hdV69tBceIWHVTQl+1PWBr
 11lxOV1TwdT1G6NSi5hWh1noOh+jLLk=
X-Authority-Analysis: v=2.4 cv=Cs0q4X4D c=1 sm=1 tr=0 ts=6ac8a2c8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SBSG_3fblaHcu9w4dFsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX3FiEbU6Y1+Ir
 s3ygP0cX3ZBaTkCuHW3qFka6oSKvAEeB4+6swVL0ocVQCGH7omI4gWIxG9RvIr+qvgNtoQEhEyp
 xZzQUtLYQwD+IR2HOCMwOWZsLp7B04LTKMLHovWIpF0A+9LmlqV4rAc25qSfF8XDWW/VH+Y7Jr4
 rTVygDaSzoXJpH04F8eCh7QObdY9NyqkQfC3a7GrupS8vnnzJEnU0tF/46WnWQY9tQESvVnMk+C
 HW/6fPPrSYg1yq4yHRjwirPcIlF/MP8Hl4dCCuGTZIR8RrS1dKyBqZ/lmWX1Jfosq6rcNFUv+vJ
 rgFCxgUvsYhl6vngjYdjb/vIugu4wBWCusLcsS5j+XEw4vu0yER3ZqWiPZ++x7KX+JR6QaAQ0Tq
 rdyj1wJdy2JCHd3ayiQ2F7anpaExSnDIH53QEq9k7EgHFfA33GASChPFL/frBOgiZi4Ssyb2L0t
 USXbsKVCIozoABSDHBg==
X-Proofpoint-ORIG-GUID: 86Df41Vt9KsUKH9gvBspMYHW3NI7xDLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032


On Thu, 10 Sep 2026 17:19:06 +0200, Frieder Schrempf wrote:
> Add the 350 MHz frequency support that can be used for display with
> pixelclk of 50 MHz. The divider of 7 is important for LVDS output on
> i.MX93. It is also usable for parallel output.

Applied, thanks!

[1/2] clk: imx: fracn-gppll: Add 350 MHz support
      commit: f85b551c519ee8f92be601ccf4f7d440582ac476

Best regards,
-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>

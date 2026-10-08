Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15ED4562AC
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457633; cv=none; b=fHoKZYeYm0NNSKGQFr6TJ1ABTtIYdLGFrAPC2VVUsyxlH7Kee7trHNvTHejuI//gf4tF8ifcVOFT0IkgYbg3AQ46YagCCA6AHPPWvAyb3bQvDWda1HMXP7uDsyZUbccEKZ0gsfYB65Bg/fV4Zz6+ZrmegFPMIoJVKmQX+B2NrnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457633; c=relaxed/simple;
	bh=i/WjhoXcb5hRljX1mzFvMd3ShIpY3kWhHAB+PwlhiKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F52PTyV94GiFpmiVL8+JzBfAfcyHoJIZ/fh64s87Yr5jQ1/SW7TbPMZLz/2FYSKVq93Gc2/ibAJOhr744gWCPKWGdOdQZu4G4Wy9OPWYf9gzielWOWhfjiXMvzP0GqlgQkULKh6bcYjWKglxn414A/XFNxZqNdcJHSv/EI4vgJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGkCghhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsqOsK+I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGkCghhm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsqOsK+I"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698AbdJ13003627
	for <linux-kernel@vger.kernel.org>; Thu, 8 Oct 2026 11:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=; b=ZGkCghhmuHBMmUdn
	8mQQo9JAJn/0AF9mWVPIwnilEPGMHPkV3SdpEtTDW4rPfZEg31GS5uwhPcMivbX4
	mpqXmWn6BKh5dv6xa2A92CAQ6J4XFmZXm+/EBfNIwA0lvOUUqTlRCc97VEc10lGW
	iRxTg74trzUcy6+L5A+hwP/r84dqTPM7M1v/MmsYWZRpn1Khy8DoWcgfRlD5FgEL
	rZ09OhvGTN2pkhyKuBSvDEh172OzXyLFbFHGaWUtSM2rUW/XcfwSybTz+h/R+hsb
	/Q5m6NEkemQOlBpFSUrznu02DcVG5xCQjAXgEmqZgzD289jmDso7qYFkKJJZ5CsM
	hzbLBw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe82hm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 11:07:09 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8883dcc671eso3859979b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791457628; x=1792062428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=;
        b=BsqOsK+I8WhCay3cpI3Abcq8NBBZibKcUEK7wtxbhhHty1RYy+fwIBGE5mNkg3pq2c
         r6zB3La8O4iws3K4tU/c8AlRPjP6TFWcaVYNkuPiieTrjYz6rZHsfyWZYKqqGvwTKs+g
         BWh0Ap6qYFq+aHoiMkdpabIjuC0JRC0rHuycFGMyqTV6TzmsX3Ta85XQMI5YSmxytrbh
         fsJw2FQ715XyZxf0dKB/sgOpXCoUunHK3ym0Hw9qzmnAUNS6+AGSG1u2xJj+wqe2P12j
         gwv6XcDldSj99NRw2By37sBGFe+gHF1JGufL77IcSdkbc3fTmLJwTcfjXrGgXzxSXAMh
         yNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457628; x=1792062428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jY7/2tI7eBZC2wIrQ5f9ipLlIey/gEuAqnjaTBk1Fh4=;
        b=i1uH1hV9Uiku1W8HQiEW5KrtPGiVBCT2WpgJkyZoNpcyT9mE1KhOZ4Yce7OpQcbAp1
         l2d1FYBFyZiATLKX+Z3pVnJSSqVOdb27v8e+YCnnBXWDOhuvpb6TTSFsHfxW1QXSC90b
         FU+Z9xAEDUGuE5DwBvRikDVM4qNDSj/7r99LPJqdOv/HVUOF6s87Cg776YtneUwBKwS6
         IpCLlrYntMejPFs6dxWVr1iXqKwGJTtYWzZ5n1nogWzWKKADaHGIGZxsoV++ZChPEnXx
         byWu4qvB9KMDw6ZE/ZuF+kjlMajM5RoT9WqDAuX5Aal/KX1Wz8UrWb3NbjTMu/P0o6zR
         oLOQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmikhGnEAZuygPDro7vOh+YrSbZte4b2rToKyM954EjipYD4eT387eUwd/OscXq2E2RWn9ZXpNsapo8dY=@vger.kernel.org
X-Gm-Message-State: AFuF++m7zhln/azMAdnKX7yE5azeSxQzC9rk3Z6zfdJU1KkCoC8miYYF
	8oJ/6jTzjtQUkTQ+spcqUzojhivSctZ5lBx/4DPgp2xZNhbf4wThzza76rXPeyZznYi9tw9ptdV
	+QEpjkiWjHVNH+0VTQt3sQ2fpMGdk4MlinYh/quvDWqaW7d7lsvKmrzXwWGKErYRuJ9A=
X-Gm-Gg: AYBFou1vQ6TP+ZxtKrX4AtKhLoZDh6j+K5LEztZO5wkMnt6Y8G99ZSQuI68ymw4QKZ3
	F/PKIosDn2+jIaAnoGNTHk9J0MGx8xVys41pBGRZ2rKz2mt4K/py2pYm+50EDPqbmKG48DaKNnL
	Ay9MYgUrQwNIRKgZujjUq9KzLI8q/jxBPpaehthz6GMxO/WixgkhlPGofgESGMZfAkuxfKCtK1S
	j5tEdErYbIACmgqMPeWU9BtYk7ZHUlqjJ3B5aIPk86RZcAgWSOxtvrCpTt/o/advbK8YeiD0JOq
	17INOFG1SIOap9mlEuqav4pI/dAPPO72iBborCPlxvnHI/tfAaqNcuet5SVcttRb5sJUSd84HQK
	kRErv/icStElu9UqiWeqtwmFK/Q4y4JJoDejy
X-Received: by 2002:a05:6a00:4fd6:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-891b46fd113mr4532928b3a.38.1791457628311;
        Thu, 08 Oct 2026 04:07:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd6:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-891b46fd113mr4532888b3a.38.1791457627847;
        Thu, 08 Oct 2026 04:07:07 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892b560a21fsm1408917b3a.0.2026.10.08.04.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 04:07:07 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 16:36:41 +0530
Subject: [PATCH v2 1/5] ASoC: dt-bindings: ti,pcm1681: Document the
 optional SCK clock
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-nord-asoc-driver-support-v2-v2-1-0b6f7e94060d@oss.qualcomm.com>
References: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
In-Reply-To: <20261008-nord-asoc-driver-support-v2-v2-0-0b6f7e94060d@oss.qualcomm.com>
To: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791457615; l=1193;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=i/WjhoXcb5hRljX1mzFvMd3ShIpY3kWhHAB+PwlhiKQ=;
 b=HHluHddjG71Xk1Tme0+QZga3U984Edo9m5MNNgaiBlVVxTl9AB2DyhXPWEeyW9xIDsKKwhXwl
 NlE1RwsWR3MDyFXSt6+386vvEjMbalKf03FGkMxC9CO7NoudGGraPIZ
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX9xyvrUPGQk3G
 4KbEaHbw39vQk2Vtx1bXQBj/Srx4k+iS9TWrQpR6JwpVCnWJMFkLqIyHda13Dq9KaSKr0rB8rnj
 vLCZjNmyLaKMgjZiU3fGFoBIYDmowrAUTxMX2EfCyqgHREWGTJDI3Dfnl20j1b8wmAMR6N+JYwS
 CUbDfL1tco3+yviZP/apnFUnYtgoLPbY8z4QqyFYf5u897nJwKJ2GvOdK9/ILvbgsdGaf17WA+6
 Sd1kZmOSItYqTv+JvJK0UJfqos038c+fF6vWzs3vB8BLjF3McpXPDBq2ZjLnuSIPyptRcu+qqWW
 E+6WhpY1ZpUkakP6/Km5eFCvdGd4N8gSgg+bCtD1LKm9noBuQu/07tLfbpaFx1h3AK8jobk7SiF
 YtJv6JFSCe1lWl+zzpYod2L05/RvCVfTXuUydoLuluY8vrSgjJ6N+2Tj6Wkn72z6l5mRXB70OVO
 qeSV3YqfJ/rpOTd4WAQ==
X-Proofpoint-GUID: t9XA5pU1fhlZrFbbS9OikCLroBSBZwZT
X-Proofpoint-ORIG-GUID: t9XA5pU1fhlZrFbbS9OikCLroBSBZwZT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NCBTYWx0ZWRfX2o0J8wD+c54W
 HMTUeTiOc3UxHMYFkMP8YqZCeKfZEMpquSEk09AtcEYfkr5m7tZcPu+Amfe1t/d30RrWuN/Qaxv
 ykKHTpkyoadrH16RxneG6Xn9UAeZDzI=
X-Authority-Analysis: v=2.4 cv=MPT1C8Zl c=1 sm=1 tr=0 ts=6ac7795d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=T4irZKxI8lZzJthKl4MA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080044

The PCM1681 can use an external system clock supplied on the SCK input
pin. Platforms that provide this clock need a way to describe the clock
connection in Device Tree.

Document the optional 'clocks' and 'clock-names' properties and define
the clock name as "sck" to represent the external system clock source.

This allows boards using an externally supplied SCK clock to accurately
describe the hardware configuration.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sound/ti,pcm1681.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
index 1f0e6787a..1b3803518 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm1681.yaml
@@ -21,6 +21,13 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+    description: System clock (SCK)
+
+  clock-names:
+    const: sck
+
   "#sound-dai-cells":
     const: 0
 

-- 
2.34.1


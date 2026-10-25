Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792910912;
	b=AYLdqfHdRXMZYiA/N9izHrN2uX2ngyGIUgIKLylCVuZfiQZXu85dz4u5tSRzZ+EHd3ua
	 N1gnnXr4SRLBDGxvDJOge/RN1QifbFReAdYysYX+n75X4DQ7fbIltEQwHCrmE4LCuud40
	 cfA6gAIB6cq52ZY7YcDaT0QWahs4g2dY97lzPf/eKUHtMYYjtck62ezlIxVeQjT2Ndpgd
	 wUr93Ru52Fy942Z06kqM8Wlf7by067emrJ/5qPStRtyjQhbTlKq7TIOYqwyt5qOj06gAP
	 TEHH3NNgxNXpZOD6ORr7mIMSP8kNnYvKjk6oV156oPomZYdTWj4H9x2rjI10551rh4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792910912;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=X4mro5Ju+0/OZNa6+ydVcSk0tnNUNnmhCi4geW3t7cw=;
	b=V5lao+BwQI7w7y7v0usNwxocSYRxgznyOuzspJs000MuY7L/YdmcPiUp7ZLm1xVFm2Ez
	 1s4gPhwJSQXO274hONYJJnPBfuhSdT9C0oD2kCFRXJ6DMFxysX124DoTxzEGM+/eBSJXN
	 ouqYGg7vBKjtgxf/FBOCHkxWFW07lbwy6QrobiXNwAdzUBDk+nXRb1shuWDnOg4h0wzf5
	 BMGhQj0nIpKvnByV9TNJMFu3nWOzb/dCptB3iQUlUOiiNnEfGFll15qxXE/fZfPS7/Ch6
	 iD0cKRYVH0Q7SihnS5WStKNo5/CHhViSNXwJPBYvbXZb4+1w7Ey4snjk5lRUq/OJbxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B1f+FXkv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6BDgHi5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DFB3606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DFB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=B1f+FXkv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q6BDgHi5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P4uU4b2667484
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=X4mro5Ju+0/OZNa6+ydVcS
	k0tnNUNnmhCi4geW3t7cw=; b=B1f+FXkv7WIc1WX7NfQd2k+7LDtBtPw6hPcMIt
	uW6H1dkF9SaIWgTkE1hA1ujDe4uygBWA7cvg29F0TU8Jere/U8kuMwWnDmT8bn9Z
	Qgzv/LAYC1sK7SMYsfAirdS37PjPbqRDVDxB0bTAQ+iQeV/ubg17HQcLJqZ8oz3W
	oxiOcLFgsrGKc9PHZ8QIoU9QqI5yx6IC0MHF/KHXh5Jvm1TQ2yZ06G5RrAbiHgJY
	g3+wUL9kDSAGxZ3X/m2Zgwbn0SjsW3iXJ6G++7baLJD0jPtEwj7zVAlRJuFXt0WG
	TH7Qot5Mgqz7AAYrXC3hpIbo7lMY5vYWiSA/zNv2x+uFg4EQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9ted5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 06:48:31 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3663d3547a0so230667eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792910910; x=1793515710; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=X4mro5Ju+0/OZNa6+ydVcSk0tnNUNnmhCi4geW3t7cw=;
        b=Q6BDgHi5LcE4ayEdpYZwr7s7IwLaZoSv/v+TAHBcRYrXHwswhbI//0rmvt+qvQ1dQb
         4abuOXwHrQOzTqUZ16qjTNAvJjsmkpnjqmmtqeDMXHPqEXofhw07oNtP5FvhvnbpDH0T
         Ka/jzrxoWIK6hFgiQYBUyX4nQP0FQEV3FfWCNeRPj52VtMhTtrmRLTcG73sBL3ou9WAp
         D19wUyz3qIxsr1Pcgzb+R6p4hbebxSJ2LEXZO4+JpOEUz1Snli85rm9xRodKNfgOiU+q
         FknkXnLUc/jT97u6/0zOM0xZLhqKBCpqK27WWnUieKhnSuglyyYJbhmz5z181LhdtLr9
         g1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792910910; x=1793515710;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=X4mro5Ju+0/OZNa6+ydVcSk0tnNUNnmhCi4geW3t7cw=;
        b=wY48ILX3Piw8ZY5f9BEj+qpd3f6hBcKvUWfhnvEVTZQ7zWPQHx6HdCJo7lewaxDjPs
         deigQ6imXLPxtIiHz4YUOAZxeUnlRV3dLHKqJA2dTzAkziK4QY1hDNJ+JgfTJ1b/8db6
         OWT8O2pcr10IBlgE41jpigrUfvDthHShBa2V0TQY/q0QGQfRamBStCO1cRKDw2L9uvDS
         o8Zfh4zU+S98TluaS01MvjP9aOD7HNBFGkP1NmLP7CZHsCLqZGcsx4wDR5AFmKPb741d
         biF7q8gb0fop7NgEQupGVnDvHwpLKTDHg10d2fZYjIXt6Nz490wAmK2pGRNV+oU5sPwG
         0/Yw==
X-Forwarded-Encrypted: i=1; AKwUvBwUIIuq5TCYt9QT6z6Aw8+Qix4u8AEUyb+meDesOW2Ty7aqb9XNtMQ0kjZiPqd7f/YMuY3hkpu2MKE86x8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXtXmka67SBJtkO2LTKZDD2GxyFLyONa9/YWXfqIvBaKmw0eLl
	ZSGitGeUgf4yOKTXAHYu8rRIHJ+1Yx2q/4qCwxl+uHxnbA7OdEW3hr5QJ2wiQVOymJzxGK6UFki
	GPsq/fPYMee+uLPk2JVXQLh7TtaI5i6R+gg6Lrp3Dp2F97rPpP65d1CqkZdBwK5uni3o=
X-Gm-Gg: AYBFou0+4RfSbefozp0bRY2JW3Ayqartof2SH0ZpbCLmDpgtHpGQPq8p8mGw0cU6+oE
	fVI59aUGr9nH+vhC9JId+zACc+pu85BZB2MKTsJ7fXGzTlmtuOjNpwgyWqU7+P1mfZ1CU3+E48j
	nb85uYuzzRmemLcX9kOktSKQgNkJWxVHGAZBPe8y2WIsW1ZuL3mg0bR8SPzOX0wn7odq2fN4hma
	25u4/IkaiWwT6HOfLdYG0XgPnrjzPAWWiTFbQgLWv0UAnnTI7Dq1lee0HRMi0euP8qecMn2k+ht
	D8Dl2Yvgq99//KvT1LeWq+YSk4DRSL8NUc/gz62nhzCg9SODm5D5Ncq7+oa5EeNRtPVnFGrRW62
	GegDTMFGwBjCeiQ+EW8Lfq64G8afyK/ZuDST2MAZ7GjDIcRo7yquZ6hbUxZjMWClWwSZFIjVnL7
	Xmw37keNxATI0X+VDlJk0eLgU0O1AQi98aALULmH1gaKEpfU2AL6ak
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id 5a478bee46e88-369e821311amr8345547eec.0.1792910909949;
        Sat, 24 Oct 2026 23:48:29 -0700 (PDT)
X-Received: by 2002:a05:7301:19c:b0:368:1f8c:5f23 with SMTP id 5a478bee46e88-369e821311amr8345520eec.0.1792910909428;
        Sat, 24 Oct 2026 23:48:29 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db7e73sm13649886eec.20.2026.10.24.23.48.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 23:48:28 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 25 Oct 2026 12:18:17 +0530
Subject: [PATCH] dt-bindings: display: panel: ilitek,ili7807s: Allow
 backlight property
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
Message-Id: <20261025-dlc_backlight-v1-1-1d1c49c3e101@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADCm3WoC/x3MQQqAIBBA0avIrBMmoYiuEhE2TjkkFRoRhHdPW
 r7F/y8kjsIJevVC5FuSHHtBXSkgb/eVtbhiMGjaGk2jXaBptrQFWf2lCdEhMnVLa6A0Z+RFnv8
 3jDl//RLYNl8AAAA=
X-Change-ID: 20261025-dlc_backlight-c00d00ec8f62
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792910904; l=1110;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=KEjEjjiW+qz2CFMhiqwDXwGVoBcaGxFwtK5Yh/btD6w=;
 b=ylj8Su/xsVS1c7l08nNRZ+V2yiouVkhZg1jT7eGaGd1z+hATN4BsRBfwWI817ktPIOmaDohGF
 AVCrKxZAdVVB8JVubT0YZ2dpuDFX2fRBC/RFywHiADGjoX/5Coo8lAz
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-GUID: dURUxw_YuNc7zfYXTTsGZrSoEUtaQKO2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfXyVLSBN7JGJgF
 HiP3M7VLq8mzq8yY+R1Btk1DobAbJ2RkarMeelgky1sJ8DZcPBGbxjlpcEXEuu8if6SVfFl3Lmu
 TEZV6kbianITO9C9KqedkKoqsdWs76fJil6oeZcAebWZb1u/OI4tSYdA6zJI46Y0f1/OgMMARp+
 WDNHTHQmmccsIfxTLRRk8VM4g79zamerM/imhpTQaYNPjSt2gwADZtTJ7aO5nCWJoOaA6+QeBF5
 LbIvOwccQZaYhIvnhit/MNr32SphJPohy78boe5XRMLXYSyVxMCMYesBQcXoqHN/wWhw2nTMIqu
 7NSLiKS36NB1vxDktYo/PkFltA2A+Vcky7Hv5X0U8448kQn5IsWPIH7bd7B8bwYKLF2TJgKDNP9
 oyZWUlAyDhSQSuIST9ZPnvgQCWQKOPiPH8RtlX1bzDkljWY1YxGM9WTskDLBQ2c+fqx7uiAU0CK
 XCH/dSpUEI+Ozqkp1Gg==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adda63f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=In323_k3SEhDHscflrYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: dURUxw_YuNc7zfYXTTsGZrSoEUtaQKO2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAyNiBTYWx0ZWRfX1a3pRQTTpgry
 Ppuq4B8S/MCg0A7gmvNT1ecGRaFixDcbcrJxN4AMWj2DwhhXX6PKVJX1INJ6PerIlTXOWfCx50p
 Eq8LiyRqH4Ce0ZdxmOMCjYvQ9fHnPHI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250026

The DLC0697 panel is lit by a separate backlight device, which is
referenced from the panel node through the common 'backlight'
property.

Declare 'backlight: true' so the property is explicitly allowed by the
schema.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
index ba8c5bbf8ffc..46b941c18565 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili7807s.yaml
@@ -23,6 +23,8 @@ properties:
     maxItems: 1
     description: DSI virtual channel
 
+  backlight: true
+
   vddi-supply:
     description: I/O voltage supply (1.8V)
 

---
base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
change-id: 20261025-dlc_backlight-c00d00ec8f62

Best regards,
-- 
Vishnu Saini <vishnu.saini@oss.qualcomm.com>


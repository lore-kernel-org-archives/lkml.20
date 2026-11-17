Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794905167;
	b=pCPy88oeEAsp96CZbGD/N0/+vpVT926Sxr89lU5HBQTpUIjIJGKRt8n5G05C6U7IKrci
	 JZ7K5Rk90cBASxcWR5Vc1JhkA+OXwks1bPPEYXUH8RFDiuH7cGgHo20yQf03URf8CafvD
	 wAM+Bx1UUxzKi2nFNOil76DfQfUJuJq8LB8JTB8x5i+tSGwUmN03HbqmbpZCRFL+Hi+0f
	 pYLjgvS8WuCaxEXmBeEdCLKkhmzJ8cC4MCPZ1DEedFrU8WfkbOJ7e9yj4OpZzqAnbDB26
	 cRlaQNX1sU7KNMjvCDSFnSe/6LOPZ3UIXSpBIkQpJJ9PbUCpf8yLWzBnKaTPWu0JaeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794905167;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
	b=AMe2QW9fR4QyXNvOdBfMdACNOGsVTB28YZzNkvxWkeXhQO6NTvCV2jDEKygyT4oa9gVr
	 7AkLEPvmcZ0mi3vqHONP00dgHQKHA12p/Hqhm6p3oahKc2jWoIIZ4HW8PzqVx1EXwQGSM
	 KhKOJJAtxsfT+i4ucNxU7y8HglK6sSTWNw+4qfl3KSd4v/ffyUJ/2SxrQv2vVe8IvNWa4
	 DLjFueqDOVUP0PTSSSNcRHuP5Wp/y2ijX2SMUNxGu1GBrTkSMm3JYPOxyKs3O/t3UfwB0
	 KUGvGBt0mKOiby1/qnqWRJ4jmbFcg+NSW47ShZASlRPCKL3YorBZHpzzu6+jh4W27lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Q/rnF6/Q";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK1Kk2GB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E83606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6E83606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q/rnF6/Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IK1Kk2GB
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH4492h1699358
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=; b=Q/rnF6/QYmoq0Fp3
	l5EArxNdwZ/4pyRKzw3wdqxLwoeL3EIwtX758TA2dtLtcZldx1uZXIgn/uI8Uhg3
	iZEbWY8o6ybfVTr20hDbMZjGJf3JViCf0Q0nvD73gkTNPJhhFp/xnGVD0mKuAGJp
	x1z7Z70d/mMr2NlZDy+HNwJ3nsEaDa2oXrN4jOqwqcmCwyR1iPop5e915Bct9ZWh
	EX6QPoF+OdiKzQ/kshG99O/qnGfgAbBKglE6CUR1hqB3drmDeBH/CS62dI6u8mMX
	CYclj77C5qr5YFA23iNwl3vBOxq8pjVdCHydpOgmFQWK1+eSh/A2CRDt3RrSA4Hr
	H4Bl4g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0fjugyjt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:46:03 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b647bbf8a9so4964174b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794905162; x=1795509962; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=IK1Kk2GB+mP/f9YnL4naocz/yWFyR5d0sNvGIH8z/WUPPxCqXvyOMVTAOuPKDf73kh
         upPmQ1Ly2ohCKHUult7uvNH0pwXgJZgij8HDCcW92wbXi3TRV1oaxXSn9wItR1YZyfga
         1DKrLqLfJ1MY6rP6ibuFSjluVWA3DL3hDnjStn8hpppi6zf1NyiJwB480QullZ7Two8f
         X+CqCxdkmUWMMYFu1d2n/ReUWZNINcuTFFFpHmXCPf5HVqfpCrOM/NOysyRp12dTXF4M
         3Marf5dMLGt/dv9yZR2iiaVD+oL981L+GHb9GJQDR4UPoMm6FLHfEUHDNyB2E0n9fo7v
         JvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794905162; x=1795509962;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ONajPToWNQsH3bje9f4YKZ8akR+X/G6mwA9UKMn3Cu4=;
        b=B4a1THqRQWZ11yy2NEeUt1RoSp8Y5n2temPMJW46qRcNfJO/zeSC3My2bMAOOY6WDr
         tHzaw037pWRTvYJdli5s8yphTWvq9IJMtve985bt6VLkXWigWMcpCphmXorn+qWSxEGq
         y99dkt2TIY20zNPWiPjvdTE1cQIAdPFENyFwKXxE0sUNM2tTKUL8RIQmHXeIZe7HwJu4
         PqDipm/ssswYwWglBHxQ4+Xn1R78g0y0rP5ZwbhBPgjXKdeaAYyqVQ5FJAr5Twxss+tU
         t3keKhsNiGXYcnsULW2qhrYKzrVvKp8oURdwua2cWx24aWsu1vrNO6k4JCGHrG/zfHMt
         /KXA==
X-Forwarded-Encrypted: i=1; AL+hErFhY+7sS3DXoh3fAFsHqs2uBLbiSbkQ1BjeNQkypJpAjrLCSpmXkWKyharcfA0JTsFdR86r3eP5UNVNzPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z90LgK2HmdD4DbUFKN2mP+dVmSxI1QgCs2wBG4IK1y1qHDPa06M
	+9F0FEs8Y6T6v71xXT2gwtvkDRgZQCm3HOEp8aY+oh3hvgTjvvnQCXvJvvsAz0BU10BYCrHJmL2
	LCdmvxBodIaMV/MPBhWQ4Xb0bFWYVrBj5XT89yKZlIs4n/1I/ZakZvF+2N3RrPgPxGBE=
X-Gm-Gg: AYBFou34PUjPHQB1RUaAhRfymY6sTLus+a10zuqAQh0We63p7yCdx5DzgiD7tYKeBBJ
	b0hsWePiuL1WV9kBYjlMmckyXrzDH8Cu3DyZa5btPR16BC+YE1vOtdP/gyVxDQ4Lpa/IRTXOu5T
	uLw/j4VI7sWMrNFgYwpIPY/yRXoHzo4mEJ51aSaJNvQLoeHLe6cUKS6iXfzkFNzt00b51I9Z71B
	ktl2Kaa1YyqnFxYVlj/ipAkC3QeYhlp8UwuXVrcKXDiEJnX6aXLrUsNgzOCJC/HThoJUkTp9oNM
	i0Q/6UHieKJtVGPlJNu2TCU33HhTWcxIEFmjJlZGHU4uxzJAcsTcTrwzirYWd0rBDBv1xEGMLHQ
	AQ/DqjmMW9PCeYjSZk42muc5GKAJrxoJFE/1ryFMzDdb8rZyCBaEmJhgRJqG4JVyi0/B0qXxF1F
	UGhA==
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500702637.9.1794905162450;
        Tue, 17 Nov 2026 00:46:02 -0800 (PST)
X-Received: by 2002:a05:6a20:3c89:b0:3eb:a2d9:58f1 with SMTP id adf61e73a8af0-3f7a4abed30mr13500655637.9.1794905161882;
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18736b3sm5699585a12.7.2026.11.17.00.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:46:01 -0800 (PST)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 14:15:21 +0530
Subject: [PATCH net-next v4 01/10] dt-bindings: net: ti,dp83867: add supply
 properties
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
Message-Id: <20261117-shikra_ethernet-v4-1-c41902e5f2fa@oss.qualcomm.com>
References: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
In-Reply-To: <20261117-shikra_ethernet-v4-0-c41902e5f2fa@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794905144; l=2011;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=mjS6fhMb+ocKCpwPGoezcQxON+tek+N3jqUG0k3PUBM=;
 b=UsajLsR4goRt9vLB8c8weWLqISCqGRYgLriF+2Qva5JGkNQYR1Xf/cnWnH9z5/FOM8VStJqU4
 Q2P+2dmPjHaDuPD/KD+Wqbv3dmD1+74n+G6rHFACeaFivzupgQ24HDK
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX7hSddkJD1XIb
 2vrMqRcs5ewWjTkdevqekOYHskqOUCTsV07X18OVwhEE6QZwj7IyCubGxKXOS+HpVcGGu+w3u/1
 AcB8ZdpKPbgkaMbnQJ/3PBBZvOrZbX+0AFoD3Zqg5/XAzjIvi/SJjQ8oN/AoEa/e4ZTByWIhIRq
 rMGtkpRm1B2r+NsLGMdw88IW1RbcEnT0neYYidNO3C8hXBHZ/9q9WpZaP6JEtfT8TLRMSL6AjPi
 RwniW2OPzzZk2euzmeu8sXLSwtduWIdShIcFtHN417kXV27XhhwvTgusxiYDZWJhGkjET7GbEHd
 bAsnjyxHrctQK6B9jUO9WuUj8hFxpY531NknatTcBULdcENNZNEqYFLHFqzkUhvremP+j01b947
 4ukTybpX5KRccuTjeGybAb00ac8FXDnqfaTRnZlg/MSuo7STQK9I08RZLX8X6h8JxN3muj42FZB
 mQ0h6gd2fPSD89dP4Iw==
X-Authority-Analysis: v=2.4 cv=JfIpPkKV c=1 sm=1 tr=0 ts=6afc144b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9lbML-Ic3bjincHAjDUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: sf3hpC5cnJt1ig-4egRc3d99TOE8_163
X-Proofpoint-GUID: sf3hpC5cnJt1ig-4egRc3d99TOE8_163
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNCBTYWx0ZWRfX4b86PYfcvtMI
 B0ScSROlsp3PWrNN7OnTo+RBrW1UAWhWdVdMfQsyzDQDgV7mGPncpKVbM1H8kXJnr6kJype+FLY
 WoxaZ2C2EkqGx/1DpqDhUbjCjmmsMXw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170034

The DP83867 PHY has four distinct power supplies:

  VDDA2P5 -- 2.5V analog supply
  VDD1P0  -- 1.0V digital supply
  VDDA1P8 -- 1.8V analog supply
  VDDIO   -- I/O supply, which can be 3.3V or 2.5V or 1.8V

The DP83867E/IS/CS datasheet (section 8.3) describes two power supply
configurations - "two-supply" and "three-supply".

  1. Two-Supply Configuration: VDDA2P5 and VDD1P0 connected, and the
     VDDA1P8 pins are left unconnected.
  2. Three-Supply Configuration: VDDA2P5, VDD1P0 and VDDA1P8 are all
     connected.

VDDIO is a separate fourth supply present in both configurations. The
datasheet specifies that it can either be 1.8V or 2.5V or 3.3V.

Some embedded board design expose a GPIO-controlled regulator to control
any one or more of these supplies. Therefore, document all four of the
available supply properties.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
v4: This patch was accidentally dropped in v3. It has been re-added
as-is from v2.
---
 Documentation/devicetree/bindings/net/ti,dp83867.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
index 4bc1f98fd9fe..e78f08ded3d0 100644
--- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
+++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
@@ -118,6 +118,20 @@ properties:
       Transmitt FIFO depth- see dt-bindings/net/ti-dp83867.h for applicable
       values.
 
+  vdda-2p5-supply:
+    description: 2.5V analog supply (connected to the VDDA2P5 pins).
+
+  vdd-1p0-supply:
+    description: 1.0V digital core supply (connected to the VDD1P0 pins).
+
+  vdda-1p8-supply:
+    description: 1.8V analog supply (connected to the VDDA1P8 pins).
+
+  vddio-supply:
+    description: |
+      I/O supply (connected to the VDDIO pins). The supply can be 1.8V,
+      2.5V or 3.3V.
+
 required:
   - reg
 

-- 
2.34.1


Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1734D9F77;
	Mon,  5 Oct 2026 17:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221652; cv=none; b=EbV+LdjgdyNtdeuyH1TV8KKsmXiFZsWqXfysl4zDQVJe4FYBUMAcAEbgcTFZ3TMgszGOY5/v4y17RcnBVzTewCp/h27ar2wrMOx3haNZgaY4VPhq+OJQEt8h40tiQcWcQvoLv/S9gk0Rx4ANV8WlON1LfHot9tnieUBH2WzyZd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221652; c=relaxed/simple;
	bh=1/QNs/RXd3I+xhGhK087MWiQ67GOsTw/k2ZWqVa4kDU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=NOeCTqAUNsBbIBiYZdziBA8Yzoqr+vaiqMTZn+rwOcDWTcGFLwmgf4sUt1xtkhU8UZMBgx49SCqNFwpqI/dMw8IK4HjZ8OOIh8a3hLG5scf7ZLjsUl6CTkLTBcnpfI5FzTPaclLLSR5TT1t8V4j0s48bM8zYvBi7lJLQjR5R29w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KkwmzThq; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KkwmzThq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1791221645; bh=Wur1NLL6aiOKmJUmUiVG+uZqeCciMOf0+vtQvT0dX/Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KkwmzThq9Isw/vQZJYqphJ2q1JHrl2tklgcStXGb/7cG1+iEOKR47AuTbBCl/Iliq
	 xt39/SO/51CKYAJBFomXMedyEH3NSFTx2wQzyv4XPpc650cAR/v/gS+Lg+CViZisaA
	 aSTHmAgbvSLxFytRAOK4XY55B/S8kBmAa1Bmd18w=
Received: from AERO17.taila7786d.ts.net ([2409:8a7c:21c:8010:c675:1308:618e:14ff])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id 7A82281B; Tue, 06 Oct 2026 01:30:40 +0800
X-QQ-mid: xmsmtpt1791221443th06dqgbu
Message-ID: <tencent_083C0104B06626D418A320F00AB992DD7B07@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XpybnuFTaIZm4mrEpr2c73AFdvMwVIo3lC4zNAU+ilEx13A1PAQ
	 N0vkhR5a4Q0H675Rh8Ar+HEWBXmfybqGyeAghMV6EtAEhUgFdEtnySAxLIlGOK80FJrKj1+jbEeW
	 uU8G5+P7nhuACRKpVemdSsV5OcCP8jkZrppqSY/kAmAPLC94gsy6KiuypZtlFmXbmdEKNwOosIyI
	 v3XTzIMdOGoqBGZtf0eFEo3wo2YztGGhVX8EpnwoI2ryiDHeawEZX7yuPgocwNyMUXDnwVSJ0Dt8
	 w2gFkc80HvxqrgzLqLjOsNgOniGiTRZwjohYL4aYIpFlDa7lKGV1lXJNsVqvivMmFwmldBRNFdTI
	 hqb6eFLWnv1WWRrDoH1G1HG4mV+XhxyvBRfozEYnbOaL58fo0RQD9i1W1m9hIeKIYUT+KRPVy4zM
	 rRG5PccMfMVPub2EmjvfBdKdl1WcWDLLwgFVERI8sOHYpnRgoW/CHOlXZz+jcQ5fSvWV5xrQatAT
	 Y/m1gCbcfZVs+acjb22oWMxlDc7u2o82zcKJRnNgTsb+TwjZg+PZeISv8DYolzP2Gv16RAt2onud
	 PjZysveZwyeDxEIGI3gHpr/+8bFdZoIS8bXDC4jDqyBQbonxJs3bCs6khg1001QB1w1HzRDcsuC3
	 owpsTqrCQ3xzhvu8GYi/LDN2slZp/6TP5vh4q5Aw6Vhk0FSxXxk4ByfdbRcdvQGSZsIbTdsTrvhY
	 L35SVyh0ksEq+0hRB1+EvWS96r/rUgke7uByySS9XS9Ra/1/nPPtfRxuKjGiS5OQwT7LeNc5Njh1
	 vMU2MbwqOmBeH8beoZVeo3/cOQrKYVWe2ccMaOPsGmBn5JN7eAgdlALpDubiFeVLN+wm9AwfK705
	 pXKjfuss1IfcjxYWd9zAtxFpps/Fx4byYy58RDteXXUowj1+DXIV6cE+EhL2FuBotc5w1f4XbH+j
	 kkmW5RVT40zQUR8SEHwwyZIHo/xitdDA8SxSU8XrELWhlyMiSoBflsqHqkpenikEDpqLtrxZTUQN
	 3UOchapfr3PClKeT+GJAky7WHItA/Bu5TdpxghciJPMkhA6UjTMmUA1rKD6Gzu0VmsHqF0pcUBmO
	 N53mBxiBgRfL4/BNjL5WXvrGGkVwzImgQU9qr2XGhu4Ygt7ec=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Pufan Jin <2254650260@qq.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andrew@lunn.ch
Subject: [PATCH v2 2/3] dt-bindings: soc: xilinx: Add ALINX EdgeBoard FZ3A
Date: Tue,  6 Oct 2026 01:30:38 +0800
X-OQ-MSGID: <20261005173039.707304-3-2254650260@qq.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005173039.707304-1-2254650260@qq.com>
References: <20261005173039.707304-1-2254650260@qq.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ALINX EdgeBoard FZ3A compatible.

Signed-off-by: Pufan Jin <2254650260@qq.com>
---
 Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
index c9f99e0df..ad7c71f9b 100644
--- a/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
+++ b/Documentation/devicetree/bindings/soc/xilinx/xilinx.yaml
@@ -46,6 +46,7 @@ properties:
 
       - items:
           - enum:
+              - alinx,edgeboard-fz3a
               - xlnx,zynqmp-zc1751
           - const: xlnx,zynqmp
 
-- 
2.55.0


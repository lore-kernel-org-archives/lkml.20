Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867394;
	b=NoysLZ7Tv6YZ7OQOsfXcuoLegItWyyrqgT4Lz804Q6RqUIbPkbHq5TmuOA66F/COY4ci
	 eK7c4T/dLpu2mZMDuhzcqfb4x5d3Vl4RwOSE0P/HMC0fosMK6IdeaU6bUXBv5EvM1qbSv
	 qzPGTDFyXNQTwXZFfHHyvJWOQOd0qLZ6ayxxup5Z/5Cus/KJZYsvqKpJxr932nBMD9QxS
	 fHRbsuxK9w56cEe0reEc0qDCR5LsCE4h+pW9sWI0g3qf/0trOA7WBl3ZfgSnKQYZLWaKe
	 3NHLu9LwPOwbr0JNF4z5SK34dPA9m/zG1L35V5NjyzsoSkWmuiM4YZpe2mruTvgLT/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867394;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=CopvvqhWid9fiExsBsxW2G2T9Z5Dr++oJhDSpnNEa7E=;
	b=UMgTV0uQoMCZtT4wzd9LZ3tpEEl4lOtfF+uzFtpclWVt5guGQMvCs3g/LNHOqaf92g4F
	 40eHzQ3TUIVgvxnbsu+FMH5/rfdeUjSq4tUkJ1xTbzGWDVnirHx7u2MPcz64BqSFEweel
	 tT47zOS1hY/IBadt0+ZiM8zmBjjRACyZlEAq63bwOWKZqyUFEj+SEwwOrTNAbLvn48efM
	 BlG/agwLDOjtBgnNMlN7eztYwTuJEvI8O+yn6qbnlm7h39lSWsMSPCDcjr0ML/YytIVCg
	 5siEPrd01KgSN9Ov7ZhyMRWaIE/JNlwDIAm4sP1SHZvezJ6Le07bjHV42D21WBRXjrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tycrbvdT;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A16606A32C;
	Thu,  5 Nov 2026 08:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0A16606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=tycrbvdT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867375;
	bh=CopvvqhWid9fiExsBsxW2G2T9Z5Dr++oJhDSpnNEa7E=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=tycrbvdT+RV7mYB1eAtRzCIy0Tou9MpJGN/4I9cjlGjGe8a4V2kSCIu2S2T1geQyn
	 oRBAWpXB1cR2xMAYxX4PN5Bwu0hrsjxicAEjVu+GDPGHf3RY8OE1SrI73QnQKAV/3r
	 ouixB63NCJ5P6g6B+Owfe0iYJq21xLGAVWl6kbKA=
X-QQ-mid: esmtpgz15t1793867374t0c3a66c1
X-QQ-Originating-IP: W/Ln7rBhQsWfKhGVkC9nM9jBRkjphOV2anfcWAXMPbU=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:29:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1637689771413805763
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:29:26 +0000
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add K3 CoM260 IFX TQ
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
Message-Id: <20261105-k3-tq-dts-based-on-com260-v1-1-aa0b7714aed0@linux.spacemit.com>
References: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
In-Reply-To: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=849;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=0cRTat3hlAAUdXn7s5TJaU5uAtb3Men7e3BzfMITEU0=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlv7NI6eq62H3GW8UhsPzyHfU2aSWLYY6Oe8FcFXzrLN
 K37Pp/sKGVhEONikBVTZOl+wLOtwCfKtkCg0BdmDisTyBAGLk4BmMjmRQz/887v9VF8tkttt956
 nqONJbfusJyTN6jbfj8rhd3DdIfWaYb/kUyWKdOfZJ+Kbe7eocEpXX/KxKlzM8PGzF4/Ma79zBc
 4AQ==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N3i14PjB5Od7hDrGQvkUvpN1bzhyBChT3MXt/eBolPzpUk/Tdqi6NRbe
	r3V6SpcLYrLccqUPKyO4z6x37LF8+zJtkk4ZeB0c68bWfDAvvFIg0mf6UmqxUALwNPERhDS
	Dv8/4UJ81mCVjz1LGRwsvyMdr2ELx0npXrVGN1XQUo74V1zl/p4VKbFSxhNCtwUdVOgIRAz
	HwbMFICtElaTF2wRPnvtPqPwR0fQ/gEE/jEkr5nf2LY30qVLVTjK+IXRTZx6WLFnfeFv6yL
	vhBx3miVbz/gzMshfUI1Pt3u03/XVj/xSk2qo3TYUYSRch4xIZPHrmW3jA7hhwgbqc0CnS9
	Z3HIijyFpYTfmBuJiySlPiFoiZXUcy52ea1MVOtjikluNZpEiiUFuxl21DYRslRdt+qwJXg
	gM+fJe46fbBPidzjClKQQFvt2xm0jHIqun1BypEwmeUC009Q3ReGLdCNQoIbHynMeU0pmT+
	uyMumUjT6usAkjDSlVJOMtl38YgqPXNuqi/rXrla//++O1G1mN/7vbcx1Q3rCXwcZHoa8z8
	HrRT7uZzmedLVsm3zqa15eOjfnsRq/EC3DqiyCmnN24OEWtsfJo3rIVparMJS0Y2d/6xuDC
	1uIX4mI4ko+ErOdMDvezNxRdkzQqDNq4eBT2aG6qM8K9eFPwfXyM9Aez2AecFhX1ojvoieO
	YTPnsVBmWOxZ5WPB13VJrtAg+r4LfCs9fmaZ4ubE9Kpxt4Qjfps1eSr/dYbursUhEJaB/YM
	vV3wUwNSJjWD9uXF74PO+XAjXMKGRLsx+gbGGGByLNDa9t8PfY5aeNXXrfkJAjLLcHkDDJq
	zym6MLzckdy0P+BSQALWm615Ukx3AQOfIh8DZmgox/1Qw/Etrh0fx7644rGKpThLZ8OXTll
	vknCS7MWCKG7AchTw1j2Dg38S9v9Z8XyLszBFt5ceYaEbdBKm1UwtYxgEgxMff0nR7ucLjV
	JF1SHafeustPYSu9fHgXSkD0NQtFCLnErujOrnTLWX/pLcOzCuUdUlDpmWhvzJ0aU8sCke2
	a75lAztwCpj6lu1F2sEQI34X1B8D46HBN46lcJS3u5ziXQ00+EZr3UqcyzxbGtMp+r6mlBv
	iqJDJ+D1tYLsZFVVhTFOZOdsEs3IPR4aA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The K3 CoM260 IFX TQ board combines a CoM260 module with an IFX TQ
carrier. Add its board compatible with the CoM260 module and K3 SoC
fallbacks.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index 4ee9c88984b4..9b115b4e4b9b 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -40,6 +40,7 @@ properties:
       - items:
           - enum:
               - spacemit,k3-com260-ifx
+              - spacemit,k3-com260-ifx-tq
           - const: spacemit,k3-com260
           - const: spacemit,k3
 

-- 
2.56.0


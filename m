Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878585;
	b=WPpM3Qs+/daPb+F+t1BWFA6sQPGMO+x55ZxDoq+dvJG9TgcJgiUL8XtA5FFXKFYv8AZ1
	 mM0oBYo6xOkKxeTau0lawtnurL1oggBRe0DZr4H8i2j8P5CCjxrAaHh2y0tns6K83Pz2e
	 DE9ayORPbenHmwgSmYup0cnkLteWryLKTJCjsExMUcxLICbEJvnV9XlislUX05MOcEuHm
	 3EbI3Er/rht4yc8oGhicgsZ3ybdwKuas3iI09Gz2xcdPRTIfoMa8iwjsaPiNyMlxGP1z5
	 Qxp9A0JrAoeteBSOI3EG76F9g0+OESvXkxybj7MKYpMildDRC6OJpqPhMTL8M5y7iEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878585;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PkCIk0nczsEa0INFlkyQuIwJv3tgvPW23103OJwDOKg=;
	b=457Wn4+fP7OBSW961AGZ1aSz4qYETdaoveCMDt0YA8b3GPlNPKOCXCB2Kf3QGUrxY2Pc
	 YP++GjKZT23xMoKO892CFsPT29HGRxdjDb1a1mu26WnaBHHs4Xuna53fKT7bDcRgqjXcc
	 h8Qdwvuq9FDw0CYpT+N3jHdWO6VEJyOXT5D7MWKNi5VOCpyQDN+RUIyC6spkmthavwxi5
	 kPnOA9E7bpsPcyEu1MEMv9+R3TpD855V51RXjyjNGydPNdaoKCXwjjT6Qj6CrT9Oj8dt5
	 C8TSUgVTAU/Yc5h/Y5XvyGV6ZVnAzO/Q9sTExrONzcZvEircHEd8TqOE5XmuH/j3FLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jannau.net;
	spf=pass smtp.mailfrom=jannau.net;
	dkim=pass header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=d6akgC67;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4pVduS2s;
	arc=none smtp.remote-ip=202.12.124.148
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3192F606D805
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:36:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3192F606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=jannau.net header.i=@jannau.net header.a=rsa-sha256 header.s=fm1 header.b=d6akgC67;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=4pVduS2s
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 80E1F1D00154
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 06:36:24 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Thu, 05 Nov 2026 06:36:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1793878582;
	 x=1793964982; bh=PkCIk0nczsEa0INFlkyQuIwJv3tgvPW23103OJwDOKg=; b=
	d6akgC6706S71a/odIIxuJWlj2N084ljHR/ZNAYsosFaqiwQdqsLUluxIpUBO9Z2
	WfaAnqJ96TNoHTYx3iBG64n1PO1tuWxp6XIJ5BnfJf85CbDVH1LEtUgl+rlwACYG
	qnqyq1x6nphcEaEvNMSF0/oAB6JXjZmz05sVpINApetp5/kEkyQoQ8FhDB1/anhF
	eynSN9XrnMKHN6JbiGb1KK8acef2mRnpmX+AWevgyJsjIFNcKbI4ewe/C4R/c07R
	1tNhluxTo4ORbUXpeUJUBvCWNca0AujJ5ysAfhyA64OBpOzszlXscK5mStZ3bU1F
	ZfrkTUgQNwhbu/7NNP7o1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1793878582; x=
	1793964982; bh=PkCIk0nczsEa0INFlkyQuIwJv3tgvPW23103OJwDOKg=; b=4
	pVduS2sWSe+RFSD5lcihtlHFxvYVgce1q/AgsiQuyGrbp3uOOVvywrlvZTQcLnNW
	Y4CyAPqVL3edJHyjmmNlApqxLRvsT6C3ii2HQJ9PDcQZbN73q5//FH0o7lvF/mkZ
	DO/4dXMPc6tx7WhlFdgmdYhP3p0Wq87wg4qSqfZyKKz95LLcS7darS2qwCLX5MGH
	x9qVT7UpLYc+sRrO61s/L0Edhf7tA78tMhAabjJX0hSfQnsNJGlftdbTiQzYCXas
	a8me3gvVS7ufPQQIob/Vb7XNIBlnNOSHwv3wtf1JuEX4vAvgZBYPC2ooemXxstJY
	/tHvUd+mWrPYUcCLcbhlw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=jannau.net a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793878582; d=jannau.net;
	mf=PGpAamFubmF1Lm5ldD4=;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:nK8roE1s9yjm111KQBoLh/tpVskO3zunjeyLorTCVq8f7Xn
	5yci8J182Ec68v3YAX0l1a0nmW4ykKDpB3ZkLs0yGeKitpbgzjJz7avyVNj6JTe9
	4qXyktmgPlmK1AmlQ1HJgj6nsHQkaBRoiXRqEJtpVlHOgjlqrUvlsKcKwlpIwGF3
	cN9AlPDO4LcOru5UBL//cF23AsGEOgmcEdAq8ZqvkDcgml4QLqULTiwxCEtu1v6E
	A4tb6nrAWqDXYmle3A1AmoAJ7/8fNWik2VKVdoiu9QXc+F6ZFgEYpGeAAdxLSChT
	0u9+8f9BTMfHfiA/KzlGxlv3SEfgRRX+zAZ0XvQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:VttRktTn/zJyClA2O6DNW2kJpAacwHP7icI10Yzldjw=:MMpkXQSha1WikARsQBSOItL3YtZvpdnmHso5S28AdIQ=;
X-ME-Sender: <xms:Nmrsat-ne2-xbDEEmQ36f10OCgm2CO3BuuqZFdkN6Ntg7tCiO6QGTQ>
    <xme:NmrsajFrJxZRsOmZo53LUXp6CwKR56M0WU-wBDUZPWOUOb9TmExmDRw3cEBah4W0k
    F60erxtMdvO2lxEQQL1JO6cmGPkzZyCxwLWpXZj6tnEo7ze9D1WqZw>
X-ME-Received: <xmr:NmrsakRp-cOFpdowiG4nh4D2PkLojqu8Z_w7sMOHNUZTsdtc4v3r65oUgxOEAtXw0exYMKgRlUT0el8WGo-IxWiRgTGKRKDL2pg>
X-ME-Proxy-Cause: dmFkZTFxL6fPj/83KjW+fPrzD7XIhU0ugn9J7NLmcT7qkhSOHV6Af82MPa5XBOzqpSBIeN
    Pp7p8OyM+TI/GES+hrNz1pWoLtoPr0PQyTaY9NPuTzBRGPiAAcJ3TBtaGIGFJ6EIOXXhvi
    OmWkGixLiwFSU5Ji8fLekxxR6EJsv6volK4Aa+XkeiLpTkZTvhHs0PqHDFrfqL/zb/0ZP3
    9znFWT6W8alLK2f1H3T6MWoAM3iYPGn74enSenY1WYKm4dI7WWKEv57BXjNOh+/gVX8bJw
    C1jhLxJz5rZaO//peRzsXKtK782l6mQSftbsv/PkoCji5Zyj+60teGD5l3K8E1b3VAFAOg
    Rha9fYns62sN9EBECcK9L+Q/5sD4xLOoPswTjWnlVkpKKnfqYwphq2extolE8m7MXGsgNR
    1X19eAT+nQIGBpVIQox3pLq2Smul656qxWtQ72g6sXeKai67qWzel1Gu0wAvmDP1bnxkCN
    6gFyhfW5avQrLliOtodr0jIjwFrGdsePQ96x/PECFSjSjGsN+Oki2B4/n4jTyTnkwE5Z5G
    j9Tov8ecxM/0mLz2N0+68zS1zL9PQEZWLhEdGnR08NO+CbOHorThcbcICS7tDbYsYRFLjz
    sEFF0gkpCK1ye+hy8HcTuihZKLWOLHsQT8ClaR5nD/kto6IRuLlq9wQj5sMA
X-ME-Proxy: <xmx:Nmrsapuga4xZiVHXTEsVFM10gwB-UDeL6m8_6K2WMEi5F5ZJz_FyeQ>
    <xmx:NmrsapCtqAo-VqDgt4prbNRMbfggnfxSWKoCQH6NQPtNzqF-H_7jxQ>
    <xmx:NmrsauejZAuPqeSM_z4-cufvnS2QfkBPjM1S3ESKwdloVvQ1Ed15DQ>
    <xmx:Nmrsapql_mHpdtRGaO0kSXCJW_SHU_gLRk-tpjB_xRk1IGKnR-vO9g>
    <xmx:Nmrsan_4H7YDgnylsUuOebC2ZlcggW_L-9-9wtQuoorLY7JaUroznmgJ>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Nov 2026 06:36:21 -0500 (EST)
From: Janne Grunau <j@jannau.net>
Date: Thu, 05 Nov 2026 12:35:59 +0100
Subject: [PATCH 2/7] dt-bindings: pci: apple,pcie: Add compatibles for M3
 SoCs
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
Message-Id: <20261105-apple-m3-pcie-v1-2-e00a72a604f8@jannau.net>
References: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
In-Reply-To: <20261105-apple-m3-pcie-v1-0-e00a72a604f8@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
 Joshua Peisach <jpeisach@ubuntu.com>, 
 Michael Reeves <michael.reeves077@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065; i=j@jannau.net;
 h=from:subject:message-id; bh=MMpkXQSha1WikARsQBSOItL3YtZvpdnmHso5S28AdIQ=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqw3Weo2fAuNtJJdT03Y1XWHwzP1oeJ7H41X+e/4xKUdO
 78XnTLtmMjCIMbFYCmmyJKk/bKDYXWNYkztgzCYOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 SMdYx4iBi1MAplonnZFhx+sFX5l3fU/zEz5w4fG3FfcjmNlurdt97U7L7L+zvnuw1jD8D+CxidG
 2/mVmo7TdO1n3qc7xA77TttrF25/wt604wCDHCAA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

The PCIe controller on Apple M3, M3 Pro, Max and Ultra SoCs are
compatible with the one on M2 Pro and Max. Add their per SoC compatibles
"apple,t8122-pcie" (M3), "apple,t6030-pcie" (M3 Pro) and
"apple,t6031-pcie" (M3 Max/Ultra) to the bindings.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 Documentation/devicetree/bindings/pci/apple,pcie.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/apple,pcie.yaml b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
index c0852be04f6d..a40b5d5b9a5b 100644
--- a/Documentation/devicetree/bindings/pci/apple,pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/apple,pcie.yaml
@@ -41,6 +41,12 @@ properties:
               - apple,t8112-pcie
               - apple,t6000-pcie
           - const: apple,pcie
+      - items:
+          - enum:
+              - apple,t6030-pcie
+              - apple,t6031-pcie
+              - apple,t8122-pcie
+          - const: apple,t6020-pcie
       - const: apple,t6020-pcie
 
   reg:

-- 
2.56.0


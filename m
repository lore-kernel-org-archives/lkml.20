Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426986;
	b=WhqkOnZ42r+8M8+CHZdm3gIk2l7+jhmfWJrR/Jl04Em81JyquHVIPepN+9F7alKPU8Pg
	 0gL58CVibX6tknVD63mGvHJG0Ylh3zL5l1c6PetkcjoHlBOjz93/kRosK1dnC2o2ZOYQl
	 Nnz4dFx0HNtxhZ+HSI0UWAPYFWusdVVS+kX1F0op1itGnzaZNBGRvSpZ2UIhqGk9BVKD0
	 PY0WnITVO13WzvFplndZx1RHOUvVx5SEt+u3Qrg6zrvGnnJ+JO+6W0SVYJxMwCJPu551W
	 cLvLmt7wpnom49YCJHJoUAW0jcSe0DN6Ijn8ndrB5umMPYDtgC61WL23C4JzF3ipJyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426986;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=g9Scc5Pzw13RzQ9rwI7l7VFvq2KMcPvbHpsar+nJUHs=;
	b=q/6FipdNaRFmhfWK5l6nxb5QVfe9V1i7RZDtQqE16wKSr+EPZTC3WinbKt5YGxoZZ47Z
	 xcTO08MCcoSOf8D9nHmMyKPMM48FsmTDyz3bo9KNOe11cnwZ8+EOUpJtOctcYfZgQyKAp
	 9bi1aUJJGy20pjSXIbdnbxtGCuG6iL+UnQ73D9MpwnCoVYeas1q96oROIYLNIdAmKYgjz
	 7QvaVjFmltOs9d2vxkdy6wRMH0LIlw/tqesIQXjPcU9ySOz1oluCy1DniWyE3b4EECGz8
	 CS4IulfZ6IdkpBtKEZvi+/fJjLxKVLU+YM4Yr5TBSTLj79zVulTOvZrFzdPT0BVi/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BjDXSgyQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YLbIP7Qa;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A89606A88E;
	Wed, 11 Nov 2026 19:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A89606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=BjDXSgyQ;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=YLbIP7Qa
Date: Wed, 11 Nov 2026 19:56:23 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794426984;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9Scc5Pzw13RzQ9rwI7l7VFvq2KMcPvbHpsar+nJUHs=;
	b=BjDXSgyQXYqu/KfQ/+tn8fh7dOnorP5V25J+e53mOvRAiiMNKgBfQYnCS5tK8FXSNkHr1I
	Oe6OlTK9PMzexEtT6ibN/b1SgY6CEHyaZYcdCAwJV8frzChqRp1olPwUDEV1x79UPzGQrN
	81PzqxhshbZm9vTEWnbajP2cwU8lZB4BPns/VHnNtKhWatErTx55Yq5r/t6zaggUSBsJIX
	AP+vmb2n0PlJAt2S0eXf0xZDUageVc2RycIDTNRAIR0QvV4SnwMgYAWH2WaCrjchpRkNgB
	/uoqu6PjEnO8z8Rk3EUZ1RCy1S/QmmeTtovbvj4oDGQM3TfADm5gGzKCB45lAA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794426984;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g9Scc5Pzw13RzQ9rwI7l7VFvq2KMcPvbHpsar+nJUHs=;
	b=YLbIP7QaHOLZnHxIUDGBKdS7Ln3KYf670qxgze+hurx4WahiKachi1MvfcoYblBbIVE5N6
	utaXLdDx/W+FbrCA==
From: "tip-bot2 for Rosen Penev" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] dt-bindings: interrupt-controller:
 qca,ar7100-cpu-intc: Allow shared write buffer interrupts
Cc: Rosen Penev <rosenp@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261108215738.113582-2-rosenp@gmail.com>
References: <20261108215738.113582-2-rosenp@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179442698318.2093942.7420233172463800266.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     e5d5fe940c1e329f561ea636700672a5bd4a785b
Gitweb:        https://git.kernel.org/tip/e5d5fe940c1e329f561ea636700672a5bd4=
a785b
Author:        Rosen Penev <rosenp@gmail.com>
AuthorDate:    Sun, 08 Nov 2026 13:57:36 -08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Wed, 11 Nov 2026 00:56:19 +01:00

dt-bindings: interrupt-controller: qca,ar7100-cpu-intc: Allow shared write bu=
ffer interrupts

On AR934x and QCA953x, the WMAC and the PCIe root complex share CPU
interrupt 2, but write to DDR through different write buffers. Document
that such an interrupt is listed once for each write buffer, and that
all of them are flushed.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://patch.msgid.link/20261108215738.113582-2-rosenp@gmail.com
---
 Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-intc.y=
aml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qca,ar710=
0-cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qca,=
ar7100-cpu-intc.yaml
index ab32a91..becec88 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-i=
ntc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qca,ar7100-cpu-i=
ntc.yaml
@@ -29,7 +29,10 @@ properties:
     const: 1
=20
   qca,ddr-wb-channel-interrupts:
-    description: List of interrupts needing a write buffer flush
+    description:
+      List of interrupts needing a write buffer flush. An interrupt shared by
+      several devices that use different write buffers is listed once for
+      each of them, and all of their write buffers are flushed.
     $ref: /schemas/types.yaml#/definitions/uint32-array
=20
   qca,ddr-wb-channels:

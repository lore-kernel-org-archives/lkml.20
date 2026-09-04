Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83354A99DF;
	Fri,  4 Sep 2026 14:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788531851; cv=none; b=cjaeXagCynsHTz5HswjDM2BH9RnULd4DH3LZDypZOklDrMOZl1KPavShlg0T+TIhRfq7UEqoEWjGz+ipzi66pxCO0CeIFYhB/cQfUxZY9PFLEH21iFX2h43slJd3eoTsD0x9oZgPZtVn9fP6r7XJ4kY6jEuC4fceOgQ/3T39EUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788531851; c=relaxed/simple;
	bh=723BIark2ULafR//ATcpJkae0OQIqid5BS3dPIZSRrY=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=CGN5PfF92Gi2vlEHabyHlrVzSvhLF2LErh/WNYo6m7qt44QymerLda8PC8wwpwWI0EHSaBlAiIxXOd4qZ8dc2NA+CmsrLoj6813AaDTjasaURGRt1WNpnp0VGjw+WWW4VJxjIzSvQYatolbhHIhDf1qRsiD+sOcx7c4ipV7vUA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sbhXKMR5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zX8em10v; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sbhXKMR5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zX8em10v"
Date: Fri, 04 Sep 2026 14:24:05 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1788531846;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAIIqhs3iuy1bQQX1THhDlN3YsVypGqjqmgWEfWILIc=;
	b=sbhXKMR5DkYiGsmgulmRXCJXhlYp7bds5nsr7GSU2IoQd7od4jR++hN/ggvhoSFwL3x7tJ
	Gbb8qWb6YQqi4iBo268yRnBKN+OeadEulecWC+DXzPXYlHPzBtyS0ly4oKlMrkwQljTjYq
	gPYjXbc0LKe1ShHajNj1NFAfClQVg4lnLKtnMTR+nJR1ox0fASlBdZfjOBvw6MjwzzQGPx
	MUOQxqAFtgOLvVkJKwZqzzNW60e2kDS13ue9rFmiyxOMC+rIQXD/2COYWFjli8l4QSNsOl
	r0tjWVlUAlpa+RXoRzplGQr0UhUF0bWtqh1CZYYFaUHZJMPWigQ5c13sejbD2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1788531846;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BAIIqhs3iuy1bQQX1THhDlN3YsVypGqjqmgWEfWILIc=;
	b=zX8em10vml01BZlftAw9u4lMG4UKvR23Luk9fQWfEMvCN7ZKf6kZcfJnNqFhagkK+r8gfT
	oLYkVIYAfq78ZPBA==
From: "tip-bot2 for Maulik Shah" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] dt-bindings: interrupt-controller: qcom,pdc:
 Document Purwa PDC
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260806-purwa-pdc-v4-1-62467f4b4ddc@oss.qualcomm.com>
References: <20260806-purwa-pdc-v4-1-62467f4b4ddc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178853184526.3717435.12876224447314180569.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     9d6498c113b7132e21998b681748a10eb1c827fa
Gitweb:        https://git.kernel.org/tip/9d6498c113b7132e21998b681748a10eb1c=
827fa
Author:        Maulik Shah <maulik.shah@oss.qualcomm.com>
AuthorDate:    Thu, 06 Aug 2026 14:26:27 +05:30
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 04 Sep 2026 16:21:02 +02:00

dt-bindings: interrupt-controller: qcom,pdc: Document Purwa PDC

X1P42100 (Purwa) shares the X1E80100 (Hamoa) PDC device, but the hardware
register bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc:
Workaround hardware register bug on X1E80100") is already fixed in
X1P42100 silicon.

X1E80100 compatible forces the software workaround. Add PDC compatible
for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Link: https://patch.msgid.link/20260806-purwa-pdc-v4-1-62467f4b4ddc@oss.qualc=
omm.com
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.=
yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 8162a49..b3d19c8 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -58,6 +58,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
=20
   reg:

Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2184EBAD2;
	Thu, 15 Oct 2026 10:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059769; cv=none; b=qrTsKgRmlTMjSYkUs+GtBOTrE113MPrIZ/l8QNNstE+smhpNv6Jbs8+Uvdph7Qx5+zktrfvMiVfhD8MkAhg7MinnoQnqmEfv8OFfObWrTONsRdzqXqY8mLwvI/bj0r6AInt+QG4ds8KlWtRgBxhykQ3/uar+B+yO074f6oWatTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059769; c=relaxed/simple;
	bh=glm+pZODH2O071uU4zuQzCDwsPNrJU1LL9PfIofk45o=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=NmbPwnOF76W7qPWnRoKqNmz261PQPhumbx5ojlIBcv+bLcPqSKWtfcT06bfd+XTszuy+ryd+zQocUI0Ew8cqt89T6j08XP9iS+/90Dcd0PfkGDqY1rOl41WzDJSrm6Vu7qxBrzybEMmr25SscWq2zIhFabyPz9M/qYfVIMJqRmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=l7Aswk0y; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=+WYzQWtq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="l7Aswk0y";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="+WYzQWtq"
Date: Thu, 15 Oct 2026 10:22:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792059765;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsgRet10eriOK2M6wWKXILL96lFmKJNgoe0l8pl9VQM=;
	b=l7Aswk0y4Q0Yo584DZh+utIH0sndBFu2JQbzlE8UXwucCkr77ArtlM+QVzFPz48tmTSsba
	zOepwhvpbXHUhaXACjjiH+Gm/Bpsk5acuhAv7Zb3AtwKAbqFu8c9GKFFNkXejumFPQukIQ
	YvbpugXONyh0SnRIUNLDP+hmXG7yOpzw5QAWgug6C2bQ9IEBrvMUOYKHCvEe5zGlzWiakO
	lUaDwZmbW2rAMT92zrJDTVPvn6L6Mdk3yebLbMxdnIR109zBLk1RDgU+5dBE+g7aMdxd3F
	fXnOEKEc5tMBZwZxYoWBqZIZsRgNmpRTEOeSd0CJDe19L0LH0Emn6+F9Y/RgQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792059765;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZsgRet10eriOK2M6wWKXILL96lFmKJNgoe0l8pl9VQM=;
	b=+WYzQWtqJgoiNHisf7+XF8lpc9nnN7OgcAxFY08EmhEujhFxQ56x3/BuxhhlsBLjEfI1Y2
	nagyUFzpRFD5+lDA==
From: "tip-bot2 for Lorenzo Pieralisi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] dt-bindings: interrupt-controller: gicv5: Relax
 IRS properties constraints
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>
References: <20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179205976427.2666988.5725477532337801679.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     1d77e79d62cfe46ad3619d42ee0d1ebd3f0f79f4
Gitweb:        https://git.kernel.org/tip/1d77e79d62cfe46ad3619d42ee0d1ebd3f0=
f79f4
Author:        Lorenzo Pieralisi <lpieralisi@kernel.org>
AuthorDate:    Thu, 15 Oct 2026 10:20:25 +02:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 12:16:59 +02:00

dt-bindings: interrupt-controller: gicv5: Relax IRS properties constraints

An IRS is architecturally allowed to be stand-alone (ie with no direct
CPU connection).

Relax "cpus" and "arm,iaffids" properties constraints allowing a standalone
IRS configuration.

Fixes: 7d7299bd07c6 ("dt-bindings: interrupt-controller: Add Arm GICv5")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>
Link: https://patch.msgid.link/20261015-gicv5-irs-no-cpus-v1-1-d4b337b7f000@k=
ernel.org
---
 Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml |  9 =
++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v=
5.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.ya=
ml
index 86ca7f3..b901e42 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v5.yaml
@@ -120,13 +120,14 @@ patternProperties:
=20
       cpus:
         description:
-          CPUs managed by the IRS.
+          CPUs managed by the IRS. Omit it if the IRS has no associated CPUs.
=20
       arm,iaffids:
         $ref: /schemas/types.yaml#/definitions/uint16-array
         description:
           Interrupt AFFinity ID (IAFFID) associated with the CPU whose
           CPU node phandle is at the same index in the cpus array.
+          Omit it if the IRS has no associated CPUs.
=20
     patternProperties:
       "^its@[0-9a-f]+$":
@@ -210,12 +211,14 @@ patternProperties:
           - reg
           - reg-names
=20
+    dependencies:
+      cpus: [ "arm,iaffids" ]
+      arm,iaffids: [ cpus ]
+
     required:
       - compatible
       - reg
       - reg-names
-      - cpus
-      - arm,iaffids
=20
 additionalProperties: false
=20

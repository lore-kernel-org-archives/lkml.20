Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216179;
	b=zMH8hQJniiDlnHXiP++CVpHyx605M2ooM2rwoSWLmWNnCAU6uD+BFz/daG9cTq444Dut
	 exC2e/TsDZQ/5AX+ylpMiNJ+qby/97tUdvtSLNyNUJPOSTYnhAQ3iQG0Pr2APP/NKzVGJ
	 c1W/cX/EQDHScNvYlY2guTL3goFEHRD1gJyqT+zSIu51nSaywzij2lov9jPDCXpqwj8O9
	 j9ArhW+BgzdxSoBE7NkiI3ZsQQaPpvr+D9qmmKY+PsQWesI84xUTsva8adqu+WyPjxmkM
	 TEXAGTmzPLtRXKOEkivyYlaSwsap4+ceBqiV/zJ6O0PlofkaAUgAd6+4QXbD8gDuqFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216179;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=NW1Dm8PVnuxyNMfmHw8RGYlASsUXIQ+/9U6nSwnjKCo=;
	b=H2jdEDZn7wCTNwIZcfT6WygX5Bb+uecN6/syUt3dDbPzhoxa8Fefm9dn9EL9fCBRi7FG
	 A/Mjc7NRCqywwqtwgS7t+RUvYrJAS3opxRra6MN3umeUduZtQ9qkRsW+gdjOLK3xfdaN+
	 lxNKHFJ8IIRWzK3VrtKnqwnRKUs5RwexltSh4SMrQIdwZIuLjZJ7L2o9DfS8dNupThJS/
	 B3VvUmNWK2YSmfg0ROPmrsMDorPHRcfsESOfJIE1QgNS8Zdb2KardWc9rKcVQN1k2+x1y
	 NJy+XB09ilQysXb2xY4iqk/92AibtnWw1wHtXmQK2notNsbjMh3uSE8Tane7hBLa3iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HOiMKPJo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jIuGJ6wf;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB98606EE87;
	Mon,  9 Nov 2026 09:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB98606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HOiMKPJo;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jIuGJ6wf
Date: Mon, 09 Nov 2026 09:22:55 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794216177;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NW1Dm8PVnuxyNMfmHw8RGYlASsUXIQ+/9U6nSwnjKCo=;
	b=HOiMKPJodSnmlX3HErKSIOHZpaPaHPnYNylaC8reFrdCd6YLfnnEWqnVD5oYlwlTGp+ijK
	V1OlWkdydV1z1GeySscXsDEi7siRtIA8gOpRnKvsiu9Spt0jDMIcabsqmNdJiVPPwJyQqn
	do8sIV40LZv/1SX1JZ8NYQEszOLugh58azMVlOK80dXhBFFrZ1Zcbs2MEU4R4CHSM7KylX
	OX7r7TZ5Mn2aASKoL9BqJJ+uQpPFODdi7zzRLKRR2APr8mvBe5hq5IE+RXIaPSjNIOW1x+
	EJipGQu7g5VpuqvDxG56tzP12VJAEGxHPssgHZksPal8GyRqObvJ+nGi1UwjCQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794216177;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NW1Dm8PVnuxyNMfmHw8RGYlASsUXIQ+/9U6nSwnjKCo=;
	b=jIuGJ6wfF7J9BVVHtjfWcvyqjxcFFBrjmxhxc6rE3pxAtjEUF0ozehExxMdJ+oC0r4ryW5
	5AHnnVN42xgeKkCA==
From: "tip-bot2 for Vladimir Kondratiev" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/riscv-aplic: Force synchronous probing
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
References: <20261020-aplic-async-probe-v5-2-c4861c2aafca@mobileye.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179421617563.2093942.6154297290979590614.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     4657a03b8427864c5605147e0a9d01e2a09bfff2
Gitweb:        https://git.kernel.org/tip/4657a03b8427864c5605147e0a9d01e2a09=
bfff2
Author:        Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
AuthorDate:    Tue, 20 Oct 2026 18:38:49 +03:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 10:20:17 +01:00

irqchip/riscv-aplic: Force synchronous probing

The APLIC driver leaves probe_type unset, so it follows
PROBE_DEFAULT_STRATEGY and is probed asynchronously when the command line
requests it (driver_async_probe=3D). The probe of an APLIC instance updates
state shared by all instances without any locking:

- the check-then-set of aplic_syscore_registered; two instances can both
  observe it as false and both call register_syscore(), inserting the same
  list node twice and tripping CHECK_DATA_CORRUPTION ("list_add double
  add") in __list_add_valid_or_report();
- the global aplics list, modified by aplic_pm_add()/aplic_pm_remove();
- aplic_direct_parent_irq, where more than one instance can pass the check
  and register its own CPU hotplug state;

Interrupt controllers are required early and have no benefit from
parallel probing, so rather than adding locks around each of them mark the
driver PROBE_FORCE_SYNCHRONOUS. Probes then run one after another from
driver registration, and deferred probe retries are serialized by the
single deferred probe work item, so the shared state is never accessed
concurrently. Probing is also blocked across suspend, so it cannot overlap
with the syscore callbacks either.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261020-aplic-async-probe-v5-2-c4861c2aafca@m=
obileye.com
---
 drivers/irqchip/irq-riscv-aplic-main.c |  9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-ris=
cv-aplic-main.c
index a2c4d14..7e3d647 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -118,7 +118,8 @@ static struct syscore aplic_syscore =3D {
=20
 /*
  * Not __ro_after_init: probe can be deferred (e.g. MSI mode waiting for the
- * IMSIC) and complete after the init memory is made read-only.
+ * IMSIC) and complete after the init memory is made read-only. Probing is
+ * synchronous (see aplic_driver), so no further serialization is needed.
  */
 static bool aplic_syscore_registered;
=20
@@ -413,6 +414,12 @@ static struct platform_driver aplic_driver =3D {
 		.name		=3D "riscv-aplic",
 		.of_match_table	=3D aplic_match,
 		.acpi_match_table =3D ACPI_PTR(aplic_acpi_match),
+		/*
+		 * Probes of multiple APLIC instances share global state (the
+		 * syscore registration and the parent interrupt of the
+		 * direct mode) and must not run concurrently.
+		 */
+		.probe_type	=3D PROBE_FORCE_SYNCHRONOUS,
 	},
 	.probe =3D aplic_probe,
 };

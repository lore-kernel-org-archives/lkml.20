Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581305;
	b=BNlMCb2/EqbLe8XBfE4s4KEAI3VTP5F9Whr0puUWT7jH6Zk6Eo1yva3RXQsiRErrgPeo
	 wWBN2GqHzNj022k2mdusZSZcb7piJkFGvw+isqa8AG5z3uOlV2ArEV5BRbmmje9H0JFU1
	 vTwjVGnQ/mo1A54feBQX7AmTSDF1TMGW0tOKqwvZAtnD3pSzapFqeU5BPF0LC8YaqdP2U
	 B2sOsQfgNtNxhKmgBqhHDwbF2SlM1Bcxzmo5gOPZ1PMGPLskDOoF50x9eRR1AdUDVSR4s
	 PADK29p2X1l7VlqVezy5MyyNLx1eUhcNo5fDGFws3OnalckrZfGgWOcIJcVoFblzGaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581305;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=R9Pr21bVx/xxYw3kwGKqOTAyMkXovKTj5MckXFGzrRg=;
	b=CMq9H6v16TTDZRYUxGlkyi2HPLqseBtICyQ/Tarspf8vzS79OAvgYDXLWaDcdc393cuB
	 BCTruC04pELlKYbFnSqdMLuJDlTeyA9FS+KVpeMQjX5nOueE3B33YoeEpkbMxrVziBA8X
	 it/dWvPKzRaD3bU1IX1ZAi3xWd6AGmdvPjru/H5hge2AgMySrW3SfrfD+5kfdT4ygkxML
	 cvkFhdBlYCu5bQBLavfbGehZR5e623RmM7JfAEjuuda4w7YiH33pgF+hwvdqYo5Mnp2ZP
	 aHmW5I2HSeGNJWWfTdel4762dmBgb81os691FPqKOyt+DaC+UY3MgAbzufnpxtJ/KaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cXwiVjcU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zKOky6Ga;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D06606A327;
	Fri, 13 Nov 2026 14:48:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D06606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cXwiVjcU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zKOky6Ga
Date: Fri, 13 Nov 2026 14:48:20 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794581302;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9Pr21bVx/xxYw3kwGKqOTAyMkXovKTj5MckXFGzrRg=;
	b=cXwiVjcUWWxZI1lhmFM0ToSZLpCIlBmJnS/HejsbLQkbj2mBqkqzWnMPRz50yG+EX0TAWp
	uaS4LtrAu8sFEsnaWyuJUTyr5MlEjyh7pnM3+ZwnuSKo6mH6ssPTHbUvVuk2oz4ZJZ6bVZ
	DrerkaaMU69Hb5z8HTGUlwweexUmRualh0Ayhg6EzOaSfuQXJbfgF4nIICQowPtLectJ/S
	ks8wH2NY8lCu+s7hryVMm1rXZ6rnUPB0ktcUwUmROe51/NnB4l2MMq8HTFKiNPfoPohkSk
	qYvEl3PgCDNhSczHRRPuSEA/r9uXDpPGstUJoBbKmDxdy65rGJu6p7CA5YyuEA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794581302;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R9Pr21bVx/xxYw3kwGKqOTAyMkXovKTj5MckXFGzrRg=;
	b=zKOky6GasAh2CjDbOHvEOnYlNIEQ8u0yoUsA3Bhtq5IvzvAeLFVHtz2pLRcBi+GhEC7/v8
	yJoduLc3iPhO9FBA==
From: "tip-bot2 for Yuho Choi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] irqchip/gic-v3-its: Drop ITS node reference on
 its_of_probe() errors
Cc: Marc Zyngier <maz@kernel.org>, Yuho Choi <oss.patchbox@gmail.com>,
 Thomas Gleixner <tglx@kernel.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261112204944.1427733-2-oss.patchbox@gmail.com>
References: <20261112204944.1427733-2-oss.patchbox@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179458130013.2969448.6533178628928154524.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     aab02e49f0b54a0837e58c67651c4abdad1a3208
Gitweb:        https://git.kernel.org/tip/aab02e49f0b54a0837e58c67651c4abdad1=
a3208
Author:        Yuho Choi <oss.patchbox@gmail.com>
AuthorDate:    Thu, 12 Nov 2026 15:49:37 -05:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Fri, 13 Nov 2026 15:42:23 +01:00

irqchip/gic-v3-its: Drop ITS node reference on its_of_probe() errors

its_of_probe() walks the ITS nodes with of_find_matching_node(), which
drops the reference on the previous node and returns the next one with
its reference count raised. The loops are balanced when they run to the
end, but the three error returns (a failed its_reset_one(), a failed
its_node_init() and a failed its_probe_one()) leave with the current
node still referenced.

Declare the iterator in each loop with __free(device_node), so that the
reference is dropped whichever way the loop is left.

Fixes: c733ebb7cb67 ("irqchip/gic-v3-its: Reset each ITS's BASERn register be=
fore probe")
Fixes: 9585a495ac93 ("irqchip/gic-v3-its: Split allocation from initialisatio=
n of its_node")
Suggested-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
Link: https://patch.msgid.link/20261112204944.1427733-2-oss.patchbox@gmail.com
---
 drivers/irqchip/irq-gic-v3-its.c |  9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-it=
s.c
index 282e4ba..3cf94c2 100644
--- a/drivers/irqchip/irq-gic-v3-its.c
+++ b/drivers/irqchip/irq-gic-v3-its.c
@@ -5572,7 +5572,6 @@ static void its_node_destroy(struct its_node *its)
=20
 static int __init its_of_probe(struct device_node *node)
 {
-	struct device_node *np;
 	struct resource res;
 	int err;
=20
@@ -5582,8 +5581,8 @@ static int __init its_of_probe(struct device_node *node)
 	 * reset, don't even try to go any further, as this could
 	 * result in something even worse.
 	 */
-	for (np =3D of_find_matching_node(node, its_device_id); np;
-	     np =3D of_find_matching_node(np, its_device_id)) {
+	for (struct device_node *np __free(device_node) =3D of_find_matching_node(n=
ode, its_device_id);
+	     np; np =3D of_find_matching_node(np, its_device_id)) {
 		if (!of_device_is_available(np) ||
 		    !of_property_read_bool(np, "msi-controller") ||
 		    of_address_to_resource(np, 0, &res))
@@ -5594,8 +5593,8 @@ static int __init its_of_probe(struct device_node *node)
 			return err;
 	}
=20
-	for (np =3D of_find_matching_node(node, its_device_id); np;
-	     np =3D of_find_matching_node(np, its_device_id)) {
+	for (struct device_node *np __free(device_node) =3D of_find_matching_node(n=
ode, its_device_id);
+	     np; np =3D of_find_matching_node(np, its_device_id)) {
 		struct its_node *its;
=20
 		if (!of_device_is_available(np))

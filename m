Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794238251;
	b=zu9g4s00tATRyB9RRXcTSqn24erprFHRguf2Txtt9i56TwwWR5vnhLJe1H8thKigmw60
	 DLo5lykyXSBVUPCZL+vw0dh0FkG9TVLdB6YZdVfhCwbBL4qk9i7B+eCZOmqVYEY03GUXR
	 wGTIpGr/bwzyhYIrFzEoY7UtM9VxGQTvtWhAzawKRk60899SkOh8UN7ye+o+kxxn/I+Ui
	 LfaG/l/dhtzyZziQbxCLuBuhYfCg+0IvhA5F21xpybFwxlZ0bbPuibZtrfFY/6kaV+Q4o
	 Kinpy49qCziWrYvYeffoavv4IB8mlz3E03PGM9CP8gF6UU+FpWNeEa6TMBOAbCugXKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238251;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=V5g7iAv1moGxi0gGJy3HbE9/3VPtH5ZT9DUaoiuR8x4=;
	b=qwqk6KeyZ50Tk6FbA5f55Yxe11o43oPwc7Ap73/aTM98q5G6acYrwSGgOuSMXA0X3Bom
	 RDze3jkBCpPABadX1+BHPrsm1oo9IcyQCEO8dzuoQm1fOFmMoPkNiNwVm8mMActYgyoTh
	 0cHPvGXYt/pijxl3B4MZpWvl77ZedwLXB7gZlyh0d01IEzvnT00RC+E4ElnsSGRmhQEr5
	 5MA+Zq9osRmtD8bJ0N90Fz6jeuYLDdGpwZ6IiKELeNWcM0t2MJl0bgFaRxSSYSNw5k2Pp
	 NdFmNrjHyd04ymzkjdoBXjdv9cBx020T0+954qyVZbwwFcrrC8YbQyFZ2+DSDM+giOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JfFNXXRW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aR6tAZkw;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCD3606A321;
	Mon,  9 Nov 2026 15:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FCD3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JfFNXXRW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aR6tAZkw
Date: Mon, 09 Nov 2026 15:30:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794238249;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V5g7iAv1moGxi0gGJy3HbE9/3VPtH5ZT9DUaoiuR8x4=;
	b=JfFNXXRWHl0WAbGH6oH37tbUwy/+ThV5LYE95PvScXs5xeiYBB/kXCril7Lhw3s7kW7aXB
	zE2RknfDagJ9gY8TBZ628l4kJE9QCfnBuVnwu1DRNrMBkS7ZU9s+NeEXyys70nQLaLt7xA
	gODbPjngDtzBPDGQhBiKaEUSOD8rTKU0AoW9losYBK/bNHJG+UXoY+er5VQK0jXUqy3d10
	JxGxCiNHqzKD8jxu1otuEjbJDB5aQ/Pe/hKy4evXW0RBTV35rH8VPX1a5w4HceIoIMBiXD
	Ua2cQMIBWVRxQInrjSXqWScRZV+f/GVYxur9nW6XqInc3GEaxaXCboW4UAbtOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794238249;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V5g7iAv1moGxi0gGJy3HbE9/3VPtH5ZT9DUaoiuR8x4=;
	b=aR6tAZkwQZ+DSfHbHJKismaJVftAQoCDE8ZtJefFdAoOlqpEwchOBswpCoJMnw83V8XsXm
	+1KOkZRHL1MAuPCQ==
From: "tip-bot2 for Sergey Shtylyov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/nohz] tick/sched: Make kernel parameter skew_tick boolean
Cc: Thomas Gleixner <tglx@kernel.org>,
 Sergey Shtylyov <s.shtylyov@auroraos.dev>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001202417.73273-1-s.shtylyov@auroraos.dev>
References: <20261001202417.73273-1-s.shtylyov@auroraos.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179423824733.2093942.14857522755455998898.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/nohz branch of tip:

Commit-ID:     438b55d86a1a96949355f6b1b17720191937beb4
Gitweb:        https://git.kernel.org/tip/438b55d86a1a96949355f6b1b1772019193=
7beb4
Author:        Sergey Shtylyov <s.shtylyov@auroraos.dev>
AuthorDate:    Thu, 01 Oct 2026 23:24:09 +03:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 16:28:35 +01:00

tick/sched: Make kernel parameter skew_tick boolean

The kernel parameter skew_tick requires an integer value, despite being
boolean in nature, and the parser functions ignores errors.

Convert the static variable sched_skew_tick to 'bool' and thus use
kstrtobool() to parse the parameter's value and return an eventual parser
error to the caller. The input values 0 and 1 keep working as before.

As the variable can only be set at boot time mark it __ro_after_init.

Found by Linux Verification Center (linuxtesting.org) with the Svace
static analysis tool.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Link: https://patch.msgid.link/20261001202417.73273-1-s.shtylyov@auroraos.dev
---
 kernel/time/tick-sched.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index c6d86e4..5e96c2e 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1499,13 +1499,11 @@ void tick_irq_enter(void)
 	tick_nohz_irq_enter();
 }
=20
-static int sched_skew_tick;
+static bool sched_skew_tick __ro_after_init;
=20
 static int __init skew_tick(char *str)
 {
-	get_option(&str, &sched_skew_tick);
-
-	return 0;
+	return kstrtobool(str, &sched_skew_tick);
 }
 early_param("skew_tick", skew_tick);
=20

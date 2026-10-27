Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119142;
	b=wJ9yerfOgOOpWbbcpJgWrBHRB4RFj5iSdQWXAZp6s1Rwv2VZGW3y+rd5N4/DNdYR1POM
	 xvpTILkhiUa3sE86LdKuSSO0BJ+vBv7ndoR+DgWP/dWOoin3T2ruBOWo6GrT3hpxlipSX
	 a2APJ9N2HvyN13DLxlGbj6vMGYLLEzQFjy0p4e4HdO//K6XQ8GUcbmHqDNSKnuLfPhOGW
	 zY0j6cz4HYXfNIdYOw3F3gHhbcKT57HhPx37lDmKF4aKfBIhylg0cztz+DGRFPGZL14Iw
	 rLs4BlwnvIOUQWGKt+/gd8GB8Xkh4k68nTIt4TezsDHgirYjQ/kUeMVWRs3CVl5ToVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119142;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SIOYUtjyO3LOx0Dt4B+mTWmj1MQMym+QDsKA8UeeV4g=;
	b=TQTifdbVT67vGEPO1k+Kad6TOWvrVADcyqnvxsHSVFqQ1iYDNh4KIreIQ+gNXwhXAaNV
	 91z1TMytxstMgQREHEQxvXxOh9EzX9JYREV3kmo/SS0cNlxcUlGS1CupWkJsjynq+iwpn
	 98Aqh0Og8I6S0AH0T/N3LtzzMqARwLDbGmSRyNEplringhDhLEQkmwweYcgNxSUzGv7i9
	 2okoCmwnBP6wsc1YJwwOntUu2egstk3u2xKZstmD4VHn/UIgBfnRuEwo4hneZ2T16FVu9
	 X4gbbqTiPtZKt8T5sCVay5XwmvPC5MPhhIbyOB2PSQBcLyc7dT0HX6F/JjqHpix5/AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDXQ97uP;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3937F60A260D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3937F60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDXQ97uP
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so248525e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793119134; x=1793723934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIOYUtjyO3LOx0Dt4B+mTWmj1MQMym+QDsKA8UeeV4g=;
        b=jDXQ97uPzLLLVbT5rFYdb1pQTXrcFlnapazDTPLkZZZzwm/dGHfnuIdGyn77eFA0ll
         rVBv/5nJphqBbUw+a2Td1v6GrDeETKSOvgJ16nRoBxrVotcF0qP/50g7KcOxGtryWC0V
         82S7gR4XD6AEFY2bR8wsJHDC2n3MXTp1j8TOVpzctgje8F6Q2LgZxBO6dMNKbxhXYYne
         3ugxFsXqy++IHUeYF5s3xiNkbkoyShdYlrRIi7mhMt3xmm4xnSahUcRjGeZ/Y5Mb2O1b
         ZZicvp4ASkhGLwgqJXFP12i+YmVGlubN6R19iyBxMFtHHqdFJmdg6xkHn698fClqvbJw
         MQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119134; x=1793723934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIOYUtjyO3LOx0Dt4B+mTWmj1MQMym+QDsKA8UeeV4g=;
        b=mhJpoSKIv40w8yDm1UMhu4xsWCcoQYrr250eyRDB7LDUyXj7F/lNiKkTA1X9WDiOLa
         oSOLf0BGepITX+WyW2/EhDLnvkU8l97L3dUDiq4aEKAcdjqEDKWIXe7huUDJIDpiYbNI
         Cb38iMc0ndvEi8KU3iHRD1jfg1dLaOa5dfolllMUG5EitdOh+6ZZgN5u/K37G5nrdqRU
         7Ek3Rnz2rS5q/MyZBscKC0kEQx86O8lx2iGS4ORNIJvxtrc8sHIiE195E3qH1cw/u/nb
         pFeG5t8PZayTWhnKjishw6TLXpg7DWdvBY5RFf/m/bi/uUHrsAPfuyBKev7CDG7bss+d
         mL2Q==
X-Forwarded-Encrypted: i=1; AKwUvBw2qhZ7L+50hobsPTxW3U1cSDWhUdALQzcllmef4F3aIqSx1yLH5I+gPiPjGZBKM6a3d2w0ZxR38ciojWE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc0ri3DdKfmAPDBosWzfCzCFtGUA0r2Xp5xeCmRN1Tk7m8g83S
	5LEfiKWa8hK9XJw3ANHHkcgoTjAC1Ih7F4b34hCV+Dw9Dzvj0/KpVlW+
X-Gm-Gg: AYBFou3bOocufBfCpoMr1lNEKS9ed3MR85tVW7YRTRitjsHpGyrN1GjnUSPtuNJNHwD
	f7jHYLEh9BnLp93d9h3Cwzg63qt+3rIDbfk+qGviRRwuywA87wrtvneVr858df2CarGPk2EHGEL
	P32OseX1XHDOq0+XOA+UTnY04hSndStwG4kxGuIX5nqdK3rf8I06P9G0NLXKIFQG3nfuUnoECua
	ZpHQaJczDPd/pafgkrA8aPjIb/97SmgrCyhXLWl+272XAOHLuEv8BvufAEdFi257JC8/zsxuUwU
	UVjGHzTiNbT8MxAlqvOb//zCb7PTIMU2+tQCkmy+xJ45nobA5wjWLAxPWEfvRHrp3c6HOyinK1p
	mjbZLqiZQq0JN7OVffQ8AvZ1+hpMFlmNyNbUd1bse8jhw76a4zGBtioGXlG0YmEu3Lx+M2nolzC
	7eFY4+yXO8yZ5kvXiNKEvnZF/mwxNfqsK4JX8CE9u5ghTq91lmePflWXhRjsMZ51bbfZQtHcYaR
	pyqku66qEg1+uk+UmyYORUxDwnq+sNivtzMyQXMDRZqcejQljYxru6OauQTJtY/7ubMEhjhj4Jr
	Ux8Jl/twNB7b3NmqZDIMAJfT61U=
X-Received: by 2002:a05:600c:8114:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a35aca4ab5mr173697125e9.22.1793119134362;
        Tue, 27 Oct 2026 09:38:54 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92c21df84sm2358195e9.15.2026.10.27.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:38:54 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH -rcu/dev 3/4] hazptr: Do not warn when a backup slot is released on another CPU
Date: Tue, 27 Oct 2026 17:38:05 +0100
Message-ID: <20261027163811.2470569-4-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027163811.2470569-1-parri.andrea@gmail.com>
References: <20261027163811.2470569-1-parri.andrea@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With CONFIG_HAZPTR_DEBUG, hazptr_release_debug() warns when a hazard
pointer is released on a CPU other than the one that acquired it,
unless ->detach_cpu is set.  hazptr_detach() sets it, and so does
hazptr_note_context_switch() when it promotes a per-CPU slot to the
backup slot.

__hazptr_acquire() can also put the hazard pointer in the backup slot
directly, when all per-CPU slots are in use or the pointer changes
under __hazptr_try_acquire().  Nothing sets ->detach_cpu then, so if
the task is migrated before the release, the check warns although the
backup slot can be released on any CPU.

From hazptrtorture, with CPU hotplug and readers that nest a second
hazard pointer, as "hazptrtorture: Nest a second hazard pointer in
readers" makes them do (without the nesting, 30-minute PREEMPT and
NOPREEMPT runs do not hit it):

    Hazard Pointer (addr=00000000e2979b1e) released on remote cpu without context switch. Acquire: caller=hazptr_torture_read_lock+0x43/0xb0, pid=80, cpu=0. Release: pid=80, cpu=1.
    WARNING: ./include/linux/hazptr.h:293 at hazptr_torture_read_unlock+0x80/0x160, CPU#1: hazptr_torture_/80
    Call Trace:
     <TASK>
     hazptr_torture_reader_tail+0x88/0x250
     hazptr_torture_nested_reader+0x6c/0x90
     hazptr_torture_reader+0x2f5/0x550
     kthread+0xdf/0x110
     ret_from_fork+0x179/0x240
     ret_from_fork_asm+0x1a/0x30
     </TASK>

Set ->detach_cpu when __hazptr_acquire() falls back to the backup slot.
The remote-task check still applies to such a hazard pointer.

The false positive was found with the help of an LLM.

Fixes: 3d48872eb74f ("hazptr: Introduce CONFIG_HAZPTR_DEBUG misuse detection")
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/hazptr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index b15b84ebd4ceb..b06164aac3a70 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -112,6 +112,10 @@ void *__hazptr_acquire(struct hazptr_ctx *ctx, void * const *addr_p)
 	 *   synchronize forward progress.
 	 */
 	slot = hazptr_chain_backup_slot(ctx);
+#ifdef CONFIG_HAZPTR_DEBUG
+	/* Unlike a per-CPU slot, the backup slot can be released on any CPU. */
+	ctx->detach_cpu = true;
+#endif
 	WRITE_ONCE(slot->addr, HAZPTR_WILDCARD);	/* Store B */
 
 	/* Memory ordering: Store B before Load A. */
-- 
2.53.0


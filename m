Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794036981;
	b=V3LegWcC91N/BB7kwzBtubtWMhCjMNU6ujr58Aay9DMX8ECD1WoNW90zk73mjMkEEFV3
	 upwlP+HB6zZo3BHoKlI5Ggmsw4ek7yCySDEp8TaefbkMzajcMdJP8r1HUO5j2IugZHZpJ
	 zNX8diXb4i93QQi22RsrRfgPmYFtkiYK45lDg8KlB0+XglIIzHPZMdsLRlTa35mUoDcrQ
	 Dxp1cZEQ4k+TjiqNX8XqIVwuZsdQkqOUmqPgQnQlNy7+111AeZon2/8yJ7frMGnJzqihr
	 XoP3Z35optQsOzXzjxndq73m7d5QiHEzI+yShswuxJFfhpwB2ZYIZ+xJTCkoYfFCH6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036981;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=eKajDgmeP9tUhj+Q0O/VU5iTTmjFQvm4dhQJBZsg/1I=;
	b=djQE3gAcjJmwkqm1U5hqdjvtCaRwoFyXCoBNqBUlOoAYkfkKQ3eniGDgybOGleuzmXac
	 p1JdtCXlPoDQX4aLdYCs6FuQNQbrZT/UZuTUDEW1+QoIGi/Qu2EIFIKoipoT8gUThn4je
	 VQ53IkDtq2Mg8A47sauAAxtWXIDCl40KUQjA13H2q9mRtpexhxNZyNm0g+gPnp5lUI/VD
	 2QyYkOPzRxNAxr2r56+wUJFY0nPZp2yHcsuzCJxklJMDE6cxDTv0+jrVtMpRUEelKXDBf
	 XWFY8pjFQmmhoqObr/KFWBGIVOo/tZ3mprJ1wbrKSCwVeVRqfPGyyMAC2S/deM3TrkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ivk2pFcu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B30606A332
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 07:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ivk2pFcu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79E61F008A2;
	Sat,  7 Nov 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036980;
	bh=eKajDgmeP9tUhj+Q0O/VU5iTTmjFQvm4dhQJBZsg/1I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ivk2pFcu5z4Z3JAk1pyWE9bxhryfG1zqYlQc860JPO+SWSrpteeZzRUJiHVGUouQ9
	 PmlYS0uXoSZrXap3b4MMQ5lJYUU6rqgJhbBgiw4z0OeNyV/zg4fRUhNJg5LwnYTRsm
	 bAnkrSz0wu2NXICYmOfJ8GAx0fT/GzzEl5OHPrPPnMGKlNNng6S9H+AOF6LB6HNFqU
	 rN+l4ffURFi8JDjYDBfVq0RtVMsQf/mF3p58GBP+52/JhVEeWVsaytEhMXiTh1QJ58
	 kuLVFJuEXhC2WWDEdG/mFYvMipUeCiEGaz6hmS4d5GCyQQhkJyk0jKQAUMV9vltFcA
	 dduGaDENlR/cA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv/traps: Mark do_trap_misaligned() with __trap_section
Date: Sat,  7 Nov 2026 15:16:04 +0800
Message-ID: <20261107071605.17536-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107071605.17536-1-jszhang@kernel.org>
References: <20261107071605.17536-1-jszhang@kernel.org>
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

do_trap_misaligned() is called by some '__trap_section' functions such
as do_trap_load_misaligned() and do_trap_store_misaligned() which are
noinstr code. So we also need to mark do_trap_misaligned() with
__trap_section to keep it in non-instrumentable text as well.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/traps.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f28e03f98af0..a170ed343e5a 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -213,7 +213,8 @@ static const struct {
 	},
 };
 
-static void do_trap_misaligned(struct pt_regs *regs, enum misaligned_access_type type)
+static __trap_section void do_trap_misaligned(struct pt_regs *regs,
+					      enum misaligned_access_type type)
 {
 	irqentry_state_t state;
 
-- 
2.55.0


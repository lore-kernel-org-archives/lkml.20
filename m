Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225703;
	b=ctaWgIWc6PnQjznCuTMnIc5jrdVL2TaUOh/2gw+k1AcKGEw4a43WCL8EJsdRnqUCkCPf
	 HAO1x83PeT5h49A5S42vaQCxYSgsDqa+o+kVR7qCnhNbtznJGXemRH8apTqDV8WBv2Asc
	 jd1WxZIk+3mEZ5QS53+jvSmWvdX8czoCBZENNarbGBy57jhfV3Y4qabaOI7BxEzvInWb0
	 JBVN1i0dVZJRgMw/bQHefftlyPhVYDB+SEuIg4kh3uk5eUSAzH840Imm6ZvPfOZIXS5uK
	 9T/yWO3vQgId8EW9zXl24ML3zFKCpYmXLf++bHIMQNmENc2imbGuSVBZoD8C3+q/c4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225703;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=HPmaWn2UvYMC1niFpP86bc4ieJtd5iVoWMqnzksdykQ=;
	b=uj+ad5uBnZiYu3cbMccGRk4p++RVZA0RrbGwIP9Ku/v6FKKTGyDVQlQdSjzdtxURH6XK
	 fiFLaJbeCuP8ODBegZpuXHClDOLMzehw3yQyLSMVojbZ4QSz3IBlqX+41kQM3cc5tJuDf
	 6DVSuoNCVGQpKNxq/VJO2SXzER2grRLuz/LlC9JWiwkEdiKuezaeqU/r5l6VH35btc5+p
	 ED7BEkV0n8nr2GUM/+yTuSEOfED0UDBveGfyTJzHeRHqPDBKlodWWq8YLboc5hGZUFsQx
	 eIl5RYmc7i1H/EJXllDshTIuCpH3jMwhSLoXc/2Ac79BoqTAo2rVbyGGOM8x5Kg0zRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgqZhvpt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3676606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FgqZhvpt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BC951F008A1;
	Mon,  9 Nov 2026 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794225702;
	bh=HPmaWn2UvYMC1niFpP86bc4ieJtd5iVoWMqnzksdykQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FgqZhvptiOeVg98uQC2DZROMWSiCLyHQFXgqApJtetI8M1CwdHsauFSf3Z0KrS1nF
	 e33BuFSWT6yuICEut5QromLuW+5rmpcxwJOFLaiDGwMcks7sDuQnjQCUc3mXdH3NAd
	 eOdjYeBOlZRFPOUWmmB8l68162Z86zeSiO5qIms5GVAoC7iZSvnGFEjRJ4TDnK3omR
	 1ubf0iNXc2o24spR7USD2MltvXAC2Xg/Hxo8zy+QUP9NgPPPwFWu7gdIDVfEwwAbMk
	 Hx3O3rJppcCyijZ3ICdYWbsAnsrqlClCinRlT9/7T8zWsHrvkYYtS717voO5FPBvvZ
	 IDemmIo4rf6Hw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] riscv/traps: Mark do_trap_misaligned() with __trap_section
Date: Mon,  9 Nov 2026 19:41:28 +0800
Message-ID: <20261109114129.20260-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109114129.20260-1-jszhang@kernel.org>
References: <20261109114129.20260-1-jszhang@kernel.org>
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

Fixes: fd94de9f9e7a ("riscv: misaligned: factorize trap handling")
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


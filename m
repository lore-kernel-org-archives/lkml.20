Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633500;
	b=DubW/mrKacWCpwvunQukesMPo4HTadLDjnFgnHJJDqNlLmVuynzk7P+FsC0YAH+wlUIp
	 tyQPFkjY3v7BjN47enj6462H6/x9cfOWT54mhbWb8DwMchAFloq869HvYfEE2hfj7WUAj
	 N6lE5yrgbei3iIOzA1k3FIcKdcS9oS5DCssLy9zz0q7YIZtkJj8JIjtWnSmBbIPTXIXuu
	 wMRpxfSZW4GRCU30QSZYUVceWHzni+YUjl94O9PjA/VQ0ke6I2jL7hpVtQh8a0bSF+aaT
	 gSWQYwEPv246A7MfYFzbIw3xnmV+icNnMRU0Vvp9SuWzbxpq2QBOnvKm14htofcneeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633500;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=wMmkvcLfb2UIq3+22jdhBuPkivhdUr84mYH6JRb1Wjc=;
	b=ysgHLzkgGE3EPqsi/mjYEAFrdSk/5zzehaDlIDyNkFHsurlml5UxtaaUNOnvhb3hMmwf
	 JIe7ulyZaqLtqmh2HDrMUmngicZVYYTF0Fz5IUxyKrwwPoe1LTkRwZ3yZcH0vsvmGMOv6
	 V4MmU8X6umWl0L7nwj+3Q2PYxBRyHuLibrmo9vQxx7bJ0qnn7b5uqddE0BQ+fS1s6lDMh
	 Ynna8194svF5YV/1IM6eqPbMB+V10uBnwq9G2Tb7Yqv+lTe8Yyd6Si30FjErE6YMlJkKm
	 VteAjSSFnppw9DzuhQahyh90AoXM6aos3Kkwu0BXeG/n234ETX41bpqyHmL7WHCeoDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlUqjVrA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5A4B607229F;
	Mon,  2 Nov 2026 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SlUqjVrA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3341F00A1A;
	Mon,  2 Nov 2026 15:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633499;
	bh=wMmkvcLfb2UIq3+22jdhBuPkivhdUr84mYH6JRb1Wjc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SlUqjVrA+DuKvupx3wAphp3gFFQ1mrU0rIN1cS5VeiopSFgFzbaCbx8B8tbqqU5Y8
	 /MViur4ItkeFOLeQus+QJlg0zNT0u5UkF/0/9x5zPhO9DbWslwVQi5bBOmQLVuN4pF
	 fqR2gtklf2czJ6PgV2DrXnm9s0zE0FDBRLXrUEixp5V4U7KVgbJg1SrZ9WFT6D0scY
	 BE99zX8iqO8NSiVbbq5uk3HwBuySEZD6so1cMSVs2xaSKDcGXVhpQej1WAyQHlCKKq
	 arYx65H5hmXYMxPTGKqKxQYItCkyQZLs8UeH2vG6w2X8JmDk3tOqP8x3Gcg9j+V1S1
	 cvbkPCbeYywZA==
From: Thorsten Blum <blum@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Scott Wood <scottwood@freescale.com>,
	Stephen Chivers <schivers@mandarin.aust.csc.com>
Cc: devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 4/6] powerpc/embedded6xx: Use __func__ in mvme5100_pic_init()
Date: Mon,  2 Nov 2026 16:30:02 +0100
Message-ID: <20261102152957.300019-12-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102152957.300019-8-blum@kernel.org>
References: <20261102152957.300019-8-blum@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1223; i=blum@kernel.org; h=from:subject; bh=DQpAMArsx0V454j55mEThyfCCKgQ0UM/KCPcob0Z2U8=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkv1jTuTyk8HHhkW4X7Zwv7p+fnSPw2N/RYaPLssMoNc eUQXs0vHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRm7wMv5imOOpzBEwPFvzd XVCTWdLnldjbvP6xaUdw7tTPXEZOmYwMcxj6KkIVEyucNzNK9zSetX8qkJvE3efqMLObSfaMwyY uAA==
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the hard-coded function names with __func__.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/embedded6xx/mvme5100.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index b2979a2a1721..f22e10eb0c65 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -75,13 +75,13 @@ static void __init mvme5100_pic_init(void)
 
 	cp = of_find_compatible_node(NULL, NULL, "chrp,iic");
 	if (cp == NULL) {
-		pr_warn("mvme5100_pic_init: couldn't find i8259\n");
+		pr_warn("%s: couldn't find i8259\n", __func__);
 		return;
 	}
 
 	cirq = irq_of_parse_and_map(cp, 0);
 	if (!cirq) {
-		pr_warn("mvme5100_pic_init: no cascade interrupt?\n");
+		pr_warn("%s: no cascade interrupt?\n", __func__);
 		return;
 	}
 
@@ -96,8 +96,7 @@ static void __init mvme5100_pic_init(void)
 	}
 
 	if (intack)
-		pr_debug("mvme5100_pic_init: PCI 8259 intack at 0x%016lx\n",
-		   intack);
+		pr_debug("%s: PCI 8259 intack at 0x%016lx\n", __func__, intack);
 
 	i8259_init(cp, intack);
 	of_node_put(cp);

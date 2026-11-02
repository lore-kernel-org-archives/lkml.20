Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633494;
	b=fhThoE3jlfj58OmSH2t6mhPD0Q3tggoxViFFGjArNHQJfoqG/asguX2hJDVGAO+ru6m8
	 Fb7xby2gC2fIZmaSCihun8t+ghwUsvOeWwMrB9sGKigZColCFDYc4jjtxHIqAANfX1dqt
	 Dptwf3c6RhuOp4Zt9Wxi/ZHZ0RrxOXixQNaPS9gL/zbQT/qC3cuE0vHNI1WE9Y1kntVde
	 1izO5+1ywAnlKtFOixFHcYi9DrbN49IiMM3jvM3nIu4+gRKmd4lfruI/ly0WUSkSVOJa2
	 VCKQq+dSG3/NVvY7XOzJl9nx5WMjh0/bSSsm7k7w+cK4fOaIi9slRM20aHjwvm2iDmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633494;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=/MUczHsrZCLhXqfwnzNJcmotoXnZOpvgzY+6AFaxS3U=;
	b=t6405MfcqkvgIWKJSTsR9VZPOG8gFSH8ak62/N4C0qEuZ9SX1VouXAJVGkiCklCzgbzg
	 9wpuAN/TuXLV4InaN0WIerdEH0KG9p9cukMwndtT5dDx+3sAC8fivk/RxuppEwNcgj7wm
	 eSY5Adu2Dg0cPzNZbz4jZmqqmqIyUTPMBdXFP+qT/ObCV6h2Gn8pHAe4PTrpTmYoK7p9i
	 BMt1wfkzt+XaZvc8whPQSQdFJZf+/z2bkC0uSxzEQ0HZKhMjZyfPPButsDjqGHOwW3X8C
	 b8/rQ76hbHV6++c2MFvf7xNvjS3/0fgwfemLZsKVPQKxY23FT0lIGwF9BmysQ1S1QMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aq8BOmL1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A8860D545D;
	Mon,  2 Nov 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aq8BOmL1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282201F00A16;
	Mon,  2 Nov 2026 15:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633493;
	bh=/MUczHsrZCLhXqfwnzNJcmotoXnZOpvgzY+6AFaxS3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aq8BOmL1uomLOk7NJfas1WmVwDPWWH1Bu6HslgvC4jNKbNbmdODgCYmALYY1FxTQP
	 4fuPqMJYYwPzz0lwSnTFNmSIoX7zFHeBBWOZ8Wau9udySXWGiV1UCga0JdfP78y0Jq
	 VCEjVKaEcIu92l1lkCZ9PcoVAWeFhMGDePj1EnCLm6l0qBefzZx7Zwb0TlTK/abtjs
	 yZt0lUnH3W70Gqpv59NBMdH/IaA+RL3t7Mh31FZocJeEPuM5QA0XpykgJUtTBYx5B6
	 y0YQNECddDapKVsBALbgb1xqoff2ipMF0XzkC9X145yuLw57mD31J46Dkvv7Xbbeqz
	 bDuBYeLhiWtLg==
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
Subject: [PATCH 3/6] powerpc/embedded6xx: Fix logged function name in mvme5100_add_bridge()
Date: Mon,  2 Nov 2026 16:30:01 +0100
Message-ID: <20261102152957.300019-11-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=804; i=blum@kernel.org; h=from:subject; bh=PeXDYQ0uhML6QLG6892JtiNuhqrb1CCXjntXNBLkips=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkv1jTs2PfcnZUlZElLb9K2C2dPv1jdu2+Vk/alYNOz+ aW5C/j6O0pZGMS4GGTFFFkezPoxw7e0pnKTScROmDmsTCBDGLg4BWAiyRUM/1R6Wu4sF7yQ3GP8 VXvZEt/7XFabZmRveHda5eErhT2fM3UZ/vDPrDe6tfTx0z4nvmbGSefEPydzRUp03704a366Xo2 VFhsA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Use __func__ to print the correct function name.

Fixes: be2019816e4d ("powerpc/embedded6xx: Add support for Motorola/Emerson MVME5100")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/embedded6xx/mvme5100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 6a88abac047a..b2979a2a1721 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -144,7 +144,7 @@ static int __init mvme5100_add_bridge(struct device_node *dev)
 		return 0;
 	}
 
-	pr_info("mvme5100_pic_init: pci_membase: %x\n", pci_membase);
+	pr_info("%s: pci_membase: %x\n", __func__, pci_membase);
 
 	return 0;
 }

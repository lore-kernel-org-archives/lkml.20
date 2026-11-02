Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633505;
	b=2FWkWMWWaSHaJ26ZTDxsOj+OmU2yb07/ULfvdBwBgwVE3JcHBZHLP5ohZMKsMLhBvvMh
	 TWkOUe107MY1pesUHHhdrw6599o/PDxJwpzSjhjvFwfaDKgSkIKUASykyY8toGUKtTHG+
	 h4i0rWjIBaZfZg1tm2IrakqsAWwK5aP3Ngcr9riTZjKbT8rwCC5YhoTXymWtMDsgAPKqc
	 OAiVdzFUsmVu/tW8geQ73qsANw1OxyXlLl1sUeULeo5ngubSOPGA1ENQiM6V54jtOEcAX
	 cHS5hOk9btedGXpidldfPTuOURwN+W2B8FszwWUCd9xSrooDNbZ1ysxi8NuKS/SMOGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633505;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=Zs0yc7hfCUyyfuvYuFp9idkJq9C39UALCEnyzzNFu4s=;
	b=JxAj1unaTFKlNMT9SvtAIIbTpZDXwbhzSq7JEJQ2AU/gF5OlINb1mHxHVymad4ELxXrD
	 GkiV7y/TcGgNngG7xBsuOU6VZB9Sukh2Nok6mHuIBtML5JI4Cosf2CUuI5PN//0NhuTgg
	 MVKDHHeRxQa/LrVYp4YnuG7y9bPDf6mOfbyrJTLAnycboc64tlcsRXJPE7/zPsRIr6qkM
	 hspXmMZxsAKT5+TeUBG1ELzySw3L9uXJ4t/FBzCQpe89N4ah0lblifzrfXR+cf27snWZp
	 BxjuDrcvAEhVrsEG3UtJGfamquUrqeOdissGjbTIERap0cb7VIoe9tyCQ7kKBFltcTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0xCskD2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83D60874EC;
	Mon,  2 Nov 2026 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n0xCskD2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A00E1F00A1C;
	Mon,  2 Nov 2026 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633505;
	bh=Zs0yc7hfCUyyfuvYuFp9idkJq9C39UALCEnyzzNFu4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=n0xCskD2tFQ6LsoMlk4Vfq+rBSeLSbi5l7O4cMyg92xtgC+U7Klj9ACf4l+ObJ1yu
	 gYL+IL0lU5CycNktu7G+DAmYdtWcGvn27AUGVwkKZKtyo9xyA52J5DkB3oFNsW8zXH
	 JcrHNgz077N+lnmwQ7O7czIIUdj7RBBkbqUpxFZbVxaYlKbfWa0SEEUdZxzuN0iE4g
	 jRCI6FGwYu40WXjCXjw1Hn4Gikdwd5YwTY/r/4p6dtRAW+u5A/4531SYMIRDp5IpK/
	 9F8/3eEPOkhntVK10EY7O86tAdLgf1cvBE3gbB3rK7DO5GRqVj8m7LCNTsdbkz26v3
	 rwki7F5QBhFYA==
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
Subject: [PATCH 5/6] powerpc/embedded6xx: Mark pci_membase as __initdata
Date: Mon,  2 Nov 2026 16:30:03 +0100
Message-ID: <20261102152957.300019-13-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=blum@kernel.org; h=from:subject; bh=sLrnAV5jipybVaqGUaL8H8Sp9/7x0+b1dy7v5GWEcUE=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkv1jRfzWUx0a0V3qOsdGlOVtfWCiHLg/b/HVYvXvCbe deRxMXNHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjARl/mMDC/LLlufvf2ltCS2 Y8nxVK+bkdfM7Rc5vphxMyv00vx8Oy1Ghitfpnw8aLr1I2eH11pttaYG56xes29Z3YtCyvbeWML MwgQA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

pci_membase is only accessed by mvme5100_add_bridge() and
mvme5100_pic_init(), both of which are __init functions.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/embedded6xx/mvme5100.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index f22e10eb0c65..b6b4d0581fa9 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -35,7 +35,7 @@
 #define BOARD_EXT_FEATURE1_REG	0xfef880f0
 #define BOARD_EXT_FEATURE2_REG	0xfef88100
 
-static phys_addr_t pci_membase;
+static phys_addr_t pci_membase __initdata;
 static u_char *restart;
 
 static void mvme5100_8259_cascade(struct irq_desc *desc)

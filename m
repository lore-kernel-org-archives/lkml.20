Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633488;
	b=HxlCFxH8WNcfAWdu9msS5j4FxzXSEXQ1I9AKmi16b+vU8+ibChCqUw0QB2jO/x/TmOXx
	 oOKYK179cKpEKX9eQvuCGbMnvwE981kLGCbYO8Vz3iTDG0MPdLmThpBTCZPdC8Qq323u7
	 W5Ap7kIXDHV6RIRG7fIkb6024lamTsyc4C5nYbFhXql5avOnnQDtaF4wq/MVJ5stAA91Z
	 laWONPKZ4/E14Sx6SldncCMVIBSnRlrkoDSTrguaZPS62mTKtjIDujhHDx9vHfUsQ+uGq
	 joF04AG8UdDV69K8RWzIZhWsMIKRj5WOQZOn/Q66H8Ltwot+JtCYF2+bxLCocbFFBpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633488;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding;
	bh=7YyTCLjlVjUD8PuEQyZV2V8rls4hQ82Ljpe06zmYJVA=;
	b=PmM8u4jOwUONrQaSIfOzaTyyekQ/aUPhyki+CQ2Rg5LVUvP34RiZbe1byfxR2nyhWG74
	 IAynN3Z1UOKBC/GxB5kfm9Tsb+RloKERbCZJ5y+CwdnV1knhAf4ThD0c7BQ+4qikYbikk
	 gzQVe9BANzeC2YKiX7VAmI1KeDe6B3ujtUmMUkWESK22N9j8PFgeNNlY3rryioBX1w9EC
	 ji72gEePfutdRbfKSSIHGuo/YUhK7SGCZpBQQ/8ZCqCSfFucARqTsFf3LVhbvNDi4I+VM
	 0VlaeVHJ/m5qR9AXx5Vz06EJ8nIo9gT9MHcXoxJoKhA6qqMKsV3EGP+ndacHjd+MGeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWoIsYgU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D901A6072236;
	Mon,  2 Nov 2026 15:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AWoIsYgU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA31C1F00A1A;
	Mon,  2 Nov 2026 15:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633487;
	bh=7YyTCLjlVjUD8PuEQyZV2V8rls4hQ82Ljpe06zmYJVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AWoIsYgUjKJ2OUZiiG1sqQz2O5ebzNJhRop6sDmR+kmSvUZvsuUhebCjS/IiM1K9G
	 xRgjQx8UJVZkJwPP4BJLv2yBRsRTjjiiq8ZTV6NyMOAJe479JpX9ngvhf5jFbWxjf4
	 9k3KPFPaX3LL9UCuI3b/qM5rqJsdYBzYdEE0t1vLxlVKkxAvy/PUGeaTFF6914toCY
	 lNLS+miJ7V1mXNnio3nCby5JZ1ROicD9ArnPYgYVa4b/6UErOcA+7ME3WQz9P2TzZF
	 IMnghFrYnfC6Ek21yuOl7EF3weSSkSBbWFOFls7d5OVgCP1aGo4qcqh0iBuSl3iwRZ
	 jPRJAJszZT3cA==
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
Subject: [PATCH 2/6] powerpc/embedded6xx: Validate bus-range length in mvme5100_add_bridge()
Date: Mon,  2 Nov 2026 16:30:00 +0100
Message-ID: <20261102152957.300019-10-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084; i=blum@kernel.org; h=from:subject; bh=CflllZzQuhvqimnUAIXYbj9Rm6hEO+jyVlOLXkFdRU4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkv1tRFh51iyrJrS5l+MbPpTLxu13Uzz8dXuTIc+qbw3 XFzPGPSUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABNhmcvIsG/LacM4gZm7Hab9 T2my+ifuK7XvZ4b6hteTF8l29Mzm3cHwV2ZJz6xL/68FXWbj+tzs5Stgt5vHSJhRupRhx5GMGzU eDAA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

mvme5100_add_bridge() reads two cells from the bus-range property
without checking its length, and a truncated property can cause an
out-of-bounds read.

Check the length before reading the bus numbers.

Fixes: be2019816e4d ("powerpc/embedded6xx: Add support for Motorola/Emerson MVME5100")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/embedded6xx/mvme5100.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 5ca41972ef22..6a88abac047a 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -114,6 +114,10 @@ static int __init mvme5100_add_bridge(struct device_node *dev)
 	pr_info("Adding PCI host bridge %pOF\n", dev);
 
 	bus_range = of_get_property(dev, "bus-range", &len);
+	if (bus_range && len < 2 * sizeof(*bus_range)) {
+		pr_err("bus-range property is too short\n");
+		return -EINVAL;
+	}
 
 	hose = pcibios_alloc_controller(dev);
 	if (hose == NULL)

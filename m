Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633477;
	b=t/lUMuROVGoy09o/i7dfW4o7rb01/hcpqPPAIXKE+gFf0ct6YgBN14xSCHxtPNXtO8wy
	 ILcP5oP2roB/v13XMc5IPBkEIJ2Q/1zNltlVXOwTA7PuD3M/FOTD4cSWydEtPO01TIK1g
	 +xmrpv+MZepDWXZ3PIJSfAigwfxnFUwPzFioGsSElJKIwHZUPwn2ZeXUrKVIiCbLjf9AA
	 38hEMQmkBeVwV6liAaxVKj3xY/33sHtrY2ntf6IrVx0HMi0dfAf16SjZeh432CjXLokU8
	 KQhZfSmQ0vbuAYrJewZD/RZlE2qDrgN+e7AU+maNRXcFOpEsIO5omPKIAfj1IjpJqfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633477;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=+9txrTl5/NO8hYAgz5oQlXyA2nE6DwHGSloTA/xHM54=;
	b=KGDqIRWLXDX6T77jwyXrErCWSabGuNwtrp0uv9ThXT3rXWr1Fpb+qS5+S4FIZrPFw0VP
	 b/Hg+6IDzWQ5PmGz+UlaLd/JYeaP6Bb60MSXLNS5y27orRHkOYxkOuB9yNSKFlC2/wyIY
	 3r4bVUj1O8yhsUjKRVWHmvj477KB2tvhfNJuZljygg9XEyybrB09yaqXIxTqa/+VidsUS
	 qHe5VRU9+IGvvoJAstVPYWTLZvAXi3zE0KPPU9AmORSXFfx1WwHMJ2fbEsKVkeqpMMIl4
	 T79HUz8auatrz7lFRq1uSvdIN5OCYuGNgq9+R4kI45kwKUa0vcjMo8fWxJnWfVK07dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zsqqkc9k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925686088B0E;
	Mon,  2 Nov 2026 15:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zsqqkc9k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD7E1F00A16;
	Mon,  2 Nov 2026 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793633477;
	bh=+9txrTl5/NO8hYAgz5oQlXyA2nE6DwHGSloTA/xHM54=;
	h=From:To:Cc:Subject:Date;
	b=Zsqqkc9kduFdUaxpOIpvWzLs4s6w1weryuyFxz/3zrBRZkBRlHX1FaiJwSIB50s3n
	 2zELJefLLOL1ytjVcg96/9BbfGy7BsA/l9ijHsdL7+uojqzkaKvSoPkiR/FE2hOgrm
	 y0wSIFcvti7pxrVNqHVMpbjF4WAY/rOSM9WIAg+qGu2Wtq7vKfD/1Pq1ZazX/FkA/z
	 K6JhZJaGXKEXGvujkA593Ty0aZv2c9yRgHlGqHdP2Ed83vd/Hd5AgXWVEvpGf9NCem
	 7M9d19u9Ua8zLR47QB4Zj1VN5Nfg/xErLVdfZV1x4JdVFsCfRiD8myOhjuPQjrvP/7
	 XUJG0iDjgTl/w==
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
Subject: [PATCH 0/6] powerpc: MVME5100 fixes and cleanups
Date: Mon,  2 Nov 2026 16:29:58 +0100
Message-ID: <20261102152957.300019-8-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=blum@kernel.org; h=from:subject; bh=ZxhEJFnmm8qLi9HIdGUmQB3gA8pliXDANXM6do7v4Wg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkv1pSVTg58qupTfC48RZdfPWDP1ESWZrnz2qJii1Nl3 sl633rYUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABNZcpiR4cqb63kTtog2tApN UzyZUC0113fO+lyVmappZ86Ym/GevsXwP+XiBQvbW0s0XU7xOqxS0szbFrl09pOFDj4/onO9nRl vsgEA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Patch 1 removes a dtc warning, patch 2 prevents an out-of-bounds read,
and patch 3 fixes the function name in a log message.

Patch 4 replaces hard-coded function names with __func__, patch 5 marks
pci_membase as __initdata, and patch 6 removes redundant initializations.

Thorsten Blum (6):
  powerpc: dts: mvme5100: Drop #interrupt-cells from ISA node
  powerpc/embedded6xx: Validate bus-range length in mvme5100_add_bridge()
  powerpc/embedded6xx: Fix logged function name in mvme5100_add_bridge()
  powerpc/embedded6xx: Use __func__ in mvme5100_pic_init()
  powerpc/embedded6xx: Mark pci_membase as __initdata
  powerpc/embedded6xx: Drop redundant initializations

 arch/powerpc/boot/dts/mvme5100.dts            |  1 -
 arch/powerpc/platforms/embedded6xx/mvme5100.c | 19 +++++++++++--------
 2 files changed, 11 insertions(+), 9 deletions(-)

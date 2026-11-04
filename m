Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793813334;
	b=z6nP10WyecUcN+24Lo0GICxCHa/JA7iGHpsAAHcJwLo3uMUeky1CowASbWcvkOBtwG89
	 HLuSLq35LsZkTvM8VkFKhEJMgxHxpHphZFqxt6eHwmuH59ZBDbzu2f0p8Qp50M6WNDmRu
	 JbOtfpRIqf0UhBU0+2GWWSo7bvAxawDwIFQUpgfYpo1pRYAFCyrpX+oyzAMK0Ldv/t7xl
	 AIuc6oGqS2pfvuboYnY1xk6cvCYNhnvBcu980nv66YCYWPJCY1nW17dc6uj+79sGxUNnP
	 r9Dmz57UfSCZYOQLSbiCX3KiqoC3YAPBM/dcWeYsOnYH+IwagT0HTKvPBmm0VUaRm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793813334;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=/2uDJDXzHicGsxbsYEgaBGi/Fbf89CthmN/itDPv2fE=;
	b=tBeACUQUKZRzaB5em6SdNR/tIuyQaD8S+OWcsIXdD2xkjWIZPLOOuKZ14sSvGLTRtKLz
	 orsvQ1F8Z5+Cuz4RQDUKY2/1SdgPKtqv2tkbpxxVf71IePquncfuEyXiU+d9KlB6OoZai
	 asspFsiiMUwG7USen87uwMKEhhleaHADNeSIJFBLgRD7dPySYTqok9H6Yv8IU3h/YmUii
	 yAxfOMuDutxnz5lr66GQvpEgmQ3SW8TRyERY5CoS0erVpKsghn2gZTLDBdbvbDPdNf0T4
	 183bBr/uECRoThxewfy9nUEpUh15rTCZvh6a0+Y0+WhKVNMKydHJ3vzPxo5onaTXn3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SK7izhno;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3798B606D81D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SK7izhno
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C891F000C1;
	Wed,  4 Nov 2026 17:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793813334;
	bh=/2uDJDXzHicGsxbsYEgaBGi/Fbf89CthmN/itDPv2fE=;
	h=From:To:Cc:Subject:Date;
	b=SK7izhnoe3mmurLolplKYHMvxuZJblKrGR1JL6yCVSRiW3casRTlCR/nX99F7RRR4
	 xCx/nMtQS8ZRyLJHDsA9ioaVoBmtkouKdLpsI3WJQI4y1+VqsY7Jc2fbSDk/wKuZQz
	 RG80y08RzwLUmU6699b9rum7MzzOu5RPqMUq6wIZe8MJ3QRiXaSConDF0WevG4rAiI
	 IzjlaPOadmFKvNv426Ph7YwytWPR11VYIPm2ShrfzBpuf2C/lLQM3KH0geEi3tbrYS
	 MpkSpo6D5xTRG7XXQLyy/yBX4275tvfrA8amqJjvB7M6cQW9Dh/x27LpXoHcFgKgOI
	 kNRlZRkBNbzPQ==
From: Thorsten Blum <blum@kernel.org>
To: Anatolij Gustschin <agust@denx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: Thorsten Blum <blum@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/mpc52xx: Remove redundant 0x prefix in mpc52xx_pci_setup()
Date: Wed,  4 Nov 2026 18:28:28 +0100
Message-ID: <20261104172829.231857-2-blum@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=blum@kernel.org; h=from:subject; bh=i2d7EHLyCvvfJEHd6m6HmC1jX0Sr9JHbihHcAYB3m5E=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmvs23D+kONOSq1v6ydlRg9YdIbV77NqW9YKzh4HFleZ Py2SOzsKGVhEONikBVTZHkw68cM39Kayk0mETth5rAygQxh4OIUgIkY3GJk2Ptzfp7HLJuktCin k08SOjNsYxxsn036f0t+Wq7iRu+9tgz/Uz/I3jxioCScVcMtfq5h/eGmHe/X7W5cHqN0XuRmi8M 9JgA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The %pa format specifier already includes the 0x prefix. Remove the
redundant prefix to avoid printing 0x0x.

Fixes: 59510820fff7 ("powerpc/mpc52xx: Fix some pr_debug() issues")
Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 arch/powerpc/platforms/52xx/mpc52xx_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_pci.c b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
index 0ca4401ba781..a2e53cacd15b 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_pci.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_pci.c
@@ -288,7 +288,7 @@ mpc52xx_pci_setup(struct pci_controller *hose,
 		printk(KERN_ERR "%s: Didn't find IO resources\n", __FILE__);
 		return;
 	}
-	pr_debug(".io_resource = %pr .io_base_phys=0x%pa\n",
+	pr_debug(".io_resource = %pr .io_base_phys=%pa\n",
 		 res, &hose->io_base_phys);
 	out_be32(&pci_regs->iw2btar,
 	         MPC52xx_PCI_IWBTAR_TRANSLATION(hose->io_base_phys,

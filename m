Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926539;
	b=i/3X94u3yzKURnDXfnovheZTNXPaKfoqvkxsMuw7yuO47Ki3dNAt7xvoCgFJGlV52ojO
	 Wj/sLnYELZfWce1iU+6CIzmsUOuXoiVOMi/agTD1uDOLik/tCIVN31dKmEEoDWoJDhBhN
	 ro4EdIgAL8mS1SdaddV/HGs6nBurSAOWLitLFINg11ItWxsWISIBBSO9z1FX/W5yPTkeL
	 5X4Dv6STNCxusOF7/n99Xf7ydGhRaodw0LkMmJHyJYVhxTIL87g5hO8JWBe1kC3jPG8Uu
	 OYnkAhq03aFgjqFiJD5C0KhK8xMf6g+Sc00Kn1Yh5UAvHlV3yoFonauvajyga7EspGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926539;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=lv7SsxAS+6yBb6Mmrt+KZ3QRvMmSGffJu7fN0uxlhbs=;
	b=B+1R9gb0CPwrmUa8vJ/OgIfgI1Ox823Wa0QNVRIit6xDYGnfRdrGy0DvBWkRaJKZAiD/
	 G+Xzj+NshXwf66XGaOEt9qpu5rbhM0LLp7CJyn55bdeNBhErtidVMVKWqRJx7YUzcGP+q
	 kq7q/VvWzjWPVj3jsTdSUbcVX8xt6FdeyngHgurqGCW3KzsC9ie4Fn9ouN7YNJ3UzP9JK
	 zkw+tiZRzx8fvMyUtTPweOsFjfmYqyJzelMZcbEM2WslswLAZ4x6KDpZGUFLg4e8GQguB
	 bC1T0u5SUVuz8MauhCVLPgu8J/mHKvetWbN2O+yVEiLkkboGuevweOYtyc9SCZadctA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CsB8GelW;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C470F606A31C;
	Tue, 17 Nov 2026 14:42:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C470F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=CsB8GelW
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e737;
	Tue, 17 Nov 2026 22:42:02 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Boon Khai Ng <boon.khai.ng@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net 0/2] net: Keep MDIO resources until netdev removal completes
Date: Tue, 17 Nov 2026 22:42:01 +0800
Message-ID: <20261117-571e631490-net-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e9f531ac03a1kunm86a7bfd6155fc6
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH0hLVh1LSExMGktDTEtIHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=CsB8GelWBkG1+Zpw+48tVnC1o/L7fUMrmDhGM+hqTeEy4wXgQJ6YJumHiDs5RhHxkpaizQws3Gjfxf3HFH3nAYla750edbPhlaG2QnkkvAIeOAEttxmLRzxKYqanfSJIMDbm4/+9O68H+RIPnl23+TR29D1uD4XwzqRSrByv1cY=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=lv7SsxAS+6yBb6Mmrt+KZ3QRvMmSGffJu7fN0uxlhbs=;
	h=date:mime-version:subject:message-id:from;

Unregister the Altera and Emaclite network devices while the MDIO bus
is still available to detach the PHY.

Guangshuo Li (2):
  net: altera: Fix potential use-after-free on removal
  net: emaclite: Fix potential use-after-free during removal

 drivers/net/ethernet/altera/altera_tse_main.c | 2 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


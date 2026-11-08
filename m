Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794103680;
	b=2vmYFPvmhOqm9NInghxwWKVzbNqghNYD64UqIMVJyoYL/rQGCVtHO6ap7HbBHVEvYDFM
	 8OR0Te+BwqRmrXw7T8YGWSLlzryUgS9Pk00KFbGJaGGTT0gy5Ajm8u+qUX50VhYCP83qb
	 tzLf94HCNghcpBf5QgGkSq65seN7Gv2PMocwe60WQwRZSMLiAzjqMTpeQupM4EjJPlfrt
	 w5I7hQWL8kwlav+D/tJgYW8rtV6ex9rz0afN1iIzZl7EfF+iFlI4/KjtbOk8hMlm8pNHt
	 +pjHhxB0fBItPaFxA+BIJOzE7mMofc3Yiue6Sb9Mk+Z82ziBdB8Z/5Oqyva2dYmtirQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794103680;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cE5X996bYlpeILWOAPyTHj4q/WvmsIGYM/lUyZln7oU=;
	b=pZKCQsgH93Bf/0ruryhqdSpeA7eLqTHD7NcZJmZYrq6F5OLaUGYijiKMHetVddcnyn4y
	 zREL0LDf1Mcs4Xm/MVFiiHWaM7MMeSv2clvMtCFq38etKhb0RbrHTOZjAYZqrPiJYPbTh
	 sIXvk3TOMWk8Je+u4iC4lvsw33AlY3O1KHwCavES7XaVoYYkdFwrWckzw93Ah2DH8VTVF
	 uY0L0EC4jRXh6bGQBzCgRQgnBGEwlQfX9bYyEAJjAcCZ2waGngOXQZzhZhhR1l89tRdNW
	 Iz14G41LW0pKnBWYn3c3MCb7zgyR95EQXOuU/e9LzbUsAq5TcebwgrpZQlR5J+t4GbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqaQCJS9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA28606A31C;
	Sun,  8 Nov 2026 02:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nqaQCJS9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794103678;
	b=DOEUK2TU9TmBg9IwOVrLdQWQz5R1ALaiGhWIAfyprx/D13zAG8oLSi0oTGwTCNq+pcdI
	 gDeLUJUOip854yVTHvr5E6UH+8xJU71dZjBdY6PMUdKTOaD4F+rAmb/zCehyl5h7G6gD3
	 DE5UYbqMCfgaOqdJjJzlVs8dzOXBcfIK4vf2quBkQkZC3dKoy2XTcM0gjyxuFSE08qJO3
	 T5amfsOykjpuZVV8k5+5A3/W0TJwyP/fOEYBioxis4oOPTMBYQy4nFNJiKWoxTfXdGHf9
	 v5n0NFViPTGw91qhWL7DKumX9HKvaP/ZEc3deORaHV3zlwsI8FTdvSY7pnNQ9HYoinw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794103678;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=cE5X996bYlpeILWOAPyTHj4q/WvmsIGYM/lUyZln7oU=;
	b=na4zOLy3rdRgWCndBu2rE02u9oIAW7HboqWNA8O7sotmaznsFhMfaChEDOKqb/AQ6GOp
	 gttefpMwM3SBJ6wrUCinHzoro8sE4/otDbhqGQcN/+VOKEHxOLeKlP0SZ1xNfXTyB3LyX
	 9PxDK6pqjWk2U0i0xMS25P+M3N9Ur82yDZd1y8knrrircWQtVJxMAnNXS38BST4pPunWC
	 nUBVPcF/eMyaDH44BTuAB/h8ty1FI2zElYfjQqPy/2qbGf7KZff1pdpzAArE3M3rtUW/Z
	 sWHboqh9+alYPamMOE1BSfyVxCYfOW5LQGjVhecGjp3DWHCLpugmZf9BTo8ox9/7lDw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D39111F008A1;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794103678;
	bh=cE5X996bYlpeILWOAPyTHj4q/WvmsIGYM/lUyZln7oU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=nqaQCJS9IYNVzfKmuhoX+Jed4Q6Q1C9iPCCIbPUVB69LcLI9hIOoJvhJlJuEtvcT4
	 +uOqoDVHt2Bw7zmhD+KnR28pfdnerwJKXxwPfTV3ypO3kvzYaWUCXTOiyrojAjC9J6
	 z7VbVFMxRWPjKnlEhiNumHPQaixPwafc8xANHoYoUazrYiZD7GU3phuY+w8MdtISh/
	 N/vXfrcDNGUwaClWGsrFzMGdkwdV9tYUqmn7BORBKPEVbplO6hAxnVMzNIaWZrDHuY
	 5+4AFFuwkOK719q0k7YaVjA1MDRXVWrqOkhz/wQFL488QxHZn+Qq5ZpFGzUmEJGt93
	 /2EOxwdETrxlQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 55FE447D6F;
	Sun,  8 Nov 2026 02:07:57 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 20:07:55 -0600
Subject: [PATCH 1/4] staging: octeon: add kernel-doc to ethernet-sgmii.c
 functions
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-octeon-phy-series-v2-v1-1-d7ab0b4b3f17@gmail.com>
References: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
In-Reply-To: <20261107-octeon-phy-series-v2-v1-0-d7ab0b4b3f17@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794103676; l=1244;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=pXGe9ISk/CZTC57vfsChGPvOtfOD2S1zoLUk/A+V/3Q=;
 b=GmCDf72LC2vn62S50waLjNM24nrJYRRazybn3P3HE6WGFhFyTvOqxcnpKSUG1nluksprY0WAb
 QNJUxknjuDMAPKyHHXHLG1lte1BMs+QaAtwujD/OMc2Vz9lwngbmIT3
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

Document cvm_oct_sgmii_open() and cvm_oct_sgmii_init() by adding standard
kernel-doc comment blocks. This fixes styling inconsistencies across the
octeon staging subsystem and allows documentation scripts to correctly
parse the function parameters and return values.

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet-sgmii.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/staging/octeon/ethernet-sgmii.c b/drivers/staging/octeon/ethernet-sgmii.c
index d7fbd9159302..2cd717709414 100644
--- a/drivers/staging/octeon/ethernet-sgmii.c
+++ b/drivers/staging/octeon/ethernet-sgmii.c
@@ -16,11 +16,23 @@
 #include "ethernet-util.h"
 #include "ethernet-mdio.h"
 
+/**
+ * cvm_oct_sgmii_open - open the SGMII interface
+ * @dev:    Net device to open
+ *
+ * Return: Zero on success
+ */
 int cvm_oct_sgmii_open(struct net_device *dev)
 {
 	return cvm_oct_common_open(dev, cvm_oct_link_poll);
 }
 
+/**
+ * cvm_oct_sgmii_init - initialize the SGMII interface
+ * @dev:    Net device to initialize
+ *
+ * Return: Zero on success
+ */
 int cvm_oct_sgmii_init(struct net_device *dev)
 {
 	cvm_oct_common_init(dev);

-- 
2.56.0



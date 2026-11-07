Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794036202;
	b=Qb+ELTFde7CRw1V4lyo2E04PeiI/EpQNGa33IY8RiSYXisc8YtYIYJpkU75AniLSBkSe
	 RoHOUS2SzOlrlxUgPaZ4gYvq9oBGWR5iV2CaEJrXc6dypBcoOE3V+x7cu2u8/RBkU6cbt
	 fjuJglP/xFSQmHsFEaX6b7/56MlBYFS/iAsduE/zZLr0I+b902+Yr80qr0YH3wyTJ2BiV
	 Gt+x7vOP8bZxU2C7zF9NEQArsRmOZVtd2GS0lyvQ6aMD2ZwSb1ZotnTUvpkURjDfq5Tpg
	 ABEm5Q7Rm2kv9Az+H/P9//ONk8hphvUkaAFwx9lvUgo0lBUqJOdu6T8v6KeOGr0PNlg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794036202;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UtiZOLQQFsDtRmUU+OGgmH5wZNmyzNdBMujXjQVZUzU=;
	b=WJ5Bcv4loZLlQ+UgdW+FoXgoS4h+QljENTFIPmZ63PVfsgzGHn3KDqqwy4edK1rSNlbN
	 FOfx2vgAt9D+SB9+8xOV/sfN8f4cJWpohLariIDU/SImIpDUM4n420QivTjpvZaRpWfM9
	 dZK/5d36viEYyHmOhXEFbO0aHM6Gz+cayHlLsDk56KgJHeuXv/1MmwK08CZ4JZ7N5z/ZI
	 /NTz/NjP0S2++15pZWUvlKd+e1J5WH69Yu+b2H0UV9m69pPCNL9GcNeJ9g6VgMGwfPGxG
	 O18RMGr2XQmkyv5LHacEn8RefVBD92RNOgPl/C29wo76RONVgK82ArxNhWImf9AMzyA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdVhIhgj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DEF606A338;
	Sat,  7 Nov 2026 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdVhIhgj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794036202;
	b=Xo6Py1ISPqUgPifuTEzEvLsfvcMAeiIMjPpiqIHG0gHIEsU5McdWEY0iZ1b0pID5D4ok
	 6uADnGTIbY7E94zvCnQh6waCZkUla60LAoI+Nnsw41EHzP3VjubxtMEZKMbwKbqJeeqLX
	 9cIs1G6ogNMeYBqNV0w5Zi9RLHgDSZzfpoTPDXof9UMhdx8WW0vVrkP9Zp18AMI+6oORC
	 ZPbV3AuQKuOqvPJIhi/+2IOd9VohFfoLEEUwjNSIlpv08aqAgxjVzb0mu46+rOzG7Afec
	 cNxvwcSM5ABSHqPJnv7z4L0yTBi/9SNxYcyE+omkLzqxaiO/7nQG9O7vpQcqfWa3k1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794036202;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=UtiZOLQQFsDtRmUU+OGgmH5wZNmyzNdBMujXjQVZUzU=;
	b=lebFyU8DcCACcUz6P8HnC/nXXkAZRwB+H6uoL25YNCQfeSXTeakwXVatgEePGvXLBdrL
	 x1/6betDxRrFvZtcvkOAuBNQc0J7CNkH+Zlx5PSjNp4l7q4GFa1UDnsbQP/gRT238Vvqi
	 kXUhTeIU6lGMk7v6vAWWpek2oyLCFLPzx9+ykjgKc+vTX3+0TFZfDO0sug+NIM3QtGR7E
	 bfLCQ1wv8s8Unl9CLhpHWMSmv0Qvz4rJ2dnBnF8joLVktfqJEgMVmwhUwIgpBU8prUfNm
	 LG+DclayeaIVuVGg5yBoKeV28E3FsKmhAiUFTF0yXihsWH8MQpcQRVfYM28/uFNJiYQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD9F01F0089F;
	Sat,  7 Nov 2026 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794036202;
	bh=UtiZOLQQFsDtRmUU+OGgmH5wZNmyzNdBMujXjQVZUzU=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=XdVhIhgjiOn15nNTtFw054P5VeYyvzFdrV/rw60ri/Iq7WhnhADiBjuLDWjYqwSHx
	 /7Ph5RuRbnmlkdUXiWXdF9cHxMjkcxPmN67h64gufIStah5CKI++CY8voC/LmPm3Xz
	 efqxzO0p1tOdXjxLJvtLGlHAa4AMUe5QDauN1M3r8gP0TsNjqALKMWV9kSt86WEMC+
	 DQKufaAA0hwcUj9ynuXJuiqIQ0TxOT4tI8ij4mWQ20/DprJej0uzA/mKLqrMmoClNi
	 KWrVtiIzshS0b6elPX10J9KsJlTI9+XtMScMBvElyqfY4luh4v+g81eke87IQQaa7I
	 xhkUtWCC80Sig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5291047AFE;
	Sat,  7 Nov 2026 07:23:21 +0000 (UTC)
From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero_via_B4_Relay?= <devnull+aleszlucero.gmail.com@kernel.org>
Date: Sat, 07 Nov 2026 01:23:20 -0600
Subject: [PATCH] staging: octeon: disable PKO before device removal in
 probe error path
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
Message-Id: <20261107-b4-octeon-pko-disable-fix-v1-1-4e54658fe34c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7biE1ivpKdNDcailUNCKI/p50n
 IGZBzIlpgyDeCDRxZmDLyArAfNm/ErIrjCoWrVS1h3aBsN8UvAY94COs7EH4cI3ttbprl9IqV5
 D6WOiov/3OL3vB4BIYq9rAAAA
X-Change-ID: 20261107-b4-octeon-pko-disable-fix-6bd379fe2293
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794036201; l=1196;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=b3Y2ZMJCrAoNlfMwA4dOrqbA/Tfy/ykkFc+b2losdKw=;
 b=/L3VOJAE8nIX9C52Qe5AJ9uDS6HP2vkFj/DStKXHsPW2ZKyaLUed1dslfz0Tb0DCYI6eBbGBu
 fU9/FZdydDiCPZzlM3Hln4Bh0hfS5yr5ADuf9I7iCQGNpLYWDHAQbag
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 8bit

From: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>

cvm_oct_remove() calls cvmx_pko_disable() before removing devices and
shutting down PKO, ensuring packet output is halted while transmit
queues are torn down. However, the err_tx error path in cvm_oct_probe()
omits cvmx_pko_disable().

Add cvmx_pko_disable() to the probe error path to match the teardown
sequence in cvm_oct_remove().

Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
---
 drivers/staging/octeon/ethernet.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 42ec4b8324a8..c77678cb351f 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -959,6 +959,8 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	atomic_inc_return(&cvm_oct_poll_queue_stopping);
 
+	cvmx_pko_disable();
+
 	/* Free the ethernet devices */
 	for (int port = 0; port < TOTAL_NUMBER_OF_PORTS; port++)
 		cvm_oct_remove_device(port);

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261107-b4-octeon-pko-disable-fix-6bd379fe2293

Best regards,
-- 
Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>



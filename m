Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794885109;
	b=hRr6I+oi/FLKJCteetFpq5vbDWfy9wnQbpq/FAPYs4FeNx53zvZaWANNnqnDu+U5v04f
	 tz8SK59gjJX0WTJf8git9tLVZemGJBA8Xvp0zJcWuKbz5WJnIGUYRcYEqqGHhVkgoOcpN
	 GVwzQlXYgw4Pa+T3YwwFhVHdR/x0LWcpPI1/g/A2v2ElQ4kWCBj1y9ieKCSv96FMdiJ5k
	 +RV84rLEazNKdHJpnNqE3p1uphpHuGqHLFrVoAc8Es4nZCOVLecRgs7M0LQXJN1ra7a+3
	 4Qc6CZBjPMjfVz1Eo/ue4mJw0ZdkN9OczWFw/VVGz/a1xj4VBoUgC6TQmXiFz5vqGIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3oEyXkT10pdH7P7mR2+WY3w5NVnu5TROP12ldyy9kHs=;
	b=aWp699GbyjO4T6NgQdmQy9Nt4xxmIzLR7xqMm14XB00OobimaCHMAnNF9Eq9D0gQiyea
	 zS4BqYViZy01BrclBNZaAj+zn5x1XiZ7545I41gtbpm+LPE4Tcdvt99GeoUrizNClfWhT
	 7b/7u3LY+jA1rjiqe3d5qIsIjVhjmGM+0qTqdRNcg8uLFGlylCpjQBc2YZseMtjLoRCgo
	 g8Y+oceXFYa2eFmjVR0EdCl6ANfxzL9KzvpvQUjLexSqAL/7IVevI7v1KhEaMCZmvTK+l
	 0sp2uAKFlz2wyyWYgGZ3vVQKphK4AMiNQLQ2lAdD+4q1EjMQnRYmHTrP/37yT2IixEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkinACuk;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B5606A888
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48B5606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CkinACuk
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91c847584b8so5255756d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794885108; x=1795489908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3oEyXkT10pdH7P7mR2+WY3w5NVnu5TROP12ldyy9kHs=;
        b=CkinACuksaJtTkDpqUFv9vcV5g/yL9gClGFP+pQzi4I/aiNiVxkM9zLrBjZE1SQqOo
         UVWbNftox6mz9HF5fRLW9piEVzz4vsDeS+rXIJFb/4FbtH3pz8FE8gvmNP0j5Ue6Whko
         L1C3UQSOZocMl4+eRqgH74dFAhssAqTbkQug7ttn8nTZEg2qYfxGv8FWfYeFZBXtw8cc
         AX+GBM2IVXZdNGNG6wWdMOFpsdy+LGeWo+iK1AJsOqoKvNqLVLKldPzeamFXM7RfXvMs
         QcHnrFDy/PkPA0bzH2Gy1JNPeu21B7Fe62Q7U3vQkEmdxdlgm/leMac0pF7hlviS1nYL
         Ea+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885108; x=1795489908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oEyXkT10pdH7P7mR2+WY3w5NVnu5TROP12ldyy9kHs=;
        b=GburaIhKnXdmD0ZPxh2/Z+PMrlsBgzfEe8p6qtv7Ffopk+IqV0GM6BPtJ+8XYpTtpj
         iCMCo633GJ56NrHEUnXtRcfivFUCPJHrnjdxLBM0SP0ybr5AbCk+nuYpybbw+xl8ffcq
         chAWjup1Hk28atmL5GAGepsqLyUG1Elr/MwTGF7fQSk2kjz53ipga0FrniQ011GsFxun
         FoYzngsQw6/Owdx4049peAI84Y6klfGnRJ2EgNeLOfskG6tpMdeUea3Yv3Vf33iKunvg
         I+CdyT1Lyif+MpHyARd9UnwHNHVyBKs5rgLGQYxXsiOQ/5BXyWXJ/tCIAJpI75fGgz3K
         1AIg==
X-Forwarded-Encrypted: i=1; AL+hErFfwzfBniZ9i8AOoOOzXl5h6afrKynTDivSE6f7+93gzdC0FZvFsztvSFz3He0TQJoyd5mTYWC44VZz7p0=@vger.kernel.org
X-Gm-Message-State: APuU4Z84Omgbb1Mgjcdim0enK9yL/UzazBedaA3hqIGmRz90DzHwjWoj
	wQNonHGBrPqNitZXArJy7nEiQXTPTYPdqn8aZ8y5on23UnDrcsM9G7O5
X-Gm-Gg: AZFdTZe2UeZzAMGqrBbx33zNTYU8CW6z2bDNCq8BB/dK4aX3HPZPP+PWgaT+qb+xWMp
	b65KmVOXkqYeHQFxDey4oSzApJfXBFT/Hr38SNdr0tHtysCHvfx38IZXLaHvFAXA6Tw/tAGz/ge
	wLRczfTU1tgTIK5GVFKgUaRwDa+RNOClIuktvZt4CMO7dZ1GAYr2TDTgvydKq93x5vd+fG5IyGJ
	54/JfPMlhvJtNDN55BGo8BVIepwnbVAxH6C0NXMRIN2a38oXqIZm2u0z663rDpLhLVPyVdksNDi
	nMLeViYJiphONguMkXtEiZkF3WfrOB2TnBYUMI4moNk5pP2BaLzopNkME4es5mzlUyDFfJe8Gyv
	jDBBJSjKEtpIG3r1mxv6bcgbK6exyhoW0/e/g4d/QMGfkCtsxfjyUOg0x0JhvfUoVUjDNl0C5kr
	dYWsx258Ltmm6l7fF6x+xyllNLc0WtbzPLR+nDS39LYaIBBnIrO7irpH3WzZRfBlaCCICXGVfxq
	ITs4OIjMN8J/x/oAeIM31wPpjX97BbQhkdqI38URtzhvSRNirCJz70Dh4q0B+lYjWJ9vlF2RGzq
	seV1wjzxpblOjgeVn/f1BXqFr23N+WEDfW1Gvzp9U1c2buvpd4Q6DUaRue17QRcRt5eD1ZAJWxk
	=
X-Received: by 2002:a05:6214:dac:b0:920:f523:a79d with SMTP id 6a1803df08f44-920fcaedb93mr24717456d6.12.1794885107860;
        Mon, 16 Nov 2026 19:11:47 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5f3e4sm101713436d6.16.2026.11.16.19.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:11:47 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	Mark Bloch <mbloch@nvidia.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Parav Pandit <parav@nvidia.com>,
	Shay Drory <shayd@nvidia.com>,
	netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH net] net/mlx5: SF, remove probed SF devices when arming vhca events fails
Date: Mon, 16 Nov 2026 22:11:41 -0500
Message-ID: <20261117031141.1720619-1-lcy8047@gmail.com>
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
Content-Transfer-Encoding: 8bit

mlx5_sf_dev_table_create() queues work that probes the SFs which are
already active, and then arms the vhca state events. If arming fails,
the arm_err path stops and flushes that work and frees the table, but
the SF devices that the work already added stay on the auxiliary bus
and in table->devices. dev->priv.sf_dev_table is set to NULL, so
mlx5_sf_dev_table_destroy() returns early later and nothing removes
them, while they keep pointing at the parent mlx5_core_dev.

Remove them with mlx5_sf_dev_destroy_all() after the work is flushed,
as mlx5_sf_dev_table_destroy() does. Move the helper up so that it is
defined before the new caller.

Fixes: 4f57332d6a55 ("net/mlx5: SF: Fix probing active SFs during driver probe phase")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MLX5_CORE, MLX5_CORE_EN,
MLX5_ESWITCH, MLX5_SF and W=1.

 .../ethernet/mellanox/mlx5/core/sf/dev/dev.c  | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c b/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c
index e75cbf333898..44f6292ad59e 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/sf/dev/dev.c
@@ -328,6 +328,17 @@ int mlx5_sf_dev_notifier_init(struct mlx5_core_dev *dev)
 	return mlx5_vhca_event_notifier_register(dev, &dev->priv.sf_dev_nb);
 }
 
+static void mlx5_sf_dev_destroy_all(struct mlx5_sf_dev_table *table)
+{
+	struct mlx5_sf_dev *sf_dev;
+	unsigned long index;
+
+	xa_for_each(&table->devices, index, sf_dev) {
+		xa_erase(&table->devices, index);
+		mlx5_sf_dev_remove_aux(table->dev, sf_dev);
+	}
+}
+
 void mlx5_sf_dev_table_create(struct mlx5_core_dev *dev)
 {
 	struct mlx5_sf_dev_table *table;
@@ -360,6 +371,7 @@ void mlx5_sf_dev_table_create(struct mlx5_core_dev *dev)
 arm_err:
 	mlx5_sf_dev_destroy_active_works(table);
 	mlx5_vhca_event_work_queues_flush(dev);
+	mlx5_sf_dev_destroy_all(table);
 add_active_err:
 	kfree(table);
 	dev->priv.sf_dev_table = NULL;
@@ -367,17 +379,6 @@ void mlx5_sf_dev_table_create(struct mlx5_core_dev *dev)
 	mlx5_core_err(dev, "SF DEV table create err = %d\n", err);
 }
 
-static void mlx5_sf_dev_destroy_all(struct mlx5_sf_dev_table *table)
-{
-	struct mlx5_sf_dev *sf_dev;
-	unsigned long index;
-
-	xa_for_each(&table->devices, index, sf_dev) {
-		xa_erase(&table->devices, index);
-		mlx5_sf_dev_remove_aux(table->dev, sf_dev);
-	}
-}
-
 void mlx5_sf_dev_notifier_cleanup(struct mlx5_core_dev *dev)
 {
 	if (mlx5_core_is_sf(dev))

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


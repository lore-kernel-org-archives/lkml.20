Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.12.242.74
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654766;
	b=12Pf3vsx/5DXXsEpl8rfImkSgVjL/m/aWTtBcUqD7WJs/U8At/LC3nObb86qG3rY69Ja
	 EoYCgcEDZwoVKDvYPO5F7tyVfcVA2OurN9VVZEw/nBJLx1g2tq/wetKlGi1v2DpHDQrBV
	 o3vZ0zmQPugIMEFQ8XTDTDuH1dWB7idR2hiheJVYJH7ULNeepe98AihkKxCw8KDCDAhkH
	 F14BtbhnEIfb/prcVmSZDd00rRSDmx4l7i9hholcbZ5RdZjPTjeUDkDfL6VZdttpiYNpj
	 CyvKA7bqv5RIq+zZYnCMSBs56Lh0PKcd2MCd980oEII62GR2blNBspW8ue0C+gRfBBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654766;
	h=DMARC-Filter:Received:DKIM-Signature:X-ME-Helo:X-ME-Auth:X-ME-Date:
	 X-ME-IP:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jtRTlOwAW6qNluT+0hJWliZd5nsJOll/aiURD2BGJf8=;
	b=5WR98n07JiFYFvLQfcsZxnJNS2HXIYQ6wcmVx89gj4fY13cCYcGhfENmXBdtPflknCeb
	 FOJ8lBhV1dVpite+WSwTiLGEHUNHJfIoxYOsrpBdqHQCHdZD9zDFiXDQIpB8OBZ7vL/6K
	 MJqjIG4ZlzL82yC3zNt9TyHHu7rhUGvMaClU6Rhj3akbb2k29xjsPshuymQzRWHoCeBH4
	 z2FbqJWS3X8FjfIjlFPn9x7S4nAEEL6mCqJYGe6OJyG/My+w5z+wysZ/7Qd0L8ILzhs2R
	 46zFXKlXZfzEwjmGPVfSQ3J2QUn6rnsbnkJZkqSt6iGWRO5YVbF0Po8h8g7wAFac2sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wanadoo.fr;
	spf=pass smtp.mailfrom=wanadoo.fr;
	dkim=pass header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=I2QsGSha;
	arc=none smtp.remote-ip=80.12.242.74
Received: from smtp.smtpout.orange.fr (smtp-74.smtpout.orange.fr [80.12.242.74])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D907606A8AE
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 11:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D907606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.a=rsa-sha256 header.s=t20230301 header.b=I2QsGSha
Received: from 2a01cb1007850b0026fbaefb6cd2db0e.ipv6.abo.wanadoo.fr
 ([IPv6:2a01:cb10:785:b00:26fb:aefb:6cd2:db0e])
	by smtp.orange.fr with ESMTPSA
	id SBgQxWi1kXusXSBgQx6wwL; Sat, 14 Nov 2026 12:12:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1794654757;
	bh=jtRTlOwAW6qNluT+0hJWliZd5nsJOll/aiURD2BGJf8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=I2QsGSha4kfIsucYzbyWjniAnLLrINRobtIK8GtM+aGCddFpSyGQzBzldSqdlyqru
	 0DmXsgjQVi/T5UFekVkRfRHMdzVfagNxeVYvEl1FNLg27DcqfgVBcb5K3ysV+w40gO
	 tvqUyAwQFhKtiC21fSP4nqiil/oXldtgonrQW5a9ehw4h2IagZ2s5KWSrs31XytVDs
	 +8tFqHKd7cyC/ijF+jagV0PQlA9HyEvldQbEohcGHAmKahFL8Um9qr6rhjuksEEkc8
	 ry+aEF8uhalAmCJ/850TTkQ2pnbACwKoCdAswapSh/YRTT6R3UUcCoG9U/zHf4CouY
	 lZHApi0pBbvhQ==
X-ME-Helo: 2a01cb1007850b0026fbaefb6cd2db0e.ipv6.abo.wanadoo.fr
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 14 Nov 2026 12:12:37 +0100
X-ME-IP: 2a01:cb10:785:b00:26fb:aefb:6cd2:db0e
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matt Porter <mporter@kernel.crashing.org>,
	Alexandre Bounine <alex.bou9@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] rapidio: Constify struct rio_switch_ops
Date: Sat, 14 Nov 2026 12:12:24 +0100
Message-ID: <c98fdb4e3dddd0e45adbfb71cb41d1a64582708d.1794654717.git.christophe.jaillet@wanadoo.fr>
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
Content-Transfer-Encoding: 8bit

'struct rio_switch_ops' is not modified in these drivers.

Constifying these structures moves some data to a read-only section, so
increases overall security, especially when the structure holds some
function pointers.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   6365	   1512	      0	   7877	   1ec5	drivers/rapidio/switches/idtcps.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   6461	   1416	      0	   7877	   1ec5	drivers/rapidio/switches/idtcps.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only.
---
 drivers/rapidio/rio.c               | 6 +++---
 drivers/rapidio/switches/idt_gen2.c | 2 +-
 drivers/rapidio/switches/idt_gen3.c | 2 +-
 drivers/rapidio/switches/idtcps.c   | 2 +-
 include/linux/rio.h                 | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/rapidio/rio.c b/drivers/rapidio/rio.c
index f45e58b0971f..7df739276a45 100644
--- a/drivers/rapidio/rio.c
+++ b/drivers/rapidio/rio.c
@@ -1615,7 +1615,7 @@ int rio_route_add_entry(struct rio_dev *rdev,
 			u16 table, u16 route_destid, u8 route_port, int lock)
 {
 	int rc = -EINVAL;
-	struct rio_switch_ops *ops = rdev->rswitch->ops;
+	const struct rio_switch_ops *ops = rdev->rswitch->ops;
 
 	if (lock) {
 		rc = rio_lock_device(rdev->net->hport, rdev->destid,
@@ -1668,7 +1668,7 @@ int rio_route_get_entry(struct rio_dev *rdev, u16 table,
 			u16 route_destid, u8 *route_port, int lock)
 {
 	int rc = -EINVAL;
-	struct rio_switch_ops *ops = rdev->rswitch->ops;
+	const struct rio_switch_ops *ops = rdev->rswitch->ops;
 
 	if (lock) {
 		rc = rio_lock_device(rdev->net->hport, rdev->destid,
@@ -1716,7 +1716,7 @@ EXPORT_SYMBOL_GPL(rio_route_get_entry);
 int rio_route_clr_table(struct rio_dev *rdev, u16 table, int lock)
 {
 	int rc = -EINVAL;
-	struct rio_switch_ops *ops = rdev->rswitch->ops;
+	const struct rio_switch_ops *ops = rdev->rswitch->ops;
 
 	if (lock) {
 		rc = rio_lock_device(rdev->net->hport, rdev->destid,
diff --git a/drivers/rapidio/switches/idt_gen2.c b/drivers/rapidio/switches/idt_gen2.c
index 8a89bba17d39..b1b58a4a94bf 100644
--- a/drivers/rapidio/switches/idt_gen2.c
+++ b/drivers/rapidio/switches/idt_gen2.c
@@ -402,7 +402,7 @@ static int idtg2_sysfs(struct rio_dev *rdev, bool create)
 	return err;
 }
 
-static struct rio_switch_ops idtg2_switch_ops = {
+static const struct rio_switch_ops idtg2_switch_ops = {
 	.owner = THIS_MODULE,
 	.add_entry = idtg2_route_add_entry,
 	.get_entry = idtg2_route_get_entry,
diff --git a/drivers/rapidio/switches/idt_gen3.c b/drivers/rapidio/switches/idt_gen3.c
index d7537e62119e..25d9c710cb49 100644
--- a/drivers/rapidio/switches/idt_gen3.c
+++ b/drivers/rapidio/switches/idt_gen3.c
@@ -258,7 +258,7 @@ idtg3_em_handler(struct rio_dev *rdev, u8 pnum)
 	return 0;
 }
 
-static struct rio_switch_ops idtg3_switch_ops = {
+static const struct rio_switch_ops idtg3_switch_ops = {
 	.owner = THIS_MODULE,
 	.add_entry = idtg3_route_add_entry,
 	.get_entry = idtg3_route_get_entry,
diff --git a/drivers/rapidio/switches/idtcps.c b/drivers/rapidio/switches/idtcps.c
index c825728eb0ee..ee34b7cd41dc 100644
--- a/drivers/rapidio/switches/idtcps.c
+++ b/drivers/rapidio/switches/idtcps.c
@@ -115,7 +115,7 @@ idtcps_get_domain(struct rio_mport *mport, u16 destid, u8 hopcount,
 	return 0;
 }
 
-static struct rio_switch_ops idtcps_switch_ops = {
+static const struct rio_switch_ops idtcps_switch_ops = {
 	.owner = THIS_MODULE,
 	.add_entry = idtcps_route_add_entry,
 	.get_entry = idtcps_route_get_entry,
diff --git a/include/linux/rio.h b/include/linux/rio.h
index f42379775ce8..b7c10f3ef275 100644
--- a/include/linux/rio.h
+++ b/include/linux/rio.h
@@ -98,7 +98,7 @@ struct rio_switch {
 	struct list_head node;
 	u8 *route_table;
 	u32 port_ok;
-	struct rio_switch_ops *ops;
+	const struct rio_switch_ops *ops;
 	spinlock_t lock;
 	struct rio_dev *nextdev[];
 };
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794172443;
	b=myZaiGV2cNwTO9c6wa9+0plkEXb2t0xyNi9YEEOvxM3Jaf/1ujNb548WM7z7E6mF/kW/
	 tJ/lYrOEH65Yq55OJXOJR2rdtQL6AwNhB3odW5QOm9whCtOqV7nUGXlSusu49uG0OuCVc
	 rUwhPQs6kKM6A7QlPb8EigQ6zmf8lWx2/rT9dKilFcfdsFOgE6/Up4Vfvvlc9vvff0P6s
	 TSmbkwJqUz99dJhKKQUsZx4MEYutRRLmEtjdPCGSuBbLbt9CYMouEiapj7Wy3Pz2PlXxf
	 rH2f0M0MaQZUJ3YtyRVSeqCTdifOuWobrf3QjxQC3oCisGcMXco6ATrreHbddvH/o4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794172443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=1IOJVSSDS5Dlq9Y83GcHcwnK7PFbC7wYL08Prr18Rj0=;
	b=CWhmRbfDBa31pgGw7hIGHCUUdT92YksKMCeYnSogoEBbNoC//XLytJ71N6XDIhGVPanf
	 2V1/cu0uVdsJPigFIS0NB0QknTod5X+3tHAp1Hw/3E4KpVjHW8KLn3DOlMDyOuTCMWAJ9
	 I8PIZ54eLECrNBoj4IOr5ubkAdGgdNFVpq0rL8ZSixlGYl3eO4NRciA8lPrghQy9CGs4i
	 elCPRcz9Qpq7QHUdKJD9SUIwGZhHNduOZb+tuLb7Y+7mTLFJyx7MbxzFb5opivaAFnxiR
	 jwp/bzNoa/aBRlB35vcehngx6jt7DxQ4uu2MIBxVJ3tWKilYH44lyQChytUzqqLaG3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sws0mbzx;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6009606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6009606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sws0mbzx
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-854e904005cso238204a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172441; x=1794777241; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1IOJVSSDS5Dlq9Y83GcHcwnK7PFbC7wYL08Prr18Rj0=;
        b=sws0mbzxq18qq8KTEKd5psOUpZ5iLiJVxKQsxSk1F00+Wih53dghU6mDUqf1oPoscb
         UJioF3S+flBhC8RlzyY34zgNNB74Bdy+u94IYchw81TBl2h5b+8TbbENqIcSO6Yr9nd0
         LMs4WHzxIoQsXlz5DtosbkMVmQY+b+MUpJvWcW8PJkDLgiKnwq34w4CK28QTSCKE7v9y
         MoBN7m9gAtlLl2jwgp9gTFagdZDK+hdN76eWbJCsFLSJruTNeU9rkg3s38+N6bC4kJzU
         nxn373WylbrpjK79VZ59uQJIIjxeDZFcf4iycofquhRcsw0sG40wG0k0VR2PUPUTAztz
         FAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172441; x=1794777241;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1IOJVSSDS5Dlq9Y83GcHcwnK7PFbC7wYL08Prr18Rj0=;
        b=YhnTMHjHVbY3sBJfl37JTwKsVn7i3DhQI0IsKJXcWNxTV8qpa/W8AgzbNBHw8utqcl
         lZABLs4VFah3fp7q3n/Zb8b+PYek6t26ntGu6cdpiJ/MH0vLokpYV1cApH6HArft7r45
         CTL4Llpv5C+9Yu1k8AY9p4AF7LmgzurjXGsoRWR4tlYIb3cZIRLv7+oatl0I9SaVjwZz
         yz2al3WuIHvyPcSqFEFFnfVrjsgExrzR8hXtRL7dv/RI4meQbZy6HIMk/8vJgI9bYe+O
         iNx99A/I6UFEd8zT0mM+UvdH2zM4hQsEmvSLxakxK/tST3fT0ttsTHoVmwe72IHPK1sY
         vzGg==
X-Forwarded-Encrypted: i=1; AL+hErHrvW2iYIUWfJEch09tXQPXF4QpJMuO0EoxQtp3q2l9O7QpJ0idyTfikFkvtH6JKzLcVdGJJaBXPP6Uoxs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IXbueHhz8KTwdzptAOhcaYZ5G8Hd3XnqUsD/EeQCAMro2XeTf
	YoPu5oIB8oQa0igvmQp0SjpAxg2v9mhtUb8mTCV+qcSe2EUTuZcT7F/3
X-Gm-Gg: AYBFou3NM2XFgHH0QZ659Y0C5DOWtA0MGUynIJ7f+VCbDk44WD/Y4+48KZSXEh69Xuc
	O4+jsuEEUlS0IpIj81wADYRz1Z2fJZgAdEa8CFHZN41PvhVsPKNbLhkj/hW6Ir91ayAsDMBbzsW
	8M6EcthHw0ehjggPujfe7raKY6cP8WYTdx8Is6sL2bRJ6PFTWC453mg7DE06XtZcsuuPJYn80MD
	Xo4oKDqtBf3jOJy0JbGblYPlq6wVtKiWnsRrUFQA5grqVzbI3DnckkI+YR/H3THBoFGU5bcSSu2
	BLFIcsuBMv67guCSnGVZPp786PBroLd9bG3HTZcHgbH9bQbs+NolsIIM0H72kcNaNDeJbaAfSoe
	7Yv/hWgVZ3VjKLSHY2Fm7OFz6BNrb828w2QnSeHk2Hwc0RovjugjokdJy7whaxzpoRxV8HGJKxo
	7Ya3SaU6XtL3++KCgm3o1CHGgwNvbNnJidL5XYDwDJjktoLVUGqfe6Tnu+PA8Dyvr9TOVhsAKNG
	7Z4FLEj/o1Efl8rG2EHEByDgpTegGOWTqD9PNYE4R5r7c+FCEH6kipqhzbGkzb499H7Bx9Tfpjd
	uCwGYMjseoNiwxNwuhco7KKxwcapiKegMD2Izbcx6m8LHo11e/BFCBFCD3eqKJPUbN4ufxR7VBy
	ovR+g4MERl6JB2NLTosW0Vr0I3PEK3VfnLIqy80arr4fw7qKYp3bDLV/NccGsoQxiqkPTc+ASqJ
	snohKNVLihS3WBJeorzchNJxb8fEbdB4dAnAyk817nqWXXobnyHV61
X-Received: by 2002:a05:6808:64cc:b0:568:2782:d1b4 with SMTP id 5614622812f47-5682782d3d2mr217683b6e.32.1794172441608;
        Sun, 08 Nov 2026 13:14:01 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813e54ff0sm2736089b6e.16.2026.11.08.13.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:14:00 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:13:59 -0700
Subject: [PATCH] mtd: serialize dynamic partition registration with removal
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261108-submit-mtd-partition-publication-v1-v1-1-cbff20b1351e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN3QrCMAxGX2Xk2uBaRnW+injRn+giro62G8LYu
 5tuF4Gcj3wnK2RKTBluzQqJFs78jQLq1IAfbHwRchAG3WqjVHvFPLuRC44l4GRT4SIFnGb3YW/
 3fVHYGd076rtwIQNimhI9+bd/uT8OFs2bfKnqeuFsJnTJRj/USOznOkdr2/5x6dpQpwAAAA==
X-Change-ID: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

mtd_add_partition() drops partitions_lock after linking the new child
but before registering its MTD device and adding the partition sysfs
attributes. Concurrent removal can unlink that child before it has been
registered, or release it after registration but before the attributes
are added. It can also finish deleting partitions before a new child
is linked, leaving a partition published after master removal.

Keep partitions_lock held across allocation, publication and attribute
creation. Record that master unregistration has started under the same
lock and reject new dynamic partitions from that point. Check before
allocation, which can scan the parent's bad-block markers, so it cannot
start hardware access after removal has passed this synchronization point.

Initialize the state when registering the master, allowing drivers that
reuse their MTD object to register it again.

Fixes: 5daa7b21496a ("mtd: prepare partition add and del functions for ioctl requests")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c   |  5 +++++
 drivers/mtd/mtdpart.c   | 20 +++++++++++++-------
 include/linux/mtd/mtd.h |  2 ++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..7a5205810bf0 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -918,6 +918,7 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	INIT_LIST_HEAD(&mtd->partitions);
 	mutex_init(&mtd->master.partitions_lock);
 	mutex_init(&mtd->master.chrdev_lock);
+	mtd->master.unregistering = false;
 }
 
 static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
@@ -1206,6 +1207,10 @@ int mtd_device_unregister(struct mtd_info *master)
 {
 	int err;
 
+	mutex_lock(&master->master.partitions_lock);
+	master->master.unregistering = true;
+	mutex_unlock(&master->master.partitions_lock);
+
 	if (master->_reboot) {
 		unregister_reboot_notifier(&master->reboot_notifier);
 		memset(&master->reboot_notifier, 0, sizeof(master->reboot_notifier));
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index ddded0dbe77e..c316cfe92c7e 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -278,28 +278,34 @@ int mtd_add_partition(struct mtd_info *parent, const char *name,
 	part.size = length;
 	part.offset = offset;
 
+	mutex_lock(&master->master.partitions_lock);
+	if (master->master.unregistering) {
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
 	child = allocate_partition(parent, &part, -1, offset);
-	if (IS_ERR(child))
-		return PTR_ERR(child);
+	if (IS_ERR(child)) {
+		ret = PTR_ERR(child);
+		goto err_unlock;
+	}
 
-	mutex_lock(&master->master.partitions_lock);
 	list_add_tail(&child->part.node, &parent->partitions);
-	mutex_unlock(&master->master.partitions_lock);
 
 	ret = add_mtd_device(child);
 	if (ret)
 		goto err_remove_part;
 
 	mtd_add_partition_attrs(child);
+	mutex_unlock(&master->master.partitions_lock);
 
 	return 0;
 
 err_remove_part:
-	mutex_lock(&master->master.partitions_lock);
 	list_del(&child->part.node);
-	mutex_unlock(&master->master.partitions_lock);
-
 	free_partition(child);
+err_unlock:
+	mutex_unlock(&master->master.partitions_lock);
 
 	return ret;
 }
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index 8d10d9d2e830..cd7b4671c456 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -224,6 +224,7 @@ struct mtd_part {
  *		     not only the master partition list, but also all
  *		     sub-partitions.
  * @suspended: set to 1 when the device is suspended, 0 otherwise
+ * @unregistering: removal has started; protected by partitions_lock
  *
  * This struct is embedded in mtd_info and contains master-specific
  * properties/fields. The master is the root MTD device from the MTD partition
@@ -233,6 +234,7 @@ struct mtd_master {
 	struct mutex partitions_lock;
 	struct mutex chrdev_lock;
 	unsigned int suspended : 1;
+	bool unregistering;
 };
 
 struct mtd_info {

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-partition-publication-v1-4629be94d7e6

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


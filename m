Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117086;
	b=yKrGScfcuuRSBbst4ZXqx3pBcYu9/BRsv7ZLYR4UqqzEu+KazajQp6f778FMypJkx2CG
	 wyIoJ5y7eXFLcqRnorPPRCyBU/ukGFIBOuDvrMCvDrk33/gJX8WXZcnocauN0dBaj0pjp
	 tpxvJcEsAjblJJxuMx8lVEFu6NG4QvsihZVjBwFVCZUpVH/lGCCZAbGfCyY16ajW+4Vn5
	 ZH/KTAG+SiG/vTOIOwS18Gxmtny7nrV2Lq0WZd5rxND24fudnAIK7D/J8T0OOyisuC6nk
	 qnTwg9UWW95G0/k3Gt7Q2Vc9o1lvix44M0oVQYRimVo2cfFOcLWKh0XpaXLvmMlR4MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117086;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=zvdPtrzOhEoZtZ20x+hCZPQL4ToFRG63X3e77kkQJLU=;
	b=YPZUH3rCc2jLTYsuC5M6z+R7hdY6/eI8yY9MFS/OVCRsJBnGybbd3hPTPIDd1blVKhMJ
	 D6GPuQYubIDGP/4tIWH3k1Z097k90xTMAsre6UDzcGe9hxCvO38JJuvf6mYIb3+l4uwOv
	 2bQRwe+IB2/Dxvji6A4eyMIa3M4AzVvfX3FHLzMQwC15wkwg4hTs9JDoRGc6rawy8vBgm
	 NaJp8abiCJZwhh2Mlm/421cizae7tLGYtjOLnePthikjHqTQ/hxNhXoBPe6MemRVdsXTB
	 YhhECMmHH+SjpxNiTxv+K9WkMTt154EF1vZFlMkpR3fgqxo45hTlHjvSkGsOgTEgEXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1EDtZSbL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD8606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1EDtZSbL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9521F01825;
	Tue, 27 Oct 2026 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117086;
	bh=zvdPtrzOhEoZtZ20x+hCZPQL4ToFRG63X3e77kkQJLU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=1EDtZSbLgDYVI1hv1yek9QWWBOvf84fe7u3Fa0F9XLyLcvXBu+PPKfjNoO1JG9FhA
	 CyIdAy3Roflcs32frK8AwpRxwf/Z0dbIJW0ZA5su5pRUO9NDY7c0JDU4RTToFIGvFl
	 /juCpZB2FOuuUvFOakl75kf1bKz8jSlAX1BcXas0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 17:04:34 +0100
Subject: [PATCH 1/9] w1: use the bus mutex for the "rw" file
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
Message-Id: <20261027-llm-char-misc-w1-v1-1-d2e6bfafb6a4@linuxfoundation.org>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
In-Reply-To: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=2605;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=3oqoC7q7s1X4bknN74me4Z778nQ8QaDnXKhvG4nHWjw=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTs9wUqv//noL3zpeJfc5sz9++b8suecVr7PezWrt4
 DTmyTc/dcSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBE1M8wzLOt0jv3lWeu/r+a
 LX8K1crc7XTXyjDMz1d72/k8TSRp6V+LgzPPTgudetTtCQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

Commit b02f8bede217 ("W1: split master mutex to avoid deadlocks.") gave
the bus a mutex of its own, because the lock which protects the list of
slaves is held while a slave is removed, which waits for the sysfs
callbacks of the slave, so these must not take it.  It converted all the
slave drivers, but not the "rw" file of the default family in w1.c,
which still takes the mutex of the master to talk on the bus.  That has
two consequences:

- A deadlock.  w1_process() holds the mutex of the master while it
  searches the bus and detaches the slaves which have gone:

    w1_process()                        read() of .../rw
      mutex_lock(&dev->mutex)             kernfs active reference
      w1_search_process()                 rw_read()
        w1_slave_detach()                   mutex_lock(&master->mutex)
          w1_unref_slave()                    waits
            device_unregister()
              waits for the reference

  The file is readable for everybody.

- The accesses through this file are not serialised with those of the
  slave drivers, which take bus_mutex, so that two transactions can get
  mixed up on the wire.

Take bus_mutex here as well.  It also excludes the search, which takes it
for every pass.

Fixes: b02f8bede217 ("W1: split master mutex to avoid deadlocks.")
Cc: stable <stable@kernel.org>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/w1/w1.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index c16946642789..fe7b73d2a553 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -116,7 +116,7 @@ static ssize_t rw_write(struct file *filp, struct kobject *kobj,
 {
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 	if (w1_reset_select_slave(sl)) {
 		count = 0;
 		goto out_up;
@@ -125,7 +125,7 @@ static ssize_t rw_write(struct file *filp, struct kobject *kobj,
 	w1_write_block(sl->master, buf, count);
 
 out_up:
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 	return count;
 }
 
@@ -135,9 +135,9 @@ static ssize_t rw_read(struct file *filp, struct kobject *kobj,
 {
 	struct w1_slave *sl = kobj_to_w1_slave(kobj);
 
-	mutex_lock(&sl->master->mutex);
+	mutex_lock(&sl->master->bus_mutex);
 	w1_read_block(sl->master, buf, count);
-	mutex_unlock(&sl->master->mutex);
+	mutex_unlock(&sl->master->bus_mutex);
 	return count;
 }
 

-- 
2.56.0


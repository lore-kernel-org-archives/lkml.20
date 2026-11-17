Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794933581;
	b=lOif66oSKWh7T9TI0yTCJRihTy3tkLoIVZLaYtBPNuXqxs+2jSakF5grKZJFFvXH/78y
	 KiYT/e/kec9u06OKQL0wIDLt2xeu2KI0hAGPiCG2I5WfPMO24UBT1sa7maPyvZxSK1mqp
	 IQJWUFF6omwhcrYUrwptu3ew8A44t+46UlE6Rx9VmtTLsPWO2n3b57uNWmRQGJ77bJ0Uk
	 pk/WTgblq/kJvuOLPHedncZCKHSNA96rMowLRPrLIFgMO4H+xlGH75fVuCZczm94vGcai
	 zWEFznOGUt6p9syzwHBvlPjgf0gp1ilAqLKO+f57OacMi3aEftEK0iHdX50q/VW0slA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794933581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
	b=407vN2RFobWB132rwvF7B32wvxZaCSWQEuCW9blIRAZnw1RdvrCJksSpGVB3NjXORICt
	 f9A3HZ1vjJ5dk3HMO0rrfCYMlqrtkgias+Yj4vU0j3AcjLyHovw2y/51ZfLVWQT/pazRA
	 cpYOVw0gkBWuuaSWST+tN8VQ02FqDpEMsmrkdR18bg4fRz91AsuNZHJdhUuwZn/W7sqJs
	 cNhCAjx84ukAmeU+c2wKvvAZPmHu60QC6zxxfcQ5vhX/G3s3kQttekEjbDuqruoSrfWkZ
	 qIKY9N2kFNK58KCQnJaebb1Q8SFVMTE+jhvGBUbJlzlg4Q1EjZqkq5RE2QiaWHwCTGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPC3v+hM;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103FF606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 103FF606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EPC3v+hM
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso639915e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:39:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794933579; x=1795538379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
        b=EPC3v+hMuSeFY9c3SPhNQuYOUnoCttiB0zd3Xssj9gtLLdhTAO0HRwOMyHyqMnYdVC
         kDt7Pjr1BrVlhk1M9Qhw4n0NUIjNBcOvAPSoKmq7qXYDFEiiB4UfUPA7ImaKDAWuJ0AZ
         9kI2NHlgFDEaEBpuXywzndeUF+SpFaxy+iBn9Gnbplporap80/3C10MVn8OCEvBnRjMv
         FqVigchHmEy55OJow3rgtGp8a8H02nvIpFIDSC2GSz1sRGAOWuDB9U9o8++rjvLdMQEG
         har7bqbEeN8TtmaUVZyEByRXGd6VSjRxJIyLQHSGuYhG2mRU4begVjT1bDt9dMCpNelY
         dW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794933579; x=1795538379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMc4CFcXOWr3ZfmZEHkTdrVLJyWhK9ZAZAwwufof5Hc=;
        b=H2T8LMjSniBBLpuY9dx25jgvDvhRdDsB4+QhmEArKIUHMWco2YbqDLBPAOeApmXzTn
         Y7BpDvFwFWCpzmGEL9/wC0EThxQ707RM99zd86BeRaF03uq8B0z6IXqyW//ArXZUeya4
         RFS9GpRGlNrvZ1C8/8LOXynR7DOMlGKb7tspbD9FmJH+YbY1ZRUMxQJ/nbr55kpk1val
         92UlZ643jc0ZuboT5fvCAB5iSOsoouujA9eNMqC4CAyd6JQJ0MhurZjAP5y8raslSFdP
         C5s+wLjtp2NRkWMCFaxUBiFKih8sOXL84uFOC3PZnT5Tw08AsR/pdo30ORQMLOwKtZca
         Y/TQ==
X-Forwarded-Encrypted: i=1; AL+hErEml/JGjYnEXPQUwfbxRnh7CG/1h/Ahva/L7JBvlnOYDm70Lfmc7aWPBIs9Yrsw/O2z27eHQhptVNp4RXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9qQ7uym9uFsWLAeP0+6MdWlbnaH3jDtsVrGPIbN18/T2z65EVc
	lZHTqhT45aTlV5YmHrXOEvpRGRgBK6GWgvz/nil6BTOdoHhk5dBCpze1
X-Gm-Gg: AYBFou3uay+zFvu9FpBoCt2vzVg1jOrbH7J1sKt4Ok4XnMJerUtWlY0TjXKRT8VkJw2
	Xt7hpQzDwqGBfAn9ee0LemgKJFikpfG6irGzwP4wXv5DyViGXONqwEfeMattDRtr89dsO5UpFsc
	7FyxjTsbI7i0oVbde/Cg9CoCe/SvLCrSmiL0Qt0tpdtTKImaDaTkeuVvvmfb4OMON+jnoH7aKqO
	ZJJfK/0RLhlM/WZAgXLZsMcAtXzoNkrf4RgSbbXLCNhP6OC9IBhe89HhgS/bxJaYYZ33pHpFlnA
	kJASRFiPdYt6oz4mo4BmgQWq4g6bu0V7HpnbQZt2YUSHz29AzJHQisiLtkknmLlOA5wCHsG0F+A
	aqyVbc4hUi6s/PDOQvV8o4rnn1E9I5CD3s3gPZsYUfB92W8ysgjFTDj64LAjvN4TxYF2hqu2rEK
	ZrIOTau+5HoBIyWtr8/CkXg2IDZFzzCdVPlRovV+PK9Mg+O2izqkr1494kU+0yI5IO9HW1JumqA
	UM3/1wAEH52D2PCtSSrfp7Lei3OUHt6oKRE83FVorNQh7hYlk4rP9BkQmyaEX/VsdoNxi+nEU/J
	IfOB5nJuE9iGK1jVW39ZPXtVhRG3dc06qhOesrUIrMtL2SRQO1z6Vq9R8wJkRIvVVx0x9yrTqXn
	Nwjqd/nstI2ZBVgS4YooB7ngJ39L6R6+N4Y6mxpxuEDA7zNQ=
X-Received: by 2002:a05:600c:470d:b0:4bb:6b59:aac3 with SMTP id 5b1f17b1804b1-4bb6b59adeamr179333065e9.29.1794933579138;
        Tue, 17 Nov 2026 08:39:39 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783e9288sm80817565e9.15.2026.11.17.08.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:39:38 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Subject: [PATCH RESEND] usb: octeon-hcd: fix the kernel-doc of struct octeon_hcd
Date: Tue, 17 Nov 2026 16:39:37 +0000
Message-ID: <20261117163937.3727045-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The struct octeon_hcd comment opens with /** but names its members
without the @ prefix, so kernel-doc sees none of them and warns about
every member. aebbc7d63407 added sof_timer without a line at all,
which the robot reports as a new W=1 warning.

Prefix the members with @, drop "pipe", which is no longer a member,
and describe the three that were missing: periodic, nonperiodic and
sof_timer. scripts/kernel-doc -Wall reports nothing for octeon_hcd
afterwards.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610151637.5srThc2q-lkp@intel.com/
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
RESEND: no change but the Assisted-by tag, now dropped (an LLM helped
write this patch). The warning is still there in v7.4-rc1, and this
applies to it unchanged.
v1: https://lore.kernel.org/all/20261015194043.1597422-1-orgads@gmail.com/

 drivers/usb/host/octeon-hcd.c | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 4929c6a..d6ba52b 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -348,20 +348,23 @@ struct cvmx_usb_tx_fifo {
 /**
  * struct octeon_hcd - the state of the USB block
  *
- * lock:		   Serialization lock.
- * init_flags:		   Flags passed to initialize.
- * index:		   Which USB block this is for.
- * idle_hardware_channels: Bit set for every idle hardware channel.
- * usbcx_hprt:		   Stored port status so we don't need to read a CSR to
- *			   determine splits.
- * pipe_for_channel:	   Map channels to pipes.
- * pipe:		   Storage for pipes.
- * indent:		   Used by debug output to indent functions.
- * port_status:		   Last port status used for change notification.
- * idle_pipes:		   List of open pipes that have no transactions.
- * active_pipes:	   Active pipes indexed by transfer type.
- * frame_number:	   Increments every SOF interrupt for time keeping.
- * active_split:	   Points to the current active split, or NULL.
+ * @lock:		Serialization lock.
+ * @init_flags:		Flags passed to initialize.
+ * @index:		Which USB block this is for.
+ * @idle_hardware_channels: Bit set for every idle hardware channel.
+ * @usbcx_hprt:		Stored port status so we don't need to read a CSR to
+ *			determine splits.
+ * @pipe_for_channel:	Map channels to pipes.
+ * @indent:		Used by debug output to indent functions.
+ * @port_status:	Last port status used for change notification.
+ * @idle_pipes:		List of open pipes that have no transactions.
+ * @active_pipes:	Active pipes indexed by transfer type.
+ * @frame_number:	Increments every SOF interrupt for time keeping.
+ * @active_split:	Points to the current active split, or NULL.
+ * @periodic:		Pending TX FIFO writes for periodic channels.
+ * @nonperiodic:	Pending TX FIFO writes for non-periodic channels.
+ * @sof_timer:		Polls the block when the next periodic transfer is
+ *			due, so SOF interrupts can stay off until then.
  */
 struct octeon_hcd {
 	spinlock_t lock; /* serialization lock */
-- 
2.53.0


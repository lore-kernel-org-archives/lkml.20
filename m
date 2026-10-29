Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279569;
	b=Z9JXAkkqJ6tanXW01jDtt/0HMV8YhFVG46fEiC0xaxCUaASSSZJmnGZeJARc7lBkGk19
	 I9+sYUpUZa2nVmJ8/R4Zqhd3Zptu3GnDR1gPIrwul5VY/HpKHuZinjJ5LwM9sXOWC/Ros
	 GT5yeRixd/d3vnV258gclFe0XmixvFNUP+I2UkH4rcGuz5AU9JH1d9m5g+C6fP3ClE2QP
	 ot9KBJTDYK6HrSPTXYqCZt0jPeMREjstEygHIrfy2CxofhJqxor54kcApy8djTzhTkmNT
	 ypGdNbvB7Xud3pKhMBmAkEfnQj4l32piUr4NSBlzjwqpel5q3l9Ul/ceEa6MEH81gAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dW7mIyMkq2asBpP5S7UKXtUT07y/mskuV1rwXfdiNNs=;
	b=dHM7enWFjelIKIhTMmYxcNoXz361FyFZoTI36SDqr9Q2gRAxhYrcRBvpZKh44PShH40s
	 E79KomyVZRu+dqExUSlZ08Fd5H8+ZEQ4vQABH8f7FMV1TvRar9q7I3fjhSlBaPLP9OpgT
	 kFkVYbeE9ziSZrGdZfUKn33MqVBnTUTibSjSRNEnFdgAVSaR/NBwiIFGDFhQNB1N/7xwX
	 UySAVWJhbWzLGbhRsq9UsNbhK/yogkMlo1QQB85/6SuhCBc9i4FEK7I9v4kSYlvwVXs4s
	 XwG9Vw9xCgZ85+N72zSKdmsQOuqWArvpXvb+YYufdyMBGjZrKIhMZQ4r26KXnRikgNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hou5Y8HZ;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79B8606A331
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:12:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A79B8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hou5Y8HZ
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1675994a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279568; x=1793884368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dW7mIyMkq2asBpP5S7UKXtUT07y/mskuV1rwXfdiNNs=;
        b=hou5Y8HZiIpsVoat9dlkWEjZ741+uXYid79WDqAnMQllApTwxuy/+tvUwv3qQ5/muv
         iqLP59PUpgVQHs0+zZiXz+5mt+uRReZ0FJQUlp06TALkCcXMd/ckMiO8suY+pxwbxTUw
         0THmukcgsGS7k4FBQHQxMpzwXwoPzdsMpML7fobxEpBe8508w+Aiovvpg0odM36l3aX7
         bAXf/aQmC/nfqHil9FYwBtEUCGZDKKA6JBVnAn1y7MD5VBO29X9wiPZnAHcu0vTsjmGK
         f7pAbmFNR+T10xmEhtN6ViJcMF7g7A+WMDsRAzJJPs5gnagYMegt7FjLuIm1uDqbvuKQ
         Jt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279568; x=1793884368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dW7mIyMkq2asBpP5S7UKXtUT07y/mskuV1rwXfdiNNs=;
        b=xIzSnzZoOlWxMLm0NOm39+PNoEA42iVd+6iVXrA14srkfmOvyiX8ocHRhTArlPs26e
         1xYjfQILErtJ4rIScmRekVeCjGKYfvw25kC1sEnWV2b6uVpavJMMYTwSUIKhjen7mZkA
         zd5z0r1TjvLCbrNHJlXOYq9DTcId/TOi8uQzWd70jXZxn7SLiuQwoHMn8eS+H/hzkIkx
         Z+7ALYDu5E5wDieziwtvdYot0fgasbDf/1VYoeAQjghFSfy0P2uKMJWNUJp2gEKB5hWe
         z/0DvdqaZ743YPtY61fR4VtDhU2JYRtgPoJ76QJoY21Lf3Uiauw8jIpMkgT68TR9IkmF
         UTzg==
X-Forwarded-Encrypted: i=1; AKwUvByaR5YjrAfeG3RQkGt70WvEByJKTrhNXU1q2RF7gB2N45uIe+/832t5Hc1ha5GsBoyAx/ym355oOSF1Mks=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfR9PUr2MhyZwmWdhgTHWyn2SqVNr22OsZiWQPigvV1KVb8fsE
	jCQFp6e35KQMgiNTyIaaiCKIWV/dhqbQlRQCGgutMsfvHkTMK5NOB50V
X-Gm-Gg: AYBFou0JfEcoI/+ibWjMXh1k7mTepAF5SR8V1JqSp5VtCGNSDAkTbyFIaH8w1dRxx5S
	RXFKZZfl3NNZaOJmB9SC/a9HWVIi1tIX7C+g99zD4f66JEqBdXhXCqM//XSYy9zLnbQYYOROMVA
	OdLPJKvvYmEyt9M7QEfaFjq4RYpg9JFTKKqePBX5DHAvoza3hboOWg6SZLlPPNzipt8K4BrhPUO
	eRQywt5RXOodMf9WdaeKz9S+2BwDyCJPYfEi0cmdcGneMfJkTvqRMaiJ1bKsQQautyLTo8kpdFw
	S52vNLTKCCLi4vPQE/A5xkIMBJpNuTP3/KtOkFmv4ohu8ude7RxdIDANKj1R8okMwzrLm1yAkrt
	qrnCPLpHp3exnIucfwnvaIWLe8Lov0FEwLYWk4eB5GspO8mheODJVG69QShyTrwb10HIPhCMwy6
	7bb+iKEJSXkQYng1/odvYplFIEq3DrWMvPZIqN6jcyS3OC940iBUXZDqIHhy5Og8PK+gEb17c+x
	5Fjt60FzUM3h07hiYeLqxlB3LQIszOsufElsRVMTQ/E7sMR5rgjTqkpRwXMPUahGmoGtK1P+p9q
	szW6P9MKbCUzF5Kg7sZyQsyT
X-Received: by 2002:a17:90b:4ec8:b0:3ac:7f4c:a68c with SMTP id 98e67ed59e1d1-3ae582c3052mr4989317a91.49.1793279567913;
        Thu, 29 Oct 2026 06:12:47 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae55d555d4sm4090445a91.1.2026.10.29.06.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:12:47 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH 3/4] Bluetooth: SMP: Protect LTK encryption with RCU
Date: Thu, 29 Oct 2026 21:12:28 +0800
Message-Id: <pm-bluetooth-objects-candidate-0122-v8-952ad9eb0ef59367ba6a-3@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <pm-bluetooth-objects-candidate-0122-v8-952ad9eb0ef59367ba6a-0@gmail.com>
References: <pm-bluetooth-objects-candidate-0122-v8-952ad9eb0ef59367ba6a-0@gmail.com>
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

smp_ltk_encrypt() checks the security level of the LTK returned by
hci_find_ltk() and then starts encryption with its EDIV, Rand, value
and key size. The finder ends its RCU read-side section before
returning the borrowed entry, and neither caller holds hdev->lock: the
SMP Security Request handler runs from the receive path, and
setsockopt(BT_SECURITY) reaches smp_conn_security() with only the
socket and channel locks held.

MGMT_OP_LOAD_LONG_TERM_KEYS can therefore free the LTK in between:

  Socket security request          Management / RCU reclamation
  smp_ltk_encrypt()
    key = hci_find_ltk()
                                   load_long_term_keys()
                                     hci_dev_lock(hdev)
                                     hci_smp_ltks_clear(hdev)
                                       list_del_rcu(), kfree_rcu()
                                     hci_dev_unlock(hdev)
                                   grace period ends, key is freed
    smp_ltk_sec_level(key)
    hci_le_start_enc(hcon, key->ediv, key->rand, key->val, ...)

Keep an RCU read-side section across the lookup and every use of the
key. hci_le_start_enc() copies the key into the command and queues it
with a GFP_ATOMIC allocation, so the whole sequence can stay inside the
section.

KFENCE reported this on a test kernel where the socket thread was
paused after the lookup until the RCU callback had freed the key.

KFENCE report as below:

    ==================================================================
    BUG: KFENCE: use-after-free read in smp_ltk_encrypt.isra.0+0xf3/0x370

    Use-after-free read at 0x00000000c45332eb (in kfence-#128):
     smp_ltk_encrypt.isra.0+0xf3/0x370
     smp_conn_security+0x489/0x9d0
     l2cap_sock_setsockopt+0x1bbe/0x2300
     do_sock_setsockopt+0x1fb/0x430
     __sys_setsockopt+0x106/0x180
     __x64_sys_setsockopt+0xc2/0x160
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    kfence-#128: 0x00000000d45af9b0-0x0000000053c1365e, size=72, cache=kmalloc-96

    allocated by task 533 on cpu 0 at 50.484258s (0.449177s ago):
     hci_add_ltk+0x1f5/0x3a0
     load_long_term_keys+0x6ea/0x930
     hci_sock_sendmsg+0x128b/0x22e0
     sock_write_iter+0x4c0/0x550
     vfs_write+0x637/0x1010
     ksys_write+0x1b7/0x200
     do_syscall_64+0x115/0x6a0
     entry_SYSCALL_64_after_hwframe+0x77/0x7f

    freed by task 0 on cpu 0 at 50.846944s (0.093664s ago):
     __rcu_free_sheaf_prepare+0x261/0x2a0
     rcu_free_sheaf_nobarn+0x1d/0x50
     rcu_core+0x661/0x1d10
     handle_softirqs+0x201/0x930
     __irq_exit_rcu+0x110/0x1e0
     irq_exit_rcu+0xe/0x20
     sysvec_apic_timer_interrupt+0x6c/0x80
     asm_sysvec_apic_timer_interrupt+0x1a/0x20
     pv_native_safe_halt+0xf/0x20
     default_idle+0x9/0x10
     default_idle_call+0x6c/0xb0
     do_idle+0x3a7/0x650
     cpu_startup_entry+0x54/0x60
     rest_init+0x15e/0x2b0
     start_kernel+0x412/0x4b0
     x86_64_start_reservations+0x18/0x30
     x86_64_start_kernel+0x111/0x120
     common_startup_64+0x13e/0x158

    CPU: 2 UID: 0 PID: 534 Comm: l2cap-ltk-actor Not tainted 7.2.0-rc6-pmb-bt-functional-v1+ #5 PREEMPT(lazy)
    Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
    ==================================================================

Fixes: 988c5997d320 ("Bluetooth: Use the LTK after receiving a LE Security Request")
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 net/bluetooth/smp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 1d3f3ceb3ecc8..b7015e37e1f1c 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -2209,16 +2209,20 @@ static bool smp_ltk_encrypt(struct l2cap_conn *conn, u8 sec_level)
 {
 	struct smp_ltk *key;
 	struct hci_conn *hcon = conn->hcon;
+	bool ret = false;
+
+	rcu_read_lock();
 
 	key = hci_find_ltk(hcon->hdev, &hcon->dst, hcon->dst_type, hcon->role);
 	if (!key)
-		return false;
+		goto unlock;
 
 	if (smp_ltk_sec_level(key) < sec_level)
-		return false;
+		goto unlock;
 
+	ret = true;
 	if (test_and_set_bit(HCI_CONN_ENCRYPT_PEND, hcon->flags))
-		return true;
+		goto unlock;
 
 	hci_le_start_enc(hcon, key->ediv, key->rand, key->val, key->enc_size);
 	hcon->enc_key_size = key->enc_size;
@@ -2226,7 +2230,9 @@ static bool smp_ltk_encrypt(struct l2cap_conn *conn, u8 sec_level)
 	/* We never store STKs for initiator role, so clear this flag */
 	clear_bit(HCI_CONN_STK_ENCRYPT, hcon->flags);
 
-	return true;
+unlock:
+	rcu_read_unlock();
+	return ret;
 }
 
 bool smp_sufficient_security(struct hci_conn *hcon, u8 sec_level,

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793863641;
	b=2t3hv3RV24ElMZIND9VCc/qM4m31JcdsCKudbPIT8SyqRHhFRwykRjZW4PI6iEornf5C
	 fIJUXSiBYwnGRxbY1Mu9QXyoQujKsbPdWstLK2nPoEIdtl08aTqYWtNKUK7+DZDZaeNgx
	 drSDAJVckjdB6s5Pwai1Ydyx1U2KDds1ANvamOBL4zdwIQ+ZfBsw0fNadK9hFzVZQqCjG
	 uPY0SzHCREu4xrWzRneB+jbCo3L0NEmD43+5ZVZ/4c7VYdakJl1rdAxH8kbbJMvFu9V72
	 02keHZ5kdpIxb/GBGqLPzaYwXZ10d2V24uOR0WxRFeWteF9+Dd2YIJNbQRa739rri7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793863641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y8GAjCpq+HU/Y8vWHx3dnsVw82gvuCD3uIlkSHruyoA=;
	b=kuXrv2f5EQBifQel59272/0cdMNB+xFYPPY4eb5dhHbtBDwKMmSUgvrHIt5YovHUjQAF
	 c7LmT+gkj22zMKlBrO1ybR8KkCypgNLnxhrJC//spafEXc87z+BvSnWicM7k/YY2xDAOL
	 g/GyhbG51kepYmtkfUDSJ4Y+Bxmm5UTDuZY1e7J9STOiw1Emj0+vg4CXzipu/W4qPH1ti
	 OaIooZDB10VXd7b+Zuyn7I5LA7+vq1kuk/a42fPO307fw+hwlwBG5QQtW+PI64EW2FXzf
	 J5gW/x1yibB4ZAEYM4tDuYOmaOnmKY2g/eKKLnvfxUx8RKFDCLCN+tOflZrv9KA8QSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hA0a9KV9;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC68C606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 07:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC68C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hA0a9KV9
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so10542235e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 23:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793863639; x=1794468439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y8GAjCpq+HU/Y8vWHx3dnsVw82gvuCD3uIlkSHruyoA=;
        b=hA0a9KV9Qr4jhL3UGmYyTKaQPtGz9lTuuVLsKi+X12UyQ3+IYssaBMkm4o9eAebnV3
         ZlatrnHOLxUj4iAjUk1qFnZdzJBUIFsKlw3l2eQLQlSuEjCbzl+b+K+ehVM842rZKDFM
         f7FOLd/XyzcJnoiZKolMTH/1WvSx/lby2snfPBYwSp85rA1EKMGqkxmXyuGC4lLWsx45
         F60355Jusv+QEe5fyswVR/HRZsblKzOTIPok1juV2WS5090hiaLu/CA60ibmx36ohYgO
         dp3YopHnFFQTqV4NnGHdVJER6Xmol+yywbYOkhtBDToXyNAinMd1/XnK2PWpiA4f5tgv
         XAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793863639; x=1794468439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y8GAjCpq+HU/Y8vWHx3dnsVw82gvuCD3uIlkSHruyoA=;
        b=ilEBuzWoqbU+PiLxygFCHzKom89FP42/odE4B+cbga4KmjbV+2ifNY+Re5A0nVBvcE
         jYGPKb1+WlAyJhrDgFel1T2YuhajjUKF6M/2qZDIVunG60R7dVazWvWGNztNb4IW8sHz
         mxCaRmvAEF8eKUsP2LmoUJmlJgrGa2BZnEIKNyLjaXiDn+IlFGAFB4NMHDgRS8JrTqcW
         GjKXORRr1lYRYnPjsad9z6E3j9S02rom4+63R04ftl+ZFL9HeBZhoVnxMcSf1t/LUgag
         iHXOByPVqFYR9zHJmSU7ZbpI7lL/eKgU6uUBJqyv9uuq+//vaSqIFGQzWl/E5nyyjPah
         Ikiw==
X-Forwarded-Encrypted: i=1; AKwUvBz2WlqwKD3NyOnrBDj92/ur9JKj4xsReVSXwPjPLxPABfdCzHCAZJY54OfapIGgk9kRNDoQGFAyXX6vNjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vxBEqolqXNx7cNsMUi9CEURXZeAiAHd1LiD6+EO4hRxMTzGU2
	FOBIm6yL+zdqiLDPvHY6vJIAddvdgiLXIiHvc4eDg0VYXNMqaB0Gx4Vm
X-Gm-Gg: AYBFou1nNFsBYyjX5h52gHwTUx5UAsAbCPbzX3d/GzdtlT3Z4ClrrAxivrINhZanBzF
	Xs5f+jogQk6S0DRaLwo6Q8akNvU7h0p8NhBEQ+82q8Vvi8I+ZPrjWIsUQsBBy72PHuBS2ykBG+0
	xg9YG5Ue8IHCDhVQ28iJe9AVSIIaqAMex3SE06eZXvjNYiyCFOp7FUMmvV98F3NpSlRYVZWBwyM
	TIGVLxVgd4f7oX8vxhmr+Vmgj70n+oeXVurFhsu0qn27uZmnbN5Up4Ya8Mh58Hw+hvk8NgbMqqs
	ZV4MfhPZfTPo3ID+sjuEIsFoZkaZFynecQwfosk4fIyAQaSk0XWkyNVm5hZMpJSop5VYsdyg36p
	Em7aK408QkU0cIzkHXN0W+BY+BVeYx2u2TIzz5MKQcdyAijb6ln3vkcYnJhZSWHnlo892XCa9CG
	uIHJu47Sm12CDkdK4d/63fScjvdKfbfBaoOkW68VT/H8ngF6xQTStq4SLFowma26Qomqt19aDHW
	UM9qxhWIudWSisdPVWpCAxpBUmDT6lpckSjSBeJVxP9CQJBk3S38EUJPcc/l0u68ac4pYnfizFy
	6yQmla1VxmBET792Ermlh5vczIxSSvPKx0UfYSkiwBS7FpFof993KwQNAQXQUin6nhE300rUg/E
	xnTmwocD3b9LLvZsMmxWEe+zQZIy8Mr9MLV+j9diV7k+5XTzyVMOrdKf2F/XCsEcsH+InEraTKe
	FTzuTHB1YLC8wAC08NaTd6LSO/qHAvHiYGCADZFefjBUivWde+pVmIpg==
X-Received: by 2002:a05:600c:4708:b0:4a2:167a:c93b with SMTP id 5b1f17b1804b1-4ac19234ad8mr404040655e9.30.1793863639149;
        Wed, 04 Nov 2026 23:27:19 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-947d-5f15-1dc3-a8b4.ipv6.o2.cz. [2a00:1028:8388:a84e:947d:5f15:1dc3:a8b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm51013815e9.8.2026.11.04.23.27.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 23:27:18 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ignat Korchagin <ignat@linux.win>,
	Damien Le Moal <dlemoal@kernel.org>,
	Milan Broz <gmazyland@gmail.com>
Subject: [PATCH] dm-crypt: defer async write submission to write thread
Date: Thu,  5 Nov 2026 08:27:08 +0100
Message-ID: <20261105072708.30722-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

With no_write_workqueue, kcryptd_crypt_write_io_submit() submits the
bio directly, even when called from kcryptd_async_done(). An async
cipher may run this callback in softirq or with BH disabled, where
submit_bio_noacct() must not be called because it can sleep.

Submit inline only when async is false. Async completions are sent to
the write thread, as is already done for submit_from_crypt_cpus. Use
the async flag rather than in_interrupt(), since callback context
depends on the cipher driver. Sync ciphers still submit inline.

Tested with cryptd in QEMU (x86_64 and arm64) with
CONFIG_DEBUG_ATOMIC_SLEEP, and on a P2020 running 6.18.55 without it.

In QEMU:

- 4k writes logging "sleeping function called from invalid context":
  100/100 unpatched, 0/155 patched.
- nr_requests=4 on a loop device: 0/6 unpatched runs completed,
  4/4 patched runs completed.

On the P2020, a warning in blk_mq_run_hw_queue() appeared in the
6th unpatched run and did not appear in 30 patched runs.

Fixes: 39d42fa96ba1 ("dm crypt: add flags to optionally bypass kcryptd workqueues")
Cc: stable@vger.kernel.org
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
Based on dm-7.4 (dab527d83462).

To reproduce, with CONFIG_DEBUG_ATOMIC_SLEEP, DM_CRYPT, BLK_DEV_LOOP,
CRYPTO_CRYPTD, CRYPTO_XTS and CRYPTO_AES:

  modprobe -a cryptd dm_crypt loop
  truncate -s 256M /dev/shm/nowq.img
  L=$(losetup -f)
  losetup "$L" /dev/shm/nowq.img
  KEY=$(od -An -v -tx1 -N64 /dev/urandom | tr -d ' \n')
  dmsetup create nowq --table "0 $((256 * 2048)) crypt capi:cryptd(xts-aes-lib)-plain64 $KEY 0 $L 0 2 no_read_workqueue no_write_workqueue"
  D=/dev/dm-$(dmsetup info -c --noheadings -o minor nowq)
  dd if=/dev/urandom of="$D" bs=4k count=1 conv=fsync
  dmesg | grep 'sleeping function called'

For the nr_requests=4 case, run this instead of the dd. The writes did
not finish without this patch:

  echo 4 > /sys/block/${L##*/}/queue/nr_requests
  for i in 1 2 3 4; do dd if=/dev/urandom of="$D" bs=64k count=512 seek=$((i * 512)) conv=fsync & done; wait

 drivers/md/dm-crypt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 8853e9af1c3d..c0552a300e62 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -1982,8 +1982,9 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
 	/* crypt_convert should have filled the clone bio */
 	BUG_ON(io->ctx.iter_out.bi_size);
 
-	if ((likely(!async) && test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags)) ||
-	    test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags)) {
+	if (likely(!async) &&
+	    (test_bit(DM_CRYPT_NO_OFFLOAD, &cc->flags) ||
+	     test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags))) {
 		dm_submit_bio_remap(io->base_bio, clone);
 		return;
 	}
-- 
2.54.0 (Apple Git-157)


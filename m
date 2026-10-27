Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793131742;
	b=raU0w3DnwjrJ5QDxeMXnM5eMR5GGEa9k5aeRcQge8jyMmkU8rW9qHB1t14kIzTtcpVo4
	 84TMTlqC4zcuzHXKF14u9rvlt7tT7VQdwVk5zfQP4H5NkE6siMtOJj6RZdSAioZ1VBtqZ
	 BQCFdpmI+jcda2uWoaLa6ZjFdns1op7HgytQnF1gRKsdbOUbgb9m7+/UR23jPGz604f9O
	 DEoWpdjuuTgN1oGz9QWN+28R0r5Ikuy7qKJlKekPxlEjIW6TJSGdnfkMKNDD6Aova8kw3
	 uKRyhfZWdiVKTCTLcAxAEua2RJPF5xh7jCiECrMVGwLfjtcW9n6JbSoPbGEgdrRTL7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793131742;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VeEh0rShVYt/Qe12CelPAOWD3oT/iB75neohsnBaq7s=;
	b=DCt8AoeG6nIMuf5cgldqLDWx1mWoJKq5/QoA3huk2wUdTWQmAaLH5O5uXYejXta+/sgq
	 eVdvEsVrn7EAM3Nlpr9jv3umDs+cNaQ24VbaQerTItQw6BRoB8CdFRFUiGndmTZQ6PLkM
	 pxQSE+aygUk42wFHvEsswe/saH8oceiMi/glHjfYRwGVR/UGn2syxeAkB6A5rWnm7k8p7
	 FsdmyiL44xhtNtUz70PwBMU2oZoXhmcUO3FUhClfQVa/69ZelMhipAX7HuEfvv7GyK9Pa
	 oKcQSg3q/JXTqBiFPZcNEm4o5XYIKR9OPNP/oIuOC1cFh+D/AzvtiUNTDHiUrvgCTDw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OzCpyyCq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970BE606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 20:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OzCpyyCq
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793131742;
	b=IC5yHianAWAZ9MGWEEhNM9xP1tRw7BStTU9jsR3w2hH3xkWw+gblW0DXLgH5XeRuEHH2
	 LTTQt+s6HX4lVOz3+JNJLFtJXfJdnHpZ9cT9Z85piqobSqqAOSYDX0GEmvP9dfkLGlsNc
	 PGsjO/ecJOCQke1192SE011XY0r9idRwGa5VcD1PtDFw9z4U4AfAKI1h82aAmz19RiT+y
	 /jszid0Xl4ySw67NPS7ahypEHS2U5/jTJGI/aVBgLv4Sviw6AzV7/P3KUoCRo3dkBkAPH
	 gS1sthkYeSB1g+qfmHgYBv1StsxsB/b2MEI25NsHmzkSDuzltXVYjaYqDLVms+dWAnw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793131742;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VeEh0rShVYt/Qe12CelPAOWD3oT/iB75neohsnBaq7s=;
	b=Y0+e768HBov75oGpO7EEdWwp7eL4t0a4/kPM67gNNWeFvFP+Ji5VQSUvAhNzl0ZkJnJY
	 GrbRvhR/m4BFVJ3FWlicelYncy9yYzcvQdoyxAW8Vv1LCo1TJxxQYEBXnSQFSCJTOdK42
	 fJRqf8cYma6SzpiEXxIrJLExScRbeXszbbZKpnfKnwimynjLEP1YeH9C1tScTYyFmT18q
	 8rNpn2RBPwu40l19z1l25XBGB6p0BpIx9gfNTcUtpzzVCj3UFIE800rNrKqRyfrw+ZEhO
	 1jivXrfECaOUSCYZPicPeMIYtmrFGiI5HVnrMpwi6IQWgQuAglGqpi+rljgoayHu5Wg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 095DE1F01825;
	Tue, 27 Oct 2026 20:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793131742;
	bh=VeEh0rShVYt/Qe12CelPAOWD3oT/iB75neohsnBaq7s=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OzCpyyCq+cGaRUmp3UUPoXn333kGLmmkp/w8rhfiLT8F2+s+FMDMzIUauf/5MK8in
	 ctWPWjxIRlTOBwsm8yKx31KdSs2RMrJH703ESHd5A3CnurdYUiWJUZfnUS/aiXRkdM
	 YD68/6La9O1GZ4iqg9JE44wzoIe+Tu2MrAW9+sCMVE1maJ3GCEXzNP+VjEEmd6s8Hr
	 tgV9/z+gIeZN1wiHJiR7J6GZX1n6XoPt7CffvktAeBxpxqpip6/8UR4Va7xt8ln9Pv
	 YZhp9Dcj8Fd8mBZ52a/cbSj+55BRNP/nOE/RrwUmhW0oxWJOFfZ9h13uqlbBYsaTqN
	 QDYEdW33YJVhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8AFEC451B4;
	Tue, 27 Oct 2026 20:09:01 +0000 (UTC)
From: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
Date: Tue, 27 Oct 2026 16:09:01 -0400
Subject: [PATCH] mm: annotate lockless accesses to vm_committed_as_batch
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
Message-Id: <20261027-kcsan-mm-v1-1-66757485b917@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNz3ezk4sQ83dxc3WQDQ3NLE1NTS1NLSyWg8oKi1LTMCrBR0bEQfnF
 pUlZqcglIv1JtLQCK5KvgbAAAAA==
X-Change-ID: 20261027-kcsan-mm-c01794559599
To: Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, tz2294@columbia.edu, 
 Mani Tofigh <mt4022@columbia.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793131741; l=2109;
 i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
 bh=j7Mc9C4QlmCwhmnKNi4h7TqTqfjBLIBQjYqiZTNCEhg=;
 b=0Hqd2fa5iviDcBvKgRDs91aLAznIPOLYpILVxsb/Gu5CvLIwOieETU/yf+NKTPQfPHczGDeQK
 J9UjE21rqSfBHoTSVWFwm69tJ00PEmDUjslAk2LRNLpDoBJ9Upa1Mc5
X-Developer-Key: i=mt4022@columbia.edu; a=ed25519;
 pk=gljCMQDuxyKPmd5y37CRpEJGSPXDV1MyAnHBhCgXl0I=
X-Endpoint-Received: by B4 Relay for mt4022@columbia.edu/20261026 with
 auth_id=1322
X-Original-From: Mani Tofigh <mt4022@columbia.edu>
Reply-To: mt4022@columbia.edu
Content-Transfer-Encoding: 7bit

From: Mani Tofigh <mt4022@columbia.edu>

vm_committed_as_batch is read without a lock, and it's only a hint for
how often the per-CPU counts get folded, so racing with an update is
harmless.  Annotate the accesses.

  [    0.953509] BUG: KCSAN: data-race in __vm_enough_memory / mm_compute_batch

  [    0.953645] write to 0xffffffff825165d8 of 4 bytes by task 1 on cpu 0:
  [    0.953692]  mm_compute_batch+0xc2/0x120
  [    0.953781]  mm_compute_batch_init+0x1c/0x20
  ...

  [    0.954325] read to 0xffffffff825165d8 of 4 bytes by task 41 on cpu 1:
  [    0.954373]  __vm_enough_memory+0x24/0x2b0
  [    0.954444]  shmem_inode_acct_blocks+0x1b3/0x230
  ...

  [    0.955288] value changed: 0x00000020 -> 0x00005003

Found with KCSAN while fuzzing under a deterministic hypervisor that's
currently under development.

Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
---
 include/linux/mman.h | 3 ++-
 mm/mm_init.c         | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/mman.h b/include/linux/mman.h
index 389521594c69..66e6c9c335b5 100644
--- a/include/linux/mman.h
+++ b/include/linux/mman.h
@@ -75,7 +75,8 @@ unsigned long vm_memory_committed(void);
 
 static inline void vm_acct_memory(long pages)
 {
-	percpu_counter_add_batch(&vm_committed_as, pages, vm_committed_as_batch);
+	percpu_counter_add_batch(&vm_committed_as, pages,
+				 data_race(vm_committed_as_batch));
 }
 
 static inline void vm_unacct_memory(long pages)
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 41a27860d2f6..81f360db0787 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -211,7 +211,7 @@ void mm_compute_batch(int overcommit_policy)
 	else
 		memsized_batch = min_t(u64, ram_pages/nr/4, INT_MAX);
 
-	vm_committed_as_batch = max_t(s32, memsized_batch, batch);
+	WRITE_ONCE(vm_committed_as_batch, max_t(s32, memsized_batch, batch));
 }
 
 static int __meminit mm_compute_batch_notifier(struct notifier_block *self,

---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-kcsan-mm-c01794559599

Best regards,
--  
Mani Tofigh <mt4022@columbia.edu>



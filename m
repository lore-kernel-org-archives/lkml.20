Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709926;
	b=lIBY9qkurlrywc+Merg5y9/1wq3yZMVwwAXJo6ovjzp5ZnYEUjSgDSjalebpbWZhNA1K
	 NJtTR5SBLHKr0xqwhLFzjzdVraljyU8+6tPQwelyO81j112xcvQR0MvVUKwDuo9vFjpaT
	 4RTC4zwX/1OLjhnadnkAyb8qA+GN+bbi3slZNLUJF3PlQOrGomjjBpL5aqF5aDMMHoPhN
	 bfs9lpp5DCMDdRd9DtwOO0bmacJ44fe9UB5jx0wHG1J8q9lKaQ6toQNBMP0v5kttkTaPG
	 FZgJbZ3605Lrf0R6DgwRV1xkIO6XAa/J+rflC5wzizuDT7D/754LL0jv71BUCDM2mMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709926;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=CFFqNQA2tPje8f+2Km7o/HId57+rEHsMtI8ZbY8nWlU=;
	b=Uhs4tn1wUK0DmFmkbHGtOlBd1SzU7i8fNHD2AwWWicsI6H0do4F9dDkiAe6v/svN/CJ4
	 QHExZBWfYgYJucgzcbdNL2MWopqHmpzjYZAsGRMiMFamxEQ9IJGsQSIrhO+hUZrHZr8Qn
	 xn5CsYnTye4euGtE3dmJ28Td1bGQMnpEDDLIQ5O89q90MP6/h1FlYaPH9XO5pGCiFQ9vq
	 W240PaW3mMHhFnV7laJFhsMmXTD/7sFx1IERGTZcBLnXG8ZWQKGK1jRb+RGsvYsmmQXfB
	 SmdSeLaBpq3mmDgZ9AZED4hSWIjabuEELXkMwaU5+FuxuXKIpz0k7AA+rf4VAV247eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=mniASzTX;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D78606A334
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9D78606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=mniASzTX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=CFFqNQA2tPje8f+2Km7o/HId57+rEHsMtI8ZbY8nWlU=; b=mniASzTXi6tbb3lPn/RiRDMnzx
	pfXjc0YeE5Aybswbbuj9JQCnfKyatUF0FTARffhpkyG4tKpXc6S9r6/53AnIwXrTFVD3j4ZgFUWDs
	nPgXk532WI5yvhFNzm7ohgr0M6CL/5xLM54mPyZVaxhgw7ZztujgpDmghakIl0bFS6h9gc5yI55Qo
	R7ROOTjQq8yePhKoDq/lLyX5Wer8r6D8fH4DbguSQFECWq1JkSYVSW6gCgrti68Wn4lI/D4yYI7jc
	ajRT4jBa4w3h8wby7WQuXQ/tFTb8NoFfoew1Q9dlySItE5NTiZNsnR8htaJcM6ZYWEhtfP6GoOALF
	v/R/tjOA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xODt8-006wXo-32;
	Tue, 03 Nov 2026 12:45:19 +0000
From: Breno Leitao <leitao@debian.org>
Date: Tue, 03 Nov 2026 04:29:54 -0800
Subject: [PATCH] ratelimit: Fix data race on ->burst in ___ratelimit()
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
Message-Id: <20261103-ratelimit_race-v1-1-07486c49ec12@debian.org>
X-B4-Tracking: v=1; b=H4sIAMfT6WoC/x3MYQqDMAwG0KuE77eFRsW5XkXGqJrOwOYkFRHEu
 wu+A7wDWUwlI9ABk02z/mcE4oIwTHH+iNMRgVD6smH2lbO4yld/ur4tDuJ8zenZp0c7RkZBWEy
 S7nfYvc7zAogTe0xgAAAA
X-Change-ID: 20261103-ratelimit_race-041f9bf78da1
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, Kuniyuki Iwashima <kuniyu@google.com>, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2394; i=leitao@debian.org;
 h=from:subject:message-id; bh=fo2VySwUHX+CtFDonNsZudksQAvyfQjN7QVHCW6dk+w=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq6ddbzSuwWbSOJV8ycXL6AYm+lg0woVbRcyarp
 dMG6gAgHlqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaunXWwAKCRA1o5Of/Hh3
 beJVD/9FW8EAY3X5CJ8FeTDDW/GLkQeplwfl7uqyTyRfPcpZpsTx/XCGQNLwKFiaUsFTAeeiaCC
 eag91fafMK1njR6SeebMxpal2N+LGKn8sKF3Kh7OgvdMSVTyOKEVRqcSdH9K3fm+2hp8BPgsbtg
 JB3EFvmm8pdgu+NagpYMU5K+zJQVBFlx5MrAZhy+1oxamn+k2w9M/4LX1HboYzypUQcvD/cmu+8
 RkOctAKN++LtVtx062UeXZku6FVRjaS7PsjzN+e+prIfMoVTUywadFdAgiQFH7XVS6wUw0K6QsJ
 KoJn/2FJM4s7zZWHEr762djd5udafCXEkibKlaEYr0XMI3PfqDWr0d6R3mgvKBInHEU28QV1T3z
 XS6P0LGuSef+/p8UIUWsbq0sy2KqjHBBJ2AHyuL5sZJ6JarroQ1hS9n9CfXbTM+yH61mCmfm4U6
 /My8GZyW+Ix+s+Z2zUUGIl5lKkskb3bBiP0en3o/y/EMZKCAk8hoL2kJe3Hec4SnfjzwPHI0Q9B
 21/gOaPVf8YZtn+sy8pkrtQiLGiR1dEgNEiC2yrtiDm04JO+7ZEA8hMRAbSkjOJ+zeGxSzhvIVg
 Lr1dI3U5UV1HwI5m1Jmlr5FGiTnS8L7abCiPlIq0hxlnjEPuRgAryao2idK/vCKTjAKa8jQGkrR
 29JSCzGISbPWKHw==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

I am seeing the following race on my debug kernels:

  BUG: KCSAN: data-race in ___ratelimit / do_proc_int_conv

  write (marked) to 0xffffffff83084544 of 4 bytes by task 186 on cpu 3:
   do_proc_int_conv+0x94/0xa0
   proc_vec+0x48a/0x8d0
   proc_dointvec+0x16/0x20
   proc_sys_call_handler+0x263/0x3b0
   proc_sys_write+0x13/0x20
   vfs_write+0x559/0x610
   __x64_sys_pwrite64+0xce/0x110

  read to 0xffffffff83084544 of 4 bytes by task 185 on cpu 1:
   ___ratelimit+0x137/0x3b0
   __printk_ratelimit+0x18/0x20

  value changed: 0x00000001 -> 0x00000000

This could be reproduced by flipping kernel.printk_ratelimit_burst
between 0 and 1 while a kthread calls __printk_ratelimit() in a loop
makes KCSAN report:

___ratelimit() reads ->interval and ->burst once, with READ_ONCE(),
because sysctl writes like the one above change them without taking
rs->lock. Commit 6bae8ceb90ba ("ratelimit: Fix data-races in
___ratelimit().") added those snapshots.

Refill rs_n_left from the snapshot instead, which is also the value
the function has already checked to be positive.

Fixes: cf8cfa8a9978 ("ratelimit: Reduce ___ratelimit() false-positive rate limiting")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 lib/ratelimit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/ratelimit.c b/lib/ratelimit.c
index e2d65d3b1c3545..d24864f12d871e 100644
--- a/lib/ratelimit.c
+++ b/lib/ratelimit.c
@@ -67,7 +67,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 	if (!(rs->flags & RATELIMIT_INITIALIZED)) {
 		rs->begin = jiffies;
 		rs->flags |= RATELIMIT_INITIALIZED;
-		atomic_set(&rs->rs_n_left, rs->burst);
+		atomic_set(&rs->rs_n_left, burst);
 	}
 
 	if (time_is_before_jiffies(rs->begin + interval)) {
@@ -77,7 +77,7 @@ int ___ratelimit(struct ratelimit_state *rs, const char *func)
 		 * Reset rs_n_left ASAP to reduce false positives
 		 * in parallel calls, see above.
 		 */
-		atomic_set(&rs->rs_n_left, rs->burst);
+		atomic_set(&rs->rs_n_left, burst);
 		rs->begin = jiffies;
 
 		if (!(rs->flags & RATELIMIT_MSG_ON_RELEASE)) {

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261103-ratelimit_race-041f9bf78da1

Best regards,
--  
Breno Leitao <leitao@debian.org>


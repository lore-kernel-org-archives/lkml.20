Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484276;
	b=ccQMBf3YAQr4jEki0G1KiaIJYxneAxrMwMKwwbFtAoVzB9HRS+qCv3Y1GcuwYAzpe2fK
	 rzwo/3vIYh2Nu9IHNuI3SQo4Er46TOvyb+opOQnZCoC+bG3dVJCdMUnpywc7RrbRdI6jh
	 jooqXo7d52XcdOH+WVbfohFLjowBLXs4ffd0QtDp3K+ctbWFJOEKaPXJA0jlldgqzeE9H
	 9bqPemKS9YRdLqAA9DC9mNQpss/E0XaYU6ZyGDC6D5VVFjYOPltbCaNcC1ig7YkISIqZ6
	 9a3azZE0M8RACa/g5NgW6EZooyTd4oDXxE8wsDOmGRwbeWcwKi9Vxp4PBwwLSwxAONQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484276;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=g7FWRyAWx3iB3hlRZqVCNdy5X/7Do0taWr0Tn8+qOx8=;
	b=a4oTz3pgcXmo7+cgHpe2ArNCohTthx20MPTR9hwjXupXKYhhes9a2K3nq62/++tJ+Q1i
	 ZAyMDesOSlonTucnN3WrxacYsVYNY+FM1CI5npj3//stgugz//+iTyIV6uYQZaniY93PS
	 BAnASkEClTglBKail8UC1N6bDgiLshTb4k2NpKtDMxksUXUIUJRYE/NMB+cOtGAPjr5my
	 lNXvc3Nb+qi7Ihr3GdubE7QzyPIwqF1mqY8hUCyw55AX6CVuY1r7OH5ZnSWCrdIKW4RZD
	 VJkHJsJ+MTsMEm2IO7ZMiN+k8GTD7a3njDh5uAyO69636E35gyBqTfUjCnKWUcLQxDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=nGqxesdb;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4F2606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:51:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C4F2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=nGqxesdb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=g7FWRyAWx3iB3hlRZqVCNdy5X/7Do0taWr0Tn8+qOx8=; b=nGqxesdbR6d9Ua9L5bkKBBOjTh
	QgctO79YpZ67I/sIEPJREr9odbEn46+T5jArFC2qvjaSlHzKVoJFT68z5nEpJ2m3KSD8cX6e4q+0E
	4LVcnUroWVuHJwVAi+imRMbSvxMcbw1DtgNOxDad6JaHMTLv8vTq3qvi/JpJJr1XokqiU6NTKVlNk
	BuxgTME0IfkiV5dHsySQOwRX7AsDfbolv/zREnYR71PAsDy3EZEfwbiu/1hWBfRHLngjklD6cjZPe
	Rnm7TogyRoZwEA5xHu3Z65nis7i7sKT/asvrrP/oEpqs676c4vzajclvUX9pWeRKs6Zvh6t/AQc8j
	uenTHG0w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRTKg-00DwvO-2J;
	Thu, 12 Nov 2026 11:51:10 +0000
From: Breno Leitao <leitao@debian.org>
Date: Thu, 12 Nov 2026 03:48:01 -0800
Subject: [PATCH] mm: kmemleak: drop kmemleak_lock in scan_block() when it
 is contended
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
Message-Id: <20261112-kmemleak-scan-lock-break-v1-1-95808108d03c@debian.org>
X-B4-Tracking: v=1; b=H4sIAHGn9WoC/x3MywqAIBCF4VeJWTeQRtdXiRZmYw2WhUIE0rtnn
 d23OH+EQJ4pQJ9F8HRx4MMliDwDvSq3EPKcDLKQtUhDu9O+kbIYtHK4Hdri5D83U9eKlkypZQX
 pfnoyfP/pYXyeF+laqspqAAAA
X-Change-ID: 20261111-kmemleak-scan-lock-break-7b9818ef3c25
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, vlad.wing@gmail.com, 
 harry@kernel.org, kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=3656; i=leitao@debian.org;
 h=from:subject:message-id; bh=5T6aw43QawtVXoj03pz2K45DQEaN5hI2WF6eNsaihxk=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBq9agrMcaniPNKq+f+xzNvrI/ZBfuc29YpGKNtc
 sAnAZOJ/nSJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCavWoKwAKCRA1o5Of/Hh3
 bRw9EACJvTJW9K5mhUfirEyEVQ7Lx169JsyzK8Pr3C3zk4+GuqS1zUsehkhFsfBw4NPj50QHuZY
 rOoLy6jTBW53IJp+y49qmaIcq4PflE8OFKmcN+HXWjotnfNMgkba+Es9AM5iAAQjXo4CqpSvsGw
 JFa92bugEDjpOtSE2ypXIZ/yo1ikNPHZJpZEiZL2Td5N9pZhm63fUDHq25lR5KWPzQiCHfBzRG1
 G1Co7fSMivFc4a+QPe+GRdkvoyo/V6yDLstg0XLnhejUI/Sk0bvdWltBziLhNgVqq4IxT4XhGwJ
 OuNkZUalLv/eMHTyQ12KmpPd59Dsx+NooOpCv9COmBzFiTAQRPCkzeihgx75dM2kiOixvAu3pxy
 uhjODEH59TxiYxICL/kC4Qrj+OcsToEJVpsdu7GThI+9NrMKHlcfVAm/H6DQt4tImOxCr19UK4c
 uuDtrBNMbAncBqme2egCrCrxABykQb7BWBmNdwMe/w1u3HTojKQpA5oL1RbkJ+UxuI3g6Vz7AVN
 u07eok+uVTMf2I0fexXIYzaU4FsbIYfhJHoGZx65zkUo4B1OO/r5a3FvrbzZzS525RIbOKJNu0Y
 XDJqHj3boK7l81n7AnCDbtAceVcgiol7/zq91i441F+RkOarNH94tKOKrHSqqSDbBWTj7mGkxam
 cmE63B5CpL/q1aQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

kernel_lock is a damn hot lock, used on allocations, free, NET_RX, etc.
It is also used on the scan, so, while scanning, most of the system is
mostly waiting for the lock.

On meta fleet, this is, by far, the most contented lock. This is not
a big deal, because very few hosts run with kmemleak enabled, but,
I think we can do better here.

scan_block() takes kmemleak_lock once per block and keeps it, with
interrupts disabled, for up to MAX_SCAN_SIZE bytes: 512 words, each
needing up to two object tree lookups. Every allocation and free in the
system needs the same lock to insert or remove its object, so each of
them can wait for a whole block.

Keep taking the lock once per block, but in auto scan mode, check every
64 words whether anybody is waiting for it and, if so, breathe (aka
release it and take it again so that the waiters go first)

Releasing the lock is seems safe because it only keeps the object trees
stable during each lookup, and scan_block() does not use an object found
under it past the word being processed.

Tested in an arm64 KVM guest with 48 vCPUs, KASAN and lockdep, running
stress-ng sock, fork and dentry workers on 8 CPUs during five scans.
The kmemleak_lock wait times of the other CPUs, from the lock_contended
and lock_acquired tracepoints:

                   average     p99     p99.9
  no scan            3.7us    <16us    <32us
  scan, before      15.8us   <256us   <512us
  scan, after       11.7us    <64us   <256us

The cost is a slower scan, as the scanner now queues behind the
waiters: the five scans took 179s instead of 118s.

This patch does not change interactive users (echo scan > kmemleak in
debugfs), given current != scan_thread, and scan_breathe() will not be
called.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 mm/kmemleak.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index 1bca27787df625..da6d1dcdd6f6ad 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -112,6 +112,7 @@
 #define SECS_FIRST_SCAN		60	/* delay before the first scan */
 #define SECS_SCAN_WAIT		600	/* subsequent auto scanning delay */
 #define MAX_SCAN_SIZE		4096	/* maximum size of a scanned block */
+#define SCAN_LOCK_BATCH		64	/* words between lock waiter checks */
 
 #define BYTES_PER_POINTER	sizeof(void *)
 
@@ -1539,6 +1540,18 @@ static int scan_should_stop(void)
 	return signal_pending(current);
 }
 
+/*
+ * Release kmemleak_lock and take it again if anybody is waiting for it, so
+ * that allocations and frees do not have to wait for a whole block.
+ */
+static void scan_breathe(unsigned long *flags)
+{
+	if (raw_spin_is_contended(&kmemleak_lock)) {
+		raw_spin_unlock_irqrestore(&kmemleak_lock, *flags);
+		raw_spin_lock_irqsave(&kmemleak_lock, *flags);
+	}
+}
+
 /*
  * Scan a memory block (exclusive range) for valid pointers and add those
  * found to the gray list. Return non-zero if the scan was interrupted.
@@ -1561,6 +1574,14 @@ static int scan_block(void *_start, void *_end,
 			break;
 		}
 
+		/*
+		 * Only the background scan thread breathes, scans requested
+		 * through debugfs keep the lock and finish sooner.
+		 */
+		if (current == scan_thread && ptr != start &&
+		    !((ptr - start) % SCAN_LOCK_BATCH))
+			scan_breathe(&flags);
+
 		kasan_disable_current();
 		pointer = *(unsigned long *)kasan_reset_tag((void *)ptr);
 		kasan_enable_current();

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261111-kmemleak-scan-lock-break-7b9818ef3c25

Best regards,
--  
Breno Leitao <leitao@debian.org>


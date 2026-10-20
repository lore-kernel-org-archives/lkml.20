Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=90.155.50.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792508651;
	b=JFlWA00oqwVHk0S2mg4GA0k104dRz30L+4EQP0cxszw803DB4QIm7UjricKG7XtiuBbL
	 qAXedTj29xWCnUqs2QBL9/jyDSE74nUPzrRXjNIY30737C2St4G7IN9jHTQLhMEvCP8jf
	 mmV617Lpxh/UBj60nMJWf+vsTjxIMD8WAsVX+wYrathq2+KwxA/fy/3U8SAfxNs88hAjR
	 WIA6h9p6v4lRFQjq8yuBX3tvxizc32QlTftme5q75px4uaYo9HSbdyinfuCCcxYWh1CPU
	 Z7FFfQIDXDEmyGSoFe3AB+8NbqS/xODAtAcOhrWWTDrBEkRuzl5/1AYDlDDHsWPBS0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792508651;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:Content-Type:User-Agent:MIME-Version:X-SRS-Rewrite;
	bh=VLVZ9wamaCUh1k+r1gMvSGj2WV8lgpjXUirj1IZK2b8=;
	b=DBANMR4plj0bEsKXRonbTvt7BXh5wQK0KhaAtnfnhMbVFvpIbUAdZGb3DLiWKrbt8jY3
	 txrIiNOsKSkLn620QO8m++ns6l8B71ybRscnU/vjfKGfaVcfzQXdIPw3Nz8gh0A2oV1J7
	 4uC9OnpNdHGxH+SxlsPhVZFeEFuToS5LKuZgBtY09Z/dsa7MTWbGkjBOuylql2YFTrGZ1
	 IvJR6rxoFfSYIcnbaRXml9VfrJJGMEuiCDFcJlGnZZb48u6wldiGf+rMJUjDb1J0IbCZB
	 dQEMDkc0igKTcOfEeShKfbPCTU1bg4jUoi/RmsbUfGIJxlXKiu7aOP2QRRUM3KAmQtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=casper.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ndpsqUD8;
	arc=none smtp.remote-ip=90.155.50.34
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79466606A31A;
	Tue, 20 Oct 2026 15:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79466606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=ndpsqUD8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:Date:Cc:To:
	From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VLVZ9wamaCUh1k+r1gMvSGj2WV8lgpjXUirj1IZK2b8=; b=ndpsqUD8wDoTqbcrq66wiMo4Au
	O7oNMXCMVp9ItJ2kM42M+k6r8Ps7BBFbPLBkGxZh4kT2lYQoDNwK2wZkPnQDkRT1KkPDHqaueIboy
	0n3FVgWoPt+ffkNxkkFA1TelOMp7kEpBvcCU9IOQku6jeuJgY81gPYawgPQK40CjWTIuno2Jy/8Jc
	SCzdFUeZZ9sb8IJj7KREtodW1OADFbusKMSlXNYkBJYKq304cwUhQImamh9+dBkmdX7OaAB5x2Rhc
	6rPHSPHgX8TWrgn3P8LEEjDccpCBvZugXF0D694ApZafM2DHo9r+tsYStJ8weYEWyWCvPRXgv0P/l
	W+PsV82A==;
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=u09cd745991455d.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBNa-000000003bu-290v;
	Tue, 20 Oct 2026 15:03:54 +0000
Message-ID: <6dee36e290c2a3b85dcd7cdba2cab72fe57b25c4.camel@infradead.org>
Subject: [PATCH] kthread: Teach lockdep about kthread_flush_work()
 dependencies
From: David Woodhouse <dwmw2@infradead.org>
To: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Guenter Roeck <groeck@chromium.org>, Frederic Weisbecker
 <frederic@kernel.org>, Waiman Long <longman@redhat.com>,  Christian Brauner
	 <brauner@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Jann Horn	
 <jannh@google.com>, Kees Cook <kees@kernel.org>, Breno Leitao
 <leitao@debian.org>, 	chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long
 <longman@redhat.com>
Date: Tue, 20 Oct 2026 16:04:00 +0100
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-5Y+JCENTnr/fcJFpYw95"
User-Agent: Evolution 3.62.0-0ubuntu1~ppa1~24.04 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-5Y+JCENTnr/fcJFpYw95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

From: David Woodhouse <dwmw@amazon.co.uk>

Make potential deadlocks due to kthread_flush_work() visible to
lockdep, like the equivalent deadlocks on workqueues already are.

On-stack users of KTHREAD_WORK_INIT move to kthread_init_work(): the
static initializer keys the lock class on the work's address, which on
the stack is not static.

Inspired by Sashiko finding precisely such a deadlock (not that it
would have actually been found by lockdep in that case, since it isn't
a normal use case that would have been tested):
https://lore.kernel.org/all/a654a72765eaf278649b285218b0b1f6f9d45664.camel@=
infradead.org/

Assisted-by: LLM
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 drivers/platform/chrome/cros_ec_spi.c |  8 ++++--
 include/linux/kthread.h               | 32 +++++++++++++++++++---
 kernel/kthread.c                      | 39 +++++++++++++++++++++++----
 3 files changed, 69 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_spi.c b/drivers/platform/chrom=
e/cros_ec_spi.c
index 28fa82f8cb07..978eaff6d045 100644
--- a/drivers/platform/chrome/cros_ec_spi.c
+++ b/drivers/platform/chrome/cros_ec_spi.c
@@ -655,13 +655,17 @@ static int cros_ec_xfer_high_pri(struct cros_ec_devic=
e *ec_dev,
 {
 	struct cros_ec_spi *ec_spi =3D ec_dev->priv;
 	struct cros_ec_xfer_work_params params =3D {
-		.work =3D KTHREAD_WORK_INIT(params.work,
-					  cros_ec_xfer_high_pri_work),
 		.ec_dev =3D ec_dev,
 		.ec_msg =3D ec_msg,
 		.fn =3D fn,
 	};
=20
+	/*
+	 * Not KTHREAD_WORK_INIT: the on-stack work needs a static lockdep
+	 * class key, which kthread_init_work() provides per call site.
+	 */
+	kthread_init_work(&params.work, cros_ec_xfer_high_pri_work);
+
 	/*
 	 * This looks a bit ridiculous.  Why do the work on a
 	 * different thread if we're just going to block waiting for
diff --git a/include/linux/kthread.h b/include/linux/kthread.h
index a01a474719a7..279b7875b7e0 100644
--- a/include/linux/kthread.h
+++ b/include/linux/kthread.h
@@ -148,6 +148,9 @@ struct kthread_worker {
 	struct list_head	delayed_work_list;
 	struct task_struct	*task;
 	struct kthread_work	*current_work;
+#ifdef CONFIG_LOCKDEP
+	struct lockdep_map	lockdep_map;
+#endif
 };
=20
 struct kthread_work {
@@ -156,6 +159,9 @@ struct kthread_work {
 	struct kthread_worker	*worker;
 	/* Number of canceling calls that are running at the moment. */
 	int			canceling;
+#ifdef CONFIG_LOCKDEP
+	struct lockdep_map	lockdep_map;
+#endif
 };
=20
 struct kthread_delayed_work {
@@ -163,9 +169,17 @@ struct kthread_delayed_work {
 	struct timer_list timer;
 };
=20
+#ifdef CONFIG_LOCKDEP
+#define KTHREAD_WORK_INIT_LOCKDEP_MAP(work)				\
+	.lockdep_map =3D STATIC_LOCKDEP_MAP_INIT("(kthread_work_completion)("#wor=
k")", &(work)),
+#else
+#define KTHREAD_WORK_INIT_LOCKDEP_MAP(work)
+#endif
+
 #define KTHREAD_WORK_INIT(work, fn)	{				\
 	.node =3D LIST_HEAD_INIT((work).node),				\
 	.func =3D (fn),							\
+	KTHREAD_WORK_INIT_LOCKDEP_MAP(work)				\
 	}
=20
 #define KTHREAD_DELAYED_WORK_INIT(dwork, fn) {				\
@@ -182,19 +196,31 @@ struct kthread_delayed_work {
 		KTHREAD_DELAYED_WORK_INIT(dwork, fn)
=20
 extern void __kthread_init_worker(struct kthread_worker *worker,
-			const char *name, struct lock_class_key *key);
+			const char *name, struct lock_class_key *key,
+			struct lock_class_key *flush_key);
=20
 #define kthread_init_worker(worker)					\
 	do {								\
-		static struct lock_class_key __key;			\
-		__kthread_init_worker((worker), "("#worker")->lock", &__key); \
+		static struct lock_class_key __key, __flush_key;	\
+		__kthread_init_worker((worker), "("#worker")->lock",	\
+				      &__key, &__flush_key);		\
 	} while (0)
=20
+#ifdef CONFIG_LOCKDEP
+#define __kthread_init_work_lockdep_map(work, _key)			\
+	lockdep_init_map(&(work)->lockdep_map,				\
+			 "(kthread_work_completion)("#work")", (_key), 0)
+#else
+#define __kthread_init_work_lockdep_map(work, _key) do { } while (0)
+#endif
+
 #define kthread_init_work(work, fn)					\
 	do {								\
+		static struct lock_class_key __work_key;		\
 		memset((work), 0, sizeof(struct kthread_work));		\
 		INIT_LIST_HEAD(&(work)->node);				\
 		(work)->func =3D (fn);					\
+		__kthread_init_work_lockdep_map((work), &__work_key);	\
 	} while (0)
=20
 #define kthread_init_delayed_work(dwork, fn)				\
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 63beb59b7a3d..694599805c5c 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -957,11 +957,13 @@ early_initcall(kthreads_init);
=20
 void __kthread_init_worker(struct kthread_worker *worker,
 				const char *name,
-				struct lock_class_key *key)
+				struct lock_class_key *key,
+				struct lock_class_key *flush_key)
 {
 	memset(worker, 0, sizeof(struct kthread_worker));
 	raw_spin_lock_init(&worker->lock);
 	lockdep_set_class_and_name(&worker->lock, key, name);
+	lockdep_init_map(&worker->lockdep_map, name, flush_key, 0);
 	INIT_LIST_HEAD(&worker->work_list);
 	INIT_LIST_HEAD(&worker->delayed_work_list);
 }
@@ -1020,9 +1022,22 @@ int kthread_worker_fn(void *worker_ptr)
=20
 	if (work) {
 		kthread_work_func_t func =3D work->func;
+#ifdef CONFIG_LOCKDEP
+		/*
+		 * Work functions are free to release their own work item, so
+		 * hold a copy of its lockdep map rather than the map itself.
+		 */
+		struct lockdep_map lockdep_map;
+
+		lockdep_copy_map(&lockdep_map, &work->lockdep_map);
+#endif
 		__set_current_state(TASK_RUNNING);
 		trace_sched_kthread_work_execute_start(work);
+		lock_map_acquire(&worker->lockdep_map);
+		lock_map_acquire(&lockdep_map);
 		work->func(work);
+		lock_map_release(&lockdep_map);
+		lock_map_release(&worker->lockdep_map);
 		/*
 		 * Avoid dereferencing work after this point.  The trace
 		 * event only cares about the address.
@@ -1334,12 +1349,22 @@ static void kthread_flush_work_fn(struct kthread_wo=
rk *work)
 void kthread_flush_work(struct kthread_work *work)
 {
 	struct kthread_flush_work fwork =3D {
-		KTHREAD_WORK_INIT(fwork.work, kthread_flush_work_fn),
-		COMPLETION_INITIALIZER_ONSTACK(fwork.done),
+		.done =3D COMPLETION_INITIALIZER_ONSTACK(fwork.done),
 	};
 	struct kthread_worker *worker;
 	bool noop =3D false;
=20
+	kthread_init_work(&fwork.work, kthread_flush_work_fn);
+
+	/*
+	 * Waiting for the work's completion makes any lock held here part
+	 * of a dependency cycle with any lock its function takes, and with
+	 * anything the function itself waits for. Record the wait even if
+	 * the work turns out to be idle.
+	 */
+	lock_map_acquire(&work->lockdep_map);
+	lock_map_release(&work->lockdep_map);
+
 	worker =3D work->worker;
 	if (!worker)
 		return;
@@ -1571,10 +1596,14 @@ EXPORT_SYMBOL_GPL(kthread_cancel_delayed_work_sync)=
;
 void kthread_flush_worker(struct kthread_worker *worker)
 {
 	struct kthread_flush_work fwork =3D {
-		KTHREAD_WORK_INIT(fwork.work, kthread_flush_work_fn),
-		COMPLETION_INITIALIZER_ONSTACK(fwork.done),
+		.done =3D COMPLETION_INITIALIZER_ONSTACK(fwork.done),
 	};
=20
+	kthread_init_work(&fwork.work, kthread_flush_work_fn);
+
+	lock_map_acquire(&worker->lockdep_map);
+	lock_map_release(&worker->lockdep_map);
+
 	kthread_queue_work(worker, &fwork.work);
 	wait_for_completion(&fwork.done);
 }
--=20
2.43.0


--=-5Y+JCENTnr/fcJFpYw95
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCE8Ew
ggWvMIIEl6ADAgECAhANkOKMSmGXhF5eMl0rsRhvMA0GCSqGSIb3DQEBDAUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBHMjAeFw0yNDAzMTMwMDAwMDBaFw0zNDAz
MTIyMzU5NTlaMGIxCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UE
AxMxRGlnaUNlcnQgQXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTCCAiIw
DQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBAOfSIeC0vv1xPQ+dgSxbIIrkaru6skAWJYaGFzmv
q4Kq+2wU2jxhcWlJg/JeP5jEkq/LM3pn5aaLao79j+XRmS7J1ZpJKUODJVoM4s9MQJhTMvo4qS5Z
S64g6QR7Obkz3I1Lr3aWeSBmDDEyzue+NKtuWZ1Cxy3RdXo/w5HgRc3l2AercOM3Gt1XonTzEtTb
Z/Hwc0Sn9Gz8RmGRK6Ka4hVDl8q/2l110KaV233Kh5etP0csXS8MIMdVRfRu3sc5hp13DG7lCKzK
72a2GEpI8Wpl26G6I1/LMzz/98T+FqjTqxsdquk7Cj7m2vKGLW1BorpQH7WFGPdJQXJe1hfbfiZA
CcVdCtl4nAacFacmsiArZBfX7AQGL7isvHUwwYFEtcApyGW4p2Lt+t8nvU0CANA6BHOpOz1xOP8W
mAESbUriIjyuTUf3fJ9oDNCurVqhASMJCDaWI3lYX/QAoiAzt6akqbbZxo2ujW7mGGqc0KxqE2cs
h2T79v7pC8aUtHBfwNrTR19GnZVxE0eQ7ViIQhR6mpSaUQFA9sG+cmD2G8TnCgYsLa0q8De6F61a
CBevQGHNzrbZ3JAMneveYg/Jy1XxQHDRcvrMfWKe0jjcWbdKYlaGVPm5V1ILwYz7Yv5ewo3NUrxI
GJiywe9qPhuJSDZs7VehTuI0FxGIsgKzVjgbAgMBAAGjggFcMIIBWDASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBT3m6JO05fF9DQPQw6Bhc6RkzKv+TAfBgNVHSMEGDAWgBTOw0q5mVXyuNtg
v6l+vVa1lzan1jAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MHkGCCsGAQUFBwEBBG0wazAkBggrBgEFBQcwAYYYaHR0cDovL29jc3AuZGlnaWNlcnQuY29tMEMG
CCsGAQUFBzAChjdodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkSURS
b290RzIuY3J0MEUGA1UdHwQ+MDwwOqA4oDaGNGh0dHA6Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdp
Q2VydEFzc3VyZWRJRFJvb3RHMi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUA
A4IBAQA+b8Uw53sDspdZgukU+qzLyyHkcjlxGGhHlP+zrmDLKm1wEFvCRS2pili3Hy67i8N4N5NU
vw5Rg6kv3lxb9S9Rktxk43k+tvm68pl7OxQE55ZjVY87P0lUPGwEqOOwLLyH02ZQcsfq5p5LrOH9
0JvmvZ1yy73HS+VpDAqOlytE0NSvTIRqFFkKQGQwfjvtql9YflujuNNvJztjBaHKYZsnNSg+J38o
jYq4TP3pSg3UdVH0PncVjPQyqxC9xef5Xae92Kbkzol3x7Nel3A1bwAkalrDMspvTHvey6LfiBks
FIqviTnoy7fgjaRAJgHS+RXx/cmuRd3rUAclSVVrYu8RMIIHAzCCBOugAwIBAgIQAzUotrsybJHx
HTjKOIVdIDANBgkqhkiG9w0BAQsFADBiMQswCQYDVQQGEwJVUzEXMBUGA1UEChMORGlnaUNlcnQs
IEluYy4xOjA4BgNVBAMTMURpZ2lDZXJ0IEFzc3VyZWQgRzIgU01JTUUgUlNBNDA5NiBTSEEzODQg
MjAyNCBDQTEwHhcNMjYwNzE4MDAwMDAwWhcNMjgwMTA0MjM1OTU5WjAeMRwwGgYDVQQDDBNkd213
MkBpbmZyYWRlYWQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA2pYux73kdbYX
sWF8f1u6DJP91qcqaZetsyfPkZk0B+MmXmAEv0kVes5n15V2mbDThOnpoPFly0UugQO9JYqLfrtD
tKD5yL58fgrDB9Dw+LQikgrHafl6YSCds5AvUu/8hw2J6noKrcOLJpKlKn9Fl/4IB9Q3JIdLx5aa
EtTqMalIPqHFOlgrJ7s+aua8xbB8YQ9ahqYBXWRJNv3P/2b1DYtdrz1oqZPE3CcB8Pc6Gf2a1Tcm
6TAgtEx7Cf1BFcrsrMz7TWHmGQITieNb2r9UYWSc2Gp+GtYFNJCgT0JJXKUBIauPMKBLteYrL8Fo
ff/uY44dC/mDWjdCP/5x0qelPQjlBvWdHL5zvBTOj06rJ0m3HNI/hnIcDh0Qu2j9reb9rLVcdym6
bWmBM4uDEB8Zv9Ph0KTBFSy1IosyakuD1j1Os30EzjGfbi0EUXIvnOcYbTBAbM5UAzrxEHMhBvoX
Pvnx+OyvjJmc9tWxTX6AcSz+m40esbT17URBeZS18afgieiikm5TynlUYP1LciR3hSgGVzvGXnKO
02VDFR5itGWdRKZ2W5wIShNfWfhSa0D0K5UdIDt5Qc7sjzwK1Yb1sY5Tu0uA5mhIS82q1ov83uxB
sFkriNnhGv/M1NCDVLBiOMsHu73qUM+yKmgKLwF9Hfn9WI25glbAMI4S5r3hYzcCAwEAAaOCAfcw
ggHzMB8GA1UdIwQYMBaAFPebok7Tl8X0NA9DDoGFzpGTMq/5MB0GA1UdDgQWBBRcYhqbcGzn1jrT
JOZaB8O7qllDpzAwBgNVHREEKTAngRNkd213MkBpbmZyYWRlYWQub3JngRBkYXZpZEB3b29kaG91
LnNlMBQGA1UdIAQNMAswCQYHZ4EMAQUBAjAOBgNVHQ8BAf8EBAMCBeAwHQYDVR0lBBYwFAYIKwYB
BQUHAwIGCCsGAQUFBwMEMIGpBgNVHR8EgaEwgZ4wTaBLoEmGR2h0dHA6Ly9jcmwzLmRpZ2ljZXJ0
LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsME2gS6BJ
hkdodHRwOi8vY3JsNC5kaWdpY2VydC5jb20vRGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZT
SEEzODQyMDI0Q0ExLmNybDCBjQYIKwYBBQUHAQEEgYAwfjAkBggrBgEFBQcwAYYYaHR0cDovL29j
c3AuZGlnaWNlcnQuY29tMFYGCCsGAQUFBzAChkpodHRwOi8vY2FjZXJ0cy5kaWdpY2VydC5jb20v
RGlnaUNlcnRBc3N1cmVkRzJTTUlNRVJTQTQwOTZTSEEzODQyMDI0Q0ExLmNydDANBgkqhkiG9w0B
AQsFAAOCAgEAocabrh1cPd5s3vY5rnlBVQSTc7zs2ZWs67dAIltR+05WELrYClVzzUhMs/LOJPlr
EUo45UDDomXq38DxFepaPd9+iNLjXfn33EX/IG44j04lU/oF/Rg9VeQILkYLbCZ/x9wOjNHZc4SN
ydY7Dhvf/sT5aBz88u7D5+azZJ7Qf1U57wYseCH1Mt0nDrtr5y19IJ8D9xJJ33RFL6vfpHZBBAQ8
+3RqkKNxLoV2aFvQhxdhjNLDqTv3LjUIdicwPraN7JkxEu7CV2Lka7eRqJgkWL7SK0YmBjGpRafs
+icP/ON5RCCKTTb6VlX8eTG2sJJfsFhvJNCCt6xexbWzWtIrfP7NvPBvwBB737AyEGBZkS5aNizT
McURJGTv9UKvBh1LF/+tNhYtLvPCN7oecGzhCHht9jcwSkygTo3Y6YlK3QgOu+ncmiBbfeuwlLZ1
LxbYvG6hgNqXv7u6YyADbYajAQJXJ2OQen39pm3Q/AQSyLYG+B8lDglWsM8tYXPlEdrYJcksGK6F
nqIX6Bumn43rBooLJdiZp4WmfWdL2pxe+LxRDjprmqu1WprixDxULSTOKJZoqTlugs6y3Bc+if+s
gHnBBtz9WQ6MtPHkh7zONDAFIKcBmv8OqPQCx0F3Wv3OEybwMpXx0OsKgK8wLldaX1pXcMuyDgTL
Sqs0AV0OHUgwggcDMIIE66ADAgECAhADNSi2uzJskfEdOMo4hV0gMA0GCSqGSIb3DQEBCwUAMGIx
CzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5EaWdpQ2VydCwgSW5jLjE6MDgGA1UEAxMxRGlnaUNlcnQg
QXNzdXJlZCBHMiBTTUlNRSBSU0E0MDk2IFNIQTM4NCAyMDI0IENBMTAeFw0yNjA3MTgwMDAwMDBa
Fw0yODAxMDQyMzU5NTlaMB4xHDAaBgNVBAMME2R3bXcyQGluZnJhZGVhZC5vcmcwggIiMA0GCSqG
SIb3DQEBAQUAA4ICDwAwggIKAoICAQDali7HveR1thexYXx/W7oMk/3Wpyppl62zJ8+RmTQH4yZe
YAS/SRV6zmfXlXaZsNOE6emg8WXLRS6BA70liot+u0O0oPnIvnx+CsMH0PD4tCKSCsdp+XphIJ2z
kC9S7/yHDYnqegqtw4smkqUqf0WX/ggH1Dckh0vHlpoS1OoxqUg+ocU6WCsnuz5q5rzFsHxhD1qG
pgFdZEk2/c//ZvUNi12vPWipk8TcJwHw9zoZ/ZrVNybpMCC0THsJ/UEVyuyszPtNYeYZAhOJ41va
v1RhZJzYan4a1gU0kKBPQklcpQEhq48woEu15isvwWh9/+5jjh0L+YNaN0I//nHSp6U9COUG9Z0c
vnO8FM6PTqsnSbcc0j+GchwOHRC7aP2t5v2stVx3KbptaYEzi4MQHxm/0+HQpMEVLLUiizJqS4PW
PU6zfQTOMZ9uLQRRci+c5xhtMEBszlQDOvEQcyEG+hc++fH47K+MmZz21bFNfoBxLP6bjR6xtPXt
REF5lLXxp+CJ6KKSblPKeVRg/UtyJHeFKAZXO8Zeco7TZUMVHmK0ZZ1EpnZbnAhKE19Z+FJrQPQr
lR0gO3lBzuyPPArVhvWxjlO7S4DmaEhLzarWi/ze7EGwWSuI2eEa/8zU0INUsGI4ywe7vepQz7Iq
aAovAX0d+f1YjbmCVsAwjhLmveFjNwIDAQABo4IB9zCCAfMwHwYDVR0jBBgwFoAU95uiTtOXxfQ0
D0MOgYXOkZMyr/kwHQYDVR0OBBYEFFxiGptwbOfWOtMk5loHw7uqWUOnMDAGA1UdEQQpMCeBE2R3
bXcyQGluZnJhZGVhZC5vcmeBEGRhdmlkQHdvb2Rob3Uuc2UwFAYDVR0gBA0wCzAJBgdngQwBBQEC
MA4GA1UdDwEB/wQEAwIF4DAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwQwgakGA1UdHwSB
oTCBnjBNoEugSYZHaHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZEcyU01J
TUVSU0E0MDk2U0hBMzg0MjAyNENBMS5jcmwwTaBLoEmGR2h0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNv
bS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNBNDA5NlNIQTM4NDIwMjRDQTEuY3JsMIGNBggrBgEF
BQcBAQSBgDB+MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wVgYIKwYBBQUH
MAKGSmh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEFzc3VyZWRHMlNNSU1FUlNB
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
hbvFo68doFGEeXipS/+ADRwAAAAAAAA=


--=-5Y+JCENTnr/fcJFpYw95--

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794254018;
	b=b6VuPsOgXn6BRoFMIoS2zZUwneM/bMQ/Q3Kvcz1ngSU2/IEy9ByQmU2dkkkyh9U5td23
	 Tw3jMi0Xrqhb8GxEGG9GRlsq7kKpfMjWjJwHKiI3OlcvaNj1miuFfX1xbkD6zrp+gX8K3
	 zLtCnIghQroOLF0K8YLdtXM2saUbT1fqLegkq6Wlq59WYaiDC2N9HDAFU8Lud/SewCpNy
	 LOmWl40RrPrTLsy+3m/23oJ79/DhxP+3skIbfhlqXeY9fU4tJ5YTl9/daHrDciW7t96D/
	 7e4CKFzgEQRvVrOF1pVIkyV4ogNR0jCK0KUdiWCccJ/etZ4oa/rjJ8miC7VMPDWMP2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794254018;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=hOfIjd3SdwiNc30Pr7TP0N0JxRePoyYqLx/YJ5bXmhU=;
	b=5CPU2mW9Oo+KeIOIr+oJzrHVpEbGc8gxe/foxCb4eucqDRf2Gb72dlzTdCZUhJHAhvAw
	 LcSzUn3fVdMFnG9EG9ulbbOBT9WJzTel3Q7ZW1oQaKvMnS+2bKaAi0IJ3mXxicDtsZDmu
	 YlLkvBcSt32GdC3FpG29SquAHGsBjNpOungPZdYMbtXo641+/iEHz0W6yeEZPGB3xMhwj
	 bBN0zbZ6ycu5yXWJk2eCSTdGqNSl8HTvw3mN0jrs23CxrBi7GdjfUq+Cu3A2gO7eLK70S
	 cEnYQlCr1fq3e+ZpQZW3xQr/wtWdFXxcO/Sb9gie8lZ7Ooyq/zsoqshBWIFXWXq4oWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IMYwcmS+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7BVfbS4Q;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8CE606A338;
	Mon,  9 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A8CE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=IMYwcmS+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=7BVfbS4Q
Date: Mon, 09 Nov 2026 19:53:34 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794254016;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOfIjd3SdwiNc30Pr7TP0N0JxRePoyYqLx/YJ5bXmhU=;
	b=IMYwcmS+BEi/yRdwJnK+YfSnTOY28CADSW5u0Tjl5RsgNDkr1He/OcucNFRjG7f+BdToh/
	YYU1z/yQrpBdE2c/ffVa/cldA7StjUalstc9hY+jGc1MXXb/XZlw1mcTPac97B7oXc7yUn
	mXL2AZpP775ycB5ttXcs8NkgZiDBDqSbW9Kx9Wlz5zen0L0ALqmhXAWiuSHqHk7MPX42Ul
	snBDP3Lqmz2EBukU1H7U4aY5SrwW4Nmio5wcP7x9RmgERLRck/4Bwkr4vxVh00T+iA1fho
	KIrOAzx6eYEGtmTrHxpHqVaxjpEmlP+dJRZAFjPxP6DK6exGp6zJsG8bp+47wQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794254016;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hOfIjd3SdwiNc30Pr7TP0N0JxRePoyYqLx/YJ5bXmhU=;
	b=7BVfbS4QWlrHafFSrvVaobZd5jsq9mmBX1f80g3jpzD2e5Dd7CUkNriI//Sk+un9bGHtZo
	TTkY5tfSUkECQ3Dw==
From: "tip-bot2 for Daniel Syauqi" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject:
 [tip: timers/core] selftests: timers: Skip raw_skew when adjtimex fails
Cc: Daniel Syauqi <syauqicode@gmail.com>, Thomas Gleixner <tglx@kernel.org>,
 John Stultz <jstultz@google.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261007111611.2086-1-syauqicode@gmail.com>
References: <20261007111611.2086-1-syauqicode@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425401434.2093942.3760909325069139116.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the timers/core branch of tip:

Commit-ID:     ebc02b51eb7b4e1478b6973aed15f60882ef9cd4
Gitweb:        https://git.kernel.org/tip/ebc02b51eb7b4e1478b6973aed15f60882e=
f9cd4
Author:        Daniel Syauqi <syauqicode@gmail.com>
AuthorDate:    Wed, 07 Oct 2026 19:16:11 +08:00
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Mon, 09 Nov 2026 20:21:47 +01:00

selftests: timers: Skip raw_skew when adjtimex fails

raw_skew reads frequency and offset data from adjtimex() without checking
whether either query succeeded. If a sandbox blocks the syscall, the
test can use uninitialized data and wait two minutes before producing a
misleading result.

Skip on either failure and report the syscall error. Preserve errno
across the newline printed after the second query.

Fixes: 51f91cbdf545 ("selftests/timers: Add clock skew estimation test from t=
imetest suite")
Signed-off-by: Daniel Syauqi <syauqicode@gmail.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Assisted-by: LLM Codex
Acked-by: John Stultz <jstultz@google.com>
Link: https://patch.msgid.link/20261007111611.2086-1-syauqicode@gmail.com
---
 tools/testing/selftests/timers/raw_skew.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/timers/raw_skew.c b/tools/testing/selfte=
sts/timers/raw_skew.c
index dfca3e2..a61f6a0 100644
--- a/tools/testing/selftests/timers/raw_skew.c
+++ b/tools/testing/selftests/timers/raw_skew.c
@@ -19,7 +19,9 @@
  *   GNU General Public License for more details.
  */
=20
+#include <errno.h>
 #include <stdio.h>
+#include <string.h>
 #include <unistd.h>
 #include <stdlib.h>
 #include <sys/time.h>
@@ -102,7 +104,8 @@ int main(int argc, char **argv)
 	}
=20
 	tx1.modes =3D 0;
-	adjtimex(&tx1);
+	if (adjtimex(&tx1) < 0)
+		ksft_exit_skip("adjtimex failed: %s\n", strerror(errno));
 	get_monotonic_and_raw(&mon, &raw);
 	start =3D mon;
 	delta1 =3D diff_timespec(mon, raw);
@@ -117,7 +120,12 @@ int main(int argc, char **argv)
 	get_monotonic_and_raw(&mon, &raw);
 	end =3D mon;
 	tx2.modes =3D 0;
-	adjtimex(&tx2);
+	if (adjtimex(&tx2) < 0) {
+		int saved_errno =3D errno;
+
+		printf("\n");
+		ksft_exit_skip("adjtimex failed: %s\n", strerror(saved_errno));
+	}
 	delta2 =3D diff_timespec(mon, raw);
=20
 	interval =3D diff_timespec(start, end);

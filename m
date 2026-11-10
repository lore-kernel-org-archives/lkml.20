Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298819;
	b=Msu4pWWZQdH+P9JCOErM07BpiPKQA3h8Qj70VY08aFIJ+qawH4Ydt86OoSd1omirRtuc
	 JWFHIeotP4+wTWcbu7RfLtRUTcmpWtGqJRYrEZt3zZ9ehjDc7OSnKYt8wC0/r311mVfje
	 mFU+CScfE24JBU+ygPApR3owkQF2F5KkZiaGMeumN9ayFhJ+EQL9n4LXQdodd9eQCd/kj
	 RxI86ZFhAh550xnkmZB8OhqN6Z4Omu/6zCeCWwh5mFGH7A11CWAB2yofPuhVQcWEQ39fX
	 9x7Tpm2OdeY9LUCKzTJYR3eg3YAk9UjupfWXMmpVpfwFPdghvcJRgqESxDjnY6dfJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DiM6YP4+CBrBTFVeBZJ25fnu2+VqmiWWjax4Wxfqkno=;
	b=UALtVybJHzU5N0lX0DLTcNLH4wLbgALixpzHF4HtMLq1kVpP8JprdV9cWLv6iJK1k67T
	 JmxDX4v0m6VmpXtz8qe2aZFs1jIUSxNuC1gBRmlyRBUXnA0b7Czl+PNfP2ALj0BeNgB8S
	 oy/p6Pn2gr/Z2R7ft0cpDcfLE0/1TnMRusT4XOKq4RvdIhvM9MVpDuJ4A+QPn2bWECLWS
	 4/R5+l3upk2YkWPqOoZCVJhn7FAqDRA2MWNTor52ptOp6lJ6f5Ugl+Z/V4bZfLppe4Vyb
	 35jCIagXgpwBDYpVAzVd/Q6uBusUFlRwEDxREnkx/NcuIdUVQkTgTbzgu7zLu9dHzrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CzXhwZFJ;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05046606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05046606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CzXhwZFJ
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8871ada1a26so16735887b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298818; x=1794903618; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DiM6YP4+CBrBTFVeBZJ25fnu2+VqmiWWjax4Wxfqkno=;
        b=CzXhwZFJen+WMza8xTBvYfPZOYotMskv4Wt22df7oe4GD/fc9sB0wGaoBIsmfP5kV9
         7JJ+JREM4BkB51IK9ZpOAYZvu+8vEtF5BlN1R5Iz1w7TyNBG2/uHeFZ5OGXzUDXxeCM4
         S+czdU+6xAJPzWHAvWDUZCs2adqic/EAHeDxeyhqPSP52yX0VVnnPx5XwB2wQmV3mD/d
         Zm8WrC8spF1WNhraT1AzPUopwzC8pDeX8HadORQBmuH9IkJA5TMmOV4Re1u21BRVB33v
         Bobn/od3CDkwog4dFD1NwDjYjEM6BItdfyuEh3C/IP25GKWYYUBfD75lE42rDoK+dJxG
         lu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298818; x=1794903618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DiM6YP4+CBrBTFVeBZJ25fnu2+VqmiWWjax4Wxfqkno=;
        b=We60VMXsKq7IVaSG7sS/R/gDLJeAM5IoPXs6hbRy9eNaY2S9UQuR/l2sh2EWpmrQGR
         XwrUtCvuiOdErKy7sdmwEq2K05BmfBMVRTFja0S8zhhlIt1HboQFfrPWb75En3EbTe7z
         x7aSULbI4t4MYLB0Jv58JfGMeLgZrG31bMDH3RPYrCaMwRHfv+8OLILYc++AZdG2CqER
         A1N5kfeV5lehX29tFxjFDKW+ixshQuc19qqYxSfDWKmOkUlCLfz6LedUYv7nXPSsI/sP
         aFyVpgCFKt9dNDrTJHj5pAyM3lwV3XEcba3pYgt5slkxuXkDmdFqCCpX5Zj4rdcE1PDp
         JyTw==
X-Forwarded-Encrypted: i=1; AL+hErHnuGAPhGEqtppmga3MCGZKEBiL+4fZpiAZAJUA2eRfdfwybWLklty3N3bBvFqEXQrTa0niZgPJ3goXoSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GLYSZadXqI67T2CzWTvE+Ejot2SVICVeySu17Jj0xpWxN+OIT
	lCd7ZnHX0UNo0ZeexLzsHrMDrCXphfZDZW/0/lJwWcuMl/Nw7Yior6eL
X-Gm-Gg: AYBFou19ot+C8J7OqlpHJ9QRV5vs1XErUA1WpVbAXozr0/h1vtLYHIEze7+wkzNnmdb
	CkghVoMrBlypZGM0vMRlHNYv92BzCLEEplvkEB35BZQiH5Q/OCjJG1pLx7RjhD75iJHr7ZZyyCR
	6MriidYwBp2Wtqsj9NZLC0TEsodwHhsG2Qf6XzBpkHK4+B2YFeXOJREfQmG09DJKxG5AzhcaIBH
	ewWq6tRZnccRujMAGsXHGR07pPsrvnIn+1IbD74c9cOgGmWRHBnQvhc4rsb8kWNTCPnPeilqqin
	4mutUJEBbZdJDM3O3TGrkmIp3qi5tW6fJe1t89uVFmNFwty2q7nl82WplQ9dc+MfR62d2t6YRyZ
	7WW6nHK//wj7dGh1oOoE/C6y1jy+IJkfJZfT/3w4FHrf/FeeY2CMhQVN3d7dMex7CnAylNQR/dl
	jAJFUP45Tl+l5mUZAZCeRoeNvBiTB0Yf6lx7XyHGwo0JV0jezmQja/tj+zONVH9VYVN41SSQxCs
	MA7H52lJI9dKiMw7q3znHDmxiGSeACbKSi2LpL+UcG7bwHWZ+nuTmr/qvGYSUHECNbVhuL946It
	2C1VJq6itm0j3BU+WrhTyM1Ye+MNbXbakh5pPIA=
X-Received: by 2002:a05:690c:fce:b0:8b0:f1c0:60b1 with SMTP id 00721157ae682-8b392b04348mr10481377b3.60.1794298816905;
        Tue, 10 Nov 2026 00:20:16 -0800 (PST)
Received: from bridge.. ([2804:14d:ba6b:8339:dbe0:e4c5:1b9e:1438])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b393437e54sm13910647b3.35.2026.11.10.00.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:20:15 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: Jason Wessel <jason.wessel@windriver.com>,
	kgdb-bugreport@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] kgdb: Fix buffer overflow in the qfThreadInfo packet handler
Date: Tue, 10 Nov 2026 05:19:46 -0300
Message-ID: <20261110081946.38783-1-christian.aurichzm@gmail.com>
X-Mailer: git-send-email 2.43.0
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

gdb_cmd_query() answers qfThreadInfo with a thread ID and a comma for
every online CPU, 9 bytes each, followed by the first page of tasks.
Only the tasks are paged, KGDB_MAX_THREAD_QUERY at a time, so the CPU
entries overrun remcom_out_buffer[BUFMAX] once there are enough CPUs.
On x86, where BUFMAX is 1024, a typical boot hits this from 109 online
CPUs (222 on arm64 and riscv), and GDB sends qfThreadInfo as soon as it
connects:

  BUG: KASAN: global-out-of-bounds in pack_threadid+0x2a8/0x2e0
  Write of size 1 at addr ffffffff86eecc20 by task swapper/0/1
  ...
  The buggy address belongs to the variable:
   remcom_out_buffer+0x400/0x420

Page the CPU entries together with the tasks, with one helper for both
loops, so no reply holds more than KGDB_MAX_THREAD_QUERY threads. The
CPUs still come first, which scripts/gdb relies on to detect KGDB.

Fixes: 25fc99991383 ("kgdb: fix gdb serial thread queries")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Changes in v2:
    - Move the shared paging code into append_threadid() (Doug)
    - Link to v1: https://lore.kernel.org/all/20261103190622.925741-1-christian.aurichzm@gmail.com/
    
    Tested in QEMU with KASAN and GDB 15.1. Unpatched, connecting GDB to
    a 109-CPU guest gives the report above; patched, 109, 128 and 255 CPUs
    return the full thread list with no report.
    
    Based on v7.4-rc1.

 kernel/debug/gdbstub.c | 45 ++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 21 deletions(-)

diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index fc6a7a8c1f6e..679fab102760 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -732,6 +732,22 @@ static int gdb_cmd_reboot(struct kgdb_state *ks)
 	return 0;
 }
 
+static void append_threadid(struct kgdb_state *ks, char **ptr, int *i,
+			    int *finished, int threadid)
+{
+	unsigned char thref[BUF_THREAD_ID_SIZE];
+
+	if (*i >= ks->thr_query && !*finished) {
+		int_to_threadref(thref, threadid);
+		*ptr = pack_threadid(*ptr, thref);
+		*(*ptr)++ = ',';
+		ks->thr_query++;
+		if (ks->thr_query % KGDB_MAX_THREAD_QUERY == 0)
+			*finished = 1;
+	}
+	(*i)++;
+}
+
 /* Handle the 'q' query packets */
 static void gdb_cmd_query(struct kgdb_state *ks)
 {
@@ -752,28 +768,15 @@ static void gdb_cmd_query(struct kgdb_state *ks)
 		i = 0;
 		remcom_out_buffer[0] = 'm';
 		ptr = remcom_out_buffer + 1;
-		if (remcom_in_buffer[1] == 'f') {
-			/* Each cpu is a shadow thread */
-			for_each_online_cpu(cpu) {
-				ks->thr_query = 0;
-				int_to_threadref(thref, -cpu - 2);
-				ptr = pack_threadid(ptr, thref);
-				*(ptr++) = ',';
-				i++;
-			}
-		}
+		if (remcom_in_buffer[1] == 'f')
+			ks->thr_query = 0;
 
-		for_each_process_thread(g, p) {
-			if (i >= ks->thr_query && !finished) {
-				int_to_threadref(thref, p->pid);
-				ptr = pack_threadid(ptr, thref);
-				*(ptr++) = ',';
-				ks->thr_query++;
-				if (ks->thr_query % KGDB_MAX_THREAD_QUERY == 0)
-					finished = 1;
-			}
-			i++;
-		}
+		/* Each cpu is a shadow thread */
+		for_each_online_cpu(cpu)
+			append_threadid(ks, &ptr, &i, &finished, -cpu - 2);
+
+		for_each_process_thread(g, p)
+			append_threadid(ks, &ptr, &i, &finished, p->pid);
 
 		*(--ptr) = '\0';
 		break;

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


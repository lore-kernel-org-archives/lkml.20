Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848127;
	b=VDQmLgd+7yYFs5YXO9VgioP2Tqg2O/kCa5Chlm6lOWlir5Mqs4/NGxEhsASgmJUjGY8I
	 s+vqEdyXBLflEIdU52hw3jayZIry7WnouYSDloZTkf497b4dgW4FeVNY1uxy3IEjl4lx+
	 bgrIVB8riZ8usMw2s87DRrzsvSm80sSCT693w3p8Ir7AIaey1+G8VGlMVZUW7riltS6Yt
	 PTeUcItOZPtYRjFAb6C//B7iaUuk9aP7HFvHFWVblwgmdf7jOpsMybyUaRZWqrwSxbL7R
	 TTXm9Zjg7mNkH/XKm6Avyr5DWejVYN/8UGwdkzWxp301bRrcwd6ArInx62VH/YJMaOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=dk+WGnu7U2he9A5n6a73SfgBiibQ/uVJWoRKp23Ly48=;
	b=GS1s5nHnz5BJ/xbvHLhMmC1/Na0U3C32GgI50upy2WFuH9HaLSHe6O/l2RPZLLb0KAN1
	 xYhgeG6rdwgclS0DnHvenqNqRl9EY9T9cPahrM7EMeKFqZxVAJ73wOlbmyREsJpN55fi3
	 dvuTgxmGao/5rx/CUZf1E2FwPlGk9BAGnx4WYacyI4uAVM0A/MN/IpODfv8PoFG/Wv4dg
	 JEOdV1taqAV0PVrSGDYJNmqP7WWfm1ubrM1csgVRbXpb4/3saK1IRP09xEm6RX6dPfzPw
	 sLWpbup3PqpsEWGn/RM6dskVLa7QVDEiwhVHmsb0vi57UXuvGi7yjK6kI6sWKi0ymkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wakel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CsDcX3nK;
	arc=none smtp.remote-ip=74.125.82.70
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9757F606A33D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9757F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wakel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CsDcX3nK
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-147be78cd56so2600220c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793848126; x=1794452926; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dk+WGnu7U2he9A5n6a73SfgBiibQ/uVJWoRKp23Ly48=;
        b=CsDcX3nKRwdsdG86VswautjP8KAHQT3Hml41XXUq6KT+/IgwmNTOgGJet72r0trjJF
         Bp37X+qDspYxqVKP4ZnvDCJiS1xPKFYkydMBS+k60j42JrIhDGkb5u1m2729gJx6HDys
         RLZvwTcP2pZr76QoeCKoMaWFDKjsWvmfFCVFmHmXlGCJU3LNvFaPrBiik+8lOs+IG+tN
         sBEBeYDXuK7ZClGvr+9+sFEQIyMW5NNYO9u9zr/m1au+oxDEJRVgZzqaK/guUQ8UK06B
         8JJCH9a6lwaBGzTW3gbZo1iKOwu4mZ7xLwBSzkPLAavx8WBtW4h9RS+Rq64UXvrSg8zv
         W0KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848126; x=1794452926;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dk+WGnu7U2he9A5n6a73SfgBiibQ/uVJWoRKp23Ly48=;
        b=GHpuPDx9yFgUcHRdVBzGNsWU20/6tbRTZeE8uX6wDe+rfB494kn7ITXqB2M1p1TNKe
         LgjX8yKCIg+zPR9BsJdeP0za/XB8eNub7+kBOXLWqPv4aWO4ZbMn0DezeTORi2TC3S5r
         hHIXgPzbqgi6nHKfloiNkFPxbuAwf6rAq9yfpZ8+g/YhwY10d1VLf/qosO0g4RWwSoqz
         CY07JiQD7gmWC6363Kwyjc+egtZ+uxlm9Q9k2/GX67xVLOw7H1V/dGq9kDV43gM46Fie
         K5ZkeLisoUH1URmN92iQVpfkKqVhJPq65qjYpBGyao20KwsN9Hqz35HXx+aCHLJGUTXO
         iihw==
X-Forwarded-Encrypted: i=1; AKwUvBzMrJ58GhnU8Eo8IorAlEx+LryRLcddenX7anW1Z/kRK7fwe1cmwWs30l6peebY0cpyMHaHbVDTuPz+OYY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SWB4DTQSlKicMvH4uDQzej6/nH/ya7nka/XiuXk2lCzecyWWX
	RsftoBZmjEKwLrt5jUnhHI1flA/U3obo2nt+edT3vv0y3UmPutpso5Htng5XjYq2yEAXQp58zf5
	JcA==
X-Received: from dlar7.prod.google.com ([2002:a05:701b:21c7:b0:195:8b4e:20b7])
 (user=wakel job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:208a:b0:1b0:4272:4282
 with SMTP id a92af1059eb24-1b042725256mr18017569c88.17.1793848125583; Wed, 04
 Nov 2026 19:08:45 -0800 (PST)
Date: Thu,  5 Nov 2026 03:08:43 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261105030843.3319056-1-wakel@google.com>
Subject: [PATCH] selftests/memfd: Rename local union semun to avoid bionic clash
From: Wake Liu <wakel@google.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Aristeu Rozanski <aris@redhat.com>, Shuah Khan <shuah@kernel.org>, Aleksa Sarai <cyphar@cyphar.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Carlos Llamas <cmllamas@google.com>, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Wake Liu <wakel@google.com>
Content-Type: text/plain; charset="UTF-8"

Commit b24335521de9 ("selftests/memfd: use IPC semaphore instead of
SIGSTOP/SIGCONT") added a local definition of union semun, since glibc
and musl expect the caller to define it before calling semctl().
Bionic, however, already defines union semun in <sys/sem.h>, so
memfd_test no longer builds against it:

  memfd_test.c:45:7: error: redefinition of 'semun'

Rename the local union to memfd_semun. Its layout is unchanged, so it
can still be passed as the variadic semctl() argument with any C
library.

Fixes: b24335521de9 ("selftests/memfd: use IPC semaphore instead of SIGSTOP/SIGCONT")
Signed-off-by: Wake Liu <wakel@google.com>
---
 tools/testing/selftests/memfd/memfd_test.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index cdab3a837624..188cb7c32db1 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -42,7 +42,13 @@
 		    F_SEAL_EXEC)
 
 #define MFD_NOEXEC_SEAL	0x0008U
-union semun {
+
+/*
+ * glibc and musl leave union semun for the caller to define, but bionic
+ * already provides it in <sys/sem.h>. Use a private name so the test
+ * builds against all of them.
+ */
+union memfd_semun {
 	int val;
 	struct semid_ds *buf;
 	unsigned short int *array;
@@ -1387,7 +1393,7 @@ static void test_sysctl_sysctl2_failset(void)
 static int sysctl_nested_child(void *arg)
 {
 	int pid, sem;
-	union semun semun;
+	union memfd_semun semun;
 	struct sembuf sembuf;
 
 	printf("%s nested sysctl 0\n", memfd_str);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.398.g882cbad275-goog


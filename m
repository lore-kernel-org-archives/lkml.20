Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342259;
	b=WDFxsKi9r/0U+if4IJ+0b4yI184ZM7I+RLmZrHVocRtwH2QuTUTNbZlNPlra05Q6YivP
	 MFW4v9ULDdPpm7e+uEKehZmwzdEPxTkgkFmuGbydQ07LXG3enRytdN8jGwwAkwS7lwoab
	 OGu8t0hLdYQHs0ySAG0Lfa4YkFWqNzqK3nDx7wI3H22TvWvMIW5iMkwHuZ7mzZpA4HnTu
	 kchuHYUZsM5fRf2TGUvR5kjTGeL04Ds9HHvHQATTxvdTxViHhMPMjhxEPj9B3CUXCuVNv
	 IclxoDni0KTT/xHXXjB5XvImvxx/rApNR2kwwrFoqgU5E/DLKbuDbtzN0EYaTquTgGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342259;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U4CgF1MujLyKKs4MDsPCH+PRIQeRT4qSq6PrwqdYMBE=;
	b=fEwrOePjBRj0IG26fmGYoX/QDlkixZwe3Z+dn1IjiuYpLJ3ZWnJSxNueHEfAT9NdYDIf
	 u7F+CX2CejAMTsGiFkP2f5yfRb6eRW68bUXXoJ5NdAO//GYX//rSz06NT2MvBt5ZrUNfW
	 6GaaQnuvFY86w73tGMwHXneOXarmaw/M/7BXfEJ4Vw37OxPHjpQ3gWxUBN1MIjJABiVsQ
	 uMcuRQGPuAAw1GuQVjxOP1zp4R039ViWxNTnLwwkiLV0izIuoTxNJFZoEz7kwb73UJwvE
	 ZVKVANB/zw2OGEm4t1UZqj5ur7vCPiQ1iD1wxNx3NYnuK2+qW2bMO3113ndJuGvhu4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H4hDUkdU;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50844606A8B6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50844606A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=H4hDUkdU
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so1837746eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1794342257; x=1794947057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U4CgF1MujLyKKs4MDsPCH+PRIQeRT4qSq6PrwqdYMBE=;
        b=H4hDUkdUIfu1aeYFa/L+wCqKQAJ0W4KsVOg5CzXESlt1fRutvTVtYX6HvPZVIukiIO
         9ZQslFrDJ/ij82d33lbDyU4lm3hmMo6nIxPv+EklBZBOgqEKd6WpxDDNonBK91F4NWqm
         yJmBkHqDm30KDaioG4f9vYO/ei5iwzPZrlK4OEbR1x825UVqbEO5q8dS6FPQDq4qTtAO
         EOmQzGzoF64BZh8t+lpu071QWr/0F4T5s/8zAAKXsT16PiV/fwwbfXRy/WpLSVfSw3Nk
         RTAJtZNQNuRHb40nWwdtrJO/D8Fw2pGjTRmWlT3X/bRkbsBFLpqJf++BrNFyFVsupyOs
         SIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342257; x=1794947057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U4CgF1MujLyKKs4MDsPCH+PRIQeRT4qSq6PrwqdYMBE=;
        b=pfvuZP77mR3vtcIwPT7WV/FCyxouyopAYTlnJnu+Zw2dJUv6GvZiJYbl8MrwrHQ1pX
         l4k2JVTVpNZDFX3VGSzwFSNMxyf6dTRjeDXhnP82Kctojp+whXGoaRjWde+OrbkTZOii
         2uGI6llgNQY3M9c3558xSqj4Rs75bsQKyvmKOkpHn0iwz3twoP9N+oNvRxmSIr4CnGZg
         jsAcsjAIWD8gAAd+6fFsWmKYizzxZbodFmztHYprHFy9PE8D2e6+Py6WVDsnXdoMwZmh
         WvnDMDwjt6DAwL9KMkS107RtgLYBL2ilYyFZoeUfn8gsAe1Jr/8y9/oej8sRu2koRTTe
         BqnA==
X-Gm-Message-State: APuU4Z+l6EiU6LNoO4qiOsU04Tn8lMr4TfwDvNN5WkrEwIlB1i6dPWUf
	xai3JGdTgbtZ2krpz+qADhsbwN4YcrYZ5oZ6bapyA1eokduflv5xhyx95Bg0OriAruzPhKjAMQV
	tTXfGMd1uHpE=
X-Gm-Gg: AYBFou3UqU9xKR4/xpaBBGX/ckbdldZQNCD9O2SYojfEW+wTqWTdEGetcQMaVtPYIsP
	2gUxT77y3itPU3u/Mt7RFrF36WkGgxUxE10FP83qnQ4MDJrLceGCqqLCSPFURKMgHzlKD5fJUE9
	oUtb+WqqxR/aqXXuY0sRfcbSOFnXzTD5AcDxfl9CTYcK2ILVKqZbxvd92bec8/rNK4uomXbBCpm
	m1xR9LSVkLSNBn0XLw7yO2WOjb1TLvGAgQ5x7iT5vXMvJL0bBsG4dZEAC4fZjaQkVAbjhcywK+m
	tM/wj/IEw5XASv+GR0QA1YrMlhYKYZLqgvk37kh3ckWghg26mO0C0ZKTXNqS8bG0gfCW9/+1LGT
	3uwrlbNaWKWlHnqr3TLFXv2VCeaFbsG6lQDfXCchLzs425uBR7mQRWFBzefKtngv30leFKLwZQ5
	KikpWbkHFlGsFQPZPCXec45ELn2NjlDhyN3+2PmVNNZRPzqil5whEfvJijwwQXU2xNxlwaKLmei
	eCBT6KS5xSAKtLZ5XHbHvA3JXYvMOBLMzsdVB3u+jEBChHwEKjlK+h06kqYQ/FvuxD/yMWTSHP4
	x/kXaB2eRVHjBvPaJUsuVf3s0qx61O30tSmIJeHz2Uw+fPdhe91C+YyNH+zaLyEadjMz5vPPF7A
	4YK09hzO5s/ahUop/kp2MWYLhTuwxkTSNapLYSK1jA2CtWS7Rc1aGpA==
X-Received: by 2002:a05:7300:b282:b0:368:2548:c08b with SMTP id 5a478bee46e88-37685896be0mr560200eec.21.1794342257246;
        Tue, 10 Nov 2026 12:24:17 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:147:2742:6545:702a:2431:7dca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfe29fsm10076615eec.21.2026.11.10.12.24.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:24:16 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>,
	Kees Cook <kees@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Mel Gorman <mgorman@suse.de>,
	Suren Baghdasaryan <surenb@google.com>,
	Ben Segall <bsegall@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>
Subject: [RFC PATCH v3 5/6] kernel: add KAP checks for unshare and setns
Date: Wed, 11 Nov 2026 01:52:45 +0530
Message-ID: <20261110202246.274-6-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110202246.274-1-harisudhan@armoriq.io>
References: <20261110202246.274-1-harisudhan@armoriq.io>
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

Check unshare and setns against the bound task's authority. Neither
has an LSM hook, so they call KAP directly. Every namespace type is
checked, and setns checks the type of the namespace it is given.

Unbound tasks are not checked.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 kernel/fork.c    | 4 ++++
 kernel/nsproxy.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index eb198c8..4216a2d 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -52,6 +52,7 @@
 #include <linux/cpu.h>
 #include <linux/cgroup.h>
 #include <linux/security.h>
+#include <linux/kap.h>
 #include <linux/hugetlb.h>
 #include <linux/seccomp.h>
 #include <linux/swap.h>
@@ -3276,6 +3277,9 @@ int ksys_unshare(unsigned long unshare_flags)
 			 current->fs != current->real_fs);
 
 	err = check_unshare_flags(unshare_flags);
+	if (err)
+		goto bad_unshare_out;
+	err = kap_check_namespace_flags(unshare_flags, "unshare");
 	if (err)
 		goto bad_unshare_out;
 	/*
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 3fb1595..d41d7f5 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -25,6 +25,7 @@
 #include <linux/proc_ns.h>
 #include <linux/file.h>
 #include <linux/syscalls.h>
+#include <linux/kap.h>
 #include <linux/cgroup.h>
 #include <linux/perf_event.h>
 #include <linux/nstree.h>
@@ -589,6 +590,10 @@ SYSCALL_DEFINE2(setns, int, fd, int, flags)
 	if (err)
 		goto out;
 
+	err = kap_check_namespace_flags(flags, "setns");
+	if (err)
+		goto out;
+
 	err = prepare_nsset(flags, &nsset);
 	if (err)
 		goto out;
-- 
2.53.0


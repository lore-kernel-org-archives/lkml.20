Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780479;
	b=DosmbaLdWV6l8bM/6HRkBrExoXPZ/CtBJCz4tXf3PEh/6YXH/Nv5AWp7J320Q/8smvrM
	 jSzSCSQgWFWiU132H5VxA4oC7+QJ5nsUohW3QkPd/V069iMc47Tn2smg5Lu7NNPxyAVVV
	 Wsx/KIDkC9HjmdIFHfAhOFnoxQqHRwSzu/mfVOncRr5o+12sIbbWLm9hEjAxGifzbl2sV
	 rYitUQSA9Anp0vcCozbAsfvCcEXkCIn9O7TojyrVT1SHLAGKkwq04+Hby/T08F/Lg2Zz0
	 OHjfMFwEWUWkfC8l+s25NoQduDVIJ6xHSdG1GuwOe6yT+IE9GkFmVBr+Me7OdsaOD4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=75mO7UG1vq+0X8jAgs1gX8uFdOb25/StouuKNbz6JpE=;
	b=SHOe6psDbw2uZohrG3wjlrP0bTQhPslFppIJ0ZueB1dKsIVB28KVk91nx1iOUKMhMAAd
	 7a9EngbjNH1e7HJRavG56gFkXMudyz0ONRGb1kkSSLkn8/YnJ7q45WH8YzIwR16XrRnqi
	 IcRdyrfmtSynfJGUUkKUPpkDLV7eDNdPEd7x2zqevDZG/s5kAiVOy0Y51zHYNn1hjRXW+
	 l92tpoRgJ+6ArOuqWciS/dBdXw6BA8qta4Vs901D8LD9+aZbtbrncLpGI+IPs/hXxA9YM
	 vBbjsiiTSeIJGGnMcXdGMEsAloatMdm3a3T0S+d4evci/S8k9CjzovtrtGS1IyNVSoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTjbPWgY;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A8A606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52A8A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTjbPWgY
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso9045525e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780478; x=1793385278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=75mO7UG1vq+0X8jAgs1gX8uFdOb25/StouuKNbz6JpE=;
        b=KTjbPWgYAawsd7VLvnr57xCEXN4cQkVOrYV5Ymkgp5sgasW5Ulc9IxJpX3cDHDMs3m
         o7w7+OJz2PUuV5BqKOisJR28/mtmTua1uahZBlUQFhmHYjgou12MUfgx/tDHt5JeCWg9
         tYwtmoEpjuhVauVRqSOF0xEHUEuPQpyWD3E8Gep3JJUHD3B3rtjzxt2bDrkmWn7grpcr
         R6hlfE8Dy19iXgG0nKWYXng8pRnMNrTO+98CFmLTufK+sQaD56lWquCmtk/8c+zUH4VY
         WEHAONY0QbrHEW5WWjAnU/cwkYP9y0ANIypygetbm7PmatQ7hJjKhWgMpG31XKRZWbrl
         eS2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780478; x=1793385278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=75mO7UG1vq+0X8jAgs1gX8uFdOb25/StouuKNbz6JpE=;
        b=nGVTtSOyzboMVN6bgOM3TrL6lSQVhIl+bE+LAFAnY7vJIYiNUF12xhBGueD+1KlONQ
         GDSJLR8OVNW3VoxkMEewjLhlEGUt077j9YfbCTc5J5f773w4mGDRXuJkSXYjYdOdC2so
         xNg0eWCmYvRfJjyqQp90g1AIKwFQRLE31okDPmIre9SuH8eWEX+EwaG/rdPAavr+0zMg
         4wJGOKDsc19sgr0J4d+9IJMyRjpVpQoeGohDCz4o0lYT9F8QDH9LiOutUd33AqU7h0Ww
         6pjKgIc08ZLGJe5qTK4YWe38/rBX0H5+ujr+gfuD3dBAWWhnv/KJDZ+COMrBoq0QIJS8
         7I1Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXByLDenzGrDJIIZ9RG7uIxpZ3L138+rYdW2N4YoB1SaIiSn4nqjXFv4XPvX6btkTYkszBzPlh1l+TKo4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgGbeX4DbW8KI8/ihQa7kmfPvL9SPMYxCBZwLym4FXF3mCg1z8
	AyhmSzHXFAhDErhZszWRrVWPkzg7LcAyKTuuPAtfe0wtrADgkVmJJr+3
X-Gm-Gg: AYBFou0VKWOuVg/B4xT34ru1c7lJmj+dEF5P2Qmna5kdz8+5bgyRzJifGI+Stk0Fy88
	yjpFbD4Uq9qXV3zYiygYbK+XmTG+45fqFT3QVsi7qrXxnnpsBp0NFQI4WafG+4SDHjE+dvstkTN
	H3nd2vxVrsC+8jCvQh+kfnnmxOlSxDXFmGc0KcFK2nM9ULO8HuOh6o5hh6dxuyLJHX92sGhGLxH
	lpdSZKePBOoaXiCgMY0L5AQx7TuJkZwftqIH3F8dmHl6sDGoJIHd/x4OYm32yvTyIyBNPB+2lR+
	sNYjeg4R++ulwM0aOAtSBO+8jj63xOHNGKPGI1U0Q4IgQmaIyF8L7PbrrdeOE6iO+d+Sl9e86M6
	lt94aZucKypvqIx3aGPv92HHzI9aKq5A5TI3W31RdCX0hRdn3Z4qYc9cEz2+k8lFlzbhazv1LsN
	jzo5GuWnFlwIX/EJYWB5LcoC4B561knxu2XEMeik1xvBFMIOa5zsnpQtSRTnP8e24CDjd3NqSG2
	rIZ/a9LfBcVHRpRKsyPtYGmEdzRNNP8TO+LWSX5mr+IuuZKMUqTQkiLXTrOafgQYW7ORNGAzPTz
	JsPaQde77eHC58MBk1phdm+ZzVLT
X-Received: by 2002:a05:600c:4f90:b0:4a2:1a:a11d with SMTP id 5b1f17b1804b1-4a211bb82ecmr57685885e9.0.1792780477504;
        Fri, 23 Oct 2026 11:34:37 -0700 (PDT)
Received: from DESKTOP-IR7J1S9.localdomain ([105.98.0.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a08013esm1084415e9.14.2026.10.23.11.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:34:37 -0700 (PDT)
From: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
To: Alexey Dobriyan <adobriyan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
Subject: [PATCH] selftests/proc: proc-empty-vm: wait for child's SIGSEGV instead of sleep(1)
Date: Fri, 23 Oct 2026 19:34:33 +0100
Message-ID: <20261023183434.9109-1-drifabdelmalekmohamedsaid@gmail.com>
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

The test had a TODO asking for a reliable way to know when the child's
munmap() has finished, and used sleep(1) in the meantime.

Unmapping the whole address space leaves the child with no code to run,
so it segfaults. Since it is traced, the SIGSEGV stop is reported to
the parent through waitpid(), which is exactly the signal the TODO
wanted. Wait for it there and drop the sleep and the TODO.

The stop is now consumed up front, so SIGKILL the child before the
final reap.

Fixes: 5bc73bb3451b ("proc: test how it holds up with mapping'less process")
Signed-off-by: Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
---
 tools/testing/selftests/proc/proc-empty-vm.c | 24 ++++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index b3f898aab4ab..cf65313a25f5 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -41,6 +41,7 @@
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <unistd.h>
+#include <signal.h>
 
 #ifdef __amd64__
 #define TEST_VSYSCALL
@@ -500,13 +501,18 @@ int main(void)
 #endif
 		return EXIT_FAILURE;
 	} else {
-		/*
-		 * TODO find reliable way to signal parent that munmap(2) completed.
-		 * Child can't do it directly because it effectively doesn't exist
-		 * anymore. Looking at child's VM files isn't 100% reliable either:
-		 * due to a bug they may not become empty or empty-like.
-		 */
-		sleep(1);
+		int wstatus;
+		pid_t p;
+
+		for (;;) {
+			p = waitpid(pid, &wstatus, 0);
+			if (p == -1 && errno == EINTR)
+				continue;
+			break;
+		}
+		assert(p == pid);
+		assert(WIFSTOPPED(wstatus));
+		assert(WSTOPSIG(wstatus) == SIGSEGV);
 
 		if (rv == EXIT_SUCCESS) {
 			rv = test_proc_pid_maps(pid);
@@ -525,10 +531,8 @@ int main(void)
 		}
 
 		/* Cut the rope. */
-		int wstatus;
+		kill(pid, SIGKILL);
 		waitpid(pid, &wstatus, 0);
-		assert(WIFSTOPPED(wstatus));
-		assert(WSTOPSIG(wstatus) == SIGSEGV);
 	}
 
 	return rv;
-- 
2.43.0


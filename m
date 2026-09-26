Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953723451C1
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438146; cv=none; b=VOxA6B7JRTvOpn8iUOOoMv1Iemx6XAQfvc3q60mCTvILUWGiy8E5GqQIOOTXkdvDircqpDSE8ObE77mmPYpE7X+KPKuNEgN1qIC61qTQE/uEvoIc0qyBKABCQ4orJuGBEfoZ4UanJVdDMaGgTcLK8qP2wxtsyOihZs/MxgaNmgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438146; c=relaxed/simple;
	bh=pz7lKiug+kfyw4RvUQK+q1wYZURn+2I5w2W1ivVBNlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PExx54agdEEHfRVsq8+SzaIEVqsK3wOYmhq0VY1IVAC6N/UOnTZYXZlVWnz+O1fNtDRsNycQI1QyWV2sA3tOIvGQAAlSNPdKgtbB4CuSj6jF1bt/S7alecA6UB0u95awdyLniOVm49YW6lsPQ5F07iOP7ovkkRXKUEymInzC7+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKucldy0; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKucldy0"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1216238fac.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438143; x=1791042943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/X8WtMKO+kM8/RymoeclZdtD8nVgAtWR81xquL6WA4=;
        b=AKucldy0BSWrP7oNT8dckrFs2XKr+kPsLDTCwO5aTwfn9ZM6ypppS8GYXHvn6yFHIy
         alTTkc2FsgwFb1fSNIc9kg/cc7j9pzJ57JYZ4g0AB7KJFclLMz9hVpyuCKDU08BqBRjk
         7Q7ZdQHftrltt6VeVumPpfqMvLVjoqfVUukh+Zc4FjDCloK92TLr1WEDRQmUV1KcwnLM
         D9qoq9MG4Xxyr2mkp6G08qz6CAJUg+zf6dJNuWVQ+ZG0jYy6S+6upo2sKCGVcBch2CMr
         St9eoBvZnlT3sGRddYiCvEM79jH0ezgVCLOdTCOYweMj/P/0xMH1Ct3NbXNS+RI8kZBY
         mnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438143; x=1791042943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S/X8WtMKO+kM8/RymoeclZdtD8nVgAtWR81xquL6WA4=;
        b=SYIhe2Np+W6bGS3B/Fe8C4vtdSvVTdsI29+WiXYNOHjplEmir9QpLclmkqeKSyL8xz
         zJi6Z7FaY/jukh2IUWCIIIXNIioDZR2E4J1GoEREZbUerCV8iIGfNj+Chq+U6Nrgadm4
         guOF57YMfNeyHzsfRV9QadnvJZdCCHsbMiN0lSRIFJWMX6QjrfCB5rJ1iFXpuBrNcRT8
         KuIx6YB70IG3zKopsys8U++bYwrrpELWPX6RVeVolN6tqXE0eHOOTCIKM9fHuu35929q
         w8cJKV6AZPX6BworxF9Aj/AIbhHEmzvsFdgaSxjzGA83qLcYOVrzTZOsRyA7g+kn46ca
         t0qg==
X-Forwarded-Encrypted: i=1; AKwUvBy1RXT6bXnsR5S18JAD866udQa2Iiojfx+yUyFOd6jF9TC8KoaF65+x2rL3EY2Rvr8l7HAGSeqlmjfaEMQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ljGaO9ucbCqdfEUs9fQcflT5u1Sf07bFFn6i+FUDCIr0Mgc2N1
	R8ctkkjpn0+EmW0oqYxJxsXHgeSKf3YWK1mNCk4XTI4NPfcQFdWBQ0Ck
X-Gm-Gg: AYBFou374cdfBp/SAIdX8wxgkDitY02MfQhGa4heDxCaVdpAkji3K0vkKAO5Fra1hKt
	1FayfD7RNH/203/retR2vfySPIzt+65B0OHqHQsJ9hT89U6Vywr8HROGmBTM1yZb3Raogf/bBm/
	VXFhdQ1ROf3Y1hg8hUcUpWHyL78ejHCMby12r2d78YqGdLFZZououIDMrkroa0WvxYqgjzUouHH
	JJ9XhTnhEsW8xAPCNLtc+J9ZDkuwoUuStvJxQ22YIUi9MpOTkx0NGjhPtMWGUJPrV0ck9H39geh
	BEqjoJAFY0SjQIuLV0BZEIb1QpuaN1wMek3LYmxrcr7lrygHPVOmonj5t3hsUe8q2k+6nTHVY+A
	ApDJAU0cmHoz6uY3/iIooTD4w8MPqKD2tmkeT4VGDiOkM/Dzi6Z7fGcNUSG7wXcsG598JfwcKqN
	rVExYJCO6vXNXls76V3n+9jnmq/wMQYeb7NhyZEVyrLYZ5wG8FPvZR+Iph5+ujVVdDXC2LrstnD
	1otjFrccmPSSkQoiY3wsjywS175mxkr2blw8+qOD3VdnGVeLJw=
X-Received: by 2002:a05:6808:23ce:b0:4c0:9d00:b46d with SMTP id 5614622812f47-4d72be38df9mr8255004b6e.13.1790438143549;
        Sat, 26 Sep 2026 08:55:43 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74e99sm4577446b6e.4.2026.09.26.08.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:55:42 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 2/2] selftests: riscv: vector: Fix the check for children exiting with -1
Date: Sat, 26 Sep 2026 10:55:35 -0500
Message-ID: <20260926155535.306111-3-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260926155535.306111-1-danishkhateeb03@gmail.com>
References: <20260926155535.306111-1-danishkhateeb03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vstate_exec_nolibc and launch_test() look for a child which failed with
exit(-1) by checking WEXITSTATUS(status) == -1. But WEXITSTATUS() only
returns the low 8 bits of the exit code, so the check never matches.

vstate_exec_nolibc then returns ctrl as if the child had succeeded,
which is the value the harness expects. So when a child finds that its
vstate_ctrl differs from its parent's, it prints an error, but the test
still passes.

Compare the exit status with 255 instead. A successful child exits with
its vstate_ctrl, which is at most 0x1f. launch_test() already failed
the test on 255, but now reports it as an abnormal exit.

Fixes: 7cf6198ce22d ("selftests: Test RISC-V Vector prctl interface")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/riscv/vector/v_helpers.c          | 2 +-
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_helpers.c b/tools/testing/selftests/riscv/vector/v_helpers.c
index de6da7c8d2f1..8942ddf2b52b 100644
--- a/tools/testing/selftests/riscv/vector/v_helpers.c
+++ b/tools/testing/selftests/riscv/vector/v_helpers.c
@@ -81,7 +81,7 @@ int launch_test(char *next_program, int test_inherit, int xtheadvector)
 		return -3;
 	}
 
-	if ((WIFEXITED(status) && WEXITSTATUS(status) == -1) ||
+	if ((WIFEXITED(status) && WEXITSTATUS(status) == 255) ||
 	    WIFSIGNALED(status)) {
 		printf("child exited abnormally\n");
 		return -4;
diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 5f53e5e8ac52..05f18b13a36a 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -74,7 +74,7 @@ int main(int argc, char **argv)
 		exit(-1);
 	}
 
-	if (WIFEXITED(status) && WEXITSTATUS(status) == -1) {
+	if (WIFEXITED(status) && WEXITSTATUS(status) == 255) {
 		puts("child exited abnormally\n");
 		exit(-1);
 	}
-- 
2.55.0


Received: from mail-oi2-f42.google.com (mail-oi2-f42.google.com [74.125.231.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DAFA364E9E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438143; cv=none; b=XQSPSvMOlcn9a+vnXlhEmAAFcc9ICJ+SqnyNQq6XkkfzzOwrBpE0D9wzzBvj6AEU32nfjyQLiEwkHliWDUucyND6NVH3iQQD0l5BmXoJroX5FkA/TuSUGFB++6CaNS9lir4N668YPdeJrFrqDEk9q+aTCziQRjIRScyUhWH/CHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438143; c=relaxed/simple;
	bh=CfwWkTQnpZmernO9UulKoWfrgZKKOdE+Tuz3ODoFcBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4SFa4m3DUijcSYWfWIqTJsjzjrcO2c7pbWQYVgCs0rvQ552fZn14ZN5GjL1kVXcAD10+EINFLhNgCeKZBMeypRCIu/ebMOGELAXUhB77BNSZCXyLkStM+7UtEeXAh5a6WgGZH5PgN+glplklDYJO+gNyJWV/qYfjj2IxVxPCpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5gr3dLP; arc=none smtp.client-ip=74.125.231.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5gr3dLP"
Received: by mail-oi2-f42.google.com with SMTP id 5614622812f47-4e7d0e42662so56789b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790438141; x=1791042941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+8tzVjsh/cKn4B5b5sbwN+m7Qf+Lv5/itTNncc1/vcs=;
        b=b5gr3dLPohGHJK2tYcVSEs6pwCr1ErKZL29zPW/Zd3iNsjHlfclvWoiyodTurgG13t
         UXMXPmq1zNBG90kI16Uc0at84eq2bviich3yd22f8B5Uz3B61Bep06wrysOGZu0BrPy7
         x+j55nG6SYoDT5NT8KMVgmau1ew4e/w+B7rvBhdjeG50VWvhtRUa87JjCZHVS5/176Dq
         +lqSfLml8y1Bd4QSNQRyPnF2azkTJhjhkrNaTyYYuKr228slK+odKpCzMD7k0ZZc4+dp
         IxPfsdMo+VmkWeczHcoTV4rniaO2sAZO+zi5GAwWw8rl3rF1KUP94Y6jwPP1IC/LP3He
         rFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790438141; x=1791042941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+8tzVjsh/cKn4B5b5sbwN+m7Qf+Lv5/itTNncc1/vcs=;
        b=RJ+ZuFXIi3fQ2p1LZQLp5ZjngolnqiWhyPni9ClBt7WnrdUlORwU54P9CurWcvpYNI
         L810urxiVoflwtRPBuBhaTmERu/ceAp3Oz2HVL5LqhJ+4Oni/2YAEG9r2rw01Qr9D0cS
         WD9uUX+f/UyBZhz7tlHN3r6tJ+yY9QxtK4djEeDcStEBGo+YkWE8U7OQo1eGSS43z13c
         /22z+O99p9yaVVekXamRhGcp0FPykKSEBAfihHFOFTsWhJItiBgoaxcysLWRLZF+r6TR
         +Fu+m1NWWlVYe0pqtVj1XWoBGgiwvM6+zi3WPe7mGmFHbgLUlqzGbbGkIAv1dzse63/J
         e39A==
X-Forwarded-Encrypted: i=1; AKwUvBwrE6G3Iflbs5gdyGncnq8PHDMzQ//GMFoEyddxkO8PIPheZj6DJcNO23BXCyTbEKH4mLSyV+54xC9edD8=@vger.kernel.org
X-Gm-Message-State: AFuF++kpUX81jvGalO4mzKNoqb95h1ppNGYbAPbYYYhDDd+G6fKC+95U
	rCHUz8ziuYW3hRREnv0Rpwty+gecQfup4/yEEtPA1sG83n85fEdhmYlj
X-Gm-Gg: AYBFou2lgm7e4yzM5xB+uqCyjGNqQRB2htoxoEZ7MLG4b1QVsQszBLaqfudWUhdlMPh
	Q1MBy4VMEnB/I91ZRH/3w0mWWDFGpLm9/glKTLWyvNpfmtL9ZnHSpSeekkFVAKA3tXTxMGMVkJX
	sR+g2djQE9hxssfB+OouNabqMYwrjhDqxAqJ7CRQuNX+baPUHs5JSTiHoHBtB3gB0NQBsP+J9pQ
	x8OXMnTfSbaqF2YwKrRfjrjkcictIWuEnspX70KdwUC6vMsw6o+dMAFAB8Glvlz7vvrQN7N+aJc
	RGqvVrtd8yKIg5TDYF8i/578PoKKDd/IK2jQv6qcGqGjMZCTMv13urc88FgvR5JajMkxiKcty+k
	Zsi9n4i1ALZlZK3YExcmRNyWBJn89eXcQGOFe7DtGgNCgiJq6pWIrmxHWEkOeN5ewFiBiq30zxM
	HUaBAp00lvHCBz8Q47s2+i/TXA0r3yvvdYC+TtUVsBoSUcHOIngekg2cnaFlAWBO1xJG9JpEN2P
	NfIND/Yk5f+jVfC6QGuMm6KQr+9YU7MfpBLYyUM
X-Received: by 2002:a05:6808:c210:b0:4d6:9232:b3be with SMTP id 5614622812f47-4d72cd37bcemr8543745b6e.53.1790438140875;
        Sat, 26 Sep 2026 08:55:40 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74e99sm4577446b6e.4.2026.09.26.08.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:55:39 -0700 (PDT)
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
	Danish Khateeb <danishkhateeb03@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] selftests: riscv: vstate_exec_nolibc: Check the return value of waitpid()
Date: Sat, 26 Sep 2026 10:55:34 -0500
Message-ID: <20260926155535.306111-2-danishkhateeb03@gmail.com>
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

vstate_exec_nolibc does not check whether waitpid() succeeds, so status
is used uninitialized if it fails. Since nolibc implements waitpid() on
top of waitid(), GCC can see this, and warns:

  vstate_exec_nolibc.c:78:12: warning: 'status' may be used uninitialized [-Wmaybe-uninitialized]

Fail if waitpid() fails, as launch_test() does for the same call.

Fixes: 7cf6198ce22d ("selftests: Test RISC-V Vector prctl interface")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202609250003.hvssJlRZ-lkp@intel.com/
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
index 12f1b1b1c7aa..5f53e5e8ac52 100644
--- a/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c
@@ -69,6 +69,10 @@ int main(int argc, char **argv)
 	}
 
 	rc = waitpid(-1, &status, 0);
+	if (rc == -1) {
+		puts("waitpid failed\n");
+		exit(-1);
+	}
 
 	if (WIFEXITED(status) && WEXITSTATUS(status) == -1) {
 		puts("child exited abnormally\n");
-- 
2.55.0


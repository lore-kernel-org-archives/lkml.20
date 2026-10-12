Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5024F4D06
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840219; cv=none; b=WN71cK88VzfW9p68wUFmvu9OMQuJLtrushDWqKeS1q/e4XaXp/J/ydVvx8kL4wvX9e0ox9c0SupHhxfZ+Bq4len+OUKdU7hLpdvNolDNF3R5tZiYCry/D+poOuccWtfaI+RmaQwoIj0hfpkV6reoASdGGD0QUJgsvNANXoqxlaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840219; c=relaxed/simple;
	bh=LsO1xfPThEa8wC7kBqFr31UhJSOzYIINCkUQJUsyjSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k99nPR4JDSjG6gAQdF+WO2L4KdHVx3mpTHoogGFdTBp3HWCJTvbrh/rJyKrORoY5P2rxN2IEMWD7gZOssIHrfx6EYP5Ulhqtfb10jhRE9h4/uGdKwQ7Fwdl3TVqpCd0QfEl5dpYbfDWAASfJw+GVRvSk0qAYsXV6Ox/5VKfi9ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z/sL9mNX; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z/sL9mNX"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso29893965e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791840216; x=1792445016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rN9kd0u0kwEKQcqtsQgX5NTYJE7KMXdgprM5d1jYEwU=;
        b=Z/sL9mNXR3e/FMW6PzGARL1hquhNJWRvyliknPCnXAQophEheen0IDvNQfl3WBB0K1
         0Kgx8fRh6SrrXmvUyZZ9JzPAngnSo/4sNqcIe5IGxwN91m0T3dc/vcFrfahvGlo8MEJe
         7Trx+lZV0bHNvfoNotCJ8sPOc7/QbOOS08Bg9b4lTPM6LIeIJaHH0fPWMilF6nduKMh9
         4SKtH00T8kz+RQurKhhNl7s8XWTwgVx8J1EQJ6IirjSS9P235Yjm1+dBqduVzFmAcRJ1
         8owrkHtGLe1amcrSsrGIsKcKG9g+kIRGvqnKltv460SYeR68fnZWXbcSmBNun4AyXhZy
         pZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840216; x=1792445016;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rN9kd0u0kwEKQcqtsQgX5NTYJE7KMXdgprM5d1jYEwU=;
        b=ZmF1nZgwiQfdcNokY+nT+PuWhWhjM4+iir2uMZwpZzR1sMgdAM+XTjhnABKDw0dFbA
         qqFZ3Cem0i5yFJ6zQlKbXoiRW1IdetHdDpmJd4Tjk1KIQge0F1p2B5Lz1x3kg/cdSou/
         gBe7C/6p1V9pA2dUAThFeZjoF5gE8Eq9QJyuFI8YOH/cxmMWGpGI1WV+wWJy9vAU0HGk
         JZpEcbRVDpUR3AAdVd9q78WIX6bvcjg6L0PutPZxQFGc4hvHeLs7OGR/7mVoS4WBNUUm
         KnpDA9ZOWB9QG9fwFOxaqyz5kXAjcbrYKqfAQxEZK5/VFcK6+Su5h/q1d6n4QYSXSbfI
         faLA==
X-Forwarded-Encrypted: i=1; AKwUvBx9oKBlnqGY/2r84cuCTKKSJN/+8yKlYSYW4TvHUtOK0TdekZP/1qEAm0fRCPMOhJsRMTIZG/KC3QpnELI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtTd55ISo6tUoItRmmeHJ5jv+qvYDFxWNv867ayf/bweUi5A20
	SjOqyC/1SD3bmPQPA/UnyOTofBFGSNNrjjUETJo089jQgq53uOaWFRyy
X-Gm-Gg: AYBFou3Rvd0t0+KFVcj75aC6HuxmkI6SMGwfgr9mseqZnFWC9orK49Kegpx1BFrn2F4
	T/hpDvwlPBsN1hmvnW1zkJxnjdnP79GsZkL7YCs4a0fMYFkLOzO4jTyWfJw0NyObMYgckCH7XZM
	Zz+I8RmWk3vp6wbNS6NnAJHWMUDt5bqLu5jbjv1oWhOYe0tLpl3mU62A1U/HO0SavZykNhapaic
	liRhRYu82Q44v2gcc8GMsOKco9Nzv45p6ez5ploUr1mlvj6VK1ZUDy0DnjetJ+T+fjRLGXjUFMu
	w11yoi2OzbuDiYMbBy+SeoAUvYB48wGaY6U6hzdSJBZNHcMyNu84RpDSWoD1F2PToEivqCFdlV6
	EWRX5JOCdM+WjRPHWq6BJ/oBR2l9x+Ej3koJlMWXxlrWeONAIaHOVq7oHfXGLi1qIDfBoWFnc22
	yt1DmIL3u83ETSzCse4HIbhgJOrXDdrOsAsd2QWUZS7xt6TXg9ydeZ1tPS4naFdVUFoAnrxds9u
	BEXC8E=
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr204341295e9.11.1791840216298;
        Mon, 12 Oct 2026 14:23:36 -0700 (PDT)
Received: from localhost ([5.83.201.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19ba624b3sm186925215e9.2.2026.10.12.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:23:35 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <shuah@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/bpf: Fix spelling mistakes in descr literal strings
Date: Mon, 12 Oct 2026 22:23:34 +0100
Message-ID: <20261012212334.183116-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are spelling mistakes in the descr literal strings. Fix them.

Fixes: 095ddb501b39 ("selftests/bpf: Add sockopt case to verify prog_type")

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/testing/selftests/bpf/prog_tests/sockopt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/sockopt.c b/tools/testing/selftests/bpf/prog_tests/sockopt.c
index 6c96f2d9fccf..7dfdc4c12dec 100644
--- a/tools/testing/selftests/bpf/prog_tests/sockopt.c
+++ b/tools/testing/selftests/bpf/prog_tests/sockopt.c
@@ -955,7 +955,7 @@ static struct sockopt_test {
 	/* ==================== prog_type ====================  */
 
 	{
-		.descr = "can attach only BPF_CGROUP_SETSOCKOP",
+		.descr = "can attach only BPF_CGROUP_SETSOCKOPT",
 		.insns = {
 			/* return 1 */
 			BPF_MOV64_IMM(BPF_REG_0, 1),
@@ -969,7 +969,7 @@ static struct sockopt_test {
 	},
 
 	{
-		.descr = "can attach only BPF_CGROUP_GETSOCKOP",
+		.descr = "can attach only BPF_CGROUP_GETSOCKOPT",
 		.insns = {
 			/* return 1 */
 			BPF_MOV64_IMM(BPF_REG_0, 1),
-- 
2.55.0


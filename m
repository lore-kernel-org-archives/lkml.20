Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592946;
	b=ncbqqjMQP0oRkA3VGhXFYfvtEa3hmLK/N++PrikHGfArjOqIiD1IUVrsazIhxvWb7VVp
	 UbP/b/0qKQwPpGDELI+4kYk5LtbKmhMae9W1i0NwzuG+HR4GQyuvW9AY+3kAugDj+Z5vB
	 ilLfEPshRrrlBFersHPGJGwTN15dl121aVn3B0doGtfd0DrayTVDmLmWO7ahRQJnWjx6D
	 WJzxijz17Oym7+NZXcwFVAxF8+87dGzQhhmr+fs0z+bFyQJ50NdjQAejRk8xYjSgLxCll
	 71DhHglTmPfWMpcr/EApxrjmAl5oRyih95U2zQZKjSikVSU0ATRP2bz/PzaQEpgKr+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wLpQg5QcAg89Cohrx6Yev6AjF1ehi1341b5g301iJZ8=;
	b=VRk1god2A4l9Km9Acuim8kdCS6E8HW6BlncG2eJzc1g9P24eVeSCSWxLuNVYEHzJWopF
	 NMs8gSgeNMV1ylDA1RseCEkpO6z8QhGKLTiGs7B8pxNuVmcHj7Lgs4Jd18JoEbJrcGUqC
	 Syg0KeHcs2OeVMnuj94ARky3zt4NGrgczrTWpwKZt+FCiNLZUcf39xNThdYDE2D5dgazb
	 MbEXf3j3HFdwxJx7Uqy6k/wfOqvh0VMTlppDPD1qEnuaafWkTb6sq7Fh4NyEOzB0z71uw
	 hm5/fZEslvo5VXioF+iuttljC5i/1dVsJ6PuhU/0uUZHylsdtYSQtMWE4S8He3E2yYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGeQHk8Z;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43746606B470
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43746606B470
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XGeQHk8Z
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37198ed3727so2657052eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794592945; x=1795197745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wLpQg5QcAg89Cohrx6Yev6AjF1ehi1341b5g301iJZ8=;
        b=XGeQHk8ZO1dp9XZamtxcj2r2j6j4skWEmXGyEXYr7dFlvJL27ZBmdlz+SyuNiXAgOR
         xbIByzYO6KX4Ix85QHA+VnOZ7ZNIS1dhSLTbTOLRiVhr/shYi35xXVExkPy6CafjrWqC
         LDo3azPLy8TyMTWYi23rBhcHcTHJVEHoMMIuCBtuAyQ3TMc8V0Biy3MSsFvdLvpZ0VaK
         OgFhg0GhA7RaQPUClsAgz8QbgKp17GLTXGZnZR9798o/5yPaBcxD4TijVEzFTYtlBqbq
         B+vJvlCv0+gMz0wgrmjPgXpJ/tEtOQKOSJTgJJl90FnvHv3pjUGh3xL4i08ELLz4G54c
         gkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592945; x=1795197745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLpQg5QcAg89Cohrx6Yev6AjF1ehi1341b5g301iJZ8=;
        b=TeOLKi9KDOjirKefcxl93suHWnAQaZa92eB9KJuBieO0PI305sOy7pbp6BUmrOjSRZ
         SXN6Gxu9ePnINZWCt/YAdetB1TDkIJdX4SC5Z3Ez5coUalD58ilFVJt4o/t0mmdZCjy4
         qzRZ9XewB6CbexglzKXnf5FVioj3O9jBvfs3yZUcIN4M+ApszUXdPBMulZfiT2zt8E9Y
         XH/ls+2AE90WxpNSZZu5foRiK2kR19m9ZsFoOUFHdKGsGFa6jjAKcffSTjhjUto37kQs
         AcH1zkis8AOHS0HerJ/5qB+puFc5AvG3HNuLPw99Ddgv6pounZtgJvzxCnGF+5n5y15u
         czQA==
X-Forwarded-Encrypted: i=1; AL+hErGp6tAzy+zeNphe0rEa2YDObjWqqb7v6/KmbrrbA/1smHdCrE9NH1v/E2ear1mmShL6Su7h2DfSfU78VbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iU27R5zJ7uGWrYvkTc/HOooIjmNN224eJdfPkOlvSh0tNM8x1
	qGq0rc6F0giNE8d1NpOF2tsPT2K4nxa/HLVSh9/WwTVHXoPNFtKL5GJr
X-Gm-Gg: AYBFou3tburoXdkbvZn3SYe8RQxqDa/nDl1HF/potcVcC9gKIgEA1f3vteFtyCBiBd3
	9SiD/hZdaRmw6e+WAp2UWi3vgm2+YT2AjCEbzfKqOHkDCAsnEDFw62wwosoeZMkwJAg8TGDx7hY
	dLuDo79+1jvlr1hd8pZpjKIBsf/4C8IMHss5GrmNv5nPgTDXz1d8dlIANl8yomg3urIqeXozkMm
	oGcyu2FQLTAreyWQPlEo7ZMO6TxNT8ZCvsYkm/lQ+OYGzKL2UUZtw/BycidBs9KgY9jZZS2J2aC
	aSHocfOTtCwEPeg4q9u+5CzqYdavmyeW5DQhin/jk8gdHIcrxLeLq+rTZajfIFWcyZFcNx+1UnU
	CHYtesquDfo5bKup77Jyfxj0AtLLZ47Z8p6mBolYOLj/OK2N59FUd3iRJVzaqBzkzGJ7U9xaKFi
	LI4GnLqhcEesP65VHcQ5cNKkHmXXOaiJXXTbnqfhgSwmkEvIlTnf8c7vbixQp8kKm9vlm68zbph
	7Pn4+k0YVn41Gd7/KHw1FvqQi1KfrFKGyE5ET5zFEndV/lcCgfuhpEU56mNgrmBkavLNiMMBYB/
	3R7hTrTlrC4VuIZGSLu878wwYJFDZgCRiBjyQ/KCtMeN87v/+VXx8v3nlzkJjPCCLKrnLZ0=
X-Received: by 2002:a05:693c:60c1:b0:36a:2473:9b2f with SMTP id 5a478bee46e88-377e1af6414mr5950264eec.23.1794592945251;
        Fri, 13 Nov 2026 10:02:25 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm8621741eec.16.2026.11.13.10.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:02:24 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Hui Zhu <zhuhui@kylinos.cn>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Barry Song <baohua@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kurt Lin <lylin1023@gmail.com>
Subject: [PATCH bpf-next] selftests/bpf: Skip memcg_proactive_reclaim when data lands in shmem
Date: Sat, 14 Nov 2026 02:01:59 +0800
Message-ID: <20261113180159.602033-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.0
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

workload_dir() keeps the data file off tmpfs because shmem cannot be
reclaimed without swap. But statfs() only sees the top of a stacking
filesystem: with /tmp on overlayfs over tmpfs, as in virtme-ng guests,
the check passes and all 32 MiB are still charged as shmem. Whether the
test then passes depends on unrelated page cache in the cgroup; in a
full test_progs run it fails with:

  test_memcg_proactive_reclaim:FAIL:reclaimed unexpected reclaimed: actual 0 <= expected 0

Check memory.stat after writing the file and skip when most of the
data was charged as shmem.

An AI coding assistant (Claude) was used to find and analyze the
failure and to draft the fix and this changelog.

Fixes: 0f9b1e9ef584 ("selftests/bpf: Add bpf_proactive_reclaim test")
Signed-off-by: Kurt Lin <lylin1023@gmail.com>
---

Notes:
    Tested in a virtme-ng guest without swap: with /tmp on overlayfs over
    tmpfs the test now skips; on a disk-backed directory it passes.
    
    After writing 32 MiB, memory.stat shows shmem 32.0 MiB on overlayfs
    /tmp and on tmpfs, and 0.0 MiB on a disk-backed filesystem.

 .../bpf/prog_tests/memcg_proactive_reclaim.c  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
index c22dcfabe856..c03550676041 100644
--- a/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
+++ b/tools/testing/selftests/bpf/prog_tests/memcg_proactive_reclaim.c
@@ -46,6 +46,28 @@ static const char *workload_dir(void)
 	return NULL;
 }
 
+/*
+ * statfs() only sees the top of a stacking filesystem. When /tmp is an
+ * overlayfs whose upper layer lives on tmpfs, as in virtme-ng guests, the
+ * check above passes but the written data still ends up as shmem. Ask the
+ * cgroup how the pages were actually charged.
+ */
+static bool charged_as_shmem(void)
+{
+	static char buf[8192];
+	unsigned long long shmem;
+	char *p;
+
+	if (read_cgroup_file(CG_PATH, "memory.stat", buf, sizeof(buf)))
+		return false;
+
+	p = strstr(buf, "\nshmem ");
+	if (!p || sscanf(p, "\nshmem %llu", &shmem) != 1)
+		return false;
+
+	return shmem >= FILE_SIZE / 2;
+}
+
 void test_memcg_proactive_reclaim(void)
 {
 	struct memcg_proactive_reclaim *skel = NULL;
@@ -99,6 +121,12 @@ void test_memcg_proactive_reclaim(void)
 	if (!ASSERT_OK(fsync(data_fd), "fsync"))
 		goto out;
 
+	if (charged_as_shmem()) {
+		printf("%s:SKIP: %s is backed by shmem\n", __func__, dir);
+		test__skip();
+		goto out;
+	}
+
 	args.cgroup_id = cgroup_id;
 	args.size = FILE_SIZE;
 	skel->bss->reclaimed = 0;

base-commit: 0021f17128de5dc0b19f1a523f448df2440d8088
-- 
2.56.0


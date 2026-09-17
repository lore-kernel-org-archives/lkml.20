Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BFC3A9852
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678026; cv=none; b=MZtNk5BkTZKrhb3c+J2RQw52TgQMQhd2iac2GiIt2quyLIZaTmL7bLgGoMw9gAs+qd91hR2k5NSETt3epj1e3EIUzlKgLPzXEDETQAfK9o7I+OZWftG+dzdwIRb0LHQxE24absIkpU3exuKQQfGfQJe3oFN1pkaskGydd+uYfuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678026; c=relaxed/simple;
	bh=nIVOkYYFqQJ0yVigMP8u4kUJIqRX2qfKDMZ1LhH9o/s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HIMbRmkl4jiHtU0fLWpbVi7meVWvnToz3zqE/ajpgP5JKjJo/31qen2m8gcaI9r9/KF+3AIIJi5KvhT8lqIJe/qaYkNrZs2VSjcEziZVxrY39YCnfiaZLCqLkvWmKSZVrFqEYPAAeO2Wo9D5FO30/3Ucm0dT3pBzvBYTphHzjvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyfN7cY7; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyfN7cY7"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25400so72117b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678023; x=1790282823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2gunvEfcyXymrnukDaYw8Fai9UY+V2Nlpd2w2MiKQn8=;
        b=KyfN7cY7cp3EewmBcfgrZpEPz83D0+LU62/Y0cZauw2jnCJ4duwF5SEd+Ucx5+VCGz
         0CLIsGFYIfBrQGMIq+szUMryjtGqZ+/fTYdsjTpyU+WKXwpjRsN8Qs9vAtCJtaORfsJB
         oAfS5hg9sZTZV97C+P834jK6LSl+s+cHtRAO7pLLenkqOczPvFHUgpKkS+CXW8CvKLJW
         FSW+t5pPZy7DrN0OUEcJsZjq+ANbBBzsdZcEnM/sT7gYjLWZ8Woix33q3YnXZSpif9ga
         oJGiKWCToHLpaoxPYpdSoZ9f5a3bvAyHwIPR5fJDsP981EQlV8zvphTvCHyLFZIokaYj
         8zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678023; x=1790282823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2gunvEfcyXymrnukDaYw8Fai9UY+V2Nlpd2w2MiKQn8=;
        b=E/QeSuNMxEC+9SEX0jY1lk8/WCkx7kuwLjMW0MBxFcSCoP6dB2czMle0+Ek4YWCVD4
         KytDIOebIZCXZuwFgQYgBRyH/eXbe45OUmNrJ23UXzFJG2kPZWFZ2DH6Fg8pxiV0ggAv
         VHJyJYOBeWbVlZZwH52FHuc76R+T8NL6P9aNWfkrxZwh0KcZ0Vn0tsanCU/t/aMnNm57
         brkzgQxf4Ob+Ww1gFh4Bn2uRDZrnmA/lKZz7hb6xnA0pKjKaf3YisZmtCt09Iu9BWblA
         20niDM9Q/XVggg7jIVQL8VYhXGAti48+Uew2u9jryAiyR1ELF3P0AogHc4BBk09EuJbu
         tBLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBvgtw63OoE6jm6aSS4648UhYepOxp/KSuU4vjzJEuVS2qyiY1DBPSB4+NbHNqiWf6AUpmHMFls1QRVzM=@vger.kernel.org
X-Gm-Message-State: AFuF++ml1TMCiBGk6k+MtQP4JUQ7WWG9AAhy3OjGRI6leABBZZAnW3yj
	H7wbf7FnyEUf+/b3G52CBd+PPOtoJfZ7RMcLPP21Sf7LGKhrIQCLKiRa
X-Gm-Gg: AYBFou0Df0oSkJRUzb1MWjmaIV1mmxvFx6lXdoNsTAMtdw41lbrvF7ZoVu/aK7tbz2X
	BNpcNYQGQSCzRonDB4AxNefIcl4Zs6BLB/0dpT7D2en4M0C0fkjHMW4nNRHVtv5W2LTiCQb1whj
	at55ikkztj/0pjnSlN2sZqh4abyLLtvCBSkuwVdwnQ+Akbg4zJYuszYnCxSF9QT93KrF8gxzym5
	w+AQ1BDAOvkw6n2hI11sPpPH7NhIQnYPKv8jS1SWgTctbrt653AXZgy1KqmHEJHk+qOJY117Hec
	pJYojg9LkIG/T9ComuXmYNLm87tGpkn+mbdEcXmpq8F9iXbWc7wb/WbNrCcuJx+tkPYnGsObqZt
	5bls3/tXy6U7iFOZ7JwTzOcNeG1FsZzo5qR7U6XSeht33IERAE/TAFRKTtg9luAKEHoe/s6NvAw
	FQLHqz8dsLXwdqbYfHbq72TTSpVVysL6fr2LGNdr+O+SM/88oNZvGjw6DbmGjkPsjufUPbE4g=
X-Received: by 2002:a05:6a20:3946:b0:3dd:85a8:cace with SMTP id adf61e73a8af0-3dd8c4ab5d2mr286409637.37.1789678022967;
        Thu, 17 Sep 2026 13:47:02 -0700 (PDT)
Received: from G15-5520 ([103.246.195.8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm14274126c88.9.2026.09.17.13.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:47:02 -0700 (PDT)
From: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
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
	bpf@vger.kernel.org (open list:BPF [GENERAL] (Safe Dynamic Programs and Tools)),
	linux-kernel@vger.kernel.org (open list)
Cc: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
Subject: [PATCH] bpf: use str_plural() in diag_print_history()
Date: Thu, 17 Sep 2026 20:46:48 +0000
Message-ID: <20260917204648.9110-1-lalitshankarch@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the string choice helper function to simplify the code.

Signed-off-by: Lalit Shankar Chowdhury <lalitshankarch@gmail.com>
---
 kernel/bpf/diagnostics.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/bpf/diagnostics.c b/kernel/bpf/diagnostics.c
index 0abbbe177e31..ff139777ac64 100644
--- a/kernel/bpf/diagnostics.c
+++ b/kernel/bpf/diagnostics.c
@@ -2354,6 +2354,6 @@ static void diag_print_history(struct bpf_verifier_env *env,
 	if (log->first_seq)
 		diag_write(env, "  %llu older causal-history event%s not retained because diagnostic "
 			   "event storage reached capacity\n",
-			   log->first_seq, log->first_seq == 1 ? "" : "s");
+			   log->first_seq, str_plural(log->first_seq));
 	diag_fmt_restore(env, mark);
 }
-- 
2.53.0


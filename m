Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258990;
	b=ebGJAa36liisnByO0xJfWsFw8umS77ryOtXTbZ2jNVUSia/uMc/sxXH12DiFAO93CrdM
	 xDlPgTGS3ivFVKkabAhwedCfvs9PfegZrpBN5XEfL+wspR4MnPzwHGvkARRfOjU2OJZCQ
	 TahVhddjAMVswcvS2aeRVBpWk9SXYoiKSpYFHNGiF28/0qxBJ8UydCpcn8YVdZhKGQNNw
	 6IdW2Jb5ooHJmDAwW0lAYAU5cTtF3bXKwb91RC/TaIy9iHyfgWRtL5GjJwD+WSW/SAU1F
	 IFg0e5NzsrTVkR+Uy66e0PHIVhPcQSFpk4BuNj5kLNf1e8UfWICWVXnQx16xGrxd/UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
	b=Am+LDvRYCcQdi9ZEwRagQCwO3JnamIELmSWeKCdMDUjmmUoWiUaegp6T5+wexnAQiEnN
	 y7C74tyvB9mDD4NTPFuliIExwTTqMwF/gBdgfF0J3Mm/5fLYdJ7rMz6aG2hqM+Q+CwWNA
	 SzcHx4yxA8raKbcnvod+Vc5Sn7m+IpG9qqVMaBXtxBMQ6UXa0/45Psq2aQ9XxD/BVzoZj
	 3DCD5keHD0bU1gOq3gCUqhHWlyKtXWzAahTYk6FJm6/3EuQAUMiBo11llo24qbFh84r2+
	 AT2K9Yvxf2V3qtISnW/XllbLoP3oWJfE/lPn9+uspd0JuQVa34aF7RG+mU7K0n4EOUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgmtA6b2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4D606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93B4D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MgmtA6b2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so9826645e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794258988; x=1794863788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
        b=MgmtA6b2fe2WIcS70GTp+kgCwjUwkfW2fyiPRqoacbm1QAOB12xEdROeA42cB2H5sT
         73eCYA/Fa4go87r+TbcL/qlITF7hJSdH5dOjFBeBYUAxOSu0VPbKDrRzZfnFzOeS2XXo
         o2Uh6ZQM+SEfnwEYWyFlivd3D6zUak+h+aTUsePbAHVVyHIB4jpCGfbMbwf7OxyayXzk
         0K79nXEozl4JrV5y1QAh2vgzvVEvzu90WaVJaHEGQvfqXaUAwtWkAd6ztm7VOobzlBmL
         3+zT4c4y/hktKpwsCM+zI50yWWxNBSPG73fGdKw5aQ3Als/DryewE89974Ftv+oDDBK1
         tdJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794258988; x=1794863788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vURM/ycOWtNcfROgQ72z0JMUPAmEvRYCw8hhtZdgFRk=;
        b=umj6seto3oXlqsZZbm1hxPQiDGDuoDOwZ3Wry0oKfhWgVLomUZq+zTfjRn0irzK99Y
         zsnqTAhpZpuG4/PY+94Dc+0SbQUprkgJjSkaYgnojV041LPAz0K3Tv1/keMoKHp/vX4z
         BWajwkAi+ULsftddYB1r1DWWZwPcmMZFNirqyWxxaqZgV1akkRVhXKrWrSPan27gtyzk
         Ri6XnkdAEE+EscgX9PQzvrtW+cAYgypFzqTdWQUy+2qlI0AZjyER1D3EQs+OXOdRrCLK
         oQ4mi1EWOFO4r3DNIhxBfbJQR6BV6Q4E/5kU5uQWH3T8JtHJb6qyDrhvvias//7k5kGN
         Jmzg==
X-Forwarded-Encrypted: i=1; AL+hErFXByO+WhJMaJl3MndKaGnMsTMCOSp44CX+Rs21KrAbLXQWf3nFmr7xABO4jW0Gy3C7ywupruBXwubfTM0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YLluZ4PmHBf7aJDsfOVxQJ9HKY71/Ja29f5L1IGbIOCguiVZ7
	1yvqIYq8qGKn8kJ6HFZWJjS08lNXfFwasCskzqZaoxUm2EfzsBgUF2wY
X-Gm-Gg: AYBFou1hmjpZez4AwAXcH3Iqi6kNqDBIkp9/+2ZjfYIPypGN0gp3ACKv8v9IavRud/I
	TTwxxeaQeLh13OnaAgJE1OeGzQyfwmR/naOXzK3gkNMofFdW9g9VWvKZ4erIYfvQWRi/x9D3KiF
	d8boomPDsG+UuYqqjRJx3Mv0VYi2ztHbGz32Qs1CsUhtK5wHZCA6WgDWodzs4AFH+tCPm7aQESu
	pQaRrD/asW+RLnpKNSd+i/wYnkLKGAgx0AKKJU0jRhoMLP2Dv1g4tOUavoJ+d3mb/rRlrA0T8z7
	xnrLOj1piw3ZmJ38uNJkba8mEKMshJrlCg1q05OFtwHOEI4vt5u/B17iF2aiIaVO6Jg1hvb74sL
	FVy44zLBL0XuuYfKie0iREUGB1vH77qUeEQs1t2Yt5w0i/BV3t3wUZ2HpM/Wu2S0EBtxyMtZRtO
	Yjh7Jl+goCOLc7yu7X9QmIxxYCIu9LLjSvKM9EMvtYSV2IJQgfj02GNRs2PSdDGWqwutZW3pHz/
	0W/6rTjaSkGd7DWixlaXXxiGxJwgEKP8K1Q318WIG6Y7CmSkGGlyc6cpAqtcgK72n31DG51IhkP
	7FtuE3p6XKQWD4neryJvbi4mDi4HdOSuek0DRgV+kNSBb1AYhTrj4LwQSODO2HRFNjPPa+vvr+g
	hSFxjn3YubMnCnTURWPizwhb3SKZLfqcfGhv60bhra8GI
X-Received: by 2002:a05:600c:6291:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ba0234ead8mr7663955e9.22.1794258987873;
        Mon, 09 Nov 2026 13:16:27 -0800 (PST)
Received: from PC-DE-MARCUS (host-149-154-244-77.dynamic.voo.be. [149.154.244.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2f09sm17550795e9.4.2026.11.09.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:16:27 -0800 (PST)
From: Marcus <baronmarcus2005@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] run-clang-tools: Resolve the compilation database before changing directory
Date: Mon,  9 Nov 2026 22:16:18 +0100
Message-ID: <20261109211618.1496-1-baronmarcus2005@gmail.com>
X-Mailer: git-send-email 2.51.2.windows.1
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

The script reads the compilation database relative to its working
directory, but passes the same path to clang-tidy after switching to each
entry's directory. When the database is outside the build directory, a
relative path can therefore point to a nonexistent location. clang-tidy
then runs without the recorded compilation flags or finds an unrelated
database in a parent directory.

For example, invoking the script with database/compile_commands.json from
the parent of database/ and build/ fails to load the database when its
entries use build/ as their directory.

After reading the JSON file, resolve its containing directory to an
absolute path for clang-tidy's -p option. This preserves the caller's path
resolution when the subprocess changes directory.

The issue, fix, and reproducer were developed with OpenAI Codex assistance.
Verified with Python 3.13 and clang-tidy 23.1.4 using a C file requiring a
definition from the database, with relative and absolute database paths
outside the build directory and a database in the working directory.

Fixes: 6ad7cbc01527 ("Makefile: Add clang-tidy and static analyzer support to makefile")
Signed-off-by: Marcus <baronmarcus2005@gmail.com>
---
 scripts/clang-tools/run-clang-tools.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/clang-tools/run-clang-tools.py b/scripts/clang-tools/run-clang-tools.py
index 79d58b34..cc19f8bb 100755
--- a/scripts/clang-tools/run-clang-tools.py
+++ b/scripts/clang-tools/run-clang-tools.py
@@ -86,6 +86,8 @@ def main():
     with open(args.path) as f:
         datastore = json.load(f)
 
+    args.path = os.path.dirname(os.path.abspath(args.path))
+
     lock = multiprocessing.Lock()
     try:
         with multiprocessing.Pool(initializer=init, initargs=(lock, args)) as pool:

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.51.2.windows.1


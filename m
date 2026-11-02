Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616453;
	b=H0mIKjKsD5H1vLvhOJLmMzLEJ67tzXSG6RY0viBKhFoKI2Z2ps5jbBwL6/C+XcgSMixf
	 M2AAe2MdgWLVwvAVFafGMjfQbbzAXZfd0aKhzieWsy6b/+w3DaY3XqSQZWDb3YdloPmpD
	 Fpaj+uuC5vQ/UqrkpmBgKkqcIj5D0/2w6XZd4WBugFm1gU85SYAM69jaZMTyysymshXyf
	 zHE9stBksW6osdYlEwl/EpnZ0LS8yI9J9BbmEylQYkxC5Dm2SlrpS3od8TuuWONm3+uM2
	 7XmcIr/UvsxucajDzH4jsFo6hn8bGRaTnzHmpEuhRevZrzkI0hmOeBznl8D4SSrq7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616453;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+wYgEbXatInkhlPGnHVcGcwQYZRiNvBT23gLhEtY+s8=;
	b=Xjec8l29You6qbbQIa7atnHe/5uRWcVNDYSXlT82LARbD9+6aNG6z2FJjtWzai8BY3Yq
	 fOiitcMWkNzc7/xQ+Kdt/X+sjzht/wfIkpHWhJ9EBbPNZRG/jbR+xL3JLvulKpGCTW5m1
	 ZdwfYmBOuFxlht34LACwvwwgfGa+1uCVIzvKDl8XSv2a4uz/zCFtWU8epYOMlC/74B9iF
	 9BszuXAalWithXbbp3TE6cYo7ujLtLErse4ZKp2A6Kd+lJeWRym17BOR1rOmYCyvY2ya/
	 Hci23tXM+dXqb/4G1p63rEvbmNQzD1AmhHz59k7/s2DkkEjKHbrynRxaGBjxvMoFupQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqjGWtQ2;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABEC606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:47:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ABEC606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sqjGWtQ2
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so11422465e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616452; x=1794221252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wYgEbXatInkhlPGnHVcGcwQYZRiNvBT23gLhEtY+s8=;
        b=sqjGWtQ2vRyV8uRUrKbKazN0/I5yAXVv0XsmmtzJP2PWcgyWFv0XwS4JyAkNm7if5T
         z7+tFrnln7t+7w0TjwsmYJnYzdWcY/mMqA/tXmzfQjuxNa0aG8/11k7V5jih1qwPZwT9
         fnfQpaJ1AYrWYq7Tpuviy+oezxAHgjZgnHFVj4RQctBmluhqGP1BEbZQGqFwfhmZqKNH
         Uw+JjXtuRV9y5pG/ir0cneBBuMBfxVJOK5/1B0eByYgQ9plGzJwNDkfAqcXFhJ07Jyhr
         RKeSFOEzpZJkfOthYqigZXqihmV4FRH2ABIBvIHX6o9crUJDy/pQeQVT223PDBjAxXmq
         dMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616452; x=1794221252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wYgEbXatInkhlPGnHVcGcwQYZRiNvBT23gLhEtY+s8=;
        b=wSDBHhFhBAVOFMdUnD78HA6SC9tARl+prXaXSh/wyXad4lpJjdSue14Pd2LO2datLp
         w5xI42Pxzcpx6tOLTJVJoWnnNR0WhOUSIU01D2GYlZJwjrZ3e6cHVpNk87aOcZvpWZR/
         kWRnCqiIMUn3JH1Ndh7CEHCU41hXS1wXQSGyq5N2xHtHbKRxR5qPzH79Yt40v7HJO77Y
         qrvqw2vDRLpabrBXNOi6XWz1QrI2r79oKtYe5cpFzW9Ny1GHP56QeHDaVzUOqPQ+xaV/
         xCWDX/glDdqxdZd5G0VFEbwfZ664Rvq9Y108o998aGZdnVce8CxThXPb5rGcDt+1GZEc
         K6JA==
X-Forwarded-Encrypted: i=1; AKwUvBwSffbLlzeSqRQGezvieS87e0pWe1iWgicX70RkJWxRMdJTXbX7Fxj68ul89mVkn8T87VEJLzywXjieO3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsn6/PlN8vgsWrAR7fia9cRKJq/jJ2oznO80nCEvnJ4fzt9CxN
	4KplHLgJX+Kp/GMqaPm3ElX4DTa4VxbgNri/ihWpt7DQDgXXfISMWKEd
X-Gm-Gg: AYBFou0tfgcOrJPSF2LFjfH4RkKodGZARL1UeLK1g7N+lyNCg+dXr3HmaRvHRtrbiRY
	9NGAfpbHHQj8ndeKi/jo4YJ7j1Uldwqrn/Ru7WI+otRQvgKYNsKkHVLpkUatDm+mYJLtHW6z1+c
	jHcVxJ4/l7lNBU0UWdbGALSizWH2pY3lpyAhKZDde2QxP8j42TESw3OSih9JkvbL5GlJqo9DMqO
	dr/mB1OZVBm9WPfso1OksM7qpAg/CQuDfd6OPmhOvqgvGXKKFkTishNFkzkkaz7STn61T9ltA2J
	/PwgnOL2YvNWuGSbwdd1BhIfqy3kuJXNAZYqgijKRAOa7HxaEKbWuKvS2xPnFir0KuBQEPCVo2g
	QiStVVKyhNM8JXBqBHLfwwlLlhbcPfPOrbycJAZTYZYzg5wHtwbF0Toahug8fbnj7HAJpRFLEmb
	J/C5vMMwsAm84szN0u0kitx3ozONTnd+UejfMoun+zawWD3G+PJAjkYi1Z3jNK/+OalrYeZtBwe
	SMFDNDTV7C9UTb5Hc1Eil5cGiK2YtLcCr9u8ExDFHpRFn1TC7berDnUxN37u3jvTnBxIWEZ1tIh
	BoDrULyPAeCS/zxO8hsbyZ+4P1RDxqDO0yiUsDoPBhZZ
X-Received: by 2002:a05:600c:c09b:b0:4b0:c1ae:829 with SMTP id 5b1f17b1804b1-4b0c1ae0ad5mr54814305e9.30.1793616451558;
        Mon, 02 Nov 2026 02:47:31 -0800 (PST)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6c7852esm248939695e9.11.2026.11.02.02.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:47:30 -0800 (PST)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: brauner@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	viro@zeniv.linux.org.uk,
	jack@suse.cz,
	tasos.papagiannnis@gmail.com
Subject: [PATCH vfs-7.5.bpf v2 0/3] bpf: Add bpf_path_getattr()
Date: Mon,  2 Nov 2026 12:46:52 +0200
Message-ID: <20261102104655.70901-1-tasos.papagiannnis@gmail.com>
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

Userspace code can populate BPF maps using file identities obtained from
stat() and related system calls. BPF LSM programs need matching inode and
device numbers to look up those entries. Reading inode fields directly can
give different values on overlayfs and miss filesystem-specific getattr
behavior.

bpf_real_data_inode() resolves the inode hosting a file's data, whose
identity and metadata can differ from those reported by stat() and related
system calls on overlayfs. It does not invoke the filesystem's getattr
operation.

This series adds bpf_path_getattr() for sleepable LSM programs. It takes a
trusted path and calls vfs_getattr_nosec() to avoid calling back into
security_inode_getattr().

The kfunc returns struct kstat. Inode and device identity follow the
filesystem's getattr operation.

Selftests compare basic fields with statx() on tmpfs and on overlayfs
before and after copy-up, accounting for device encoding, and exercise
verifier restrictions. The series also updates the relevant documentation.

Changes in v2:
- Use a thin vfs_getattr_nosec() wrapper returning struct kstat. (Alexei)
- Remove struct bpf_file_stat. (Alexei)
- Update the documentation and tests.
- Rebase onto vfs-7.5.bpf for merging through the VFS tree. (Daniel)

v1:
https://lore.kernel.org/bpf/20261029095952.44833-1-tasos.papagiannnis@gmail.com/

Anastasios Papagiannis (3):
  bpf: Add bpf_path_getattr()
  docs/bpf: Document bpf_path_getattr()
  selftests/bpf: Test bpf_path_getattr()

 Documentation/bpf/fs_kfuncs.rst               |  13 ++
 fs/bpf_fs_kfuncs.c                            |  38 +++-
 .../selftests/bpf/prog_tests/path_getattr.c   | 162 ++++++++++++++++++
 .../selftests/bpf/progs/path_getattr.c        |  42 +++++
 .../bpf/progs/verifier_path_getattr.c         |  57 ++++++
 5 files changed, 311 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/path_getattr.c
 create mode 100644 tools/testing/selftests/bpf/progs/path_getattr.c
 create mode 100644 tools/testing/selftests/bpf/progs/verifier_path_getattr.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936706;
	b=nbv1J9UbQ7Dt08MRPhcbNklcYZ1AI3nvPUQ+dDFYdmYQSqxNa5+qNAjy8KXqGi1n/RYL
	 rffnlE/NGcdmljhO9MDSkCTFbFKcw3LvCraWLKeWCiv8Glnkr50y5i43JZS53On9pgud5
	 bD5zVE8aAA/icZctvTJz4573j6Gx036ygAgA7PMiWHW4kjmmO+RuA8pcMZztXM/XieRH8
	 5Q/PKgN+0/QcUgHstZUUVZaorBMKPf93+36ZsrT9cWI7FrcO4Z3N9/xRQ7ewT7NHWgm0I
	 j3/wXtPSflgVX1z0OlmtguXXDiYr9E3IntqcYH96lMhc52ZynrOKoF70CeCYTeLQJjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936706;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gWwNhbtcLalE2PqcCUTg1GPM/R8CUWdz4KeRs9qScNU=;
	b=Ab0matl3WCUIpUmbl0GFj08HgdVX6dF9OszhgRjKo88SMoKodv6jcSQsJ/R0WihNvFeT
	 ygU/4kQtnCn0TdFsccApIdtSZhG5GUj6zNT2wsNHHR5oM2cgEm76XFhC4K8MTkYl/3gyc
	 6EpmidvgUlQdeEdzcqaVECNF9kpfXUzKYrrbM29pZsp98F0OfEgAzKQl/Qpqwe0U+bChd
	 xrsVlEFw5iI2YwM1T1QL7Z/D3hhZ9Pgv+1i0gZsar8UGkcUCl3GsUxTNcuUMF/5Q7kmGv
	 bWewv9yKKH1xoT6hJIaj/t7ijuE95JdpSP01wqeK3h8h/pnD9W1QhbmuxzsDFGAMsIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzvOX1Zj;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC00606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:31:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC00606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pzvOX1Zj
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1ae58d17cd9so47317c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936705; x=1795541505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWwNhbtcLalE2PqcCUTg1GPM/R8CUWdz4KeRs9qScNU=;
        b=pzvOX1ZjRuGztXjiyCxRHW/9od/kBClMxI2oWyJNSDuL34tQ2PGsDHPNQabR5Z/SSy
         gTuXfvhyqsnBSsNrKDf+JJqN819CfkKZEcvJpfuu2+YMKN/OYg4eb6UyxQip5JPn9vtZ
         BOwSBm0q2ZSSoukT2PVp2y/gwq/WLcoP8Xey1QuA7E+lLt+kJlsl2HiB8Rv16d1AbPNi
         d4YmQnhVHOajoex6vFj4DJgJo2zleVdLWtG3wrD/CdxgHHj1H8Ys/sVyD8+U1xNS8iLg
         COe2G5ZVcsEiA7zY5BeGeRE9nJwHmjAKkQMnMkvFVRlR43pQ+ckHKWU90mCUHyoaWBoN
         Fxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936705; x=1795541505;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWwNhbtcLalE2PqcCUTg1GPM/R8CUWdz4KeRs9qScNU=;
        b=QM8rj89sI8fJ9QWod5k+t5nx00F00bARsbJQoGo8dReFf1QrMKxS9R+IvzOegtmj8P
         oFBX3hLwaypadK9BOAKMwVZhN/BODeoQL0NYVM0RKvW0xNVfAoWgyAPcu6LsKvnbHsAM
         N6XZ3UfJXMrnZwtF4fYOagkkLmpDQMsXLBkQIPEKlMepKpBSZdtL4iDRe9BZYlkzA+lb
         2kZ4fDNdiCcvd1uI4Ep8amInSKQOlhJ6GMxNx1GDeKhd7n/jt7r0yyOq6Nqdc+V6ITQA
         Rcj5THwwC3Oa05esNDp2iTcEYA0yfrGPeHom5qWjr2wQxQqe3KSvS12dGLhrpr/jkzbO
         f7NQ==
X-Forwarded-Encrypted: i=1; AL+hErHe+Yjh1uwLgk8TzkhXP7m+bciMqX+qFRLas9yuO0Mo2XJXDEB1Fjo8Ai5dlvzZEtKrQAfBOmB1cWLTxhk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lWfbeqADzf2w1B3luvese9XNcJ28W9h6vXoOUxPoZPzX6OIOh
	oGtwBu8AWvSapzUKEfl+hBs7iQ9LOc1sDfljTiqbL6zq4kBaUw1x1QsP
X-Gm-Gg: AYBFou3SvTuCBXq7VxqZfV3G6/c4JJ93gfPKLdwNsYV7acsJsKlrKYBPdzGl1/o2Rdr
	gcP2jstu/g3qfeGFyNEP2Fk1g7N3FTDmRMFNJLzXZoFzLcpW8v037j9Vuq80y23+w0aan6WQMqB
	Frwi9/IHP8cR8fGlGGjq9BMvAYuBEDpa5zYGGlbbxMrSZ5ZJctAnFppu/S1zGwIHBfuUeIYIERm
	wJgiit2thD9xMZ14+KknY3dVw0Z504Az52UXVr6x6rN0CFP6i2pm4RwkqJjTf9SwFSu8RLjqVkr
	aPDZEGHWbtwYyRigtH0CjmStaSFKykuWXSNq7lsreGXTTw0h/vb23wP+QlYm/VTzAtqvhNSTeJ5
	/4klkB/dgpilpUyPVUjF12NZjVv6HJpKUH3YHyapx9f8gSS2uuOYMe6llJ6uLS5cszBH3osfne1
	AFUKCmwo2MApaOprKOvDda5RTwfi4ArnssOFgDBaRlFliPOhtOzGmwWZOqACyVdwZSSQTY8y0vf
	5evML7aqFs04PKDL5qkihIZLbUQyAbffoJ3TH3qp4HLzEOfxYBev7HpDtGEhILejdMEBV0DNJlS
	bnLu+pGmk+m+1I8OUER+djZ6g5d4UU7D+5CbNnYj2M9QXYfxcyQvnLjngJKt5Z4u3g==
X-Received: by 2002:a05:701b:4509:20b0:1b2:4e29:92f4 with SMTP id a92af1059eb24-1b543d0e211mr209408c88.39.1794936705172;
        Tue, 17 Nov 2026 09:31:45 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm43450247c88.11.2026.11.17.09.31.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 09:31:44 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dlemoal@kernel.org,
	naohiro.aota@wdc.com,
	jth@kernel.org,
	Ding Feng <dingf3ng@gmail.com>
Subject: [PATCH 0/2] fs, zonefs: ignore RLIMIT_FSIZE values above LLONG_MAX
Date: Wed, 18 Nov 2026 01:31:27 +0800
Message-ID: <20261117173129.61028-1-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
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

generic_write_check_limits() and its zonefs copy store
rlimit(RLIMIT_FSIZE), an unsigned long, in a loff_t. A soft limit
between 2^63 and RLIM_INFINITY turns negative, and every write then
fails with -EFBIG and SIGXFSZ:

  $ bash -c 'ulimit -f 9007199254740992; echo hi > /tmp/f'
  File size limit exceeded

Patch 1 fixes the VFS helper (write, pwrite, writev and copy_file_range
paths). Patch 2 applies the same fix to zonefs.

Jun-ichi Takimoto reported this in 2020 [1]; no fix followed. It came up
again while proving pwrite(2) against POSIX with Frama-C/WP.

Tested on v6.12 (arm64 tinyconfig, QEMU virt, initramfs on ramfs) with
a static test program that sets the soft RLIMIT_FSIZE, writes 2 bytes
and copies 10 bytes with copy_file_range():

  soft limit            unpatched           patched
  1024, 2^63-1          ok                  ok
  2^63, 2^63+4096,
  2^64-2                EFBIG (both)        ok (both)
  1                     short write, then EFBIG (both kernels)

Also reproduced on 6.10.14 (arm64) with write(), pwrite() and
copy_file_range() on tmpfs and overlayfs. Compile-tested for x86_64
defconfig with clang; not run on x86_64.

[1] https://lore.kernel.org/linux-fsdevel/8F9EB913-3AC3-4D89-9DA3-427029F6D211@kba.biglobe.ne.jp/

Ding Feng (2):
  fs: ignore RLIMIT_FSIZE above LLONG_MAX in
    generic_write_check_limits()
  zonefs: ignore RLIMIT_FSIZE above LLONG_MAX in
    zonefs_write_check_limits()

 fs/read_write.c  | 9 +++++----
 fs/zonefs/file.c | 9 +++++----
 2 files changed, 10 insertions(+), 8 deletions(-)

-- 
2.55.0


Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1788A375F65
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 22:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238990; cv=none; b=svhwS0wqMFLn57WYLaChwSYWQs05nlkzxfwU9/UDRZakTGxiQXP8POdo1jORaJhiBAVymrcq1Yf1nzVyqMaw5S6QURB/kumSkG6H78Gg3Wql8FJiCVi72JoauIAAJQRsdOmM/bJ38FpNH0Ovov3gI23e6ZJAXLqmEl8LPLYKIeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238990; c=relaxed/simple;
	bh=8BNZDJ5iz4/1wu414UteONOkuFMl4kc2abj0cb1F91c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fD//JGtAkJWHj8KA1F6VVnTCyfpn+4L5Z/FeC4c4H8a/V6cCbM3NSTa9OpOau3c8BLVjlylDVRrIYi0ydeDkpxnSfdI/FpbK0R861jB+j0NoXaaD2JF3IzSRQxkThVnYCG8bbd+KkWvZo6Q2acKQigiPJ5RCrCkZJnBt/aUr5Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBVHP78G; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBVHP78G"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-93cb545be7fso185796485a.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 15:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791238988; x=1791843788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zm3qbJcYN++UytOTIcHpkF4tTGcr1mzHt5Wej3FwNj0=;
        b=qBVHP78GxfXKJ4NcS6s8OlPHc4+wf9A1xUCzJGNCljYmYCAwmgIwo2Mr1/Aiel/M25
         mg6J5P378oCgJmMYKxlOdO4nCEV3VoCDVw+0x4MAT24Ij0j5o0N03drsusUvQ8S5Qjky
         kn0ZC4iYKYi6pgTWFMDCgQhLozIqHIOaIYCvTuJUxB8vjnl7cx+1+e9i59KwtRhQmzLK
         xG5cmgkl1k3eR1iCwlGOfh77r+ioHEj/QoUpTegHpNHaHbN3vZ+Rdwe7YNbgFZqds872
         CHLGWtuInHXojFDXalH3I14Qk5ierzeFDg/fbnZc7Z2WG6JL2WPf3Wgz+NnBRA/bkwBm
         mtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791238988; x=1791843788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zm3qbJcYN++UytOTIcHpkF4tTGcr1mzHt5Wej3FwNj0=;
        b=Z8eQxIDvlBbjCFzmCXJCesJHTh8k+KXZHqUq0U4U9olx9qzxgCMhJo5IkXjUqGvyWi
         HhN/YZbp+30mFpsLGXYxu00Hz+zI4qEn3bIvAsQCEXgCJvZRmctWLrpbzmFVFdwWluww
         TDMqL9HMVZ2NNnAtEBQABTbZZKuiPD6vW/ADvCGOi8nhe2OQfETPjvAgn076D6Y7lPx2
         I37PS3AUYpKOslXphM47E1VVSysLwklU6xDZSd511t8+OCpqbbJbEXFSe3BW4hpNnTaj
         ADu5HS+PHIJLQGlv7TrkrsJFbKd5yzSpTw11f4K0T7aH7oHSOpIbg+rhtsXkiR9tq9UD
         3ouQ==
X-Gm-Message-State: AFuF++nNSGFa7dFrCsWpbLZww41643IqQWRzCfDCLopGB4u/F3HYFyOn
	neyoSNrBBxmJq5lIyFz5HvyK+xWbxeaRpcvOys0oso38Wciph6IiH5kJ
X-Gm-Gg: AYBFou0PTu0e4CkCUL0sSG8D+RnxK9zvxtdy1X1c8HxS10e5n1XmdvJ67KgTrJ/bypw
	ELYAqtOy4hx3Mv9e4gFrY9DR4S10SVvCMRib1bqvp/rgsrQN+v3v0DmFLHI6M4eK2CiDZbZMWPo
	+6mbQRWM50Svhsm17qWSfCMU9Ub4X3OYIsU9auiR0p5OuAaPcbJQej4I2Zv8Ys8qmvfGctqFV94
	QhhL3vC4/PkwuLeyPEyg/0hPeDv2VmYZ/FdhuCnw4tD1xGmoGq4BRiVx/hSjF0lXHb5HfNTPFSv
	rX/M10mafSBGH7rqeEN1yehOF2TLwRyecGlNqIHXzyYw4LDkZHReYlRlnpbOqO46coGFS3BBYKX
	NGarM7NHpj4AEsQBc4QwuOHVa4ezrA3GajiJpkfJUrqnuUUKjgSkAhddFIj6/sZjdTCBWvLuR/g
	4s3AkxMWgcAFwqRrS+dVCncwnOxTaDJWjTKcy3Zjd5kFXly4SLQoJ28yeCG28qYLtRW4/miROu
X-Received: by 2002:a05:620a:4113:b0:93b:cb6d:6d73 with SMTP id af79cd13be357-93cf1740459mr2014636685a.32.1791238987826;
        Mon, 05 Oct 2026 15:23:07 -0700 (PDT)
Received: from fedora ([47.14.88.220])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca26371bsm977338985a.30.2026.10.05.15.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 15:23:07 -0700 (PDT)
From: Armaan Sandhu <armaan.sandhu0504@gmail.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Armaan Sandhu <armaan.sandhu0504@gmail.com>
Subject: [PATCH] objtool: Remove redundant hash_init() of the instruction hash
Date: Mon,  5 Oct 2026 18:22:47 -0400
Message-ID: <20261005222247.566632-1-armaan.sandhu0504@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

objtool_open_read() calls hash_init() on file.insn_hash, a 2^20 bucket
(8 MiB) table in the static objtool_file. Static storage is already
zeroed and objtool_open_read() refuses to run twice, so the call only
writes zeroes over zeroes. It also faults in all 2048 pages of the
table on every run, even for a small module that uses a handful of
buckets.

Drop it. The table pages are now only faulted in when a bucket is used.

For a small module (xt_mark.o), objtool goes from 2.21 ms to 0.70 ms
and from 2189 to 210 page faults. Running objtool over all 4856 modules
of a Fedora 7.2.8 kernel (--module --dry-run) takes 17.3 s of CPU time
instead of 23.7 s (-27%), and 7.1M page faults instead of 12.4M.

The output is unchanged: vmlinux.o and all modules of an x86_64
defconfig build are byte-identical, and objtool reports the same
results for all 4856 Fedora modules.

Signed-off-by: Armaan Sandhu <armaan.sandhu0504@gmail.com>
---
 tools/objtool/objtool.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/objtool/objtool.c b/tools/objtool/objtool.c
index a4e139dee7e9..71e048f8582a 100644
--- a/tools/objtool/objtool.c
+++ b/tools/objtool/objtool.c
@@ -29,7 +29,6 @@ struct objtool_file *objtool_open_read(const char *filename)
 	if (!file.elf)
 		return NULL;
 
-	hash_init(file.insn_hash);
 	INIT_LIST_HEAD(&file.retpoline_call_list);
 	INIT_LIST_HEAD(&file.return_thunk_list);
 	INIT_LIST_HEAD(&file.static_call_list);
-- 
2.55.0


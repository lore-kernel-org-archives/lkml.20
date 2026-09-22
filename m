Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22227397936
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790107748; cv=none; b=OmNkJ7aShgdS+ElLHRn4XQoG27l4Y2cxb6fuC8ku9Q/ujBfJsO8uogeZG67fkUir62Z+ENzq792ckggMUHn+vltH/iWtdIeaSmXydAX+Lzy3LWWHlNLAai8tDyzLHd/1iOphe+MQpDMVhGfIN3KPQ0K3zKueYMK5yBxcsOhJ/jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790107748; c=relaxed/simple;
	bh=q0sZDppUsa+eu5sPpZoAEi+M6OKVy6NJVptfUVXehJQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cGJUJkFdX/5tiCg7stKpG4HLKHbJ6HkkkBR1wXQl+CDhBcjUmItktLmkr9cC7nBw510oJNtMBP3QbahXORRVR/h8OBiId2sr0tXROC8djExXUZ/2i2NABEbxjr+KYt8V3AzvNX14P9HcTuvGNmAt4FmSCvvBrIkH+L5hgN1uNB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1+oAekl; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1+oAekl"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47c57070c52so82731fac.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790107711; x=1790712511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AlFlDOH8oZxKnMeTYk9lUtSf3sYQz7J3e363i7elvXc=;
        b=h1+oAekldty/KlscOKiGPYVEtvgOO2vLr2xMaL1f78rh2FMC/qnCkoKhbEm2U/fsrv
         1h7wA/Mpc2IJobVP8meGgjHsOatUjfbWcHaWQOMkbypk0+/3UHKafiXnok3Th06GOmw6
         kUMYL3njRRlIbisYK7A7jZCm3vUTiYPdysm2ZMzvM5XxOm4xYS8lJBwSrsu2i5QgTxN4
         jObObBzwlpvEWRIgnXb0X+NvxD1MLge0vgs5o7rNNMMYtFkmgDKlYXDU7EqHEN7SpWpm
         7fYq+lZqQ+ZJdG/fM0XQ6Trhrqx2+2qipAN7fyk+XYOVcynfJwfQ/7ifnPCjLpZmhWZI
         r0Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790107711; x=1790712511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AlFlDOH8oZxKnMeTYk9lUtSf3sYQz7J3e363i7elvXc=;
        b=2ZTEHaqwwKtCDeAgISJ/1pzDN0F56YLoa90iCjzS916decXx0eQVlrvOgcA3powDSZ
         y1dP8e8rCT5SZCiKRuH+TphBTKLSPCvNAaDI1nZcnD449T2ckPvVnSJl5gwphunqT78R
         opgMFfnAaFLYuy8LRnEfzgXU1m3Ll3EhTrm/n0ycqmyQQcj+048YYAn5Ff9LjzyNd1x5
         0MRJjcg+HY+mFz3Afk9sOYVsabV1tar7boqzXc03Jkpcxkgo/hhNRC24vY3chMFlaG4o
         Y8nRxoY/t3QqjVzNaAptd9pOk3SS+HkLcEtMesnDmEI8gDPhYe9yAOQ/d8385GGFUCeR
         HAtg==
X-Forwarded-Encrypted: i=1; AKwUvBx6wbf35ha1qMe4vJyiDaz481t8vIkip+SEu/eFAmYeBtSF0iEn5SYxazaPR75C7TC16LU3ezYfvo0N5wc=@vger.kernel.org
X-Gm-Message-State: AFuF++nVE/vieOgLx165X+4C2F2BPTr0Uosii6Sj7S/cytcvFxZvxF3J
	FSiqpqf2rY5Y2fuo5cLxooamF3Gd7GWtFSr73QcSjLlcyJ+7BrmniqC6
X-Gm-Gg: AYBFou2/LaBriEFp0qRzUUfN2pR4Cw3vfSJ3nzvY7reETLakHbwMH8TfjXXqEOdp9kU
	pOq4Wi12asUY04h+2ZxA4H4kkPFhjoe3sNTH3OtA/OYEpK+HUl0pzYvMh3lIuBBfr+p5j81+VVW
	sSEg4Xu8l//mZv20vM5AYOwYwTyv2Pnmlgq+aHcbA757K3NEAlXODVkcRgciGRtWBYtXarkXf2a
	eNCWroYhIrdtyeSibAlPV8J/h+KbNVX/RDtPPHGV0x6g7ILn58iuE0Mp8WFg/ZPQlAzonK0zksD
	sfEOeVNioRdhx+AwcNmnWQ1VXPkSoKvAtSwn2wd/3POGk+7I+vOIdXTq04uP1hJFceEPoaBIpKJ
	jSrSMW61quAmiZdI6SxQkMGiZ1D4obbT0NbkfU6+fYix04BrNvgm//V6V4LxtNEgpm3xBO+OJCX
	tZ6K+3Z6xi5IsosVt1G3rGLVd665rNlP0UidH8Mu+u2TiY5DzkPXHTqYHZsssMRCLGgLbRAMJAi
	hUa59fXMsD15v/4wbYaj1BnUodKaNgNWe3cssCXzMW4Sx297xqOIyHBh9Njx3Go9uJUhgcMGOwG
	DrPGjcpTKqTZHv/dNbxvRZahTmqtxnkG+yp7jU4a
X-Received: by 2002:a05:6870:e996:b0:48f:82a7:84cc with SMTP id 586e51a60fabf-4908e34ec00mr569116fac.0.1790107711491;
        Tue, 22 Sep 2026 13:08:31 -0700 (PDT)
Received: from [100.82.231.29] (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4908eb9237asm564087fac.12.2026.09.22.13.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:08:31 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Tue, 22 Sep 2026 14:08:21 -0600
Subject: [PATCH v4 4/4] kallsyms: Unroll 24-bit sequence reconstruction in
 get_symbol_seq()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ksyms-tune-v4-4-92acea84b911@gmail.com>
References: <20260922-ksyms-tune-v4-0-92acea84b911@gmail.com>
In-Reply-To: <20260922-ksyms-tune-v4-0-92acea84b911@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, Kees Cook <kees@kernel.org>, 
 David Laight <david.laight.linux@gmail.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Jim Cromie <jim.cromie@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790107704; l=1647;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=q0sZDppUsa+eu5sPpZoAEi+M6OKVy6NJVptfUVXehJQ=;
 b=YtdomdHVifgDSmUNlCebB5wNAipNPmPSACPDou6l7lL+wvQSUi9uR5FwEr5jNvxcdDOPZLnBM
 6f2Qs6omN03AmSblhpXa5N5LBIdHGXVNnX0ZTVbc9Yh66o/qdxqaklq
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=

kallsyms_seqs_of_names[] stores 3-byte big-endian sequence indices that
map alphabetical symbol positions to address-ordered symbol records.
Currently, get_symbol_seq() reconstructs each 24-bit integer using a
3-iteration for-loop that shifts and bitwise-ORs each byte sequentially.
During binary search in kallsyms_lookup_names() and duplicate boundary
scans, this loop introduces branch and loop overhead on the hot lookup
path.

Mark get_symbol_seq() as static inline and unroll the 3-byte extraction
into direct byte shifts: (p[0] << 16) | (p[1] << 8) | p[2]. This
eliminates loop induction variable maintenance and allows the compiler
to generate direct loads and constant shifts.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Changes in v3:
- Added as a standalone micro-optimization patch (addresses David
  Laight review).
---
 kernel/kallsyms.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index bb34b4c0f690..35484361201f 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -280,14 +280,11 @@ unsigned long kallsyms_sym_address(int idx)
 	return (unsigned long)offset_to_ptr(kallsyms_offsets + idx);
 }
 
-static unsigned int get_symbol_seq(int index)
+static inline unsigned int get_symbol_seq(int index)
 {
-	unsigned int i, seq = 0;
+	const u8 *p = &kallsyms_seqs_of_names[3 * index];
 
-	for (i = 0; i < 3; i++)
-		seq = (seq << 8) | kallsyms_seqs_of_names[3 * index + i];
-
-	return seq;
+	return (p[0] << 16) | (p[1] << 8) | p[2];
 }
 
 static int kallsyms_lookup_names(const char *name,

-- 
2.55.0


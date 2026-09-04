Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F08E3876CC
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520371; cv=none; b=Le5C4YPCEsoLArkdJEz91FfS+nualh6/UuoqA2vaThD4e6npZanQj9rUhLlHKIo8tNFhu+nvtFUzc/b27U5S4fWeJxeZeJnbMrROXN2sb7ExLeXPQcbqx0qXWGosuD9nrU6vkWJUcTcuUmVkZ6Lku+8nCtezgRET5Ja4Xs5Xewg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520371; c=relaxed/simple;
	bh=DHPt0ajr/ScpG1AzK0NZd8llVX17ojxx+FdQYfJaM0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tjkr+1t1zh1yxPEkSLAEXJNs7iA34DiKsBkUk1kKXVWLDjSLvPQOUNSu1nW6yi7TvjyZnclbQS6wI1YssiHrTRVRZTRL3rGQv0kyBj56C/8Ex63DeNGNdaedRAM8SCNqqQSAbb75ahhrBnTrnTGu4jW9moO2mzceutHzbXCzvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DfySVZQ0; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DfySVZQ0"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b7b4b08d78so251563eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520369; x=1789125169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9/fhhLmAmJEvmpTADPJlYBRvkTwD3NWdiRADhZ3Ejxk=;
        b=DfySVZQ0kHig7O9zqxRsQtnATHbLPh7Nit6/GsyPgBeaomzeSPa/EIcjU5DBmbmDqJ
         5lWBq86HR8Oi3I5Gdkjatm+nzOcbuZbSMCd5STI5pAhQmzRVhwC/8U12Piq/OxJb+C0T
         wBEXO7J2eros2El1DEZfYj/5y+ltQaqLyfstlcO/WwW4y125Dp4PFTtGtoqf7wJ+l4xK
         qstOWh1pZ+2jvavz5dpVGe+szbwSiJLK9+ZTN7yyrx7nblBbEeGyajoCED1bEBeIrCz4
         jm4hkfteJzKAO0Wk8rHTQFckyXQIQ+gvHLysuJWCoC1BlND3QQ2IB40w6RxmLYGhi/TO
         JaQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520369; x=1789125169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/fhhLmAmJEvmpTADPJlYBRvkTwD3NWdiRADhZ3Ejxk=;
        b=m2qjMw2OZ8Yv0nquOO40rZVv0d5vshYBwfa1l8WFMv18ResNcSPDEfQQSj6ko228X8
         8lGGA2eDYRb9gHNr0W08BM+6ta2k4Y3Uo60MYe13Yt5n0+iwK1gEeuwoILKiiTxZLhiS
         2OWXdP2Kjbtner9lvzngTUFiM6ntTQJ7B8ntzJGLrKUKlX2e8pCi6AzTsBGe1p6bRQW5
         AlvTH/XBci75BI1xJHDc1MduibZ4slRDASFE+Ru3obibchiWYwbRRrc9nrtTH4kNpkET
         JIy0V9HnNRGDqGuCD9qeiSE2aG2GNstmKMK+5MYt1/FBhIdCVeMzocVPXmQ56s9U2+fF
         py/g==
X-Gm-Message-State: AFuF++kS0TwwIjuhSrBSQ2+UYu8xZ3gXv/1V5lvjHtHrpCeu3cdJriTs
	sQ88t1uw05L1vAP26v2LIu1ELGW4zcgLHQlgeuVy36EaYSMviYnHc2/0A/LIpvZbGFA=
X-Gm-Gg: AYBFou31fydIfJNy9hCGWWCS9XeQUJyUtncvd3gxdsvtAoC6WmhB37llJnO4Fr4wZ+2
	QZPnt89ZLcCLZVwLnQeHZbKwnrp5VdiFstMBaRiJ+yI0068X0N+o0YX217tKcuBeEOwH6qOiIMC
	vcqJl0uf5Tx6mXZlJX5MaFiriQppLppZJVNiORSTJduJY/OGhDhqn8+qfI0JCog+JzorbJfXOHs
	BOCzYd4i9cNJfi/E/kCHfnbK7KObZkWyyA4kWmH7XNHphjtsqwBJplEZf53yadIneCTZe0oiaZ0
	zpP7ScJyMOOjrnZtyJPLimKGaPOF4zn5xPMqRsNLRuKnLwoYlYcqpsHg5uO9IDBY30/6tSSR0i8
	WL0Lce0EclBAH/38SnZVBZyqdUC6QemJ4MWCvDXIZa5bBTLY0NI3Wr38fNbZBtYTpIF7AuFKNzj
	KLj82qUopQM9UrTyBPpPs1ueWWudfcrW0OIKLtIyA1b4V8M9hla5IbqPJPkQjjwwWZU4+FNvruT
	EhG/LLdNSeLA7w=
X-Received: by 2002:a05:6820:f023:b0:6b3:8240:b2e9 with SMTP id 006d021491bc7-6b6fbcd088amr4047876eaf.21.1788520368993;
        Fri, 04 Sep 2026 04:12:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm7305785c88.5.2026.09.04.04.12.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:12:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] sparc: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 16:42:38 +0530
Message-ID: <20260904111244.24636-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This corrects 2 misspellings and repeated words in comments.  Each is a
separate patch so that any one of them can be dropped without touching
the rest.

Nothing outside comments changes.  Every touched C file was checked by
dropping its comments, replacing each string literal with a placeholder
and collapsing whitespace; what remained was identical before and after,
so the compiled code cannot differ.

The mistakes were found with scripts/checkpatch.pl against the list in
scripts/spelling.txt.  The scanning, the edits and the changelogs were
produced with Cursor running the claude-opus-5 model, from a request to
find and fix spelling mistakes across the tree, and every correction was
then re-checked by the comparison described above.  Words that name an
identifier were left alone deliberately, even when they read as typos,
because correcting the prose would make the comment disagree with the
code it describes.

Tested by building x86_64 defconfig at v7.3-rc1-269-gbc35965f6940, which
is clean.  Nothing else was built, so any patch touching code that
x86_64 defconfig does not compile has been read but not compiled.

Hemanth Selam (2):
  sparc: fix typos in comments
  sparc: fix repeated words in comments

 arch/sparc/include/asm/asm-prototypes.h |  2 +-
 arch/sparc/include/asm/bbc.h            |  2 +-
 arch/sparc/include/asm/hypervisor.h     | 10 +++++-----
 arch/sparc/kernel/head_64.S             |  4 ++--
 arch/sparc/kernel/process_32.c          |  2 +-
 arch/sparc/kernel/process_64.c          |  2 +-
 arch/sparc/kernel/traps_64.c            |  4 ++--
 arch/sparc/mm/init_64.c                 |  2 +-
 arch/sparc/prom/tree_32.c               |  2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.48.1


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607107;
	b=yHkskpoBj7/mSd7STkKN3fltHUbt7s92F0nZapG4t+HchF4fm0r7ixXuzoAHJhL3AT6+
	 Q6JMLo+Izds7EH6ZDtoUbKYcl7F5B+B5+yqS3TaYq2ZFtDUty4aqJnVtUoXcO4fPwt6Ha
	 TJa/kF1EQZp6lv91yjYqiRAmGq5r1nKs9GLaXpFwyVu+/PXRbK7XsIAtQ0qjpv8+HvPNK
	 u+mhV2xWBU4rAKPrygtRBpHLEaz2PwkJG+/Z3jJ97zduk2mKNvkFE1RUrGXvOf6ehTyB/
	 iZ2QsFoYM2+cuJyc7uHjwURPZeExi53f6wFzWsuxxdjdlLbviX6eM3EjAw4rq4GtWkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607107;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n45aLFyavI2LtF2m7I+VQnPGHMyctlLmfLLfzdcQlpQ=;
	b=E9UPFKujTOv5kQqxa3/eT1Sezx/QHlXlmWqVT2c3DM8O13iE+WC8X0vyfgS3up2OtNiz
	 oP5hQC8xfpkBCQ6yWxmIhFeRKocH1sn2AS4NosLNSqYiOr4IcNYPZlM8l+CUEee2sW2++
	 jr5sf8O4VcKpenA2ETVWmYp26bqFxT60hvnfFde1xsMykS61a01lDpCPZJZLwLxhAdZrO
	 sIW7VvSAiv9MK576YEIvmprkgWO6uaPkvBwqvcIHDFFQnJtHfCO08Pa3SHg6j9OrOtGUP
	 sNhCj6AAmrfT4ikGWyMSH/9UNAVSbBud2qXhxPpVSVw1h6QJsLpjNhbxc/jQEatn9gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUS6RQPy;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6988606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6988606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XUS6RQPy
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so19947955e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793607105; x=1794211905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n45aLFyavI2LtF2m7I+VQnPGHMyctlLmfLLfzdcQlpQ=;
        b=XUS6RQPyb3otLnmDTaqJaQXOx+d5IGnB97gdhyJ16YFLMBS9Oi9L5ba5RebRSivImX
         xUKMnCVgsV8Zo94W80KHvK8Y6iHgiVUyQ3mxKPGhDQ8t+goiA1toTD7uDr0dy4ExQvbf
         UkqXJFec3gDJSxPjQiiS3zCpiwwd2IV3+dCOsbo2vQndD0h3weBG6qM1+8VyU3zYfRDB
         p4F+vHBU3+378wo8ZVn6soA6X+CfQdNY8KXaJZfIQ8zZizSbpiMf2ARPB9ehyNNWz8pN
         tEqOOt04zgi2h4pWjc7qyqfFb1693V/mCU9IrLV80LXrwFhLuGmv7fJzKMUdGh6t6pi6
         VEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607105; x=1794211905;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n45aLFyavI2LtF2m7I+VQnPGHMyctlLmfLLfzdcQlpQ=;
        b=ibkb7/mqsRw19n3Rzvx8o2beW7NfWteQEfvcP6Bt08IGPHRTOr4xfOIWloXdWSsig9
         FmbvbNR+1pxryQbeubyI4hDd30nFU+RSaB3Prm2YZibENtzZxSk0PDr+Hu86Lk5GhWvb
         9Z+8nmkLeguGbsC+o7B4IlWXxgJfa5carLMLYP+fMQBUmXzZnpLTZ8jcomjBJH7z9F9g
         HS1jZyH2w4MjnjFCWsUdIQdrWyHBTO+fOiUSH6OFZOsY0gRoXZk6gmmDpVG3t3Yu4UCC
         mAIgmZSk0HHS7i1ZVOdlRRORBFsPIOizB1hVLlK/hTxfaus61B41jE6o3aODK71slEXs
         +PWA==
X-Forwarded-Encrypted: i=1; AKwUvBz6sxl0xIKr6cuebnCWFoks7glpyQJu7Du8qWNsVpzRWUP7iKJeO7XpCCNf1ha4qRfpGgGICnx+W8WSr5E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYa1KoH2Hs6L3ztzdcU12PAzMeLr+1gwV9FtPHl4g0mNa/8yO+
	n8Pi46nwGDA+dlNUnrrgvvPOU0cPfNm+W0skf8hzfXYwiOTdcMSU7XoR
X-Gm-Gg: AYBFou3+9eGJlEH4B73aBMt9V9SZyYYcRwdn+cS9pErhIrdeS6spkYal9K1nXCSLFZa
	ibmWqLeOAjqLGzhk53lqc6joNGVklQkaUY2HaZ2IPJ+2TMDEhYkrHWB8zTIIkyDLti7oZ8YoxiF
	b08gn32WbyeQpv77xlBCxLyozOUnQ7hH+8oNNXH3AlrqaIwoP9/1Vr0U1z/d6Y6qA8IcwRciKCS
	C/6j+AtKSJPKjsHCxHeSEvsZHrzbMFBuJDkWOr1xZkw9pn/F0CfJcWkgfY+a/A+3OiezVM4iE6g
	6yyiitUq3I2Sn1+PHqqRIXI6nIwRArjSDTtxV+h0eLRo3PywRoC51FEOMsUAKMDseFC/AwD0zmo
	0b37OVIz9gsnI8RdksOabORV7E+pTd+H1KVuv/J087FgRhSKOyHSepeiKR8tW8lUUmrne1iXtxd
	YzefUVIjwJI+0MixtGHew1N9OJt04m21sF4STTQ1F+FvqzGtZsBT1NuHNok1cqx4rGOtR4hCWBs
	pnte7aUdYXaspC/NCMdu8AM5BXJ+6cS2W4vs+Q6NoeKxGL+zg4Mu0JdbHXAE+AKhZn4Ksyeqnwt
	6MuJH7fQ9kEA6bCETneQAaYGUvnOl4JBMuc=
X-Received: by 2002:a05:600c:46d2:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4ac1980118cmr202498175e9.33.1793607105171;
        Mon, 02 Nov 2026 00:11:45 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm333331005e9.14.2026.11.02.00.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:11:44 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v2 0/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Mon,  2 Nov 2026 09:11:29 +0100
Message-ID: <20261102081140.201987-1-azpijr@gmail.com>
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

The urgent fixes made hugetlb_fault() tolerate uffd bits left in VMAs
that are no longer registered for them, and asked for follow-ups that
remove the sources [1]. This is one: a hugetlb UFFDIO_COPY_MODE_WP copy
that has to fault in its source page doesn't recheck the WP registration
before retrying, so re-registering the range without WP in that window
leaves a uffd-wp PTE behind.

Patch 1 adds the missing check. Patch 2 adds a uffd-unit-tests case for
it, which fails on hugetlb without patch 1.

The other source 6/10 of [1] mentions, UFFDIO_COPY in MODE_WP racing
with UFFDIO_UNREGISTER [2], is closed by "mm/userfaultfd: write-lock the
VMA before waking waiters when unregistering" [3].

Based on mm-unstable.

Tested on x86_64 in QEMU.

[1] https://lore.kernel.org/20261015-urgent_fixes-v1-0-42796911043b@kernel.org
[2] https://lore.kernel.org/20261015-urgent_fixes-v1-6-42796911043b@kernel.org
[3] https://lore.kernel.org/20261027-fixes_core-v1-23-6f74bec9a5bb@kernel.org (v1, now 23/47 in v3)

Changes in v2:
- 1/2: drop the leftover sentence and the non-hugetlb reference from the
  commit message, add Mike's Reviewed-by
- 2/2: "all memory types" in the commit message, rename copy to result
- rebase on mm-unstable

v1: https://lore.kernel.org/20261029221129.89068-1-azpijr@gmail.com

Jose A. Perez de Azpillaga (2):
  mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY
    retry
  selftests/mm: add a uffd test for re-registering during UFFDIO_COPY

 mm/userfaultfd.c                             |   4 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 2 files changed, 109 insertions(+)


base-commit: 34f88a114888c9dba49e45f2b0c2a3e83c4c871c
-- 
2.56.0


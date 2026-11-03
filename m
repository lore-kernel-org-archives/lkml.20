Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701728;
	b=sVCeSECtizXpDzuuIKXnI7O9cAsovu4S+zi/P08do0Os6WJMPJ/tq63VIniV/pLrwRUh
	 smx5nthAmeyq0mjZfVsrRjqQLqZx98iF1h+XyCfKnCL8w7WnJIR8nMEsCo+hLJjSDlDq/
	 9TIqj8xqOxcWAJ3AMMZNzoKbMKLJt1dMtmjnNPKi5LSMjgHFrk14yqnMszf7+zMENwNwo
	 BQsQCKNaBWwefjpoy2/enB5jdCUwjcN6m07PvN74m4KKyB1K+gzSirch0Kh4/dpDpQvC7
	 FLuuXh/VL29nYzkhAkHpe7JN8kAMgCf7+vtJRvi1WZp1Cg1JnAYRsuUKSKbKWDuhZ7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+slzZtIqAmiMo+gR8iGw7sSnQz1zeHTQz+LiYF2Om1s=;
	b=axPX+lWlxbbvMSyUw0fYGSZ4VbV6Y1J+ZX4f7/thk6OmsxlLgp1k+73+vM1xaqy99RXL
	 gWeQ12h4RgEYMdRjhN1SEOWwsEZIb5zfQ5uU7QPek2Z6HwG3io7sGD9LJEhum9oGn6pZO
	 uN13M6iUY04Xv7Jqjb097viz+Ic0ZZ2qniixkUgOr/s55Dl6XmlAdR97bDokn0hWUJZ0m
	 vvNT2JqZkGihXRs5fj8u6D5Ysw/PwjZHPxGJEsC0st2okgemUsQ/CB4mlNyPW/0vDd66r
	 FyLNcl8bAGmkWC5iDp2cmzXYMmIYT97BGE/i4w3XTyJy/mh50i4lsh7vTRRMQ2JbP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgMfvJwK;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB2C607153B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BB2C607153B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jgMfvJwK
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfb76b304so380567f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701726; x=1794306526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+slzZtIqAmiMo+gR8iGw7sSnQz1zeHTQz+LiYF2Om1s=;
        b=jgMfvJwKLdkmgUM6l2TOqZELOJ6ig3ZVEGTUwduPV4c+zsQn3+YESL5L+WYD0Y3KZQ
         eQiEIwJVHJow0yant5InqS7PfE3x9YEHccd5hFvXroYV1qHqS6o2nOj9OjI4xV8/qJwQ
         VqvZq3ntFfzFe0dT7yi/B59rTcSsTW7TWI1ycFsF5NXMozZ9mz68KXijqgSV3ebkKq0f
         brS7Ns/VwL+YyUNg7VB8z/zUaLeQEoZO1Gugkb1JzukwTTKlCPIX8opDvs6RQRylgKSH
         w8cobvXSeeiD90kVslFuGOvLJlcw9gU3OnJ72W2PKGfz5rCiQ8GGXs3lZh7H2SbTJh/8
         7Vfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701726; x=1794306526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+slzZtIqAmiMo+gR8iGw7sSnQz1zeHTQz+LiYF2Om1s=;
        b=0wpTDAeRbElKa/+H5zloZNzuy8WR1CPwdYLX2f3t3tcCn62hkmo3wZFnX/tnMnzjJL
         WPjQXzXdjGIFSUfiRnEdFqr2INPQc6XlruA7xoFJRgqpXRKsEW59t8ncDBdlV6WlpdpM
         MhqCuOtY88wayZ1RCdj7hKAxdC+BvCAVyKrcnjFWdhmf2oepGjKCpsSquutjyr4r54r4
         xkom2y5XiM5r7jnjiXYavxIBQzjwi4cveUMEstI+2pibwB/P32u4TuQKeQwqaw/b114Y
         lRUR1kJJPnCcxbLNoIPwC/oQNQrght6pJn3JGCn61rgrqtWa2rfIRQkSeBgZhz6Kobrb
         BVTg==
X-Forwarded-Encrypted: i=1; AKwUvByVCSOfBZXxggBWnXMSsgwwjhkLpSoVLAtoNBJjJhm96US1AAVPIfiwxO/Y+iPWPNZuVPKLFZuZsFygOXk=@vger.kernel.org
X-Gm-Message-State: APuU4Z87IW4IYssYkd8gJxItdIrLk5DBzgqGfOWeTqqTLkT3yvlEcEYc
	IHjukvxBqtP1F+/s9bw6xKq5OeMPdrhyjgEdoAolqEww/wx2LuzBgQnJ
X-Gm-Gg: AYBFou2b6utEQypKUanyCAmq/LiCrh7kzhjoNclVfrouyLJCLRBTnStT/qcI1b506Ht
	O4fXfbtv5+XqQm+yDoIEutgwj7Wom/do1E00VrBL46b6dEYa8F1k4AHiOSh/ZvVy+dNAJsRBUm4
	Uq50jUgusa7yvWIYweGCPS+ZKVFFLnZpUuchM+H06Ij/19BOC3eCsjyM3vS1V1mlhS/Zboq9WRP
	ZibNtpO1+I7LFDW9bi7gtiPU0vEzHo1ld1tJuQ5YuQunqjNmgUqFiLzXY5YmQqdobN8BpYzppDu
	eymrfmW1f1MkCDHPb3RJPzVDMKj7m/0btBdZNbeks+jt5PEtB73rS/NZYLtjVinWNWiNWAhz8uq
	HYJNw75EHXMz9D6ho0oQu3IZC0QGpC5iM8kALrCkiOIYJ/nEgzCsFOFye7i8To9RngaP8pjiHNh
	Dgw09GPm3djQua3NwDcoxX/tCs/uHxvs/GcE5IVxoh6B9lkFr77NCTBqEbA21mktxJXgLqL5rj5
	Je2ZBNcuyPOUYXZq9yKP5atS7wQLjIkZlKseOQjxfwZHkNh+b4nGmZKOZig/xaT4h4W6KEjHifm
	6thbKLfisxmCXg==
X-Received: by 2002:a05:6000:e89:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e6e4fac5bmr20986010f8f.43.1793701726165;
        Tue, 03 Nov 2026 02:28:46 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7815fsm24941003f8f.22.2026.11.03.02.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:28:45 -0800 (PST)
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
Subject: [PATCH v3 0/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Tue,  3 Nov 2026 11:28:34 +0100
Message-ID: <20261103102840.68903-1-azpijr@gmail.com>
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
[3] https://lore.kernel.org/20261031-fixes_core-v3-23-d6437171ecc3@kernel.org (in linux-next)
[4] https://lore.kernel.org/sashiko-outbox-194303@kernel.org

Changes in v3:
- 2/2: open the source userfaultfd with O_NONBLOCK and check for POLLIN,
  so poll() waits for the fault instead of returning POLLERR at once
  (reported by sashiko [4]), add Mike's Reviewed-by
- rebase on mm-unstable

Changes in v2:
- 1/2: drop the leftover sentence and the non-hugetlb reference from the
  commit message, add Mike's Reviewed-by
- 2/2: "all memory types" in the commit message, rename copy to result
- rebase on mm-unstable

v2: https://lore.kernel.org/20261102081140.201987-1-azpijr@gmail.com
v1: https://lore.kernel.org/20261029221129.89068-1-azpijr@gmail.com

Jose A. Perez de Azpillaga (2):
  mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY
    retry
  selftests/mm: add a uffd test for re-registering during UFFDIO_COPY

 mm/userfaultfd.c                             |   4 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 2 files changed, 109 insertions(+)


base-commit: 0ea6dc8c4a2192227ec25768625686b8fcd5cb09
--
2.56.0


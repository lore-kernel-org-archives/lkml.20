Received: from out-utut-a194.jellyfish.systems (out-utut-a194.jellyfish.systems [198.177.127.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38EF372B5A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.177.127.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861366; cv=none; b=Q+qrSdHcOJ5mPmCIBfjAVuttaOKD4FfH1owVIs2YPoZGGRV7SIeOuq5QEizQJF5PlieL4pRlHQVQehrdeRtKSpypm8sN3wJo6mzMdWMJ4Qvd79XktH08rdo+uEyQ33ib1jGUVlb6PlCjfFfyTXOWOn5csX5japMNA/TfdwVYK1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861366; c=relaxed/simple;
	bh=fHRC0w88oiH7O2ByDcV9+HVw+gXikFCWBRVQbYVbmuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEbVheKW1JmS3NgEopONbxwNX8ZhDdRmrAs6GiZZqovO6GRTjG6j5mVGXe8k6+X7pPJigwW16FNkXwo3YxmERdWsUBZdXMYJfrR2HRO9bVCIrORWId1i4m978Ypx85GIa7y0MbJwPswfrqKTmACR/kS+SF52uY8/nbGEU8rIwu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc; spf=pass smtp.mailfrom=tychen.cc; dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b=ArswRCrQ; arc=none smtp.client-ip=198.177.127.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tychen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tychen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tychen.cc header.i=@tychen.cc header.b="ArswRCrQ"
Received: from fedora (unknown [69.5.53.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4hfK7k1b4bz2xN0;
	Tue, 08 Sep 2026 09:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tychen.cc;
	s=spacemail; t=1788861349;
	bh=QWwCCBEOgN/d9xYRLy5K04OOq5DsrGxdd2URY0hSlZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ArswRCrQYCbrhKI78k1+v4toddTLSUWrd+VepF7xzjNk7Y/rnuIoHpVBKZ5cvf8U7
	 XVuLOAGvqGr4pKfb4BJGDKOjM6NPeQ2EjZnx/WTgosqS6Czhk9W0EMAXRNbPodj20E
	 11CEoNAxo5gihgoGdAtydq7fdY6VKnWtj4bQdc99rIvi2JsbPIh99Kq5S8BLFioIGB
	 tC0pfG52+ZYZNqyWzhjbZ+HlhqLh9r+d62u/jW0SP6XWDzkPHLyG3gZsThV7tMcc0Q
	 pV+5c8HgmL+uK79/mNw8m4X30UTGtqqGyomU5IDiFDedZcqd9cXQ4fxa9CTNydZ9gI
	 wp9P6pdAWUSUg==
From: Tianyi Chen <hi@tychen.cc>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>
Cc: shuah@kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jsavitz@redhat.com,
	hi@tychen.cc
Subject: [PATCH v2 0/2] selftests/mm: Validate selections and scope memfd_secret setup
Date: Tue,  8 Sep 2026 17:55:31 +0800
Message-ID: <178886112560.138404.1278745290043112298.mm-cli-v2-0@tychen.cc>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906135444.749144-1-hi@tychen.cc>
References: <20260906135444.749144-1-hi@tychen.cc>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: hi@tychen.cc

run_vmtests.sh can reach test setup after an invalid category selection,
and its memfd_secret preparation can change ptrace_scope even when that
category was not selected. These two patches address David's follow-up
questions on the earlier getopts fix.

Patch 1 extends the getopts error handling to reject empty, whitespace-only
and unknown category selections before setup. It uses the existing category
list in usage() and normalizes separators, while preserving the default
when -t is omitted and the existing environment-selection behavior.

Patch 2 gates memfd_secret preparation on category selection and executable
presence. It retains the existing behavior when memfd_secret is selected;
it does not add configuration restoration or otherwise change that test.

Changes in v2:
- Rebase onto current mm-unstable.
- Extend the original option-error patch with category validation.
- Add a separate patch for the memfd_secret setup side effect.

Focused validation:
- Bash syntax and strict checkpatch passed. All 30 documented categories
  match the categories used by the script.
- Parser checks cover omitted/default selections, empty environment values,
  explicit empty -t, invalid options/categories, whitespace-separated lists
  and command-line overrides of environment selections.
- Twelve invalid-input cases and help were run through the full script in
  a KVM guest. Invalid inputs exited with status 1 before test setup.
- The real mmap category's three programs and memfd_secret passed in an
  x86-64 KVM guest running Linux 7.3.0-rc1, including multi-category and
  environment-selected runs.
- The guest kernel lacks Yama. A disposable file bind-mounted at the actual
  ptrace_scope path verified the shell's write condition: the old script
  writes for an unrelated selection, the new script does not, and selected
  executable memfd_secret retains the write. This checks script gating,
  not Yama policy enforcement. Missing-executable behavior was also checked.

This was focused validation, not a run of the complete MM selftest suite.

Previous submission:
https://lore.kernel.org/r/20260906135444.749144-1-hi@tychen.cc
Review:
https://lore.kernel.org/r/519ef70a-679c-455f-ba5f-3841730873a4@kernel.org


Tianyi Chen (2):
  selftests/mm: Reject invalid test selections before running tests
  selftests/mm: Only prepare ptrace_scope when memfd_secret is selected

 tools/testing/selftests/mm/run_vmtests.sh | 29 +++++++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

-- 
2.55.0


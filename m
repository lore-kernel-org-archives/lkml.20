Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170434189DD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788521870; cv=none; b=AooNCExAeGtep8YlzaqFFCK/Nx2Jt58vpZzWf2Rcg6boU1CMhmPZoxFJtOLJ0/i10oOdRVGanTMGPDDdoAxnBCwS9ZB7G/f2gyXxK1SAH+bN0i1vS8UJLD6yisO0zXLUHWyhVUeSnHahXUtIuiBmzf3+q42NbqkML3PN2OXzvRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788521870; c=relaxed/simple;
	bh=5PgQAo5d2thr7D8CzWJQ/uig1o4RwjJa4iAfRpTAm/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnROv5VQe0Ahyehb7FdY9eFBHKRGzDD8++cUKSQbJP2IZIZSShiB2UmLDSFmYKfxtQSGPfCAqJ7Rocu7Gs/oy3pJG4DOD0ZHLW7RhUtjplmxwWd5aELJebMT8l8s7+zgUGtaOvVzhyao2IFTsFl30NzKWasaJTR8wZxo+/8xLIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb+1kPuu; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb+1kPuu"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so625873a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788521868; x=1789126668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzcgKZl4EZXg1oW8G6oC6DeJneKTbU6bUBcNuEdScjY=;
        b=Mb+1kPuuj/7NXHtI1wZxlFyainHNFoKqJBCBTeCNRBPpBMMPmam/zaA/3FalPmU5J7
         AwH0yC6rNNoGnMajn/ND99wONqcEGjYukFN7oG/EuPQpKJxPRy0lUA3zAJWtAZ4xqRH6
         M5NmtZkdGYCS9G1wF8T8EOHT2efZSEKa2cLyNj2zTdWi+sHsObmXWLmNx91XbeP+aIz2
         Lo6Ont+Pjtz2E5JpObHJ39Ulw4mVr+Y8H0QV4q5Pmrb0mN7ENvI1YqDFXHfAvadO3nDU
         oTnA9g3V0Otxkojv5EZthGzrppLz6MArqHApb8NHz2j+l5TaFPQXa48szrWHP3LEPUJW
         7bNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788521868; x=1789126668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JzcgKZl4EZXg1oW8G6oC6DeJneKTbU6bUBcNuEdScjY=;
        b=m0DMAcDe9DlAWN15NPQiK6kcY9Svm5y/eV5aweWmITNrYj0wE/ilObcW9c0D/IWjAz
         5yncxtNPFe4m3SHJ0CEXvsaIRON8TiA5smzyM9eXDJFAWbvgm9Wf2YBlH3GqlIM9brqk
         NUe4est1sQq6xaP5qs4yKANHl9x/aKGMxmBw6ycWf2kyTkcT0eaSGgUQWKu5hQHzpMMk
         bomhkKYw6+lEaHnNj8ZwPtqPfUoGwKWQWMWT+5pFNq0hm+rgcK5HxXvpky/ORkqNhqNh
         OxHlWdNBBdfFHDXm+udS0nDlMGWqaVfzJRurwbY3SZ1ovHIzq8bAvImfIFO+wMO4nlQ1
         L2LQ==
X-Gm-Message-State: AFuF++kDKYun8tjExtgeb74nXEK9JLsO2pJjjYJHDaZKJJIYfYF+h/oH
	TL/Jno85LSHs6OIvJkFz8z5V9fc5Zc2RtNPQVFUVfWKwtIn2FEmyiHAA6YUhPcWAxKM=
X-Gm-Gg: AYBFou1BbaCYZwLJjxgqb3sXApiQe0GWmfCK4eTgKy/ijJGwoeidNY3VldrzfzPIhhf
	P1UNHRm8DLsn6neu21hsdyG9JrkwZcM6CK0RhafSNeGIfuYFD8QyQ7TuJWoBKSrbvZZxOpIk5Lv
	HM65DUUbEDP9OKMkrjcWvjXNTfCZsLexqXw3l2p/CwtWCN4WoRU4a8dbsGezNaUF/jFDm2HOkmU
	OandwDcgOmIJxhIRyAfEJ9cIQCo/yTl3blIRxUkxlTAOxyx4sUN19wD2dWpa1Ua7l9zH4rIyFWu
	/O4iFxfSbVYTsiBktGdMVKe7v5doKZzDBAiQlKzeYlrEG5YmDI9jrRjODtTs+zabORQs/iuP7vV
	Kh5uRwpgIAiOlAXexhNl8/QstUm6mMJYVDOxPyGRXPoB5nNXt/tKHpkXX0Aa8R+9xCz97lzax7c
	kBmxF20qWjGhDzyakBw5yBKe2ra+tS06qFYxqZsdCcZ7Cu7m3aQ2YFNTfMBq++azWMsGTylUXWd
	I2dgQoNn/nHjz8=
X-Received: by 2002:a17:90b:498c:b0:38f:7f60:ba35 with SMTP id 98e67ed59e1d1-39b260d3351mr7706470a91.5.1788521868214;
        Fri, 04 Sep 2026 04:37:48 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339ac24d7esm9102897eec.15.2026.09.04.04.37.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:37:47 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: 
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] watchdog: fix typos and repeated words in comments
Date: Fri,  4 Sep 2026 17:07:39 +0530
Message-ID: <20260904113744.19872-1-hemanth.selam@gmail.com>
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
  watchdog: fix typos in comments
  watchdog: fix repeated words in comments

 drivers/watchdog/davinci_wdt.c | 2 +-
 drivers/watchdog/max63xx_wdt.c | 2 +-
 drivers/watchdog/pc87413_wdt.c | 2 +-
 drivers/watchdog/pcwd_pci.c    | 2 +-
 drivers/watchdog/pcwd_usb.c    | 2 +-
 drivers/watchdog/wdt.c         | 4 ++--
 drivers/watchdog/wdt977.c      | 2 +-
 drivers/watchdog/wdt_pci.c     | 4 ++--
 8 files changed, 10 insertions(+), 10 deletions(-)

-- 
2.48.1


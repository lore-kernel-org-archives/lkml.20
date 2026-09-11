Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A154A9D43
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789155599; cv=none; b=tJ4yAlE98OItvpkaaLorwzXtE8Eb2ys46TMk4HiWOV0kAy5ArPb15bK4q5y7DfDzCr3AF+CYpxILXw1ZSKgL+u880xs4zo4KJfes1ovODFz5qS7lvCYAg9GiGJs+q/oeW5BWfO4LbI8amyG3zPC8jzPCZCIU4DuKvpcKC3nTqXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789155599; c=relaxed/simple;
	bh=Hl8lb58k5xO116xnimdTk6S76A025J8eQHLdMylhG3c=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=MwtyPdjYwB7QbbqY/kIq4pUA2rvWa6fBAFuR0ooGz0t8Y1pSswyLl6n1z+Pb4TA/IoGDPDgAelQ4QpFeFL8LcNcwTYjxiCz3a4wkxySS0TeEuwgWl2FGZ19vR2YspiricJBHCNGdqEyCMHIz1m+gnE6VGsAmrr/I6NfIVoJaYLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QHfFBSL0; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QHfFBSL0"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cf9df1eadso12413585e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789155591; x=1789760391; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SsGZO1OXHttrCzZvvia/9lx/17qMNq27XA0wxIFcezk=;
        b=QHfFBSL0HUEgZtI/Ppu3oiU4czm0/mJS4jJAzXYQpuSy40kY93fEA4e+d+jd+FbikQ
         jBFMcQFQenMVcAcnIHk2MgxUyqeHdMfqSzknlRkH+skr/Wmd22oAeUXopeCZJa0y8pm+
         +/bk/QXoA6BgeV+GUaUOe8MKssyTWKlpq40domwWIPidJjW1qL6QZPttkTXujJ6vLoBc
         B4v2T6CjxGlJDyBlnrXpBDYHhWpZb21sAtLIMJ7tvpkfSRIctya1zxkp1Pa5lCbT1qx6
         i3rbHDW1nuUIUR5WhR8O8Fd+I11bQ22+EX77vduwkhLau8OC3N24OeamzWt7J6Nq4USq
         tRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789155591; x=1789760391;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsGZO1OXHttrCzZvvia/9lx/17qMNq27XA0wxIFcezk=;
        b=Eth4zhroBp/A6Wh7auepHrZE/07Sm04m0MiTUJHbWjBS6Vm29AR5csGU11uYCiB0Ws
         LfA5S1ysX/cp3tCGkxqDlickEf4XvMR6PzWGFDi2Fi/oMGQVi3rjMjiL2fZCSJpDv/rD
         I4ATUW1xPZMQ1TgUT5ZkEcLFqniktk5DdfjWZDCYuDlYhSUOm8jpF8ViiUHshBR3EsJV
         24SGMa08TMKdNZTGEG2umrqsLqXlXBAnOru4QCSNZaIlfFnU6CXz4kShBTz/7aZVOhOS
         JZT4jttEEL8gKJVl38ZWqadhElmozjk9/EFGDStiTCp3UYTSASNyAr0GleqfVZXBfZ13
         ciPw==
X-Forwarded-Encrypted: i=1; AKwUvBy4HN/xZZq4zLH/fCoXMWMdgYJ+Bjd5s8F0r0mzPUVjk54m8NZJa3ABco91y2VYGon+5QEx51ahIzHfV8A=@vger.kernel.org
X-Gm-Message-State: AFuF++kt91BwHXWMD7aTLweAnJ6ORuN+9Wa9+UQdlbSmYfrZ5IHQZYx8
	W3CK54Qwb/N5UCcBRLW9qo4SCHuYoCH7f+yZ2l03otuu5vD6LZOYI/F8ydqRcvc3YzBanOviezV
	+xRKz10xdWKIz2wnHY7IK1Q==
X-Received: from wmpn30.prod.google.com ([2002:a05:600c:181e:b0:49e:6594:3a28])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:628e:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49e619c6463mr67670635e9.25.1789155591294;
 Fri, 11 Sep 2026 12:39:51 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:39:34 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911193937.602202-1-vdonnefort@google.com>
Subject: [PATCH v2 0/3] ring-buffer: Fix and unify size and page calculations
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, 
	linux-trace-kernel@vger.kernel.org
Cc: mathieu.desnoyers@efficios.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

This short series unifies minimum page calculation for ring buffers and
fix a small issue with the number of pages calculation for trace
remotes.

v2:
  - Add a helper in "Account for ring buffer page header in size
    calculation" (Steven)
  - Split the nr_pages overflow handling into its own patch (Steven)
  - Rename the helpers into __calc_nr_pages_ring_buffer_desc() and
    rb_calculate_nr_pages() (Steven)
  - Use RING_BUFFER_MIN_NR_PAGES in trace_rb_cpu_prepare() (Sashiko)

v1: https://lore.kernel.org/all/20260907192643.42513-1-vdonnefort@google.com

Vincent Donnefort (3):
  tracing/remotes: Account for ring buffer page header in size
    calculation
  tracing/remotes: Catch nr_page_va overflow in ring_buffer_desc sizing
  ring-buffer: Unify ring buffer minimum page calculations

 include/linux/ring_buffer.h       | 26 +++++++++++++++++++++++--
 kernel/trace/ring_buffer.c        | 32 +++++++++++++------------------
 kernel/trace/simple_ring_buffer.c |  4 ++--
 kernel/trace/trace_remote.c       |  6 +++++-
 4 files changed, 44 insertions(+), 24 deletions(-)


base-commit: df2908090cda368b01ff43709f51890076c56157
-- 
2.55.0.1007.g17ff1f9808-goog


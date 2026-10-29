Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263358;
	b=sfJUvJeld6AF+OF4TF/+CAp8t4zN1zL3L4w+eKB9X5BA+sSjQbd2lJvNsuB1p4ZXB0Gb
	 haAWC8bWbwKUa1/dJ19+8Wi6+K7GcAKKP7ibFe2ont1gHswum5QTVfjuOoKcdxBO8XTuL
	 IGPverI0wMXpp7ZcSvf9r/1+OvHlq6scKp+QkNmZYfH1Pox8DhPDbyQuF6g4JffFNuVxz
	 sSrNDlT/OwCvnxhqE5LUHpYwUQPvVGtxKtRP6GChGGcBJwp7VL/oqUQnx/Nyt/Hix4aO5
	 JQ9bzo65MmOK9pV4bHqzOIuEM7tsOP85bj+vijVgD0ioZj5Z6TiIlJ/cZuV+Jh78TcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eJN7tODtM96gshRP+uJBFf1UOunuTrvylT+4Jwns9+g=;
	b=VDU2k7JqAnPHoCthbQ1OuHG4m0v3IOGvWYS1Av+FsmF8fJpDtwwGQFXZoTj/OwNtMWpS
	 MvY8nV4tS0cCx0rHJCxfPJYhpBn74wi37YP1vjcVMlFsUanhOvVy9pytPXYmjDQA+ZKPJ
	 P9Jp3E+J0C/jeLP34eyP1GJT15nB4BBhMirOS8UbRO7pqdUnA4nSi9sq4uA+KriSmezgi
	 yFwT14BMy3+xH2bgP4gb+RxFR+eeQz4Fd/irRrCVPiXqZrOo+7rZO1hW3O6UDsup044oD
	 wNguchGxfohenX7CRATis2cs49+B7ckwyG0R86Hjp+OMkx7eBWoodu4c9oF+1cFvyNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+oV1UBr;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BA3606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:42:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BA3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q+oV1UBr
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a06454116eso1001681b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263357; x=1793868157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eJN7tODtM96gshRP+uJBFf1UOunuTrvylT+4Jwns9+g=;
        b=Q+oV1UBr3/nOLsVtrUXxs+jW2f6DGUvgCQ+fOYUfe4Ql3+RMsU+2QDLtyHnOY0BzWj
         f1WVSwFewMeRpnFq9rQH0GmQejNtcOkarhk7JzAHKK6WThQfaXpFBVj+UpVytnqsMzAS
         IaCAstacRWmQTpRUSDp/2n0vKQyRiDlJeozQL4EHvaACic1nsX7TmF4fN2OO2RRcs+Eh
         tkk9wOhZk6yIzytovAQUU0qwmI72OSNp++9cxWN8X4ti34U7ijXF8DWWdR8XfWIHEI2D
         bae0uaFK8xreKCUROXqqopa5mq/0Su1qcw6H6KRtr9n1N3CaqX9F2ggTppF5GT6jD1EM
         W1Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263357; x=1793868157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eJN7tODtM96gshRP+uJBFf1UOunuTrvylT+4Jwns9+g=;
        b=H51WVr3HFmQ0oXQPR8OnyWQRamH/S6VpYnrZcu9iuBA1lbzN1DNlGwQgU55idC6xl6
         8Mnqddpaob0LMmswo2O8fsYdDbhiHomQ/xwh6/AAoBGkDjoWsd5a05lZ0v5hhPHOGEcq
         wZDlNuoSsQyzFhmp84Iexqsol3tVZ+zS5oSZpcY3gwNJvHmGfWCcCuuF7NHoYiZCpVSh
         uFRePAHDOMmlc+g6nY5DB51rMR6obGWUESyWzK+4WGkyA0swKD4kFavmBXi1wxHELdeh
         hyEfiuv9KRfeRD+XL/UbbgWF3gXS2MKzpxY7HWz1SElH8fVAZxqv/ol6pr3J6VVe2fYI
         hi0Q==
X-Forwarded-Encrypted: i=1; AKwUvByDLHzKY0uc6iA1H3a8uNHAroUZJ2vYqzr0ql60Au/5VK+P2dh8yx/PI4Vha1xdbX4M7ZPA2152oXmU994=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKP5wziNUuac/Wtc7NIlBk7vlEdrhB4Yja1dBTBRpna9AnUEOV
	1R8mSnDdIM/CwXLcC+z8iaRIemes8DvwL8jYjQMVQF22PCwIgUXDRKYp
X-Gm-Gg: AYBFou21RfMM/YgYD8QMSdxyBfLJ8pCbiUaTvSjev0DvN6X3nmc2+K47+3tIQPc3jJf
	BorORKopU/tkGlHi0DyWb7bAibF8MRwAAOSfg9TMvxSwjjOX2Snzqza2Fyb5hJlWOs1LouywOjR
	YWazXD36miCnOPQXc6L9hiiiVKk9z+aXtpCR/Qvm9TdBGB04Q2kYPiiv5VfEtJjNQnWln5TgZay
	AIgQSMCH7IrNVyVd3mwS9IG88S+cGb9fj7dX/yFG6HLXvJiHVV+DqcOTYY+qJkNODkmGQXAgdc+
	WPpmB7I3swZNRuLGkWY1xGh+lM4SOm+JMNLAnBAq7Tfh2TWmfnqNuQxpT3J5d6N4yDacZ3cYwv6
	FaIoH5mO6LNHLMazEFLY26mAm9EXvhVHPVhKLPnUIBsi0G32aqxowapv8OZQnG5K/pbw/SIhx0u
	urOlbvDmHyLjuk/0qjir76fjhMZLw8JlUChtULmHu58af4IS0QjpDaL6XvYkODj6KndOQKmraFw
	aTdsSbl21JIPy3xXJv7YefeCOlJTwFG+Ll36EXxMI2hw/T1E7z59F3fI8kR7EN1rQoux2f5GYsj
	jQfuF7oepbjYJmVIqCUrGrCALVQ0Vy97txTmOVfiSkDjQo4UrXheyIOcpOLbhG7jRtiP
X-Received: by 2002:a05:6a20:244e:b0:3e1:af52:6d06 with SMTP id adf61e73a8af0-3e9023bdcb8mr4276472637.52.1793263357282;
        Thu, 29 Oct 2026 01:42:37 -0700 (PDT)
Received: from xiaolei-VMware-Virtual-Platform ([219.142.21.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdacea7938bsm3338029a12.27.2026.10.29.01.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:42:36 -0700 (PDT)
From: Xiaolei Wang <xiaoleiwangxiaolei@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	error27@gmail.com,
	xiaoleiwangxiaolei@gmail.com
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	"Liam R. Howlett" <liam@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [PATCH v2] mm/damon/tests/sysfs-kunit: fix leaked pid reference in add_targets test
Date: Thu, 29 Oct 2026 15:56:09 +0800
Message-ID: <20261029075609.35661-1-xiaoleiwangxiaolei@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>

damon_sysfs_test_add_targets() creates its monitoring context with
damon_new_ctx(), which leaves ctx->ops zero-initialized.  Since
DAMON_OPS_VADDR is zero, damon_target_has_pid() returns true for the
context, and damon_sysfs_add_targets() therefore calls
damon_set_target_pid() for each target it adds.  That function grabs a
reference to the target's struct pid via find_get_pid().

The test then tears the context down with damon_destroy_ctx(), which
releases such a reference from ctx->ops.cleanup_target().  For the vaddr
operations set that callback is damon_va_cleanup_target(), and it is the
only place where the reference is put.  The test never selects an
operations set, though, so cleanup_target is NULL and both references --
one for each of the two damon_sysfs_add_targets() calls -- are leaked on
every run of the test.  Running the test with CONFIG_DEBUG_KMEMLEAK
enabled reports the leaked struct pid objects as unreferenced.

Fix this by selecting the vaddr operations set for the context before
adding the targets, mirroring what the sysfs interface does.
damon_select_ops() fails if the vaddr operations set is not registered,
in which case the test cannot exercise the pid handling and skips
itself.

Fixes: b8ee5575f763 ("mm/damon/sysfs-test: add a unit test for damon_sysfs_set_targets()")
Cc: Liam R. Howlett <liam@infradead.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Signed-off-by: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
---

Changes in v2:
- Fix ctx leak in the vaddr-not-registered error path
  (reported by Sashiko AI review)
- Link to v1:
  https://patchwork.kernel.org/project/linux-mm/patch/20261029015725.17378-1-xiaoleiwangxiaolei@gmail.com/

 mm/damon/tests/sysfs-kunit.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/damon/tests/sysfs-kunit.h b/mm/damon/tests/sysfs-kunit.h
index 138a4b8d14e7..16373ba751db 100644
--- a/mm/damon/tests/sysfs-kunit.h
+++ b/mm/damon/tests/sysfs-kunit.h
@@ -79,6 +79,15 @@ static void damon_sysfs_test_add_targets(struct kunit *test)
 		kunit_skip(test, "ctx alloc fail");
 	}
 
+	if (damon_select_ops(ctx, DAMON_OPS_VADDR)) {
+		damon_destroy_ctx(ctx);
+		kfree(sysfs_targets->targets_arr);
+		kfree(sysfs_targets);
+		kfree(sysfs_target->regions);
+		kfree(sysfs_target);
+		kunit_skip(test, "vaddr ops not registered");
+	}
+
 	damon_sysfs_add_targets(ctx, sysfs_targets);
 	KUNIT_EXPECT_EQ(test, 1u, nr_damon_targets(ctx));
 
-- 
2.53.0


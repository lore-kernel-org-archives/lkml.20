Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6F02383994
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816268; cv=none; b=UJ62Q2aBKHYm63scw9JW+9kmVOkNf0VjpDNvNdn6Hkoieu4gGu7U9ajfnmPjTWIahqovsaeyNYPSc6I92FbVw18dlCGFwayubGKNhqEajZPFadctFbTfT5ZbvP12l/nEoGm1pM8x8H3CgdB85s1Cx6A02AM7U8+doVlE8DSQYgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816268; c=relaxed/simple;
	bh=tDKrSjOqqvWcSV1YWBF0/bZQ7+lEwcQ5+ihwKbVlV3I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=knbIxthDsk214ohifPlmkdyExyC4g1zpfhmqQhaJLheZnQiVfgeUMNIZPiNFW9YJqDyvYWK8Jlk4PDgaPoB78ayMy4MbPewLO/7eDfzO38echGgP8T1+A5+wIDFgea7w5wftq+gOyn85tqh+TG/HpJBIe39p/mmrKonO5ZUYNbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BY6IArm4; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BY6IArm4"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7044536a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790816266; x=1791421066; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rMPGmzqrPtOSz+orjSMVvFs/mFFB+41nKh4Vba0ZvzM=;
        b=BY6IArm4PRjheHhCjWE1ehm3a8BRcJNMp2+1oD5tMmbGEHSzw45pv3RQd8grZ7PNBA
         QJcvTgGMPWBox23rnk5u5s8QzUIGdrlmTG6VlSGXo9ST9KMR1/RAEJLXEUhCKhbvVqp/
         6HUwdAIWmJ5hcDNaD9FZHjDHsZCaEqJU4i50o83TwVHcUwgPiNqO4eu387ShDs3YMiq4
         J/zK2iw6PgAsnfAUgO1A/taxkvnUglGK01xrYvPo8hsD2q3g9o3ToTENdAYQ1ldpIbk5
         MNGfbHwsU7P225fiO8AT7uDQWWVZVrC6n8q0dqdqyxf615Nmm0DkQ1eNR6JYpErqNIcu
         RaSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816266; x=1791421066;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rMPGmzqrPtOSz+orjSMVvFs/mFFB+41nKh4Vba0ZvzM=;
        b=TrRCLNtpyLsFXG3uaRQ7I7GaYhuhxT0sHwf2AwOxWdigvN7DGfXuwOR4Pfu75zzmUc
         WlRKrD6jmm7HiMp9wgP2khDQtf/zPFrZmWoEPt3fkgJJ2m+CdmNXO+WOs4hKnuQrwcYw
         NYOwN7nOWGDILYXuKC5EiIztzwA6qT414CGRYAMZUMr2uTzPSMxt+/7A8lshy/IbxPmN
         NDMoE1MvYlJ6RR0PBqP2PMzSLzPR01WwvdnobeCRGUUK1DwMUZ+iYgcxVVJZ8Hj69Nhs
         Rq3QTpPUpX2m0ozObWI3T3TjVh3gkrKhj06yV8PuEFJfY+IyXurv9UAh9k+vXxZNrqKR
         CVlA==
X-Forwarded-Encrypted: i=1; AKwUvBz+eDIqDAHgziOEteI2hrzl3RKnWLXB6OkrnrB/jMPlRu+X+jdmC0OQY4st3OC+Xtf6X1LUbByWZxsokiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7+vysrxmRNfjC/uZxMfJQrHoXjDE9r5Idmn4RHUgfeo/mARMh
	Fi7Akpm03CAEnqu1CiVx4AVNj64QU5QBUlV5rg111VaA3FnBtCHo3iWghOAmkT5kIA590KR3LgN
	SjryyJnnZWeJ/XQ==
X-Received: from plei13.prod.google.com ([2002:a17:902:e48d:b0:2e2:dc3d:e914])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4b8b:b0:3a2:b490:c459 with SMTP id 98e67ed59e1d1-3a4d1787222mr2759686a91.25.1790816265844;
 Wed, 30 Sep 2026 17:57:45 -0700 (PDT)
Date: Thu,  1 Oct 2026 00:57:34 +0000
In-Reply-To: <20261001005734.1033516-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001005734.1033516-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001005734.1033516-7-skhawaja@google.com>
Subject: [RFC PATCH 6/6] iommufd/selftests: Preserve all the FDs in a batch
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Use the luo_session_preserve_fds() to preserve vfio cdev, iommufd and
memfd together in a batch.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 .../iommu/iommufd_liveupdate_kexec_test.c     | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/iommu/iommufd_liveupdate_kexec_test.c b/tools/testing/selftests/iommu/iommufd_liveupdate_kexec_test.c
index 26c7e15b6187..3ce282fc1a33 100644
--- a/tools/testing/selftests/iommu/iommufd_liveupdate_kexec_test.c
+++ b/tools/testing/selftests/iommu/iommufd_liveupdate_kexec_test.c
@@ -153,6 +153,9 @@ static void setup_iommufd(int iommufd, int memfd, int cdev_fd)
 static void before_kexec(int luo_fd)
 {
 	int iommufd, cdev_fd, memfd, session;
+	__u64 tokens[3];
+	__u32 failed;
+	int fds[3];
 
 	create_state_file(luo_fd, state_session, STATE_TOKEN, /*next_stage=*/2);
 
@@ -174,9 +177,27 @@ static void before_kexec(int luo_fd)
 	if (!luo_session_preserve_fd(session, iommufd, IOMMUFD_TOKEN))
 		fail_exit("Preserving iommufd without memfd should fail");
 
-	test_luo_session_preserve_fd(session, memfd, MEMFD_TOKEN);
-	test_luo_session_preserve_fd(session, iommufd, IOMMUFD_TOKEN);
-	test_luo_session_preserve_fd(session, cdev_fd, CDEV_TOKEN);
+	/*
+	 * Batch without iommufd: memfd is preserved first, then cdev fails.
+	 * The whole batch must be rolled back, including the memfd.
+	 */
+	fds[0] = cdev_fd;
+	tokens[0] = CDEV_TOKEN;
+	fds[1] = memfd;
+	tokens[1] = MEMFD_TOKEN;
+	if (!luo_session_preserve_fds(session, fds, tokens, 2, &failed))
+		fail_exit("Batch preserve without iommufd should fail");
+	ksft_assert(failed == 0);
+
+	/* Full batch, passed in reverse dependency order. */
+	fds[0] = cdev_fd;
+	tokens[0] = CDEV_TOKEN;
+	fds[1] = iommufd;
+	tokens[1] = IOMMUFD_TOKEN;
+	fds[2] = memfd;
+	tokens[2] = MEMFD_TOKEN;
+	if (luo_session_preserve_fds(session, fds, tokens, 3, &failed))
+		fail_exit("Batch preserve failed at index %u", failed);
 
 	close(session);
 	session = luo_create_session(luo_fd, iommufd_session);
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


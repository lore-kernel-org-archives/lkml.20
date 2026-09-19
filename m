Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7917A2DB780
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 07:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789802012; cv=none; b=F+XDL2gDJtCqm1UyJRKcclOsqr8GUE5RjQMKQItyaXtxFF2IZgeQ+iGopHFhFVI4Opy3cl7wAEp+39oN1qBtf9Nxe/SG2DrycKDJa6n8TFO34vDS+40wslmDdLGjrMsKqXZepcKu3OMzHeC7z2L09X/rUoqFyuqccLLWm7L6+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789802012; c=relaxed/simple;
	bh=OpyRyDHgKlqaVr/FBHAfpdJLf6Saz6hZoz1PafSpOOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5JSrs69ZgYmo6bbiyst96vVvknU0YHmKcN1+rIfKjlmEXL90GBd9i4Qdbk22uoV6Uwz5L2qbg8TK0s0/Q6XMDj3tY10elrEKnsSWA7mC+mn7ZNfYHtC1Gv3CBCwzzoMluNB7pALls/WOn6RJvscILuXgAhTxm2SmyUa+te3spQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmN7Y5k8; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmN7Y5k8"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4aa0f1766so1128490a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 00:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789802011; x=1790406811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AwQsFaaF5KGdcLtlg+j+YQG7OiHlq2IqvQxHexSosrw=;
        b=mmN7Y5k8VkWsMIJ811uEWwAOTxgFnq87ZhzIFHhXKx46gP0wq0fnsBnzLJL0OcIC3s
         d6+W3xfnjn+fDn4VN/N1KjN44BtNtlkid0ryvt9hXQlwXd3adEbsw2PjNzIJd8R4owVv
         sgJ1UNhV7yYL4EG8QnNt1dc2QoKPRMq0I9tzc//1jQzbpvfMe2vfxSCGmK0j9MiXVk0C
         J8Kp/ozx80c7ymkpIPY9Nh1IqE57XqHaPvmN6lTrVp+iU4UXYE0EyhxiUq2jTsGEFBAH
         NltOqNgQdmux1LIhLlJKRSjkIJ2C83YOn26PaR7BEbFE8pLEM+/kFQy/1o34IBySkLdy
         7KyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789802011; x=1790406811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AwQsFaaF5KGdcLtlg+j+YQG7OiHlq2IqvQxHexSosrw=;
        b=NYcXdHVqVP57MjVgrvya5W+IXDe9OsCi41ghX2FpimjsPRXJdLJ4Hfq7S1EXKn+aXN
         fqVDMZqM1VOD3XgSmcS7cwBzIZnD5CKr7fQug37QGnPL1tNalWZ1sSX9vqqGazCKLYAo
         EDtQVoWlPN2LAAuLA21YLYlJaowQYFjHVVOTFIZuml9miGEND9131DtaYC+c5B40v4aa
         pLb2qjjLWu8jBGV/Ra7xmFHHFQW+kf4chMIFQvvKtawFRU27S0Se8I+J8XYd4TKQvzxy
         LiO65E+H5p5UdyJ1K/nOf5KGKQJfmffWbZKXUYMzONoeNK9V53KVvUGkaECy0xXM7PSS
         pbBg==
X-Forwarded-Encrypted: i=1; AKwUvBwxW22b3K0aXuA3kajcqSa5DWIvJRPxhWlutAike5yIofNlP/DXjydtw3ObzwsIvdrOl/4roM+J5HrdX78=@vger.kernel.org
X-Gm-Message-State: AFuF++lEFU++VkRJQwRpzTRe2JG51LoXxnmyWZ7CrPwuzHs2VtcaeMcu
	4bU8ZNBJmlQNJm27hBwiHVuuvcS04ryWfOjikQqwezA8jgaJVhj8CY8tekaLeGziZg==
X-Gm-Gg: AYBFou1FvcXbC63yfSSY2TDpJIserX38o2/uwJz204vi+bVXS6G1B2KHqNAqDWI7Bg/
	0UXknfoysjv/wHsX6SZ9OSCPmuf4ZwqZiQ07ctHUq4NDzUXBilXkFqU/vPRMjfScLPqwNQp4YGA
	w5rmTeM/wViMPlU+77ITO3fq0LNs0B9gyY6mcDpKbhGh9ztxAqtquFQ1Js1TMb9KOOHgagyJpjC
	1pEz1/ppIBQSLxXq2AFzc8TCiVWXXDvIRJ1hsHvWykAXrXnjhvgBKcy7rlk0TcJkQjYkJ/TcuGg
	BVKTI6F2y3ZqkL8Lt3Ni7mNiyxZDGgZrAJ8odY+MYbDSldkeIlunpae6u5gn4R76areiBIlq8R/
	7ijeIbAfkFI6jZ8Q9FOC09I/j92vS9T470+4NdQKlCgFiDTcUEw467v+uYSWMvyZr6BB6Noqlsk
	oEl/3sTYJnlOOKLiKl1XsnfiD1F+kQLhKNbQm1yA+TYpzO/DTd4dEVGQmMsmXOd79wcjf1rOVAl
	SFIBq/8ME+TCbbUfzoFNs+PUtQ=
X-Received: by 2002:a17:90b:2b45:b0:39e:6a80:b795 with SMTP id 98e67ed59e1d1-39e6a80b8b1mr3373413a91.37.1789802010653;
        Sat, 19 Sep 2026 00:13:30 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:45e5:9e39:6356:6164])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a02738654csm1050170a91.3.2026.09.19.00.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 00:13:29 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com
Subject: [PATCH 0/2] mm/damon: fix the temporal goal tuner's size quota conversion
Date: Sat, 19 Sep 2026 16:13:22 +0900
Message-ID: <20260919071324.1583280-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damos_goal_tune_esz_bp_temporal() hands the size quota to
damos_set_effective_quota() through quota->esz_bp in basis points, and the
multiply that gets it there is unchecked.  On 32-bit it wraps from 429497
bytes on, and wraps to exactly zero at the 1 GiB that
Documentation/admin-guide/mm/damon/usage.rst uses as its example, since
1 GiB * 10000 is 2500 * 2^32.  A zero effective quota makes
damos_quota_is_full() true on the first test of every charge window, so the
scheme applies nothing for as long as the goal is unachieved.

Patch 1 saturates the conversion.  Patch 2 pins the boundary in the core
kunit suite, where it fails without patch 1 on any word size.

DAMON kunit: 36 tests, all passing with both patches; 35 passing and
damos_test_esz_goal_temporal failing with patch 2 alone.  The DAMON
selftests do not reach the changed function: a build with a print at its
entry stayed silent through all fifteen of them and fired as soon as a
scheme was configured with the temporal tuner.

Donggeun Yoo (2):
  mm/damon/core: prevent size quota overflow in the temporal goal tuner
  mm/damon/tests/core-kunit: test the temporal tuner's size quota
    conversion

 mm/damon/core.c             |  6 +++---
 mm/damon/tests/core-kunit.h | 35 +++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+), 3 deletions(-)


base-commit: 498ee28e5ec4727f829507c4a1bde3ab1b7704cd
-- 
2.53.0


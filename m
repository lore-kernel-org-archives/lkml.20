Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64109472060
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039370; cv=none; b=Izld2T8V05SOrJ4zqnNso5RdCJ3uSnxI4w0tl01eW19r3R6LvJR3wa3OPucQf7v0FzF86F3GNaZBg7pQ70YjY88/0HsQUa+wBOhbQbpHwVc5n13JsksWZPQwmPsjHngHVUukPThmQvdQnfbXHW1NDpxJxoj9HgBiqySdP0uBQ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039370; c=relaxed/simple;
	bh=M8X+lWYr0x1xt9g0855Z+8t8fxYXiqA6yfULgUlqBcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jc8tfBrZlzoaHC+Z/l1unbiFTfK3uPpHv0i6vBZgwRiMI7oP4H8pcbuLxkXsHzlapGrKT2j51r4BdLGWmkSNW8qPYbSfS3QXa+l0gzpj5j9vkdqltgbVG0mxvqGIstRvPXRSIQKXXXJMdoL41h/k9HLtKkQbvBDgA2Ktcpt2rAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hf1DLQ/o; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hf1DLQ/o"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so1806262b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039369; x=1789644169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ad0A/Rr65EAuzEvke4bbMmbpC8hQdLLHmef4KcXvFA=;
        b=hf1DLQ/o2SZyviRKwHSJfvrsmH+X7OcBhuGIOxz2X+Z8sEfMd/MWKu+kjawK3od4do
         kNABWkTNAklFu1WN1qo0lE8NCDlCA/CGd08DAqASotUSuMsmpNkiz7MdxWCNfknH/0+r
         x7bj8O7+ZPVOBl8lZzsEFUN3Ldq/gjighJt+DcHuZf73WWUgxjrZzWcFV9GUEnn9hqzd
         Fg6vPehT1GyMIXdUo/b0c16H0eUddLmHq+3BwKBAmUvN9dts1wloljOJROGwcJlokmCq
         hoZQMZppuHgR0xY9Oy+k34eYy89D//tA2DivNr7QkR/4QCNVoMVeqRFSGk/cqX+rL4ki
         /rfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039369; x=1789644169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ad0A/Rr65EAuzEvke4bbMmbpC8hQdLLHmef4KcXvFA=;
        b=nKgDcPPZsglKZZ92d9Pn1tliUb42EZA9Qhm5lUhK4QKj5erUgLIk+a4sHiRR3CwkAK
         IFyHDBZoUxVp3t73aWiM2cVW3CQIqdb6ZXpZZbIJYvbOWIx9JNS5Ot5ht/LAe6jQq+/H
         /fVPlbqFAiivyPWTYYDnkZEzFotYPAGzPlINNHjpDh0RQUFgmgJJ7834hfHXxOQITvKh
         aoTAi5aU47eEmFm9Uro9pnjOGYpDiWH3ZI3HkZw2/JnecA0f6TaNvgc1CaW7C9Ofmqko
         RyULIEMMsAgSIbT99B03QL6Hnl9jE9WcW4MTrqzd2wX3oj08M+5K25KhvahyrJiEQI/M
         HIwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5XdSRqGPIOmDExy7iT+okMj8HiG0CSGUJkrG+99XBgqw0s2+accZzCDs5AQaLw2vCpeXg5lrL14yyocM=@vger.kernel.org
X-Gm-Message-State: AFuF++l80S8r8bPyTZZrdaGL+0kUS3/vM4c/lrACgHkg0CS3Om6w727n
	eYe697g2g/pq6Dv148NTPg+/dVBDEyc7KNC+AGrkBfFiJbIHbr2OXYhj
X-Gm-Gg: AYBFou0uxO+tNxxjJIrUbuh424qjIWCjTdRUaXDz+hWvK5Eh+txDY28o2ZaKqF+Xck3
	d+b0OS2F1J8NW1obIxgOa5yA8occOS3tsQzxGRtyoUBv6lvUkYEPIY6YoKntJlin3xAhJs0IOfs
	abciPdaysaTTgmzp4Zny6EaJagpd4cG7P5FEVYSFutrAU0Uhl348OSrRwB7Qlt4T4isnizpW3CR
	QkNSzFlmG+Xyo9lfdR51bnoZ7RKsMSlwL1fXbs2ZOtRwwZHqRTGpBDdMYWE92z5jEn6HS/qOcH8
	XEe4pAADnh7m5RuO3Ej1AtJiYi/tlw9IgJA1lNGuIhaqVqKazvbeJvqInvnIRoLQkxk4WX90iU4
	ENsT8Qg3FBEWLb8WYJHOf9G9XKdOJtRT3crW1KiU4kV4H2/wSK7T03PF+qK/uuhdFJihGwO4icz
	G+3pIbbVUw/uJfRiNk4STxQPSlv0yd2yCL4a0Nn62w1fAXP3g9zkf/oNw+UHaKA+aK0XEEp0UGW
	v9U
X-Received: by 2002:a05:6a00:300f:b0:86a:8e9b:46c8 with SMTP id d2e1a72fcca58-86a8e9b6359mr2124764b3a.0.1789039368714;
        Thu, 10 Sep 2026 04:22:48 -0700 (PDT)
Received: from celestia ([2402:1980:885b:4183:b098:c1b9:7033:be8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045e8dsm7926904b3a.20.2026.09.10.04.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:22:47 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: 
Cc: Liew Rui Yan <aethernet65535@gmail.com>,
	SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Docs/mm/damon/design: clarify when qt_exceeds increases
Date: Thu, 10 Sep 2026 19:22:31 +0800
Message-ID: <20260910112255.157012-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qt_exceeds counts how many times a scheme's quota has been exceeded.

When using the temporal auto-tuning algorithm, the effective size quota
becomes zero once the goal is [over-]achieved.  In this case, the quotas
are still set, so qt_exceeds keeps increasing once per quota reset
interval while the goal stays achieved.

Clarify this behavior in the design document.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---

Changes from RFC v1:
- RFC v1: https://lore.kernel.org/damon/20260908175105.42558-2-aethernet65535@gmail.com
- Simplify the explanation.  Do not provide a complete definition of
  qt_exceeds, but rather explain only the increment condition when using
  temporal auto-tuning algorithm, simply to prevent users from becoming
  confused and being unable to find any explanation.

---
 Documentation/mm/damon/design.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index d036340dae8a..3f38a3cf68e4 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -695,7 +695,9 @@ There are two such tuning algorithms that users can select as they need.
   fast as possible, using maximum allowed quota, but only for a temporal short
   time.  When the quota is under-achieved, this algorithm keeps tuning quota to
   a maximum allowed one.  Once the quota is [over]-achieved, this sets the
-  quota zero.  Useful for deterministic control required environments.
+  quota zero.  Useful for deterministic control required environments.  Note
+  that the zero quota is a valid quota, and therefore ``qt_exceeds`` :ref:`stat
+  <damon_design_damos_stat>` will keep increasing in this case.
 
 The goal can be specified with five parameters, namely ``target_metric``,
 ``target_value``, ``current_value``, ``nid`` and ``path``.  The auto-tuning
-- 
2.55.0


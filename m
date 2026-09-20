Received: from mail-pz2-f17.google.com (mail-pz2-f17.google.com [74.125.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A094B3B71D8
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789871500; cv=none; b=TsuwIAQLVU4ponocZMqYMaUj/MAeZP4MRFQQk8tuY46UnUOtB7K5rkz/46L4j6mslHtuCJ3Wgt9vKp0TL4E0iIxTjABPyvcKB9vL0WGkipSxBK0yTe1aIELqycKzs8euaTfVQYau0uWwS1B6GHYuRCiIXg+itAMVbr/N1XtgEOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789871500; c=relaxed/simple;
	bh=ta4KGzvy3+Q0Ym3V/maRaZ1/VI/KlL2UlxoFdTcXU1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ibJFTCNZdBk8nx1KbmhFDr8w0SWxwW1GE4dU3lPqUSB+K83BSXptFpR1AZxggH3Nt4mWNaKxGMD6EtT2LlFhAx2/l/Zvz7irIckKMS6UZEpL+gtJEyMkU7ukirkh4+dht68BPmCix2/MJHQai/cD8xO84Wxbta+X8eztB+kcICk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UGPuMQSs; arc=none smtp.client-ip=74.125.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UGPuMQSs"
Received: by mail-pz2-f17.google.com with SMTP id 41be03b00d2f7-cc4c3304784so1700568a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 19:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789871487; x=1790476287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ucMEt/HYfCdI1ngc+n5yPNtAEmxJEE4zo8QA8w8ZEKw=;
        b=UGPuMQSsreT6lBtWeBuTpUX9bU1+4SwI/FPnkNxAYCpaNy7qbgDlkD3ttM7VoiQ1Hi
         VSu82Vyd2bxCfUBc6290nfbHSRoKjz1MmFSLfPgJ+qes6rflu0gidjcJbDoezY+t/xV4
         75KtSBLozerZyNQyk0+PE9dkpM2FpoQPONqL9NPrFDNQ44ZBkOt8bRQksVMyJ5bG4sWT
         23stq58ffGVeei01+EB10p5SAA2ZzXlpjtoBgl6+3Nn77GVTDK8ELMFeQa7SSnW7nOkF
         jAoNNsRP1ahoiC9yf71cZlEcHOX4HGRIUPDElXe8KXlmpD8BRUmGgtdMEvDnGKQBKrVD
         2OwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789871487; x=1790476287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ucMEt/HYfCdI1ngc+n5yPNtAEmxJEE4zo8QA8w8ZEKw=;
        b=gJfLGXEBQGXz7Ci1ilj2NhR4Vpgt9oDE+AcxLlHo4gMGeYzVC2Iz4VAJezG/7t59E1
         ++T+HnPCbpl+O4nERR/qJRUXmTjY2XMCS5sS151is8WZu5+9zLm+jaeLpdpt41FemOq0
         SXtEyvyNMbQjp+NZd+qMHSh63PYLxOMiqns1iFiAw71cz51zjVd5vIWSZHFsS4RHEmca
         weRiE38N9+8crLO8Fg828IW3rLVhVJBP5valVE0WahJI4RnIHtA5NCpCSI3xKNuqey+z
         dUTUOOhAHH8cv2MGEaknHJalecIx69qej4xfJYi5LqjJryIl9AUG9XaHiKNVHoM0jGDA
         k24w==
X-Forwarded-Encrypted: i=1; AKwUvBwA73p5HlWFyXLPxZg2O9gHGhxZXXzk0iARlMpNvfQu4F5Jr3cDW1lP8JUS3LbmrOnXAm2mYCbdsrxs7qQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lBAMkL4DplbuxoW+aKXWd9Iy9TrauQ1nEMo27DKj98o9ta2ffm
	dsJ15v22HzATDnstfSbGBS5/LYFS2UNI7SFRLwQHov7B0FPrl/k/qtY=
X-Gm-Gg: AYBFou3EHTCdw7ISG0ilpiGWnTh5M18sDlzpkprn0yUPW3WytJZ1Ae8huDc6UaoSwtl
	HC1QrMEfvZOzQjgSw5fVrIN/e+erpYmLU/z3C+ShkXrAx1MOfcMUnqMjcEdjQelIDfF9FgMZhdf
	8VtsqL23goqBlL2LLMmcujqacDOhlH7UomaZ0ZcJ9qlrsUQesABh/tcF/vnly72whlSNc+q2mpB
	9BhdYHN6Zu6rzYimwrxnh17EWRnLHMKcmleU2AGxY5Ok6H8rK/FwF/lrzteB5IXnzL2DNBj/fp/
	vCeDTw1WUFlLceGjlTf7mJZeM6sctVpQhvFIDGPUKa2NKWcnW2ZG5417TPU+4Il1ichgzHNFyW/
	8EwdMWmVJcb51ShD2C/mG3Cq9msT+kVUuGzpRblHu99lZZgGs1Egs+QbdtzI64knzeg/gOXTkxW
	ndw6nJVZkKtn53auvTaNSyg5Q05ZhV1r7S3JMmsV74pgCWsyqI7ExLXEs5VdWxUwDq/LcAkHp5/
	+MkAqwn08aKJ6Kkjqb8KO26cEp1XG0n6iRkvA==
X-Received: by 2002:a05:6a20:2586:b0:3dd:85a8:4c66 with SMTP id adf61e73a8af0-3dd8c5db1e1mr10707714637.45.1789871487313;
        Sat, 19 Sep 2026 19:31:27 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f00:8c85:36d8:54a:e0bc:3e5e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72aee03efsm1481341a12.24.2026.09.19.19.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 19:31:26 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: SJ Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	donggeunyoo.kernel@gmail.com,
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
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/3] Docs/admin-guide/mm/damon/usage: document the temporal tuner's quota limit
Date: Sun, 20 Sep 2026 11:31:11 +0900
Message-ID: <20260920023111.2466265-4-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com>
References: <20260920023111.2466265-1-donggeunyoo.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The temporal goal tuner converts the size quota into basis points in an
unsigned long, so a quotas/bytes above ULONG_MAX / 10000 does not fit,
and is handled as if no size quota were set.  On 32-bit that is 429496
bytes, well below the "echo $((1024*1024*1024)) > quotas/bytes" this
document instructs.  addr_unit does not raise the limit, though a larger
unit does make it harder to reach.

Note both in the goal_tuner description.

Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
---
 Documentation/admin-guide/mm/damon/usage.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index ba47255448564..ea7443b307826 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -455,6 +455,13 @@ the background design of the feature and the name of the selectable algorithms.
 Refer to :ref:`goals directory <sysfs_schemes_quota_goals>` for the goals
 setup.
 
+The ``temporal`` algorithm converts the size quota into basis points, so it
+cannot represent a ``bytes`` value larger than 429496 on 32-bit kernels, or
+1844674407370955 on 64-bit ones.  Larger values are handled as if no size
+quota were set.  :ref:`addr_unit <damon_design_addr_unit>` does not raise the
+limit, but it does make the limit harder to reach: with a larger unit, the
+same amount of memory is written to ``bytes`` as a smaller number.
+
 You can set the action-failed memory quota charging ratio by writing the
 numerator and the denominator for the ratio to ``fail_charge_num`` and
 ``fail_charge_denom`` files, respectively.  Reading those files will return the
-- 
2.53.0


Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4822DECC2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788321182; cv=none; b=GPwMlMzzE0rj3OjisKmKHjPyI2nv3V/3Ps1eEXWKXabrg7iZKiqlopz2J7fw0vBZgKOlNf4W5qFRZyJhUOfL/XeXSFjilBe7EwXrBhe9s4JQ32fSnQDDqn/9XBb+MC6nsPD/fdxEUn6bkdWgRZcKdm+egDkVjyv+Km91SMhMMGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788321182; c=relaxed/simple;
	bh=VQTV+1Df829D0KhYI8z888n05bpJmIInGDkIRqI83Dc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IZI0KhH2qrMSspss1ndtle1SwbMjWOIXk9Ec7qnmn0k+fe/l8pz9MS6GMjH/XILXrQygMetKyg67jsHkfqoIeTL720CwmnbEaA0i5WpTnkQn/nVpGZQHrYWIVzdi3GZvfoMLim5r82GGaTiQYjn8/MvM7pngiOSWMpfSRAnoy1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R11sKAf7; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R11sKAf7"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3964e480f76so781723a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788321180; x=1788925980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eVrMymMIOAYqNefktBqX7HmVpjK/XEfS+UGqRqDmQdY=;
        b=R11sKAf7JKVK39dLQ8o/woiFTtSlAdpyYeQ8aNeUuRpexJ+kUt1XFVDcFwvKfpu5Z5
         a/SGO3Q83DCee6NHy3qbsWK3tEGHVYt9BhadL1HPZRocX7i2ml+2TkJVow+1pG/NlqfS
         X2A+N/GMrZoMPo4Chuna82RJdVyO5UAbL86ltcwi2bgHYcU+FvlTmWJadeEju0njjuKq
         /9em3X8VNdEHJR/KGsibeWQlZO5vtCLMTHgDavUCyBgdikT5Kk0Q4ZnEybHYdcYqmTkh
         lhkbhnWKK3Mj8NXarZM/BLap2VKzmi2JZHr5nZOVh8KV3liX2ncZAeAbLufV8fhFvTAC
         aT7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788321180; x=1788925980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVrMymMIOAYqNefktBqX7HmVpjK/XEfS+UGqRqDmQdY=;
        b=d2ahU8Y8rUl3iLPesP8hsuq7kIB8V44Ap2I4P77F3fdawTAsWMWq6LAe+3xIOH6JL1
         xDUKmFNmpj4nEyPPqUrBhgVGeLzF6aNivURYQtMV/RpjXzdF/2nbOzOxhdrXWJRrVkD5
         Trrs8AUh+bnSMpGNH6R601urOpiugITJi4yk8P6mayuwimTgcw9BOtpqROFkr7LPrbTm
         uU1Ow5VjYHP6aFNBKH8pl9ptY/keBHrq4uPiEGbiUE28xvk/B/S/l6Bhgy+cCkK2k8ir
         mi4GJb1xGG+MzV+pD5eM6tEkP2SlZNtMqHVOJqeL8sMuH4/Q2P0l51ajxbefEX/SGjNN
         BSUw==
X-Forwarded-Encrypted: i=1; AKwUvBwyf+OuYMshNuEEM6Wfh1FlT8+srjwdDAy3Kd7zH+KuuZubweHIkcCBfSF2JElzctRQ6SFGloG3z1gD100=@vger.kernel.org
X-Gm-Message-State: AFuF++n7DGQPub8pbmig0GMBSNHazpcbzpbDjTUSZJruAQ7V3bRvAhi2
	B8+gOexTd2g/QhXLe/6ZyBGM8b4Pqq1jXP7aJHAANvCYcrLGSlaoHmFr
X-Gm-Gg: AYBFou1DGzBGjBCQmwATWSa2ihiRuQwS898h7QxaftieUUHDHaXf72G177MeYOqsfd6
	vrVkXM5b76KjknQJxj8Z/wCRk3Wj1jddl/Y5u8sEexr0OsU7cIJs92axnC2dNmk4wl85I94ykIy
	yR+/ySWy+Bgy0xi+W7kclqDR/h8xIIXnckojxymVgPglABKnjf4MgueceKdStiSatfyDj6HSMXE
	b0XqkuMFZvZSrS/I8nYuaE4LwbRakhNWKXi29lGxlNjwnFjc0kBF5EoquLtHgeT13m1DGlzHhxk
	PgnEN1u+LQqhNQQTAsogmKGWjb3vP6gqvTcZsxfB9AjShqI8s5bt6KzxWApVbPd7+Ov9OkQw1oi
	YQ2y0/wHIhhBMBhqBzOIFlf+1pTgvJW4iTbr7rb4qaQKCq+3uVV8AX9M5jKu8FU7b+Qt0BZ2CSZ
	D50apiWGnaZRfPabL2D1gGA2AOZNbwEe+xoDh/xjxg7PCqQknF25MkF9T1picXdMKMGDS3iz2CT
	RlUQPLRMvNIAKpKipB1itd12++NtYrBfOPT4pm1IgL/QMZFagj4xLtqHVNheDGj
X-Received: by 2002:a17:90b:4fc5:b0:38e:49c0:75a7 with SMTP id 98e67ed59e1d1-39aedfe18c0mr2965060a91.8.1788321179932;
        Tue, 01 Sep 2026 20:52:59 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:5fdf:d463:f07:1882])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07b7987csm2502377eec.16.2026.09.01.20.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:52:59 -0700 (PDT)
From: "Hemendra M. Naik" <hemendranaik@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	jiri@resnulli.us,
	jhs@mojatatu.com,
	shuah@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	vishy0777@gmail.com,
	tahiliani@nitk.edu.in,
	"Hemendra M. Naik" <hemendranaik@gmail.com>
Subject: [PATCH net-next v5 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Wed,  2 Sep 2026 09:22:28 +0530
Message-Id: <20260902035231.81866-1-hemendranaik@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FQ-PIE runs an independent PIE controller per flow but exposes no
per-flow statistics. This series wires up fq_pie_class_ops to expose
per-flow AQM state (prob, delay, deficit, avg_dq_rate)
via 'tc -s class show', following a similar pattern as FQ-CoDel.
---
Changelog:

v5:
- Addressed Sashiko review comments:
 - Omitted .tcf_block / .bind_tcf / .unbind_tcf from cl_ops (statistics
   only being exported; filter attach to fq_pie is now disabled).
 - Dropped empty tc_fq_pie_xqd_stats placeholder; class_stats is a direct
   struct member.
 - Limited flows to [1..65535] so per-flow class handles fit in a 16-bit
   TC minor.
 - Rewrote selftest 83c0 with TBF + fq_pie, ping traffic, and
   matchCount 1 on per-flow stats output.
 - Updated selftest 83be for the new flows limit.
 - Dropped the tools/include UAPI mirror changes from patch 3/3.

v4: https://lore.kernel.org/netdev/20260727164056.106203-1-hemendranaik@gmail.com/
- Fixed unaligned commit message; moved typo fixes to another patch.

v3: https://lore.kernel.org/netdev/20260630183702.170798-1-hemendranaik@gmail.com/
- No changes since v2.
- Resent after the previous submission was deferred due to the
  net-next tree closing during review.
- Updated corresponding iproute2 patch in response to review comments;
  kernel patches unchanged.

v2: https://lore.kernel.org/netdev/20260614125000.6058-1-hemendranaik@gmail.com/
- Addressed ABI backward compatibility issue for tc_fq_pie_xstats.

v1: https://lore.kernel.org/netdev/20260531125314.22492-1-hemendranaik@gmail.com/
- Initial submission

Hemendra M. Naik (3):
  net/sched: sch_fq_pie: add per-flow statistics via class ops
  selftests: tc-testing: add fq_pie per-flow class stats test
  net/sched: pie: correct tc_pie_xstats field documentation

 include/uapi/linux/pkt_sched.h                | 23 ++++-
 net/sched/sch_fq_pie.c                        | 90 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 33 ++++++-
 3 files changed, 138 insertions(+), 8 deletions(-)

-- 
2.34.1


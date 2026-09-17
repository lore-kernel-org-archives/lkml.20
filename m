Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C604E9C35
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677769; cv=none; b=kokLqRaLGBodpJobYZWWGhWSF2a4D3zMpQppGq5GJ09Ik74fPu4a9HO//gjV5WZBxOr+kMuBYR84XgqXJui2a1CaM//wzVg2aE90Geuth3HuROqc+nCzpZP/N7UZOhxIxKwZqoCNrrOHYW6BaqljCBT9t2pE82VQOScg4d/zlOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677769; c=relaxed/simple;
	bh=f5YgqNXr7kQ+zmdldTupNAdXUjiDnZP/rTEI5lKEsBk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pMZDvfvPGFG2l0Bxh3cKmfSz5FIPLiiaimQl97sANWFp/0fu8lZD0cm+B1pWMRjwh4KvEAqqv0SRbdFRDqbDdegMECnn8D8S9Tm67rRnWArJsV2hIjDbdWjADqhWI1PMriXpBxxfuMPkLzKpTe3TZmYJdSimQHD0qfx952Z/XfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qALufLHo; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qALufLHo"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso57834a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789677767; x=1790282567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bbre42kML9hxugGX/Iho8U4qBybcT1kk/x/wQqLaFXQ=;
        b=qALufLHowHXvnQjGrFNUPQfCwAQ06a+6HSC+pT6BN6XB7x3Z3L8QMH9qUf9CmUMknu
         los0a4vYHSCUZh+Xd5MaY0c4jy5derVzqYV14WusMUEcQrEnUKccoYWB80vWIld34uZ8
         W3PndQOJ32r1eAqeziizl2l7qth3XBUdiKoPChgtGpRF7D/6j9x0e403NN3+xbEwG0+i
         VZ6kPVPGDxFKtJCc6s29a5tBYbZWhWPFfTfCCsYghMpK9wbSkTAzEpgrpmzUlOxZk21Y
         A+WD3Gu9rmzd1L5GdDVhtp6J7wa6drPCi4cDnwB1d6SOsebJw2FH9bgMp36vWjZJWaVx
         STJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677767; x=1790282567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bbre42kML9hxugGX/Iho8U4qBybcT1kk/x/wQqLaFXQ=;
        b=BZoilZJsdANX5um/2FXsaPeCTW8CjaWClCwLsJuEhPhTxyfP8p8ZWG+FoDvQ+P0OcG
         Hw1R2KKEsDN1Pcc3oAIjUrrZbOIibcfijy4phTD5S6mmx19sqhtpRlTRk/RM8aqrq9RO
         VtbXiR244htFCVd8zsM3hS/JHldAUuCGTqwR+SbN+w0hOWiruPKcrGgBkWGIQFn64sqz
         5qGrdKN2Fgo5CaEZDfUQZaIpObT4LJGVHU/Rk5qlYrrKQD8dFdmgg+hGJsTqWK32MCZB
         Kdc41ItNObE8T5Qu6aDg/oSBHEktyO+uMMCt5BhP2GonExNE0EIDb9UJgmIma9Yy3QMf
         2qkw==
X-Forwarded-Encrypted: i=1; AKwUvBw9SsPLWq8fnE73c+gz4Qw2CuBL52ZPxkm63zLs9yrBDnj24L+QtNOMRh+QTJ4ulpM8whjcQRscBmkR9Dk=@vger.kernel.org
X-Gm-Message-State: AFuF++mDzbSXObbyfMkPBMPAkp3WVM1pT81yAXoZUunqQwSoZhamZj9W
	lRcRYTCSMzxAaPUDUWKy1ZsdYvyTrBT+Hf1qAlbtxb3WI0uwavxj70rE
X-Gm-Gg: AYBFou2ZoHkx2Wwa2EHugzYQ9DzDo1tzuxeQBKRFn+6dQNAaVxEJgE5mpLTUxFBMoV4
	ipEvyF/4QdoRbvYsp3FWfS09tyI2tGiJmK6MofSS99Ngbpd0amFWaGQJPyPFpbjfpXckABIpinC
	Zrzk4t8N1s1zah4i5TtQI/gqPnG98+RADIkx24ayeMdAGFaaWUkpiGyg166W0/L4SjnHkIUR20+
	NHu126kk78SYsfycLOhaz1o6shXjDI3yQRzWHCTRupQ1wMR0fzurpBfjeLhQVrkRDUNdL/x47dV
	zlavJQG5mQKOhoMqIRvFICBmyLpwtcE7BLueGaGa40FSAGRUiOB9fv5n2HsPODHGZUWXkWj4fAV
	OVxEqh/ie/+klbD66OMDqDQwU+3XEBuY4UYtSVhSSQbQUIbexrDfEZK6IKn98sD1IDN8wWUF3/A
	oa/XlkZctNUpnOOz+Zre2ZB0FzYQfkuB9OhRWBhCXTwZyFZ7U334WGONmZt/UHUAyDwmukw3MP1
	n62tZ8a9Cda3ZhFElVnnBIGef99G41ClOsF3du1HeDBtFzK/Mvi4KuyPx1RWyEvlIvPUbHQup++
	LmLJ1KxoVg==
X-Received: by 2002:a17:90a:d005:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e54f2bf77mr1103411a91.16.1789677767395;
        Thu, 17 Sep 2026 13:42:47 -0700 (PDT)
Received: from Inspiron-14-5420.. ([2402:e280:21c6:671:6248:69c:ea81:be26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c1943f4bcsm3620046eec.21.2026.09.17.13.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:42:46 -0700 (PDT)
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
Subject: [PATCH net-next v6 0/3] net/sched: sch_fq_pie: add per-flow class statistics
Date: Fri, 18 Sep 2026 02:12:22 +0530
Message-Id: <20260917204225.275251-1-hemendranaik@gmail.com>
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
per-flow AQM state (prob, delay, deficit, avg_dq_rate) via
'tc -s class show', following a similar pattern as FQ-CoDel.

This patch series is accompanied by a companion iproute2 patch series that
can be found at:
https://lore.kernel.org/netdev/20260902040221.83734-1-hemendranaik@gmail.com/

---
Changelog:

v6:
- Address Sashiko review comments:
  - Revert the fq_pie flows range to [1..65536]. 
  - Also drop the accompanying selftest 83be change.
  - Compute the per-flow delay with div_u64() on the full 64-bit
    nanosecond value.
  - Widen avg_dq_rate to u64 before scaling it by PSCHED_TICKS_PER_SEC.
  - Document the 36 to 64 byte xstats growth in the patch 1 commit message.
  - Fix selftest 83c0. The ping payload exceeded the TBF burst so no
    packet ever reached fq_pie, and the missing -W left the run waiting
    out ping's default timeout.

v5: https://lore.kernel.org/netdev/20260902035231.81866-1-hemendranaik@gmail.com/
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

 include/uapi/linux/pkt_sched.h                | 20 ++++-
 net/sched/sch_fq_pie.c                        | 86 ++++++++++++++++++-
 .../tc-testing/tc-tests/qdiscs/fq_pie.json    | 27 ++++++
 3 files changed, 130 insertions(+), 3 deletions(-)

-- 
2.34.1


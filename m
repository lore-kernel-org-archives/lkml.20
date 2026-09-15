Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E233F4829
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789514435; cv=none; b=DY0xa2R+VHQj3AEO7LtrZMeSwjmQYNMaslE4c0nADD8tnsHDrb1Gf/dZ4SxH8e0u3XGTFSiUB2miK0FOYiaMk7oZrVwYCVaP6T5wjMiAaYUTU+NVS6JPH6fvsGatv+0u8UDYeNQ/vEEWe7p8OlRMUxwON+rsQcWbOsZAUCkkkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789514435; c=relaxed/simple;
	bh=kVidRnCSLCRIDy0LcPsGCW6n4LV3v1+7iiJ/4lJYABM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eWRib+HEITTvVUV1NY7sGidsOOJDoJr519W5FBk//gJAwsLQiFQwBxqVnw25OemLp8zZMzWoSriRoEHYhN/2XPvj9VxH37hkoZnN3NKn6+sxyZiWcl+CSvKkLMZg7CKxm68dc2fzUH1wtbC9+9o6IWx78NEaTK6N6fWPkUqNT3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=lav8+JiM; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=1VtJuAqN; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="lav8+JiM";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="1VtJuAqN"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FMbjx52489702
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=QWwaDMx47FvPA0K/+SVrw7qA3B
	/CVOWD7eNhZlTng+o=; b=lav8+JiMyMkKi9wR9Dww7nF594s5bZDigLUeYTG+z7
	XGiio/3e6DVGS4XhOrCK1Hv7tVy3wuqisMGIOheolIcwOzuFunyIqgcgRWQRgAZW
	TxAPWuNWkQ2rvufrVgf6gSZ2c2vtq5s/x8cMNek8H945TYQdNLsrwdgVku2THdK/
	5SilvzzX4by/UbX/9q3eRLFp6bwar58ce5p5u5blhdLRQslAP7Kvx+HFIlUDvqYm
	AQ1EenPAJGNjv58pRWEs5wv3WNiDRXVSKv8mejPI6f0XP1R+gfC/0C40PDF/mqNE
	sJNyFRaQ/uRomqFBnl6eAv2TBV/XNKjLIBUNluy8TVTg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gqbwdhsmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:20:26 -0400 (EDT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0050a554so974826785a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 16:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789514426; x=1790119226; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QWwaDMx47FvPA0K/+SVrw7qA3B/CVOWD7eNhZlTng+o=;
        b=1VtJuAqNtU02vifMDMELpksetLgTaAABT6/gZBdvqwXP3CdbEmtc+2eDDXUk636vY/
         S/Cbu8WabYyoIF2YSxJwZNGfl5R/zzPBOdbrNzZlU+2QyZb7f0T4BsLEsJzUITWjbBxt
         wOpJJQUiK1bItvwwvuORx1tS8EvO6t1F+so1vyMi/o10ieYQLUTlIOVGKBx7vENLLDvw
         zlYj85Lh2cztN0WoycfeXEj9402AkOsJZAFZuTshhf8cIPtY0kWH5Qjj6pO9IQmjqMgk
         OLqP9h40251mENCXcj4Nd4qnG7wP4GDztRNEiQyQsUPaEjv42hi5mToMh5Z834uglpH2
         OgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789514426; x=1790119226;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QWwaDMx47FvPA0K/+SVrw7qA3B/CVOWD7eNhZlTng+o=;
        b=ek3jfleN8BKaRz3VP8cmht6PKhQizpRjHupwAAqNSc/h5o9cbEDVSCNp1dLz5mZMZH
         fT6f7FUGPr6kZyMhQYuZ3NcNZbB9Dn23oDrwp7fwrncbEuS1ns78ZPTAqCDXDdqQHq0/
         ClIg6J8LP8vZ1F9mjZHO16icoit/LoMmvOO0GV+pSkJecUnIgUVTiZ0CHuCMK00Ykbmb
         4H0geK/XNCcSc23w5q1ZE3yOgxpaRRToMT85us72eWhYS9moCdJ9APvzs/rLPj8cLtEB
         duNkxVeIIKIqDuw35wTdLaxZ3beULCUKauUDKdd8a6k3LSsNaLzmiJxMapG1Nzco/dR5
         7ZkQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/+Y5IheQFuFJNK5FqJqUiShPJDNknVWM/nah3i7uS2JrAjVygFJTpsX1OMJDY2XQBAy7jOs2Rqjt3p3s=@vger.kernel.org
X-Gm-Message-State: AFuF++mKLVePaIOsg8TKKcSCNbXDUTclBBSZqk0X/Z/KgT0sRuTeixec
	5xPzRlsK6yiHUdoCzQkujUzX9LPjgNDFI6+RgCHOidYRN+drtyH85JdmD2JHG38OxxrQNbUyE1h
	Od6bRGPBaYxdzzzepXxAMaioRN3Q6kgrVxIFkah/3dOV0VgY+8pt8vCeZykHP4A==
X-Gm-Gg: AYBFou1Aht5KEzuy6w9s4npNiXX7f8AGAyRLWgyYah6cFG+XpRbWl2ClogkHH4liZos
	N/6J45SBFgCk5mNTHJm1kDuEJdHfJJ/SrnS02Igx3tdTKFEfBtq5N8P1ang9JsgGAAOaose+Q8I
	KrOhrNHZ+8w3a/KIl+fa3CG4V0ZQe2ztp27vzZdzdh4D3dr/+4i0LFpPnU5lG6TgN8wd7oxudgC
	EkfTIcpNhzIlSfcKT+aJX6VO0cN8lqc/MNsK/ExJunKdQcoK8Gs6E5314g7kOyUAwqyEqL7iqqq
	bhcXkkVxpVJWWVCCAjEytzfWRE5LZ4UXJcavj1cF1Q0LXWH5HCwJ+Jpc2OH6uWqsJnXb00ZexG8
	b75o6O4gWB8KoqQrKkifP92Ues1BLocNjYvSoNT/hXc5FUmZF
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr62665485a.17.1789514425623;
        Tue, 15 Sep 2026 16:20:25 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:939:8905:ce9b with SMTP id af79cd13be357-93bb77461a9mr62660985a.17.1789514425107;
        Tue, 15 Sep 2026 16:20:25 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-179-204.net.columbia.edu. [128.59.179.204])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781dfde3sm77151085a.12.2026.09.15.16.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 16:20:24 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH v3 00/11] mm: memcontrol: constify the read side of the
 memcg API
Date: Tue, 15 Sep 2026 19:20:04 -0400
Message-Id: <20260915-folio_memcg-const-v3-0-c239a6010b58@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXSqWoC/23NzQ6CMBAE4FcxPVvTLhWKJ9/DGAPtAmuAGgqNh
 vDu8nMxhuMkM9+MzGNH6NnlMLIOA3ly7Ryi44GZKmtL5GTnzEBALLRIeOFqco8GG1Ny41rfc5X
 FCSphlT7nbN69OizovZq3+5b9kD/R9Au0NCryves+62mQS2/zUwE7fpBccAQjbQYAKrZX4+qhy
 Sk7oR3YchHgF9F7CMyIlhLTQqlIifQPmabpC25Hi/wMAQAA
X-Change-ID: 20260807-folio_memcg-const-4a67e40d485b
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>,
        Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
        Barry Song <baohua@kernel.org>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        Baoquan He <baoquan.he@linux.dev>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>,
        Nhat Pham <nphamcs@gmail.com>, Youngjun Park <youngjun.park@lge.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789514423; l=2734;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=kVidRnCSLCRIDy0LcPsGCW6n4LV3v1+7iiJ/4lJYABM=;
 b=IUUOAnE370UfZHmbfJ+hzfZc13IWrSCvHO1T7L1Q8AxoiMiDM9A+vJqtBHulacRIVh0hjFl35
 /GfS9f4r1csDMdmNpv3fw4T4amusHZrD7r/pgt+UN2gUz0GBkO0L+Lo
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX7wU0bYgJcDLw
 wGAHHfhZ2Rgl0DE0PUl+mV9nuYuBMO6k7EYVNkQIvGijNX6Ae6IiJFgWgwKM5CxV96ZKlLr90+0
 5hOnZRHRZLO93QlOsntXyfV/hCTyibLJfWOgeGi5+k/Sr+jJlFmQcEzhVVRaHRB84pMgnYNO3Pi
 heMLdKFHhb2+vE/AHsypqDef+VBagq/bYYcFO1jRAcMcZJHsQ8M2c6oh7OnZ6lAxqEFfMWAumzF
 GoUmww3Vdj0OTd2Tp74Y6XjL5dBI7eQG4pjfMJHp6LAt17njUd0n4qs+HA/fGNBFhEoqDhm3TGz
 jTK+hHGeTDTJwK4gKMFnLRBW/bQdbZrxIOQPX6LcKVTCDvFC11OkD0Dsl2kZ2XBgflVypEat0M5
 vZdCCprCD2xKkn6ihgqg2Vl9MoDZk15SXDjOHxYl2q8zPTBZtXudL4NtfpvZ9jtahgoG96Oarg5
 dMa6BZSsqE0zzsxl22A==
X-Proofpoint-GUID: 0VozmvBhWWpcGKsagCNd1ik7zvLsQgGm
X-Proofpoint-ORIG-GUID: 0VozmvBhWWpcGKsagCNd1ik7zvLsQgGm
X-Authority-Analysis: v=2.4 cv=a72lZkSF c=1 sm=1 tr=0 ts=6aa9d2ba cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=hXAsoc/zAxyCEdIRhrpmVw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=bC-a23v3AAAA:8 a=b6ln72opZJ-VCPk_GP8A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDM0MSBTYWx0ZWRfX36QH/JVoCh7t
 y0wUAUiurjB049FJzhQ+E9Xz+AcTAv0KyNG8AHHS743dT3Fo6q6jDbVoCtuTXPjUpqHVfI0yqX+
 q27vRxaXKY2JNAPqwtm40m2vuBFxMPpB/CCcYPkHBq6qNzETJ5aQ
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11906
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=10 malwarescore=0 adultscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150341

The memcg accessors, lruvec helpers, and stat readers only read from
the memcg, folio, or lruvec they are given, but take non-const
pointers. Constify them, along with the page_counter readers and the
swap I/O blkg helpers along the way.

This started as a follow-up to [1] that quickly grew in proportions :)

[1]: https://lore.kernel.org/linux-mm/anYqSDnC2BbJXv1h@casper.infradead.org/

---
Changes in v3:
- Patch 1: Constify get_obj_cgroup_from_folio() as well, per Sashiko
- Patch 3: Use container_of_const() in mem_cgroup_get_zone_lru_size(),
  per Sashiko
- Patch 3: Note that lruvec_pgdat() still returns a non-const pgdat and
  does not use container_of_const()
- Patch 8: Constify the local memcg stat readers as well, per Sashiko
- Link to v2: https://patch.msgid.link/20260908-folio_memcg-const-v2-0-811e9f443409@columbia.edu

Changes in v2:
- Patch 3: Constify the folio argument of folio_lruvec_relock_irq() and
  folio_lruvec_relock_irqsave() as well, per Sashiko
- Patch 3: Note that mem_cgroup_lruvec() updates lruvec->pgdat in the
  per-node structure, not the memcg, per Sashiko
- Patches 3 and 8: Use container_of_const() in lruvec_memcg() and the
  lruvec_page_state() family, per Sashiko
- Link to v1: https://patch.msgid.link/20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu

---
Tal Zussman (11):
      mm: memcontrol: take a const folio in folio_memcg() and friends
      mm: memcontrol: constify obj_cgroup_memcg() and friends
      mm: memcontrol: constify the lruvec helpers
      mm/page_io: take a const folio in bio_associate_blkg_from_folio()
      mm: memcontrol: constify the mem_cgroup accessors
      mm: page_counter: constify page_counter_read() and page_counter_margin()
      mm: memcontrol: constify the reclaim protection helpers
      mm: memcontrol: constify the memcg and lruvec stat readers
      mm: memcontrol: constify the swap accounting helpers
      mm: memcontrol: constify mem_cgroup_swappiness() and mem_cgroup_get_max()
      mm: memcontrol: constify the zswap and socket pressure helpers

 include/linux/memcontrol.h   | 212 ++++++++++++++++++++++---------------------
 include/linux/mmzone.h       |   2 +-
 include/linux/page_counter.h |   4 +-
 include/linux/swap.h         |  12 +--
 mm/memcontrol-v1.h           |   6 +-
 mm/memcontrol.c              |  57 ++++++------
 mm/page_counter.c            |   2 +-
 mm/page_io.c                 |  14 ++-
 mm/swap.h                    |   2 +-
 9 files changed, 159 insertions(+), 152 deletions(-)
---
base-commit: b08a65b93426d86e3f354d655d6225397b591877
change-id: 20260807-folio_memcg-const-4a67e40d485b

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


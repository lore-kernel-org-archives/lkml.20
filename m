Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44E395AF0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377309; cv=none; b=r5pWOawDBfcV4StpRzknyn177jdM5+uaEqYdPz1VlmG76Vzv1wsxmxB0sDbbYY7hfm4XlsmjQPUkK75mPzG4RJcaG+FL8FtiIF6BzyjyjU5ImGW8AYW/UXrt9Fl+xZ4EZ4edO99zTcvy0plMOUxXVXIE6iXPFC8SnnxaqCu4rOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377309; c=relaxed/simple;
	bh=yUEHEeReCZ4YDwLuJjsFeMZaNLX0OqqIMp+1QYovZ20=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y5RxknJirjmkx4X/CGO6BuFM9HKg0mt1aaHatWpC7OyNEMS8PKvzMBf25Lkf5fZoQyoFd8PpAyGMT4Ql9v3bCWO+mPA/IrkBn19iukrjIrTKId17PkyYJ/poQNRm42qHy8HFVlwtqRwGV+4Or8bW+9AyABFyq+e3mWw1AU17t6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=niXq4kAh; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=tPqjUzse; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="niXq4kAh";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="tPqjUzse"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682JGfnj1243584
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 15:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pps01; bh=XIT4QoZ71Osmkeg+FUd1lgbaZ4
	qc1T8WZBa2s5ZV9iA=; b=niXq4kAh4v7hiV/l+BZL0JNK9e+f+jGhoZVubGdaQ5
	9E/m53+u1+9nAzknOr+b2/5r9RozqOe/z719xeaGcNpFyRSc4fSZd/S4wsYf7d7n
	JdgOpT92vu2DnDyzwLdkmYTkgcI5tz+aDh3oS0bbR/4D/gIxCmQy8rAJBHVczWD8
	sEL9wXkCRQALtIu08cqgRrUT3rTTIz7ujZROEEI7oxV6SO51rODXtnNNFvI4xs9b
	a9MJ4j08HaijuZCyOzaOkaKJHRGqeFxKNQFAPaADLqXRvibzA2NT1Lh8uzT9hQL7
	cqrCU8YcAR/0/reH4kX1mx+ef2mGAfX+BGxHRChycY2A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gestjg2pd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:28:17 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52fc3bff8bdso26492841cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788377297; x=1788982097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XIT4QoZ71Osmkeg+FUd1lgbaZ4qc1T8WZBa2s5ZV9iA=;
        b=tPqjUzseAyp0XaBCmzpb8llS60nELzXCHAFl5yqNa6IsF34Huy38AKoqPduML2IGEb
         jBZX3hkFlArNNA/+p277PRB1hWN+MF+DMhcGOiJvcv9iSVxM/j8TxJ/Erb4jvI+FwYAi
         gOIH8Ei1uhMAvQCBdyF20ychgrfEWShjoHq7qtrALBdvYzfEIhp+FHHmg4kBS54eojfw
         hJu7Azl+GZhqc1t7fh3/4X6lfpyygUVNlIWpPAwv3HMT+nNevw5Zn5iLEv0k08PVI5gm
         MYm/WBDhgNEQ0Iqr4ccWu/Ni+XFm3o9U/cnwUPzqrpEOyCSvPu+wF7ZvF094f+RW5Nkl
         k1EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377297; x=1788982097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XIT4QoZ71Osmkeg+FUd1lgbaZ4qc1T8WZBa2s5ZV9iA=;
        b=q4QnG4PT7LVU3Kmxt4q+aJIEXs50KY6meEOLy1sNNKXiny8q/Hv71rixFTobMWF/Ql
         MXz7h+n0TL5FR8GxBIdmQvXj7GNpipHHyg2mtZG/QVafLcmATNzIzvDFgJMkHLPNTmPh
         SEFMiVFEKhdRAmN+23YFakiIAyPp0o3JAHFp9Ea2bO1SYa4ixiDpYKR3DW0XXsILV44w
         jt0pdnNVBzS49Brw/XF0GAniIQ7WGCCjjJjBvVa4HTKyVQbbnPZBmEXIX4IMPpZ489Hw
         +BZTD5jRdpiDZF1H3bTZvTHaFCXDuXvjms0wvbOloAvhUQ5udTbZb2bb9hxHolvWtGyq
         sVFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkGE/RRXTYXrgDisIkm9mMKfo291CBDUzFSVP1ASNne8zXPsH+P/Cmf6sD6lTxiUNrr1r4k8qhJiXcFK8=@vger.kernel.org
X-Gm-Message-State: AFuF++kwYeIiEob29fbYVE5oHsJR7edMIp1duJiSygRcUkALPkFPZguY
	k5OMhto7HfcSFN4RGn+OKu2mVdGCgNbFAHFhCQ9RwxT6Q+wsoxYJsBszA7buOQn6DYggJyvYxW5
	5UD/XxBzYN4KOs1rp2jwpVVuI6ucM3fJm1MlPAhXUb/TKJpO6YzvAwGiBHvH/ag==
X-Gm-Gg: AYBFou3Q8BxdOnbA40Ki25Y2w7ba2zTwPDAhb1GPzyjfl/ilRxYJYTNDNDLYo0fxWcO
	fU46MhRp6n/5gwn6SMuw32dktDvtjGiF6rDpa2BOeFkas3XJlLUHqerY/KSQgj4v6dCa7vHpkTM
	b+sFXzsZbA+B6YEdWsuEi9n5gYlwUeAKcYJXbf0JVL+HJvysrHRvsEinK3/SoB5o6ZxzfbnB2ci
	4mDoayX1SU+5kiwrLd+CJJMCMtrSTk0keep1gBrDcDGPUOwmtz3fvgy/rhlbCaK4iR8t531tjPh
	bWf7o59Yk1B2Bm+acyEWhJxqYIu5Opyuuu/CZmtwfPY6CwMWDr7jRYbW2zpOWAClkk1iuuWJxA0
	bRsnCg+W2m4WuGVnRCZxWsM7pZsB6hyMm2GjsHrnSB/XvyldII5jGcw==
X-Received: by 2002:a05:622a:259b:b0:530:42e5:f3a6 with SMTP id d75a77b69052e-53042e5f678mr19138011cf.41.1788377296967;
        Wed, 02 Sep 2026 12:28:16 -0700 (PDT)
X-Received: by 2002:a05:622a:259b:b0:530:42e5:f3a6 with SMTP id d75a77b69052e-53042e5f678mr19137421cf.41.1788377296525;
        Wed, 02 Sep 2026 12:28:16 -0700 (PDT)
Received: from [127.0.1.1] (nat-128-59-178-193.net.columbia.edu. [128.59.178.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9eec85a0sm25420936d6.29.2026.09.02.12.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:16 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Subject: [PATCH 00/11] mm: memcontrol: constify the read side of the memcg
 API
Date: Wed, 02 Sep 2026 15:27:46 -0400
Message-Id: <20260902-folio_memcg-const-v1-0-e2c1da22246d@columbia.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALJ4mGoC/yXMTQ5AMBBA4avIrDUpqZ+4iohQgxFa6SAScXfF8
 lu8dwGjI2QoggscHsRkjUcUBqDHxgwoqPOGWMapzGUmejuTrRdc9CC0NbwJ1aQZKtmpPGnBd6v
 Dns7vWVa/eW8n1Ns7gvt+ADk2adB1AAAA
X-Change-ID: 20260807-folio_memcg-const-4a67e40d485b
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
        Roman Gushchin <roman.gushchin@linux.dev>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Muchun Song <muchun.song@linux.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
        Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>,
        Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>,
        Youngjun Park <youngjun.park@lge.com>,
        David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
        "Liam R. Howlett" <liam@infradead.org>,
        Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Qi Zheng <qi.zheng@linux.dev>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.17-dev-db0b7
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788377294; l=1753;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=yUEHEeReCZ4YDwLuJjsFeMZaNLX0OqqIMp+1QYovZ20=;
 b=2daVjnF7Z44mYyYEgCKwKIDVPS3KI363eBjdVBOQmy8mvuZWK9eeEd/RLIccXxkUpN6jD5buI
 mEW0E1ifqpfDJ8ZVGf2ruhaosGULcxIBFz8zgH6A4uepudoqU4gl1p9
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX2wA+a8M1ljIv
 ZWrwKkCF4gMwxe18X/Jcgo2BljqDuJdHNArsp7nXQYwUoQx4I5gkfjhivdfA2a1nLgbx89V0CNx
 qcghfVOPvxNKrUO3ZMt43yFUs3H8/sA0b3Vd4dzniDL/14BKb2Tx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3MiBTYWx0ZWRfX61kN5/JKmdTK
 Gn/37RR01Qr4paAZyrQC+9NbTBQLNELfusS2XVFY8XuH7PMkq3MqtTjMXOd65d6RpO4V4twIBuR
 7z5W/5dTjV+/+g0epWAzBo2btQa+uL4h+lJLjNVcwhw9AVxCV9/xO+FSAFYITwS0nbBuBsBFLi7
 fm1ebLk0riNhLsFKzaL+QUrvaHfUslR2bqiSMYTjjATdW+EalfnqxwQz3dPNNH7L3D+f9G+L2FL
 ynmqEm0xxZto8oAXCrMVUHHjbaFfQvbvFXOIXNmaqmM+2sDKoXFg3wmCKcBn6pXw9fff8JXEbP9
 /o0DCd2kQ8RdKKQFlzyzDxFK4q4p1+CM7NXavGjug1H58K5wy2UVFm7DklsF5w80BwK1MzLR6Gj
 JfUvAW/vOdGqdIsaCtQJK4XT9Xx2xkASzMcTAazUE0kFEKhu4u51iT87rOLZsehlSxTOE6XjJMD
 H+1yLpP/xVRcYTVzWfA==
X-Proofpoint-ORIG-GUID: -G-r7vMyelfJR7MilwdUT9IvIRwP0Dk8
X-Proofpoint-GUID: -G-r7vMyelfJR7MilwdUT9IvIRwP0Dk8
X-Authority-Analysis: v=2.4 cv=C7jZDwP+ c=1 sm=1 tr=0 ts=6a9878d2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=XwBYxoxBwSosfWEfMcqm5A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=LIvFlyDzFMSjF_C-DhYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11894
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=10
 adultscore=0 impostorscore=10 lowpriorityscore=10 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020172

The memcg accessors, lruvec helpers, and stat readers only read from
the memcg, folio, or lruvec they are given, but take non-const
pointers. Constify them, along with a couple other helper functions in
mm/page_counter.c along the way. 

This started as a follow-up to [1] that quickly grew in proportions :)

[1]: https://lore.kernel.org/linux-mm/anYqSDnC2BbJXv1h@casper.infradead.org/

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

 include/linux/memcontrol.h   | 196 ++++++++++++++++++++++---------------------
 include/linux/mmzone.h       |   2 +-
 include/linux/page_counter.h |   4 +-
 include/linux/swap.h         |  12 +--
 mm/memcontrol.c              |  37 ++++----
 mm/page_counter.c            |   2 +-
 mm/page_io.c                 |  14 ++--
 mm/swap.h                    |   2 +-
 8 files changed, 138 insertions(+), 131 deletions(-)
---
base-commit: 178b3d97bf1f15f598ea7cc615a40c115e528e1c
change-id: 20260807-folio_memcg-const-4a67e40d485b

Best regards,
--  
Tal Zussman <tz2294@columbia.edu>


Received: from mail-wr2-f10.google.com (mail-wr2-f10.google.com [74.125.225.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159E7441606
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 18:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788633114; cv=none; b=Sb5ZYRvk5M1y6kZaSsKdSGEF+vWX0lxwv4J56WmBi2A7oREz3RXdqvoRND4iqParSzfP8QNR97f5X7qz9/WMFEx06C8WJ4ZJy2VS+DZGDVUoGy80pcg2Rp+fBG6XVXqC4d59XgCBR/ZPgUuSKTpr2Jmfaem4RdolEC3SuuEdyt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788633114; c=relaxed/simple;
	bh=Ae48B9W5r/ADlTbLtnb1ikWa41fvcRxBbZ0pvCsFL7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJIJSOqKkejU68I8hv40S1NQBrDbdrL4m377ulstlzt1m41eMe4VdLgZj7KK5tY+QbyxMAbOqgpTKJLQ2GwtwzyOMwOiDvGo4bxatKopzui1qjdn4uQuOTnYbb9GQSTuABn3x3S6vWZ2IHVb1H7ChaJjLkx8+DH+xtUyg3DUwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biFIRm1+; arc=none smtp.client-ip=74.125.225.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biFIRm1+"
Received: by mail-wr2-f10.google.com with SMTP id ffacd0b85a97d-48436370540so945213f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 11:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788633111; x=1789237911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zfasN+n5VbNV4Zf/uf4x/WVUuqiwji5V6lr+yEJ2jks=;
        b=biFIRm1+wIpyfggqKNUYID2Qot18NVEMEDFk8tB2M+8H6fqvIMf9i2kJp4yV4QLI8P
         M53rBNag652UlbQ9qsFhp/0IMQIlokaTmXLQBr2aHIhl87cgMlypbtgfFso73Py5kiRc
         Lilbs0/0xyMsnGggYX+PvYZYtcG8Py2Ve92stFvXD1i2yLXvutbGb35YAV+BZoMYcUII
         Y65dGrOd0Ffw1OKMCbIz8ohURvJpbBU4FMO1hTn02K1gAtbG20znO7Ol+JXUMCSAFN1E
         phon5LzEoivsIfljH86aRrechqkfpCPCIheDjZT8HZvTSNgn9Ux4PHc5FgrS4tslojBv
         Rbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788633111; x=1789237911;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfasN+n5VbNV4Zf/uf4x/WVUuqiwji5V6lr+yEJ2jks=;
        b=RMj4w8PnhkXpajEbN318k2XsTtqp+ie21In1+6EGtIQo7wZqLnJX9otVxY2rIkZF6N
         RgNlbQhcz5cKws6F2VEa0wRVDfHSmpxgzDzuDnuz1+7Tx7nP2dKt7TySLet1s6VljI/Q
         74nEpPc0U8v5kYKz25EXaqUa7Js+okbTZDp9132WQvDhUbyZBvQr7K31npH71M+enZuq
         L4Jl/uhz6IRLZmE2YoqQkoDwqrEvcrLj9+LAGpjrn3yBxp8yc0fyfNI9Rtfd1UHB8Mzm
         ooSrYJ280OV0onxTb0bLtqO6i2f3lr68qd0ln8mZGv/MqMLG6zazHgmm3pjph4PpJWEW
         1jFQ==
X-Forwarded-Encrypted: i=1; AKwUvBydVq7G0ZUMJAAuwcoFQqGAXsx8QaCRyJEc3jPNi7ULZ37xd5ShTPpVGoTtLstj3UQv8771AkVKc3/OO4w=@vger.kernel.org
X-Gm-Message-State: AFuF++nxz+O8sSspUHHgj0GlCcp0NfgPszTSJ3AX/ktga07Iui9xw51s
	0NOwVXfIBcak9uDst5a1Gu9jI3N5ch2yjX+dn7ARhfvvzckBwRMuarqZ
X-Gm-Gg: AYBFou3fmHMQSz10iSomzAMPp4276wV2CY8JCzTrbLTh/RlHMJH8G6MHKMTXHJuvFMS
	MlZM6Ib/RopXfKKWUUE0d5mi+vSz8rRFrHAEPZMKjo5AelIkJeoI1wmcMFoo/TsGYNBmM8v9pTa
	IuwyT/Zndu9iUrFW84QiSPqDbCfnjgcGCM84ba1oWg375p76vtewb2fu7Nqyj3C/lev9U/nHzK7
	nySz7HusTcJuf2fossA394VlfECOGlt/jWAcxKZQVAc2fG+g52us6Xvcw4YQ6+a0hRYqCXCKNqO
	SPGgXWUxpqyAQTOPjxWIKzMAJxjNQqaRuE2knPZ4XqV+e43hz7+4TGzt7msByRPUBqqyfRcaWaU
	rY29XBKDtmD8GLAHgj7SgjiEECjdZGAs/mwtGXExZTMSZI1ZtDgPBKS+8TM4lG/tm7IyaBCIExT
	Ana+4Diqz6gV+WgJfYY1it4LwbdeUSiSotVlC0P+P6GcW086jIMYIya8xEWc4BAW/RXoaOMD0Kg
	FFa+puJP1Gg86XlCq8hqYcI/0REn8buwE5qdykC
X-Received: by 2002:a5d:6f1e:0:b0:485:8c16:5ef0 with SMTP id ffacd0b85a97d-4858c166129mr12096459f8f.42.1788633111054;
        Sat, 05 Sep 2026 11:31:51 -0700 (PDT)
Received: from outlook.com ([2a02:587:6022:4b00:84ac:4417:9f37:a496])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm13066670f8f.3.2026.09.05.11.31.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 11:31:49 -0700 (PDT)
From: Christos Skarlos <christosskarlos.kernel@gmail.com>
To: akpm@linux-foundation.org,
	david@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	ljs@kernel.org,
	hannes@cmpxchg.org
Cc: ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	liam@infradead.org,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	baohua@kernel.org,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	mhocko@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Christos Skarlos <christosskarlos.kernel@gmail.com>
Subject: [PATCH v2 0/3] mm: minor janitorial style cleanups  
Date: Sat,  5 Sep 2026 21:31:32 +0300
Message-ID: <20260905183135.20993-1-christosskarlos.kernel@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series resolves various coding style issues flagged by 
checkpatch.pl across mmap.c , vmscan.c and hugetlb.c.

Changes in v2:
- Restored filename comment at the top of mmap.c.
- Restore <asm/...> headers in mmap.c as they are architecture-specific. 
- Remove blank lines above VMA_ITERATORS and NODEMASK_ALLOC declarations.
- Fixed commit message typos.


Thanks for the thorough review and guidance. As a newcomer every 
feedback and advice is really valuable to my workflow.

(Note: Apologies for the stray huge_memory.c patch included in v1 by 
accident; this v2 series correctly focuses strictly on mmap, vmscan, and hugetlb.)

No functional changes are introduced.

Christos Skarlos (3):
  mm/mmap: fix various coding style warnings
  mm/vmscan: fix various coding style warnings and errors
  mm/hugetlb: fix various coding style warnings.

 mm/hugetlb.c | 16 ++++++++++------
 mm/mmap.c    | 12 +++++++-----
 mm/vmscan.c  | 11 ++++++-----
 3 files changed, 23 insertions(+), 16 deletions(-)

-- 
2.55.0


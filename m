Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046219;
	b=N0ivPxA81uHliPhaYkxc5s2gIWqN/iAT77bhGpXKzDmQaNdVLh7TWWwA6ivai0Bc8a8n
	 BbY0HJvXsclzGLCiQZKMG3Jmoo6k4aWIBr60Ooj66N7WR6inAo9PJXffWR/kJZeYd7fwA
	 yDZ9q+3/txyjZCQ+MK8juCbMOo6l0LHbvsVkP0bU1a1MFi/mkITAGeRjyoOqvo+T4IfZf
	 0a7iBDnxH3p403tf6v/L9kg2VZRYqK1CnUYnunvi6CQCkjG05GQ80M19UIFEnlBg+i5tZ
	 Vp79DJdyNh8Gl+qnOU1jdsZ618xLMZi1FJ2UEQYtKy2Gqz+NsTL2UvPg9HlHmxfj67Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bKvNc5FHva93Nru6Wk+U/7p4AvuTN2mzzP8feyVue2g=;
	b=DGM2N7EvqH+QccE0XhecPOWtVAqGrfQmdbIYX3TFVyLWva0L0ijjCH1F6gQFgqPaPTpb
	 BOKzFdHMdUGgGN0DWPlG18FXeN+6FdWUw9ShskovjYZfIbnhRaN+qzkTwkx4u+ouGWrPy
	 kQjHBXpd2cycbLrVb9Bwdfv4vGAcsIMj5uOdc39wFZkhAOKKmm+TGThHKjMCtbKGXAbjV
	 yW1JfxAEtuYxLugQsQN+eXFH2OP9dzQbNYKEm7WXg/1oTlNt9YDnM8uSNWR3LAxTNm4zj
	 /AcLGiG21JT5f6in1c6xzOgZWZphkwIc8JSgA4PhK+A5NPIoayrUiK798i2mkIRPXKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aWI3dyy7;
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8F3606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 20:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aWI3dyy7
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89d6bd67045so143922b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793046218; x=1793651018; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bKvNc5FHva93Nru6Wk+U/7p4AvuTN2mzzP8feyVue2g=;
        b=aWI3dyy7+uPWw32xozvh9vj6Nz66UP3SazzWeBi9A8B5YUJeWSxOznkL93HeWU0lst
         xaW9lmT34uLYBIikoFojQJGlhUFCLI5+Bru/ZVcIR4O7caUqRolMn/VmgKhJVKlOa+Bu
         3SG+TgI/0NMbQUb79Pdu8rLiYQyE48hiGQ+C0CGPdd8sSvcJhd5kCicPQZVHfZydcknG
         idzYvCVo9XZJ3La1neYrJ+zhk+TQ13kfgsMD5aH7G2ERlGZ5VB2EKigTfrSUTJ8Tx7qI
         eTS0NpSDWmNLv77koGYlO636GGYtkSqIk3W5sKdMj7Memh01u5APvE7srk2ecj+biH06
         /pQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046218; x=1793651018;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bKvNc5FHva93Nru6Wk+U/7p4AvuTN2mzzP8feyVue2g=;
        b=PYIawmF12Cd62WEJvLQR9OD+YZhfpBeUk2uBtSDxPX8lxVdDh5012DggMURI6xsnRY
         P4Zhm9R7pq4QGaprfMKcWysodsypF63168oIjAvJPQ6rHF7YIn5QYcVakAehw5X9Adwv
         u6SOaksoKzSQR8879Kz/BcS/B7FVBoImyVdIzAds5lbEm4FxiDoq2mkXn/3h2K4/0Cd4
         DTCLYta6SE/+SYjeiCklQJywJbN/c5rOlCJ99x/vpOO5utx4mA3CuIvk4C2k7JrevpC9
         mW/FLJGrvJUrcVbcHESGQgurvgDsRMMWdpml4tXJApttlbXNpKSQf+Y7s95eOTBFkZ/Q
         Wp5A==
X-Forwarded-Encrypted: i=1; AKwUvBzekExM1o6oe5QfWhwOV1U//VAG6aiMZar2SuF/hE9obOjPh/Wx0aoKQxOQC13+qEmvvi2upnbbKygn5mo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLd03pruE/6zWYhG8dtV7XPtkU3szpYuB7UDH7moQy6x6NqzO8F
	jQan1m/qDEIw+VobdPfqBoh7eCmZHLsIU3gEohynm6nnVgdeb3nl4nXM
X-Gm-Gg: AYBFou0nCBiuvWvEypto1NaLC29GlmKgRvhFvheJjIp3kSGA6fJuHuTNO4CusmLAg0T
	jt5j968SmRRNu6SR/N6rqh+yOTprgseh2wcNaXYJv9DMOjf8gflJupOQpFlCJmo0/PswN/drmMM
	x6zOvGjOlDvE9EngfPpE3CeZOXOum0y2wfQH2yEnNqHrK5Eij9G1PURFE5egPQsJRoVBZ73CEWc
	xE2O4m1uwDV/ziUdQIvNQniPurvFfEO54YKDiHFFDZlc8kag4Edoq/4niVtrPuCcVcUTLBWP+uT
	itzXrNgm6f0Emi4LkM82j+toK5tC534xfgJPwgNKI9+FnPZnh1U4Gn6Lye+PKWPGFwQqJHEM6Bn
	FIB3IdLQ8est0/HjQlhTQDVQQvNBGrvSBbbrhabMQiJ6vk8z1qGPELd4uFyx4MyIHiJrizmQlSp
	0k27g+acHlPDvou8cfW76EmpWUt3WWJDM5IXKiXiNIPEVhxAHSpsrJ0CtSC6IXe+1j5+xNZLcCF
	QpT7cnCo19sqZmkvjOVrezzVKfdjK4Ubwe6bmZpZS9rI10dvUOZ54o/mMMDS8A35K2Jq8c/bUjg
	wtKRdKLc+B+plctExNKpJJzyxdSz7tBCAvVfPvKgguG58ZDC7prOsoVa7JosQwdW26ssVqHgRUB
	VL04XH5RQd20Y8Mm5pLWEPMu4XBfIm7u8jFGQ/TM+jG/ZVNzGedBAsshJoKwxjJX5Z1c=
X-Received: by 2002:a05:6a00:b46:b0:884:831e:d0e3 with SMTP id d2e1a72fcca58-8a5a601c56dmr360543b3a.17.1793046217922;
        Mon, 26 Oct 2026 13:23:37 -0700 (PDT)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bb29546sm1627846b3a.33.2026.10.26.13.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:23:36 -0700 (PDT)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: akpm@linux-foundation.org,
	hannes@cmpxchg.org
Cc: david@kernel.org,
	mhocko@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	ljs@kernel.org,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yuzhao@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	apais@microsoft.com,
	rlmenge@gmail.com,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH v2 0/2] mm: multi-gen LRU: replace get_lruvec() with mem_cgroup_lruvec()
Date: Mon, 26 Oct 2026 20:23:11 +0000
Message-ID: <20261026202313.63122-1-sidchintamaneni@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This series cleans up MGLRU's get_lruvec() helper in mm/vmscan.c.

Patch 1 updates get_lruvec() to delegate to mem_cgroup_lruvec() rather
than returning &pgdat->__lruvec directly when memcg is disabled on the
kernel command line.

Patch 2 removes get_lruvec() completely and replaces all 15 call sites
with mem_cgroup_lruvec().

Siddharth Chintamaneni (2):
  mm: multi-gen LRU: use mem_cgroup_lruvec() in get_lruvec()
  mm: multi-gen LRU: remove get_lruvec()

 mm/vmscan.c | 50 +++++++++++++++-----------------------------------
 1 file changed, 15 insertions(+), 35 deletions(-)

-- 
2.45.4


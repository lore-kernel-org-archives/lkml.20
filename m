Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616068;
	b=Usdtmhpq/9qEzLfFW9MdQxyoploJIctSS2EV7sZ5Ih290DVBhElHWKjMxK3L9Y/qqPiY
	 iUG6kzN+JGT8OJ90EBZXDHrJ1H0N3x5yZ+O/kiIVMUFvBrb9QB87Ri2DYcn3NFFqh68M7
	 6VJzkliqJSVZaa3lqJVQrkwJP5Yxp2BPwTU7oqqL4iPtX5DYu8VEJtML7hdjIKk/BwPUm
	 2umuTpHymg4KlBn1/IYPy3ej8qAUsJtYlfuqJgA8/4k+wvUDQT7JUrFAT05/uvQ13UE/s
	 3E5q92YwBRok9fAqCxRXD2O8zPSyO+Fm0JiblLH4mWroSbjYON+DTL7Z5sMPr21OqSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cBjUGHG8kbdoyzZbGr/iLJi2HGc+aHIvJeTBRuTSpM8=;
	b=5L5gXIOaL6jDvy1uZge/7lFRhEL8CcB27fNyXy/O+89nZ9UQrDdwWbVvn+P2dnBywCPv
	 +60+L18RsrtfOmSA5+EBLGpqjlmOsaffkoNpmaLjnMnL8BYSpAyyFvf3ThEAgp6R2dn5a
	 QFDAPFW9Psua375Bp0Abrkk72b4aKhWk5UQ9wzJCmRTSbmiauE08Bzm0bRKj/hzUveecM
	 yYMwS8ZIKTwakLqXoCT697Yd+kIqh2rR1IqSwsZrjlzePefqq2YTRNb89EXxcoilyg+e9
	 T5/j6HTMgQgw6OG8TeempNMnKiUmavDtKX8jNjHcUMDx46yMFIoVwqjNX9Xb+BSh7aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWytMOOf;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C10606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:41:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0C10606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qWytMOOf
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e812e2b31bso16418085ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616067; x=1794220867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBjUGHG8kbdoyzZbGr/iLJi2HGc+aHIvJeTBRuTSpM8=;
        b=qWytMOOfUicPwRY+FS79HBPw85D8Q3674+Rm0NB5JU3h+WdGR5LTOMOgpc6MGuBZRH
         LpLMMAADPzdXE800ESbNjE4KStnU+0LLZMKC7sHqm/Dm3FPO9rBJFCqrzSdvM5sPJjic
         ba/HXBj+1UcFfnxM9oqL3IXYuAnLfx1Kyiz60x9LWb3LFNOfNFM/CX1k/aSoBl+e94xL
         GLCx/A84cSjKsheLl76EBBys+ad3vZULXSISB0Dg2cwHlDWZGN2yW0MxpRLkafyLaYSH
         Yrvz+Iid29sRrfvi9Dm3aJ/LCcRHhZkVBH+Y7jQYkk6NqPViSi0/wlG9iYFrqSIBbLc+
         QY4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616067; x=1794220867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBjUGHG8kbdoyzZbGr/iLJi2HGc+aHIvJeTBRuTSpM8=;
        b=Zssr4/baC/U8GEyI0uMaV39JO6ghC9W3CGDIxHk6ri4VYYPU9Zwe1U+fP3J9k8Dz5C
         wzyok/UqC0M4Q4EljR1ujUxriQIoYv6/EsAfVeZiFT7mEEhJwvW13HgJBuYOe4AK9B30
         mAUmIY1RIAYi8PpLfh44CTahQS/BZ95Xuh98kRtsjgwQTCO0mmxQNFgkTxINqc33L6rj
         j9Ej/QqiFi6mgS48XgkhgKoqpWQyNbtqFsxN7KZKd7C5XNnZvATCrsdUIWBA7xae9KZ9
         48onnX5u6IKdNflXK7gMvEIKb4WvHrZG6CCN9mlYYyDpHuYqtut/wLBosqxNhjqeP31D
         2m1A==
X-Forwarded-Encrypted: i=1; AKwUvBybMpj2V1aATZ1Mf1Aifw16HOX4mt6RzP/RnpS/Af9iYFcVwVEXDKJB6yUL4RjiBFXylrkNUGGzNoQaoyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RVk9xjXog+BMuRur2Kbo/gz4+JyihLLKpWkGlCnt6AIZDtCrN
	yuL0Zd3p8rx8dQpD/0lLZzqxoZZJasSE/8dHsyo6a+fIV+3z4XdKae0k9kocPrpR
X-Gm-Gg: AYBFou2nt2nstfqhYUGbkeSSpJI6dmtROoyRG+RL5KpQbt9oGL4U/hq7zy8lIxAXdyC
	1JUk/ig58aDBU8w6lAuPMtXJtGmsHhfKs1lOO7ZDqmccLF6rKXrAERdsdeGi2Ht0xASKtPv5scv
	L14U4nLfU5GKjAL/s2tNHOBd33GTE4T/IqUieSDQQxQkH/QnxYm9Dtams0O+sAj3C9HtuFdVhAd
	APTqLrPjcsZn6ohTMkna+H/NvOghXUT+37akL4QTd1LYF5p9+k4A268/MWSQuFV+5MiHBDU4cYd
	vvDWjQkF01oodwGnToyoW29AKv6t0JHauWOZYdfchG3FOPBrmB7DD9bkFu0AA8rCnZ0RpXWlxRX
	8V83XGYhvR9vsYgB98As1GlCe5OweUnRU0JwoQR4YWUAVG14s5gv/FI8749GoTASD+m2YQ23u/Q
	8QXKhhH3ZCBzvoyTnm+DrMfWFSZ37886iRJx8SMIUEs99Lyt2hfDMxa3ai9OdEKraNu0YP8qe+F
	u7KkpOBSLe7XzrtyK82WnSyjn4/zt9oI3bba35IRbHUMWNXNav38Zv7hkSQnzwDHCuiOkpJhKit
	x1bXe3Sx6URZs0K4GFn+hFs9Qfc1tCIGQrsFNq3ZkH7CbSEUwza57kFo7xJCKoixb7CpkiYklA=
	=
X-Received: by 2002:a17:902:f607:b0:2e9:4b32:fc66 with SMTP id d9443c01a7336-2eb3649be71mr94161175ad.10.1793616066876;
        Mon, 02 Nov 2026 02:41:06 -0800 (PST)
Received: from umang-Inspiron-3501 ([2401:4900:1f3a:7c59:eeec:de7d:b077:9b9f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3925ff38sm25195465ad.36.2026.11.02.02.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:41:06 -0800 (PST)
From: Umang Pokhriyal <umangpokhriyall@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Umang Pokhriyal <umangpokhriyall@gmail.com>
Subject: [PATCH 0/2] userfaultfd: validate the whole range before changing write protection
Date: Mon,  2 Nov 2026 16:06:19 +0530
Message-ID: <20261102103621.156928-1-umangpokhriyall@gmail.com>
X-Mailer: git-send-email 2.53.0
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

A UFFDIO_WRITEPROTECT range that spans an unregistered VMA fails, but
the VMAs before it are already (un)protected, and on unprotect no waiter
is woken.  Patch 1 validates the whole range first, as
mrwprotect_range() does; it is open-coded rather than shared with it so
that it applies to stable kernels without RWP.  Patch 2 adds a uffd
selftest.

The problem was found while reviewing the userfaultfd range ioctls with
an LLM, which also helped write the patches.  Tested on mm-new in a VM:
the new selftest and a standalone reproducer (both directions, and a
misaligned hugetlb range) fail without patch 1 and pass with it, and the
rest of uffd-unit-tests gives the same results with and without it.

Umang Pokhriyal (2):
  userfaultfd: validate the whole range before changing write protection
  selftests/mm: test a uffd write-protect range with an unregistered
    page

 mm/userfaultfd.c                             | 20 +++++--
 tools/testing/selftests/mm/uffd-unit-tests.c | 56 ++++++++++++++++++++
 2 files changed, 71 insertions(+), 5 deletions(-)


base-commit: d42dfde37af766d1c272467352c0a56d3169ee58
-- 
2.53.0


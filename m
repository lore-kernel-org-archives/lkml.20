Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793311896;
	b=juuZft663aYnLON+5Kure9d44nCR2/oemR1dcga80mCBHEdtPhP+m/xrVNILyvYmItVh
	 W0pnKEsdkI2MBbBODqCsYzQD05fqvqn247qcfaS4Hzn4CKtqT7TJln4VI6UCpcmQFu25B
	 LC06oI772GU/q0DOFtyzqYnUKHeXORkDg+24XKBZ1WqRheJzqDOHwj0Oa21aAWBDAHmj/
	 8hiAFiR25DIEccGP+XQTdJiE0XGZgiOc/lnuGVSECTjYy0BEcMk7ooUWJxzN2TV3AM3xy
	 mOiov9wKq8NEBbwraghfWpRBH5sN0bzJmuHUWTqapHaGewtQb2gCpXZNWFzb+XEjQCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793311896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3qbCVY70IGSK3kVBC6Qw8VcA8OjZRClUiqwt47D/E8o=;
	b=jKpne7ksvCLeVXwRfk+3t5HiHX4T7+c1WXx31shr1371ugr8pjPyldcSuCNNozZc7kWI
	 1IArcHRCxkDXafQXneTpfE5vXdw74Bz01RISu6WHCtNivDMA7cfokcliUqoMYzNTFari8
	 iy+CjCEhMtDIV0suUlcVwpn/b5xCkidEP5iGwcVanZYgg9mbdSGiVyBt7Y1J5kM6dR1y7
	 efIEDbQtDbNvHTH7ekBsVvXthHHavvmDYDQvZh+1bKHB5hUq7p/SZ586X4F2u/2O3I3Yv
	 S8YVasAMQuARYei6QyCGA3wskneq9vFqg/L/GPbo7KgNcX5oh6C0uxn+iBnhQE2NR+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcL38tub;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DBC606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83DBC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wcL38tub
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so421055e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793311895; x=1793916695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qbCVY70IGSK3kVBC6Qw8VcA8OjZRClUiqwt47D/E8o=;
        b=wcL38tubVKe63pYd70WVrVG1+XwO13GrLIXESOPZeWUNLjwI5GZoWeDooTkzHRnsEj
         cLJfPjUnCIPv+8o877nGkkZmqqqpv9bEZBWvUu6b6uoDKNJNOC1YLWGG3+7kefCHIdw3
         NvbulvR8OFOdXnkUh1m6T/0fwFuD13mTIr8YnPP04Qa54WCNlGaWoIpl6CRBcjuYX9JY
         bZGHY/0y4EPZLAuP2CXFyJb/DvBpKP/h9ri3feN4GpHlrhopyA2t8Kjj4Cum2XfHUVG0
         02cCzQQ+BprU8HGJHDQpLtzA6dReJI+iqlHICbVV/fRmvG47p60OdUg5wVW+d/UWrV8w
         QE2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311895; x=1793916695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qbCVY70IGSK3kVBC6Qw8VcA8OjZRClUiqwt47D/E8o=;
        b=DEeGKxuERQ9J7ktTdrIjwXjM45yecBIla0t/o4K1eM/JDcUsPzsBkxzUafD1BMduep
         5n4Za9I4trL8OooMOpTOk+0YgH5oZezPomGPcwAhw2uaBs4H4ALip4GTEFfMpji6Rr6U
         Ic2Sy/QmET2Booo/1KlpmqYEwqFUmPNhHk8EtRs40NuBmmwozny4Z4apmYmMdPDOWMjw
         8Gy44IV0stWYsudWRAe93jL1IAy7BkKBZZOG0rVskViMk2YOzA8Ieo6KAQC8RVkNfbgS
         yLtDpt9cVWyL7HPMH7WBsBenIGjWqtvYMg11Oz4yyDMoS2o5Z2MhL+VbNDGLTe084H3o
         R19g==
X-Forwarded-Encrypted: i=1; AKwUvBxQV3KaAe6RnT6aXR25p+7iTD6pms7QAvgdjQzfVtF+Y56Y77IeJZdzJ8SSWZwq99z6SawFcRSTWtjTu54=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCAmsvm21O4kbTS5akBnc1+3UqRrcGbzcKhl9jlVlufk6gPEJQ
	URuqrfRV4n9yYiJ4DSlhb97IWMRwdktKPhustpsnL/VSXpeXoyG2iIUX
X-Gm-Gg: AYBFou0jG0/GkywPMEykx4aYT2kwyPplcHG2FbhgTcIJjtGXuJHgXck3M95dwhHUYDM
	rPWZmxfFp5sx402Ss3rX0yGWhl4B3VbW4KCNbUrGdfQ5VVilK18NKIcC/ewP/4c7IXoZ+t6ViXi
	76GIxAtGz887/8LB4B+R25ZdvmhvVf6BXVbZHURICgsB2btA0KSQRhwQa8WwIG5WFANsFRD1nnD
	fYp92o5O7UeFS78roay/2UInyp1ZRZLIzC+6tXnjGE6CfYvctpK/O7vvT2rTbiHoPlYyMMdZ23V
	N4Bg2fAwcy4yFsTapi7WREBXZxNC/VQ1ckXezgsnp0z1p6QYIuB4wNm/SZzMdILAFf9KCQiOzrM
	vS2Vf3Ue879zM5Omb4JrLgO/+ITovgpmAuvXtZvbf0wD1y1LM0r2CsObm+jfBbeD+HypUqCOPu6
	LJWnm73ITPT9Z31x/q6QmdXL6n3VTh8U+yTaYX0j5reuFHAiOw7QzQ/3TdtmUPz0F7eCtzs22IN
	R38/VVWyZpsDHDtJPBUnKE28Z7eJBJfrlrM9OCSgMtGTInaV5CHPXfBRWivECFV9uZKZ8iz1HKe
	utvoIsKf4rU/tw==
X-Received: by 2002:a05:600c:4f55:b0:4a3:d327:6ed with SMTP id 5b1f17b1804b1-4ac182dcba3mr6955425e9.17.1793311894768;
        Thu, 29 Oct 2026 15:11:34 -0700 (PDT)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm104011305e9.10.2026.10.29.15.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:11:34 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Peter Xu <peterx@redhat.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH 0/2] mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY retry
Date: Thu, 29 Oct 2026 23:11:00 +0100
Message-ID: <20261029221129.89068-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.55.0
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

The urgent fixes made hugetlb_fault() tolerate uffd bits left in VMAs
that are no longer registered for them, and asked for follow-ups that
remove the sources [1]. This is one: a hugetlb UFFDIO_COPY_MODE_WP copy
that has to fault in its source page doesn't recheck the WP registration
before retrying, so re-registering the range without WP in that window
leaves a uffd-wp PTE behind.

Patch 1 adds the check the non-hugetlb retry already gets from
mfill_get_vma(). Patch 2 adds a uffd-unit-tests case for it, which fails
on hugetlb without patch 1.

Question:

- The non-hugetlb retry compares the whole mfill_retry_state. hugetlb
  copies into a freshly allocated folio, so only WP seemed to matter
  there. Mike, would you rather have the full comparison on both paths?

The other source 6/10 of [1] mentions, UFFDIO_COPY in MODE_WP racing
with UFFDIO_UNREGISTER [2], is closed by "mm/userfaultfd: write-lock the
VMA before waking waiters when unregistering" [3].

Based on mm-unstable.

Tested on x86_64 in QEMU.

[1] https://lore.kernel.org/20261015-urgent_fixes-v1-0-42796911043b@kernel.org
[2] https://lore.kernel.org/20261015-urgent_fixes-v1-6-42796911043b@kernel.org
[3] https://lore.kernel.org/20261027-fixes_core-v1-23-6f74bec9a5bb@kernel.org (v1, now 23/47 in v2)

Jose A. Perez de Azpillaga (2):
  mm/userfaultfd: recheck WP registration in the hugetlb UFFDIO_COPY
    retry
  selftests/mm: add a uffd test for re-registering during UFFDIO_COPY

 mm/userfaultfd.c                             |   4 +
 tools/testing/selftests/mm/uffd-unit-tests.c | 105 +++++++++++++++++++
 2 files changed, 109 insertions(+)


base-commit: 24d45a1475dd4c671feb1df705f67ef2fc293969
-- 
2.55.0


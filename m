Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836890;
	b=Kwb+eMW/+NNH8xSaC17KAvaH6c+owgue78kWaUW949BWpqjAeFgUXYLLXVxw5Lg5aFZi
	 sicviedOCM3+NjDDlEj0AeTmgYOAtERKvi/LpYHDSW/hdPY7K+q2i1Xqh2esA2uraeTOY
	 +LxIhwlf/fNtqv5lGMuYcossbcR3mfZzy520SaNFzS9eUWHH+OUrkWBmOzVcBaxHA3zr+
	 njATGd8Ll5V0WiMcUcqFhaF63QHzS4IakP2cEhYlHEKUBqyNmdH1PKf3VO6qTW5l46lbt
	 o131y87SNLfmuIv89iIFiS5thJwUeWTz9qwsb6eV4nCYPKPrm7IfPBj0Qh0C4afGyQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MRQuzERxrDtzGHqEG5EwaVsi1rkjebx72/ASyR8+7b4=;
	b=Aj1dCyGP5BmHq3nGDDOzkdiqQrElZuAp+XKJV9RkZ/D6FLOXAl/7l/9+CFUCKyOLGRQs
	 rPkwFILAgy7Y7ENC99rSeyAoRhozXSBcNp47HfC1D5fFCqB0FPwbKEWaPXPpWSz/b93tG
	 Mo5HWqKfg7QqA+mnKMDy7v7PbwPR44KYDxUgFfQObwh6IPisT43uZdB/czQpqA3oa/KX8
	 LznKh7usf6X/mjRrSSZM2HaHZf6SPkDzOvvetAEXcfGeptaf7meg6TQm+nSiEAwWpUs8Y
	 MWhN1ct54tkuT75UQng0BN2p5UEgqdpWlcrzWkEy5N2GepClQL5myU+2wshGQBeINqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Snpy01U6;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 733EC606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:01:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 733EC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Snpy01U6
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so785581f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793836889; x=1794441689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MRQuzERxrDtzGHqEG5EwaVsi1rkjebx72/ASyR8+7b4=;
        b=Snpy01U6DJld+36enccUIjChmWOPUK5tomxjDFxvm7eAnGQ8AM69HW0+wQlzXucNM9
         rbBPj7yFTRy1R2/Ga20iDTUfthEueY+PI879BSOGzTSL3Li3rWNTH5s+fnpMQzjIabBN
         LF9lWz5kHorZLw8wD6DN4SsQffGRmCF4xmTrf5c/Ql8x07Bi8IO/NWBKvuLNkJs03YK2
         d23IN+V3is66WaMsrwBGqLh8IyTfozjEnI82OvQnHQkf4fOY8R4L0eVas+Oh6fOwQVN9
         WwYVH9h92gu2hky6Ubw44tghyVVBJTs+650mzSHbW7UmssNTxvWgiajoeEHCBOHHvA6x
         BHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793836889; x=1794441689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MRQuzERxrDtzGHqEG5EwaVsi1rkjebx72/ASyR8+7b4=;
        b=A/h40hg4tSohgF8WGFhpat8GG4QoXeNbpFHvoeC2d2wy5wwUR9+MqTmtSDdZVW2jfS
         RV8qznnBfbXxuAXExKXE3KWDB0YlmjAbw1U9mfEsq2F0cqCdGXTXXZ8O3Sl+YNeCvQzN
         L4GUtH5Ruk1tVIYeaOhPKO2YW3/DitViFl7ykigk1ze4Lpg430JaEKI2gSrObOm1PhZm
         xB9cAnp2l9h6iPvr0Iu/vWpfy2F+vOfSR+jiku7DJcfBGSQVeQwzmLKAET8MWxbCMeLA
         t6HN4BVHMhi01KUvW2EbCUDJtnvdh5uuAevgThPKrrG6XkSvDgjeSOaE0yMY98m9huTK
         rTzg==
X-Forwarded-Encrypted: i=1; AKwUvBz5YhJOzIXI4OaQteH1DVGaTZXw15t4470hLYt077CXEMMVdnpJ5h96jG51J2E/R1vd1BnkxtyvYbbtVUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Guk6onJ50ryLZKeqmBwTb26GAptqpz8ua19IA0+M7HudCk6zY
	1zqvx4f/l6aDE4UieTw8MJXjF2lpiBzYIPyMfBma13QA11NEPyK6v5ID
X-Gm-Gg: AYBFou2xTVB1KAXV0SJyM0c7IQDRKoiEal0vMXyEOgVL9D6EqNrmIvuFgHQimncDS6m
	Mqy6uNaFRMW1I6mtR6/Dch5+k9MR2Re1yWh3cqek4+9Xv35wCXCXj8HtHQ8QDEKQGFyqnlBfk2U
	JaMkm/zkb9V1ZU0IdtmTOkW+2Ow1+hBS36jThBOyIdE9ORXAqk472vZFwS7U11iBx3GX1WPR7QR
	xtbTOw4V/Pot1abGAsAcUr2CpyoIDnV3BYU1z1qNmpErQGvwDPd23H1vlR5orQlSUKCzt5Bq97O
	iu38JDt0ECo8k3P+sOFmPEkqpDdP8HUGPnbfNK9Cw7IZpEBRvrzMDxBM5FThlhmGRVI/r2YN6l0
	dOVtVejGWXJw7FetJcCroBGq26jsW/e4GW6/TRB/+ogrVoOCsQrUhKrTEdw0VoyOH/eCT/Uh1U0
	ZyfF2vdRSYNafvEa1RpAz+zSEMtA+047RzRy4ojYQkuEz6zvdHCHc6CTd7igpScQzIcnLGjPbTw
	p1sAnc0+sva5aegsjZh8EbDZgjDd/M37Pk4MiVF5mMHlUFAx3etDmvpeoNzRZ0P80/J41zRDHdE
	6hq+5rxJrqNHKWvXT3VMIkSsrz/DlNnuHXcie87RVYAHl5zH1Xny3uol1DNOqdpPMsaUJASBdiq
	ySzNBay75GxCHx53WAOK5sWhpLg3AVSvV9NGvPMHQ0rC0ydPXx2YMMZogs93V1i+Pww==
X-Received: by 2002:a05:6000:402b:b0:48e:5ea1:260a with SMTP id ffacd0b85a97d-48e6e2c3532mr38395788f8f.3.1793836888628;
        Wed, 04 Nov 2026 16:01:28 -0800 (PST)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed553116sm6323846f8f.42.2026.11.04.16.01.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:01:28 -0800 (PST)
From: Fred Griffoul <griffoul@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Mushahid Hussain <hmushi@amazon.co.uk>,
	nh-open-source@amazon.com,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] KVM: Allocate small memslot metadata with kvzalloc()
Date: Thu,  5 Nov 2026 00:01:25 +0000
Message-ID: <20261105000127.63664-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
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

From: Fred Griffoul <fgriffo@amazon.co.uk>

__vcalloc() makes every memslot metadata allocation at least one page,
so small memslots waste most of their lpage_info and dirty bitmap, and
memslots below 512 GiB waste most of a page on their 1 GiB lpage_info.
Mushahid's patch [1] switched those arrays to kvcalloc(), and Sean
suggested dedicated helpers for memslot metadata with a pivot that makes
sense for KVM instead [2].

Patch 1 adds the helpers and routes the dirty bitmap, rmaps, lpage_info
and write-tracking arrays through them, with no functional change.
Patch 2 makes the helpers use kvzalloc() up to KMALLOC_MAX_CACHE_SIZE,
where kmalloc() never uses more memory than vmalloc(), and keeps
__vcalloc() above.

I ran the memslot and dirty logging selftests with the TDP MMU and with
kvm.tdp_mmu=0, plus a check that one-page memslots no longer take a
vmalloc area each and that a 1 TiB memslot still gets its rmaps from
vmalloc.

Fred

Changes in v2:
  - Split the helpers and the allocator change into two patches
  - Pivot on KMALLOC_MAX_CACHE_SIZE instead of INT_MAX

v1: https://lore.kernel.org/kvm/20261103234734.45413-1-griffoul@gmail.com/

[1] https://lore.kernel.org/all/20260815142218.85067-1-hmushi@amazon.co.uk/
[2] https://lore.kernel.org/all/arr1VgGZmgUmY4hc@google.com/

Fred Griffoul (2):
  KVM: Add helpers to allocate memslot metadata
  KVM: Use kvzalloc() for memslot metadata that fits in a slab bucket

 arch/x86/kvm/mmu/page_track.c |  6 +++---
 arch/x86/kvm/x86.c            | 10 +++++-----
 include/linux/kvm_host.h      |  2 ++
 virt/kvm/kvm_main.c           | 22 ++++++++++++++++++++--
 4 files changed, 30 insertions(+), 10 deletions(-)


base-commit: d21eef2084a9af87ac2a783bc7c2b175ba114e4e
-- 
2.47.3


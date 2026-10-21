Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792562732;
	b=QT9qTDfy9QvU4GxfnVZKQLZE35X7pk0oORV92spPN8hrPcJksLj7aGcOF+l+P+sEfg9Y
	 cXcoT/srKqKD8bP8lx64C0StGKsdZTjYVYyy542PNzVbBlwclD3iXy2+IQ4BuZHVUOhWC
	 EzgZGNWmnwZyUYV0DPXiV3qG03RtL0Sr6itsugYd0/bFaSgN7xynuWQzCi39zMEeQLN4T
	 TTqLPzYISjReo7o1XeVgMKwQJo58RZDu7vMe3s9sEaNTklfEsYMg0BNRt3aLHV+20JXoq
	 XoUjvHafBblcN5Qz5xheabIhPDpZGUnRL7SPOZRSTCBDCmd3nk0bgXgx6aogOwvuO+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792562732;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
	b=gBjl+UNXfOS06/LVKYDmEiQC0FmSEbtFPS23HjKgHA5Z/rIsDVxfHpR/H65xQ19Dpo+y
	 VivXgMNftzQB3HmQ7a7mtu3s2CyREqF3fnBQ8obU2IzUPWh04byQ5KQy0tDY3ZxSfHzpl
	 UwIJS3XFCm7+Afdmd2Wkc/FVB0J4/BltbOFr+Lh87Ny1rfrxx8RQ4R1InzvWrRWDGwdF5
	 bH2QhOlfo0ABvDQ50rYpVHkL3KpKwaJkWHwjozDtb7Fi6XLI+Gee4DlDKsOYf3BhLBA9m
	 g+mBZmUzSVOrba/Qp3g/UmrvddZJZlwtoH3PsMdKYuv0OeNFKpQkKL1NtUamEf54R3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TvE9nBZj;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZqcvrSsL;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D4360A261F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D4360A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TvE9nBZj;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZqcvrSsL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792562730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
	b=TvE9nBZjFADycNCFlVfOLJXjuNejnYdwNUD4Hu7dGHijzQiPWAj6BfAQeAVs7SCDLepXQk
	1m+jzqGvcHz+j2OK+RxhTFre+9sobmLQNRb7MmJrFPs637f1vtEw7X4yKrvL5tJGYynQs/
	3nq91wyy1mdEGinENIT+DvzzeweOUkw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-LJvR2AJVM4WQneU3ta_S4A-1; Wed, 21 Oct 2026 06:05:22 +0000
X-MC-Unique: LJvR2AJVM4WQneU3ta_S4A-1
X-Mimecast-MFC-AGG-ID: LJvR2AJVM4WQneU3ta_S4A_1792562722
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4870142f030so160961f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792562722; x=1793167522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
        b=ZqcvrSsL6GE8evQCgyfy3Kr44o/PH8MRCz19I9mxncEPTlgjVFa5hsD8f+asIJ/fhJ
         ju+q5Qk5+gKTH4T9a1nkGzu651lfUu5BB4fZnIsG6xsN624wG+U8evq/ph4U5viAxRUR
         8Siw6fWTd29iBeSsmWEd82CvFnl5Qn8rbNWx/B8m7na+4tsgJTtF4E2H8orRYTbUG+Jk
         2j2cdKVFH/vaoVlGJ6qG8L4UKF/Y68dbcxFL5fLD5jWm1zmO7SfRDAUkLpKpgBaeAw64
         0xirdF7S0p84EX/Lc4bnrMkEy4Ml1gKzB+GyN3fEMDr+zJv5t+/P087cJ+4MOuPsNLuY
         ycDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792562722; x=1793167522;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
        b=HPCd7+5qpVnGcEEhjVmYWRPl/4U7kXIWvgmXB2sOQo8qCLu9cIGCUm1SO/34/S+IQq
         ANohfL4UJq8EksaoH8EcI6vVKbXctQShCv7eM9XpcDtK93v1CDbY7W3AbondtL43GEFK
         sDhWNN6SacJn6O4onCOvWIl0tElbYubigoCBP+PJFM6mbt5b6ANzAnfuopQ/C/6Zus5l
         oNWA6qTYr8mz7kgZptCFJmq8C+iGsCyKouVCKpV6/jh8jmUzXrqKuApTGQk6zKJoSlSe
         bVoyMP98zqA6B6fet9Y0qPnz9zxH4XimHdE7C3oHhYaC+c9qGxcOnfu3piGQCeIBb87a
         P7AQ==
X-Forwarded-Encrypted: i=1; AKwUvBwH8ia0BoRjrb1xjHzOVSMGOtl/ju7FzTQWs72eRgvRggySO7o2fQRGRhUDPX+UISwKNPbG7rxi78zKzTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUwqEQddA9VosyZbg+MfKA1eYokRAfGFsBquuLhuQI0dZDtY7m
	GLFFrllre27cTtqCykrEyVYhvfxH4P6bnq8jEfOeVolvLmDQjXhJCmFaUQWZUrMrPZBf0tS8mQ+
	YkX2DLHh83p0blJM3zh3EUbO2BpxWwxhyK8UZFWnVUfIiEpenfXxhzpHFPf0WQfuO
X-Gm-Gg: AYBFou1E98hhYOQ+nXdDBDLceTWMSSwaGVE/YcZDcv2XN0sFp4dPhjTR0Pj5DOAo+iU
	9syo10NGOPD9Ps29CpW7Z9xZtuUy7EJj/5JvAH3YAql8J9/28F4MFEe23BAr+fmub30pIegnmKp
	0Mx2VBIrxQGu15ypP02aAC/ozse0qdaoi5BYS4BMZ0ayLsd994kFUB8I1SkdGzBNIZkPPjYHtDw
	VBGUFiN+ehyPyMS5EogSWZlIRxVyQWeZbxtHgDg5vt+38MZJY/IulLa/zCq2F/H/yIy9MAln8wi
	oOuXytGN4d7cxF8+DIvfIK9GF7UA+CXkN5wxJm86yi8yks1egprMi0b0+ChStqJJstD7QjPKxbu
	F9zPRRV8YK4aixpZmPGXCNUwjG3zKeWGoiV7C
X-Received: by 2002:a05:6000:2a02:b0:48d:bfd5:79c with SMTP id ffacd0b85a97d-48e264d9d19mr1041945f8f.42.1792562721615;
        Tue, 20 Oct 2026 23:05:21 -0700 (PDT)
X-Received: by 2002:a05:6000:2a02:b0:48d:bfd5:79c with SMTP id ffacd0b85a97d-48e264d9d19mr1041925f8f.42.1792562721270;
        Tue, 20 Oct 2026 23:05:21 -0700 (PDT)
Received: from fedora.redhat.corp (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254f02f1sm3413741f8f.3.2026.10.20.23.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:05:20 -0700 (PDT)
From: mpenttil@redhat.com
To: linux-mm@kvack.org
Cc: dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
	David Hildenbrand <david@kernel.org>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Leon Romanovsky <leonro@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Balbir Singh <balbirs@nvidia.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v16 01/12] mm/Kconfig: changes for migrate on fault for device pages
Date: Wed, 21 Oct 2026 09:04:55 +0300
Message-ID: <20261021060506.2377545-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021060506.2377545-1-mpenttil@redhat.com>
References: <20261021060506.2377545-1-mpenttil@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mika Penttilä <mpenttil@redhat.com>

HMM depends on MMU notifiers. With the unified HMM/migrate_device
page table walk migrate_device needs HMM enabled.
Enable them explicitly to avoid breaking random configs.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Signed-off-by: Mika Penttilä <mpenttil@redhat.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
Acked-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index 604c58199acb..b7a485beb9a7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -687,6 +687,7 @@ config MIGRATION
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
+	select HMM_MIRROR
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
-- 
2.55.0


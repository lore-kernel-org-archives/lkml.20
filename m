Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC1D48A8D9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790055289; cv=none; b=U2h18I3F1jGBlHHoBCAzNf3R6axxhxXHlT5+G8uItZbFEfETJK1+FYcq5FkTHqajSrd9qdu3fCsH8cPsmMSPHaOL7nZFYuhNGYSvYjQ/xUfwjclyyGJSKxP6oXsu4+6y1WCgWLLbmX3VZfMFiSe96wAM3FQyeuFD8Sor8TRwCLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790055289; c=relaxed/simple;
	bh=xGg8IJyyA8p0Uz2J69fZOcNcHmNV7VrbGKBqc0XBB8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LZ3HFCkqKixhr/uPhyKDOCfRPAiC8gawkDLFniMCKuoCla+NQ7a1CFSB2GBBtZ2kJocxANOrpnGfAseS+mal+GYXA58Ru8ksLjJd40gynddeVeBwUOOOXBl8YFEcV875bvM0mBXYFes5dfnbICit93w2YS/tXYdCPFGNkJZxAHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AqOLuhL6; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=oUGJLp5j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AqOLuhL6";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="oUGJLp5j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RZqncuA8V9KN45lL/iPHOVqmTI1CzmtLR7XQjhWRrog=;
	b=AqOLuhL6ICB7NAHKvpndRYIH00FR9Tm2ndaUlHHpC6eftbteHGuYQFPNaTiEolX/XEnimW
	kCQnjtfAyV+yOF1cS81b6jGMoL3E59jITAoHPNp7dabHosjnuJrdgSxehJHx97PzNoagJv
	Az1cZTkzN+ahS7/Soj8FhIP0Sd6zJxs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-pspDJMPmNcCEFNBlmoxgcg-1; Tue, 22 Sep 2026 01:34:45 -0400
X-MC-Unique: pspDJMPmNcCEFNBlmoxgcg-1
X-Mimecast-MFC-AGG-ID: pspDJMPmNcCEFNBlmoxgcg_1790055284
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5b4b020612aso3337416e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790055283; x=1790660083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RZqncuA8V9KN45lL/iPHOVqmTI1CzmtLR7XQjhWRrog=;
        b=oUGJLp5jpIJ8I7kjDTv7DXWvEvFcVDnkArrrM2OZjdzXcsrtcc/CtoDm2jo9wUca66
         mqCkphVYQCUIGDMXf6FnK6mtjGPJaqCsklnRTxP9UHtCwpYy8GsW4yXwb5udSUTGFK2s
         WX6VsfPCAGu0VvhtBs1DKBebc5yS8dXhyUWXLofRvb1CAObPI6n9YvXpSYYwVHOuPAzh
         TetJevxbMi//7+N3p4rXtHrXfuwMQDNTqAZ8Xz6DSOGTB3bQ8z0HQXvH45r5q8I+XCgn
         DVluYxkq42h5aIoHyQfCeGRx8MVd9yNTpR+AJ9wRY2wsCeh+FUzF8npCCpK4rbZ0/8sr
         Vg9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055283; x=1790660083;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RZqncuA8V9KN45lL/iPHOVqmTI1CzmtLR7XQjhWRrog=;
        b=grSuJR/i6DWH9r/LI/JpcSNsEBC/w9DxrQ4/x6FFRBM4/I9PCd/Zwvza0GpU95UEYU
         HoinpDmKfFtKYSNZCREbyZwc6d+Z3HcLgw6BdvujQjOTEMu4bLCCETrCpV8gU4mFyfN1
         s1+q4XvPLp4DQ/IUpfato6jpxCGEWbiUOIRFiR4s8zYaYmTTp9PFaqUxi6RaPAjJ4jXG
         eihU/9hyRSlG692rzTaAeJ2kLtW6BeBF8PoUaM1LUEmx9+EN/XfY73AupSU6qIHfv4Cy
         BzTyceg64Acy8XBKUY3sJlq+Ahjdv062DRoaH5VATg+4dlgySds506z0gXAP9cn7Afmr
         BjIQ==
X-Forwarded-Encrypted: i=1; AKwUvBznncCxakY12eNbu8dMqzx8dDgPtTgvAMNsoS7ycZ3+PHtydOEpYupn1xvU9sh4dKCY+SKvivG4NWmUFGM=@vger.kernel.org
X-Gm-Message-State: AFuF++lxI1Nxot1NkNFKerJ28XoLbdXiKk1MQGqxvetxJ4gcPdLG3Frs
	d0mPH5dZJORGu4pg2FsurPpbxw0axWN5vBxRLVaGCXH4OgtosiysP5Gm93Zj36RqjoQrpLQBeOA
	NH+GuFlRPETmwl2odaFLezE6N+ypjz4V90fcOMXOjUZ1vQP2l7yTxaKTJNHw2xlWx
X-Gm-Gg: AYBFou2bd0NBLNT0A2kA+OCfek/AdkVPo6zYaL1TnRkBGthUwJHq5csOSCgAdpwX2AM
	TtWqtowQjwQ++0Lbme7C+3gVgH6nsik9sqQpxGOLrF9aml7HULvvwjcHaO8sCcYGvSm/uEzqx64
	EgX6VNYTYCw38gh1V5q+Zr2BQeuViN6Stjp40I6mySvnZNsXaVOU1LqFmCd3sB498xbEA21E0+W
	5p6YK7xYPBlfiKJCBXcV/8B8txGCGTAVOah3Ms7hwlDkudhojsodiqBOftKKY40yqjmD0wEkSyM
	PDglYjAANkA0XCKgV8YjEutt21capkf+HGBF8nUdt3+8m96L1Goe8QxEebINam+BzDMjCWhuhSP
	b4VxL7JUpVo/JzhF31KJ0
X-Received: by 2002:a05:6512:3402:b0:5b8:b3e0:74af with SMTP id 2adb3069b0e04-5b8c195ea85mr3626235e87.59.1790055283561;
        Mon, 21 Sep 2026 22:34:43 -0700 (PDT)
X-Received: by 2002:a05:6512:3402:b0:5b8:b3e0:74af with SMTP id 2adb3069b0e04-5b8c195ea85mr3626231e87.59.1790055283051;
        Mon, 21 Sep 2026 22:34:43 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e0966sm191742e87.55.2026.09.21.22.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 22:34:42 -0700 (PDT)
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
	Michal Hocko <mhocko@suse.com>
Subject: [PATCH v14 01/12] mm/Kconfig: changes for migrate on fault for device pages
Date: Tue, 22 Sep 2026 08:34:10 +0300
Message-ID: <20260922053421.4092027-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922053421.4092027-1-mpenttil@redhat.com>
References: <20260922053421.4092027-1-mpenttil@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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


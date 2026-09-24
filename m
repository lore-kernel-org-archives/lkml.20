Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C541D638
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232830; cv=none; b=ldruZoZNeRBGq0N9xV9g3n12ufT7/NQpy9sz/NRodRC9nCNKCCcToAI5z/On8jae45vDn5Af2IikMdM7j9aKQ8yhYwxtx5c+ysPxfCDhiZywCIb1A6oOcVyushDSEG6jaEqseDDWh1AdLxEJfvYeUI6Igpy3S2FryNgZS9nZKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232830; c=relaxed/simple;
	bh=YMM3m1N8fC5PJuvtWQuu+nad9ANW0tPUhYNaGEkuucE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EGyWsZbdq3CfK4BzfOAV9X7LzS8WOQW9j7X2Ub8NyHhcuiqKxwS98tHdRX+uPxvdJEaGh7kIlxFJ4zeUz9QZaOMrxMaQgtci2i5SbrwyELTmddcgLpDcBefHzMDsIM7gKYmvkB4SJVndtcK+VRussh73wclOYOs3wNrlaDCf/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cg0AAlg+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFGHzGip; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cg0AAlg+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFGHzGip"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790232815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
	b=cg0AAlg+T4e8SoiFKy7kbgHE4WwhHAIOPh7rQw79WqiqJnp+HXkWJ1xhCtBw02dOPuFOfI
	gt1H/3J6aybmE+59zcaSuGMQ6dE/Ylt3oyc32/svFZWWGrcbUvzAS52ZmPUx7K2wFdt1T5
	f5D+21IHnYeqnUJG4AiC+6S3uNl0aLo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-gt2HRUQANeOrdMQvxUFuYQ-1; Thu, 24 Sep 2026 02:53:33 -0400
X-MC-Unique: gt2HRUQANeOrdMQvxUFuYQ-1
X-Mimecast-MFC-AGG-ID: gt2HRUQANeOrdMQvxUFuYQ_1790232812
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-3a35015f2afso3927231fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790232812; x=1790837612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
        b=HFGHzGipc/o76on2+jTKs3/X7j/6s4R92AE70wlApxRh4Xwtj4oz9Gl1oYSt+uPIjT
         cgKal1KYQdaMDcNvC0ASrtvQFC47RiKJWJ+m/XefxP5oXqjlDkhzqzpn7VJQGgah0djX
         5Dj91fHabL8yvBJ8hZd8aIlr6A61BTjtpY7Vyko5Ex+TlO9wyMcEUfpbwXHRYZF6XbbA
         L8V/WS9r4ZQEGSHcSi5y4jGC9UjcIL81xaQhvaIFVPaZtI2Mzibg3mOLnOpTYrRq6w3A
         Ab21oNojv6nK6FtiYldhFZALUbi8wHRW2jG1RwDhIlaxj+w6GwL7NQzQJw+RDVMn1f9G
         y8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232812; x=1790837612;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/j5EYytItjUwk1/CqHyOHSfaQ3+6rA1AecV+p7hbPA=;
        b=oACzQi3FmSJhk3Be6OaK5InmA7+oTqs0CK0JegzKp/etL5sB3DVN+b9b1sytyHLmaK
         QBVuA5JOEowRyloM+ZS5XLCp4DhUaut3w7Yw5IdQAMEYXLkUX/mDHJPbRtUJyOqkF7dZ
         N675EVQs9gsnE62zjRqNgG6iTrBZAoPdlB8KOf4BLxa12XB18+xzS3czgGiggTWcaaGz
         qCNTTT07tuJMXLgJKHJFOzjyUMVBt8+S5fTSep0j2aCaThWqiq6sd18gX7ChljYFbffz
         ryTvTeJeujxXkiDSIdHz+Mb17vJ15nycQFjsxc3idKkKwkPERXIoTl7c0INQruNWkkJs
         yNQA==
X-Forwarded-Encrypted: i=1; AKwUvByoKW9Qmb+vnWCUZE+9qoKwcj7kVDnk16k3oYnVpSl7HzDQpFhFVd8QGI4fCbSvN+5hqJ1PlVpg3oCKhqU=@vger.kernel.org
X-Gm-Message-State: AFuF++nqBOKzBXKGGr5d5DoGrPTmRgKP+1fAusRlEcldGQh6UF1PuVW8
	NWAxP7vmkrfFt2mnKMNniknmcKBcgdDqK/KDUk+pX5qY/a9uhwMPTJhgsXgTL0TLUoe2Kh8dfht
	iro6HXvsA+qyy2OJPH5vWmDLn2naPtjmsGrzHv7ICqYK/06miPsXN4zepzHqcL2Ce
X-Gm-Gg: AYBFou32b5zqQWXRdbHM8eb+JFfWLsWcyaSXef+qt0DKVtSR0fOkZdsZw1qiL+y8aPb
	Ngwysrva8SmVQmhGtwUXqeQJfDYgehKogtdqu4BDd/t2gegxul42J1jXcuxOPewWEHDHYSaQJ1U
	SECwIPrKoGJKXetopQzdhy4zNEJurF51FLssTWtQO3ZSYRSY1iMMRiztYFP6dCrVWL56tkvvDjb
	B1e0g4hmnL41gVZxsQSLkNhzIgXbPl2nHrgv0SLmkeKGZnc6jH/I7I6qUEFpRGa/k1XwBAikVWl
	U+YyyRG7ASImGrANSkDAs4SGt/+vQ8oGYoiizmUOs76AA2WbnZNmNywKz1P6ZvamlYrchnxUvsS
	EJqRsjgOLMjhQ/YVKSzam
X-Received: by 2002:a2e:a593:0:b0:3a6:d50:e26e with SMTP id 38308e7fff4ca-3a63bf1c44fmr3484761fa.2.1790232812391;
        Wed, 23 Sep 2026 23:53:32 -0700 (PDT)
X-Received: by 2002:a2e:a593:0:b0:3a6:d50:e26e with SMTP id 38308e7fff4ca-3a63bf1c44fmr3484571fa.2.1790232811952;
        Wed, 23 Sep 2026 23:53:31 -0700 (PDT)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf57909sm4803141fa.29.2026.09.23.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:53:31 -0700 (PDT)
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
Subject: [PATCH v15 01/11] mm/Kconfig: changes for migrate on fault for device pages
Date: Thu, 24 Sep 2026 09:53:03 +0300
Message-ID: <20260924065313.899730-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924065313.899730-1-mpenttil@redhat.com>
References: <20260924065313.899730-1-mpenttil@redhat.com>
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


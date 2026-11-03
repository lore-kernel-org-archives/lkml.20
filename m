Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793686612;
	b=D3tCsr97YMNS37TxnGvaUX43PqHAlqbmqMku1Luusxph6BweJB07I0ZrdUGf1nMy2uKo
	 wRSXEUDJ7Pe4LWZOBfLOGSAjPH9gNm3Q6Rm+pvoNFoZYQMF8fcS+ba9SqqTk1lJPWis6z
	 cRuUcPUI7oHseeJfzbvX5wack31tilY8aCeCmx11YCuKnsGlAU54KUjkQYISBG4xcgF1L
	 lsKi6CJ3n/uJOo2yYOTOV3gHwqqYMeW1YYUSm+TsIp+bs4qBgOsS72v4Lxi0i/KkDh/6O
	 xTBhzF09i8bASMRjVmu1P4aB5PM/uXU3OSa/HW3ZjbUX7U6DxVkKk/nf6MuTofd7ATw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793686612;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oxeQ7ppGYBKjK5meXlEqKGqekI9iSYV6fmFE9Pb4Uvo=;
	b=faTUVtxTtnKTL66cYWyy9uTjf8WL5815EmWzk+oIkMj1xcryJ4YpJ0/ggeEfu3HbDVJb
	 2j7kwt8Ze4PrCbUOIIr/nRZk5wZyBtDQbBlNLjOSW/6kx+t0jC+Pe7t8WJ/Lx2m/2FFbu
	 AdVQFTrfmcQ0kg1IMDPtl/XA438RFiQFE0lsLL35nnsNQTrWaVv+Nz84vlR+2nZapyT+t
	 rPibDWjklF9+7OhFg56uSzG6TERXvHWcfgz6/ijmKHePYN6r+l+eKsziI/9Q99Tcq6Q2o
	 PURKrpWnr2XcS4JSPnS48cDMm7B8LjaGp9ZvbAuYj1DPAwBbhNuxpLqaRLBtrS9hIBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MqroTrqI;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B2NfMnMH;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB182606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 06:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB182606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MqroTrqI;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B2NfMnMH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793686610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oxeQ7ppGYBKjK5meXlEqKGqekI9iSYV6fmFE9Pb4Uvo=;
	b=MqroTrqIgjt84lnqIMOy2MlT2wzyvIElh+QdbKrpwvbKvmBFgaJNkwMTF4FpPhXA+mBu2b
	/JuPDLE4AGNL227KXTMkehzRWNTEuz4UncL1yAh8j28yYtKTUR/19UxFGzqiwl9yqzksBZ
	m95yUcXLICDcZrkKFkRCblOmxduRPxM=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-m_b3_77-PoayH4NfOPo3zQ-1; Tue, 03 Nov 2026 01:16:49 -0500
X-MC-Unique: m_b3_77-PoayH4NfOPo3zQ-1
X-Mimecast-MFC-AGG-ID: m_b3_77-PoayH4NfOPo3zQ_1793686608
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5baf6f208f6so2004030e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 22:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793686608; x=1794291408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oxeQ7ppGYBKjK5meXlEqKGqekI9iSYV6fmFE9Pb4Uvo=;
        b=B2NfMnMHD540WabvhBCX5r68ImTpEjHRV3kAZIQ/+u+V9LE7O5Ox+tAgHXdSe3GTc2
         OA+Teqe5nmKhA6ipgpT0vQ5Qoxej8qWTBNgk0helpskCd4sU316eSpLvHrpOtzk9Xit/
         DkIedPEMMcTqMamnMLNRTkKbnHxg09RU35PxxaXkX3IvOsMAQjJnnqiCifsQ9zLtafPj
         h+oM0NwRt/U2CLVfSC27VS6LpyT83qOthxbsTUTRQth8njJVhLE3UpQv2lLi0MUQCRGF
         Tep+6DbxFOhsw+zP4Z6JsFtskk4Xc2XzsLS9PZCH5f1DLIkdbvmBQkzXpHIf9ZXZkqsT
         ZPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793686608; x=1794291408;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oxeQ7ppGYBKjK5meXlEqKGqekI9iSYV6fmFE9Pb4Uvo=;
        b=d4scQuZhlfjEMSYLe+fwEhA6mC7R/NziBLLgH+E1SglE5pJQa9V9SV3ovKlRq95jGb
         TU/9CDkBhqEdHFQP49hUOGUssARSq9ynQATi9w7+7k5MH+AuxHFL8fIq/PpOae5Jk9t0
         ypB03WyCYFAgFyq48GBW/eO1jo/Cu4ErHuc5kqNNs6fimgzqxnWDbA5mJWprhKyAUFP9
         4ITZYuWOgMfgTfb6JtTtM2/nqcK+meqMnj82lhOqL+g+PcTIekMHG9hMKyWMrUPxuadu
         ADces9ve6Niy32LJM0bPlxazOjuJlMhXMgZYD/MLJ1gOz9/ZloVhBiq2em8oZTdVI+Dg
         iSDA==
X-Forwarded-Encrypted: i=1; AKwUvBwduUecMXONFeHJFe6M6zNQPBeFF1AtBwe8hc03N5mpsyMF9mNcD6EPHzei0CoSLcmnrbwuXrO0SmhDyGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9e8bCJ4PXPLJae5OJF06J0QWIsNds0bcNO+ZgtQDTsvhCUQxqb
	//Vh7LBIG0X6wXmkkqGZyXxZ1ADXSQ1Lw0gqrbERenmQhG8IyZzXlcdlxqn8N/obuEYUeVUVpGf
	KoTPhD834oLZkHwGK+kuNwOSH28cEDP71RbACEGM1nLAlmnVFPbeUynks0o7kzlPCHXipszMMJd
	Y=
X-Gm-Gg: AYBFou25oV23qBlWiL+KNNkaHJaXnX8uJclPca30IZrgGGgdoK5Cg9FxS7pwX+dizts
	q6CadnhYk3G0KywHbKBC4bulJI3EuVntyP8Op9ftYgxySc1lPqFKvtV0i7HH4avpWz0abssOpYi
	8ACLZPCQOcZpqES4ofBAmTkLwxS0nCFHH4JuGiUg1L8D9eLPdDw0vBHqwU/5dM5h05UWgkAX6ms
	poTpgIeaDyzqqsZO5n2iwSDzW6bk5U/bU6YT+TszY3hhduRLH3GJ0rsc12McUZZA7do4Ff8sgWK
	f0jVrQrm1SPJHRcRmoJzyLz6wJxblDz3ubfXTLOxOEpc0SeSoMmQAhp443XZy+MITrKusKrVfbx
	va9arzaae2aq69Tl3YrnynLQLswoOfpQLBQllIu7QvfBZS4+i0ykxkp142HSv2wXyRFO2ag==
X-Received: by 2002:a05:6512:1393:b0:5bf:cfc6:edb2 with SMTP id 2adb3069b0e04-5bfd951d540mr4443725e87.1.1793686607741;
        Mon, 02 Nov 2026 22:16:47 -0800 (PST)
X-Received: by 2002:a05:6512:1393:b0:5bf:cfc6:edb2 with SMTP id 2adb3069b0e04-5bfd951d540mr4443702e87.1.1793686607340;
        Mon, 02 Nov 2026 22:16:47 -0800 (PST)
Received: from fedora (89-27-86-246.bb.dnainternet.fi. [89.27.86.246])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe073e0f9sm1964634e87.54.2026.11.02.22.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 22:16:46 -0800 (PST)
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
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v17 01/12] mm/Kconfig: changes for migrate on fault for device pages
Date: Tue,  3 Nov 2026 08:16:18 +0200
Message-ID: <20261103061629.972669-2-mpenttil@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103061629.972669-1-mpenttil@redhat.com>
References: <20261103061629.972669-1-mpenttil@redhat.com>
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
Cc: "Liam R. Howlett" <liam@infradead.org>
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
index afff1b25b543..6fa03655b575 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -682,6 +682,7 @@ config MIGRATION
 
 config DEVICE_MIGRATION
 	def_bool MIGRATION && ZONE_DEVICE
+	select HMM_MIRROR
 
 config ARCH_ENABLE_HUGEPAGE_MIGRATION
 	bool
-- 
2.55.0


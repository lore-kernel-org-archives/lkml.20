Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AC2378D8E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 01:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787793285; cv=none; b=Plnzh7Tx0h3jbKzdjzCF0dfDNc+lf/0NSxBMcZJEerweaBDOjB4wF2kWS57vYXPnRZYwmHGocR41q+zNY9NsaBA2Jor+hX+H4pEjS+nYgdCLj8V2HHUYJBLjlSfY94EQr2D+iYBL/iDE7eB8Eb7QKPKNuca60LDJ6DpZR1Vobek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787793285; c=relaxed/simple;
	bh=NBuM7Z8qJAkYuoJEbItk8rVmqNQCo+qHFYrg0x2wOxk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A5b2GimV9FsHoGcB/dEKtdpBxHDg7ALHahMcg19VbauvtPqC53ELCFBHYL1luYoCVJp/beDaVWwFAiAYp2/cbBTK6LYvZbD7O/3vSodvVAuVgp9A9rSWbvyJD+rZZz/wL5nMXJzMk8aMkujuLcz7Is2wB81azkC0p87EwgZ0laU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3AgovGt; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3AgovGt"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3965d3d9ab8so1628696a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787793283; x=1788398083; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBuM7Z8qJAkYuoJEbItk8rVmqNQCo+qHFYrg0x2wOxk=;
        b=N3AgovGtE9a0FM6k1D9Z0Mqy5BbLhs7cDn9YJaPp/kCN9grQdyxmRfBPsYHnxUSMEw
         LmKE62+YO0t4Nl1MPDeFUVWXF0W2K7frcGLGQqij9ELdNmkpTpD+KdCnjgBFJkmRx6L+
         I93lOezFDNFa8TEHtfJ95tLFCom9TPZoXCbBDvvCHtGf/Et0o7hJbXSILwLWmjHgUwKy
         RXGFj74ahisT41Vr0iehUg1Fslrw9Hd5f9CZjb0cdkasbPOKvWs0TpYPdvPG/ycKiMRg
         SMJj2a+FLtvjUwBCXeiNe6d8gJCihOrr0tBlCSe/bZhks9GAvTdekaqNok8MtQmfrCTG
         ctCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787793283; x=1788398083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NBuM7Z8qJAkYuoJEbItk8rVmqNQCo+qHFYrg0x2wOxk=;
        b=b7zewyF/QHV+rZL+bf6drl3pF0r070Wi8YdFi7ezk0SNcihojVaAYsl2Qy1ZHXmILY
         Eje6necPtD5e51pKmMP0kLf0sd0Q/3i6jUHGwrq8d84PFWgcxT4OybDejJ9tDnDwqf3d
         jP32gJhJGlbTPwWs8w1sGWFY2iH2LMRuxAd26rBoIup+ge7omzdzakH3/jXXZrdTTOYX
         7PF/Wr5JQtmBIgFMmZ+1IwQ841wlc/DQl39bX/Is8vkq4s807NK3Gpyyi7F+wgLOd5Vu
         PnwFh0Iul/9geDxtFjZDDGN1aYEkutzsQl3b77qb1MASIgv6GcYFH791OM9TRiP4lO98
         EXkA==
X-Forwarded-Encrypted: i=1; AHgh+Rqna98beOgLxiJ1rSOJnclpuvGfdjiZkhQicI5RsL07HH7u6XkJGIGT5KJ88taAJN84cWSK5BiogggVBJc=@vger.kernel.org
X-Gm-Message-State: AFuF++mMlihqc6ZxQqWw4HquM3lihw0w4uYMsBjaHDf3sqrYYR3SB8JS
	KxH/kkGe2FakGWMx/Gxf97LnlPkn3kAEXQs4zzTqCqWcJV3vVmh2oLWw
X-Gm-Gg: AR+sD11LeifHcIBfNi2n3A7cGez+oQxMPlxJYAR0YqtBKZ+JWYqACVg7ywe37dBvbQO
	PCWu6UXSzFzFQt72ugiaFq05NjdOsguankH805PxZkANrhdI+Cc+g0N0/Mcnziyv8s4HxsVft87
	JqrayhGT8CaPK/7m2yP0PHU5n8r0iBYWasj3bovjvgz5BJHQEtcsm8o3ZclJ8qcPGPzmbLnWQrZ
	xS3MazB0vfT+lDemUSDHp9fsuumZHdZbSIi83ut3unDuE4ScK4Y2kOPVhRRf1yl0IMFz3ypUaN8
	B3R4KCXZz0eq2CmtR7D9GXA+Sc0oQdUitaoxBzPRiGkqJ5scZ5uk14pXjOb2i1izwDgcU9OiWRw
	n+Y0XR2g0hWRGNRTqNTFYkKGVM1CXjPp3cvVa2VMIMh1938Z3nQpWFhcvFNvlXtl1UE03VRxXVh
	zeyj1Udto0WRneq97bSFXxkyn8InL3CKM2YKhU2QjV8sd0rd6XZWI8X3mBQkeU6XlC7sQ1JgSz
X-Received: by 2002:a17:90a:e70f:b0:38e:11ba:992c with SMTP id 98e67ed59e1d1-3966d4587b7mr23563979a91.12.1787793283407;
        Wed, 26 Aug 2026 18:14:43 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0fd5c34sm461051a91.8.2026.08.26.18.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 18:14:42 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hagen Paul Pfeifer <hagen@jauu.net>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] mm/secretmem: properly account locked pages
Date: Thu, 27 Aug 2026 10:14:29 +0900
Message-ID: <20260827011429.1516473-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260826-secretmem-accounting-v3-1-94cb04399510@kernel.org>
References: <20260826-secretmem-accounting-v3-1-94cb04399510@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Lorenzo,

I tested the exact v3 from this Message-ID on its stated base with an x86_64
KASAN kernel. The supplied selftest passed 5/5 in three boots. My independent
accounting-boundary and capability/delegation suites also passed in three
boots each, with no patch-attributable KASAN report, warning, Oops, or panic.

The independent suites retain the mlock-limit and fd-delegation coverage
removed from the supplied selftest in v3. This tag applies to the v3 fix; I
will treat the planned separate upstream selftest patch independently.

Tested-by: Daehyeon Ko <4ncienth@gmail.com>

Thanks,
Daehyeon

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491631;
	b=v5E6BwSaOc9uf0XomW47Wibpfp8WqNtF9NldmHnA3uhkw1FCOs+TPNAJJEf69HOBQ/7W
	 Aeuxhjq/rnJZED0T+KOs7yDE51sCRXEwPvjAzyaTTKwwUV4+OF2Lox/qNKr3B0nPpMkNL
	 6WDJt7aLDEp5xGsp7U07dpoOKdvztntBxPXA78n1iAaaLTQhc0vlgDAjpVI8Z2x2QUNUO
	 tUYg68hrUdFP6Mvtho9WCNeUdwu2lVZ0QiVV3AfR8VNhvvy7vEwPYDDq3TsC/HKLQz/bM
	 tF0FsTv9xdz+VFEp96SPxQuc1MpTH3U1d2zWKlnP7RdJZkNo6bS9Zkue8Lo7CAQHyvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=f1CD5KUc+O3Tx5grzZrjsKykqx4I2RzLAmwE+DSm2ZA=;
	b=xvGvPwMcRNgUVHpgW8XU8a2i18PUO3laS7JgIDmr8OtPRggjXyl/Gc8HMkl2pLGezG0j
	 cEw1ISGb2byJ5WK07cb4qtSftiPMAe6MrQz/aPndyYyp4CnlAQLXs9hkf1fn/kO0pqp5R
	 aXnbzz/DYSKW80jcc2n3iePYk4Yre0WO5mf8RiJuUMBBnqqaK+Lmx/rhsuuSLGfM8wZl2
	 1t3LOACe7boCWziCIX++FsB08W1QKN8kU3C55ixllVCMtuQhkW51G87DCCKL+XJivZqeH
	 UpMpIXKYNtjgja1oHPC3IJhb7uDKLcK7Vn9SDq5zSaenvuKZKg33wE7YSmaoumZqbxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KN4yv4JN;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C84E9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KN4yv4JN
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1856098a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792491630; x=1793096430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1CD5KUc+O3Tx5grzZrjsKykqx4I2RzLAmwE+DSm2ZA=;
        b=KN4yv4JN52SADaqt/STic7vt9Qgkt4yVIYEZ5o/sJkApvEF7y5ZwOoYPbJC8dGDBlL
         FNoZbO/0phLS4wokbVIIK1GuwkgwB3KQJfZKntWQ6EVu7RbaACT4X3EetwSNX2oRltkt
         EuyoRidFHTXHyAU/biLncFuahIfCY++BNmaPMTw8yWYOz6M8vUIIFNHbbvhIv2yW5GJW
         qzfHz/jwCRoiP0fpEn7flBpJBlfCJ1Tr5wZfALdkniXv2WwhE2qePl9k6zwkv6uU1+1+
         rcckfq5be4iB39auxTMaOTCQcjZtRux5I6mgav3DhTNzGdakD/pnkBPxegh4XQWpY2oB
         vv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491630; x=1793096430;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f1CD5KUc+O3Tx5grzZrjsKykqx4I2RzLAmwE+DSm2ZA=;
        b=Wuj8N2QWzuvVdri2b5oLUZTklJu8Xilu2mvZiipPDo+HjTTGC6eGfqw8mMzQ7dIP6d
         VQiJ97+yUhVxRXfikktEk/NeRzdSsU8iCR8YQyv4DjlrDfw1wzaEyZsQ4UZqoWpIwWcg
         Zog6CZiFzGdWN94XbMvEUO3meg9KVWvaPPaqcvKMXxWqJZJJpn1dLnaBv2tQYpNUlFjM
         vlFmI55kv01cJ4E5ax4Kx7PY1l87f6TwoZq8sJSGZOjsYFNgpPMIObvc+zfsV4urzIBX
         MHqjBGz4fpzY+xAjbb/MEEdg2zmSZv3S9aGawKX6Tk40obK3ZrNB/0WD9OM6/fGO8s0i
         uGVA==
X-Forwarded-Encrypted: i=1; AKwUvBz5fEL4MztBtb/QHYR5tvjHtALmuzR8wdv32Oq3A+gk8elCPQ62y5ObprlQTTg+poOz7FXK2YycrBJOb2E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzttLNf/CG2gaOsw3hycRx4NfRPBMuhl2IWRbUVdoyfvsaL8Bk
	GrtUHLz+mRIxwU+54OMmtZmxT3LMZppMPgXH8W8KxFR2sA00rgLLmK3P
X-Gm-Gg: AYBFou1F1QvHCc4NSd9oej8z9M2gDAnIIA+GytVZdzbCpfqJNHjeOG6SgrWaaWFXf2c
	eGum4jkeeHlBjJbaenSfFkTIBRz8qUMAkcSqaH4dodDRtfwp1jozTR54NWIWX8VMDrjFogVCXNh
	IAOiVDykoLb9ykO5RnEyHSV7N9yDQTgV1VhM5KRkY0U+jKAzUwCzPyRFVKBYgUygvHR6xqOzGET
	5YWONBK4vxfhSyUogUYUFkQ89zz3e9zuZs1qpCKkP/Gfcut496ibm3JJxiw6SmW8xixYJz9OF1m
	d2XSiIoQbWyecR1MiE+UyAH/JUJqbRWoqLF5Ia94tvYTO6NmSE1mAt5dwAukfqT4gYoRySGry3T
	+0G68/Wnv/txSRMX8QpbMjcTR4oA+fX3DkgHpkIEXchI7ZuNhjHf/Zf1WARPN1J/UWPo0SX7sWt
	cri6+cd+Xj25rydC2zzhIrvIy84nrgRvr2wWPDdXXJatkAdlD5DaIC1w6Y0gTq7FqvRI/1srhD9
	MrXNkLqm9Fe
X-Received: by 2002:a17:90b:5111:b0:3aa:f4af:1e0f with SMTP id 98e67ed59e1d1-3acee292795mr9830043a91.8.1792491630077;
        Tue, 20 Oct 2026 03:20:30 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acd3cc73c7sm9872459a91.4.2026.10.20.03.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:20:25 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: david@kernel.org
Cc: muchun.song@linux.dev,
	osalvador@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hugetlb: retry private VMA locking when unmapping folios
Date: Tue, 20 Oct 2026 19:20:12 +0900
Message-ID: <20261020102012.1775940-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <23623534-a163-4ffa-8538-b5aff7daecaf@kernel.org>
References: <20261015170551.2656546-1-4ncienth@gmail.com> <23623534-a163-4ffa-8538-b5aff7daecaf@kernel.org>
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

Hi David,

Yes, that makes sense.

The per-index fault mutex excludes concurrent faults for the folio being
removed, while i_mmap_rwsem keeps the VMA in the mapping tree and excludes
concurrent page-table teardown.  So the private resv_map lock is not needed
in this path.

I tested the exact diff from your message on v7.3-rc5 with KASAN+LOCKDEP.
My unprivileged mprotect()/hole-punch reproducer completed 1,000 rounds
(64,000 hole punches) with no KASAN, lockdep, unexpected warning, oops, or
panic.

Please consider my patch superseded by Josef's fix.

One small typo in the quoted comment: "i_mmap_rwsem everybody" appears to
be missing "excludes".

The quoted commit also predates the current linux-next policy change:
`Assisted-by` is no longer a recognized trailer.  `generated-content.rst`
asks that tool-assisted discovery be stated in the changelog prose instead.

Tested-by: Daehyeon Ko <4ncienth@gmail.com>

Thanks,
Daehyeon

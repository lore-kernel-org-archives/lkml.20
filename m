Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697282;
	b=r/ZWBOZ/4TuExqiyyRaQD+1yijdXz5P8H4PsC4A4PDiulVA/Tz7pIFWly4cdPxbS3kKC
	 1jq3TnTE/Ej45//Ogazf7eeeTAMdZhGrgCnkLSJwNQolBseJjrbBrKaH5eklwn/RjJN2T
	 STHpQolAZboystHi7rSjfr2dtAEPx6LO7KTBwi61Hyn3dBtlemZT8uxcsKOnqJVk20R5Y
	 x3tuEFtt+ZLIegDiIRiZjG6iJMOex+ctwQkEPFDPz2m8wpqw+mB3v7Mw4nl4UqL7eOkRb
	 jNCBNJ/R0nDKR/GCRoe2VFpzvTDiiEyyw4JbD7LceZsurvyqVoS+JvwHYBRWQwZz1Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697282;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S1WYfRKraltmcSelSSDtbEGSqHwpRq+KEHeQXK3+6sc=;
	b=5OftiFtLgOeRLWdNRn6QXXjujmqPXEr/FfbAeOkwOlVNpEEr+jYbLRn1tijyhJXT8gGS
	 894uaZlA2R+pgLJmR4ChUxw+bE8d+7wJqZABa5Hh0cx6Z7iwUsrtp2xu2a0a1b+IVmye3
	 MpMf7HIBJ160kUpNtHZ/tS0BjL1kiDt5a0UBRCq4BUbuvbR10r1rtDY8DchCEQXA4z6mW
	 Xwz11NAlUmzs7jww3phl3hxHMu9QJoPCZGoes0msnF620HHDFYIA3PlKhsCMocxpfsc5c
	 t0Wc15TzpQJe0suR3DqBXHF8eezY5ybarBWG5RVK2tMs0zNQx67kaILScIoIT0lVKCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhqWLKDZ;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA18606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:14:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FA18606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bhqWLKDZ
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4be28b82so4119258f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793697281; x=1794302081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S1WYfRKraltmcSelSSDtbEGSqHwpRq+KEHeQXK3+6sc=;
        b=bhqWLKDZDtkKOF+hAmvEMOGGJ1M155EtY2J1yjU9vJ1UJLT97cPPeiwnWGRp7ISYoy
         Y7uijpQyMc/G1CJfA32s0bWs2pNur+oZqO6IVPij2znRjxnMirrJ0RE8DhPxGiCQon4a
         oQnhsTISBEL5NZGxzg9OKS/bsHdzEzNhGJ6KS61eW8dFsMHHNMrvfIS4XX9ZC9weP8bN
         CUx6ymx+1MYhJuS1awYIJGvM1dFlClkYMHWpvm8L98lgOZMJOnaVAFY2qcCBfwxoKbpl
         QDsKkRPOzUYr0x05iB828Cf+ZAdAPqFces1SamympChtXbEOLxFvLARXG/C9Uu6rPPl3
         N6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697281; x=1794302081;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S1WYfRKraltmcSelSSDtbEGSqHwpRq+KEHeQXK3+6sc=;
        b=DEvpoMEO5w5/a4r9ZvRZEJu7sRq/UGqoArE7WAvPh3hFQphUKQmGn6Mvd+zbKOCsAF
         zd1KhqueBsVeEYPrmFMXwK+rfIZwH+gcS+enAbEnL3O0om9WsFlY5Db72sILdmrhcFRT
         79F1DvRUEuCRfGr90oXjdqhFB+NctZ1iTbsehKc54ZmxOAMSoxpVAhE+q6g5/3Y0AGDk
         5TO7fp+v7xV5p8tp5tw3+eNsq4xtL3LHAW1hpyy8nwSmK0SaF4xh+9Y8864gyndkd9Pl
         Z7gCzEJgSdxF/Uqkae0eNdt2zkGv4bzBxBrpx2lo1RN4LfoB/zkUVKRPQB7ZFJxpW28j
         UHxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1WlTj/hCut2ZkesHZwKmqCMvuacWZwC4umwmWFDOJkLUgq8ihcUQAUhRgsMr/WXpnSd670QMnrtyXTXo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a/kCvHw+gZKkB0toCJQ0AQGdUIVRaW8DaDTi1StGEHweuFNbq
	TRtoyLXxk2rS9mDHaNDRvJ5ZRyMwzXayNkR0oQSrM+OPHlEHEghZ55ml
X-Gm-Gg: AYBFou2wL420ZrcYs3/2nUHXjcWMWf1BpGybql/3zFpMHFwCOjpyfSHlycdD25N0FXQ
	CCXCJUrfAgq30w8uCCabwZXZcTVuLZKY0AnBeX7hu++SMWWzKDeswvzOmCHTiwxskNUuqlh3prd
	juWFzhinGle/26fwSz+Bb2rpM6C70STl6q6Wf5OjzkUoyHoaWQl2E8FUdNNMiZAfjGEfgWacFks
	8vN8YWI+2vDByibYV5LAFxWDmACWkjgoHclFWKjpe1Dzs8Wb27WMVdKuh8oGg+yCYMoEjHDZqT9
	YnuljFSvnyLEYFJy9wk4TwORns/uX3+AC76KwtCfy+iphsyqz9FD6lhaqq1/2IiwKbeYkIoFdOr
	kUD007oAEYtRl8XqgCpYBQa6z8c74EdvozwXx63Bp7GsmEqInAo9itiEU0HDLY8gMzO2nQ/UC+s
	wj63NkP6bVQ7fIyDX5vs9OUe0vfO4mYTqv6Xqc0w4ULK3OKxaiWVL09xrRyBQ9cjj6Q6P+H3RH6
	KTGwaO1H361SdW99wSFMpv8eo1Ogvwe+SMbKfDz3E1Pvhkl1xpFd5Fg7LcDjXEHPF4kHFNDT7zI
	IIHjaey9l4GdXUVSHX+R4GZA7mBTbaP+I/PdbKwmejf6Z4eJp1RNP0XvE5v0+QPcdS6RasLha57
	KtelmRXnkJx0=
X-Received: by 2002:a5d:584d:0:b0:488:8525:4979 with SMTP id ffacd0b85a97d-48e6e50b5f4mr26190523f8f.45.1793697280601;
        Tue, 03 Nov 2026 01:14:40 -0800 (PST)
Received: from C422HJQPQG-Fractile ([150.251.170.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9b54dsm23473758f8f.47.2026.11.03.01.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:14:39 -0800 (PST)
Date: Tue, 3 Nov 2026 09:14:37 +0000
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Tal Zussman <tz2294@columbia.edu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Peter Xu <peterx@redhat.com>, Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] mm: remove newly-unused page wrapper APIs
Message-ID: <auml_evm_m2C6zUM@C422HJQPQG-Fractile>
References: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102-page-wrappers-v1-0-e7280bdb31f6@columbia.edu>

On Mon, Nov 02, 2026 at 05:54:05PM -0500, Tal Zussman wrote:
> After some folio conversions done last cycle (namely ceph, f2fs, btrfs,
> fuse, and page_io.c), there are a number of newly-unused page APIs.
> Let's remove them and update comments as necessary.
> 
> Patches 1 and 8 are taken from the ceph writeback folio series [1],
> along with tags.
> 
> [1] https://lore.kernel.org/r/20260810-remove-wait-on-page-writeback-v3-0-dd7531704f26@columbia.edu/

For the series:

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>

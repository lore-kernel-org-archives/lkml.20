Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392823E2ABA
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821560; cv=none; b=S0J1D+DIg2AhNFihKGkJ9DBdnIm2eVAf00PDk036CVjDEVIcseafpfnaidIUMkBYRWA4RCOekJ18B6JF9L5XLnmWQCsZOqgqVvBI8hu1nw0CP2PSQsmmyY5w7q3sBS/R8T5eh24JxYj7vpiJN5D3BRfroqY6vmURBbKYy5cYIP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821560; c=relaxed/simple;
	bh=RZ1Jn/6i9KUHXzsZ98zRabLUOeoHEAg4uPrR5t456+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7JvVJP6tAWNwSYTRmJh4U5b2WC7C9nzK7y+hej4Nvir9AzdiQ60frx0W+BVn/uiDkdqw/37mXIqivPWqvG4X2m2WvWeIRzIuEo+NJy1llg2PFxIm+zXf9CSeVuMYGaR3L0UtwtWodZFVNpSZnkOHW0yFghviX5S65cuMaav2so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FfxLcfpG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FfxLcfpG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7917E1F0155E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787821550;
	bh=ERqZwpmM+7KKJYkn/0GThKweWRknia+cwxXgwxceimI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FfxLcfpG+g1v0k0aCEG/dXXtqsMxBIRJeMETT1ABjvDUZzZHK8uoYZm2QPv6QbquB
	 gASezAkL/AELbGlyGfKoYnOq0HJZUUXkCq9btswi97TQQhOiHuDk0mmd7Jz4XLmojf
	 MaANQNtZRV+ppW1797vd2iXjNkqRJ44v3tw3KKP2LOoZcewU0rUYpNLd+jjtxL+C2l
	 juo333wfXC7jdCXnLLyZMKuJgLqNCpmSYtLLvX+/TrMB9Cr96WanW5jhYbkfUEBm1N
	 5HXBMtIE5xGZH5lvgkPqqns0sxaAZPoyU4Fci9PH3GJL2XI8BefWutf6WrpOrV6R4J
	 v3emlLmscI3SQ==
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9382fbb1208so118346285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:05:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RokOT5fl+qoip6W1ku+AXJacZpqVes2Tt4TogkQ9/0MIJXArSSkI3i6ucJfduIXqFlU9WM5tHrzSSQ08so=@vger.kernel.org
X-Gm-Message-State: AFuF++kIkGyjRoSZzYWhXztIs48+9tkucEEzfae4tVgnys96L8Bfy/aq
	NGNyt85pX8uBNXxWs3e5DBVcZgNZjwM2WATs0PFlCuoGk99egDL+LmUqjir7ls//73dkG9tNp8W
	OJt93D2roUPD5IFi52cDNjzlfwLNTfHQ=
X-Received: by 2002:a05:620a:29d2:b0:937:7836:14ff with SMTP id
 af79cd13be357-937804b39dbmr1193610085a.33.1787821549793; Thu, 27 Aug 2026
 02:05:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821-swap-thp-cleanup-v3-0-9b43f5163238@tencent.com> <20260821-swap-thp-cleanup-v3-3-9b43f5163238@tencent.com>
In-Reply-To: <20260821-swap-thp-cleanup-v3-3-9b43f5163238@tencent.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 17:05:38 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4xuN8gKVscCY4as3HLFKZV5+AGWF9nLaq93F_d89xL3qA@mail.gmail.com>
X-Gm-Features: AcwNN1WwDl7OLRp5aAVjzRg2zIQwM-f8n6HU_TmeuVeGaayOsgsB-1AQGCLrSnQ
Message-ID: <CAGsJ_4xuN8gKVscCY4as3HLFKZV5+AGWF9nLaq93F_d89xL3qA@mail.gmail.com>
Subject: Re: [PATCH v3 03/18] mm/huge_memory: invert folio_ref_freeze() check
 to reduce indentation
To: kasong@tencent.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chris Li <chrisl@kernel.org>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
	Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, 
	Shivam Kalra <shivamkalra98@zohomail.in>, Kairui Song <ryncsn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 21, 2026 at 2:55=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Kairui Song <kasong@tencent.com>
>
> Invert the folio_ref_freeze() success check in
> __folio_freeze_and_split_unmapped() to return early on failure, which
> removes one level of indentation from the entire success path.
>
> This is a pure refactoring with no functional change.  It prepares the
> function to be split into separate helpers for anonymous and
> file-backed folios in a later patch.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---

Good indentation reduction.

Reviewed-by: Barry Song <baohua@kernel.org>

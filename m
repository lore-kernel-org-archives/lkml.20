Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACA93C3F5F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 19:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795730; cv=pass; b=stv/fIATMMADnHKnlElNgBoBLqIzNWNYBqO2nZgefWJlGTBI7XOuUinM/yWaAw6x5kioqVNMv+jup+On2BlShQZpv6wc15sY6UwC5+b54jrhD8GtszYFKLZKaA38/LLZWIl+Xw5NaWMztDY8rul3jbApkkatS5HD1lnyZ3KXk/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795730; c=relaxed/simple;
	bh=fZthL+tWzR9E/xcvxwzbMjS1v8ySe2/09qkUj/BN7gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GiCxt3vlLqKMYsdaL5F7ylfsVZtC+wgwnxHZ5Ig7QhnHFGZE4lxemiTF/FXpuIgYZdhLDh1UHfNf6rLpdIt77qghjqf/44HW05qGJsIIp6beoNPJ1q+/dEtqhfylSkkENPEuS317mnJU/LJCTB9hbXEHghXJivIcpyDn+gANkyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=O1aHOzu9; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="O1aHOzu9"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67583c777abso76152d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:15:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790795727; cv=none;
        d=google.com; s=arc-20260327;
        b=FiZmwEdhPJdLsYPRFd79XZNajW9FZBXE4Qlmg2eDxyzFmgjACDN/VvBwKShcF75f+d
         x/HTcanp3tL+jzYug4G91BkUoFccGDw6gCNTEJ7T6k+fJXN0E9gls+XSgLyS6kNia9sG
         Y89D4LidWFx+eK1hHE7kazIU9RrQE2hdI4D1Vks5gjZwyCHXjpfir9atm3sEZK+AfkHL
         8Y1+XLJ4D4O2g/vzMeNfWYpFQVEvkxDbtnnPiZ26Pw/gllr0x6EqCeDSc1+/JUOUMhbc
         LkuAtBcqyueB0N40m70yNFyA4vmwTWTgRByPyaqx4/5yW37xVpUxK1KrMi9nrVwxZMJe
         H/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sykxas6Adj+WIJltS14TUveHVHPawmc/B3/hESpzPNs=;
        fh=VDGMVaXvKJncnji6tvDBOjxnDevto7FmGgZMxz8ZH5s=;
        b=CCovLLaD1/18X13kClHpFr0elhWj+Zk+NFm+66aYj9RLXhj6pwXYULgiZUwuSGcynJ
         zacj+F/o5/fdQjBKAyhDPoqRTFrA1lRo+lEumx83JxP4zIbxnDDHMlWGvyu9L0u/oJfy
         H7diptkOrKvOCfbEhfZTDdFIO2615jzdTxFCibVgj06gTthLwW6Lgn0mffsa14vweiEh
         DxcmJu3PzlaWsk1e4dxgwjOg+Caon2sfqQgdDFLZpTkMRestrm84ODqgpIH2ll2w7iEM
         zdqVkIw9rD4Oc3R882dGV3Ru96YE0XrIPrnR7+48cWpr4LNYhGrbsHecTfrSSuSBFLSB
         nsvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1790795727; x=1791400527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sykxas6Adj+WIJltS14TUveHVHPawmc/B3/hESpzPNs=;
        b=O1aHOzu9CUR8grxwHyvW6ZdNu9R40dNRACLsRteyrCm+grJlgN86FrEFKnDtmIShg/
         loiox00NjEId2yqco2nVYma2uoWoNMnHieGGAinouaoNPNA7P5jhH16V9s6QBiir8npc
         FJj9HbJ4bEwwrHNjmLhISBmxokWzr2pijkzCadw3UOR3+PcSINDxoUHc5o1nIuOdKfZI
         ktC4NmRSOCYtry8elPt4FIjeM7P7a4cZvnk4QSfBW7CJWJy48v4XbJosn/XQFtUrhBnT
         NSVxpyLE4udahn4/N6jZZ0dWsHVS3chRRLn8byPdiJlSf/WyThu11nGSoII5MnRiJtEK
         Yxrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790795727; x=1791400527;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sykxas6Adj+WIJltS14TUveHVHPawmc/B3/hESpzPNs=;
        b=mjbN1EUvVXijDsjvSo+bwPxrFFPfHc/+p9Y/9tWmv1YDNk2+K7xje/kXSpss6Izpvh
         pYvvZCYg59PMChQBC9iatfa44qxwAItFn5t3kA/XkvR2qYyX/i0xBtgHwTRLgTx2DwVZ
         tNJoBS+phbYXTYstr9p0FtP6VJmXSvB8iomdqsa5xqTMO5e0umDZEg4/5T19ccGrgeOb
         qAWdlNDNn59Nhp6isHY/hdvFbDEvkvGhNNA2K8FbUw/7oz/Ev1I4sK+t+CTPcgWG73pq
         jD3jJUXBDckLvazpwimTh4DNF71379dTDgWgHLwPkdmC9SOqeNSgZI+IfxoRoUbcDVMP
         HewQ==
X-Forwarded-Encrypted: i=1; AKwUvBzO9ixlhlAw05am3xg4rYr5DhGntoaHonuuX6mkHURnPJtxQH1QOLlJQvCmms3ZGQgy3KRsHrYgKNjaB3I=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8ovXPZbdUMLVvIsNfPQrFwO6SPdGBIP3zXU0Q6+AxdMqXhBuW
	SbJU5BO6l/7QN725LgCOwemphqHP9MsZZHS0DtF4cJjtJddZIb39uvcdibTDJNjsxpRSEbl1iR9
	Mb0EAjs+2bOEPRZplifbe+dUWEYR7qMEXa6d7QH2j7w==
X-Gm-Gg: AYBFou2VJir11LtHxbulI2VkZ126D7R5gBJRokeSz9x6n5MvFuZl7IXI8dTP/MedmEs
	BYb6U+ySX4tPt60RoEraNfzqlK/u2d2uG2dgZAbUo9BXEIcvCu0SFKwDf15hw3BY7HO9EANnQBx
	xkQ+4iYnnJ5HcuzurJh9AA32s5+3DUeqALF5Kwuj1sy29Nb7Pzf2e11olkIS/6jioWWne65Cofz
	srp3K3hGmL8h/mB3KFSF1l1A8Z1FT9oKO0zMJhJg3VINbMBdptVIQebJcxMzAlAaNUfmtM3HDWi
	TgooIc8n4qozhIkwxGpDxyBATUHA9rywlxp9E/aYWQ/4ZWjXef8wKsvm0oK9xuUQm1uuY1SZ0Fz
	DK6streZiXg==
X-Received: by 2002:a05:690e:1586:10b0:672:96c4:af92 with SMTP id
 956f58d0204a3-676911e16b6mr273044d50.33.1790795727505; Wed, 30 Sep 2026
 12:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-fix-dontunmap-partial-self-merge-v2-0-f388985a0f0a@kernel.org>
In-Reply-To: <20260930-fix-dontunmap-partial-self-merge-v2-0-f388985a0f0a@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Wed, 30 Sep 2026 14:15:16 -0500
X-Gm-Features: AclHuK-pvBqXamSowcqonc1nkj-a8CmAPv0aSHfEztWllhc4V4grOHWSW8mGpDM
Message-ID: <CAEev2e8TXNwon=Ro27WYvyn-N5j=CenA8pEgLTPerMQtDh2OWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mm/mremap: fix two issues with MREMAP_DONTUNMAP
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Brian Geffon <bgeffon@google.com>, Minchan Kim <minchan@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 1:47=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> The MREMAP_DONTUNMAP feature is highly unusual in that it permits mremap(=
)
> operations that keep the original VMA in place.
>
> Historically this has led to a lot of bugs where non-obvious interactions
> occur between existing mremap() operations and the original VMA.
>
> Commit 397432cab17b ("mm/mremap: account mm->locked_vm correctly for
> MREMAP_DONTUNMAP") fixed an accidentally introduced bug around
> mm->locked_vm accounting, but this wasn't the only issue.
>
> And thus history repeats itself, as it turns out that mm->locked_vm
> accounting is broken by MREMAP_DONTUNMAP yet again by two further cases,
> and has been broken ever since the feature was introduced.
>
> Both relate to the fact that VMA_LOCKED_BIT is cleared on the source
> VMA (it has to be as all page tables are moved):
>
> 1. If an unfaulted VMA_LOCKONFAULT_BIT anonymous VMA self-merges it
>    clears the VMA_LOCKED_BIT flag and permanently leaks mm->locked_vm
>    pages.
>
> 2. If a partial mremap() is performed on a locked VMA there is a leak equ=
al
>    to the number of pages not copied.
>
> (Both for MREMAP_DONTUNMAP operations only)
>
> Both issues can be fixed by treating the source range as distinct from th=
e
> destination range, which is the definition of what MREMAP_DONTUNMAP does =
so
> is appropriate.
>
> In case 1, simply disallow the self-merge, keeping adjacent source and
> destination VMAs distinct.
>
> In case 2, split the source range ahead of time if the VMA is mlock()'d, =
so
> accounting is always correct.
>
> Both changes were tested locally and confirmed to fix the issues.
>
> For the purposes of a backport, the fixes are kept distinct, a follow-up
> series can add self-tests.
>
> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> ---
> v2:
> * Added tags (thanks everybody!)
> * Updated 2/2 to avoid splitting the VMA if the VMA was not mlock()'d. It
>   is only meaningful and necessary to perform the split in this case. Thi=
s
>   also fixes the proc_maps_race selftests that broke, as reported by
>   Anirudh.
>
> v1:
> https://lore.kernel.org/r/20260920-fix-dontunmap-partial-self-merge-v1-0-=
6ffb556f8f8b@kernel.org
>
> ---
> Lorenzo Stoakes (ARM) (2):
>       mm/mremap: fix locked_vm leak from MREMAP_DONTUNMAP self-merge
>       mm/mremap: fix locked_vm leak by splitting VMA for MREMAP_DONTUNMAP
>
>  mm/mremap.c                   | 70 ++++++++++++++++++++++++++++++++-----=
------
>  mm/vma.c                      | 21 +++++++++++--
>  mm/vma.h                      |  7 ++++-
>  tools/testing/vma/tests/vma.c | 10 +++----
>  4 files changed, 81 insertions(+), 27 deletions(-)

Thanks, the selftests are passing now.

Tested-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Regards
Anirudh Srinivasan

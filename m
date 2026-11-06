Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994574;
	b=CVFb9oy50X/4PEQzTayuhk1Z3hCL/2aUFl7/T0m+7En0k554btGw+RLV2k4Tt1EooRL/
	 4WiOoTxMc+LKeLWEB1tK03f3UIPXyYxbnNdn4ji/TQSZJujAPSwTZaDgBxhD+NLQ6B3wc
	 dBP4dWHYjqPfnry4/tklxFyNu3CcmkpZm5AokIRmb8jS3JusrVAyvtL9+CnHA6a+33oAt
	 jkrb3ZEnDQAgdj0MzXpBemh0A4mnaQmDT2ETP9Ba4ayuHwLDspm5fW95zMVq/uFmuSw6u
	 SUTaYWXNEO0iN9nGyLKoC9eyj+4WuxV8bE6XutSq/qo4LrOtfG+HCdEG2l2CRgxDzCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dfckAU/Yd29uVy4cVx78aos11SmH7YOOmI0OtH69KLo=;
	b=yuG7FGQQRMVWZROV47R54ZP8T6paYUAPm+zx0wZNrFDOuyvT9EHbpuqmZe1gCwbPhqKw
	 NkhwUWZeBDndbubIogKtnC9QwMnzeIv8xPYEgvR1iKIBTehj+quBATSvLU5aRZ2rUz5DD
	 R1UsBvpGIPvQTtVNmnZRBi7Xhc6r0xp1+fd9chE3aAzK+U2H/OJdkUjIgMgRdXZvUB38L
	 GXiMjfZZfq+IFLO4kdLwwmiA51uCPLJkrq3hK1iSABJXmPv0bHH1GnwQusycYt+LEV+rQ
	 dTEIapELV/wGgpHy9mK6IPLsy73/FhmAZGG6CG2Rcz2M34GAI4viY4Ocg6So/DYeEeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=rdmg21Ei;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80120606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:49:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80120606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=rdmg21Ei
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5365f9a04c5so13972661cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793994572; x=1794599372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dfckAU/Yd29uVy4cVx78aos11SmH7YOOmI0OtH69KLo=;
        b=rdmg21EimIq/9CkRaBXxC9Csx5eCxE6aZIirs6qS9ezxNuFx3DcSyFop6iUWgJRXNB
         wpwAcWFbaJl+NPK5StSWCKcD4xsQhvAv4k04CdvRCUzo1oR2BH270gGbotHLWS81MIeB
         h5X4cRTWNhqIAVOT9knEQypBhgRA6vcNwTTKCpx0ymCyfwKp1Y4oEMb3uBj0q70zKYfZ
         1swSdNcYzI1nJ/3W8k32Et28ILA829zTW1TiIza9c0zzvqgIFY8MDDNBaiGtW+yBJf0V
         fdNauUp4l6AwGc0dZaJIyc7vnxDAs7yPf5L0uTI/2GDVVe7Ln7UeTDC0Yc6X93cnJlxz
         Fjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994572; x=1794599372;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfckAU/Yd29uVy4cVx78aos11SmH7YOOmI0OtH69KLo=;
        b=RHnFjh+Op3CH08ZKey2tgGf1y5hkbMr/JPXF+krRR5Ne6yADUJADyYcpz4X88UiRSZ
         U8hhOWSIVt/fUHfbAlBsmJOWyDX7UZb6ySmIQdP+ZhWPlKbzEdD34f2zOryOWbG2QZsx
         obY+8KeSZREzexrrE6YQ2+uvzWUJd9ic4+kw1yAKU0uhiTxb7X0X/Q69cVexmglQjYav
         HXfzbWe1BkH1R4HOTYTtLVpqPnPg3Vjb0vDpbFKVI8NqXLBoGPREC1Yx5RkWi+Z6JuFx
         Vx1Da3kl3OMJuhgfdXLOvV1R942Mfc/cyRtAqUKNPjrpXOrzZSy0SGfJW1LJvQ9uEDvI
         lcSg==
X-Forwarded-Encrypted: i=1; AKwUvBwaxsiq0kjEqt/gAzKD+kUQJ7WvjAH3rz5io0Bs1kr1S6briR7k2UnQKuqdEoSpRVHo8biQBzFzAfqpfFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bgbUy83lPb3EfDvwvnPmhNfNNNsYDDZrPK7DSjzHyaU/HkYCq
	kHpJfn7LO7CqkJy0FIgrgXxuW70jW12mN5CMy64nXdytFOvN0RMP1HRt1bHPlIyjdhM=
X-Gm-Gg: AYBFou1oMfvviqDhcB9sbIgcIX+FuKVewPEnes0pUHu8L28PEP/IOl6b1Hi1WFFIXSv
	uWbP0myljDvPJAahs/RRqFccGI1RiJi+kXpHS8LTBsVE/U9x09/NPOAkVq3ex5Yk+zXHOdGoDV1
	E7MjlxyAPQ5pMBjY7iQwUCKMPLA4ZLrdJf4Qm6PMQaw9vAkaNZbA5ACJGbGDEhLkK2fIhjfVsMu
	UQeDVIP/TRRHuwLfFXc/kFZO880eZb59LA2RKEvkInVxhof1fuIuTQL7jf+YBlbVIgH7OuAyyvC
	KUgVEfv0m+J16OI523pMfgXJRrm/XjIzmVSnnT31Ze26okkcKOC5kwF2/mDm1+0YCUdIaw8wPKa
	LzqdxG2cXI72/QPKKphjvhVj8eWv15oyTBEVHWQ1VbNlUhVcRe7OAjZawiDmD1BGjbU2zjLdUgu
	z8tt7e/vCHiOaUFulqdmd28c/dRAY/KmaaL5s++Dxfu1Yz5odiHvB6AizLQCBZT9xGRNqyTxTKX
	DJXbbsIO14WZgl3XjGIR758iF0XT3pLKmJh/8+pmyKhUzlzQXB0sbB9/aliWyFPpcQbiOezYgHY
	ryotvw9rezqI65ewI8mw2nyEV+em50mHvcMze0fL1c7eMw==
X-Received: by 2002:ac8:5f50:0:b0:535:30a:76a8 with SMTP id d75a77b69052e-54e15a65d6dmr55048351cf.59.1793994572184;
        Fri, 06 Nov 2026 11:49:32 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26839a40sm27617471cf.20.2026.11.06.11.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:49:31 -0800 (PST)
Date: Fri, 06 Nov 2026 19:49:30 +0000
Message-ID: <2ab3b9da1c31ecfb5880542efa6508c8.josef@toxicpanda.com>
From: Josef Bacik <josef@toxicpanda.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Chris Mason <mason@kernel.org>,
 Lance Yang <lance.yang@linux.dev>,
 "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 Kiryl Shutsemau <kas@kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
Subject: Re: [PATCH 0/5] mm: limit pagecache folio refcount
In-Reply-To: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
References: <20261105-refcount_overflow_stable-v1-0-70b9c655da3e@kernel.org>
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
Content-Transfer-Encoding: 7bit

On Thu, Nov 05, 2026 at 02:10:09PM +0100, David Hildenbrand (Arm) wrote:
> Users can create a lot of folio references to pagecache folios, making
> it possible to overflow the refcount of large folios.

This is a summary of my Claude review of everything, minus what has
already been said on the thread.  The numbers are from a TCG guest with
the limits lowered to user 6000 and admin 9000.

1) Small folios, 1/5 and 5/5

On an order-0 folio one FOLL_PIN is worth GUP_PIN_COUNTING_BIAS
references, so about 2M pins reach the limit.  That used to make GUP
refuse more pins, now it is also SIGBUS on new faults and failing fork
and splice for everybody else.  6 io_uring registered buffers on one
order-0 shmem page (ref 6146) and another task gets SIGBUS mapping it.
Mappings alone can't get a small folio near the limit, so could the
mapping and splice sites skip small folios?

2) Migration, 1/5

remove_migration_pte() and remove_migration_pmd() check the limit for
whoever migrates, not for the owner of the mapping, and kcompactd always
gets the user limit.  With mappings in the admin reserve the next
migration drops whatever is over the user limit, in rmap walk order.

At ref 7681, move_pages(MPOL_MF_MOVE_ALL) without CAP_SYS_RESOURCE left
1682 of 7168 PTEs unrestored, including all 512 of an mlock()ed VMA, and
touching them again got SIGBUS for all 1682.  Could the restore check
against the admin limit only?

3) fork, 1/5

If the VMA is only copied because it has an anon rmap, the pagecache
PTEs could be left out to refault in the child, like copy_huge_pmd()
does, instead of failing the fork.  Only the VM_COPY_ON_FORK cases need
the error.

4) splice, 2/5

filemap_splice_read() fails where read() still works.  sendfile(), the
copy_file_range() fallback and overlayfs copy-up get -ENOMEM, and nfsd
turns it into nfserr_jukebox so the client retries for as long as the
folio stays at the limit.  Could do_splice_read() fall back to
copy_splice_read(), like it does for O_DIRECT and DAX?

backing_file_splice_read() runs capable() under ctx->cred.  overlayfs
lowers CAP_SYS_RESOURCE there, so root never gets the reserve, and fuse
passthrough uses the server's cred, so an unprivileged reader may.

5) Errors

The one condition comes out as SIGBUS, -ENOMEM, -EFAULT (tee, pipe to
pipe, MADV_POPULATE_READ, process_vm_readv), -EIO (/proc/pid/mem),
-EOVERFLOW (vm_insert_page) and -EINVAL (memfd_pin_folios,
fuse_dev_splice_write).  Nothing is logged or counted, so there is
nothing that points at the folio.

6) khugepaged, 1/5

try_collapse_pte_mapped_thp() clears the PTEs and drops their
references, and then do_set_pmd() can refuse, so the mapping is gone
although the collapse would have lowered the refcount.

7) Changelogs, comments, stable

- 3/5 doesn't say what goes wrong without it.  It is tagged for
  10ebac4f95e7 (v6.9) while 1, 2 and 5 go back to v4.8, so 6.6 and older
  get the limits without the flush, and it doesn't say why that is fine.
- 3/5 leaves the "queue is (now) full" comments in asm-generic/tlb.h and
  above __tlb_remove_folio_pages_size() stale.
- The ufolios_count fix in 4/5 doesn't depend on the rest of the series,
  so it could be its own patch for stable.
- 5/5 needs 1/5 and 4/5, which isn't stated for stable.
- After 5/5 the check is the only guard for pins on small folios, the
  kernel-doc calls it "mostly unnecessary" for them.  The comment in
  folio_maybe_dma_pinned() still describes the negative refcount scheme.

Thanks,

Josef

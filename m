Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5915349D4
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790085027; cv=none; b=trROC/p6/2j6AmxeGKkYfgpOM7I9Xu6yS4NiqrHFOiWys8TgIEUrQWo7h771uqhYs9ieWsOV1KGOBfblSdWoitcSk6ps4gFtCPnXZ/XxRYYXzf6n71cB6bwFheygn0OeoubTK9tICcUdQ+GMune7tvuKuq74+LtYve8XyLoKcg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790085027; c=relaxed/simple;
	bh=XBibOZPHW68W0g75OPHH2eBRodk0ZZkXmYVJz/0Vt7g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ChJYHQIxC76Ci5Fkr4vlyPfnZ4vpTic6tU0Fe1KFvcgWaFIURzLV+UDA3SMTghKZYzBcloedsn3uoZU+eFDA7D1Yf5Qqnto2lVUTNhLMgnH4DwsOg2f2u3ntlRwsesCTKhZWDO5nTBJ7HJPWKmy8imOj/2omjhET4DLk1LLCAA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=biQxqvgc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="biQxqvgc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d0726cdbcso2319855e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790085024; x=1790689824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zZ+5REgljKFAwNjfKUuVzdIQx4h6gyhbms3hAl/gWQs=;
        b=biQxqvgcGqbKWYpz8/f36woD2wbiFRmrkYhFd1ohj3Sr6MD+qhLj+rw3Pc8V9U6MHL
         ubSJbOZm2fGxRjok3wrM5f8s4Anedb6TXd5iXLiOCETql+pZF8UAPs3WbNFgR0kMFyFP
         EjOpLK2Y/sfV3H+2P8N8eY6GOTHWULCyXLiqAcVPWEzLhgo7DTrlhmbJgRkfbzgmG3DD
         EJTeHxfcbPD5HHwo8bSUJ4lO7LS1BCXO1vrQ3YzaG7s3kOkmjhGA1z5mEeKyDukRb9WL
         JTwH5YITqYF/ztDbjGUbEO2rcSVUr43EvWU3lYVfGpxepOGstu82hrE1Zj4t6aFokGul
         3egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790085024; x=1790689824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zZ+5REgljKFAwNjfKUuVzdIQx4h6gyhbms3hAl/gWQs=;
        b=iFIsZvJBHge0mkJE+rziH8UrtZwcdtm+CaBgouvshrAJW4ixf0XKoqwTLf9znF8edu
         WqmSRkUFgor+im5k4TPzGkfttfuznsG/0fU+ja2Hpn7GPY2QCBSJTX5INGW4R9nDHv4O
         RQSl9w3Tm6b6H4MbUguvN2/ipLqd/J5C3Z8CkLhi5PU4a50+Gvg3Fxf4SjzOGVJsjjgm
         nEeAOeFyrZeC+U9l8FHdZNwAEiRcFK1b2xRku0wYU+qW+9qD9gVmVO6+kgUO4F/MkwMP
         gB50Kpqe0djPIGVY0zsrfUANug1S5L4XH9Sm5wl3EkFHLjs2nwSOy4Had1ZElYqmE/e5
         kmUA==
X-Forwarded-Encrypted: i=1; AKwUvBzZD3Ig5hm9c0T7FLr8BEDMhdQbUiBkr+K4nrOYiCU4TyzRSAAas7jg5u5giEI3O/9kR+omHty7ZrTaHx0=@vger.kernel.org
X-Gm-Message-State: AFuF++kGOCDOA++Ck9564JrBtltevkeY432BkOrap1m0G64KaGwpzMtn
	4Ws9raKMnBiJ/G6YD1f2TzLuapQqJEiLcIvXv1K4C53NupXhef1i0WLe
X-Gm-Gg: AYBFou1X/7IMn/oY5wN0xYUYpE05wJoi08egrMrAPk35mSH2x2SD5hH//XIHF72VXeI
	kNkZZzEpNK3Gje3qAZ8hOgKfZmC4uPdzfmEPXfgC3OWZH114mIosOmFHZAam4KkhhU4tkMPA6ht
	HZYASL3ZstgJUnPAIQFMPEUs91NnzcSNDeDap9JcAypcDVeE7FHkB9/vUfmnE1/DoLkMIIVu5PW
	rAKKNxacUpmfYyAZC1t6GktactbVGw5un7I6ReC1o4Ozu0sEi+9x6vdGALBqTcMrIymE6kElWo/
	7Qti9Rh8xzdyoa661U0d17GNcBevNOzfKv+4ZxHQ4lQa1ZYO+3DKo04NWlsLXbYDSCkUmi20mn2
	ZPe21nw+oEBk0fo/bN52aJr3Fa13SMzRVaVDvnrR94pLt/fMKimCd7g377ec5mhoJTCnjKdU4Ph
	/jpEac8M1X4bLixliN42zO8kHYzlgRm1MkPemmr7ysTizCIfoHxPrIfoXfmN6BLOi3blIU8XnBf
	QN8TvuYm6weg9+LPVE=
X-Received: by 2002:a05:600c:83cd:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49fc7ddb90emr146359295e9.2.1790085023382;
        Tue, 22 Sep 2026 06:50:23 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa544e5sm42723515e9.1.2026.09.22.06.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 06:50:22 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: Milan Broz <gmazyland@gmail.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
Date: Tue, 22 Sep 2026 16:49:45 +0300
Message-Id: <20260922134945.667305-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <07e750dc-570b-4f69-9ec3-68de51416a06@gmail.com>
References: <20260922120330.127262-1-itai.handler@gmail.com> <07e750dc-570b-4f69-9ec3-68de51416a06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 22/09/2026 16:07, Milan Broz wrote:
> Could you please point me to at least one consumer-grade NVMe drive that
> supports a 64k sector size?

None that I know of, and none is needed - I think my cover letter invited
that reading, sorry.

The encryption sector size is dm-crypt's crypto chunking unit, not a
property required of the backing device. dm-crypt never validates it
against the device. The only use of bdev_logical_block_size() in the
target is

	sector_align = max(bdev_logical_block_size(cc->dev->bdev),
			   (unsigned)cc->sector_size);

in get_max_request_sectors(), which is request alignment, not a check.
A mapping whose encryption sector exceeds the drive's block size is
already the normal case - sector_size:4096 on a 512e drive is exactly
that.

The drive is also not where the gain comes from; see the last point.

> Allowing a bigger sector size in dm-crypt means you can end up with
> partial dm-crypt sector writes (after power fail), which opens another
> can of worms.

This is the objection I take most seriously, and you are right that it
is real.

It is not a new hazard though - it is the existing one scaled. The same
tearing is possible whenever the encryption sector exceeds the drive's
atomic unit, which is every sector_size:4096 mapping on a 512e drive.
cryptsetup already documents precisely this for --sector-size:

  "Note that using a sector size larger than the underlying storage
   device's physical sector size may result in data corruption during
   unexpected power failures.  A power failure during write operations
   may result in only partial completion of the encryption sector
   write, leaving encrypted data in an inconsistent state that cannot
   be properly decrypted."

What a larger sector changes is the width of the window, not its
existence, and only for a mapping that asks for it - the default stays
512 bytes.

For the common case the failure mode is also unchanged: with xts(aes)
each 16-byte block carries its own tweak, so a torn write leaves a
mixture of old and new plaintext at that granularity rather than
destroying the sector. The modes that would be worse are already
restricted - crypt_iv_lmk_ctr() and crypt_iv_tcw_ctr() reject anything
but 512 bytes. The exception I am aware of is the Elephant diffuser,
which does diffuse across the whole sector; it is reachable only by
hand-writing a table, since cryptsetup's BITLK support allows 512 and
4096 only, but I mention it rather than leave you to find it.

I would rather document this than leave it implicit. If the patch is
worth pursuing at all, I will add to
Documentation/admin-guide/device-mapper/dm-crypt.rst:

    An encryption sector larger than the atomic write unit of the
    underlying device can be torn by a power failure, leaving part of
    the sector written and part not. This is already possible with a
    4096 byte sector on a 512e device; a larger sector widens the
    window. Use one only where that is acceptable.

Reworded however you prefer.

> Your dm-verity argument does not apply here; it is a read-only target.

You are right, and I overreached. dm-verity shows only that PAGE_SIZE is
an accepted bound for how much data one target request may cover; it
says nothing about write atomicity, which is the part that matters here.
I will drop the comparison.

> Also, arguments based on cryptsetup/LUKS2 do not make much sense for
> kernel code. They must be compatible and work together, but dm-crypt
> can be used without any userspace validation, so all limits must be
> checked in the kernel.

Agreed, and that is what the patch does. The limit is enforced in
crypt_ctr_optional():

	cc->sector_size > DM_CRYPT_MAX_SECTOR_SIZE

with DM_CRYPT_MAX_SECTOR_SIZE = min(PAGE_SIZE, BLK_MAX_BLOCK_SIZE). It
needs no userspace cooperation: dmsetup and a raw ioctl are bound by it
exactly as cryptsetup is, and on a 4k-page kernel it is still 4096, so
nothing changes there at all.

The LUKS2 4k rule is a different kind of thing. It is a property of an
on-disk format the kernel knows nothing about, so it cannot be enforced
here and I am not proposing that it should be - it stays in cryptsetup,
untouched. I raised it only to answer the portability objection from the
v1 thread, not as an argument for kernel behaviour. Ondrej made the same
point back to me on the cryptsetup list earlier today, and he was right:

  https://lore.kernel.org/cryptsetup/d3823e0b-3387-4b3a-b5e8-a3d5f266308a@redhat.com/

> LUKS2 limits the sector size to 4k for multiplatform compatibility.

Yes, and nothing in this patch changes that.

> dm-crypt itself can support bigger sectors, but I just do not see much
> use for it with common NVMe drives or other storage.

Storage is not the use case - crypto offload is.

Where the cipher is a hardware engine driven over DMA, the per-request
cost is a descriptor setup and a round trip, and that cost dominates.
Making the request sixteen times larger amortises it. With the in-tree
qce driver on an arm64 64k-page board, plain dm-crypt over a ramdisk,
MB/s:

  sector_size   seq read   rand read   seq write   rand write
        4096        13.3        22.8        27.2         24
       65536       581         582         586          588

The ramdisk is deliberate - it keeps the storage out of the measurement,
because the storage is not what is being fixed.

That also answers the NVMe half of the question, and I should have made
it the main point rather than the ramdisk. A common consumer NVMe drive
delivers something in the region of 1-3 GB/s. Driving qce with a
4096-byte sector, dm-crypt manages 13-27 MB/s, so behind any such drive
the crypto engine is the limit rather than the drive, by about two
orders of magnitude. At 65536 bytes it reaches roughly 580 MB/s and the
engine is still the limit. The ramdisk figures are therefore a
reasonable predictor of what the same setup does on ordinary storage:
nothing unusual is being asked of the drive, only that the cipher is
offloaded to an engine reached over DMA. The drive can be entirely
common - it is the accelerator behind it that is currently being driven
inefficiently.

The other measurement in the cover letter is the NVMe one, and it is a
different board: an arm64 Cortex-A53, also 64k pages, but with the CPU
cipher xts-aes-ce over a Samsung 970 EVO. There the gain is 9-16%,
which matches your intuition - for a CPU cipher there is very little in
this, and the drive is not the limit either.

So I would put the case as: it is not about the drive at all. It is for
systems that have a crypto accelerator and a 64k page granule, where
dm-crypt currently leaves most of the engine's throughput unused - and
the storage behind them can be an entirely ordinary NVMe. If that is
still too narrow to justify the option, that is a fair conclusion to
reach, but it is the case I am asking about, and the numbers are with
an in-tree driver.

Thanks for taking the time on this.

Itai

Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8146351CF6A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167429; cv=none; b=vA6jZCUMkIM2HnYlZC/QZhC/wXOvmAxXSOiRCbIN6qw57sk8FEhgNi/inl+Fpimlx2MGTK6d+1iyevvzZJ7x7gICF4DDvEdrLm6u56AI/EXf3FE2Ud/cPJ4VXK9lhZ3T51hmcsJ5zIa+M70g9AnVBt3Mcd9dCcnOK97X/RgKdD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167429; c=relaxed/simple;
	bh=TVA04EV44Oj2OXp98xnYIpQ8NDcjxBWT9Zql/1cXkhk=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=l9IHHx+RdXYH22JqIubd/ajwfpsOoC86WjWi21UlUrW5jbVaXAYryVtFinkjy8MO+oSWBTR9UC/cuD7djaZzfAS4C6Lx9w66MNfLeU4Aoa570jzgS3pzqBBUJO5mts2TGxaWMJG5afpznJ9xTrb+D91/kXY1KDeBwo8Wy8AL61E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSv7T8oI; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSv7T8oI"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso305595e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790167426; x=1790772226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mPIC8JpwGyS02wRODpKkFe2yJaEF35AMEk5CxjzMb3g=;
        b=PSv7T8oIQ+BID2DGDRvZQb5qEUkbJhyfpP9KYQPP4ebP4IA6CN2wNoaQE+RNd1+4oc
         ycDsHCagPf61mcPCMgSyv11BczQ6CB0jGcx7HD0CDIN0x5HV7ntP9Wx3OtFqhNSh2R3n
         PsT9dGUBXecUwmhQamaPgorU1c2vnk/f0PbWJa00wxKW9fNFzNK6PIX5Bu0HTJhCkOyn
         xGbRqatGLnFFM9SeY/9+qkMWJW801HmTWCPmPLX2RdiSyTlAQRX+8Iu2fLRIHBUwnuRl
         ZioiOSfUXHPbI9d3bytQP2fPPdt1p6das64PBrlB7YEHKy7SHZrliwjPINfJxlGkxRl+
         TKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167426; x=1790772226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mPIC8JpwGyS02wRODpKkFe2yJaEF35AMEk5CxjzMb3g=;
        b=yEsLuJW3SnVkiBNC8LqcD6rhEcNfdgkRlhjxOT1unyqbiD/TT5XSZjX+m9mvihKBr1
         bahHCwGF7xwBXSYFRTPwlnwQNECd//KcxrJjv2GlUQbIZtLKqrK9Y4U53vYi9oUDAEJp
         /Zb3YEZ4h9DSJUY+Ph1yMEqxlRjfuohoOWtgrs/tM06yqs9u48E0YLbk20RzHtzrVx4j
         6uB+VqQGl7gO4cHkn7cGedFf1bqydJeMTHmZMr88Ikz0A8qQABQkh1i3yzfK7gl9BXuf
         nUrCYslhFeLxmCGKeLIyxE6uxtewGUhKrSmUOQ5SE1IoMH+DwzanWhy9cmXLkHZFSnW8
         cJDA==
X-Forwarded-Encrypted: i=1; AKwUvByl1GPuOPZuYTizfC0DgPw6yi2gaMvU0+AhpvA7VFQ/sG9/JYTPVYNhq5dRDaQ4LxcyLc7Ou5C51RioZKM=@vger.kernel.org
X-Gm-Message-State: AFuF++lCWgh1O6e+q0Y8UVXJAGr9NCcTCmBC7NcBkw0iYRc6VvPoP0uQ
	+dchytIzAavf0F9sy0TdOJ6DiNNUmouR6wtfyFf/NnHt0KE6GN8PccmA
X-Gm-Gg: AYBFou0n9e+SsXgxf2S58xdFSDiDCMPOgSWBnCzM1Lc79IX1zOy5pXBVs+OkxxxHPfP
	POaxbV6Sw/8ImcDKyibBjsvfSBU1h/y7GBKWaGwKFCh7WnwabvlfIhsWbwUkrACsDBBL2LtmRvN
	QfHkfWzYyOL30uxwPiihR/gh9KTsSFnjgJ4hfng+Yc/iMrZvZT5bSt5hzeZhSlQcGh5faU/YpN7
	WDggaxb/qpxrKGrS0LXL6T0unQDhGe9LMzYbt5aElkPo8oaJEuFeyy86d5sKKIeEa+oXf+r94vY
	CzL7br5VG+FVSuFwUgFCQqe7rv1X/qnSixzkLEqZc6X3DgtB4iohQXo/K/ruAzijnDQ2K8ylaV7
	2SAO+LmM76VmXjfeo1oE7ZvARK76Yh7T4GpIt8Y38Gz2jGIJTYpE+hSqrScnP9bNfNGi8I59E6e
	ek91idb/0RMcGieiasNYna6gvW9mqPkJFEol37jUVT5bJRdAb2Yxy0Gu4taKS1tzoikhgKlgp30
	SZ4TIrbrJn1tW1zQVk=
X-Received: by 2002:a05:600c:4fcc:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fdf13cf49mr34079185e9.2.1790167425362;
        Wed, 23 Sep 2026 05:43:45 -0700 (PDT)
Received: from L-P-ITAIH2-L-RF.rf.local ([193.169.70.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1893d5sm88986845e9.4.2026.09.23.05.43.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 05:43:44 -0700 (PDT)
From: Itai Handler <itai.handler@gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Milan Broz <gmazyland@gmail.com>,
	Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dm-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/1] dm-crypt: allow encryption sector size up to PAGE_SIZE
Date: Wed, 23 Sep 2026 15:43:17 +0300
Message-Id: <20260923124317.912154-1-itai.handler@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <947ecfba-353b-753e-53d1-30d894822401@redhat.com>
References: <20260922120330.127262-1-itai.handler@gmail.com> <9a6c20da-4da9-4a8d-a6d4-f18900228bf6@redhat.com> <947ecfba-353b-753e-53d1-30d894822401@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 23 Sep 2026, Mikulas Patocka wrote:
> I did some benchmarking some times ago - and all the SSDs that I tested
> had worse IOPS for sub-4k writes than for 4k-aligned writes. This means
> that the SSDs have 4k sectors internally and do read-modify-write cycle
> for sub-4k writes.
>
> The SSDs have remapping table that maps logical blocks to locations in the
> flash chips - and RAM is expensive, so I doubt that any SSD vendor would
> put 8 times more RAM on the SSD in order to map 512-byte sectors
> individually.

I accept the measurement and what you conclude from it about the mapping
table. A drive that is slower for sub-4k writes is doing
read-modify-write, and a 4k mapping granularity is the obvious reason.

What I do not think follows is that a 4k write is therefore atomic
across a power failure. Those are two different properties:

 - the mapping granularity determines how much has to be rewritten for a
   partial update, which is what the IOPS measurement shows;

 - atomicity across power loss depends on whether the commit is
   all-or-nothing - whether the NAND program can be interrupted part way
   through a page, and whether the mapping update itself survives.
   Without power-loss protection there is nothing holding either up, and
   consumer drives do not have it.

That is what AWUPF and NAWUPF exist to express, and it is why the value
is advertised separately rather than derived from the geometry.

The kernel takes that position too, and more firmly than I had been
arguing. nvme_configure_atomic_write() accepts only NAWUPF, explicitly
ignores controller-level AWUPF, and where neither is advertised falls
back to a single logical block. Then in nvme_update_disk_info():

	/*
	 * Linux filesystems assume writing a single physical block is
	 * an atomic operation. Hence limit the physical block size to the
	 * value of the Atomic Write Unit Power Fail parameter.
	 */
	lim->logical_block_size = bs;
	lim->physical_block_size = min(phys_bs, atomic_bs);

So the block layer will not even report a 4096-byte physical block
unless the drive advertised that it can write 4096 bytes atomically,
specifically so that nothing above it draws the conclusion we are being
asked to draw here. On the drive in front of me that yields
physical_block_size = 512 - the kernel declining to infer atomicity from
geometry, rather than the drive being unusual.

The empirical work agrees: the FAST'13 power-fault study found shorn
writes - partial writes inside a single page - along with metadata
corruption and worse, on most of the consumer devices tested. Whatever
the mapping granularity was on those drives, 4k writes were not atomic
on them.

So my difficulty is not that 4096 is too small a limit. It is that 4096
is not a boundary between safe and unsafe: below it there is no
guarantee either, unless the drive advertises one, and few do.

What this patch does, and does not do
-------------------------------------

It raises the maximum sector size. It does not change what any cipher
mode does when a sector is torn, and it does not make a torn sector
possible where it was not possible before - a 4096-byte sector on a
drive that advertises no atomic write unit already spans eight of them.

What a tear costs, in full, so that nothing here is hidden:

  XTS, ECB     each cipher block is independent, so the sector decrypts
               to a mixture of old and new plaintext - what a torn write
               gives on an unencrypted device
  CBC          P_i = D(C_i) ^ C_(i-1), so exactly one block, the one
               whose predecessor is on the other side of the tear,
               decrypts to garbage; the rest is old or new data
  AEAD         authentication fails and the read returns an error rather
               than data
  diffusers    the whole sector decrypts to garbage; in practice only
               reachable by writing a table by hand, since BITLK uses
               512 or 4096

A sector whose write was not atomic is lost data in all of these. The
filesystem above cannot rely on a partially written block whatever comes
back from it. The cipher mode decides what the loss looks like - stale
data, one corrupt block, or an I/O error - not whether the data
survived, because it did not.

So I would rather document it than refuse configurations, in
Documentation/admin-guide/device-mapper/dm-crypt.rst:

    An encryption sector larger than the unit the underlying device
    writes atomically can be torn by a power failure, leaving part of
    the sector written and part not. Unless the device advertises an
    atomic write unit, that unit is a single logical block, so this is
    already possible at 4096 bytes; a larger sector widens the window.
    With XTS and ECB the torn sector decrypts to a mixture of old and
    new data, as a torn write does on an unencrypted device. With
    chaining modes the block at the tear also decrypts to garbage, and
    with the wide-block diffusers the whole sector does. Use a large
    sector only where losing a sector to a power failure is acceptable.

Reworded however you like, and I will put it in v3.

If enforcement is wanted later, the version worth having is a comparison
against what the device advertises rather than against a constant:
refuse a sector larger than queue_atomic_write_unit_max_bytes() for
modes that cannot absorb a tear. That cannot land as it stands, because
with NAWUPF unset it would also refuse 4096 and break existing tables,
so it needs a deprecation path rather than a one-line check. You enabled
DM_TARGET_ATOMIC_WRITES for dm-crypt last year, so the plumbing is
there, and I am happy to work on it separately.

Hardcoding 4096 seems to me to give up the guarantee the block layer is
careful not to give, while looking like it provides one - and to do it
for a combination almost nobody uses, since cryptsetup has defaulted to
xts-plain64 for plain mode, LUKS1 and LUKS2 for years.

I realise I am pushing back on a maintainer here, and I will not keep
doing it indefinitely. But I would rather make the case once, properly,
than change the patch while believing the line is drawn in the wrong
place.

v3 will carry the documentation above and the two changes I already owe
this thread: dropping the dm-verity comparison, which does not apply to
a writable target as Milan pointed out, and dropping QCE as the stated
motivation, which Eric was right about.

Thanks,
Itai

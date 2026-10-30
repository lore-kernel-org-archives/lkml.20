Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371110;
	b=eAOoo5vTYR55jxsdlz3SVmnAk0OJa4c3Xkj/Y+b3EyEBAXHpmwyVJLH39bQfsVkbZ+rC
	 42IzBUZlm9cT8BmC0e/2YoZvEFLc2/7PMkUTybWZju33oy9Av7C1Y45Na09uXV6gs648c
	 bgc7sklrGl6alTLXUoF8H6I/rq7f3Gzlm6IiDdcMI0yVYYZd0kH7U98T4pGUyi7BD/gSc
	 Vz2ln/JF5FKDzwoOzGkUwqnHoXxN1TzNrpNabX0PWM/MeSIrz8nAZQCmtL+Ox5um2UNtK
	 XJolkTyoindQHKhFvY5JLN20M8Gdpyg699EBHs9W8GEcY0UVnLgG+F+wL2/0x4k2VIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Lw2XTa0UHLp5uC9FUZa5RGPGrr4tiBPXeAThucLJkgo=;
	b=eOrvcpgUu7PLCFbvvc5G1aPD0kNAr5imAOhV29UrSYgE/a5mD59ZRJei2UWmlM/0QMFx
	 Mj7ioZyvQZAKihdxJKoGjPWsOQm6BQTHZABg78Hxk4Jacr98uw/3TbTKH/MAl3L4dyqC0
	 j/2nKaQasRpslM3XopbBCbern7xd1jqu91Bj/h3prErjzeBk6GD6vbWFm/JxcjXOcwUrO
	 55ypasMwOdelNle8ZQhJpgJrIYusBZDwsuuf7v6jVAtjLKC+A2qUsVECdlU8gjCVo8GRY
	 umJ8FoK7TznSAUTUMbPaUKfLZqAJhLNrVsKbnwGg+uy/OhIrOf+6J2LQx4AjkHEflpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=f4Oxqytp;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08BB606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A08BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=f4Oxqytp
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-93f3c616c84so66881685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793371108; x=1793975908; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lw2XTa0UHLp5uC9FUZa5RGPGrr4tiBPXeAThucLJkgo=;
        b=f4Oxqytp3QWZ8rkKm7Zakqilbipdp4cRSVRQyeZ7T/X+ekYhph4OPeKmzKK9hJADW7
         Mk9LhZfE8Vk0i9cVnh0j0qE14D7+07VEfzkYULnm6heiFkQl8aYPsGi5PMpNAJedwGKs
         I+EhFx8t61+b6IJQgrmOvGEigVJTlyTdl0XsFLDDq+hA8Ihf6kgq2mdch5nQkNRmI67x
         WAGZKLneKwbs3xuXEJR2nSPOJ0pZcO415sO3O/z8jKYCc6eNh2MEZ8aH4CnUfgOb3Qwu
         kKCgMEq9k0RlqD+5zX1zkIyYK6caNXNIw8N0t8xyjTHdLR9E8Af9uEHrKXRnPLrYrmB0
         FP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371108; x=1793975908;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Lw2XTa0UHLp5uC9FUZa5RGPGrr4tiBPXeAThucLJkgo=;
        b=G+QhLpoAcsBs+wTpLYZ2CQyW61iQGURKOHD0F3Xmq7xHKhoNYGSUO7CQptaWqB6BtD
         lFNSz44zmVrm3EPET/2EJ2yAiq9VAWVf6EvnVBXO/RBm4AL3Ja84pSBU/iehrYJ+hVtg
         iGrwgAwCD3bnBVHT7t03hD+9vbBalL/xrRqjxxtLMQkYH6cHSZaddk59QxcL44QlK71c
         CRUhKAUdO+eLq31yHrAf2X4EasUQo5Y9OI3N7Fh37DAaHyUVtsGcbfzw9VdSTqHEeNjt
         WcZJ+TPumefxRhmKNiPIHYlc9ZM5RABfjDTWAJY2fCUgUiY4K9ogxqlOc7tJwcr3+lXX
         KIrg==
X-Forwarded-Encrypted: i=1; AKwUvBxY9zNrknAobpcBmS0Iq4j8Bnoc3E4iWiSp8gyhDKdsmjv+P/k4cR1pphyhUxzGh5Fv2LDbpFvO1Vhcc0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWOwsDaELzMsFc7L66Y+SjtsDhLIRGos84WG98vsa50kn7Eqzn
	EGYs6jmaJ9u2e7C3ohkIBng7kETp0pkX9iOZyhNvDrOjKgeQA4zwWIhDlbZPNUnx2KNlLG6t6j0
	2hGZd7hc=
X-Gm-Gg: AYBFou018Ve6Dl3KEckaukWPmrUYgscqNQRB4WRZmlHJ77WUWMMK9FIGuCs5UndB6Th
	d3IWamEFLM9w8UWdYQwHf5Mb9AdKuR1WbPj+ewiSgNe/6McdxuLyp5DfKF7VjCqVlJ94cTO8ByM
	2KF3pQuXsNIbWUhNaEsjZUUHrfw1ubAxRzKtoKyU4WDw6XFlMD+32maibDMxj2hyt10wOWF11xg
	eL2RLbucFs4ODRBqygMnKwNmUHh4oFGmc1Yevxr06bQy7dkwonl24BQJhkoaJJenz2VxXHL1FT6
	7agLF64sLRL0jmTr4Vb97PctTNZ0H2AKFo/iPVV5aHVej9HkcOdITxraf0hrHzInCWKIdw1AkVQ
	kBxMeJ6repOlZ32WuV3OGCxZUogOKDJHcLZaEAHdRSakQppGxD52KZ9X/ZDx/o4pY1Q0RXXvTUQ
	Qs2muTD9dKjnR5RobAyGeFN+pp3wUageErGrR5Y9kf+O+rgRp7tIZSKKDONFUv7INcTcVyk+1DN
	e4IAL9KQgIao/9NaMcepqjsIce4q2Jgzw0ejYHTiIWpeCTlex1WxJfwLhgMXWiBGxUtEladtfcJ
	sUT3Jno0hNGga8cfo3G1WYf3+BFLpr62x7OrHhMzDbl9
X-Received: by 2002:a05:620a:8907:b0:939:6de6:9518 with SMTP id af79cd13be357-944216ed973mr439727385a.47.1793371108304;
        Fri, 30 Oct 2026 07:38:28 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425ac6bddsm155612385a.37.2026.10.30.07.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:38:27 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Subject: [PATCH 0/5] btrfs: data integrity fixes
Date: Fri, 30 Oct 2026 14:38:06 +0000
Message-Id: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM+r5GoC/yWMQQ6CMBBFr0Jm7YRSRKJXMS46MIUxppBpNRjC3
 aW4fD//vRUiq3CEW7GC8keiTGGH6lRAN7owMEq/M1hjL5WxV6QzUlIfsXfJoYTEg0r6IlPb1NS
 0tTEedntW9rIc5fvjz/FNT+5SzuUHuchI6kI35uk1l0e49JNi4CXBtv0AMY9XBZ8AAAA=
X-Change-ID: 20261029-b4-btrfs-data-integrity-eb753b57300f
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793371105; l=2635;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=YMEJ1FGA0t74fOXTrNLI1MmSNUL5joiB2lJWMWavJzo=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QB4FPscSuuXStZNYYoP94AQtart+lZVJkTi0PEYHBO5lthR/+x60yAWTI5WRWLxqncxocpaCo8K
 2txIaK+CpUgQ=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Hello,

I've been doing some model checking of our trickier paths with Claude's
help, and these are the fixes for the bugs it turned up that actually
lose data, or tell userspace that something is safe when it isn't.
Every one of them was reproduced in a VM on an unpatched kernel and goes
away with the fix, though the fsync and log sync ones needed a delay
injected to hit the window.

The worst one is the fstrim one.  If you run fstrim while a device
replace is running we'll discard everything that has already been copied
to the target device, because the target's alloc_state is empty until
the replace finishes, so the whole device looks unallocated.  The
replace then finishes happily, the source device goes away, and you're
left with zeroes where your metadata used to be.  This has been around
since FITRIM learned to trim unallocated space back in 4.3.

The split bio one is similarly nasty.  If the last piece of a split bio
to complete is one of the split bios and it failed, we drop the error on
the floor, and a buffered read returns success with whatever was sitting
in the page.

The rest are in our error handling.  A delalloc failure in the middle of
a folio leaves blocks dirty that no longer have an ordered extent, a
fast fsync after an error that happened before we submitted the bio can
log extents that were never written (which log replay then happily puts
in place of the data that was there before), and btrfs_sync_log() can
return success for a log transaction that never got committed.

I have a cleanup series for btrfs_sync_log coming, as I had to spend a
lot of time grokking that fix, which is a good indication that the code
is too complicated.

They're all independent of each other and tagged for stable.  This is
against for-next, and it also applies cleanly on top of Qu's
extent-by-extent writeback series.  Thanks,

Josef

---
Josef Bacik (5):
      btrfs: don't drop the error of the last split bio
      btrfs: clear dirty blocks after a delalloc failure
      btrfs: make fsync wait after pre-submission errors
      btrfs: don't report success for a skipped log sync
      btrfs: don't trim the target of a device replace

 fs/btrfs/bio.c          |  9 ++++---
 fs/btrfs/extent-tree.c  |  8 +++++++
 fs/btrfs/extent_io.c    | 10 ++++++++
 fs/btrfs/ordered-data.c | 62 ++++++++++++++++++++++++-------------------------
 fs/btrfs/tree-log.c     | 20 ++++++++++++++--
 5 files changed, 73 insertions(+), 36 deletions(-)
---
base-commit: 2789b2c034d7c0c8687355921a38c5ac41a565fa
change-id: 20261029-b4-btrfs-data-integrity-eb753b57300f


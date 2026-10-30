Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371111;
	b=rcwNo+f3805SFJaqIHXqIT1Y91obwviwOHYCZvd9Onw8YIiH7IE3zzZ0a/YA0d7Snutd
	 xK2uQEsazIShEVnvYpzE8QDROmGQRfqIFM0OZbeVXIdju67GbpRB5AqhyDXjSNUGastuP
	 SySeWeoqOq96uGyAAjhMHOcn2gF7lvTHHXbJA78iGo/AMYwmEaapJQ6B26wzzV6ffFvCG
	 2h7PE391n+3XMa+b22RlwYM9AsFws4lQeFHQHQfUmQDY1Z2VWxhDF3bGx26BoX/2PQozO
	 V6VbUMdqoTrGV6fxZkIwr3pXj00oah9O3oEw8bYjgPxgskEk6brhwRL/GwPwl1vk3Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=svrb2Ovlj0yJHbneNxyZJOFBp3J2HRz8F07mnxmRiT8=;
	b=ypbEak1fPD88+n7eWjfmNOvsDbPS7XurW5x4TDEKmpxba40hEEwk1QF8PgXLtm8ruR0E
	 4idscnpBa2udsuLqUi4anmqpuAcTuFTErEA9g6/yuUCwOWu600UVCAYQ6iM/Qd89yX8w6
	 ERbYQS0lRdfkyzeF+7KWIYHSLfoBMASyE6FSHM9DMJIl4NaQZ+sAWHG4cPVrnOZC9SYaz
	 oaHJpNVUdj76BWuZady0YCLEaiVEWDyzVcRNsKWEEgROBrxzMMd0wg/6vWLfnWf+dJhD+
	 6ZOvzoJ/R8zGfnq7rzgaVg1TSQpkAqOZOEG6PboEIrABD86lJa0NQT0bhTIuPlfw1Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hZb28tvK;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEFE606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DEFE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hZb28tvK
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d91601bdso15800587b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793371110; x=1793975910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svrb2Ovlj0yJHbneNxyZJOFBp3J2HRz8F07mnxmRiT8=;
        b=hZb28tvKRR6cl9V93+0tJAYmeXLuyLl/xVRol1Gm1vofmx/hG6cAzBvpQnttdQ+0YR
         itKhY/9gi7+7cVMP70or13FZrlnvxE+0Y/JsajNsJ9VDn9v26gw3JCH1D3CItG9/uBw6
         RzfEKn51x0A8zUBy6oloYgfZddZ8Bddc6ZW/r9mRxjDsnx1yfzrae9hgRsbYrttIDm1u
         2xJewnH3stPnIKtzhBM/4+8KlRFTiEWxjPCjsEl0p60WssOOzt5iIhgLtIHPLyv85vef
         RY9+XY0YsfIGLfuQXP35CIghBDDzFshLG306sPe1VYSoxFzFvXCWCBdaan4FzHWR5/S3
         LD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371110; x=1793975910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svrb2Ovlj0yJHbneNxyZJOFBp3J2HRz8F07mnxmRiT8=;
        b=A8Fgi5beu2hjACrpdkkDN/tQ1QlPl0PZW/EyzmqC44pLHu4QsALGkTSH+NjSzxzHQz
         3Z2GFzqO4ZP5WZToynia1OYiQpBdl/bIM8ASGT8iDN83Aq2bvII7g5Tc582ChmFqw/Hf
         cFkd767wBGWKW9sZ2cBHysyBeXFMc+oYlf/tsMqj3oS8r2I1mlC2YAVK1huk9vTobk9T
         NKw2e+5ioKQn212tb5Onbhi3Phfm49sbXozGojvb1jXB9HiBey2hY9Zq3ALV9apvRmV9
         cAJzWhzUcEhLp6OP46t8PLoiob4JV/tkta9Jxrdbg4SNJOxH/wNAiF9w8rKlOvL9j9PV
         EJpQ==
X-Forwarded-Encrypted: i=1; AKwUvBx4Tgv0mSHSDBBNCHN7ACO92CYwsRTkV6S8BpzE5c3eb4noXGO+A0xiYCpj1+rMIB5xFZcAMXtsJXQJK1A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMHLk1XqG5hPS/kvlrMPSlHTPh/O/X6yTY0djJu120fVThNgee
	eefm28VcrBcsBKgNTY1Ovb+Efi0L5RZt+dO5LOxmOSJJAFXZFCaKqgkV3MBQMEhfsmpoJzqvnfy
	8B6KV3rw=
X-Gm-Gg: AYBFou1NqS0HlbnOnnw+e3B9/EeiA+5qhzLgHsM9SyPskU8Kb6z1MEubVSCncItBCSB
	x8Cz7DYfEkBW6LVFkrBy8KMgcx8DeIa/XPtWgtKfdI1SVU9A3tdoumlowBAYMIeXgNlIW12cT/X
	GHoFK54m2yiHKmukGU8O6sN2hRZRs5TVvqi+Sh5bRAq35Tjnx925UxCERh12TWPEycGIi339r3/
	WofwV/ieArPR3dmHz6TFNCMdbq0Ag7VQ/NbeXAUzBwz0Xqcr3qAn5UOJTjFOe0L2Zpf8LBIbw6X
	XInU/LU3VvaXo7k1dQpZT0piaJg2h+1ejseHyoLr+wCSXpJ7L2ySTdk8HXZ1sypAuK4V1NowhDd
	9F7D66c1oer0ENnvKD6CK0RJ9MTgcVveQftnppoa96fTs4p7C+H2LlrwXN3+ZqigY1BUwg/yapK
	8Qs0aw57sGY4PwmvMmn5IRkRgncgsOhEEr6I37cFpK5jr871BAqj3KFDdDvozl6tVSFGkFIoQTy
	OBTKxHCstemQNOekel1RKEiI3lZGFvE07l18n0sYORUxdixcKskoIws3LRayoswcC3sGG/nFnx5
	b5cGnDk+18yODdn8L3OgThiYqyLfRSU7m7fu3kC1OG64RA==
X-Received: by 2002:a05:690c:f90:b0:8ab:3b98:5a30 with SMTP id 00721157ae682-8b1c68babdfmr41034207b3.33.1793371110218;
        Fri, 30 Oct 2026 07:38:30 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b71b1a86sm9302517b3.34.2026.10.30.07.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:38:29 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 30 Oct 2026 14:38:07 +0000
Subject: [PATCH 1/5] btrfs: don't drop the error of the last split bio
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
Message-Id: <20261030-b4-btrfs-data-integrity-v1-1-f4d4196731e6@toxicpanda.com>
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793371105; l=3090;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=5fTqv4D1XfwVMApfc8X7gztAHmSU+m4SW/zWWSbLN8Q=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QKkbgXuIZdSjhxW2/O97ejXE0U43m+1JWTRbONQ3FEN6V+l+jKWXmMGwHngN3ZlBmbC16fXaXir
 W9cFGc8sXTAE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

When a btrfs_bio had to be split, btrfs_bio_end_io() saves the first error
of any of its parts in the status field of the original btrfs_bio. The
part that completes last is supposed to load it into bi_status of the
original bio before calling the end_io handler, but that is only done if
that last part was successful:

	if (atomic_dec_and_test(&bbio->pending_ios)) {
		/* Load split bio's error which might be set above. */
		if (status == BLK_STS_OK)
			bbio->bio.bi_status = READ_ONCE(bbio->status);

If the last part failed, the assumption is that bi_status was set at the
top of the function. That is true if the last part is what is left of the
original bio. If it is a split bio, the assignment was done to the split
bio, which was freed right after. If the original bio has completed before
without an error, its bi_status is BLK_STS_OK and stays like that:

  original bio (tail)                 split bio (head)

  btrfs_bio_end_io(orig, OK)
    orig->bio.bi_status = OK
    pending_ios 2 -> 1
                                      btrfs_bio_end_io(split, IOERR)
                                        split->bio.bi_status = IOERR
                                        bio_put(split)
                                        cmpxchg(&orig->status, OK, IOERR)
                                        pending_ios 1 -> 0
                                        orig->end_io(), bi_status is OK

The end_io handler covers the whole range, so for a buffered read all the
folios are marked uptodate, including the ones that were never filled, and
read(2) returns their content instead of -EIO. For a write the ordered
extent is completed as if all the data had reached the device.

This can be reproduced with raid0 data on two devices, one of them slower
than the other and with a bad block, by reading a file whose last stripe
is on the fast device.

The saved status has the first error of all the parts, or BLK_STS_OK if
there was none, so always use it.

Fixes: d48e1dea3931 ("btrfs: fix error propagation of split bios")
CC: stable@vger.kernel.org # 6.12+
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/bio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
index 2c6234f6182f..fc0b021cdefb 100644
--- a/fs/btrfs/bio.c
+++ b/fs/btrfs/bio.c
@@ -127,9 +127,12 @@ void btrfs_bio_end_io(struct btrfs_bio *bbio, blk_status_t status)
 		cmpxchg(&bbio->status, BLK_STS_OK, status);
 
 	if (atomic_dec_and_test(&bbio->pending_ios)) {
-		/* Load split bio's error which might be set above. */
-		if (status == BLK_STS_OK)
-			bbio->bio.bi_status = READ_ONCE(bbio->status);
+		/*
+		 * Load the first error, if any. It may come from a split bio,
+		 * including the one we were called for, in which case nothing
+		 * stored it in the original bio yet.
+		 */
+		bbio->bio.bi_status = READ_ONCE(bbio->status);
 
 		if (bbio_has_ordered_extent(bbio)) {
 			struct btrfs_ordered_extent *ordered = bbio->ordered;

-- 
2.55.0


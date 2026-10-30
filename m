Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793371114;
	b=TOi+YfwoGHGf6H+ZnGa1CyVrkCn77bMmjP+PH1FHhxVVbUbXdp8w4KwNF+h4P8ZNZvpP
	 AbdxNCTiUcFok5DN2hsQ4l9QloK+F9w65rGKoo/eRlpjllUky5L9HsBAgBoFlMfcDTby/
	 bd8s8clRMIviVswsaAwkySFOMU0b4PXNiT+I6w8bbSScMDzMDk+i1l9MiaK4crUmv9FLF
	 LF6r7keZuadZbHSIclPiHPkjNfyq92gCqkJ3y1OtPLfs8LcxM9IpYXwH/Irjcynz0MI4M
	 TaQ4+uFIxMNuCEFf00N5k0aiykGKvIMtPSPJrjH1Vks937YSOy77S9USlXuWfxtP7kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793371114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=uijyyS7B6BlVTQtygDcyY+FtQHZLs86F0bsQdXQ/QrY=;
	b=yxT/HkF+b/YtVOomOKnHUxurrzUka0tHAo0QVYt4unyYcyEuUzl0QP/vxC6qGWzCrTIe
	 8Gfhu9NK+ERItfPnv1/yXFWP4z/hXh11xe6ykvu4D97WOwEX18WNYnWpS6OBlQy86y5C2
	 KVMlWX1uObWCrS9SaACn1WfufRIeuq5T7kLC86+GGC8LWE0EGs0xHgUMJ3cu/ziHy56vf
	 76z9y+QZwuqBAbi911gf/Nq2D43E8jig7w63hZKPDk4FLNcVF3QTe4XAiOAu7yGFF2ovI
	 vfpwXnAigdIBkbkSkI7U4KSa6xv9dUHWdPBtQvxwbq0PF4A5UxM1ExIfJwoQ0OfU/iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=DeS7qnFj;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEE560A2609
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BEE560A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=DeS7qnFj
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b118bea471so4056437b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793371113; x=1793975913; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uijyyS7B6BlVTQtygDcyY+FtQHZLs86F0bsQdXQ/QrY=;
        b=DeS7qnFjvnuAjNSA3PzgtziXAEctOSqvbMwz+xCurjTOkaPC3sUGSZvQ/urqwhywqD
         2VhYdQKl3Quez7b46AavWxbRdSJW08KlfYJ5fL7s186wE6vVAc7KWlTbuMyN9x0+nZ8C
         ZeBPIJAdlXng05kaWagOULrfi9aBui10Nt9yvXAAKV1JwpD3F4TdvCL920cKXGtq4fL6
         No7NQ2Qm9hx/5auZbrAEgCvvIpYYhrjYlwVUcX6xngsCB8N39qBx7sVA1rTL+NydlLIF
         +xENz34FY0lUjczH8DtiAWJSO7kQFAV85MXjob/cHyeMCdHyCVlpPkfzLRfLzh+2cunO
         UCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793371113; x=1793975913;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uijyyS7B6BlVTQtygDcyY+FtQHZLs86F0bsQdXQ/QrY=;
        b=SHftEai9L6tRe5z2C8lVYrPavPGSagPJwzdy3T3VD3AJkv6Uc+dL64ysLn0z7vRgnR
         BxNYChc/APDGwiEcY329LtGULvL+gwNKDl8srqh0uchhFfIK056rrXbMY5EMi0Ap80gE
         ZY5121u5mpVsEnFFhmeTH3q3QLKbeKe0dHYeQXlDye+iBz/W1UhBjD++C0MM1fxQ8BlU
         qyQC6k44x/7XvF0ZfETUPssuHjxJ3CH7EIXSEmZKKWM6Wu8VIowkja38qSY4wXu33uEt
         QBhspXANyXKN67jCXFQt3KwVNBPKJ/UXCvN2ECSobxKBUcyLDY4OO4Bd1Xj1eOBhdzDT
         9+bQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUwRxsezonR6HRO/gJbX8n4/81dS8XeUBIEpmzJCQQJkwS76WZBfiZ0Z/a+YBPdmKAb2cMEBPnmSX1xV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIZokS+bq60QbgnxZe35YhjoyMWzwscVHqmTZSjKA4zSNa9AN5v
	XCxqGuN37g68J8ZwVpWYYtJM6HzIeEYAPNrv6r89C0L9waYKZFlgwdxORcUqybuME8SSJlrzfSR
	kg1adjtE=
X-Gm-Gg: AYBFou1qBn7PIJ8k81rSBMuLLu9xf8eVYFDtEaiYzcxuSbt599DYUqFbSkrxWRMOYXr
	eQL8CMPR4wjS/QMgBMx1pmuQ7enWQUxmVMkgsK+L0ia0gqbpTIczN6Z171nAzAzWJUPgBuKB//p
	Cweje86twcm2RV+DLd/nWEBLazKhkxViojHfm3J8bDsJd5K2VbaJmbkgjaE3qBQ7FFXbJYw+f40
	Hmbc0xsEbAdAcQNVk4Mbe8Et5uwX+11EFIbVYo3TUp2xvvvSy1em2Edbn/AyrRSVlJGmV6Jy9kU
	lAINsBCI0owmJp407e5W+vuNYntwl30lsu0hWvFosJvm37TvUCediLsggH3OOboMynzr9Goqrd/
	jl6fj4IMEQnWghB+U4/twTWJGUQoWuhtn1ptm1KbEAZ97hXWdAysX53fEHxM5LGApnj50XsZNv3
	y6t1Tql1aD1PbaKJo3tgBDsYoCoiylukQHEI7sf2Eoz8AWQ29ZLVX07FU9yzUYPMMNOzALE0h0b
	zMGY9UYWcPnoplR2j0rV+avbLTwHnd/KJPmBnMX0L1okYkZ8hsL3927AAd+gobkk6qFwnPPpE30
	Du39ylmd7NkaIVK5bsBsd7LQqer8hnNb8B84jhyyf90jfsVyogMMuIEB5m2uINpWtCg=
X-Received: by 2002:a05:690c:6e84:b0:8b1:80a7:4e8e with SMTP id 00721157ae682-8b2b66d0310mr14625327b3.20.1793371112701;
        Fri, 30 Oct 2026 07:38:32 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.240])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b7164f26sm9267787b3.28.2026.10.30.07.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:38:31 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Fri, 30 Oct 2026 14:38:08 +0000
Subject: [PATCH 2/5] btrfs: clear dirty blocks after a delalloc failure
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
Message-Id: <20261030-b4-btrfs-data-integrity-v1-2-f4d4196731e6@toxicpanda.com>
References: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
In-Reply-To: <20261030-b4-btrfs-data-integrity-v1-0-f4d4196731e6@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793371105; l=1782;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=jGe3+Mz8n4IYsLPfk+8VaXdP8LPMIUyVQIGydHc/Anc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QJrag5Yibv5z+IVOs3PrUrV+Y0WHH6LUiP5R8fDYQSVRLsntJtXU8zRxF0cTFrsc2MqpWwTcZo5
 qrc2uDMKFjw8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

If writepage_delalloc() runs the first delalloc ranges of a folio and
then btrfs_run_delalloc_range() fails, the blocks that already got an
ordered extent are finished with an error through
btrfs_mark_ordered_io_finished(), but their dirty bits are left set. The
next writeback then submits blocks whose ordered extent is gone, or is
about to be completed a second time.

Fix by clearing the dirty bits and cycling the writeback state for those
blocks, as submit_write_sector() does for a block it fails to submit.

Fixes: 72dad8e377af ("btrfs: fix double accounting race when btrfs_run_delalloc_range() failed")
CC: stable@vger.kernel.org # 6.14+
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/extent_io.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 5ff630630490..3283835ccb5e 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -1746,6 +1746,16 @@ static noinline_for_stack int writepage_delalloc(struct btrfs_inode *inode,
 			u64 start = page_start + (start_bit << fs_info->sectorsize_bits);
 			u32 len = (end_bit - start_bit) << fs_info->sectorsize_bits;
 
+			/*
+			 * The blocks are not going to be submitted, so they
+			 * must not stay dirty. Otherwise they are written back
+			 * later without an ordered extent, or worse, with this
+			 * one if it is still around, and invalidating the folio
+			 * would account for them again.
+			 */
+			btrfs_folio_clear_dirty(fs_info, folio, start, len);
+			btrfs_folio_set_writeback(fs_info, folio, start, len);
+			btrfs_folio_clear_writeback(fs_info, folio, start, len);
 			btrfs_mark_ordered_io_finished(inode, start, len, false);
 		}
 		return ret;

-- 
2.55.0


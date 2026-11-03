Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718355;
	b=HtDH0L/cJL6ChALh7QMCmSVTpVeS8I/JGvXAx2B/zsEohbKwkj7VVwpGxkarDmPRYlpR
	 C2xDyskQ3/AZWAUomC9P1amUrU71zXioW6f0bZKwsopVc076vwj6urPDlXieixqCjLMza
	 O8FTqY0+DJ96JTnESaoWbphXo98BLxC0qqIPdFz2M80JygZvKDebRK3gjH3zRt0eyh7MP
	 x1k28quseKyDx8dEYdWOzeUMXQGD11ijdE5MDq2Nh1p/Sn/3VtFKhg6lOfmnavupqbqWy
	 V8emsaOAX6Kx7+wzAO98+N2Eimbu0JyhE7KdUaMK90UPSsiS8k/fzbw/jTSJdvqvXEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718355;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BMIpvaUrTkzS2mLvR1oTx4fUSr+gBEDFy7+nNYxbwz0=;
	b=Ipi3zGw4s7z9oh9SMjV6qVgyuwVBbAJyDvGr2g8nyi7socCWpjO21SlvxObM8zWvd+HJ
	 Gd2rICj+L2YSNZkxhblKZsdvNRAxFp2MWupYlT50ALu3xE5O/pPYbcNUUpQ8LJQ06g+Lk
	 4HnHWgy9gx+kgPpE25MEQ7r5Hh211MEpCCtp8jFRHtDhaWi7UxdyADILyQhn/P874hJNl
	 UlV4351tdxcOE4gyjVYYAosL33YJ5BQZjUY5PwBx1coJCL+2J4AU71Jn9motzONvG2zzt
	 SSWJuv2910C3aNKngS5O2t1Hv4W+sQ64Uic40DswG0To+xY+TbEmT7a5tB5byZtcIsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Vn7WtqZt;
	arc=none smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7DC606A782
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:05:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B7DC606A782
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Vn7WtqZt
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7ccb2ffe333so2588889137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793718354; x=1794323154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BMIpvaUrTkzS2mLvR1oTx4fUSr+gBEDFy7+nNYxbwz0=;
        b=Vn7WtqZtF8WjjkWRm6BPkenr6LRRT0wWiJy2TcGWysfR5jMlRWjeSM73xDCrgAJjxO
         vrdidVx3z3BWXAJpbrLiCX2bX0ZtTg8pH36+g19Af3I+6YQ0zYjedjTy93fGMvjHqCwH
         fKBDm+XrzBrXmlZi34FTxkxXNQaGwG2+wglqq9EuAH7y9bfuzsWVVn/DkVogbOIgLvPG
         Jl1yc7jL4oLCWQGYubK0B9Ew98tOc5qZLv2RWhCt+oVqB1cePZ4xYUG+GDNHXqtBYcDo
         kaRGTyj4GjV7H6HzLC2+YIFill+io9m7BcXz/IXmRAly6Nvcv2nPbZWrc44NQNNFWexk
         yyAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718354; x=1794323154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMIpvaUrTkzS2mLvR1oTx4fUSr+gBEDFy7+nNYxbwz0=;
        b=orkv6+Aa1XW3i3JttEpqIces/ZQs7cI1WHO1xULwnlWtVWckgbkTosZ7bg289q+AeW
         DeWJIHLqzAaq0kccp6k0YpOtlB9lGPMB8JE+Al08cV8anp2k4N68HKVz7Vbv+Acpprtd
         UItBEtawf0kdJgXgXe6WB/Zyl2TEkM/Dj4911BUvbxxtp08cD0xxrIyxpAj+Ag3H1AU/
         AW0WCk8lOaR6Y/yIH+/YA4XKTQIcohbRGtcNHKzYqMTNryUI+eKXvRon16p3mglk4mvq
         Cwwb7IkpMfk0RKrZPgIZZROfWEMrp8nAjbQt6ge0FD4PfJ8++PbA6Ssrn/x+5BtKyxjB
         6zQA==
X-Forwarded-Encrypted: i=1; AKwUvByD0h1pcOrDMTsfCazMGWrNMvCMC1gi9PhF4K9fxBnAl+Q2lTij2O8s8taAdyJOqhyoEA5l7In6cvWxxcg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fJxoENkWRVQIUAkdryZItnDp068EMDLB2BtZLKjUE/7vlHNdD
	HSaGP7DVs0ZmUJWNcM5csQphkPO/Sti7OMHPUk970BK62Dr93zD3u9THwJH8VJllE4t3P8UgSWi
	hxzV3KZo=
X-Gm-Gg: AYBFou3DIH/OHJMjDIvwROLIwO2BF8UAA5uZJd2tQfH3jBqqJTN3Nq9ON8Xkib9Bu64
	ypgQ/yBG/VCEPO9vHgw+BltdndIvxgig1fbltK45+85VrU8RS2DqVjMCxf/DXsBsk7bN9dybDQw
	8apbgHDIHHb0bXdEk8dIkYYQb8eElmGr9EuEfsCsaCNqMqNltmUG8JiNDFlY/Wg/qENEk07H0MR
	Ne6yTtwvVqRz1FffS4Rw0px+MADKvTdNmXDeiekk9o6mic0hBdcSMHF6hG/NWNxY3SgLxdUo4hv
	6DtWrAHG+isAzfoXK2AOzs/AK3djXqtjZWpRngcOC7u9xIe9toA4CygYdyDlhZ9/kh6EFATUJ63
	OONdvEsEbmMGI7aQc/MbaHeeVw9M4tMT6nwhn7j7nc+H9OOA570HHA3dOOSw9OPHOdiP/fdbIKe
	0YiTBPcVPFoJBJXw1DjkT5R1M1zRX3PCg5NVj7W0MgP24M0rUdzg8p2l1wq3mIVlEh3RDzomUkT
	/4fjepP2ZOkrKpXit5x33pR/Ek3eFH0SMvAebmYYMe1mM7RaNz/lNZ8bHhglNUaqJAhVzLjlpug
	wPANzpdgOtN/QP5cqdZWNWXIRsmk7CDt9FhH7BHlqZV0
X-Received: by 2002:a05:6102:1499:b0:7c1:9f20:36ad with SMTP id ada2fe7eead31-7d0728aff1fmr6169487137.2.1793718354293;
        Tue, 03 Nov 2026 07:05:54 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.254])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm13038483137.3.2026.11.03.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:05:52 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Tue, 03 Nov 2026 15:05:20 +0000
Subject: [PATCH v2 5/5] btrfs: don't trim the target of a device replace
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
Message-Id: <20261103-b4-btrfs-data-integrity-v2-5-577dc2690061@toxicpanda.com>
References: <20261103-b4-btrfs-data-integrity-v2-0-577dc2690061@toxicpanda.com>
In-Reply-To: <20261103-b4-btrfs-data-integrity-v2-0-577dc2690061@toxicpanda.com>
To: David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, 
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Qu Wenruo <wqu@suse.com>, 
 Boris Burkov <boris@bur.io>, Filipe Manana <fdmanana@suse.com>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793718330; l=2440;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=eUPghzbjMQBBfUFoC05GzBwFjdK137lbC/4lMcxo2qY=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QO4+GfRw/kE+LfB3XxWDVQO4VWJS7IyXEgIi1cAzohKURb18Eh6u3DiiJLrl/64Im3ATDGnqbXl
 E3y9yWwfEiw4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

FITRIM also discards the space of every device that is not allocated to a
chunk. btrfs_trim_free_extents() goes over fs_devices->devices and, for
each device that is writeable, discards the ranges that have neither
CHUNK_ALLOCATED nor CHUNK_TRIMMED set in device->alloc_state.

The target device of a running replace operation is on that list and it is
writeable. But its alloc_state is empty. The allocated ranges of the
source device are only copied to it by btrfs_set_target_alloc_state(),
when the replace finishes. Until then the whole device looks unallocated,
so an fstrim discards everything that was copied to it so far, and what is
being written to it in parallel to the source device.

The replace finishes without any error and the source device is dropped.
With a single device filesystem, 700M of data and fstrim called in a loop
while the replace runs:

  BTRFS info: dev_replace from /dev/vdb (devid 1) to /dev/vdc finished
  BTRFS error: bad tree block start, mirror 1 want 30638080 have 0
  BTRFS error: bad tree block start, mirror 2 want 30638080 have 0
  BTRFS info: scrub: not finished on devid 1 with status: -5

Skip the target device. The flag is cleared with the device list mutex
held, after the alloc_state was set up, and the trimming code holds that
mutex while it works on a device.

Fixes: 499f377f49f0 ("btrfs: iterate over unused chunk space in FITRIM")
CC: stable@vger.kernel.org
Reviewed-by: Qu Wenruo <wqu@suse.com>
Reviewed-by: Filipe Manana <fdmanana@suse.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/btrfs/extent-tree.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index 9b0a5c6b96f3..22155507f905 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -6641,6 +6641,14 @@ static int btrfs_trim_free_extents_throttle(struct btrfs_device *device,
 	if (!test_bit(BTRFS_DEV_STATE_WRITEABLE, &device->dev_state) || !device->bdev)
 		return 0;
 
+	/*
+	 * The target of a running device replace has nothing in its alloc_state
+	 * until the replace finishes, all of it would look unallocated and we
+	 * would discard what was already copied to it.
+	 */
+	if (test_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state))
+		return 0;
+
 	/* Discard not supported = nothing to do. */
 	if (!bdev_max_discard_sectors(device->bdev))
 		return 0;

-- 
2.55.0


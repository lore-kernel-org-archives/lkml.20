Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E8E4EBACA
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791836190; cv=none; b=QgxEtP9cH0Dtj3FvptoouH3El5q/UiU9x3ScldE9pUpJPJ0oo505eGyDyAZ8PzMuzlGc4UjKWAeBJQ/vhWet1DY2eCTGCzbp3Bwiex2o1OcsxOMx01VP9I1e4P6kcjtzpFH3sCBWWy4C3bHusyb+azxRi+jM34PNqh5W8pYtW9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791836190; c=relaxed/simple;
	bh=E/5MB9DmrAPZDxIzNkf5ZDQX8eOZAjHFk1n9mFFTl2w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=So/q+L2hjkXoFg7SbvvDEGpwX+B9ntp84ooVsXifcdV2qzU8XIy0sEoiAL8ZM4y/9bCskUtDxvC+mx+G4qmLEF6PE7j8HPFW9vWgFbVIYLiwH8fnVCMOIaRoYl0hTf3XqAb+jSjgcv2fguWKTgBpGHMSbkVg8r0MF2erWOCe01o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=ezThKuKF; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="ezThKuKF"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-82380b0f55dso1083138a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1791836186; x=1792440986; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wg1Ux0hl2+pwA4qVaI3hvIFFByPMMzuli4I/B5ITH7M=;
        b=ezThKuKF8wDokh9LV126CqDkq7P34XkK2Biiu+wFZl4Jqu5AOH3ohzQx+ZNa09FM86
         lLei/mQ/hyy8kog9HVR2FUVEJe1pyM9H1I1c5b+/N5csUF9CIa3j4UWCn+8cP5LZIoVQ
         q3hcv7E6lpGLnA1dKzIJieWJUq5XQAocUCz3cqnts6ArMOCF+CWPUN7dN1tfRWurC296
         ChWyKVASsA2SD4Fqw67KHcvAwaOBQqZszVCKij7Z64plVx5bYb8Dt/PsdtxmUmDR7Rtd
         3Vezv+IAle+KoE0wT/2yoWe26a+qYPgY0eum1UwO9HZ+1zUasYuivhbyy8SaMI2HjRMH
         naQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791836186; x=1792440986;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wg1Ux0hl2+pwA4qVaI3hvIFFByPMMzuli4I/B5ITH7M=;
        b=dSVxfg2/v+j5marMkM+0qcBiS7JKgmt/5XnuzB17dRLtIro1LxjgNpJXhp7yFRQjt0
         j2Uu9moyHD5rGn5Q6xebOZSXymAwjO4qCWm0MAoC92sVjbR/iZlhOPP4mrfqdVoYxWV1
         iA4o5hBTC2xXVvQOc8JF+ZLu9wpuOvU4JtTTdIvvDncB9/ECEC1yavycCMZB+T43cd2+
         eWKWURgCKhCajyI7AxhUX2+Xll6iHXqNp/bg3x+6y4MeVN4ZxdBfk6MkEASRj6lEYNsc
         1fl4ZoN4OhYeh3XFHjkVHL/mCl1s3yzXBVAjW22dS+AssWTMi5/SHBGjMNXrz7OcyIEw
         5qMQ==
X-Gm-Message-State: AFq9FYL38doHT5vF8aUPp3AhxkwR8SNhXnqtNTgWPjv+K+XFmZEz58LG
	ZjHa7uEL1GQMjWJQ7L+7TZlFUP9snunrr0N0VJpQXenzoQyc6QE2kxAWEiOD63msGhE=
X-Gm-Gg: AYBFou3v7+Dmd6GlMEY1J40fsFn0Cte4tZ/Bkc761tqEs5J/n+9EB14vyyr2xAn7seY
	vF63K8v4oSXsSkm++aRLL2OLElaAqCWmY5UJQcBY0s1/cNOgmnMHwDDVF0gT2RMUQL59c0BLvmD
	Ot4CRMD0GUOMcImv68bb4iC/BvGF9yOjQhQ6So67h4n4HBRbx5Cod9rJnHRN9ZHwsWOz+AU7Xlj
	ImDARTMpNC8voBUjZQF+RFyacisRlwNQ//MrlU3Jj0IN4onv82yXndE+jjIUpIzmywuGtX+0OUG
	v+wTn6ADVNL8mCXMbWaqTKbscMyFQ30Aheh/qiYZAPNxNs92QPEAT5M6nJj9s6yJCf+WNeGK8RM
	dn3x34XDQfx8AKnMOaWq2gGfGMtqJA14SzSFjsf6n5eyvk6O5bPJJQy36wXcxmZvvPyZbAYuSlE
	32dD8ptqNe7ulDBDYvuJtbYDrd+freHQdn08yJQWSJPiTVb9LnugV9szhhApKFdBUgfjvdOsNJi
	t9EQqYp4QKc60Eyt7gIhmNAHitGsZV824FmLDtKqEcvDuqX8H6tBBP+9pWeDBMQzoAC
X-Received: by 2002:a05:6830:4104:b0:81f:92c9:1f80 with SMTP id 46e09a7af769-83095b2dcfdmr13038337a34.16.1791836185941;
        Mon, 12 Oct 2026 13:16:25 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83039076d72sm10441653a34.12.2026.10.12.13.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 13:16:24 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-block@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-nvme@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
 io-uring@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>, 
 William Power <william.power@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Alasdair Kergon <agk@redhat.com>, 
 Mike Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
In-Reply-To: <cover.1791336930.git.asml.silence@gmail.com>
References: <cover.1791336930.git.asml.silence@gmail.com>
Subject: Re: [PATCH v9 00/13] Add dmabuf read/write via io_uring
Message-Id: <179183618332.250226.7412463798702866633.b4-ty@b4>
Date: Mon, 12 Oct 2026 14:16:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Wed, 07 Oct 2026 02:42:43 +0100, Pavel Begunkov wrote:
> The patch set allows to register a dmabuf to an io_uring instance for
> a specified file and use it with io_uring read / write requests. The
> infrastructure is not tied to io_uring and there could be more users
> in the future. A similar idea was attempted some years ago by Keith [1],
> from where I borrowed a number of changes. Later it was brough back up
> to life by Tushar and Vishal.
> 
> [...]

Applied, thanks!

[01/13] dma-buf: introduce initial file I/O infrastructure
        commit: b899f5d8a9594f3e5be7c481e4631521f0a6e42d
[02/13] iov_iter: add iterator type for dmabuf maps
        commit: f41f84796a1129838524d2aa542598c22822a2ec
[03/13] block: always adjust bi_offset on bio_advance_iter
        commit: dda48c57e1484f967727d827923d3fb47d6b8aa3
[04/13] block: introduce dma map backed bio type
        commit: dfc9cc23122deeffcbf562a0989c695e8505d54e
[05/13] block: add dma-buf support for raw bdev
        commit: 738881239a914b2d92cafdf1030c382f1614a293
[06/13] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
        commit: db93ee31780323044eb5d6279d89f6ae49493f39
[07/13] nvme-pci: implement dma-buf backed requests
        commit: bb3e58f540e95ad55bc7ba6a6f713f79b4e79e7e
[08/13] nvme-pci: add SGL support for the dmabuf path
        commit: 3676bad01d84421fbf8567edafac63bef9f648cc
[09/13] io_uring/rsrc: introduce buf registration structure
        commit: fa1925e901c00b00695edd29d053564a6de63d9c
[10/13] io_uring/rsrc: extend buffer update
        commit: b497df80ba7536cffb2c5364e725c0812135886c
[11/13] io_uring/rsrc: add uncloneable regbuf flag
        commit: 10b6521fae14c5941b3fd77d1a48eb7a424ee487
[12/13] io_uring/rsrc: add regbuf import flags
        commit: b5a1e426d22fa059eaac1106292ad60c8da52d17
[13/13] io_uring/rsrc: add dmabuf backed registered buffers
        commit: 4bb797852328975051b001189f3e3840cfaad2d7

Best regards,
-- 
Jens Axboe




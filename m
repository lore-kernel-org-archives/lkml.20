Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5063BE636
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 20:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789073727; cv=none; b=Wo47OFjyaYnWAggtTAqp1gcEoQOxQyD6ZqdVitUc519V6H64lHxcjFWQ3jLo4NDmsThkqyuHEFS3S1zH9cM1uNsJsG9srSYQtQHzgwxYydw+m+f4FFum6b5iT9nBKe8FRDN5XmboCv7q79/cu90mgICjLmj3TDyXjT/GNiskVg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789073727; c=relaxed/simple;
	bh=hFrf47wiCRa+Xp/RSbKkY05XcZwBmlybD2veRYYsg0I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KlhOmF92RU/dVhHdWgDnoFkKfYKQ+yQl5jHkfbTA6+OJksAeWgZJbo+HGdpiP/U9h6szh4pZkLK0EOzDoUKqPski0NRiJUdNhKwjKafsJTS39XtfH3zHRAQylxmS4sVjWkI4Hkz/eeig39HlbDkZXGjtwOJKwpaAT7bAZxeqoJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=cHd6WKoA; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="cHd6WKoA"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f4e729368fso238033a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 13:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789073725; x=1789678525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkbEmlLYOqHu2rT/pG1b8F4ZrumOvKHVAf/LIvXXM5Y=;
        b=cHd6WKoAkZVsRuu8KoPan46EIfg6VdtlPtEjUgBLJ19o6s1C/So7zaFjSumnMYu52q
         g+3GprZpgU0qqMUqp+UrgaslT8B+rasqcvgdgxaJjLlxpgNB5bLc+pW2uIgtZuO50nIN
         8FddKuSLz9D6zKO2i4DK7tPcw7Jr8FfiZj8U+yXum0nx5TON+d78WYjsZEgmdVpqMuBo
         lpf6R+zGcruYC6JtOBQi9qbGI3djIIKqnjdtTScIeqK0RHFiOH6Xj1GRaKoBYgs/tjxW
         UpcjGmb23ts0wrHJG7xwegI2ArRgUltSREuDSdffE77y5yNlQSNvMQ+ExKi8opZqMeiZ
         C09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789073725; x=1789678525;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkbEmlLYOqHu2rT/pG1b8F4ZrumOvKHVAf/LIvXXM5Y=;
        b=SoTv+TmFQ8PgWHI/h5ISzzmPL/nftOXp8dW8v7DmkVe5aqSia7MxNDO/L68l79vHbR
         vFuz/4TWke9d3/7XtWWc7harH0DFq0ilI2LU9Ndkb0Qa3s2g0a9bqJzDh2f+OUZYx/te
         HbRKlIFfeklP/NYPixGHwIwnlfpZdiUc2qoCHOt4eh+ODx5FwaaKOXaZh8799LjIhJpX
         W7Qi6NT7vBkE8cVde7J3RuCTh/ovtoQ0H1tVPwSjja55t8Xrn4SPj+uI5qG1TRuC1TvI
         9TJOxXKEYbpkKPqesWCO6KA+HUUY6I4YnRN3UullZZoeIIZhiyc4EYOPmMcBslau9xz4
         sOPw==
X-Forwarded-Encrypted: i=1; AKwUvBzXVtxX4Nkwxc1RNqZ7ifHiqJNTDbKGFMWWn/FZ+It/+2PVj2/2fSs07LqfLuL0yPL/zARgw5ZDv55FAIs=@vger.kernel.org
X-Gm-Message-State: AFuF++k0fCFLL4HwdlbqIyVypL847QgZEbmRVeuJdfM6XVaKFiwCbtrg
	8wUo1O/LBMw480o66Sg1bY/AAhDgWM6MXea6ddH+SINSOhlOINC/Pvvbt5nnY1cfJqs=
X-Gm-Gg: AYBFou1/DD4KBHy5pYzfrjoxJUQlwTlkJP3KZdIcon5WsLfb9ylF0HKwmT9AyDdTK+9
	FM/dEq4KGAWtp21i0jC5dkVtMPjqaxd90qeqYrjvfClYyvMRetqrIKFH51SV2Y3UCLMvAwZ2n2q
	wJII+dJAFwfrhSJ4R/Hmg+uI5EXUXgl8zt6FXfdytNGi7UuSkyP+lMMvatDTaahazDMKeRthLy9
	0hGzZhln0JUEC2pasxQMkznQHny9rMFiQ+/YcJywNfWCJTG3UeIH9Q8LFhm0YXtm8d9aVcxDjgc
	zqpw1XS4vEA5OrXAHn7zrheBbfulRv0PaJpbu79PsQc+kHXwwhHqmPKhwzSf5goI2omvgx5NmPA
	GeyouZ7bhYVYHS65/G1jcNZmh6v0exRutbS2KlCgXqEDja4VhBqidFYEUS8M8H946NQBAjKsLDx
	FbUERrNfinFcWpSwDz+TRxfTLN1ugpCnxLpHMN5/q9TKorJouqq2mMXmCWtLMHjreJjF75iCxzm
	kJnAi5/TnooIuCHkq++NzPXpaXQypeKv7HfDXtlO1JLmPXYTnc=
X-Received: by 2002:a05:6830:2702:b0:800:d883:997f with SMTP id 46e09a7af769-803fec02e59mr471619a34.2.1789073724704;
        Thu, 10 Sep 2026 13:55:24 -0700 (PDT)
Received: from [127.0.0.1] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60fe54asm635779a34.15.2026.09.10.13.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:55:23 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, linux-block@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org, 
 linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, Pavel Begunkov <asml.silence@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
 Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>, 
 William Power <william.power@intel.com>, 
 Phil Cayton <phil.cayton@intel.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, David Sterba <dsterba@suse.com>, 
 Ilya Dryomov <idryomov@gmail.com>, dm-devel@lists.linux.dev, 
 nvdimm@lists.linux.dev, linux-btrfs@vger.kernel.org, 
 ceph-devel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>
In-Reply-To: <cover.1785596451.git.asml.silence@gmail.com>
References: <cover.1785596451.git.asml.silence@gmail.com>
Subject: Re: [PATCH v5 00/16] Add dmabuf read/write via io_uring
Message-Id: <178907372259.484803.15807864431748251506.b4-ty@b4>
Date: Thu, 10 Sep 2026 14:55:22 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Sat, 01 Aug 2026 16:46:12 +0100, Pavel Begunkov wrote:
> The patch set allows to register a dmabuf to an io_uring instance for
> a specified file and use it with io_uring read / write requests. The
> infrastructure is not tied to io_uring and there could be more users
> in the future. A similar idea was attempted some years ago by Keith [1]
> (from where I borrowed a good number of changes). Later it was brough
> back up to life by Tushar and Vishal.
> 
> [...]

Applied, thanks!

[01/16] dma-buf: introduce initial file I/O infrastructure
        (no commit info)
[02/16] iov_iter: add iterator type for dmabuf maps
        (no commit info)
[03/16] block: rename bi_bvec_done
        (no commit info)
[04/16] block: always adjust bi_offset on bio_advance_iter
        (no commit info)
[05/16] block: move bvec init into __bio_clone
        (no commit info)
[06/16] block: introduce bio_iov_iter_set()
        (no commit info)
[07/16] block: introduce dma map backed bio type
        (no commit info)
[08/16] block: add dma-buf support for raw bdev
        (no commit info)
[09/16] nvme-pci: implement dma-buf backed requests
        (no commit info)
[10/16] nvme-pci: rename nvme_pci_sgl_set_data to nvme_pci_dma_iter_set_sgl
        (no commit info)
[11/16] nvme-pci: add SGL support for the dmabuf path
        (no commit info)
[12/16] io_uring/rsrc: introduce buf registration structure
        (no commit info)
[13/16] io_uring/rsrc: extend buffer update
        (no commit info)
[14/16] io_uring/rsrc: add uncloneable regbuf flag
        (no commit info)
[15/16] io_uring/rsrc: add regbuf import flags
        (no commit info)
[16/16] io_uring/rsrc: add dmabuf backed registered buffers
        (no commit info)

Best regards,
-- 
Jens Axboe




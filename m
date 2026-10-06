Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871D3AC0C3
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 09:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278552; cv=none; b=HDUODKCx/fPttJbUwLhRjhb6B+Cp71YdQgheT/t3OKZN5ymzVPjtf1GTsHcfu6TStaAHffSQ5g5L4xU+tT2mMi6sMA7C1S5yc8NFZ0HR/QWJ37ZQzaG+uyieEMQ9Qf/O6pisJkJ7CwhuSjCVndOFQBBA+NZYkEdnJaBQMiZP1hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278552; c=relaxed/simple;
	bh=3cCYb2GXxCqt4CUkuLjwjUMCfJzRvE2ILorj6jcE/uQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uda1/AruH1qgN8SxJIN4ib27X9CKxCXa2YkxUylyJjBlnRQuTKVWHfyb6R358n9O/4jXuBmR8EknZIUPtS4iDDq0VMhCKdnxUNUGMhiJMYyv0fmJN3Sf667sDbDLX1r/5Hk/BkfEyafssuax1c0KwzVuIofWEK4IksY4MqI16Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IWxxhEz1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SN9rh+Ww; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IWxxhEz1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SN9rh+Ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791278545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rT3Z6FD8ZJHJrigocAucu2rhc50doTFkH8wYejbkVS0=;
	b=IWxxhEz1ZkoKuilG8NXYTT+8wfcw8SoQf0dnB6Dr4zyYDluRgZNwOjzHn8yrEnek08eHTF
	GP8EIJhrH7D9TUrfy14wuRY5gDKXCUBRjMCyebLWIYxJK1MG70jvjZ0n8wic3jnOtZ2ed8
	Zd+f0Dpz65R5T+ibKy7cArQrBQikG3c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-rb-XDZYaPIGbAK_sY4kWYA-1; Tue, 06 Oct 2026 05:22:24 -0400
X-MC-Unique: rb-XDZYaPIGbAK_sY4kWYA-1
X-Mimecast-MFC-AGG-ID: rb-XDZYaPIGbAK_sY4kWYA_1791278543
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48afcecb035so259304f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 02:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791278543; x=1791883343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rT3Z6FD8ZJHJrigocAucu2rhc50doTFkH8wYejbkVS0=;
        b=SN9rh+WwrVTt7YRkfs+1yN4RAulA+2uIViviuXSsRoa5RskJfc8ces1z0h49CR6wtx
         hPxRAPO+/BYZlS1Evzw06PonJIOAieS1P8e0RqhKEqTBomGX6TTtjion6IxiRSYEQeKH
         Gd9ho2gWHfg/I1wQNH8/YP/sY6h6y7p8I3Wh1omnGDpxbSsA1RD/C3H3ac0ZQapJ85c4
         Ui5wqT9u+9Hpa0QIk84FMk/8qIQfrqhZ4a64fjedmsPC64zRL3hNbQWVu2NyuaeMaAVX
         3rCmV+dh2y7hkjz8YdsgCoteoAdwvvDiOkQDPyKJjetK/BoryehXv48ZGv5sU8XKiwEy
         dd2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278543; x=1791883343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rT3Z6FD8ZJHJrigocAucu2rhc50doTFkH8wYejbkVS0=;
        b=GucgNgqL8kuItN+n/IIj0U5dq1pdMrL5YVmrR10xMaXA9/YcnXGnLQcJVIVAuBywVc
         T8rQBn2wtu6Y7WMFX75qeGSh5D/HDsqEH8MXMglFNas0M7TYrswcMFMRyHVxCSHzSO3K
         TRApst5HifUmBQGhFbbKeT0bK2kCuQTz+3dmVt66Ar2ziskx8vE6cjl/JwHXhBUUy4Jg
         kkR6dkWXJ5F1geavugOS6SakvG/eg5OGcl0fC+HUH/AMlwWT+yKLcFPs4l+la5ZcxDXG
         SE2WyCy66HXffsRIjDH4lG+QJ2Qu2ZP4hT2DPQ06Qlyn0iQh9jX6Joy2BTwJupMzAaSM
         vW2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzaCt6ntAvHNiQA8YdcQ33+44zAA/e8ud9X3wUSX0+abnnlYBDItWvhxafLjrRo7aDQ3fl6kCdXB9r6H50=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHo5/p2kNZxySna1Z14AZXWbi2869Z/r0Gpd92jb97JPUJSpgt
	rmujjPsfhxP8xEBhaLvX5iYOje6BKkx1+f2S6h3goX6U7EmMdyZIFTnJLhFldxOUyu24BmgCQu3
	zGaxq0/IBKZNAQzJXZB3R1Q3pZd9rMJUDPFiOY80BBENUZkPWSxoq3v19nI6xMh2KB+fbwkIlEQ
	==
X-Gm-Gg: AYBFou3Yz+rqmQT9GHvDT+aoX9PAuFzbTXhG9xtY2Ycck3HJdr/IbSsk4ruK/yLnIkI
	Jhc1K1mABkT4qchvhKP5Wnfh3BDRM9AIZ2AfYMT04TdojEhIkYkMjHX5El+lgVSo8BB5VYw3avL
	s92Znnje7gluYbGafIjXoW7jSBLyceNo/tbNcpHtgEq5ZgGqE8EFVp2Oz7Ypw9c3hvD1Iutf45o
	KBTLm9lOYwUGxO5n7uVewVPAfIR3NmMXYZYdTG1iDbnTKMaDf40mlZJ4s1qxqoxAaHwwnM7Ny88
	r/I7c1g1oFHVXUftGt2Kjb5sXclAFF+18xNcN0tTawhaTAr/5bS72IlS5BYxTVStfdLGWRI=
X-Received: by 2002:a5d:66cf:0:b0:487:1577:9e33 with SMTP id ffacd0b85a97d-48c688ea4cfmr3097605f8f.25.1791278542955;
        Tue, 06 Oct 2026 02:22:22 -0700 (PDT)
X-Received: by 2002:a5d:66cf:0:b0:487:1577:9e33 with SMTP id ffacd0b85a97d-48c688ea4cfmr3097554f8f.25.1791278542366;
        Tue, 06 Oct 2026 02:22:22 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c622d282esm8705325f8f.33.2026.10.06.02.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:22:21 -0700 (PDT)
Date: Tue, 6 Oct 2026 05:22:19 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: sungbyeongchan <tjdqudcks0424@naver.com>
Cc: Jason Wang <jasowangio@gmail.com>, Eugenio Perez <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: Re: [BUG] virtio_ring: VDUSE backend can corrupt split-ring free list
Message-ID: <20261006052105-mutt-send-email-mst@kernel.org>
References: <20261006091210.828229-1-tjdqudcks0424@naver.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006091210.828229-1-tjdqudcks0424@naver.com>

On Tue, Oct 06, 2026 at 06:12:08PM +0900, sungbyeongchan wrote:
> Hello,
> 
> I found a split-virtqueue free-list corruption issue reachable from a
> delegated VDUSE backend.
> 
> virtqueue_add_desc_split() records descriptor flags and next indexes in
> the kernel-only desc_extra array before publishing the shared descriptor.
> During completion, detach_buf_split_in_order() follows the shadow next
> index but decides whether to continue by rereading the backend-writable
> shared descriptor's NEXT flag.  A backend can therefore change the
> detach length after publication.
> 
> I reproduced this twice on commit
> ff47652a4b66c067c765a7ad464d930b5a9367cc using production VDUSE,
> virtio_vdpa, and virtio-net paths in an isolated QEMU guest.  Initial
> setup was performed by root, after which the backend ran as uid/gid
> 65534 with no capabilities and no-new-privileges.
> 
> Changing one published RX descriptor from WRITE to WRITE|NEXT caused
> the host frontend to detach the adjacent active descriptor.  Completing
> that adjacent descriptor normally then detached it again.  Six valid
> completions increased num_free by seven and the following refill
> published descriptor IDs 5,4,3,2,1,0,1, demonstrating deterministic
> free-list corruption and duplicate descriptor allocation.
> 
> Four controls were clean, including no mutation, a one-descriptor
> NEXT-clear case, an invalid used ID, and mutation after completion.  I
> did not demonstrate an out-of-bounds host access, chosen-address access,
> information disclosure, panic, code execution, or privilege escalation.
> 
> I tested replacing the shared flags read with extra[i].flags, which was
> captured before publication.  The same forged workload then refilled six
> unique descriptors and the normal control remained unchanged.  Build,
> checkpatch, and fixed A/B validation passed.
> 
> I performed a best-effort public duplicate search through 2026-10-06
> and found no exact public report for this post-publication NEXT mutation
> and split-ring free-list corruption path.
> 
> This report was prepared with AI assistance and is being treated as
> public under Documentation/process/security-bugs.rst.  A tested source
> reproducer, logs, configuration, and proposed patch are available to the
> maintainers on request; the reproducer is intentionally not attached to
> this public report.
> 
> Assisted-by: LLM
> 
> Regards,
> sungbyeongchan

As far as I can tell, you are saying a device can confuse it's driver?
So what?

-- 
MST


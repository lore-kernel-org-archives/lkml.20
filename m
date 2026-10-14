Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF7F548562
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988708; cv=pass; b=BVzw/HTqEhX8VZRzhFE5sVeztFLhOOAmQZAjZr02PMDG3k94Pu7mUscKrZHTD5RYz80lBNdriPpqS4MN389m86CbOewO5l/T65X/yhoM5z8qG/8f+sgdttJASVL51RwQrikqr+6rZtm2fjjnfn/UffGlc++kxaEoWY6k9cRCDB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988708; c=relaxed/simple;
	bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLiqn7fiCV028xCS36qWImGRmqKGHD8E8ul0XT/YwhFwK/eIjHIbQKoitTIwAAsxxgLGYPA7CR2cWlafLufoJBAP5vrpICWnVUcy1eunHeCFwMXkLKYNiU4b6Me7mJa7auAUZe5r//n3PN0eTYSWOPjuAVWvjrpELwwi2igbb4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cngxshHk; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cngxshHk"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1aa4d71e7so990861a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:38:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791988705; cv=none;
        d=google.com; s=arc-20260327;
        b=o1yCgmX4tLFGMIgfyVZC9KD8QrDziAyoGgsvzBSzZIbHjND9lvPnJPpxWmLnk9BoHI
         w6KTyhQISZnGrzWn7npvfMp8MLnr3TpN3ka7BKGV5iyKOjN7RM44e3sryZM5gpEW65S3
         8fYxAA/dN1mF1tO1pGU+jQSHt7zJ22hZPiH2zuMZkmzqiJ/MoSegHTHQncnAhkJ6rTJm
         QbPVYWNk/87nOCaDKlYa3EsQE3Iyt2n80gMAa48g60jntlf6qZXC64zfQFmaAkAnlwa5
         hNrUgFv8LFY4cb2CfPvQ4atNHotR417kzJ0UD2Z/xHM2ZTh9AaLR33DPJJGtsyFkHS1C
         uyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        fh=IuxtDPuY+bCJGXJ4WJuWCYSA+pRcfHVSDfb8Fh+RGbU=;
        b=qziD60kWd/EP4JpuAo1qFSk2awOmET31gB6mCa6TQHmuQlnvZSxdKa9WYAMFxYzqHv
         0LWP73xq/MQlEeJ7R2xasktJU22TYZUP3eQXis2rR71rK7bPT21u8bR8ljN7e3vB2fHF
         XwZtW8woqZ3+VYfw+oFE87ZoI7+KkfUZU8OkDW+AILS0jvmeN/53g1Bknbx8jBY1wpxJ
         l2qNfNjOZrMGJqgMqrkRGAL2Z6es/HWD8OkcRwGR61cCPsVEAE7aWZwOsXyBneuZhT5r
         4M1MBdvpFI8wWdTAH34gqRjbpjhzwgji3PgbcKtr+iwp1njfouO2hv2maknKiEYWW+em
         4yjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791988705; x=1792593505; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        b=cngxshHkw8vpezJT+yDObXyASEd/+1ZURQ3kSvVkslJTVzG3tDddeyu6Itpilt2JMA
         ec1WM/YYgS3Rq+vyX4T4IeWYoQ6OxvUiPFQKj/JmDAP4bVMSF7iOJ9EhmAZeTB6IBdyW
         hrr5fD+726lY+ajAr5CUAAonz79E10XEa2mHWfe7oiuU+5I4HQVr9qTl+RLPz1Diqx29
         GtSbTklK5jEE1PNTzOz4Evx6U/DUQ6OIJjmi6onPw4b4rseZ8zc4j/e6G/SDgBZfMjcD
         q01QWWumP4wG0aQUh+R5aOlmSu3VVONxsq4Rn1Mj6JpmuA+W5oTi/cpSHA+wcMS+164o
         h7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988705; x=1792593505;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ht8GLTCoCKkoVxwpD5KYA+Pz/0xMc+C2begOQBfsCnM=;
        b=LhIODtYbN6DE7K11k+xcinY0aYvDkCP/04o4Yey0OXbDgImem/DQM6t8vCA7BUTTNP
         0ZqI0WNo5pUftnCiSyWLizqCsDojKoEmx4SX1OB4iWk02d85X1bWQGwuKgGM0NSek30J
         B+zVaWQVnz51alktbN1WeMbXaIcDwosmm5R1CNsrZOknIHSct1NSWx4xYCgCgqjHUDhS
         sBIm8xEKEy/FofvKj3kWoruv2RSXql3RJqNwg2Kajsrk3EkOfXDKLYGA3jqpBo9OZO/L
         NmkHu2+/LVfEdth+T3mJl9khxkJtHTBsk1SxuI046HlJY8BCiIgEOcVnX63Tp8YH48pO
         iShA==
X-Forwarded-Encrypted: i=1; AKwUvByHg1TKa98rf/362K/MYC92Z4NkLZVN3VrDa90x3gJveIALgFPyOSehmWOa1MPPxWS27u5mXgapTGyMpj0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKv30Ef13dsjIgLd8+hpP5QLx5+s+7CACH3O/xTTluvmfGIqxUv
	IV6H1qiKrsEJ9NUzvbwXLGyv51Hdd+Od78VgIdF+1xdbGj0XUE8fG2KmIB9jkkm7Pmr7VGT9bbN
	biK1fZIbHLUv6vhx+VlPg9KM1rT3+RQ==
X-Gm-Gg: AYBFou3MXL9bnFapH0a/4aejnOiCAAY5Ij+0vY0pTdygt1I27DhIEyCGKgK4if/bnX+
	a61m30iniXi0jjPaLhI8xEIEISro1lysy/hZE3cq8ggKNa1XqrF0bNMt2D9xChenjO991lGP4tE
	hv1SzeII/I3GMn5Jma1+vzh4V3uk2/rx8GC/zMUT/HenDt6de8J5kqWCdoOltv/KzMw3RBwhHtz
	q5Jr6Etu6jgDvAK3vlRxqikTrada8wmxLbMkN9t1qiiX2hmrFb8S3ChP/TEng4gjauvIbPEQApH
	8Qi2EnWse9YefDTQrjjp3YYLz5pGNfMeq/b2/FsS60Hv7Jtx7s0vdzqK0x9suSy7Soa0ebFVs83
	o2xIMyitb08SUFB3zX8CSYTRmXfQxmJnxJIQWmQ4=
X-Received: by 2002:a05:6402:1912:b0:6ac:b9b5:8e8b with SMTP id
 4fb4d7f45d1cf-6b17c2a3670mr12616709a12.15.1791988704432; Wed, 14 Oct 2026
 07:38:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791975048.git.asml.silence@gmail.com>
In-Reply-To: <cover.1791975048.git.asml.silence@gmail.com>
From: Anuj gupta <anuj1072538@gmail.com>
Date: Wed, 14 Oct 2026 20:07:46 +0530
X-Gm-Features: AclHuK8DZ9QwF2AgJ3SDr4lT4xl3Cf9evBnlWqjNFK8bj0mT2h6JXCYZXSbhb_A
Message-ID: <CACzX3Ases=5auovox0XFNheDHY9iNmxv2BvB0dugC-W3mnjGLw@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] Add dmabuf read/write via io_uring
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-nvme@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Christoph Hellwig <hch@lst.de>, Sumit Semwal <sumit.semwal@linaro.org>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Keith Busch <kbusch@kernel.org>, Sagi Grimberg <sagi@grimberg.me>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Jens Axboe <axboe@kernel.dk>, 
	Nitesh Shetty <nj.shetty@samsung.com>, Kanchan Joshi <joshi.k@samsung.com>, 
	Anuj Gupta <anuj20.g@samsung.com>, Tushar Gohad <tushar.gohad@intel.com>, 
	William Power <william.power@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
	Mikulas Patocka <mpatocka@redhat.com>, Benjamin Marzinski <bmarzins@redhat.com>, dm-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Tushar, William, Phil did a lot of testing and experimentation on various
> devices with previous versions of the patch set, and I've received lots
> of help from Anuj, Kanchan and Nitesh with investigations, testing, and
> patching. Earlier benchmarks by Anuj for IOMMU optimisations with udmabuf
> showed:
>
> STRICT: before = 570 KIOPS, after = 5.01 MIOPS
> LAZY: before = 1.93 MIOPS, after = 5.01 MIOPS
> PASSTHROUGH: before = 5.01 MIOPS, after = 5.01 MIOPS

I've been involved in the development of this series, so I won't add a
Reviewed-by tag, but I tested it on NVMe with both an AMD GPU dma-buf
and udmabuf exporter, using the liburing tests and custom fio plumbing.

Feel free to add:
Tested-by: Anuj Gupta <anuj20.g@samsung.com>

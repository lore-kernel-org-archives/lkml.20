Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794924219;
	b=0Mulgguyx4ZqVLjFg9uPhHd6bRWvuf1VgfBh50x556poZ3rJphIuxaP2DGcRu23tPN1y
	 tPPWi7EoWpMmW8QYvSrECL6XWuWXE0c9k0EG+I7nUqbVg6i/Hw6Whq7Csehc+bk9CFkeG
	 HFh9hReRYgLOn/4/RimWs7J4QVLcw7yXBsG61ETCyEjInZEXuMm4AC3mYQMkZZNUgcTKv
	 u0gnwp17XE+oKJSNCPEfjjuZGjncZ2yM10tIBLjcgjqSaBrprfdY441QuhtsLsrTNKRFr
	 8jntur6hYAzjuPkJ4AKxQYFjTtzR7KftbpWa8LNwKWijt4MH01e11vC/8J7/1OYUn1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
	b=ESzgRCclr6iZ78D4CSoeQ8y6imTLHWbb9OFtB9n5qfFyiEqul8FVclBwBhyDu7ITw3OL
	 mEs8OqA7Pnxcd7279+t8Z1CyuPihHHRXGR9eTl71/ta2U9IU6AETf+mQuitQSIY9q8ryD
	 YOBBXBBJfDh+WKan+usdVLU2z9D/XTLM5AhKU+nh4G0eHaWt5QA2sPfWjk7gAKk9UMgUe
	 9W35mhYsovSwvRbKczHwBVjHJALfSgV/poSGkuc7jARa/ppk+a9wZ5D2ducbHMlywDtX6
	 i8GbUbtYIC6+U8v5ZXcebNP539qJ35jTPQff9Nk0vmUT6kckFUdunXTcCNlght71X+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Iw9wAxI8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F16606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4F16606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=Iw9wAxI8
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5430f70c827so63305121cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794924217; cv=none;
        d=google.com; s=arc-20260327;
        b=E51KxIXaIZ9WdRgIrmFDclLLtT9olHxLhCez3jRkD8EtOm7CvKb08OtlDwtP4dkA5s
         NZ6vnDsaz2wBAID1tvQTm8RPVw/t5EiziAuSbKNMXxVUQFlUqmfgRFum3P+EQP0qpfdn
         Vq/GGE9RIdvU7BvxWLk6BPoaS8zeGkbiWieaJQkUzxoYyB0MnRt55FbSaLJZ53oxaNg7
         NXXV5dDyV0X7s5vTY0rikbm/x/QUd4kr9sNeCz2bsu16ewv0Lwjmw8CuhKWtU9avWhPZ
         brOt11GS1rdY9i4wzFnyCd+gpjp6C9Y2krfhF11eiZ33XepwIexq/1Gax4OBAeE8ygzZ
         j5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
        fh=Ssum3K7i63zG1b7OfXDWVIYtf3C3jIJivin5ZKTTHFI=;
        b=hNDEwu4KiOFXBbrC/jX8ySafB7T2QfhARdckhQmwRgqnywrYWiLYt7n0FDBEoK6mZk
         Jppa4X/9EaSY97WR5yRQ2S145IMuo7Be2BRv2ToPyejm8oDjBqQiRLt75A50Rv8RJqUO
         xC8d3QQaHTu2XSATfsGdz+/IneMbl8F7a8q2+xbfKGtEFcwJ7wwWanARQfrVnRARIPpn
         occ1aPswoOTsZTh5d9xP1BPYnlykj+kn4RryQQE4VPeKV9oUjJtxs/A6y6cFEdbk2Nxa
         5QT0sSO7f+z4BLB8VFtTNKMbn9pGI/ITYZuNnjDbeh3UIbU+G2dz5dXH+JBWUirULGlR
         zJPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794924217; x=1795529017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
        b=Iw9wAxI8nIGvG1MD/685HCqlHWrZEAyiLmDKlcR+kMHvWxGoChJJjgGCO+KbqZcbq8
         nDiW/A1J5W4N0D/v4SpYEirn4hSypl2aTjQoAVSXgZfxQApkmeViYCzzlzUFZLSbZQkw
         YE0zXTuA4dQuplFGpZtXhTpT0fXeIypRcW/UY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794924217; x=1795529017;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=alFbhvhmLX/J2fLZw0YpZ2rT70ZCayDvSm7eBC/5SBs=;
        b=EMjDvIRv82/Af6Cn3ibBREhjFdhnBLLygVh2WIkzMHUDFO4BjFCDNCeefhQwHkfX7D
         MM5OdOW5LC3UbFZbrWVW6VyZH+OiZp1JgFMH6+kumdekVTtKNSbSOnfa/ww1AhDL76Cm
         IFLdM8102yL/UH7xuq5vSbUQo/bQkYhsP20xp7GjopaUgpMoX3YymVYOVXg83OFbvMNQ
         dyQXsClyTj3vxTGfcweALHs2uOBMe7yDVGHbKshjGVRSfrvTWFTkwX4eUMElbXxelR6z
         BrPhjAKN9mLU1ONXQjHpQypQySCQIQuXH7LEA6r7nwMrVDXRvvssl7uyrL+OeXf7LMQv
         RdSQ==
X-Forwarded-Encrypted: i=1; AL+hErFs4ye/JLjSIhIQ0SejRYk10ItSg6D1u95lvmNFGX7Niz7w3Y/D4qQKQ7kS89mBFC/uYFbUKy+nou+AQxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aznx6lEZpUoSXyqz5R7SxC2IIQQV07bCDBr2nOWfVAlai94hf
	gsDb8Cph9e2x4fGxvveH9+FRpzNFA0oSOTWXMKOfVlWROgZ6lq4OiYZ5NbfCpP0BdGhcGsEoT06
	Ua/cP07SbKaYESL5IQad4NwAVyUJz79oaEryXSWCz+lSUlttwQMa0
X-Gm-Gg: AYBFou3Mh0j0HU4w0YI3CPeWk1UYWRIhgzWrD6L/sY1YT3jJXWxI4ydZ6aQFI/JhncT
	AND06pJBmP/UjmFVSfShUnjcSVl7W2GWNzDff1waxjYjz8doBbxWLUEkhz7ML6rYtnb578xR6gX
	01+1yodqMhsq5a/Lwj5wKUYQfxXfnroJCG3oNpGMgihx0jgaColtCgdmyxW3I91SARBddx4dvxq
	RZ4Cv1pxL05PDNmXYbt62JpPI5m2/m+7rjY3F1GefElsxvX6KBH5lrEKnoYu9lm9esH3GZqwamN
	32pQv3+G6kv9xAt6xGQufbkw2J0vvSyyicgmBCMS70CrbliVSSonpY2W3CLmOs1Kv1advnLpXzI
	GmbuRQ8EV3NdSHXr6ZZEYnURxPq0FHjkB/2YInCu6Hr1Zo6GjoREN8VM7IQ76J4sZobp1hLn9sw
	uvcDjRGONV2Pw=
X-Received: by 2002:ac8:5ad3:0:b0:535:2047:6363 with SMTP id
 d75a77b69052e-55ac448c12dmr221360331cf.6.1794924217487; Tue, 17 Nov 2026
 06:03:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110150250.71520-1-ekffu200098@gmail.com>
In-Reply-To: <20261110150250.71520-1-ekffu200098@gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 17 Nov 2026 15:03:26 +0100
X-Gm-Features: AclHuK-p32xS9Ymw_ghXNjlBRtB_UAl6rx4OxdJZvic7C_w4sxAcHG3mT5pB1sc
Message-ID: <CAJfpeguXcXTPpYshszCDM=Va7Rx5VZiMStFbSi66R1NjB566+w@mail.gmail.com>
Subject: Re: [PATCH] fuse: defer dentry_tree_work until fuse_dentry_tree_init()
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Luis Henriques <luis@igalia.com>, Miklos Szeredi <mszeredi@redhat.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 16:02, Sang-Heon Jeon <ekffu200098@gmail.com> wrote:
>
> inval_wq_set() schedules dentry_tree_work when inval_wq is enabled.
>
> But inval_wq_set() can be called at boot or module load before
> fuse_dentry_tree_init() initializes the work, so __queue_delayed_work()
> warns and the work never starts.
>
> So defer scheduling the work until fuse_dentry_tree_init() sets it up.

Please add locking as sashiko's suggested.

Thanks,
Miklos

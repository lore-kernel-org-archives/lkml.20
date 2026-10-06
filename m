Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD6A3B71AB
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791272944; cv=pass; b=rQo0/OTwAmjDd7x98KKkMZBSNwqw7BIbCmmJ/YSU9IwnMX7xipaI4l5uhxWg+HKzTlqSUXfz4hmzXlMn7gByXN0UVtaNQ/N/zFCGVdygabwLmqGFAsicai+xMczlmA3TAAO9v1jwKYVkE4ih5dtitRNbJwQ+M9mMlYmI0IdamBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791272944; c=relaxed/simple;
	bh=EjxOLQXTiEKUjAkVwjaXXFmEhgPUo75BO536t5uUPtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pyz8vvWNsARSwVgx1ok0C+jZlDQUGStENkQVC4qBQtLqiXi+Skee9F16FMkEotxPQuwlFHxadgc2BLVp1uBLBBdaSN9CALkoetVU9Ids1CkU4r44XVO5lIkvFE+Goy7u+LD8OMQBijxJpvR6I/BoTqt3lWJ9QFfN8D6yQrRYVRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b=0h1G0AaA; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit.com header.i=@linbit.com header.b="0h1G0AaA"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e7496f947so35776166b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 00:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791272940; cv=none;
        d=google.com; s=arc-20260327;
        b=rGzWZ/s4PFNowXaZRrL4Mdhho+cneqHDraEmt2Owy5CYi7vb9iK7yhYz5KyWjO8+bP
         jsPtTronPw8+iXsXvFaW4ho7T57ixZdClWYRsXEWQ9YMxLsBdW4pRikQNvUcYs9B7Mhl
         tzvE7k9zfgV6CpMIY6vJR/oJORVXZqvbFCmlZx5UYKMtbJDRvOPm3oo6PJf8CZvryXvn
         j24ucKQZUR8QwV2yv0UGdbI9ACLeig0KXvug6TOM8N+mY4eX+Avk+JQPyfYVKjoTeO9B
         Mi/PP19J/xQhHc/Y+amZn0+iKtFkqBijlTh6Fh7uWTlh5mjr4Ua6AayB9OGwbqQO0XEh
         RpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=EjxOLQXTiEKUjAkVwjaXXFmEhgPUo75BO536t5uUPtI=;
        fh=ntORmseNplGsJYD7Tqs4GIPCuCyFok/pMEr587cQbjE=;
        b=D4+oOUPGXDu/ExZvK2NKw+qhBw3EAPZxSV7nRcjy5pmMA4s7XQWy6NsSsa+3PcKQhk
         oRWZnVGxYMNO4cXR1egy0JGe8dqjNjcqHKwC2YNo2JAzMLQdGdVOemIQj96N/q0mj4EO
         /flZ95SBho1gIlH/KHH2BAV5XyydZEXR9wr8Vz4rNz99WQ6ujRZvFn0wbVHPI5EmF/9L
         j3Brr9MVxTcW87UOgNB85n0ibrpPCf2TlB2LEBU4rAkXvS9FF3y8xZ4wGs2P6a9MbKSl
         kFhNsDE00pFTZsHo2cA5AGB0/S3nBHYIogxOJBbC3T7p3/fN7QFxfq89/Jq2BM2C4mAf
         h4bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit.com; s=google; t=1791272940; x=1791877740; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjxOLQXTiEKUjAkVwjaXXFmEhgPUo75BO536t5uUPtI=;
        b=0h1G0AaAq7RVxRVXfAbwaro/2HDV3FBWvJwzCLiCJTkXK+nX0hpeF1kv54Zkee2J70
         jzyNBFUoDFtbk3WY3Ef3nv9Ah1O3Lv6b8MV3jN/IJIzjY5D45Lan/BusKUJTr5an527K
         Czaeoz8jeAZrj/av5D/iSi1bghFPAK+7ccFCPizsaLbZYEcCmEXTIbPIv1xekJikSofN
         sPt8HqYgBpe6mwo5h8F5FIB5f96PKijy1IsnHdq8QGjj1nEYePbw0RcgJA7E8MKp3nXs
         Gkp/iy4l172Wwu43y3W56heqGWtSBKTyFFAZ3r+XTjdclWsDfWWdIaoedJqpHNYfIcDi
         i9PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791272940; x=1791877740;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EjxOLQXTiEKUjAkVwjaXXFmEhgPUo75BO536t5uUPtI=;
        b=KzLldsmjv7D1RgawOZ+98nCb0w70qal/UeX1q94Q/rCngWJ/UxAfN9ekMx1pVp+GrQ
         sK7Bj2fzahH7VSyJ68PGXG9sbdWlXB2RmROTfLHTTopggh4mm8uZBe9Ayskv6iHRCIq8
         ucS44ueoZrsVvw8M3CX6B6QQzTSbcaGE15O9w3XQ5hWBMJErInFw7qARJkyZ8JHqjG1L
         GMe6q90n+eWB/zqFbCt7suzH1Ciqhz69XNkX7UaDuWc3+aRU8Daehzbh7OWPbdY5re9Z
         ML6eDBN7qZP2M+9qRQAaRIBewE8t+TJIZqd75KOlp0QlG4AVlDFDhv9OndznesLIvsMZ
         9jag==
X-Forwarded-Encrypted: i=1; AKwUvBzgtb42RebaqKE8uTbr/4b8EQCHp6p2sZAK4jUnXoslGaypGTQQhR/NQLFM5Fnh12USd8NEtcqV/qk+pew=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPWxXXAWhVAWZHhQuWiEMV9ejUW81ySm1PUMdzGK2Q000E3oqR
	B1m4B7mODdBU9iw1aRr71fP3pe5oUQvmJ0B4p7Eb5B8tIMQ07O28Z5VZuz0RF0QureTKuXl6576
	/Aa7jQT0YfTNJ92RmTYIRic8KTMFgWn7m0Hns3fj53g==
X-Gm-Gg: AYBFou3L1BsmB2tEpkPn87y30xRL3EFx+eC7GgRt2WRl4/br5P46pedyu5gDcF9KK2v
	yb4LTqvb5QQXweYBzWjbK2sThDIFNyRjzsy9D1q4DklJot57rtNY7Ci0mxHhTDcslw4dej3amt9
	Js8oY8xEt+w47Ykk7QTQLy8DLELfJesu0xg/xHmUqG4NoNs/7eR3nStKV9rMUIjcrow14vgHAPX
	U09wc6FBKDFJpc2+2QZnU9klFqbl+q2/BZq76NDUdl+NS1O4ua9VvjO1EMiWCUP+CgpWhyu/hrP
	Hj0W/Nqk1YDw+EWR/BPSO6fAMAU5oSy/BvSIqlZausio2JrI8SSenBKwMDc=
X-Received: by 2002:a05:6402:1907:b0:6ac:bd53:d29a with SMTP id
 4fb4d7f45d1cf-6afe290339fmr597357a12.3.1791272940042; Tue, 06 Oct 2026
 00:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006035715.354417-1-yhlee@isslab.korea.ac.kr>
In-Reply-To: <20261006035715.354417-1-yhlee@isslab.korea.ac.kr>
From: Philipp Reisner <philipp.reisner@linbit.com>
Date: Tue, 6 Oct 2026 09:48:48 +0200
X-Gm-Features: AclHuK93qFWTt0rPdrolX-1FvRtK-xCdn7iYpv4S1vx0jkfxOiNyhJFdse2ACcs
Message-ID: <CADGDV=V5NJViqSKS0JpFrm1U_2pGRBf1iE30hn+yuR7NmN9iXQ@mail.gmail.com>
Subject: Re: [PATCH] drbd: reject an out-of-range offset when decoding a
 compressed bitmap
To: yhlee@isslab.korea.ac.kr
Cc: lars.ellenberg@linbit.com, christoph.boehmwalder@linbit.com, 
	axboe@kernel.dk, drbd-dev@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 06, 2026 at 03:57 UTC, Yehyeong Lee wrote:
> recv_bm_rle_bits() decodes a run-length-encoded bitmap from the peer and
> accumulates the bit position s across the runs. The upper bound
> (e >= c->bm_bits) is only checked in the branch taken for a set-bits
> (toggle) run, so a clear run advances s with no check at all.

Thanks for the report and the analysis, this is correct.

> + if (s > c->bm_bits) {
> + drbd_err(peer_device, "bitmap overflow (s:%lu) while decoding bm RLE packet\n", s);
> + return -EIO;
> + }

Checking only after the loop is not sufficient, though. A single VLI
code decodes to a run length of up to 2^56 + some, and one compressed
bitmap packet can carry a few hundred such codes.

Please check every run right after decoding it, before s is advanced:

if (rl > c->bm_bits - s) {
drbd_err(...);
return -EIO;
}

That keeps s <= c->bm_bits throughout, so neither s nor e can wrap,
and since rl >= 1 it also implies e < c->bm_bits for set runs.

Could you send a v2 along those lines?

Best regards,
Philipp

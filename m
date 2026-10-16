Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57126379ED6
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141171; cv=pass; b=HNKDgi0BuwCRDHUZmYXFJ0d49Xg/5TUG+f18aHgE4V0BBlKHVqWS7byXGy9Xfas52d1kFL7JebTE5KD+JCb6g58U+A5d7b1wRyedQGOM30YMMxzhs6BKXit2mzUcGvitgsK3KeF8YTW5LiG/9VNopTiY6uGbu69eUI7nPVUcAqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141171; c=relaxed/simple;
	bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Am+5Mdh7jKRNdAwvrA3ra/vALEMCgLwjAC8MVr8HdgYsxEVjbOPdwUcbdsqEDQF9uWyGejuiq6Q/sz0d6nJ3sJa9a2jA9oK1wFmkTzB5v3Ew5ZncDFXS3KDWYjua82BndDScxreRzJB1SsfEOnrrZoPceEDUXQfdgTAvEvdc4ZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=AP9mRmfB; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="AP9mRmfB"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5350d9ea106so75646951cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:59:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141169; cv=none;
        d=google.com; s=arc-20260327;
        b=j3/ADbsJYt5YSF3d8o+x0P+tjUoDtQUZStOsK2ADdL1sE1hSKYJ/+lQT3i30OPb2gz
         7tglR3E/p3N7fAO9QJV/y5a0PnvnLuRE0ykUgND7I//4/2A1wjoX4DQDsZVtSA78+C75
         xbJm6iN7sjaO1FROuupdijKUzJSfoMhW4+L3u8pTKTPlRDG/+7UaybomgvUPOVjrpi17
         Yyj0iNqnuypanXurKMVe+SvpFRyQY1Sz70ZpZELAXdEi89pQLnwgv9KqJUEg4wOfju5r
         6zGK4wAFcjoiOo+VcQfzUkYB1ffOr41JTtto+WnYdWl3A9gtruX6lUtYlYrJmvf7hQJD
         uTqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        fh=wuhJK1IQU9pbMd+ghdrUjAzEJCIfHH/c11L1XcwzKdI=;
        b=AdPvctEZEzxnMnI58+PDkuivxoPpd+XaQeqlfZkFy/EKqwl98mQLoCJwJ6A6S/AS4y
         Vn+oLs0CT8tAXaocjTur7t9y4IRuXIurGsWxbd5t6dUi2eUVvaZ3BsjAKMQ4rhAni0va
         50U0QlGMo9es6B++z1uD50Yx+feopHUbjVG//+liVBOmlMXKGK/y6vg2zsPiD8MAcuee
         WluCDlzx/+BmzwepWlfMqzYId8fB05TeevgLDX2bOpzsE+xZytfVSd89mi/jZJ5ZRAsp
         MrJscF11n0QLehYZmlqHbo98mpSj+74FkE/s0JP2JZTrITCIJWEcOZ5sCu9GTUCoiBnw
         oU5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1792141169; x=1792745969; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        b=AP9mRmfB0tN2vqd3ND9tkHgdtm17ibVX9xAsFmSGAqbyLxAd6cNsav3AkeIr7xsC4y
         Wl/dO3qALT9/4qaw2XDi6C7jayAbGJR4vqEF61AGPcoYgEhe1u+ED6/GtdHZ9xwM+g5H
         6em9wWPVeDj/3Nrqs3POqLd5GnuUlC+y9F/6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141169; x=1792745969;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yT4fNRH28Sk1sBZ6mVlpHgBhbu2LgeUp5plOLVqVqCU=;
        b=WwOs/PhahtwVjmR4Wma2z5HwsHsNLLmVFDSpqUADyebmPbqhw+RNAch/Ap7XzgAdiY
         ekIxz6bMYqllnsA4bLYZydTX7wmI4sxmShO2iFEDAPpFaDEa54KGIaKUQV+2PbzjF/9H
         2GBm7AcfylkUlLriYS4pa8Cj7D6jD2Lz/9M0M3MdgjfBdoERPqN/Q48fGrOqT8SlGRD8
         1yRrf3dhAJBZzUgicgcx14OEKoP/Jwn/ql35DBHGuPQWxx4nHvSTMihRRS34/nsV/7T6
         Y/BK9HSCkb3idG4y3o0TUXtkwSETiZDcqfh/nnbDhr426RMQKHidYtkp9vbH0eRfNP2F
         d5EA==
X-Forwarded-Encrypted: i=1; AKwUvBwQB8zx2/pvE+FDp8kVVKNsvXTXaZz3J9OLgkdCjrUJnfJwRhWtnIHwBqezUcguOyFSq0Lyii5IwYJRGRc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrHmnBtsX67yYRnrBPqvSQllzS85AyZoq02hS3/mK+hJNCcwGr
	9MBojgHRG2cPy6ATx6kJ371S7oq2pMdTX5so4ZUBfldK/JEAdTqNhBAG1smeYLh5SaFNxyYLGhC
	zqzqqiU9ezvsrN6ixDNtJSEkg7f8Oyx6btZbhi1X7fuEhh6MTgxfP
X-Gm-Gg: AYBFou2ekLgBYOXEzan5C0HcFmS4sOi612KMELpzeWvMHk0EZ4zKxACIkkUePEtMjAX
	L27Zu69PPnyXF9rraEyKT+ky7bKMgjsqcxcpXeiuEQ98GYE3qX7XgJgt49V7N/fecyRFWqMgrds
	JL3FaLLyPyR2/MbukotT1fEqLmYXKhtjbe1wMZzrOFQ3e6ARg7Zcyu0pPe3s4rmBJmqkAUApBQH
	VV2dp2p+irV4u5+feoK3NRZ4hnKSd1t99Fb9W4CFT4n0Y590ZC3eISVjqx+PZFQf+mn+8vDqBKj
	2yxR1iO8G+80YQWZm3SdZ+PycU5+PwzeBoVXCmQT4v/JGqXczC6zl0JHR14NO/AjlPOGh5HkGO8
	VLykw24M=
X-Received: by 2002:a05:622a:1804:b0:535:a5f8:a5c4 with SMTP id
 d75a77b69052e-535a5f8b53amr352445591cf.68.1792141169297; Fri, 16 Oct 2026
 01:59:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820130158.254808-3-jamz@amazon.com> <20261014200112.1363344-1-sashal@kernel.org>
In-Reply-To: <20261014200112.1363344-1-sashal@kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Fri, 16 Oct 2026 10:59:17 +0200
X-Gm-Features: AclHuK8plkUWG0caIufFg1j5DIBTkx_nzXhY5cYIKKqxQ1cPSAaRX-yvQIYuAck
Message-ID: <CAJfpegvGBZaEw_tS-EpOKMyzb-AG3CYBG7DwbQQa3280fRNQRg@mail.gmail.com>
Subject: Re: [PATCH] selftests/fuse: add the missing FUSE_HAS_SYNCFS privilege test
To: Sasha Levin <sashal@kernel.org>
Cc: Jimmy Zuber <jamz@amazon.com>, Shuah Khan <shuah@kernel.org>, fuse-devel@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Oct 2026 at 22:01, Sasha Levin <sashal@kernel.org> wrote:

> Add test_syncfs.c as posted in Jimmy Zuber's v3 submission. The test
> talks the raw FUSE protocol over /dev/fuse, so it can choose whether to
> advertise FUSE_HAS_SYNCFS and directly observe whether the kernel
> forwards a FUSE_SYNCFS request.

Applied, thanks.

Miklos

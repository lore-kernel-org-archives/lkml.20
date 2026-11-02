Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630641;
	b=3+AFxMudeB/sNrZDRa4zWbY2Z7T9Pq+IzUQ/5ywuvuLl1+FMMu3/mqrekNmKfGSFBNaT
	 OyaI5NzU+S46ue2rEmIyo/U3DKEYH4PqF8nQ4J0o+GE/Vcop+O6g6HEKuh1ZLg8nRZZ6c
	 /on/ycf0FEh56PI8q2GqxBQFDjd87uM+35Ox5TiS09AF23XPR2i8GLnqw8Kc0PJiXKnEJ
	 UBTaf7st5ILu+s/sjQUoLJjuUUMEquwnavT0kbRjRzc+bj+SL8FpZf1Xnn7rvIxU6Rjpt
	 ZCIPOro+JcScle9pKInLb1E1tErCxjWqUGuzPX6nOyUo3ZB2wcY0kA1jsSn0vt5oAUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/Q8B5R3zHYdiDHrLqIglqhgWhN3VLwZyGC1yGSnzz5Q=;
	b=mi/Kg0o7dZCkrsFrHOgZmqQI1ganeROLLrNbkqY0zpeGFSqp3zrgCh2xRdRyio+s1a9p
	 nDtImXGNqTxoY3zOpjRzxU/f37+/q1YWRwU0HWKcAIm+Qowv2pqThjeNJo3uGRMrbvbxI
	 hw1SVZi0CpKCrmpc+QEJeqWACctzZOlmhQashx1iyBjt6lSkWpKajZEZ/sOLGPhgS1D+M
	 k+EWbtNWku81fBWId5Pz+QH28nq2PHMPmeQEpHVu7mKzgHU8qLSN5p3Ro05CreUThbDv3
	 hXmhvYioC0Vh+uy0bl/yVezAh9y7bITe30TXUMp0BZfQdRwOrudTv/0MmRNz3oVU1Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUrhrzC0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC044607F6F2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC044607F6F2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUrhrzC0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so27599265e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630639; x=1794235439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/Q8B5R3zHYdiDHrLqIglqhgWhN3VLwZyGC1yGSnzz5Q=;
        b=nUrhrzC0Kz1h9/mSqsJ1C6Fa3xEvYzuGV0ly+ljBU2d61+oiAaua+ahlzSb7Lq3LXA
         QwWVrH2zfolKBwaLYJyIpxegUF1gVIr29qOTlRb2GvA7pkoy5HKF1/I7xsV91y0B9uXw
         oUm+79FSNnuBHf5sWa66hv4u6GO0Sun8j9hCVVdoAD/7Y7lOyIpZhISpuyA8dyH7aCz2
         dQn92ZfegXTD69poDDux3B2tfOldDdDYed+DYaGTJI9qWx5K+eLrHmp4jVSPkGYwl2Vn
         LGAv87EbMzazKJPxh3Qx26DHByVuIwt/wTlDqJoi0ZK7M30NQtpoyv6tYGrz4liTXr70
         D3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630639; x=1794235439;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Q8B5R3zHYdiDHrLqIglqhgWhN3VLwZyGC1yGSnzz5Q=;
        b=tsQTC7cH1bgs7uoxmuuki1EAs/h1+eYPB7wRKju2Rd9lT9HsY52Iyq/ykSlLVThEC8
         G60s5N5JJSmR/YEedBWX6FpVSQC+Hp7KsDYGi85t/aUbfUwOma0+DQKI3bizQ12cQMM4
         4P0Swr6SeEa0ZL1xXNKZNIrcrZJGN9u2bdtLroaJU64ydpk7r3kISJ7Ri3Q1SkYTAZ7J
         uFdSzuvrmpBSFj+pFV6xnwDqTvIIG49mrfVHb0nOBWt0MafiyttGtF5SkJiEOe92ykrO
         WgGsyDNXduU8uefLFaeiYPmWuPiESJyLzx9E70NPQ3nUpMrsqAobQO1aimSPokY2t7NW
         NYVA==
X-Forwarded-Encrypted: i=1; AKwUvBwsWbvN9UHp7gDh2xrE4geKyopIPujEH4t+3THa/8xsqZg7/AHzT1cQgBKsiz/mSpc2/rIjQbyusWgxuqQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8+z0gOSavWUoTKcNYgpKoAWlZGxYYLEBh4yVdLZutmTvpNydG
	omA7ut23nF+36uZ3CRBrh1PKqjPxnZYmG+puGIUXfIaZfiUu4Y97nPBm
X-Gm-Gg: AYBFou1UUHV1z1yhQp3zCZILLwl8oVLnMJPi5nYI+kFCC0uu3lWOgNJCiejvhyPUT5n
	y8r9yIeBA9w0d3gM8eCdsPKMdtRZJNxGCdVxVZ8rpxFOy683bS09CC/3GBcSZ4hoY8OxZyBmj0h
	gzmCBmLwwFhiN79lw09JnO4ta92RNSGsrnPmTB/dXMn4wLFKhsgw36CPT3Hf3dKHL+DFa+OjDt2
	Qwctk2rW2pmisEcsRKDLqOTuoVUFDxdG6N4RFLnWxkpd6K7kHi1Pl73OtJvpw297/QI2f12K8WG
	HE3aN/DW6vEwMAxfl6+xAhOhs6sNGwGIrax3E5vaX2l/8rEJM1mJfmRauLxbTpTRbL9NIHS+LFI
	52GYmS5fH5IELeeUw91xCQmVCdH6fhl2E9BetqubUvrDm+sBmVsO2w2MqBoFp0zE7YNhDbk96ut
	Fh9MAqIp2Iu0/eFEr4cfgLJ1Ts/IU3Rj6FNC7+4r/oCCHzxseKW5yHassocD1QnnlxSA7uirviJ
	gMx4DJPmbJDHqKJK+1jk9QdRZl9iJy4Z4A5o0QfolqCJhhKdY1OtlbzueW3wWzJXdSgyVmdP0Rx
	SFjtgCV+1LcyzLbnkpcNRAzc+OEmdLkvbZujP4+cO/ibycKgCSCQtihhACYRtvRV0Cndp1cLJ3D
	tJnS+OgqTHJLueJlXwEIRL7NQaYG67S9D+9EfvSDy8yg48FOlY7Oo1LZ6JS2QHorijw==
X-Received: by 2002:a05:600c:4e02:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4ac1228b10amr249125665e9.0.1793630639118;
        Mon, 02 Nov 2026 06:43:59 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm22633147f8f.4.2026.11.02.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:43:58 -0800 (PST)
Date: Mon, 2 Nov 2026 17:43:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware
 sample
Message-ID: <auihq9nm86d6D3MW@stanley.mountain>
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>

On Mon, Nov 02, 2026 at 07:44:09PM +0530, Kurmapu Sai Devansh Prasad wrote:
> >From 9114eb9d60f2c4a52f05e3a33b0d6b8ca4856cac Mon Sep 17 00:00:00 2001
> From: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
> Date: Mon, 2 Nov 2026 19:11:09 +0530
> Subject: [PATCH] staging: greybus: fix string termination in firmware sample
> 
> The firmware_tag string copied via strncpy() is not guaranteed to be
> NUL-terminated if the source string is exactly the size of the destination
> buffer. This can lead to a buffer over-read.
> 
>  Since alternatives like strscpy_pad cannot be used in user space
> sample code, we can make it  safer by limiting the copy size to
> MAX_SIZE - 1 and explicitly assigning the last byte to be a NUL
> terminator. This ensures the string is always
> safely terminated before being passed to the ioctl.

In user space, using strncpy() is fine.

> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings
> 
> This is my very first patch to the Linux kernel! I've been learning the
> process and would deeply appreciate any feedback from the maintainers.

Put this sort of unrelated conversational stuff under the --- cut off

> 
> Signed-off-by: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
> ---
  ^^^
here.  So that it doesn't get saved into the kernel git log.

The patch is pretty badly corrupted and doesn't apply.  Read the first
two paragraph of Documentation/process/email-clients.rst

regards,
dan carpenter


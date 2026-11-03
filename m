Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.139
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793702064;
	b=M44ZkIKn8m10SVR3qcYbNkifSgq2e3BXKR5s55A1llwJEqcm2oOtdvUgSk3wGWX4PxtT
	 cQUKkhFyrfCxDjsaqf3zZHpbILNcFpAmdEtXGwKbEYnHvWcrUKDcbPmxVzazfiXp8R7N6
	 Dfalg89oisrjvSedF7A8ky+HatI2zFWoGqaPv+eF7btzg0TqagEWxG80XyAOOVewvw++M
	 hp2M/c4sF7b9HRhSxjHtiXFMIbN6YJdedzSxT/Rz/IeSD1DhpycWTecLNwZEA920upqAH
	 kzNu80RLbOfu7PoNTpb+0cOzY89ElXhPNYFJi4KyA9bhjKQOIPzBNjScKObaQ4/SuVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793702064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=XOmN6uI5+wry7lHPZoeSnGmX96UmyVh3KKEQZr7ankQ=;
	b=4x0qhguqpwvJ3ngQQDSRrVk3aLOZk1EFUnnZMdUshTjb0BYlDFUQU2nVHNrADnEqfSA+
	 4mzMW2ObPjw1tfARA+YRSpwf6yAUqcNhnbTeak2DIsSCiwNm0TSeaWBGd6/qbEusi/LTT
	 PlfJBuk773XEFXAzPUSUX7VyIgWq9GXQy1S5ko/Wkdwqf3MnSRL7q9WtWNmpgZGajtWJa
	 1KCE6QI+vfo19KeZT0LDp4QY6wlJjiZPFy4FCz2oL9b9GPDk9CunaZbB22nD6BQWb8RFl
	 Swu3pOb1wCgH+FPnlo9eyNSXNhL2AGMpVvB4RSjlJpQk9IOPGswws+6052kifvnOImg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQNKNuGj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.231.139
Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6A860850B7
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA6A860850B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QQNKNuGj
Received: by mail-oo2-f11.google.com with SMTP id 46e09a7af769-828c0b569f6so1525216a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 02:34:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793702062; cv=none;
        d=google.com; s=arc-20260327;
        b=F97mQ8kdLuT32tXWSQroDJwL6CFhT+0Ju6tid7ycBEyQRqo0tzlPPeYf/ARj3t9mPV
         0GdPW7iBgaF7rghfllVWZOdVBxhjMP+ITxbe+pQD+E7rxBxIun0CnHZLH3J2TsGS7JYk
         nPf6GhvV+UcjRE4QS8XEJIA0DCi2LVJyJNAgkiaPgGKx0xS797WdBo15cgTtrVYKu99C
         XFLVWiYtlva45foIjqegsD4dp3Gb/YD+EyCSt3bUoPQ3MePyoOqrI6G8WTCSxQrAuBtc
         7iI85P8/byj3GXMdFAC9f+dSa1dk6Jiy7/0m6aJwViIMG59Tx6J9tEAuCMsP1rNSYo+C
         fAWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XOmN6uI5+wry7lHPZoeSnGmX96UmyVh3KKEQZr7ankQ=;
        fh=1wK5Kk5UyJ9m6802VUhVrTvVj8SGKWO+zxgIxeHAyyM=;
        b=YiN3ziQ3dmfe/kJ3YEBs1XD8aab0tzYEllKMyIoqHcActkyEG/xS2fMByNwSRHDKib
         WRRJbHTDjpr/rSmV2PhKFsYwrABIASu7jBMqzULQz6VkgQEAf1NNQxVsrCn0yBjCyrli
         UMMTQg4cWeDym6/NqvWtYXiqxEQXr1ogTdXBvZPWYnJxDkA156/IdIuLStiDgacP3/2L
         Adh2K4l1NFoMEAUXtFjU5p6R11W0wMdN83wo6JIgpLErxHAJ9dE+BHSxzXXUNs9+7C+1
         thgImKwpNhNOALFYrmx1yOBPz6CV0DkoyEeXMCFLqM/E+7siaB/1xw5WF+BRnNuxAK0J
         zLaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793702062; x=1794306862; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOmN6uI5+wry7lHPZoeSnGmX96UmyVh3KKEQZr7ankQ=;
        b=QQNKNuGjmwA56Mma1Gzi+QHMJju7hE3+AoXWA3w9Zjk970uNOO4ovFZiZl7gzB5C1N
         J7WDvynk50Mni27wvfa2ZXPcKBIQV7G8qE4YL6dohmV7MJhJZNdbni3r56oF052NtPEE
         rC0hv7+Mb4utA4q325CTjjqnxVlAbk/PWq8CneGcLzt/x0FAn9t7lXYMLmcPAAMbg3y9
         XX35lOXUbDcP4NCDFD4M2k/+YYaOWIHgYxLbAwVWAXG8XCYa1uWUwH9nPg238lQPEqgD
         KKuXTu996skOcqWgntwgfR/vgg1y+bV/07UYm2mU/VvfXwx6uDVXfSzF0pfpntXydSBD
         v31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793702062; x=1794306862;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XOmN6uI5+wry7lHPZoeSnGmX96UmyVh3KKEQZr7ankQ=;
        b=sCllPaEwxf6fKok6MWmcKaDd8mC2t2QhzZ0twHV/idHwCSBXPrcP0kaysEGQO5enN6
         vPi8+e2YF2q6qzKMoBaEGIAQj24l77uVHYFI2M5Cce7F02TBWfEGYqVSI18XFUXASd3H
         c0odYQSJP2wW4n9OckZvoFJEqFnLnHTVPiu2LC8N+6rLBayiHatF3Mp/jcArvqnn37rb
         PiVZz2/oTfSab7NbXz0pMNX/KS+hgQ1z2JFsxSVJ/WhRNSVdupmbBpi3N4NousN5QnYg
         bpple+XCDCgK4LDiUxMAX5ijcd9EClPcD1S7NO7w8weAO0nuBMFO+83pPc0BGAIJBXOe
         Ir3w==
X-Forwarded-Encrypted: i=1; AKwUvBweU7cmfw0HgO1rcwtm+HQ86bXUFLxVRsnyUNwLwptFJUs6C87kBXgLptCaC9vTdu4Selw0l9F5/ic1E7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LOnPccAXMwuH3fe4EHCB1kB2GEkakFpzW8RiHCcQvSMybKefg
	p61wf0FJXgNr+p54lyrsB2GZoFT6aBe7DOMgdgxrZy9/Agw5JMGmjFoEb1hZd1ffDyWx3PnnnaW
	JZRMYG/HfN2HNN/dcre72Es9p1sdEnOE=
X-Gm-Gg: AYBFou1E9PLIZdcmmzqL2/EUbt75u9nyWEFvQdD4F1eBXMwp8a7yS0wTug39yQXNTFu
	je3rRo1x7byU6VYLzL3oBfrQ6e6nZmEqeyFKBp7zdCD1YL6NZ8Z1wS+w8WBBogoXXQYSYi5Usqd
	qTN0NUzn/2GH13xGJ1Pwuw6uWUOKZI3fF61Hz8Zn/r9GaxeZ4IYujkbvLXMxTTjc9/Zt/4isPZk
	e1rAoOJEQQSRRq9lUecAHMNiqNUkLOaLSpnK+1xv/6HAYeF5kqXhZ10lM7kTzmQJ0Xnd2O7LRkx
	56AQlQjFjXtc9pgmOWYVjrQOeR+q4/nZo5GSYVz6buvS3ccxRNH1os3ZsAXxCGr7kz3ciBwk8jk
	x1VIaKSuQeE1FLcNMUnC5618f3ygOQq86RdpTetzwDFuW1eSLmvy5GRGAvWTXzT7Shg7UmA==
X-Received: by 2002:a05:6808:17a3:b0:4ec:4c7e:37b5 with SMTP id
 5614622812f47-5640ddb4f38mr7698087b6e.29.1793702062547; Tue, 03 Nov 2026
 02:34:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164619.89992-1-dennylin0707@gmail.com>
 <at9xXRhD2xZhszEj@thinkstation> <xmp7ni65vbinfj4j2baisrhp6xzro3asbepuq7xp3mvx6maptn@r4dnoj63uw4t>
 <at-XtWBQg3jv3H8Z@thinkstation>
In-Reply-To: <at-XtWBQg3jv3H8Z@thinkstation>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Tue, 3 Nov 2026 02:34:11 -0800
X-Gm-Features: AclHuK9ZD1xD5M3EAerFCyanz0JIq-n7E7W9-r11Oa-jyzsbvAJqtwo7Cf6PVcU
Message-ID: <CAGEkeHfq1xZf_jMw9a9cz3iunj6O3UZ4-=iW-65aN2Ss0oT3Uw@mail.gmail.com>
Subject: Re: [PATCH] shmem: do not extend i_size when no data was copied
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Jan Kara <jack@suse.cz>, willy@infradead.org, hughd@google.com, 
	baolin.wang@linux.alibaba.com, akpm@linux-foundation.org, 
	dave.hansen@linux.intel.com, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 26, 2026 at 06:18:39PM +0000, Kiryl Shutsemau wrote:
> The per-filesystem alternative is a 'copied &&' in every ->write_end.

Would it make sense to keep this fix local to shmem for now?
I'll check the folio handling before sending v2.

Thanks,
Hungyu

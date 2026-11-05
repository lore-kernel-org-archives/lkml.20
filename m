Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.231.203
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793855338;
	b=jiulfzoWf+Tow2ASe6WOdy4uqg8X2TgeyGMxNF1kvcs7juqKkeWLZ76DdzmewmHmrszN
	 d/t0QUQQ3FaKy40KzmPlIa22He0NINAKVoj3bizReU+jwUsNYaoRoRQe3WHD9RDlYe6cp
	 nEufvjBKG5GDgATH+CqynGRREvgNiHVwJZEIfJnS+peYnRL9UoVUoQq2ZTedVIqDL8KyM
	 PcYd2zn1wSLAj305PtohF6tB7Lb43vf+puIo1xiMpwI6RaVrvcJknL/aYEq2od0dKXm8T
	 9I9hEK95iWOUe2dlT8aVKPcrTOlyXfYk3FMt2a1r5hzZAewXcxBy75hNmZlb4dW8HJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Content-Type;
	bh=F49mRNwIXXKoaU9d1R0TU/cMDFceqYMXuPvzpIRBwac=;
	b=g6rtZackE/RENPLQHQsl6slKRIy6sl4jbnKYR3KnMQuGwHfNa+MrNicjl//rcqK0YRu6
	 rU/mlF62E33A3JhaBkMiX41yoJPbZgmBxWR2+o1m9QKiC+m24/EIPLK+5nZcoWjagO8kM
	 AQnl4hNIropm2oRINmAJrHqq4lbVVSZjiWzj4dcoU+G+GJug8PUaKLN3ZNrUrUx/wPZyR
	 IEH/RMKv9OvFETZqNQyNP1TAngrd62ttBg1xjsuI1Yj3P9XxNVwXNmPILsza9rWEGk93N
	 vRlQ/2wO5fxjanbIw3foWQT+a5NhsRbzrSUt0HXvjLD3RRpsOiW6zqf18SeyTnmLa4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZbcVMO+d;
	arc=fail smtp.remote-ip=74.125.231.203
Received: from mail-oi2-f11.google.com (mail-oi2-f11.google.com [74.125.231.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3956606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3956606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZbcVMO+d
Received: by mail-oi2-f11.google.com with SMTP id 5614622812f47-4f3f1adebb0so552415b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:08:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793855336; cv=none;
        d=google.com; s=arc-20260327;
        b=JAF0i7vnr+EZKLOmLljsqvuJ0td9DR+Zdw+SBaKFzcAlvjF8N2+171eTo633hqTdvL
         YtjIt2Db27ogqr1eLTll7Z1qRoDG6s7g3BpxaGNbtWtDC0w0Py0JniKWDwXBtS5Rifk7
         7slDbnhdWxRBs7V6Sm2RxoFERb/zUyTjIAljSxH1V8jNA8LQZUz8HmxAcvJbh1svDHrU
         Gi9tTlKPEnsnSPjYdIRBx30yqf6Af1HyX85lWqS7lCKjeb05pUshFXfWGjmDGKsdWA3Z
         0xeWvwnoxbAphDGTVzfstOjlKUF/YEU0uqB+8vUS3hFllMmNQIvRip5pxa3M4/iSlb66
         qhxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=F49mRNwIXXKoaU9d1R0TU/cMDFceqYMXuPvzpIRBwac=;
        fh=qqWilhDYxZNeltWhHhubaELuCS+AA202AhTmYaTcXio=;
        b=ORiOZ0t4m6nSjbXG/grfjqM3bV/korVA+9H4V3qBpES3GY1ctLL9NL65IEh3baRH5g
         oGNKE4t/25jTJxqB14IE1omg4qzWvQ1PTl3VGT654ZFjbahS4QOu3Pp3xlmtKMK0gCJ2
         7jtw3vDFDjorF6tX++OfD5jwazIwvPBFftqWijwiYb7iM6sqE3LNPMRrqx32Wi0fTkIu
         DlhWhivwUMhxTabAnILp3YRx49TtCISyW3rPw9wgUNmmrbGMyoPUDmN60zoWMBe2Kwe8
         Uzkuskng591UtvZVEd6h1NU96xSOcxE4eGeLR5t4tIa04iPz1ZQqkEPkqbXlV8VdbgVm
         xngg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793855336; x=1794460136; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F49mRNwIXXKoaU9d1R0TU/cMDFceqYMXuPvzpIRBwac=;
        b=ZbcVMO+d8qwcr+LjKwI1ovUtnV2jtZiGCbR5yVtezS/VbJnmpZgAhibdGeCD+/j+b4
         ROiLVWPNDPF6rQsv1L1xB1tg1yDghKBi/J7RDgR9kIRH9qFjhNTNA/adF0iE88qheNyR
         t8jNAFy2uFAZcrG7qNhqs7/mXem6in/7z92u26l8SqSXyBwrMG9VN3I/oSQr6V7hHe5i
         qCeDReNgvmU5Z26E9wlUDgezEiILY6BVPG2Jv8SftgJfvUmyC0BqRMYna0rWr8LQdyqj
         o3HeLuxcTKSzg+l1U1SHMkD/wGN/t/u6+nKkNKfUxyD7E11Kr/HZFeQN8TrWpZMtQCoZ
         C6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793855336; x=1794460136;
        h=content-type:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F49mRNwIXXKoaU9d1R0TU/cMDFceqYMXuPvzpIRBwac=;
        b=IACgyK0qWb5iIzofvQAlILcY7CJvOr5lixNq9w04gey54Jwld2bAjL42rQyaRjnr3M
         6XlRdAvy0rp6UcTC9+fOQWRPqW9qETocJieG4C87ru8DA3N8zTK6s9p3rTjABEhT/F4a
         22Qac5YZTBQd30TFwFWiiqlSMWbgSjJSwE25rQHsayXc3Odmb5z5DlOyse6u24BkSCN3
         AI42W9M8cuRekRKCEpYGeYSlsYipDr6DRtCR82l+ypJnXLfxyWZrUuXt1NZM9yssvx25
         NvGIjHyBw1tA2TaS1Ki13B1bVl/yxTniptIQPKHoDFavoxTWAH5T1N/zIl3s8S5r2MqH
         v1lw==
X-Forwarded-Encrypted: i=1; AKwUvBzM45Rq59EyNc9EMhkiRFrg74AZlZCNA+YF13PYWdkPONn1BXqKdmKZi+SqHH5+IcTHCm6qNEOYNjGlA5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mTZ5QxvSE2YQ/imXZp4ixAQ3leEyXx+e6m/YamhJ2Prtnv+e1
	sB4R6dn8FO/jqArDCvnfWcNs1yQqDWFaI+YKxzXmPkgSRCx6itVXcaX8LcOTuZz8rkN3L+Dyljq
	p0vO2vAt5LTsOOLj0RGywaqPSAn7ZnL5jxA3M1cLLe1pq
X-Gm-Gg: AYBFou1YX6eWGJGEtAUxwWF7F3tlChl1gUtMiWXRJpbWzwWtr1yTYlu3r4G/oQy7Q4Y
	iiZApNZzXUtyx0BY2iKXwAm1mWRFvmJ8M2EGAGf3BQn+/GPN2uG2Yn8fx01PAAD9uCfBL9RhUkQ
	5MY3hv0cV25ElMOC4oAnw4eHiVIz9vSzD/ilJ/1MFk4rsq+fgy8/tf+gprMzSzj7v1TPJJDer6q
	it7wTmvcBT/F0qUSfk/xepDQWnAIydgB9o6NylPXF74Gi6FrH7fJkCOwy6wJ29dz1htJgUaBLOe
	QdcDWP741CTKzQLXmyXPQjNrlY+LYMjbThUULITN30P5ZnztnoSpGWse3P37D49YX3lyJxEL7Vq
	SLhF53sMRDzaycfxZPAC4sPUpsq0Lzy2opL2bx0m9RYwvIH45m+bPtWYp4av/hSPmPHIjWQkdy4
	8/PpkZk2JoajH70w/MYhTHsBKnsyfuplrOl8K7/EWcrW8e5sjSuejobkohbsrR464Sjg48/Yz/E
	ao=
X-Received: by 2002:a05:6808:198e:b0:4d6:9293:9b56 with SMTP id
 5614622812f47-5640de2e892mr13926693b6e.62.1793855336421; Wed, 04 Nov 2026
 21:08:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104191355.89544-1-dennylin0707@gmail.com> <20261105030304.ukyfkyh7xf66yf7w@cs.cmu.edu>
In-Reply-To: <20261105030304.ukyfkyh7xf66yf7w@cs.cmu.edu>
From: Hungyu Lin <dennylin0707@gmail.com>
Date: Wed, 4 Nov 2026 21:08:45 -0800
X-Gm-Features: AclHuK_8naWfPmbeC6CGznX_C73hXCMzOor5rRkYJ7y1u4psfW7icnRznn3rIJw
Message-ID: <CAGEkeHfnyyggAXOUy8MW+UT-B7FrG9sPWcO3CNysA=SwGp0m0Q@mail.gmail.com>
Subject: Re: [PATCH] coda: honor the append state of each write
To: Hungyu Lin <dennylin0707@gmail.com>, viro@zeniv.linux.org.uk, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Why do we now have cached copies of f_flags around? That sounds like a
> recipe for getting things out of sync.

f_iocb_flags was introduced by 164f4064ca81. The VFS initializes it at
open and updates it during F_SETFL, but Coda's direct modification of
the container's f_flags misses that update.

> Anyway, your patch subtly changes the container file we write from
> cfi->cfi_container to host_file and I am not convinced that is a safe
> change.

That substitution was unnecessary for the append fix. V2 keeps
cfi->cfi_container in the write call and leaves the existing i_size
copyback unchanged.

I traced the container reference from coda_open() to coda_release()
and could not find a path that replaces it after open. ACCESS_INTENT
does not return a replacement handle. The container's contents and
size may change during the upcall, but the existing size copyback
reads i_size through the same held file reference after
vfs_iter_write() returns.

Thanks,
Hungyu

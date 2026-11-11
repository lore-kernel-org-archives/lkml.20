Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794387748;
	b=InBtbKd3yGTSKIiVsFiuRZqB7wFIXc4BJT8/RHLN4gUsGG8S7lv6mvcvCxTc/S77aFf1
	 938WtWdvtOPJ6JqH/01DOMwmjiKsKe60UNd0enuOZFlBTgpa15shsqTawMBQgX3ChzuCD
	 EBsZJBX+yLL9KgjC4SINtNyJRCkCIZ66daW8ca/lYMBxgRG7s7ZnwAhrOeUyC8bJxRZgd
	 UbsP07nmdmOp4vIOFoN29PF5T7qSrywh5Knna88g6r3ycieyQVFFFoSOyERTbTGDHTLQ8
	 IipGM55juSy0zEQiFRVAaXL4wnWGQ1Jg9tl2iIJTHZztlhm1GpwsYxoA/ClPFc3WNbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
	b=1rLdUUOUI8oCuIj42DdIqXHXCBHvzmHt+HXdKqCq+5GtEvItciZoHRyvS9cXm40BptMP
	 UUcMpr7jldcAvtKwObd3GnWtbkuJB8dS8e4yuRyT0jB1AOVXWcTwZTlArUJ1HEUEvwuLR
	 MdTwKVvPbIeheVAkSLxHIgYofoqKgfD6jy0FIiaR1zohEE7Bf6sDC4bOqJh+159kq8CKG
	 7CC1i1I0EX4vEHz3w/hRs+9xMBnc/TIYuOBZDHAl8LgDZZPtnM5r/mS+MpBIII3CFhvVw
	 rGrrVfDvWKK77SmiOUgUCu9+gh01lEFd6Inb65bKtXIBnmsyByRwuvrQV/Ely5GgbOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ZG1wV17q;
	arc=fail smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2250606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2250606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=ZG1wV17q
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5495d549924so30110701cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:02:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794387746; cv=none;
        d=google.com; s=arc-20260327;
        b=YgrGbGYYmE8xv508bdyx/CitiV+BT01tUfCra2Jfs7f2g2yE1V33qMKdCfFl2XwSO7
         pqRKSdjhhRx37VrULwJkgzmPUze/ievBYZPXsuHiUxbGyZdYyVD5os+KmIrZkMTGqRt4
         kiwMFCJHgbg3btYtc2JM8yyxFOg/MYpbS/CYzUUknU9LOmRLedBxQRnbQi5QzpZm6nc3
         4OdwcccLJKDkpnJO2AyA2brChWxu2GuKp4wUzVYDlw6kRJPjuAlKtsyfIzM+XnrAWKG5
         J7n10PbW8ymLN1DqFz9R2NFhbYUgeDdQbPjLQ5NyloJ3LWHTKfqrsyOetFSSqRGgKBFP
         G8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
        fh=HoH6uu7UjNyKwHls5b3WIw9omHnNblBsSrOBQqlUsvE=;
        b=lxU6r0jVyD0TPbGsBGZbu5BHoAFtO6L/zmv71cV4RGMQv05ZjC6HxXc23mB5urAeLH
         5x7Ld+h7IORK7RI1McVtDyhcZVRUwV2/xkdTgDcrFGTOBI5bC+M2UtFfEXTR5ziw2x1A
         hmw1Zd79kxxSaVbJFDTqPwf0jrtt9izr+Plpm2fNCs6RfOMPnQqk5YduEodwBJhqgCtx
         R/MHqaZCglhpXOx7izuaGxH/9JCMc/hejGMrYpiXUPHYafo+vLkiL+d6U6rrhhtbo0Os
         7pASP+o0vhm80baHjSiTR4X7Z7U3YAvbDnyIpPXQKlPsaI/9/eXhCwvaPZrxiMCunI2z
         pgnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794387746; x=1794992546; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
        b=ZG1wV17qi7k3y+OgTB9oJ+Iq3qqKdjhEB6Voe1crPeuwQy0wcDNfv/bdudwdrfdRw3
         ADLgOcPbh/kgKQc9CUfDrcimVHeDxii9BVyDhy8gtwLRFQrYbBk+hajpv+6KgFLrz+NI
         al6FswZ2+KsdhNnysas3fU0YuIKpHZj5CWMcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387746; x=1794992546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IjyYgf5Mt5Oaaa+hEYrZohiloVo+c5H01zKLrOs5Ypw=;
        b=YxDJJtnDeg3g2lT/rXZfnsfVxCgFALGXHsp9poj+peargtHqdOLCBMM1IuXiOmDhO/
         LpvbGtwalpSkSCSwO9uLFdpAMgcsQFY9eRF0yrVyWRVHmmIjVylx34C3mdchEFl4leMQ
         xD+rQI5N7tzpRPzm8KLAhCuMLgUwEVZxBatmHzNp9hwyX80dr2MqZwR/WjYFU1rBqFja
         6CXaww8I4eExDUzUFqy0WXRN9rqd9KyFZjNA3gShqzThHEojk3MjSYPIEt2Y+peAkJSa
         l0SSZcAO/straW7lolkgOzeQPBXygMSZJMOl67Io3aNe+HONFd7lbIFpK5ECZi6tXQWE
         qwgg==
X-Forwarded-Encrypted: i=1; AL+hErGre/fy7WuKMoXNJ96Ldn/a6pGVCUWV5e+Vf45VdTJMaQ0HLy6T55+CMxwDEWKwEqU7dW14fNM5fgBwksM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tokIs20G/ozj4m4SL+oKcKYZykf0tJOM3hyAqSSBhKwy3oYWb
	iRASVd64NKeYikYCm817JitVVN9e4LC3mMEzas5lyjf+km0tYEFSaM6ScA2tnTa6briJjVcqJWF
	FI+dI/4SiX/vO/8vtTyuGQa4dGeHAtrQG9s6tZpzlkQ==
X-Gm-Gg: AYBFou3DVWaJFPH2nNIMSAL/XS+W3RVEOSL5CF3If7oEKyaAOSZHz+C9WImrGaeln1M
	KVZm+uaD9hUOVvlZOauNXW6qb9WmcIQ+cggSOFn1Dnk/ajMloIlZIxjw3SKVpVFkMT+5ClGkNOP
	fWmet11x5mY2ALI+o/AzlICcT8/SRWE+wl+GHzKUQh5Eh7GJHtt7XgHbKm+Ni9oyjFzIdX6SePm
	uCtrczJXqLGVMRXl051Qa4ejMNaQnyUpuMLvgI2v/vUfppNYY5wavPn1Jk8mgeApKLzDohPINXU
	6WUiEp/X0NSYs43pCZhfQyVmD8FPevtQ+gtdhOGjqgrsOdDrAEhPzpCsGZ7LPf3EE5LIG2yljEe
	Uk+plKYv4ap9ZZLNkGfzVul6IawM9HNJ7kg6nfElI9C5cOhR/TwSqwu0ZOAXFx1n1hA==
X-Received: by 2002:a05:622a:34d:b0:536:8f5a:64a with SMTP id
 d75a77b69052e-556c222b82bmr24946931cf.63.1794387746372; Wed, 11 Nov 2026
 01:02:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110145241.536019-1-kas@kernel.org> <20261110145241.536019-3-kas@kernel.org>
In-Reply-To: <20261110145241.536019-3-kas@kernel.org>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 11 Nov 2026 10:02:15 +0100
X-Gm-Features: AclHuK9XqiIqd0G6zWinytDup_EFg0rRz4_cn9sSXLX9jTiH3KRFdGlFPrXk02Q
Message-ID: <CAJfpegvEeGN073FbaCRnhMeX8RHrckSxmFjkpdoyea2EuRf+zg@mail.gmail.com>
Subject: Re: [PATCH 2/4] fuse: don't move pipe buffers into the page cache
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Amit Shah <amit@kernel.org>, Jan Kara <jack@suse.cz>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Bernd Schubert <bschubert@ddn.com>, Hugh Dickins <hughd@google.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-fsdevel@vger.kernel.org, fuse-devel@lists.linux.dev, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 15:53, Kiryl Shutsemau (Meta) <kas@kernel.org> wrote:
>
> A splice() into /dev/fuse with SPLICE_F_MOVE lets the reply to a read
> request steal full pages from the pipe.  Each stolen page replaces, in
> the fuse file's page cache, the folio that the request allocated.  The
> page can be a page cache folio of another file, a page written into the
> pipe, or a gifted user page.
>
> Always copy.  The server sees the same data, and the move was a hint
> that splice() never promised to honour.

Did some research and looks like this feature is not used by any major project.

Acked-by: Miklos Szeredi <mszeredi@redhat.com>

Thanks,
Miklos

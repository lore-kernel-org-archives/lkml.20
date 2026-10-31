Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793483045;
	b=urqYpmzl5zdnQyolDh7bJGOenV1F9uE8i9eC90P0mahTnzYt9R8yCad+E5+kD6iEO2oE
	 acH293aI5TyfewmUUev8sYdcWMkY1C8gl6ADvQB6zbga9Z5GwgRpXXIEyhgnjmUbsw98K
	 1iStBg0JZnAFtHo4RNm7kJK+g2L5V7pfhyKgHbnyTygbiegSUZzeHzt0xQ6464puB3oGT
	 mqkph5/CjWfh8AlH7p6+ZE8bg/k8xnknz91nruG8fEjZijIBbEoKDzKp5qBY/mP55cQK6
	 JDQng4iGoDzeojptZtg/qnfEVsJ6ITp2FEbQvt5iBFP3/Fstz4iHq3mx4qDOXcFPMSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n4/FdkbJCBiK1V2GJNaCfclA9B0e/fDcc+jSWi7alCA=;
	b=IHj/oAepJYavaPjdVWx9wQShnwj6PG1yd99rcXDugqSEqS56vM6x1S+9NJz3Zn+IVlTb
	 kaXJQFsnZodfKN3KB4h/8PfXQQe5FwjL5oT8Hf27ah+nF/xp0ZkewT2L73jsfTw8DPz51
	 aDAHPQ9HLlLQhWRiLh26iyFDSOB8EgN4hBbVX7U3LRM3vSklAw3VVQIoHSr2e8eJFh24w
	 H8xFGSftgoHti7ig88sUEXwn0v4BRgdXbYvzaTbA+AoTkm5PYTVbeMF+zjP0bSPVBMjVW
	 igDiSttk9M9VuIiwz+FJHdxuWZgoVqzVF9Y224FNZWqsbLxlx9fPBTvCkQHd8Xvll5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=amacapital.net;
	spf=pass smtp.mailfrom=amacapital.net;
	dkim=pass header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VlNTMbus;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A100606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A100606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amacapital.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amacapital-net.20260707.gappssmtp.com header.i=@amacapital-net.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VlNTMbus
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so1827013e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:43:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793483038; cv=none;
        d=google.com; s=arc-20260327;
        b=b9Qg/8k1pFzn6kfzTkC6gM9nPsBERdET8w/YrP4cxGi4EQE1PC0g734DrLBcbrcY3i
         LXvELnHKmugnjgTcR+y0pClATc4MkZcFJqlwxye8UCz7voki/xiogVpFKACCccyN9Fx9
         ztrkF8c6DgWcA4pHRu0hzjGmQoPl32Cg6Jnd8LGppA7lR8xhgGlqRicYBFv1jP/cDKYM
         TzcjpOl5xmQirY1Ib3tSquvUHAye3Fjhz5/QZZacGOBhYNuQiuiqlT4NmLZ4eytzhqjV
         jqg6ke0bY5tO4zq/kr+KzVybGcyUB80EsLrSj14yUXCnFtRD/vNVOTek9vF3LBgNshcV
         MUyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n4/FdkbJCBiK1V2GJNaCfclA9B0e/fDcc+jSWi7alCA=;
        fh=OyuDwlOfxdC6iuvjr6gXTKWagPEcBHB0zDMeULXtwcU=;
        b=LVdAzfljf1ckE73vmgrVT+pc9edHTnH/QyLhCM+sjHJtCQoC86KkYiOSGmKv4Wuq3U
         sXggo/BpuEQFvADbKMBSXuduymptZxWTPIFWOqaKUKrYHp6ElQe5WIyXPdZSFkWAeZ5v
         fkp5iP25uzo7pAn/iSCwMzZIBNE0/0a7KnwJB077euAdLW7RzxObZ1wi8IN6CeIVat2W
         pPnRr7Pn9Z3FwpiOLTolrX5MDj1exivxArJufkB9sWcdoY0aZQSwF92851k0CnS0vWaG
         UUVd7BbpSEquhBIAqTWzjH9VoUtKdTQXMCiS0UhrB/F+a0YMvBcI8J/0vGnyj4J752YK
         /Lng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amacapital-net.20260707.gappssmtp.com; s=20260707; t=1793483038; x=1794087838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4/FdkbJCBiK1V2GJNaCfclA9B0e/fDcc+jSWi7alCA=;
        b=VlNTMbusTTtj5z/0RoodUfO2YXSIX1yilyHP+JCuk4VW/18QD3PGWTc5f6wSekj0ZB
         j/+TxCN6iTQJfc+1bM9s3GgGh1JITXBXD7UFd4n5QoXYi0rpFXnmP1BAL9QVcG24IZvl
         8vfpwSx98fuLBVv4938WA/mQbf8V3kTnlfP6z/6KfJWNO9yy4JSyMLOL6qp9+10Dx/dj
         FJnF850XVbS6l9IgNdVuMVzcEUyf2gIe2JgK/U1/8OmEpQnEBMj4HuRZjXFY+q7Riy9n
         Q02asQ+mlz0ISiaxbXw6SRrTYj4sy9rJ9dy7IBD+bWMBwSPLBWilnrDW6RmcDd0mpYOG
         Iy/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483038; x=1794087838;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4/FdkbJCBiK1V2GJNaCfclA9B0e/fDcc+jSWi7alCA=;
        b=LKjdeuTbXVIH8BCtsZBrejjaueElYBtV2tAc8NDGbmV9boHPW28pZN4m9iJfmXJyjA
         0+9SEFcziPjs4UkwYMgvY/8KtfTrAa0v67GvkGkzmAEYef8e1BSiO5Al9Chnv3KHIeqO
         7MAeZn9LyFZTUqqEyguMJLwz36px1Uqq1du4dSWbLFjDVP/H0QCVNj+NhARd28zIYmHT
         bIsXs5pZTU3MIj68wEo67oJWk6tZFy7nrREXM3Wupgv+A262DQeq6uy+FPz/GmstSqby
         9Qstvv3+8meFz5uIeYwCPM4UjRomGTnyXT5RxOv5luJylwWXv9lJCRVqANccs7JAzWtn
         F4UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRAG+0+IJjZMBNpnBpFGVyxO4FDAzxa4GiBSMt2imbj5VhowhpwvzzeCC6NZ9DSE2Nr3ZpciZvWuqR63g=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeUpxTD4yRMNFIlKpmHVCgTJqKHmJyMtnJHRXhu2uKfYBTTNB6
	JcuUNPX1SPTcfjb97AhGvgXFlgyMkv0ATxbOWI/l8Z47QeDCC/2LWng7IpalT6DrpVHFfyW7v09
	FJdUoehz3ahRSqWC8r67/JVrf+4z0nwu6mYD7xH7X
X-Gm-Gg: AYBFou3WCqPTKqBfYVMKnyJk1WkRc2U8cAPkMipeCMFK6p1B91+G24vPLaFVZRMsmTk
	6duKraNuEFFQ+ZgoFQUyUYs5+YTN/Bg2bk5osmaP0XvXx4E3K3+CCqA/LhIzTi1KjQB0Z6kUxFb
	FbG/Q4gfInx4gsitPhhga4sDvds1X9B6NjNFapQ0oB8HHiWC8gfnZmqQJoYxkBUcPkvZh4BcjL2
	l5PjNpA70YJUufGly5NOAw1dz5SxnMP0n6+UlUekl/Z6wQiu7Db4JnyVXk7mw7EBDH/SHze/kjs
	1eWDdihIElfdHP8QwU4AI5gutfa+CT4cUEw9EVvM1LFOiiDclUS3QvJ0UHjMqdYoXseABVIGVuS
	bp1R22V85Zds7IijiRiH9MkPHFUBdg5PGgz35vo75q85bQfkXbuxgNBs=
X-Received: by 2002:ac2:5681:0:b0:5bf:c2af:3915 with SMTP id
 2adb3069b0e04-5bfd95730d2mr2003629e87.28.1793483037747; Sat, 31 Oct 2026
 14:43:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031203540.2282507-1-skhawaja@google.com>
In-Reply-To: <20261031203540.2282507-1-skhawaja@google.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Sat, 31 Oct 2026 14:43:45 -0700
X-Gm-Features: AclHuK8DXwQuKXG7YuVQ17qPxlP42BoepMeBjGp7aRwX7XDPrtPwMbgsBa7Xe70
Message-ID: <CALCETrVMC4cPuBeSgPRr21zNoCDqz5op8VR=16382FFSf9ymeA@mail.gmail.com>
Subject: Re: [PATCH] mm/gup: check folio->mapping under folio lock in memfd_pin_folios()
To: Samiullah Khawaja <skhawaja@google.com>
Cc: David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Chris Mason <mason@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 1:35=E2=80=AFPM Samiullah Khawaja <skhawaja@google.=
com> wrote:
>
> memfd_pin_folios() pins folios from the page cache without taking the
> folio lock. So khugepaged or MADV_COLLAPSE can replace the folio after
> its refcount check while memfd_pin_folios() still pins the old folio,
> and the caller ends up with a folio that is no longer part of the memfd.
>
> Lock the folio and recheck folio->mapping before pinning it, like other
> page cache users do. If the folio was removed, retry the folio lookup
> from the index that was removed.
>
> Fixes: 89c1905d9c14 ("mm/gup: introduce memfd_pin_folios() for pinning me=
mfd folios")
> Reported-by: Andy Lutomirski <luto@amacapital.net>

Reviewed-by: Andy Lutomirski <luto@amacapital.net>

(with the caveat that I still don't like the fact that pinning a folio
does not keep it associated with the mapping.)

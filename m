Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792799451;
	b=CAFKBEC0zvoN7yTQWYN2rwX0NHbAqX58CAQrrDJ/mkRSY2qt5GR8Qny1msT+NQOYrny9
	 i0nmpCkbFBvq/dxn3Q8R6f2Q/fFSre52BIBR0f09PymKARdAPgRhR9EUpqObpm+l08FXK
	 F9WlfxRzUi5OAayhlfIFUC7wWY7NRxzLZb9kwu+Wlk5Q9f0AbAsOwlKrtAwwEJ9RH9Fbi
	 qglJfq8s26P9aSArzUvsk0AFmr91md3KiORjpxcSp0AX9WOTQpoS06GYCZEJzKAao5raJ
	 oSXDiPRiGv2HD1mM8dqnfX4bFIxD/L8OoAjIHhBT4boTzcKwzmMC9tiE/yEQ1Rhgvuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792799451;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=vlcBaig2eiYIC7Heg76adexHzQQLeESxJrW75j/rih4=;
	b=0oYFlDylZPaKNJxLgTvQwxHxbEnKw89YC8xcGe9m4E8e+iXGzeiOqmahVqO3NV3Wv3+y
	 Q5oCOb8JtvGS5TkWDyyDPxh5USF+cYIfDTWUgzou6Zuxrrp1Vg/WvLGOXU/5YjBqNYdvw
	 umzvJltbBhlTlnt2XR+aLmoDWq4IyXHLoZ8oSMTaj+L5qWZ6m4rm9frIzr8MrGu/vOjqy
	 S9kr/qUIinPlQif2wJCNXA3cFUf2JJhzgbAVc6HFX54W0q9LtjKetS4gnmZ6og4DWnH1v
	 IazqFUXYlxCtg8NyzE14rt7di/PyQHZmoWxo6/+yKxZIMiguBoFAmmJdIb94eSXfrkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Pni4Yodb;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79002606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 23:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79002606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Pni4Yodb
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso209987966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792799449; x=1793404249; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vlcBaig2eiYIC7Heg76adexHzQQLeESxJrW75j/rih4=;
        b=Pni4Yodbf1mP6fXHsMsle90mF0iK7s+FQiU6ILzqTlZ9dQrB+iDZzUQzMVSHGAycXh
         VWRr61du2jtBI6ZgdbqzXV6AxbRkGjrjaniQhGCigU5TWsiAHpKPnnpFaM1kYYWEAP+E
         B9546LRkaL1sKyO/+muihs6DA/WH3LpUMzSJI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792799449; x=1793404249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vlcBaig2eiYIC7Heg76adexHzQQLeESxJrW75j/rih4=;
        b=AqW2gXZHGOylMWRZK2y9PnIcs2yc3KogKpqpkAGxag5Iug6pG9foD5/9DH1+hnVitr
         VUZ3LvI35bUYDSAZ+aL3Zyb/i3wVrsIKzqyAP7NjTlz5ikm5mJhthIdJI9IVXPh5GIVU
         9htT8KrZrvXPMn7AkrWd2aRhu+tOCFBhpgZyoy/K/ysedaQTyeU4Mh1FxO8ZHRgwkStW
         4tMIedsHYvY+DtGUvv1BF74G+uDjOsdNQZ09eXekSf6iEqIaC2Wlbkzmn0/IYUhJnhEi
         2LaYAsT04zztv0VHFOHxBVw7PHTWga9wIgJrwTFymj5+P9FAP3le2Mvn587dii8mTPRZ
         ZCew==
X-Forwarded-Encrypted: i=1; AKwUvBwxNFk/+0TTGPXyxdExbb/RqALn1eUly5O7hGmcukIzzx201K2VUyyFh4hFkg9mkHTNFsNhPsYL+Cwha5g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdlJGpHI8gtS6n+xBkTO0iveYGliZBaI2Gmvc17Ftm3UUzZiBk
	rdAIu0BzsGDaPh/mwSkQPepsKsjBvtpmM6nx3HUqfVUsQyofbHqAd5G7iy7sH28q60P8ivv5vCl
	d7NWcEb8=
X-Gm-Gg: AYBFou2gAcLCTgnl++zNM5/P7DUjX39SmIm8bQOhKdaebQyNjGUiEBH0L/l3gMIBo/V
	sR3o5SSYLtB3kAHeCXvCmazRNx3e1Cq0KEXcMqO0tE2V1jvRZ9xteNZnnabjg2NNuC6H4KylCRv
	1d1Fk9wXxA5/+jcY3mfBZ/3PwRCzF1oB3UlcGM0II3L9/ZHYdwg+4mH9l0YcUwvAAwiOFJvRueH
	2RVrtB93T29w+CJERcJLWi9QM+fnLKaRlCeiR42RHTk6RiX+x1ptin0bOOf3PN1NHIQYSz2sZ3e
	TiQmYZL6kYL/24mawd5ltw60tSGRwx85ZXFdpZrExNLP3j4tmNP00RAuUjqseOXUOQGpDkgd+kf
	UTAjUJOe6F/T0Xst72W6XUThnI09kYxCQX0lBkOz/p1aXsjqhVgSukprqkx6Uz5DGE1L6Ec+ceY
	XchTC9Ai1XTWCsx4kwYDPnKlDwAVQEIFriYYGan4+V4ARmmiK6rDsH3Vsl8Yn6J1dzE1jVNPwEx
	wYrxteqFNsTF9Rcpd0jxKVGK12jd0Ydvw7HEiWHNyBENK/yF92ho/jZ+5rbN4J3eOu2JcVri2gz
	j+kCmrRMcRoAFPe3quGM8P13Mt40pQ4FU35hMDrfwxNBTub4Zp0=
X-Received: by 2002:a17:907:868e:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c46bdd96da6mr48255266b.18.1792799448833;
        Fri, 23 Oct 2026 16:50:48 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd64a02csm20983166b.44.2026.10.23.16.50.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 16:50:48 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6afafc89b48so2281401a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:50:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwBFjUVeSnSa+Z6iiMm6EUoaRF+0Zz3FpbvzGt1m9c1Ow0hPYkbt0YILpi+VG8CB1+l8zI60E6G8hHq1jY=@vger.kernel.org
X-Received: by 2002:a17:907:94ca:b0:c3e:34fa:611d with SMTP id
 a640c23a62f3a-c46bde7eaf0mr60592766b.35.1792799448215; Fri, 23 Oct 2026
 16:50:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <2331292e-1a40-44ef-8776-9155e8e41f03@linux.ibm.com> <20261023211503.3764302-1-sashal@kernel.org>
In-Reply-To: <20261023211503.3764302-1-sashal@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 23 Oct 2026 13:50:31 -1000
X-Gmail-Original-Message-ID: <CAHk-=wh7ZfsDA8Jh0+GSpLehCzfnyME_ztcpwebnvBMDnqjM6A@mail.gmail.com>
X-Gm-Features: AclHuK-CIEJzNq1XJsklQg2H6GwGKSjs4ObZvBlYB4talL4LPjV721L19Rv5bZ0
Message-ID: <CAHk-=wh7ZfsDA8Jh0+GSpLehCzfnyME_ztcpwebnvBMDnqjM6A@mail.gmail.com>
Subject: Re: [PATCH] powerpc/irq: Fix build with CONFIG_PROC_FS=n
To: Sasha Levin <sashal@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 11:15, Sasha Levin <sashal@kernel.org> wrote:
>
> arch_show_interrupts() is only called from irq_seq_show(), which is in
> kernel/irq/proc.c as well, so build it only with CONFIG_PROC_FS, as x86
> already does.

Thanks, applied.

                    Linus

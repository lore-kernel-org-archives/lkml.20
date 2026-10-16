Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC24487CC9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792173956; cv=pass; b=AIrZ1GyB+uZG9Oyi4oNvqiAx6u15/+IlPI6Vlzv126FvMHzRqiR3J7kulM/5+AMPkY/s06GR141aSAJ1C4rJQAdB5tL/A/Ur2j2CqUZI8QVWxxgv4G0UW+4uI9NAYoWRtcOyaxLH5z4T005TGuY9vAz6TOst45eCEPpuLYzyRnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792173956; c=relaxed/simple;
	bh=W9zaZCC2PUL05KATE9nrs0p2Ph152nxKDF1hPAKaLv4=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fLpltAkgBp30J6PHzhEkN/7dp+HdR3uz9wmTJxbhPJ2ksOCBiBjciW0SIJ6lzL//2Gi0KAwn5qKOKVwjr9HmptY2ZFv/allRrtkjIpLOgyRwB9L+57phtp9SW9U2ENUC3ucsM8oWWuKPQskjQRfpY2VqZ3y6mU3/XtPiXS2bk9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr; spf=pass smtp.mailfrom=khu.ac.kr; dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b=fzLhOxyi; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=khu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=khu.ac.kr header.i=@khu.ac.kr header.b="fzLhOxyi"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso189348e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792173950; cv=none;
        d=google.com; s=arc-20260327;
        b=KV1j1NfuipY9rVJ3y8sRV1iKiORzGb8IPQLAE16LPS3WK87R8vpQyFGwCcdZP869qQ
         6Ddxn4JOGY/N5yhsgrPGz9tbzkNcruew9THRgOSFiRig6P2F7bVzelNiIDM4wRQOCFvr
         eDLEdHtnOSzKM99JbwCp58ZpsE9yubz53utkIUQLLlsZklirCOmZePAHllhBFR/pHR8s
         7yFGLdAA7iW+9KE6Ghu33hX1rEqZfCYeet07ktTW1PB/Awf5eypWxcc5fDouePtBEPG1
         pn5h14rpkg4+vsxXziG2k7+bYuVPfYB00ui4rHe81XEAwK5PHCu7Cjhifi0bDVuEBHdO
         A8Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=W9zaZCC2PUL05KATE9nrs0p2Ph152nxKDF1hPAKaLv4=;
        fh=4ac3XV7BSZcowkX/buJu3Mm8WXWsxxGKDizapvy5v3I=;
        b=e5GzFJWr/0dSsrRQfHRLNuYMbOFwDhvdhiKAu85PDBUuw51/RlOYk1UCHR2/dYwSRb
         /uqfpVrHMC3nCN5sayLPBzdCC/uHkHT1frzrnLqORO1dSwLYPSaNVfge1B8ixYEjxNDc
         uh9wgMWGwrHZf41ZYcrWX9IOICMbLJwxF1uVYgjPxQ832Jcj1V90wcT+GgT5WqUb/9Nl
         OMCEDK+zDUhhxXR0i03bO+zD1ptJ06Gm7vLu0fkcp2fRjFZOl8gIxIgjn9hOilAQ4VfR
         BkuAOz5jZJ5rJlYfncP6qFOhJtkh1yqu7yy3o5mbDebe3zI9ofuTT6GgTR/Vi/j+wSlv
         //Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=khu.ac.kr; s=google; t=1792173950; x=1792778750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9zaZCC2PUL05KATE9nrs0p2Ph152nxKDF1hPAKaLv4=;
        b=fzLhOxyiORVjmgoUa4qUBIKtwUGXAagoa/AqN42OkkSIBFACP9lg0PC3ev1/WJteQ0
         NeZmJsP6Y8OGMtweyzoIeOib+fi+6d7hpCcRTDuxDvzjeHVjVqx7eTvJLmsB5fSNR3MH
         eFEJf0SXeVkcaC8XUrPzgMCjd7zxK0YSvdtic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792173950; x=1792778750;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W9zaZCC2PUL05KATE9nrs0p2Ph152nxKDF1hPAKaLv4=;
        b=MGjXsanm58L7vUOfYbq5xJXsS0ku6W3O2dsjYa5VFBnB0y+95KD4iNTV2m+3fX1uy0
         oQJQnuhWP4C80dBneqKtis31NndylsBX1r5hjapxikmS3DsqQssBZf4ojAGcWD0c/U+D
         K0juQ9fgl7PQYUtg5X+7I+gurZ3tSwi3rkH4pS/Wc5ehaOLOqax+foc4z4c8xTXlfnhP
         vt/C+NlZLNrukEBBynLCpezHTm8gnaaughI2B6h3dpFBlBicWI2SdMxKMowYYO+xKxre
         xhJpngmd92hFRHxMLWxCsuXUpl8vWZD3f3GK7gACsF2BAingH2aiUo3t1wRXQzQy45ri
         Nbzw==
X-Forwarded-Encrypted: i=1; AKwUvBzWsqxGdApUhvFML6gQm1gF4z+uhE7n7yPEF9vx4OjzPMNLUBFdWSh5HDWzJb6/pMymxWkhZcNm3aoi7Z4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrRd+VfOqxFzO8+v0WV+pdWtYjGQ+FN8K+/JQeCR3xPTAqX/aq
	NJlnIRDt5d0GBnknT6r1KwBG/2gbylTlqeUWZHNKZ2szuG749bQ0/ngAUsrf4UykuopkCYLNPSu
	JXnstzBQcLRB3rZp70HUm6/i/d3xMFW0j7125oVs5uA==
X-Gm-Gg: AYBFou3HwZecl3whYNA9GaYGPbfPs1JTMx7v+FT9LMFmqbvTJmQRurk/ag1bfMK2lOX
	0NbrrjC5rH0FbLiyRZTylCdLG5jP2mWa6giv3PORYcaDNOvqY9Wg6ZmSIL/S0u2zsY57xpuoS3K
	Vo+NiY/dQ1Yd7hcTWm/hUvJZG39GRCHPZDCm3zs9SHI7skOyuK3oVKd0Q+oBP9k6mNMkgfTnl7D
	ftgZnWjNdZSxDDLVr2smk2UNi+JS85oZ6BU8RVim9yYNurezZbN+mCSKThMW8Al/nQm3bUQ3hb+
	2v67/gHjQGC6eXz/dLJRyZ+GyeHVdmQmgKMybeEe2lSl2XOaUVBgSHqCyVSFw0M87vdYuR+0gtc
	dIReXMz9PGGWVX1lCJB0hSihtDnAipes5AJGsy40UelAH
X-Received: by 2002:a05:6512:124a:b0:5bc:e472:12fb with SMTP id
 2adb3069b0e04-5be50a74cb0mr92020e87.63.1792173950529; Fri, 16 Oct 2026
 11:05:50 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 11:05:49 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 16 Oct 2026 11:03:29 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Fri, 16 Oct 2026 11:03:19 -0700
From: Kim Wooseok <5mghybrid@khu.ac.kr>
In-Reply-To: <fd91ff33-d8a1-4ab0-83da-c15816c148cd@gmail.com>
References: <20261010-rtl8xxxu-usb-dma-v1-0-e670d9c08fdf@khu.ac.kr>
 <20261010-rtl8xxxu-usb-dma-v1-1-e670d9c08fdf@khu.ac.kr> <fd91ff33-d8a1-4ab0-83da-c15816c148cd@gmail.com>
Date: Fri, 16 Oct 2026 11:05:49 -0700
X-Gm-Features: AclHuK9ZwgypZrng-PnEqwREU_wxzMOVesmRvYGZ8m4Qdc2U_H8EMyixUe0zrSQ
Message-ID: <CAH1Bc_w89ymu+E1Gx13M9JD7ZNmdQ3=y_zFwVvMkQMKk4m6NAA@mail.gmail.com>
Subject: Re: [PATCH rtw-next] wifi: rtl8xxxu: isolate the USB register buffer
 from CPU state
To: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Bitterblue,

> Perhaps it's a silly question, but doesn't this just move the problem
> elsewhere? Or does kmalloc_obj() guarantee that nothing else will access
> the memory near usb_buf?

With a separately allocated kmalloc buffer, the kernel ensures that
CPU accesses to other objects do not corrupt the DMA data through
cache-line sharing. It provides the required alignment or bounce
buffering, and usb_control_msg() uses this DMA mapping path.

The patch turns usb_buf from an embedded member into a standalone
kmalloc buffer so that this guarantee applies to the buffer itself.

> An allocation for every register access was not happening even before
> this patch. I guess your LLM wrote this...

I did not state that the previous code allocated a buffer on every
register access. That sentence describes the allocation strategy for
the newly separate buffer: allocate it once in probe and reuse it.

If any part of the explanation is unclear, please point it out and I
will clarify it. I don't think speculation about how the text was
written is necessary.

Wooseok

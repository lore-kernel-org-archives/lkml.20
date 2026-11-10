Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273672;
	b=OBXegwet0Jj7BGMxnyIN0IvWASVGqMxNitSz4FlhVRL1+LUi9TYeb90hZj+8T+EE0KN/
	 0njugzo/TC0dj2NrhFayNBpXTijS2V4XpyHPRTB2/31qbeoh5iNpbvacQOpKv5sflYYEu
	 wijkPdSpNrAYk+OJsoXoNB87d65PQ42ylY1YSTw6hdZ5bDEZRo2CQozjIXEMHPr8zzrQi
	 5a5VwSuNIA6wCz6uIz+elxLVWiJHQzOrLXfD1KjHeJZBseMT3KofvL6iKG56xUjb5Bu+q
	 nBFoxnWdg0TYRzyn/djSUv7KG73vj4jYBE8s0p+IsG60jAh56MPYnLggdjziEWoTQJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=A8gYvZQDtSct+7jfHiqRbFOcQt7ML/8j8uiVGt2nLZGqo+ShHXSDfTqV6ZBC2ETkWZzT
	 PvmmYLjTw9hhxuHxy2NvJfsdGxXfRMc/2jfPBMg7tjsSjzsO1aiPl4ja0B/Zrr/fYB+Hq
	 rvwe8Ia0bh2UdTiXjicCc1tvDYog24WnxIro4CbAX3B+9gayaBMevJmgPm/zSubZtmQK/
	 iUMy23vmBTY8oUlhEreK2OO5kGdccTA173eCEFUTF4T7lDdQ5J/JOoH8ioHRsbULeQ6j7
	 NoVC3sCFoM1arziXzTvRPXp59uzbVbxQQGQ/9+uQpRz4mTbomF2y6cPXaPvBsfAS4dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=G80sQvf2;
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850FB606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 850FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=G80sQvf2
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so1963433a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273670; x=1794878470; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=G80sQvf2G4TXO1g1/7KwxdS8s2CTEmlPGT5AJHMFL5+dHV6AUYJBzH9Qoy4DeoI+SJ
         mdgeHJ8xrpYLCEhq9KWwRJUREdVC34HW8ozFdTD3W1ln+AHRMPaVMaCRV1Q0GFxKB0eh
         LYBPu2FwAzEEFSXjX1jRFcolW0SdQsk/eMdBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273670; x=1794878470;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=YGmBV7rkvS/T3UPedmyUBuhGqETpweom2E0UVafyK0w98zvpstlPwCi7xNGOcIraXa
         faKE38oAbOmSqD2MJVSaDwCDv7kgsQCtXY80+CuxnUT13n16aO7t8ZjS1t8sD2hiMti2
         7i91L7FI/acTUJQfv1apXbPjqpa1/juKnPNixbZitejnKWLg/fpy4T+1fQao/QFOlmrv
         h96wRo4A2L73QgwbRw8WENIlLOYqVv9ld74/fxd16qh4zPZ1XsssmkHKPczThdMjT4lS
         c0vcsguIZoQUcQqiwTgkFu7fGuJhvgsC+gX6mUp1QbCi3YsTP0d/9ua1ardJqsSvmNuV
         roXA==
X-Forwarded-Encrypted: i=1; AL+hErG8rdtjTVP/GEMovnX+xHc8yhf+OJv2btIRAmrh2zMuTN/q9HTRFOidldw6kzNzB3GZo/zYwwBkij/YmyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+JqgpymQHHrSydMvxdPNEOADM7tkK6O93WIf14qcClECyo+hA
	I8yeuFt2rj9arCMGH6aBr2A1uOpWB2SgbGaUrzPj8IVxlh/sIVT3O6Pd33DFBAkSbLREr09Je0i
	neAuo5f0NMw==
X-Gm-Gg: AYBFou2Ylq39NfSinrv6LH2XHuPntKCYWTARchzjXAa2GQAy7TiDxjOKCbBdVYhGvCe
	/7YIBX8UgIsoPlpW+epU/ZY6PEq5r6wyFB4adM+CS+5EDcPuXdF+MR7B8pYeM7t3wWQPQPEF1iJ
	UnTbHx6vsVrlK5LsayS6L+On2l3nFN+W9oiz/DhZPLslw0J0udDFGSmULYi6bH+pgd8W7ILY2ig
	RrhvwaHOyLta1iCwRWTZ1goWzhVL92i0gh/JrtU5EFM7Z3Wbf/6Aw8HFWppZj2sitDGSwiV6sJL
	wTxN7zkUk+TpsgauZ8IlXkUsdUTXIxjgdKwK++nF0MrILAZmsHBLO0TrvaM7NRqob8AHxAQpbGU
	bAkqWXqAniBDwesE5N2hm5MTbq6K80wUqHnyDuzV8Ayl/vzN1gYJ+LfoixGjMVSf5aCLAGh3k0a
	PybqgSMi0Vt8okOgXblfGpX1aGXcXCS2qiZRF6F9qhrZUsmZrRYvb2d2TU/OW3cVJykSnAk7Aam
	TrQyIuoOYoiKRlNcnhouGfyoG6dhkT/GOVMFKwugTRBPWbu9RojEHPGGKy2bnKXadSc5GgunisW
	3zpeTOyaGwH+tXYom+KUaDVAHuxgIMQeIjEeMcSaSpG69BDQ4H6UtCiKCo1CNTaBrVaz43XwWCW
	TUA==
X-Received: by 2002:a05:6402:144:b0:6b7:164a:7215 with SMTP id 4fb4d7f45d1cf-6b7564f9d69mr702865a12.9.1794273670016;
        Mon, 09 Nov 2026 17:21:10 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578beb01sm409935a12.6.2026.11.09.17.21.09
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:21:09 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c450ab1483cso245813466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:21:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFficmHdR2aoyQRDjLeZlgc333RPoshMj5xeBq0P3vUigzs10GI/8JMZeyF7iI418lElPxFIQ4r64Zj1ec=@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus

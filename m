Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642769;
	b=JCg5Ssh6Hoa0sB59IdN0vKSz2LNFI4zvBsZXD0WYdoJ9HMV5iBDtDjHRYKre9d22oXJp
	 +DKFzl3AHcQfqsg08d5c8nnR8pvcNuWk+ccVkLy5LBSg0HJzleUo3RR7gQ0lb8vQrBeXX
	 gm72uhxThUiAz+bleqpJFfKrNZvMOklh5J38s+Dyc11Zdm63Kq9gYS9WVWTMt+3cpOedm
	 XIrjGH5jqR3QMYMM3E2lt11lnoaGVeLj3JmdllQ5H4sHuvOg4nlW9ZnE1tCb4KVDxM9LI
	 wtUPlqq2mOrQrh3epT+JOnzcmlT32mZqKr0TdZvlNOy4PE3s9NJyckJ3YNRhhNMPsvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=0BTg0Nl5BhGUeAfrz6YqKWE7oOLdfP1abzRsSayaOAtacRUGlJxmCBm7SBzuiuBRSVzY
	 ib0y0T2e5ciNTzkmiSGpRq3rCXpVVPLXe1mTBKSwk/84dGWEVYrvl/AOjxC2dNAs4v8AD
	 +yngQBHd2aDivzps+Ede46VrKiyUDc4P3BHfkSdUEg+BNAf76ZyFD+MrCmFyO3PBsW5EH
	 iPuo0ey0+4VNv+yZ+SFnsxrjfWAYNSb8jFx6gNKsgKvwc9anbQop6viDMXanUOyVH/Eq9
	 T9QS+bbQiK8h1XsIt5F5YdoIMFpmSiEs3DexxYGc+215FoZ4mDKkjyAYoFEi5rPA6LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=F1ILInaG;
	arc=none smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AB7606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77AB7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=F1ILInaG
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab28f3e4dcso37260511fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642767; x=1794247567; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=F1ILInaGHXSQShR6g8ld+015Ct+V2Y3IXwMQelGmSLKqyL+TL76ZLZy2L09VWFTA6o
         qyWfxUTv3Ojt0Cxe7rvdbGSJm0yFszKZyv4ot9BjgYPsLu6AhahChLTGt5menkkACcFh
         d09ieixwGpMqTcOTgULBdvP2EKQWWVhKRD9hk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642767; x=1794247567;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=dpNKzTE+ctxVdrvlwe5yC2yApNoLzNdN7Y5sZNBxfMHXnNbx3I75rqmeL+oUWK7IDT
         gSboW9nBKH/HBiLAcrDWZpWfqW0SOLVh2VBuG491YwfMka7zOCrCdqfIuD4DbBEogndN
         9a2kG+i5PI/YYTbd1BmiKcbobf8uo3VTWg8WQT4JTmon2CCRPaZaO2QhilIkWgW5focj
         NEb42vBpeXHfmuZyMvTrKwo2nfoRKxm9/k52D5jXdlETFwTY+B9R6H9b68SDeOoceu6N
         CJfz3M5Bt01oroMjPHNemigkSPhZBSmgzCbv12Gm32IEtQveU9p4VaJz3VjYwxNNibHC
         bHpg==
X-Forwarded-Encrypted: i=1; AKwUvBwp62bzlEeHegs9L9Jl5OtK7fLk/2qBsUw4JGBVS/wMEPoL8o7faJ21nCSPn9KwS/QhHOQFazvKFkqXRhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N6brox23DxDIvEu92+wpE6SSyiRQgLQA6I7AGtQMA36glEZMX
	MThyqE4MCR0eXEW5NyHdbcDYwD9YKzeSN9XlyZW38aFyA3d6FqNCy565L01Ew2ZMhGpwqcVHoOw
	Pl5Mdh1bK5Q==
X-Gm-Gg: AYBFou0Y/vn7BDp2XejAT86AuFfOAbzVEmSNAf2d2WHiEKUVu506v+lts6DWTe10GWj
	JufGyl9ULLkxao3fxLAiAdn+lekLgT2WkD2Wx4hM6x6bjv4BBX/Ll4EpglpgBXpNc+GJEmLIM+Y
	vXf8TyzDnr4tB6/T2CbWTsy7No3bRUIZvdb1oX1wSkdUg2GxhFP86LE00HfRYstD4U7WV5MgHTz
	LaE7/JrYQpWCCknuRO6PoQR9t71Qgc5BeliQtM8F8uzAhzkIFKFD5DQ9M6b1EEl2fina1J/qPJw
	UBpjPDeVHUo9t19P9RM17HwycDiAOes1pBGmQtRX8PSsGSF7fbpJ9ygal44Vs1S+A3K4kH6ATys
	+5VsmODkfAo7d7VOrEEcxJ7b5k+Te6QV4BGKe4w+MYec2FjVlQxJRoemGu+vzI/FXNN5yLoJ19R
	7L21gyxq5D5aOK2JfVe5IGOMSORfa25HIDbTfE6OYYQkxubk0hA7ltgyipfuy+ZlISwBrv5+jGd
	yT/ohp9zZAa2jUVRMuxkuypziL8mws40JOALdG6fLph7xvIK+KPj+TR1RtwW0gc2v4G8Sc6GRJu
	KilwkiLb7PzHgU02nydrt1/rHxDIyflK+wmhMpoJUY0lPQPf6w8biSovM9fR4t/oqALOgjLHNNM
	8BQ==
X-Received: by 2002:a05:6512:b91:b0:5bf:ae99:5251 with SMTP id 2adb3069b0e04-5bfd118c477mr4530293e87.5.1793642766677;
        Mon, 02 Nov 2026 10:06:06 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe04edd67sm1882517e87.12.2026.11.02.10.06.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:06:06 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso2155929e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:06:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByQ1s57sEYbV48pkUtZylIpY8EwUw5nt/Bbe4HJ8KPU9X81ixkZ9bThS347ABoLq980zNvySwjkEdjgqwI=@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus

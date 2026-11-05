Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872356;
	b=R6ZG4RWGHIihiMRS7LmAjvNQr0ghPSu1x+zrJaaEfKR80wO/jObq9K2VeN79J3P7FVkc
	 wlGZslcSXT3w/76d3zOrlQLCxchbSomRsy6uh88QNjxEuR8DJHk1MMJkGozSZRn/0cUMM
	 AsdAgNs2Oy7PNrwkPt6C+GVvlyq+dKZ7cxmMdjEfyQSREC0qUAHpHHfB7jTuZZsgqUvpr
	 NY47S1RvDxgzwGNMEwBOW70mh3DGeLVNUQEAAriHaU7jTSGnQr3mU55FYvc91sDmiQE8G
	 uDxLHQ8fLAQZWvMuXQOZ0J93ZMP+BrIs7+8OKTPDpaNNlhpexBG0U6nJEGQXbaM3RbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872356;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=r0sFFaXKKvZt68QsVEkDthP6HJd2vH5Zy41960zZ4V11vL3R/0V6sE6ePg1y4sShNpve
	 jEqzZLq0nEzhVGG3t3YiVgWZv2B0jdnbTzh/bfn/iN3aMv5ghGhYZ8Zu0mAWGcCjIaHzG
	 Di6owz5cT/ovnRJiVQou3njiP5QAeXhsPAMAF0I/Tp1z6sq5Ytr7sPMzQaNMQnXGaAloY
	 qIAGv9Gw84nYHgFEqKq9wJKe2JpfOfdSzD4W2LM9HmsPUkNbuvFqmKlPjY67R4Dr7jlFL
	 SXLOhui98Il6GZbrvFJ7iYKV3hXo/9ayCwccEGO96huQCcAJz+2BZxtuantEveh22qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA479606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA479606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53c4b82919fso21014951cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:52:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872355; x=1794477155;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=1a8VMWsti9zxjnOSZzAxopYJZIVkW9F4L7GAAJjlS1zWyt6jY0EzhBqAVdeVMZ8SY3
         JS3x1ilpiYzeMCJ3KYCnkXj/DEkRBR0+jXXpChTNK3PGSgEsmmuX9XgzVMD3Z5cdDZgB
         EfuNwNV6eraxqh/INZUDDP24P+TujXMTlqPJ7Jxr9b5q5g94z0Fe5YFcR/YHn4PdYM7a
         xWmq2E5g4wsY/hRC5D8Kw3wYsswlhpAZBqgGv7u+wIGuyC6GRjvKR5GL5mG7ikEx7w7c
         Axk7Y097A3wJH4Ra1BvUTPWJtRMB51FPezE37rkyQOtMcikTmRAS0VdfUHwG99b2fl0j
         o+4w==
X-Forwarded-Encrypted: i=1; AKwUvBwbCZSNPDuiY+YONPSkMRMFQqU8FpU1GelBRLW/A5W4ylDyMR6OPpebLnySVqHK+4YmZ59iokq+kEAwKpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9NGNBXJvKcA5QLcYFGq9tUM69NsRAfwz+9B+9vd9gf/c0ZS4/l
	xqaesk27gN/P5+9zf0lgLDUaUX68zqEMDSeOYPJQJXyfLe5eqAqgFew2z++TfCQdol4=
X-Gm-Gg: AYBFou2Ciq9BRzsr+8kJtky1JBX5+GUEiHeqm8FyWWkxA4JdOo3cgnzWJwXomGRkcnj
	xB0ThA9ALcSEM3zdYbjjq0hXl/qDgjUCxVDjGMacw5zCj7Wv3XTIMUeqxqS2fu7PFvFEOLPEfFu
	onnQjaGH7y7ktyfUCdYV8gYhreFTZ5PjdW1KnVkr+wLxAq0K+K/XCryP0cv5WQhmPY7uWTB3gvX
	iCyL4AaPPkXuAfcbKMPh5woJc9LGV01Rt53Nw5KKqPtMZaua36aXKoqbRPIv59zg0vs+8UnYjAV
	fG4OQHDwCgWqr3Dg2JPV5wPHYnxA+UzP7ZHGC0TW9INHsR6VOy+UrS81u8opaYFUzw79sbuOoPB
	5BW2m926paCMts/wYaGbUtJRiV9KCiJ2jho+XM0ysd0S1Z5LnPt7HdkIzVLa4qR1jWBpe4XYl/v
	U1TswVGwSKGMx4EJkjpLcHv1ZSUk9aOUCdO8sFUouakzsPYrZUrSgVN5wkoDLZO8DlxDIalbE7V
	B/OEAuKHOS9W3KYOLJ9T+uuBa29Ddkt6RWpyRc9QwduYeuh9MSIR++60BwLZMHUxmvxzKnKlvJV
	Z5VJM6BacJBCaEGedLKdIRv8e32Ugj5AJkFrh4k2zfMMMoaSlMY6oAThrwLEN+ygXL6i0tModKx
	zQ0QK26bUm4JZNM8=
X-Received: by 2002:a05:622a:8b08:b0:536:699d:9a22 with SMTP id d75a77b69052e-542b7916fe8mr306410541cf.57.1793872354656;
        Thu, 05 Nov 2026 01:52:34 -0800 (PST)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com. [209.85.160.172])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b36cc3c68sm44019801cf.24.2026.11.05.01.52.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:52:34 -0800 (PST)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53653e30353so21940121cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:52:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBz1AQ2gl3tNBiLUoIWpiggYxA1v/pjVuSF6nzPM0e04aj11EvevlX4j3sXsm2v60u4QCe4iFYotktxaYeQ=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

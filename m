Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872875;
	b=X/83bk23W3KUkRFSbHscCaQ60xjRnhfA7djt+SijxCu5GYqSUaRIG8Nvsjam67rS07OJ
	 G4aXEH1jZQdB6yNIH8QCyOAcLK9W6muXI8p0z/MvipdEJe1ukdNvXHFOi5RnyM9RikPQQ
	 ArrydZ2iUzj1FsBS52YClUbZBFvd5di+j2Z46SaA7+uHWqwBuGwpW1S3FU6aDIZs26i1i
	 lXkRPYEpaaZipC7PhIWrtAKayWw9suoQaY0suWkJND+rPy/FMZxyRaAa6AoJUXkig833i
	 phTux9GKBMgu+46tifZF08KN6gObal/OVe+HuOnt/XBCJpjFJSLdBTNFlB8VXC+/JgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872875;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
	b=bKK9cxlo9LmOO/zV5yTzhImSU9Zz5p2gTMGSHWCYhwbZ3UpxAAiVklLNUo77YjhQYiGG
	 zLp/SCu71uVq7upb/66yVwcjhjr4GXH8NWf4Ur5YgIAAQR01KezcQRVGpYcSl6KB6B7EB
	 SA+2Ju/MIyR4xMSMdYs28sqHKls+L1HwxhNDe+MEdm9bx/mDy9YGYxrRcU6B5+3VDvr2O
	 GLBfOFAVcoZUKlJCTSTA/CaA/8bk6Wvw5610g4XPIQxHYxiqbgPNKnRrF2Or3uFFBysQ5
	 erIjEJ4PqBqcab3XanVfw9KnhX2uHzHJ0IsDtR+3Zb3VV9gj1BoLNCDEMfWVcuByhEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF63606A333
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF63606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5365d26ccbdso19496671cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872874; x=1794477674;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LrgDMUrSYXpYgkAhfsYKg0ebb/uLgOfOMhqzX4yL0j4=;
        b=NaYSKaBNRAannyg7ToB6munCpaiq5OvLs3Jux/ScdtTNdtUIAVGzTrcRg/sVTO1Uj0
         4ertC5IeRP/shErQkMSGH7pgj+c+v8yvzJmC8oq5GJs639DMWEyRTpwG9hoInVreF6cz
         v86BAg1lcHzHBU+CiHE8bZKgCiVY0s6sQ6Jp1x0borLe+Raz5gQ2zQqSiQ2Kot087HZd
         zUQRd5O5NBmM/X8pnCJnnuNnAorsCaIcrkYV5/+iLR87TtI0Y7jxksekGFVXJOb8l/8s
         xpvasSpEH+vb62Cd6LIUocIqQxLRRscxfMpNHJaEvse0uigtr9Gb/lwb6rEowVjOXZSF
         mxnA==
X-Forwarded-Encrypted: i=1; AKwUvBz9sQBBAGEYO9DnNayrWwO1E88Nr0ahKNW52DgEecbSiBflQIPhIbdSDpteE9220npna34jahG9314eMMM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q+ef198A3QDb7RIOMu6jVEKEGrxsxJikmmTqbSyoGYTMToXaD
	pcpgHJjFDV4rkfU32B95IW5o0lja613rLJQQA1e9GQXncjCfbVc5p5GHQ1uEspGh1yw=
X-Gm-Gg: AYBFou1lAr7BvMu53pLyks+QIKEJmxMGJhKG0+rWR35l/lsAguIQreg+6W8sCkb8iRc
	0Op0qoUTUIEnXwM6dvLy2SVElu5tfT9Z7g34FH5sFixe4rpVLtsehuq2juJJXRLe9Y7L+pETNF7
	uFkRfd6MYhyQi2yJqtFyEg8LvbzxLRDBc7kDjCp2DwsoEJffClmcdXeDPJVz2mrnMC3y1s/zt/Z
	tqjATX6BUHGJnW4UE0j9TWcBJbiBCrtfKdpjusKTTfi8kLIRZTvHnJjp3VIFiaJW+8CZFRQRnqU
	tE/Nh/d0d6WpjZhQYkf7zm7BCUxR9IViCIOJIUi3UAie3hbPoPEYJe/0wiqSxCuJZ08dNHqCqhO
	o+ccqcglpVvUtxikHAeYKNiRJHoJEgugU2l6RldyQRxqPCtX7I6Cg4GKQY+oYuHxw6nFtJvQnJo
	Roc4oyQz3HyaL5jiV4vbYuJih8poHlzysOTHh/FABAtgpYqt8/DcMMs7DhqemNIs8L/V1gO43T6
	Q7S2GVw36rRguXnea+NCZjUl62DBEcgmRFBgBkhim+69BJ/JfQyvxB/rS/z1hPUe6hJinjhyFb/
	kVkB2Eub2TR1HHjBWoLS4B/AAlIcpvC8n81fiWx86tks5ESoeb8Ki6dDAgLLLFC50Hbr+w==
X-Received: by 2002:a05:622a:114b:b0:536:536c:bfce with SMTP id d75a77b69052e-542b62a53bbmr317240131cf.26.1793872874181;
        Thu, 05 Nov 2026 02:01:14 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10cf31desm47628491cf.23.2026.11.05.02.01.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:01:13 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-945ae2daa3eso203199085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:01:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwOufxlarojTqD5RnoaUnM/PpwvuoY8MhUvDEXnwv8NXgWmHI8XSSO5x1qfT0e5Moge/Fw1thfkHwKmt6w=@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:56a:58e5 with SMTP id
 ada2fe7eead31-7d072d84a58mr8269567137.37.1793872526219; Thu, 05 Nov 2026
 01:55:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-drivers-v2-0-245e54e87116@kernel.org> <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
In-Reply-To: <20261104-work-procfs-drivers-v2-2-245e54e87116@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:55:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
X-Gm-Features: AclHuK_UsJ1nGicdWEWcMLQAICTi1A7pGF3yhNkxXkXRPqohle17eXAHHNBsR6k
Message-ID: <CAMuHMdVHxQvKnJyKHrOZhaOg9Rn2hMeRU1JnMFFEEi31FPZaGg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 02/26] zorro: let procfs copy out reads
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

On Wed, 4 Nov 2026 at 20:43, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read from
> /proc/bus/zorro/<slot> to userspace after it unpinned the entry.
>
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

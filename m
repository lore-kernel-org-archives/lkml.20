Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794260763;
	b=zXsqK/5fryowfi1+L0PICeakpglP5Id8HMFsb4MDn7IHBndLLFX5kZdQXVLhiQcMSdpE
	 TsHE95V3aqE75OwVzYNkKoED/c/RmImtmJNXNdXJ8LMuRPJynrWBSd1zKlPTmJR+SbZ8s
	 TDtTBrN5C4l6pHX06UdjwmbIt37NjHCh5MFD0Sv5IdnNkn37A0erqFZU2zB9vbljbz4m7
	 grvfGP3vHFIp78HmvnblioWlGLsjcyobVi0z4PKbdsiY8iI5lkDf49EgXbToiZzWHKHrU
	 xzH/q3PUFmnZEMweVg1oX6eQ1i0pCME+GuZ2/J3oQ6Al/EwcIiZcMF/YG5OcNXbcNTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794260763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
	b=Gyeoe4dzVChkOZgffq+j47Tru1emNua7QiIKGLE7PvUM3Lw4ekt9jfw7CdVWSsoN0sxU
	 ganHBvMYQ8M67vy6L95JYCbexQFNk6cpYBN6XBKsTKqAo/z+zs9vOFurNn5CdvJz5T+SY
	 KPcsdVQJPUp21SeW0RNaFWsw1f0gCxK3fmxYg4Zk21zYSAG3fyivdB2F59HuEIb4pVHRt
	 U0Hm0IJcLMBEJYc5CThRzaaqwGyoP/YJx5oBvhNPPaVFCtC+1lr06frGEBJa0MpdPeQmu
	 WDLDo3Wu5u1fw97TwWLTidsQIOSs/n9HxL4mJ7kAgfJnVliu7CeQmJmM2SV58Y1Si/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaZ0qPv5;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF29606A33F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BF29606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LaZ0qPv5
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-490a0e72588so737609f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794260761; x=1794865561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=LaZ0qPv5+whTFQHjIA7oYo021SUS2QeXnWN8ii9Y4im7Ue68o46nz2xh/hHMwIUfQ/
         ICad5fyoXePYl6/8nNVhZk6UxBKiDwJbHcHq6QklDSJskt7Ox2MaUqpcgklbAASOb1WD
         7U13gt1MK2zXHTSuMFiAfjmE40I4QhfpTIR2Mc6nMOBQW6Dg/mqe6U/h69Hyf/QnrKae
         CyKIviPRPYc2tnG0IM8qOylYYY2PKnrUJzf833wY0ZcFYDbyZdAS7ekVESO+FaUUNtdA
         WzN6sPDUCv7pE3hPSGmxzNcqgZM1jmpktE+mpPCXGo9ukB9qCsiBySNit7DIM51G+Ivt
         K68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260761; x=1794865561;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=874yjmK9ypxK94+nKOJ/uR1d6HpqK0owgIThZQA8ZUA=;
        b=iWDWma6/u8vV7ScbIHfe5IdoD/lLb8Ol1Psh5APSqn2Sp+H0NoBKRHksu4S3QtPyTd
         6Dh3xZ3Ma5MoFV9bhXRIQkq3OYNqb7XokUhh2pY/0z350O9TqrBmnbpvCqJhW/vxMCEC
         hPLO0p3Ra6S28i21Vb4zYlDVx2FV2RV5R0FHrmLJnMbuc5CVQF2R26YIdPbbwzajvJcL
         lLkBRqZtd1MSuw9Ln/fu2J/jvdGVsVmgvabx8nTM/WLHIM2qQH49HwiwwzNF0rrWsO3J
         y4sidHfkqmh4YdmkTqi2EJyFDBISY6Rw0lyklsA1qDLb0z/ePLcfteEmkqsYnkYQUpjJ
         ECjw==
X-Forwarded-Encrypted: i=1; AL+hErHtJei8nl76JscYe5rUdMjnVCRFKfD4UXWVwEkWCWmg8Bud7TTSUbUwonmU2PGUrW9q8taZUuL0tElBr4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BQ+I9ttcL6+fABec8zYn3dVFMVRme8jNJ/XQKbxbXtPQn1vfI
	ly0t62YE0UsEnXRe6WcDBJapRNHXTtH9hOY5Dwz108jVSU8PbZ5dOmQX
X-Gm-Gg: AYBFou07LvaJLYWbL9zcxZO96joEIEmCla7FP+5rDIl9FQz12pR+vGZYpWhVTMtPI2w
	xtJylYHlyc66jsZJGoQD1J6G/1XNgtKYDNTrWf7uShXYGRc+7TKmvmM6HXLLCPXt1oQ9/SLkUWA
	/VmKZT5zcW3hzuvYiiGSSTAFoDZxhh+7JiE3qRD8e2rOdy00T+S0wlFPX2l5xG3lYkkoAFJYi0d
	C/Pi0Nx4E6GhR8XeN9++G3xJn/PU+bsY+xxwNkp8eZkHjtyX5N3Qr369c+AHC6I2xMqsPJv6jKq
	3wfro/OMCbr5nHOrfTCdDlkcAMW+FXBriTWBEnAiHKCTLpwlTeUUQSABLrQf8IEZbES2KN5uVq7
	mI5I3SdOhO7a0KN9ZyJ3pU5OKBc0qjtMoJzH+QUvA3t7LLvC8fSAag1ThmgsGgMKRzVi/8NzoTt
	pmTltgw0q84u4OZDr31j9GQl+nZaXTQX+yUdGi52ZoUDukoGDREihgKLAGfWoojvVEbrfwJrs+c
	ldZNhQRnJqdbZDF8EUeM/bUjymuzYgNV6+eF6ew0I+SYrlVE8GY9wOoCGYPQqqub/MpGREEqv7W
	i6nouwB/8kJB+KBxR7Nsd47iPnQeWlDXHFUjgOgDmFzVn1iHHu03btQWBp7l/bHNSQ==
X-Received: by 2002:a05:6000:288d:b0:48e:25e1:5eb8 with SMTP id ffacd0b85a97d-4982b28aa42mr1487213f8f.3.1794260760763;
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c4fdsm1213644f8f.10.2026.11.09.13.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:46:00 -0800 (PST)
Date: Mon, 9 Nov 2026 21:45:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Christian Brauner <brauner@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
	<20261108185953.28054fb3@pumpkin>
	<alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 9 Nov 2026 05:05:57 +0000 (GMT)
"Maciej W. Rozycki" <macro@orcam.me.uk> wrote:

> On Sun, 8 Nov 2026, David Laight wrote:
> 
> > > > While at it, I think it would be good to use this conversion as an
> > > > opportunity to replace "char *" by "void *", which will probably let
> > > > you drop several casts from users.    
> > > 
> > > So I tried that too. The thing is it drops exactly one u8 * cast in
> > > ntfs3's label write.   
> > 
> > Since char is now unsigned that one isn't even needed...  
> 
>  Please excuse me missing the context, but what circumstances does your 
> claim refer to?

Just that the cast would have to be:
	u8 *foo = (u8 *)bar;
where 'bar' is 'char *', and I don't think you need a cast there when
char is unsigned.

David
 
> 
>   Maciej
> 


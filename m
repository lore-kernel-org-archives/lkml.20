Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794348500;
	b=qJwyexyBbftZ8V8Bj8AZAacgijIgZN8YDmvEQx7l284thFOmjcmw9+7bHSP5waleuID6
	 9BufXBi1kWSSBYpvOK+IzzZ9zXltW1DiFkAJbumRsYu201yPyyA+9N8DLagHqfaVCpd07
	 RhvCyxDTjIw4uCyAqli7Mfa+P1qxPjb2LkJMdEJ425r8H4hVeIKrAASXt+OgtDeNJC50y
	 g7h8w91oqnx4L1qOssj9niDMuKP+wuTNpU3WCYFu0SPJ8/s5Y7Fo5LKRLjIKO1DObAPgn
	 nLnXlncEBPnTZIy1zCyW+zFD4P4UxXunV8HazxXcg3GpBSKLsXwqmZlznUIRTbO2yhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9d5lzQZBiofcX+00oxDbZE4ZZEA0GJviWevYoM/JUhg=;
	b=d+Lrr6IaipZ26uoSVevjaZ8qDnoO5F5rqZxpAFEb0gMTigOfyDaVXjau02sLq4V2HnFm
	 cCC1FF4TvaIICpfnmT/ixHGI8j8/zUCZ7Omims+SxkNKLWdw7WBfoAoUKvuecYysRyUXS
	 SVzodFTjgEGOuQZAizxEdshXt/hokaevnGM8mpi871Ea51lfBTZGQGMuLAv87Pnu5/sko
	 JP6/C2JqvTZ+d0bmZCu3unDtOOMNIlA/F8F0RYw+wnVBwd8f6HNHDxZPIf1OwJbRgx9ZX
	 Arq5RU2452G3Sb/bQN7oFVu+3gZ7fpNmrq859cFOkrgE1E7xz8nYkK7puLOUQR7Dlmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=artiphishell.com;
	spf=pass smtp.mailfrom=artiphishell.com;
	dkim=pass header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=XfWkIAKy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE68D60A382C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE68D60A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=artiphishell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=artiphishell.com header.i=@artiphishell.com header.a=rsa-sha256 header.s=google header.b=XfWkIAKy
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490f38e9688so2068752f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:08:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794348498; cv=none;
        d=google.com; s=arc-20260327;
        b=O8wM22HnqdI/i8v1jtmX07cTbA9cF11FIGz8rUsGTbodc6RlDyJEhyKx0GFbILMBJd
         gfz1tMxEiKdgAGJzp9Hpv0xnfYMByWtMI3bZyMxEggi6wfZ+ewhy1Wx/lEnXsquTuRTk
         a2Ae6qDHI12FFSpKdgwGOmtu3luWPRloSPENzlPdhIM/W0c1zJtTb+xYaHlNQsNPWIgP
         3MUBfszL9cvYp1khWZQP17uibmPUfSq9JMbDHhZy9MNyR0EnrvPjplU9GixUTCVaGNA+
         T3qTU6kA0MUfaNFLmjweWPz/ccRDoym5/JPyOZrRj4swjhUWsKMB/6E19iiOmbBIbRvm
         NzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9d5lzQZBiofcX+00oxDbZE4ZZEA0GJviWevYoM/JUhg=;
        fh=me+oixfy8DVyHu7K9tKoP/eLWGXVYd/48enUiXzRcEQ=;
        b=qPeS1hXVGE33MmyRsBZHvQkgdFAKhd1iQrxvQKRk3Fa3lfYbj3pukcznjGFtdTDHkS
         Jg3VyHE0JVdhCl7THmo9KYDev704jKpR5521Gid5bJEfj3UR7Z/wHV2ZD6GKuV0z8aAj
         7psp6P2E8JruRLCsFQ+x0D/psdYfxdMPHR7NQPAbc5qg3Julze7D4ZnHvbZbOyVN20UB
         YSp5RQp4f9FeBPxdds1RNibiSsEsBcPk4ggAhllAGC5M7Yxsi+TUan6unlHBEs05GM4F
         dFYlFto3nbSMcRK8a51SDixGUDFvXu+H4HOeCtbg5ALXk3cdDiwdtghPGvKYKhrqFnPt
         Htpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=artiphishell.com; s=google; t=1794348498; x=1794953298; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9d5lzQZBiofcX+00oxDbZE4ZZEA0GJviWevYoM/JUhg=;
        b=XfWkIAKytkU5Dd98AQuZaA8z0aPiclBMKUNef4lhu9n1FzVLzXm5/2qf+2edTzSkg0
         OkW8itB3m56HAvf7zUp3XP/219YTa+LpNfD7GpgfnJimnrNe2LqhCfrJQ+GUJRUBp6zx
         XSa2Ch7ZmPILsF01QqW80oGhnLpAnbwe4/FITcSSe8Fx4WnT0Rx0JcGNJ/O1XBGdClta
         xWmjHSUzPAvST8HmZce4GIlfIWqWpRl+MyBMrBApBBmcNZgV1+o95RX0cVg6UdV2NZ6+
         qYHFUdq4q00+Crr5SfS3VmGXLN1LTv2YgxcpUP4d85sFd9v7swtSPQjNwuRs75tO702S
         JfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348498; x=1794953298;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9d5lzQZBiofcX+00oxDbZE4ZZEA0GJviWevYoM/JUhg=;
        b=wl4svlG8j+Fuzq5CAPZjnHcekchjiejsKx1IoJB1yRmUDXC/czspjA6rd6tUlJtkUq
         6NFgyG9GrRt8F0BZONbmo/gY2qs5uItHij3MsvxXN5hU80UobFFDDo/ZD+hhLpvrPXwU
         8KwuB31L3/oBh+Eq1ev+0LvqYlfsrREfbx3G2lfYnTB4gkdLQ/X+BmXUlxqF3pJ2bo0i
         7acOB1ySxE+SAGLFywKJjWfHqpoT4vEUPTUXrN7T2fg8hq7kD4ghNL2N79q8NQT0zB0/
         QkK9/pbqlZm/IgvtNJtsPtJqpaI9309SRrRc6kFDhGFHAlrqYdH9jYTP/OjtTbScq3xN
         k1HQ==
X-Gm-Message-State: APuU4Z832PKsJV+jRcGoQIvb79cdzJyNqAbj8M+gP350U1KJpntJwtkN
	TrN/kLtRS7p+QYVeJe67DW5XWbl/RL2RbT/hw/93dFwbthDiOS92hXoZFTFF3fgyvaQDgtrQn+Q
	UtTf8PuHo0dvZPC5nNcaRaJBZKFIo8YcVal/OW/7QnoE=
X-Gm-Gg: AYBFou39uTTzclaOv9zhP2b1fZyluWxHhdgGitU+5nYdNy5VwfohFlgMit3KT7kzsIE
	/mPSJFnRFurUeABNgxWkAUdvpx1DqJtFYtnhXb73wtvZYHrH3qfG9k6dJJavWNRC5mTfaDUvyQg
	pPwszYdfRAlNXOWoGkhf3BNIg0J/KNUVAEFpcILEZVyjEGO13CDoFl9dQ59/SgnZ8L5qvGmtmBR
	b0SevzyxV/DyfDpeweOV+UP9oUK0/vLsn0Bvg54XVVhU8neEi5M6hOjWP9O9mb9E8u9RfB7aidQ
	8njpMWfTxhANlUFN/g+qD88o1WtsBHYsTrTbCCMZFZAsuWzPJIGbKYS74WgoX6dvxAU+8wl5EYs
	I1tojrS5ZNZbmSce27A0H+EdS50neLpKMoYEAs5ayoCMJ61q9/cY+r2yNnX1WDlnntg==
X-Received: by 2002:a05:6000:26c6:b0:48e:7475:fe7b with SMTP id
 ffacd0b85a97d-49995ea11f6mr1535918f8f.6.1794348498026; Tue, 10 Nov 2026
 14:08:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022181955.35758-1-jay@artiphishell.com> <avOQ66kCxOghtFp4@equinox>
In-Reply-To: <avOQ66kCxOghtFp4@equinox>
From: Jay Vadayath <jay@artiphishell.com>
Date: Tue, 10 Nov 2026 15:08:05 -0700
X-Gm-Features: AclHuK_x_gSedLpiXqF-mReJPLrnM-YH0mKfOC_UB9zkN4PzXJlBPe1svsENvyU
Message-ID: <CACd3oYMZ+umLbeK3q8oaJUwZHC4zbbFOe1YVEAq3s2v4B+d5Dw@mail.gmail.com>
Subject: Re: [PATCH] cdrom: bound the device-supplied offset in cdrom_mrw_set_lba_space
To: Phillip Potter <phil@philpotter.co.uk>
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Phillip,

Thank you for your response and for taking a look at this.
I am happy to make the changes you requested.
However, I wanted to clarify if you would like me to start a new email
thread with the updated format ?

Or was the idea to just follow up on this thread and repost the same
email with the updated format ?

Please let me know how you would like to proceed.

Thank you.


On Tue, Nov 10, 2026 at 2:47=E2=80=AFPM Phillip Potter <phil@philpotter.co.=
uk> wrote:
>
> On Thu, Oct 22, 2026 at 11:19:55AM -0700, Jay Vadayath wrote:
> > cdrom_mrw_set_lba_space() issues a MODE SENSE(10) into a 16-byte stack
> > buffer (char buffer[16]), then takes offset =3D be16_to_cpu(mph->desc_l=
ength)
> > straight from reply bytes 6..7 and does buffer[offset + 3] =3D space. T=
he
> > desc_length field is fully device-controlled (0..65535) and nothing
> > checks that offset + 3 lies within the buffer, nor that size (derived
> > from mode_data_length) fits. A drive that returns desc_length =3D 24 tu=
rns
> > the assignment into buffer[27] =3D space, a one-byte write 12 bytes pas=
t
> > the end of the stack buffer.
> >
> > This runs when an MRW-writable CD-ROM is opened O_RDWR, so a malicious =
or
> > buggy USB/ATAPI drive (or an emulated one) is enough: no privilege beyo=
nd
> > being able to open /dev/sr0 for writing on an attacker-supplied device.
> > The sink lives in the CD-ROM core, so it affects every cdrom driver
> > (sr, ide-cd, pcd, gdrom).
> >
> >   BUG: KASAN: stack-out-of-bounds in cdrom_mrw_set_lba_space.constprop.=
0+0x25c/0x260
> >   Write of size 1 at addr ffff88800639f6db by task poc/133
> >   Call Trace:
> >    dump_stack_lvl+0x64/0x80
> >    print_report+0xd0/0x630
> >    kasan_report+0xe5/0x120
> >    cdrom_mrw_set_lba_space.constprop.0+0x25c/0x260
> >    cdrom_open+0x1169/0x2080
> >    sr_block_open+0x9e/0x140
> >    blkdev_get_whole+0x8c/0x200
> >    bdev_open+0x214/0xc40
> >    blkdev_open+0x1f8/0x370
> >    do_dentry_open+0x408/0x1290
> >    path_openat+0xb2f/0x2210
> >    do_sys_openat2+0x126/0x170
> >    ...
> >
> > Both desc_length (offset) and mode_data_length (size) come straight fro=
m
> > the device reply, so reject anything that would not fit in buffer:
> > offset + 3 >=3D sizeof(buffer) or size > sizeof(buffer) returns -EIO be=
fore
> > the write. The sibling cdrom_mode_select consumer of size is covered by
> > the same guard.
> >
> > This bug was discovered by Artiphishell's vTriage pipeline, which
> > generated an emulated raw-gadget USB BOT CD-ROM (INQUIRY TYPE_ROM
> > advertising MRW-write) plus an open(/dev/sr0, O_RDWR) client that drive=
s
> > the capability-probe chain (page 0x2a -> GET CONFIGURATION CDF_MRW ->
> > MODE SENSE page 0x03 with desc_length =3D 24) and reliably triggers the
> > KASAN report on an unpatched kernel. The fix below was drafted with the
> > Claude coding assistant; a userspace reproducer is available on request=
.
> >
> > Assisted-by: Claude:claude-opus-4-8
> > Signed-off-by: Jay Vadayath <jay@artiphishell.com>
> > ---
> >  drivers/cdrom/cdrom.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
> > index 4f1fd389260f..5e910d79045f 100644
> > --- a/drivers/cdrom/cdrom.c
> > +++ b/drivers/cdrom/cdrom.c
> > @@ -571,6 +571,10 @@ static int cdrom_mrw_set_lba_space(struct cdrom_de=
vice_info *cdi, int space)
> >       offset =3D be16_to_cpu(mph->desc_length);
> >       size =3D be16_to_cpu(mph->mode_data_length) + 2;
> >
> > +     /* Both fields are device-supplied; reject values that overflow b=
uffer[]. */
> > +     if (offset + 3 >=3D (int)sizeof(buffer) || size > (int)sizeof(buf=
fer))
> > +             return -EIO;
> > +
> >       buffer[offset + 3] =3D space;
> >       cgc.buflen =3D size;
> >
> > --
> > 2.51.2
> >
>
> Hi Jay,
>
> Finally got around to looking at this properly, sorry - been very busy
> and life stuff happening too. The fix looks decent as far as I can see.
> Can I ask a few things though please:
>
> (1) Please drop the Assisted-by tag.
> (2) Please remove reference to Claude itself, and mention just "LLM
>     assistance" or such like if you want to (in the description).
> (3) Likewise, please remove or substantially reduce the final paragraph.
>     How the bug was found is (in my view at least) not relevant to the
>     fix, and (perhaps unintentionally) could also read as an
>     advertisement. The relevant information to the mechanism the patch
>     guards against is all contained in your earlier paragraphs anyway.
> (4) Given your inclusion of a call trace anyway, probably worth
>     including a Fixes: tag. This may well just be 1da177e4c3f4 in this
>     case, but it's a good way of signifying this is suitable for
>     backporting.
>
> Hope that's ok? Based on how the patch looks to me, I'm happy to take it
> though provided the above is addressed and no other problems are
> discovered during runtime testing.
>
> Regards,
> Phil



--=20

Regards
Jay Vadayath, Ph.D.  | Co-founder
Artiphishell

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794815581;
	b=SxkMw0WhlJTyh64yohnx1GN55VT5dLGM6fUB/pV535i7xcYQFSoWtN5hkAqyK25Gm6/7
	 8H/bL+ykJBzbwFCkO6sYHjt2kNBukT7rUVa+IaxmK8YCGRCuO3FmNX4vZC3vfYeSqQxmx
	 +QtAzYmqGDZ4z+fvbFSxFMYDCe4s6x0dXsfjHA4oPZGFZ3WlNoG+r9taU52RQcjwVkDDq
	 UJtnaADs+ZN07EO5mLyCN2wrgBawYwJaJMsXR+NIK0nDrC/RKqYI3VedS5T1+8L4Ew3rc
	 UAocbvYGYqpKvJAqe9y5+PQiU32muPYBGCef2p6W2HqHsRnc3PaaHzR8chjC2kkMZag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794815581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UgwxB0CUQZVHTHzWqKlMmVXnP07V5Zuytgbvn6PLPMg=;
	b=A88dz/MQ16ZrwmnDwnvrv1HS/KrH9cbwXjukHWwY/imQmqibnD+O/s4kyXHTfIhid1rL
	 8YfbgfevSPIq8Ob5G29y5rC5E1smJWTvtqYbxMheO9ADZNCrIKsiyGL6azZuEhE/whKns
	 pREb5znMWdlWGxbiXx4WP1AaG7rx+Owz3wFUPJjLX6A/BxSOWLZ3KoEmje9HLqE/6ss9W
	 hZ42xgow+LVkU4fgctYNaFDSVV8ZyLtak9sz0CRQfPVv3/r6yMvv2BG2ESZlnetvp3k/h
	 ngD9ft/u8KV4h2vnOMSg78RaYqvFVyejlpwM4B1PGni2bVRe8z8B7BzCVQfMLq1vHJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=FjQ5NKdm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51341606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:53:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51341606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=FjQ5NKdm
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b7245ab5e2so6612417a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:53:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794815578; cv=none;
        d=google.com; s=arc-20260327;
        b=EfjOuHx+ety/mKv5pJ0aMgIOeGxu9EuxLy9xmRg6palqbCczLdMRpeejqgEmdszXtT
         cAvqI3KFKZUWwDzzb6ZzEkuTDHB1Vh4Lcp7n+7POQczpXTLLDNpTPJAmW3YDbh5yQLv2
         NB+lwGIwD16UcqVHXysBnQ2rWQyIiGv+9xhZ0vyQwUSBEEIvCma+v5qUc/Kj53QJ/5vc
         twEuMna27CF+4EfRK85I2HJsrbgmrxGFErD+L5x8NssAMYSiKQ1Q6S8KH45V4elRSt9p
         KStCZbYPGWtlLBlZGGuwYP/yKhelWMOpi+e5TJzSlihAbvfRY/AXJ8M0lU8R4uf1KiPg
         bLaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UgwxB0CUQZVHTHzWqKlMmVXnP07V5Zuytgbvn6PLPMg=;
        fh=Ji9rXMiOQeanQqlOqbDCcpPruhL6uGKA3XznKWCHqB8=;
        b=dJjsFgrC4tc6A36hP2pIhv4+x/DXoccYQET6BKmC8bSwyqiK1F59v2M/fWV05jm8Dj
         Q5+o7jD97jNbKvL4tLgfLNfJS1Ip7EXN420QFySz4JpJVzT3JaDYQlHjOSRxxFNwy1th
         tLpxf/IiGFL4xJGKsg/2Ub1m+B2nHiBZQNnwaPRnM89b8H1QPnwugaO8U9Kl69b/aHgE
         elRQ/03cAe9iU/sMmK5++2wosxltgafZYITrHzgS6wEfpMq0HLRBPGiQJfU0jauvCP8o
         p28R68JokCpTH/Dfm8P123kXjZj1RttNsVbKiihALGzzAf99iH0gMuc6wMP4CNt0Lhvu
         /zdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794815578; x=1795420378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UgwxB0CUQZVHTHzWqKlMmVXnP07V5Zuytgbvn6PLPMg=;
        b=FjQ5NKdmboF1NkVqVcnuDUQ/e/BFnekN66cn/sU80mfBMofQJyE7GuwIqTPuY4Fz7h
         kbM9mA+h3IC3EtcJT28HCXhJxBHUiKZkzgKnqVkJETHqgn+BI+x83dZ4XWP5FjmlynxW
         kHlnB/hpwm/hv+QWM7mLpStMLiulMoYVTd8Kwe3+GwMIy6oA7EQ+YcVnHsBXehEdOaPR
         Za8d+i9wS5mVjSMgA1Bd/0lsl3lWnuEpMd4ZLPUgg6S+Lo8TrVYOZeMlWopx30M3jUQ7
         LRkpCB/7twWBdY95gItYmHVMaG9lK8ivrKZESLaMU2F2OsmBT+j+1xBDK8vtTACVUWoH
         mU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815578; x=1795420378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UgwxB0CUQZVHTHzWqKlMmVXnP07V5Zuytgbvn6PLPMg=;
        b=KL8HBOUs93fsu5XmTNgkXmwkdKFqbGXCR6Ji0aK0LLBM9vlx20OkK445MWbtanqBGa
         BZG9fys2xRq6aSnTNUovKoEWpCp2IiCju1p6AQSX8P5BxKdgbsI5C+fv0/V9afjaNgGt
         pZTTYglqipwE1dVNW9Hxx7h0tL5hkMsF/tEAx7KHo7JtgG+tXy82sr9XP73mtQKIYeat
         5FhbFX1LZV+RzWLqEQIvMfYKtUcWJgacRygBQd13wrHe6DylMypcF40Da/tNH3ifxqHm
         PAtiHPZS1FU8o9P2c4Ld8VIkQ+HwCZ3KTOc8UDoJfXQv4FAED/kS9IM5/rWfHjpWhCfk
         jwRA==
X-Forwarded-Encrypted: i=1; AL+hErG2d5nyWkMIHEsuiRTIbfX6kB5hckQdBvr992Ih+FbL5nUg0mmOmAShVi9m/4vWoXFIUuirQbK61NKiUlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wjnGePo2ETQ2uUcTCSsKuoYlLo4j4vUfT7sdxiAwjq0nEPzzd
	+DrHwEDvIYiEP4y0b5SHSp5FawwoXnY8fwLUbN18UVJCUb24q5SyV/lY7FXM9vjWAkovLVre4Sg
	2NbbCTg4zH1HCjSokRonbxJFIJW4y182w+HT4FiLztg==
X-Gm-Gg: AYBFou25hVzANnjOZj8IHQnEAqver+sA7+8lhxr21s4pVGnBDg8remRmq3yS/sXZViV
	VDAI6paiOF+Cmc3F1EVcg5R1Qo6oAADJGrVHRM8+uif9nuvh80Ma/AaxjF4w9WhsHeUPzzuxUP7
	zS8sLawN72wFxQpHB61JiY+TTckYztsdn5wxjjiwPUdtt3qBxzeXS9Db2WdVy03JnxR475qV03j
	BWOcX8ikmng/R/SR1rT+RYYZ+YmEBMxAehSZ8nkZ/jTxYDHJz8MOC8JG2hQO523X+Jes1idKole
	L/szSqS3534LOe3/OQHTzcXDRMaQWxDTGGYngpC+XMdQqVIQILHuXawdUtzhNF/RJqd+97Sf6nw
	cx70+muh/NBtuHinzv/AEgLnSyN+KtI18g7ip+2ljNz+hcL3PWTcRc90hCkV7VhEeCWY=
X-Received: by 2002:a17:907:8e88:b0:c3f:8c92:3b54 with SMTP id
 a640c23a62f3a-c507b02df5emr1096652766b.0.1794815578624; Sun, 15 Nov 2026
 23:52:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113114427.1845888-1-max.kellermann@ionos.com> <20261113203313.487a3839@pumpkin>
In-Reply-To: <20261113203313.487a3839@pumpkin>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Mon, 16 Nov 2026 08:52:47 +0100
X-Gm-Features: AclHuK-qC8ceaLIq02NfYoQUOEKVWL8Vt9ZedBXVcsFiZnDivZNMxvKeZwBeDOk
Message-ID: <CAKPOu+-=fcJayQsj+hVMPpp9dQNXkJp5QAGm+DV_ciOU1SykrA@mail.gmail.com>
Subject: Re: [PATCH v2] fs: pack fields `i_state` and `i_fsnotify_mask`
To: David Laight <david.laight.linux@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 9:34=E2=80=AFPM David Laight
<david.laight.linux@gmail.com> wrote:
> I'd use a different workd than 'pack', made me think of __packed.

What word would you use?

I think GCC's "packed" attribute is confusing and the name is somewhat
misleading - yes, in the end the struct members will be "packed" which
makes it sound like a nice idea, but it's really about forcing member
alignment to be 1 byte, and accessing such fields is UB, which the GCC
documentation fails to mention...

> > +#ifdef CONFIG_FSNOTIFY
> > +     __u32                   i_fsnotify_mask; /* all events this inode=
 cares about */
> > +
> > +     struct fsnotify_mark_connector __rcu    *i_fsnotify_marks;
>
> #else
>         /* 32-bit hole */

Good idea, I'll re-add the comment in the next revision.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group

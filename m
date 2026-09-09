Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5A7492E46
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934416; cv=pass; b=C3zyQmCGEv854w5Cgq3bEm4RtezoneWCxjDp89n92Vfk/76hw1O/Dly84R1zJuPWdeNQ3kv/3TOW2fTP1bZbFPg1awOj+xbxOFHTYkBOVg+QaJfCiacRCS0PAhapWLnFVpS/QrFmgnBVPlQs5twMivEyuH6RZ9lhvaeQzs+T104=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934416; c=relaxed/simple;
	bh=Hh34p5SzGWgegXD1ubY4RqyF777ARVvM7KcdzMc7gXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CyRBjYPvQZtLNlljgnuJaPutaS/0IuN12ZB31bfLq3P0FAzLmhIO5Crg5r3jRQ6B2KKpMSUJCbT1hrXenCz8jCANCN4Bk3IzL2n4JX4Cxv01nj1yLiaVEe8zzcsy/m1FPFOZLhWB/jDiuvxgWjZkcd84A0xjMy8wv+BUQSJQl6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V4+w7QrN; arc=pass smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V4+w7QrN"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66fca0709caso3182569d50.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788934414; cv=none;
        d=google.com; s=arc-20260327;
        b=oYm6Fy1zOw2uQit8hO9hSSqMQD6Y36fVgYjxDKaSl4t0BN+T9T9x+mi6CHtW//9UN/
         UKLTJr5eGFfMd+HRdGZ71wbm2Fx7reoRLHv8a9ME1iAqEEy/rBARJuUT01nKLprJbchZ
         px1NDJCUaxIWbHiIaj8DpGhJyIC6IVoly+XjRxOoeJQjoDokLL2ptFLwxWnpeR8iYXfN
         wuvWLIoptmUC77V2N2pnloPirXsl4v23ai7jIC25LeTroMWudmxe9Y0sNTz0y8SrdzAU
         LkhsLsHnAGwGWgoizUYGwG34tcINFaQdgyiufY6H13IRygYtaIGmuAihkpEjzyIo9k93
         poNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wxz/6GsfDWh0q3fSFDoUZfAlFdVqkOfqzbjc6fNOU7A=;
        fh=HCiLJeyizGQPl3ZSht11fdmFr6BI5S+lUOmKnAG3nck=;
        b=k4UquibmgmYXA9cIgoa9yODSRWQvc6N+CLNhp3YWvN3y+XZwEI1y4DrOw5wFmhtHes
         uKnZxJiqm19+VSIAcRLzYtnbu9qz4AJqyL3VD1qEFTzwqt/6hGKugiUt6FDpOFN6ZFrV
         ZQoEsce1xZmAdl1ewKSWSAu7rDNUNcoGfBw0XnH4YFMpPEOAlks3MKLv/WThHSpMI5JQ
         mUt/XuE8UiyqJPsfwD+EX39i1ZB+uLtS7qsr2kbY/KculNgPsPS93uJiNg0FS/RBAuIe
         hXbrEb4Ay68cucEyPVUTRHTcglmQwkUAl5mB1DC/9Y0g0P7EYIqdMcU1dndWXXKk8jR5
         DDWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788934414; x=1789539214; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wxz/6GsfDWh0q3fSFDoUZfAlFdVqkOfqzbjc6fNOU7A=;
        b=V4+w7QrNSn7Gi39tvPUwtHHjAcYIRAE8nfsYoasjZGRuIDnOfjSIkpQDtAuHu3K9MK
         sWbOGgkb+r5YqRbe2YxM6AbE5XdObHgvdazHejmNW4uP4x9PxxmF9zTr/UHblDBhVgRa
         wHykRAtrn0eSVH0pZBJxeyBPWcXKN+NnYbw5EbRW6IpLUyEwqwYYzwMweA/DtdqRQc/5
         Jnxjwh6PbUDOt9l7mYfCmjJ8ivknuwrruYgWBoDzJbAEkU6Wl73ASWolLi+LN42OclDs
         eFdKA0DcsTdOIR+gj6+PtBwdo+Xrt/6YBl5kcUL0x34nPNcfVp7KFJvAfv6T7SKQDmy/
         4Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788934414; x=1789539214;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wxz/6GsfDWh0q3fSFDoUZfAlFdVqkOfqzbjc6fNOU7A=;
        b=KxOMzr2lFDeZdrtJZiTxWOSdf582xdOwpfXYx4Q67RKoExCC8xWAbd+PLCTulV5gJd
         EtfcMKnjfh7y/90diNr9dFiHUh6wkWsfgleC1Beox2WlAueVznkw3BMf1fjP9RxmAa2v
         CdNh7lvEMbWC+E1vvGDug1ihPJq1Z9TJl5o1ZDVFJQhofVb8TbazmjeFNcZmnElGeYhD
         wGBROhwewUI0m4K4ALVNOF7gpq2oLyGya0IjJu02Z+b5MJiFIgitCGHvwaDe6PHvYMUM
         uNsZMpx31bqmwCx/0tQtPENdgRC63UdyKOiMn5tbxfBOSc+EeiWvP5Yi0ykwWq5Sj3R0
         LpVA==
X-Forwarded-Encrypted: i=1; AKwUvBxAIT9NG5zRYuDg3As7KY3himZEK9AGhJKbrnFgPjFoa3wqHxfRF08mLKLlqtosGCtMsoRfG8CXmxCu3yA=@vger.kernel.org
X-Gm-Message-State: AFuF++mGFxLai0dE/eU8laiHRgox08nth4veAO94G61w4lucqINAxOv1
	F6YvfFtrjN5JurolTw3PsUYmQe4RHQE3q06s+GJ9iMm9+y8+UtiGoB8dFoBQNn+S0FVkQw1nVJ1
	JZ6+z/xl906N5aabGC5XEgx8v/lsZNq5z4+MbTBEV
X-Gm-Gg: AYBFou3/cKJqzFDUt+2Ku9zsQIkmrmGxR3IskbkQ1qKDe7UuC4DXNi5k3q0DztlN/S6
	RRMRwgz14Y0/8x855JMn13dvxfyxNiImowecftlg/NN0uX9KKysYrwtcmIANRpNgadH4SDNe0b+
	omaJapI3+CmzJw6VUI6wVTc1IJyOWpCXj3AKYFMT3sIIGpF0eXNIYTDTu1EuEzmlYmDaxooyU7E
	SMAB7oqpO58ohB+CKAjIgvvNGfx0BglW6I8cGXfiucVEVeq3FfV1cjPYs+stIH+DnnwCbwvqfOn
	vqii7kRYcF4PxZ4xbrsErq/0tREgFI+q6sPS+YXnjqZPRiq1XOt91RPMh9gg0MHsEV6t91NZywx
	FSQBgKaxhPPs=
X-Received: by 2002:a05:690e:c4a:b0:66c:e25c:f7ae with SMTP id
 956f58d0204a3-66fb5abd2d7mr10470629d50.40.1788934413842; Tue, 08 Sep 2026
 23:13:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906202747.4041389-1-samagazaryan@google.com>
 <20260906202747.4041389-4-samagazaryan@google.com> <2026090737-unicycle-imprudent-dcd2@gregkh>
In-Reply-To: <2026090737-unicycle-imprudent-dcd2@gregkh>
From: Sam Agazaryan <samagazaryan@google.com>
Date: Tue, 8 Sep 2026 23:13:22 -0700
X-Gm-Features: AcwNN1VGOtr2r7ZU5xoiRoYbwpSQVK1QddXIO_qLoJ-bckeoZOb5-01kaA5BeDA
Message-ID: <CAHreonG1qHNuk755MYaN7SPFtp3Fg2PMW=Gg-3yZXO17v_c9Eg@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] i3c: add i3cdev module to expose i3c dev in /dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-i3c@lists.infradead.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Arnd Bergmann <arnd@arndb.de>, Vitor Soares <vitor.soares@toradex.com>, 
	Oleksandr Shulzhenko <oleksandr.shulzhenko.viktorovych@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:42=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 06, 2026 at 08:27:47PM +0000, Sam Agazaryan wrote:
> > +/**
> > + * struct i3c_ioc_priv_xfer - I3C SDR ioctl private transfer
> > + * @data: Holds pointer to userspace buffer with transmit data.
> > + * @len: Length of data buffer buffers, in bytes.
> > + * @rnw: encodes the transfer direction. true for a read, false for a =
write
>
> You do not describe the "pad" variable.

I'll add a description for "pad".

> And why not call "rnw" "direction"?

I'll update "rnw" to "direction" since this is exposed to userland.

> > + */
> > +struct i3c_ioc_priv_xfer {
> > +     __u64 data;
> > +     __u16 len;
> > +     __u8 rnw;
> > +     __u8 pad[5];
>
> You do not enforce that pad[5] MUST be set to all 0.

I'll add a zero check against the padding to address this.

The next revision of the patchset will include these updates.

Thanks,
Sam

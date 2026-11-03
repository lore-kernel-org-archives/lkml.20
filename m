Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793666071;
	b=Y1+CotaTqtjKGOI34BoOWMPOlUAbyguEtX+TrNG3dLSSJcrpYocXqPY6yDTjNNl5eUoa
	 1sCnjAAUDiiP0mXcHj23MKy8sM7H2j1jVs5lyQmvu+sJJKh9zKu7uFDeLjEgdnr9Mg1b4
	 7TW7TnxETrGusQwua339qlEoBEnYMU7r+UdRf5EHLMIVq7HU/nEVw8fJXD0xA4/ZjAEN5
	 J+ukvRZmILIcQnZkmy+nl8z54xYigqMSgTCXSK3SEqorHlbO/Zv2XAVCdgV+ZHySZru0M
	 LYH7KBbDz/U1ntT3cowI+X7MZn1TyYVSRvNfWRGCBiABMcOWF6XTbh2aCtOSO2sXjHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793666071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PxTAxfsu2xujpRsZKIGjHiKUrduvY4qnImh+uidz1a0=;
	b=P32WGqTqa6EiK+4Ow07O5tHzk9Y9CD9qRRfnlZF8RhmVmoOmjHIj11TnGfQO9F0Vy44p
	 fgXj7L5T8+cPksbeXgxYL88iA2HZK944gdyRK+AC2zGQiceMvLF4KwazRsE7figixt81p
	 WqEk4YkxoLmk0MTXLP91CHNjgJOYEQzJS6qIT4L0dzTJQHXCykQEolVHqsVuqvr6RqGQA
	 xOrknfrlRkdyLriNAGuHErGURnz48/lJro9QCghbHWeejPrPkXpt2FMd/IC/V76JST3AH
	 ZY4L39E2sHyj+XDkh5XthYyyyDrEhXdxRwTjpY62+9Y8QrkCU35ISluhuOFMI+9tUaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cN0iJRAU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52005606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 00:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52005606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cN0iJRAU
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b1aa36fc0eso4307a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 16:34:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793666070; cv=none;
        d=google.com; s=arc-20260327;
        b=cXFI5VXgQzVYFlDsFb0QKaO/Q/gQAZ9vcpQUcStgnY2cATBGfcqxVqLM+93qJJ0BzN
         Rn/Aaj4ZCBnyI5bM7KdQY0za3t7Z/aeULfxqxnIY0dnz788j7zULViCJY6yk7EkBkA8t
         ae3QVY4QyIypEo0iguPMWu7744y/yiYZO3BQULZtkuuCLni2XW1Z5qtCLlwUDW1Y17/S
         +C+1OiGMTQNKiK6PSfgw1hN4DTdntUnkMCE/M6dS+COHhCHG7TB0SNzi3eoyR+bsw9W9
         cTRunKH3i8en6ewAwr4dbc3lRoHzhL7Ybt9mAna4xRoauETOK6R2OQtyKL2fnZ7yThXt
         Q9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PxTAxfsu2xujpRsZKIGjHiKUrduvY4qnImh+uidz1a0=;
        fh=ZQ0+l5k91QqcxbhQ/N8McZeGoPXG+uIDdv8jC9njzFg=;
        b=MzSoaR8mrCDrAykg9nKHyOicpJkILiFtRZNu2lFx2GCf8O++fSuriFXOjKrKxI6qUz
         0GPJqrx46xYy9yEpLUrKwDRtjuvuZrv16VpOL0HhqTxEsP9vRU9si6rLfOK/H7FcLt0m
         eoLGPWnSTb0SMZKR2G/7PD8UEKDofVQUfGJCahlTfCu3OIuhf/Q3rGdifcBxdI6bGBqA
         eOXpwwHWnre7qEVVv7M53qPfaq9HvekVIryvf4wFhHv20iFJfImhtFwVsYO32fdHv5gr
         OlhplPSUu9p5fsP+jt7gybrS6FTsPCCgbwxmRK/6LT3eYwUNaZz8/BZtTokyT8O1vgJD
         T3Nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793666070; x=1794270870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PxTAxfsu2xujpRsZKIGjHiKUrduvY4qnImh+uidz1a0=;
        b=cN0iJRAUZTWFJPu2xP47AzsFQwwDHlwRCp7tiGw9UzXTtd188TpuktVfe6W+9lNWhV
         g+jnzckczYT/wyawEqJc5CL/by6p42E1nf0netC4eThk9nE2yVcHZE4D5kd9k/ZAxaoI
         R/hSnb2l0ZoSQVN4zpSVfl7FfSUqMvI/1bndhyA6/R42v8QooZU6mwhlJzBBGKvwp1Xw
         4YN8Z0uBLqNu/pp0DcMrFF+k+KTqx+i7jJ7z5qhlb3805snE/lZU03LjQEcEOC6OMopk
         3MSrgral6YurjGusBMxiFnhAI8gp3gxYzKC+57v7xz9WaaPXN7Nmn9kf6Qs9bwrouIqo
         9uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793666070; x=1794270870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxTAxfsu2xujpRsZKIGjHiKUrduvY4qnImh+uidz1a0=;
        b=vUIi6yNk1PZRgqh+PxqSdmd64k/hls30Q6OwKG7rPzOP0VjJ9iAInhPnHydr5UAk/o
         6swlmnkeOZy5/IoxRT/9pVmhDug+Q2V/B7k0R3exuhkXC4R2XSTltLYqQVbNVFaoxdNE
         n/lRxMaXAfswGj81LuHEusk0/QYbdvfjQ9jMYSXPit6aUymMXbuZUrUOmiJs2nhGV6hB
         GhP4fYML1FS4zJ+/oHyyGpyLCeog0BZSnc5/5O/SoVMjAfyMkOEMMsQ4s7545vo4CN7C
         6VifIC0S7IJEtnVfOLDD5sNkwbKREtk2Fc/fX8IS5GBSZUd45Up2N37GVN6GoBztXnoX
         l/lg==
X-Forwarded-Encrypted: i=1; AKwUvBxq5pzAl3C6lCJZ1vsy928LyMxmz15wU7+WTwMdh5oiwqCYQwFI+ytAxg/MWOi2q/PBB4MPQPDKuqpIjHo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vZF9NRCLhJ3ITxB5DMRlJgVxxIVIuVNR9Z2GNmjlr/YEf/A6K
	bRibVGaiGqTMT2mnGz/DuGWvPcnUM0z53JgOWs0XcgbNrKWLWy53Vy85cfO92xfUQl8zmuNu6e+
	0hpiLeuuHWYLV47N1lbCpl7hF5Zl/6ygYpsbvRtSm
X-Gm-Gg: AYBFou1AqEZOgzW0D0yxVNHD1ZYH/Ut7OLNpHYTmqXv+/ZNi7J5egUhRCQBHbeGFKjA
	Oh3tXqwhDQY8gPJuhVaNXeSL5dmKa5PEslh2dPjFOB30NA5Tpr+baLsw/TGVsxl6bizDXIaCguY
	JTBjv3z7X+WzrA8YiR6ezLljuejJAYtSYl18C8L30TgwckMlFJyiCD6P0YviOHbLkUB+NW0INI8
	4r2HwqWXHCZDfhJpY9pB1FgghlTCslVRl8y8QYJoVWN/5gxsbfOSOqCWdJu9pp/U3v4oOqskyAX
	CEsUszvEzgozoLngU1spNi6RbwI4Sx+H0C3bqG/YXdbIqzBYdIZoaY6ldq9NgNwYh/kZG6w7cvH
	7wToHjpmg6uFCpr7S5A4v3mFb56CdjMCgqR1jvla+dX/dhvYFPVV/4ZLjkw==
X-Received: by 2002:a05:6402:23c6:b0:6b1:d80d:396b with SMTP id
 4fb4d7f45d1cf-6b53e99397bmr14504a12.14.1793666069308; Mon, 02 Nov 2026
 16:34:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102231428.13523-1-pbonzini@redhat.com> <20261102231428.13523-5-pbonzini@redhat.com>
 <CALMp9eT7cnBf6kSXZLWuMyG9a52QveWjzzLz3Z9E=kPuX_ahVg@mail.gmail.com> <aukmeb9mV8b504T6@google.com>
In-Reply-To: <aukmeb9mV8b504T6@google.com>
From: Jim Mattson <jmattson@google.com>
Date: Mon, 2 Nov 2026 16:34:17 -0800
X-Gm-Features: AclHuK-5rtlAEwRRycyUXrlFAmgT2tBIF1kZJbMFG50_yS4OyXqjAn6qnB5u6Ck
Message-ID: <CALMp9eTm1GfVTSCroWNXi_jeGcnEg7AfxEhcqJyN4s_v-PWcmg@mail.gmail.com>
Subject: Re: [PATCH 4/7] KVM: nVMX: Process each host MSR entry at most once
 when unwinding failed VM-Entry
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	stable@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 4:10=E2=80=AFPM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Mon, Nov 02, 2026, Jim Mattson wrote:
> > On Mon, Nov 2, 2026 at 3:19=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.c=
om> wrote:
> > >
> > > From: Sean Christopherson <seanjc@google.com>
> > >
> > > Add a missing "break" in the inner for-loop of the open coded mess th=
at
> > > unwinds MSRs back to the pre-VM-Enter state when VMLAUNCH/VMRESUME VM=
-Fails
> > > due to a consistency check that is caught by hardware but missed by K=
VM.
> >
> > That sentence does not accurately describe what the code does.
>
> "attempts to unwind MSRs back to the pre-VM-Enter state"

KVM makes no attempt to restore MSR values to the pre-VM-Enter state.
MSRs are forwarded to a post-VM-exit state, as if VM-entry had not
failed.

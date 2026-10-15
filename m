Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703FA3EC837
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792043694; cv=pass; b=keznTaZv2VBqguu7BL4R+Rmje7ozcRtP97SpLeka0JvnCoWGBCS2lcC8klyKgAwJ9nsd0ByVwGr+USPvMMiksNknNuLpfFXtNxAeCxvQDNs9Ds/v7OsObxfHzm31zmNp/hW3chmiBGc7+ncIbExwI6d56lYO/KCueUIH0EGstyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792043694; c=relaxed/simple;
	bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GuHstvK0O7BV4eV4+IimH5rqPiLFsNMv8BTs30yAnncWqLiw3w6Q8QzyOtAvk3YE/g1fimdgU4E5zGZLf+Fdbc3/fiyTyhCaDmIqNtJm/aFObsGsoT3iK/d4Dd9JKpEciv6lR7RZR0gnyHDPuvLbhGOwcYhXEFKiQmtahQBhWZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FPuxM6S9; arc=pass smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FPuxM6S9"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bc76e15261so530959e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:54:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792043691; cv=none;
        d=google.com; s=arc-20260327;
        b=TpxJRbvRTaVrirfv/FR2FUd5kOsxO6iUINtATd1SgjRd5BnVZ8LleEEeqRbMtX15S1
         cFbzIBgSJfCXOIRdKhg3z334er3yOztNAXCc0lvZ8MW+P0pGtHo0vb1M1DLjGIPoWsan
         xvOD/IqfVus3ApZ9qp3UHjlUfH3fnTgDtIolT77yODKDF1Wy1W+FMkqWLwGDvAlINDMM
         ghKw10Q0ln40LtQX8fSxv6UXNfNibBu8NfDeY38JkGjVHxCcLIaUsfTW4o4nU96O5GQj
         cANR9hrFOL+Qc8GzoSENW52cGLSjkehJqV/Gah06zydSvRAgR0+3Lm+766tVIbvsDoh9
         NT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
        fh=AyfLPPbHAcpXwLdc4QTqEheS5euxkyI/BrerT23K2AI=;
        b=SxVvBf88u6SDtm9wzKZVGTRVhNXpHjGiJL5rv58JzkEhI0SQ8lloQl+wk5gvcTaKgB
         J6E2sNZ0AskEhrCul4c7Ar/GKmmMN6QnwJ+LsJ4+Q2I9g55KH/16maT5o3UcKj5lV4+Q
         LQ8lL+zWh64HYruAMYNCGv2k4O3fX1xy/FZ0w7MW86pgVpQrFOP8Um3Ef0VxY2/DMeJW
         Mk6Z54w8jDSliYpR3I58+nKnuvwJZMWwlrZrNGD1dOQC7hK3lLhEFQBpNFIDDXPR/NMQ
         VtmJ5Fhe6beZW24tiPJzIC+Y0j/FFkVup1v+bzrlQ5pGtKHGbThbf7n0dGdLUZs9dQN9
         wenA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043691; x=1792648491; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
        b=FPuxM6S9p2v8n3MuLy5LbCmvh3M/e4BYOVO3lYHGE7sDQYqB4AJV5d775id9IxWoQ7
         2iPd08e1ZlcOExL+wk34LR1qgzwJlqHIh2bY9i4dDwN9WxQ5n1c1ODb4l2W9et1Nnvq5
         67tw/nmX9GG/4VaH08gNR6JlZER1uQaBCKbFvYRxen/4DQhvMUNZSg3zZbT89zUJTomB
         aFcc56JH6a1xK6eGkBViLmdDd4Qa9Ak3aEAfnnGHGY/vYD4kAInzFFnWMx2s+/O3JaI0
         Iyx+Vf5+WH7zZ2YAmf1rlWuKHrrXgl+GZAkFZbFIEAWT941+VYn0PmJxF+D2bLjNYtbK
         Qb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043691; x=1792648491;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CS/WlN4e7LCvLKWGXjb8Z6prVrP9B4xMbuN4Lt91l2Q=;
        b=kFHYHWSTnkihB1sFEHRwf1J3laEKgJ2MQAI9WQVVpCb5WKFWV+EmvgRJJ4umS5BG6M
         UlIOwsA/+1S9NK7svi6qVn1ZyR1g+vVbT9FAmPZPnt/3RyI6Da/wPyAdmi8g2yoR2bhV
         l7ZbdTGibRm8DhzLHvkcb7/aVe6M4xrDetiQXmkMANN3a5qI/V43PPko7l/PQtMSDAC+
         zEGqvhDJJhv+SmL77UceFLhix8HuHY3nKn5MSMnnbZOh7VU3LBR9BTKXoL/osQalf+OZ
         qZ94Eql+M1/xBzLITF2FLRzBC5pKDPMfL8acr+1BYKWeDvUJh99+lDqvhgpiYJeQRgtE
         Sftw==
X-Forwarded-Encrypted: i=1; AKwUvBzxsH+DwUp1hGNOBq6SjQ8gB7oOpgfpvzmoIoluLaiD1Fvni3HqypYgt9nrFri4OOl6878SY89WqBR3dz8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNu/hczevrXGYZsGV2KgdsuDVjrDsuzjThypPWOcGNrNv3C+wN
	T5y12YveOnMIgT/dQoNTS0WuEYtJ0OZtFAg+4bK1umAwgyLytu4swNei6OCLu4h9YmPN4UXCBUM
	0EKUUDPCBRgASIoZH/Gziqui+gOM/rqo=
X-Gm-Gg: AYBFou2E1zTBoRb7U6ccmTDNBYUumBGds+VUbPicXTgQ30Mw3or1Gu21poBDnT4ND/A
	RYw/5eMbil+dxzpTlmzro+Z+tJ+LBQtZAqi7nfvj2sPMOre+frTryqfEkXwbQm5QpE0UzVp5djg
	GpB3yRtZbjSVNMj/E9Hdqms8CN+SUytKORtSJ2YDyOuRDa66syZsvCgw4Y8TjXFyacjKU8WcLfK
	Dv2MB3srISgiHSZUpsZfnaVqNcAtrrpA6cId8JRY754VIvJkJg4OQg/QHj1hj+gIkAZHa+eZ+0X
	D4GG3n3edlz04zKP810xXS6UO/egqIrs9QjlKgdoN8r6zaKtPOIyiHUPb7xaS00yIzi9UDQReIA
	0s3zaIUvb2UBOKLII/GZt8P8iA05j/lqGTbh0eqaf3WNBdSkl5i71pZnHG0suly9j4eGvrTJxTH
	puEffn4QjvVgKX5s5RTXEJsgmtuteXh37Sfs7BWMGIcQhFtDJg0qU=
X-Received: by 2002:a05:6512:39c6:b0:5be:3f94:ab0c with SMTP id
 2adb3069b0e04-5be3f94ab5cmr192058e87.5.1792043691116; Wed, 14 Oct 2026
 22:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <as_r8n7p_wdbChuQ@google.com> <CAKmqyKOkmwompJqaP2k-oJicmXmqHY4E0wuLcrvkHLx+oauQ2Q@mail.gmail.com>
In-Reply-To: <CAKmqyKOkmwompJqaP2k-oJicmXmqHY4E0wuLcrvkHLx+oauQ2Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 07:54:34 +0200
X-Gm-Features: AclHuK9vg-7Cq6bGY2mpKNcgjuHSAWaQMnCCX0Z82MCYQeI0nb3RkBYX20rXqpU
Message-ID: <CANiq72kP=BpWL5-X3iGARu6ekW52Lt0uCxd+efa+ME02mUbSJg@mail.gmail.com>
Subject: Re: [PATCH v4 00/22] lib: Rust implementation of SPDM
To: Alistair Francis <alistair23@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, lukas@wunner.de, linux-cxl@vger.kernel.org, 
	akpm@linux-foundation.org, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, bhelgaas@google.com, alistair@alistair23.me, 
	djbw@kernel.org, linux-pci@vger.kernel.org, wilfred.mallawa@wdc.com, 
	a.hindborg@kernel.org, gregkh@linuxfoundation.org, alex.gaynor@gmail.com, 
	benno.lossin@proton.me, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, gary@garyguo.net, ojeda@kernel.org, 
	Alistair Francis <alistair.francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 7:23=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> I was trying to avoid adding crypto and X.509 bindings in this series,
> as that's a few more subsystems this ends up touching. We need to add
> PQC as well, so crypto bindings are next on the todo list once this is
> merged.
>
> Is this going to stall on adding crypto bindings?

The general rule is to add safe abstractions first, and their
dependencies (i.e. other safe abstractions), then finally the users.
That is, adding code that calls C bindings directly without a proper
abstraction is generally not allowed.

Exceptions can be made, of course, but they need to be justified, i.e.
there are cases where the kernel may really need some code to land,
but one needs to argue why -- it is definitely not the default.

Cheers,
Miguel

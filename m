Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2EE3D9020
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790929290; cv=pass; b=tqiOWSWu7XFrXy4qvLGsgdIS3bHHlunq3pGCLjLF6XpRJRe/55uYs8KnnydtuAGhhzePeQLIxHfOEt3X7MDhb6fUrXD7zrioc28OVEBKFvEljzC0WzPK/bpOU6WGif/S8SpxXYz+G+6NX7SmsHTudE4TE5NzoyW9lUlm9Q/1Ybg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790929290; c=relaxed/simple;
	bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=erASVa1Ikd5/lKH4GP+6ubbzodFfIzX7c+MvYO7z0khsjdzyoCkXz3YffbGBgldRclFzc/5o8SVqqEUz4A3jt+jGBwJeQ93WcPTk28FbSRMB+fig+3d4KxB5V6/KhdHV9IRwFiMbSntiSK2QID8OonDTbhvWF9qOFGkF+FzjWSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kk+/XRv+; arc=pass smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kk+/XRv+"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48b01c41135so1815573f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790929287; cv=none;
        d=google.com; s=arc-20260327;
        b=DdIDEGtgViMtmEqkWg+SgxsAAflHS4YoVa82KgMgj+mJyPR1ffq0RPaP7XQ9gszJ3K
         hMaR6VtfOs8BSr4X9Nr5vAt8FOE85ixs+agpu0wG1e1ndLvT257Nybb4KiOfvpAdwNTo
         NOnnOWTjikXiusrmNitE4Cp2GaYv5b0z0fiSWm5o/vri26F5ZZtSQAgD1URwpnaTuuh6
         7F+xeH/Vb5xhaaMXL1eSoF6KbCfGHYAU3e724XW1D9E52JpOe1fgzfATV1X3DN0tzxbf
         +sKVmISTkkwNxhhDqSRqqJ1GnR7iKPu7x5kWOxr80jV7vXXOE69HSspgS0Acak5pCh7v
         qVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
        fh=+bh5738leOoVOx6Ppi1Xg6RZA6WbtuNgF8xfXqCma9E=;
        b=HMViowJ7bzY26+kA9NmPCGFj5hFSUNNJg/uTximDnTHwZaVKPomR6LDJt3OjP+Xjwq
         q8m3Be2jEeWsOvKXyyrEzEF3SAnLY1qEM7qIyMbKfhlD9atWTO7IjH738PYkmwWumUOD
         YGmkPR73aXTO9GvPw5f+L8OC7g/aa3deEyAg/PPIXZS9BRAk9928xM2CD2OakX1I5ntG
         OA2wumF5vfnP4qBQ29kGLmPbvGB2pgUcJQ0z7HNdykE/yZ5kzSgVFj8cvidR45AKZbNU
         glHDzoaTzgKMifBN9EwAptuLA8RW9QMKpPYIiPad/EzV9i+BPVXuxvjN5eC6WcJvI+BA
         ml6g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790929287; x=1791534087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
        b=kk+/XRv+8UJHkj9ILHT2y7qwA8zf1MFqah62QRer6R9ulmJOdjT0iow9atimFNCYmM
         cFBfCMkBIbE3ycSzE7CFA6tqtRhIAFG4Wf5cPZB6H5KcFQ1ZzvLhUkjqK3wvwt1vfUkg
         UPrcy8o6HPmnpKR2NH7xgkmLAJWGKXB81+VtYqgUuSESwQm+W4YVAobcmg8aGLM4RQXF
         LG6/mwdK+0iGXf98QRSYT04inlvUG+/30bxXn0dIU5TowifsKCVhZMaUvLMEYWBQuZrk
         rL7v5HTCuOObJukM8qrZtfjVVgs3ALlWySg05mLnxe+yGItzyGNY36+kAmzntTZHwvCh
         29NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929287; x=1791534087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=diH2idfj6C5xEcUw7EHKyOanYSmbt56Z/ovgECGMrg8=;
        b=K+w8japBMOZDbyEQYjg3jaFlwn3v6YrWH05+29CpgjTCrBHdmaVdgHdtdf6z2gJNjS
         bZyyurRsZaTw7E7PeW11RpFL21NUBnxZ7MOP7CABpVVmNUGR+TlaGGbSlTbopsTMz/9y
         eSWKVURgFdlw5CLXU3vNMRNye9HS91iwazKV6q+e0UWEZLvsKq2u0yQAWxgWGBoLcAKW
         +f6DxTFn641hiK8kQsaNgvx7RBITHCre5/rc1nPRVuLInEak6k85Kt9Ki1yeNg7zq56o
         Z6EEMj0blNUFQYuLNnuOAGFrkZxEUH8eVXLZTiB243g4BRRkbS3f45qQ+BJ2U7wv5vic
         ZEsg==
X-Forwarded-Encrypted: i=1; AKwUvBzRCh6iM1gn+z20fIb3Rgk2AzAIJIekFPQW2PmCeuPyviaFfeX4+eJaBfFveGlXs+Mcuuz8LcSWEhJ838U=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1XSpnUbJduxtAy16cVtoDHQeP11OEARWyYzNN/JHbHr2EU/2d
	6jc6yZ7qtiZCIEgwH4GMybHxEYZhkzKYbCkAvm5M0QzGdJdNuDZ69rrT3R1W1UNTgYjFJGJSUe8
	fxUnzVHcsXFpQDeiTwTXuzcFD1yVTtzOSfMocISvH
X-Gm-Gg: AYBFou2Syzw42YXxccogo8pLNjx4pCMU3FHmT3TCyVZc9j5Hu18+TVlYYjphNVrOL3q
	D+8T6QWYIODaLqXdSV/phRanYIJgvwSC62aa5O7nQTNpvV3Dk1wK9bHBdLNbX9JiJtXi6f6F2a3
	+tVXOl1TqF9NTaFdWLUNf0b3Q3onaagpfdWToHJ/hMLqRklLVMooXzom4mrsXXdaauuGTOMrWoz
	cfZePkz9Hy0LDYciMx2jz4xhcS2374s6/+unpxWeaxF8Oe1Ce+vH/JzEUjnxbEUqlWGbt4M9+yv
	DjnKIhrJuR33AIIPfGA5LnidNeGic2O54NBwrT9PAL+i2tf0/erV1uvQ9+1wqhEFvoSW3Mze9Hv
	tp7P+Tl6qnb4WCn47gd8o/HFBmtuVhPjvi7nuEDDwDCe+2WZihIZSS/HY4Brk2FA1
X-Received: by 2002:a05:6000:4208:b0:48b:efb:4a66 with SMTP id
 ffacd0b85a97d-48b126f1580mr3353090f8f.6.1790929286234; Fri, 02 Oct 2026
 01:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930034148.590687-1-jhubbard@nvidia.com> <20260930034148.590687-3-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-3-jhubbard@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 2 Oct 2026 10:21:14 +0200
X-Gm-Features: AclHuK_MiHOR3Pc29XEsDqdfYPSNeVPeNz_wnZqSqYI3XkcpdkMabRyn2b6yt4E
Message-ID: <CAH5fLgiQ=aiF-WWvpPZkB-LcXxfeXAD1Q8zOF3cLQkU072XDKQ@mail.gmail.com>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add wait_for_completion_timeout()
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, nova-gpu@lists.linux.dev, 
	LKML <linux-kernel@vger.kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:43=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> A driver that runs an interrupt self-test during probe waits for the
> handler to fire. wait_for_completion() has no timeout, so a broken
> interrupt path stalls probe indefinitely. Add a timeout variant of
> wait_for_completion().
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [jhubbard: return the remaining jiffies]
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

With the timeout clamped to LONG_MAX as sashiko says:

Acked-by: Alice Ryhl <aliceryhl@google.com>

Feel free to take through drm-rust-next.

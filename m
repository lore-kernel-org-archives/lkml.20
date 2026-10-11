Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B545A3AFB01
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791710137; cv=pass; b=m5ZwpNrP48CnlpzknoQfy7YIBMCJhHOQ7h/6rmTNbzEcCiloxYtMjDDWcI8kap3dPZDrz7DTHq/kO54bIXit6wzcJ/MO2JOoc4FRzYCKfOmuAY8AJornxLGB3iWiuk6ySruNRDxVUk4h5eFGtTQ5wwrz13aKMq4BFCMeGwYKgYI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791710137; c=relaxed/simple;
	bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az5fJa4fXW1tz6Lip7VguZhgmzNrsS5GZFnkc90a31m+CmrsEYRJ0u70MO7VA2L4jy4uRs2CthmBxEATsem2AR/ebUK4PxOkqzjfj369fOuV60UWPyREZqfSQyF50cOWZJyV0PHwUhpEidHrSY3kMCAs0jGDQPKld7AfipzNQIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfiQ+1YW; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfiQ+1YW"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bb5afa736so94859eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791710136; cv=none;
        d=google.com; s=arc-20260327;
        b=peB8P26BAsqgbq78ouTJfC7QrlGYHp3igIzjo/O3VG/68URMYh4yT6bv3neB5a0lD1
         L3/ptu/sj9dz7s4Mv9dp/jEq61GrSOBzI3l4IM/SaKJ6Ty2Zwm+aNbZagbVrV2COVgFR
         wg9w760VnN59xcMMS93k6o086pDvz0eKrTOPS/4b47gzrIVt2uhX5FzaD53YbuYfJEF+
         8fjmgyhRF781Jmv/iKFOA80GVDKKrPI3zDzrnN+3pCNNm+x93Y66uIeGa8RDgO6fZEH+
         /Ujbib+EceVT/vgI6/hIU5R5/hdjcO22+bz67yOzyBDzqGXYBRqtjOyLGpMFGx8HCSP1
         WZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        fh=a/n/3rzxKLNYmDBvOPFNtXMe7OnFS27tuDeOMs2HOqk=;
        b=H2EeN2Z3QzOv8pKvrhU7zrfJEKbmLoePsMI7ZSW41V872Y7jK24B9T/10JXc0n4bpj
         Zvv/h1n2tJt3YFVQTcM1yfqG9YXHzXQ1xzBn71Do88TwlUOK3X/hgIhCTavAxr9laYCM
         LuBdQPFroGPWRRX7Yh3K+RR27c4EH6bl6P3WKZT9niAXEcmasKN+MJm4SpcFAMnolHfy
         2GA1EBGaI4+V8uHpPmmQz0qf8mApRaFh6f+aBmE3OV/PI1YqUinckDvPU0l04TSSN6FZ
         /YeBsnE3biEqbxhoX2tZWYj6k2FYj1xrThrvplSxiERgCmleGY9fvTCOiQtBu9x7q5Gr
         Fj0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791710136; x=1792314936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        b=HfiQ+1YWFpZUiRoyRuKMbjxWNWn+4Ja0dIkSZ57xjyAWMHlWWv7qWvioozHObJX6cj
         4lDn/HXHf+IVf2uB+T4rMp+rUEWWUTPUuL2wfF7DSRYpLAe3w3WLWFe+as7Za9tK8aiP
         AWwT+zyj5G5X5nsdm3vgZH7aZ7u1HO+UDh59KpHr7NuPGLwxQ5WBRQjOUb+o0AWCiV4P
         UFaorTvX+bCxTH0AFBzPGAuTIzEZ1KISDmoyWMAt/KVuLEURG9NAWHAjxvUTb8T7Socj
         W+7MtRxNyWgAGRylFIm75tnovahpcLsQehEKOFplkMOSdlosbJ3TjIZLijVcO2BUkcXp
         SXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791710136; x=1792314936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hGkdQt3CffghjwhVKgS734IYuXkQ0DDpVgAEI+JBZM4=;
        b=lvYmx6OQvUHa3mu/m3Z3Ac3eJFFhUd0QKpLbEviXoVSfmy2YymCod6X9YIwKwHsJs8
         YuWhIRTAgeGb+b5JaX6aAuAYZd9nxPBzDhVuRtdC2i3sSyokmC5U/NVVlwO+AcYNez0a
         2FllsSkAYxOYyj57qwwADlJjahEl4hzSmVrBO3MWFqDSgHKw9FbdO7cydpawFrfHzG9h
         WrdmZfJTb2ceg+XyyK2DPMYz+6fjrvSxboYaJw0O45T7GpMnbLSTfBCNhZfP+PuNAXEU
         RQ/SwhkDgG4Eg3P1TVyXrIkzg1AyF5V1+jKdrKto00wfTxNMfw3TsOCUFNMIKKn4i5Om
         bmaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn8SO91pegBIcc1FCIHzkMKSVJ89vRygwS62eA+x/JrPLlQwzfEkYJa4vOD3oJCIFiARfEwD8MU4RUUd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMp5krRbIm9+9AtUbYgpJyqETkeFtdpdfpNlscd3wTW7Pj1ISd
	lI8g98nZnFsSwPJ1nxkAC9yQi4I6cxhUNLc2B7iKMQ2Ls/0hyJJf4vOvM9cA9v+G0QflMbBfjpi
	mGnLCwJ6drZ8ugH6X4jpiljfIHfajNK4=
X-Gm-Gg: AYBFou36wS0cRpGcskGr+qWTxPAW64s5AHdcmgTOpFyqB0/1iu85XY139sY4Nslt+SU
	rH8OMqhDvrxRtDBlyt3a3rmmNCjQgFXAVA7MwHVH6IYLCH3yVZjWTEEcfu+OQnICRIhoycCsEgu
	9CUg2l+ERSYuFQWYwqaE42sLrrtkTFVupSh+iMQySc45jiOLyICNeRWP8O33aUeVTJVdcE+zYud
	0L43bCI1nLpT8E2q/Lt22Q8IrnylD3EQhkDH5rqA62tDCpoyCs/SOrEC7JB4bi2wDZMB+rONbyH
	ETlGqmuErM6UqXZNkS0eL6pgnq1zXGm8D0Nn55D80h5tfta/ksrwrIzxHVf81/xPhuq8K5HQUxr
	+EhI0A/MOFpFqb7SB/NBIc39xmtPT6ZKC7CsxPgT4cf3XEtPddtJMAh9E0JFU40DbjPqQIopCqK
	MwhrFNuxmLa+xNaSKGeh2cXOXSge0l6yQiK/IxjfKY7td2P5PXfsU=
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr13816603eec.2.1791710134848; Sun, 11 Oct 2026
 02:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-chid-v9-0-0d6cca376cff@nvidia.com> <DLZJSCA10YBI.2NIG6CA24G8L@nvidia.com>
In-Reply-To: <DLZJSCA10YBI.2NIG6CA24G8L@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 11:15:22 +0200
X-Gm-Features: AclHuK8oq3naNnD7eambaIbJJqVk3yW7pH0z0MJvkulMtcEMY7rW0rV1YUtor2E
Message-ID: <CANiq72=91-kisxDHJyth3xsy8BdEdqLd3qpHLWqpRxY_bmFSTw@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] rust: Add support for reserving of ranges of IDs
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Burak Emir <burak.emir@gmail.com>, 
	Yury Norov <yury.norov@gmail.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	Yury Norov <ynorov@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:05=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> Since that's quite a bit of code outside of nova-core, maybe it is
> better to merge the non-nova bits mentioned above through the Rust tree
> in time for the 7.4 merge window. All the patches I have listed should
> have the required tags, but the `cv!` patch needs one last respin to
> address the remaining comments and add a "Pitfalls" section at the very
> least. Miguel, does that sound doable?

These things have been around for quite a while, so yeah, if we can
land part of this now, then we should definitely try. :)

The "Pitfalls" section can wait, if that simplifies the
discussion/review, since the rest are nits.

Cheers,
Miguel

Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B063C3F5B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900821; cv=pass; b=EgxWumTI5RgC4u/N/AJHKE0tynSx3UGF/lEzaebwZoFM/9v6jubU6EAan5ZSwBpq++hXGit7ItaKJKoFXK0/SqFn248OR8BA0/6Mcc1pRt2CkExd/Vp8o2PxtFL7rmDYHpqavWTUnKeV5MORaGE5dzzfafPnEE9uHbJ9PI3g+A4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900821; c=relaxed/simple;
	bh=LBo+gm3j3VM7myxDHJop+NPUR8ZxxSNcMEpSSvadFCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htdDakpl2A7SpXEjV2K/GWfeJl6153eCLsZmzvXN/rPQ5tvuh9C8FipkUjEa3pCsiKi59F9Vt8yvqyekrLRTp7hPACNAjgaSGHp6XemFXghsY3KjAE7VzT2FGldubiOeaXrsfi4Bu2Th0Wo5Vhu2BKQf2fuPVVA9H9lZxv9MjYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j10WrLuk; arc=pass smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j10WrLuk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so23820145e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900819; cv=none;
        d=google.com; s=arc-20260327;
        b=TQzoG+fCjQKWuc1La+oPDlQW03ZDiVini9XSkmggAUmTC4Nh8n3g02T7FVWpt1x3rq
         4rcHuMPz25CDnSno8mDt5WkMcaldZz+rOUMupMcF44yorCiG8gpzPQu6l8ChvffE4Om+
         Uks4gSlYzgZ3YnI0vLU9z+yIpoF9fuVDHYD27dtz0txBpftyM0cu8g+gIpVLMOxTEBf5
         eAOia5x0ONYT+5qrxBRDzFcEqDAHFHWUW3SwkltcP+JhzXEpOBGTBoX79ea2ujgdw7QN
         XsmL0bZbVAiBnVbhgLaapvRx/BbLvmyIc4w0wCiv/6dhoCuM3saZE0NIUlZjJcSQIqjM
         9LEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        fh=UyR9dnobMwQbPheNBe3g85E/wMvnW9fVFlSZ2MkXs2Y=;
        b=fcfZWMIgJ9BZ39FG6o1AgTXOxcNAfWraiGH76V+vvXW+DMsI3PhvryfN8FsL0332tE
         PQroXAnXQMboHe0r4v2u/kvsl8XhrE+PUmDK1dY9n7d+jTxIoIDTacvbahi2HTFOoytx
         uv4rM8E9JVVflsITWSGSz2Hyord2FJNeoDHLIgaUsq39pn6TGydptlSrCy1s2R3nWTi4
         +8jEQ7vR8ZxRhj1xTQ5HaNCbtNpozUAk56gPDpy2E7/qx0SAqhVzNcZoduac1Ceeewmb
         ROLQOT7LnErvsFww5b5q8EVMRiIkVFUsncCeWMMC+Bt4+3lLT1iCczoVZjPZQ3Td9f2m
         KPaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791900819; x=1792505619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        b=j10WrLukAMVmifdfiJMLd6LwM3DD1VoCKQ7lp1yihENW4WsK0PebFuRtrkl9BCJ/U7
         rQ4osOPQaj7i/YbZl6GbWPrBE7mMyCQe/0s9qtE2eyTy7OgI0Q87lO5Rg+B5+FRpSEmZ
         vDfUBqAVl2u+lHasDVXE+s85A+KFUSJX+H/hk62xjwWOLxbBUOXii0Q4gzi/AyrWXvXg
         0+dvdabwfx0vGhpD4cCc06dXXTqt5AeNkh5Nx4Fc2uOsLT7rNrcE98L5yjx4lUFCEKoZ
         635CXEZXOiI3pt3lz8fiMpNRJH2UF3bMA3XfTEmV9qupfLUve6zlJCsiE5U+cMiW6WBm
         Warw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900819; x=1792505619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        b=u36Zn0I9qlUXglkBYdDRSVGeywwAZdISdtk41Ov8Ihij54CNwASFC4BAKPLWECIqbn
         13BY/nMPKAc5frt9qcIQTMJv8HdnqdFPgSDmJ4LQ+WIXAItfiYJTAqQnM0NLeYfEL/By
         PVfpkJIsSsK8OrfFMjkaa+zTiGwXVusyTbFJHfk/sJQUfZWjW7a+/Z1bcEo+KkJNyksK
         lr14H/NVABV4cKCWz8Px3HLp97PJvN2Z1tJXFZ0t6IO3IlrzM0TdxMo6tnEfvMdEwi3S
         2E6kJmdUiRRju1Gm0DzS6VpSnjQk3KfEUvsw6HBdSz29QgVKE+x6RqwH2Pt4RszPoDm2
         WlMA==
X-Forwarded-Encrypted: i=1; AKwUvBzWraZ9AMO1QNOIl+IHGZ4Vxjl0qlbiUOBAGjC+nhIbiDNTl7ALG2P2DY+FnlUlIPcoUTpvVo8DW2dKzsc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb/Lqast9RRJpqzg4s+x9dED5dkNutqKMpD+Hyev71mrnOEOxA
	YG+/m3SueFpISfvV+XqCvWBMaTz5Ary4qv4qC1mqgINXZYGi860DAjlzvZLWRaa4jV1ogC8xmFU
	I61n0IQpTwkVBoQ/CH0/cOO+nS5158DfUWKulQYfw
X-Gm-Gg: AYBFou1MQt3glP1FXqiEv8UanAcyz0tFvK7dGruaX5KVeaaO3aHV4L46tEi3vbEZcOq
	q1yT4dWazzl76U0ogdAUZIHtIu7r2vjKOTpLDT7p8y+idLd4F3BHovm9i4GQl12Gwzn9aCqjcbU
	nlCavHy8UsQM/xvHyOQRysJUrhA44aefytniMJr71W4JHxxc8HcskIZktmZW1BZLywpzpSLaWOM
	llnDVAaRjZcAy0LddS0QNEPzE7T6a+o4r7bXFblcH6PorJ0YYI63C625R0kXyMuoK8eweCRHJzq
	+BXB6QdZIj+EC+A+36LslqADfKR+TS9WojPPmVng26gxsZTXyZgHclO8uTxwG1kb4EGobPJgbKZ
	Z/Tun4oylYlwW+3sm1gQiLyA=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id
 5b1f17b1804b1-4a18e4f56bcmr259716625e9.33.1791900816884; Tue, 13 Oct 2026
 07:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com> <DM3RIG8CD89K.1HR52QEO55IU8@garyguo.net>
In-Reply-To: <DM3RIG8CD89K.1HR52QEO55IU8@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 16:13:24 +0200
X-Gm-Features: AclHuK87fvpdr3oX5HLfqNciClAH9QoGGC3hFM3xSlDtUMWAcOLzXqxC9G8ECqs
Message-ID: <CAH5fLghXHoy_2yYyjf+GZ16OVqek52XbF2L9Da+3qWgpf5Fy_w@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Gary Guo <gary@garyguo.net>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Oct 13, 2026 at 2:51 PM BST, Alice Ryhl wrote:
> > From: Danilo Krummrich <dakr@kernel.org>
> >
> > system_wq is deprecated and triggers a runtime warning:
> >
> >       [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
> >
> > Replace system() with system_percpu() and system_dfl(), to match the
> > previous behavior of the deprecated system() and convert doc examples
> > and tests to system_dfl().
>
> system_unbound() is also deprecated (replaced by system_dfl(). It appears=
 to
> have no users, so we should remove it in the same patch.

I will resend with that change tomorrow.

Alice

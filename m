Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793107210;
	b=BCq6eI763GzzGCdteCTEWnip0yqGJJfYDTsgmwyq14h7X8/QPulXdzw1YLrISOE91TeO
	 DEoX20Lvi6Dj41jFPy0YaDI7YmBU6L7pqp698nt5yJP7f/kmj8JSCuSKu3laqGa6oe9it
	 VzAug2oTPNnugdzlHdFmwfJba/mYYMxcS5ohlo5KCeGvM0jLnJOHpU/i18Qem5lXAC6RY
	 IMZLkcu2TkzhmTZBACF7+JbIQ+BI4sZRE6z7QwWX7HT/8EuCWVTPWzhbC3MW3uSDEUdJM
	 vnEOu0I0cK6zx8U2Oj++nqig2G+XYNA08FMJ2IqvbA3FFT8NZ4P9V1/aCdtKdgqZv2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793107210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
	b=QoQ7fUuDi3IdYESHBjjvQE2O1rs3KOvbIS0W8jR4uZoL8l1MqSudKOG7VWCH86DEfo6u
	 SHnlg0H8Hr3Ei4jwO+Sqkc8w2PcNuHfk7BR8DK3L5OjcZtiTt73cWRHxHCA8bI7f+MuCu
	 rXbS1I+Wwl/NJ4d94EWe3IvXVrqJw4S4lOAfL8qVHje7vNhGzVArxJkY0IQwVhRZOl3T6
	 vexCHbopAVB4kOkRUgUxC+ooySyEfcFQZSpIwRHz5Wptq/RgrG/xVCYwVqMnz5Q0Y4DYJ
	 p2WmKVtApb/pZfJWzzEQCTri8ZuJfeiMZJgTRDj2IVkrES2mYygpff8m1u1tJGcRIIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwmXxI7Q;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B46D606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 13:20:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B46D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KwmXxI7Q
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36a10095f3aso134123eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793107209; cv=none;
        d=google.com; s=arc-20260327;
        b=U7DMug8eo+WseposPe+O0JArsD4PGTZI5HUPD642oQtcSSx3cDvVYnmUObDAd6vSUj
         gzW1NHWl2u5T0X6lXJgu3TEVNGkgAGvk7YlJ9eTCBNGcv3thOcRjyicmOwLftRZ/K918
         NOj1eudEQV0iG+VXc+Sr+CRafftJ4HyJVs6dKauQHqdMBnVqWZigQYEOH706PGVuokzF
         Ei4Ql+kBI8VVSYd6frvloQ9U1c5iiOyCl7mVdxH7A5xM7z7cOtRxgrF4e7x/ex7l7NfD
         ojwfr904iKkAW9e7Fe32vm5gfDMh3xkdDwazlQcYhMYAnHtrds+yzaMfmXY+A2QUe1GJ
         OYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
        fh=dMj2Is3ku/CVmj4OIwKiB3brceETsJGqmS1BAebpENY=;
        b=CVpPAyNJVYOfwMplJXPfyRv8Miuvup4epXCFPxdMyaiuDb/l1OM0Uy6UEKYpaj+JlW
         EtfMBFbyT27ON2vy6iL2C2zVIZCwgc0DUewLqnHgGwzkuU9W4VVYXJEj8ifWTyty8I9N
         TQ88RSGmz4bgR8c7NapHBXmGyL/cI2oZA1iQwdFVCjdhJujHGBDsYnt/2d5rT6Gj98IS
         GCorom8n4NPcI34SC4FyIOASULvHXW/H73qtxj3MwNsNq3fgAkA7o7SxLeu3bD1W6pWA
         tviZ1dlNW95ihu83B6E1IqD8t0bwLqSny2+KSSCbQDTLew1huQW6bXtomJPDTUt7P8LD
         MsKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793107209; x=1793712009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
        b=KwmXxI7QR3rV0LwEuF7BShBsVedgcPi8hai8PBobx3gkqKirVpQcBTCe4X9ZHRjS8t
         M14IQzNGZsu4ZztRoW39NVUxZXvcM5bs7xFhcfttkxagYdJMJG2NmsNxEqs/yqY7YQc/
         ImZwrvRUFoNCML37bPj7ZRCT2eT6g/M0tRhDr3GbRwirXSjVr3Kr9Ia5BU98BgeZ2SkG
         epPhWGp0UIHP0ktg328MhtG183M5XggsEaNwijx6cOirBfhy9UAS2wyTCzeBzE5pCmsR
         RPjhQWPw/SH1q+rzEVMGeKdQfE5nMr/gDetewjQmFhLg1zBP+icxHKGYp81oc3aKNDiH
         YnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793107209; x=1793712009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b4XlHG69rykZdY7UFDMMd4dGaLAt8RQaxs8vJ62P5ng=;
        b=ymNnP9ujdNquDAXt4zJ6gOiMgh2M3/iHRsz99NmjmilmBAc6K8lrZnSlXZdTZFEngQ
         KGp7efrNKkVgfsAKOy9halbV9Z+qpv+f3cspVbZzTa9uwWr5fMPsNRa+PVBAgIJqf5qA
         tBqghHlWQ2Wkns1tOa2VlUYqYlfnNNcqbe8nI/xsVAwF4zMcKrg64ZyHqUcFUhQ1q1Ur
         FoIUqudMmGegy7qrsgZnnE2/GFVdAsCUuJ172vf3gt4RO96O6I1VdDTS/b7ozlhuzfeS
         syzW+PAGa/daagb17gIgtPL5aHv0uVEUCI9g8uBwQIZxzuTfejJEtgQHc5atuHSqwjYA
         oI1w==
X-Forwarded-Encrypted: i=1; AKwUvBwCgnxGjt3CHh2vFk6eBGSk56K64nSkDAFSDpglrx54qLGboOT723c+NZCHjzeK5Js/6em138yGO9qV6Fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6vCW5Ax7O13dQ91PWVhe6HqkfU5+nWcFLw0DrTFTQoes8z6Gh
	zHcFykDGqkefETVG+EEX5zFfMtuWVvtdP/V+IVeIcQXvC2lXPMVcVjH/L9rgQCbgo861iS3EVgX
	hnZb4cA1auy9KPlQRQuvHeGIo6pUPNHs=
X-Gm-Gg: AYBFou1sFaRmW98R1meTY025/CqgFqppzvmDfWaejaUW9bdRN2RQ6n9IeGj/gYVj1W9
	JNRN07rGK5uBdIUePbNctRMmuc4Pwpd8NdGARHeKAg913kHbwf7dnEpx1msjEXGLHXzEwekTmz/
	UWiYUb1V3LxmuEPLuTfCnQQhdNwvVR9znMnsbaTOVqom9keYXLHp2Hgk9lpKWOY25+/a7xA/Pi4
	uZo9pTOfiZlu9m2XdNyWMtGmi9woeU/EVaKr2NdaigigPPfpwi348PgC3B8q6LBm26K8P+f4fwy
	SFqoeYmXeBw0WNbdugnbthA1Ki7ZBUjRynNYKLmW1Gp2N6NVo0WFdsnxijcwKYLJ7OxdzD7EXg2
	obCzcWeHmBCjYg1+xNy1Pf2HlAQ3XpKYIIZjtN/5XK1GyltilhBaj8icNKG2LcuKq2tE/rGRHuM
	dhxLe5E2lnv+oUSIRg/YAJoqFRbVTL+OJ0PT44DpTJ28wpPWZMprKfaoaqUXvHu0Qg/4tu3zYzi
	3uuwXp5jJV0ap6IaxwJ2wBPDYJQG1bu6lCX
X-Received: by 2002:a05:693c:8817:10b0:36a:143d:98db with SMTP id
 5a478bee46e88-36a143d9df6mr3896465eec.1.1793107209313; Tue, 27 Oct 2026
 06:20:09 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928011123.450800-1-alistair.francis@wdc.com>
 <20260928011123.450800-11-alistair.francis@wdc.com> <DM4NT7TFX4X9.1GFI128LI5ZQ4@nvidia.com>
 <CAKmqyKNEup=x+bwmPD_8x0s4ssPkqFnQtSGqJ_82z9oDP=A6cA@mail.gmail.com>
 <DM58HRC3DHSS.1YC0E53ZXANT4@nvidia.com> <CAKmqyKPwirjmeBQvXgheY8Lh-M-RRq5pdbv=5mB4duhw9aCbGA@mail.gmail.com>
In-Reply-To: <CAKmqyKPwirjmeBQvXgheY8Lh-M-RRq5pdbv=5mB4duhw9aCbGA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Oct 2026 14:19:55 +0100
X-Gm-Features: AclHuK8O_cUPC_NV8nLehaHvClvws6tvszHDrs0qLddmTGSO7twgLKCazt9sU5Q
Message-ID: <CANiq72n=eqh6W+iNWPdM+rrc+HujtZVRtVg=JB03OMS8rc5hiQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/22] lib: rspdm: Initial commit of Rust SPDM
To: Alistair Francis <alistair23@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, lukas@wunner.de, linux-cxl@vger.kernel.org, 
	akpm@linux-foundation.org, Jonathan.Cameron@huawei.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jic23@kernel.org, bhelgaas@google.com, alistair@alistair23.me, 
	djbw@kernel.org, linux-pci@vger.kernel.org, wilfred.mallawa@wdc.com, 
	gregkh@linuxfoundation.org, alex.gaynor@gmail.com, aliceryhl@google.com, 
	benno.lossin@proton.me, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	tmgross@umich.edu, gary@garyguo.net, ojeda@kernel.org, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:19=E2=80=AFAM Alistair Francis <alistair23@gmail.=
com> wrote:
>
> That was kind of the goal with `SpdmState`. The issue is all of the
> drivers calling this (PCIe, NVMe, SATA and SCSI) are C drivers and
> won't be Rust for the foreseeable future. So there aren't any Rust
> users.
>
> I have improved things a lot with v5, let me know if you still want a
> Rust API. It just feels a bit silly to add one that will probably
> never be used.

I mean, it is true that we don't want dead code, but in general we
would also want more Rust callers in the future -- so I guess it
depends on that "probably" you mention, i.e. how likely it is. So
could you please elaborate? i.e. why is it that you don't expect
future Rust callers? Would the NVMe Rust driver want to use this
eventually if merged? (Cc'ing Andreas)

Cheers,
Miguel

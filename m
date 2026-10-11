Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1472C185B48
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791711618; cv=pass; b=Edjf2jC2G8fl05OcCLGFTPQgBrmAcUXUkZtCLrvBoR5fsj2rLATp7FGHJSm45PBuVrHpGzBW4nDPvw5i/6jKzjwiht8KH1ld1FMqtaMasYvTslJzQjmhINwIcSO+cr9t3nk9Jg8zHodWLhap89cNxUfOTixeYN6+2YJCLEZ3GFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791711618; c=relaxed/simple;
	bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lo8SWFn7v3dI0GIKRBD6oBrOdAmYUl4gDb2vKLvtcLXIxzdqGq76f6DdWYV1AFNgH07n6u8kEvINhqny/M0+lU2Mh2t9ICl83NqhLJFoFn/vYQeKZGVz9ySkMtTrXG6CyOvJC4hyA1gF5j/ZKzjRu6UxkqTS1PD+1b5Ov40tRZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHylWetS; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHylWetS"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3584f70a5aaso100571eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:40:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791711616; cv=none;
        d=google.com; s=arc-20260327;
        b=f70AbswrjElb69vW/0f+daC9J1jvIlTEgjIJe7j4VbwLjF6OHI7Y0TQuNzgCx2HDSG
         yGmwoU0Mne8Z8Qms3jmpjWhDJSud2PVOYwGy0d6d0AuNQ7iQbBz5w+gRH6fEFh0x+mGO
         wPpAndcHBaSnD9ZHhhI9r1+zrjPdcgCaPHSXbyFOe4/KbKuEouWQ1nv/GzGpq0/xSJmA
         KscXrrjJm5Jh4ni7g3RaOCOA70QONEEw4YSYiDQNGZjxI0kCOE1x4WwEZRy4xb7toJW2
         bCjCV8Z4BTrQQ30oF8g6gGOshZAp1FpoQyJYoMZrUFRzgypDfFiVqFZIUr4vKd5Q8x6+
         la0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
        fh=bIWoXAHrW7fUDqiiU8h7T69AeUov04UF9632Z8T5XnU=;
        b=Jx0pmGBw3CjD+qx5O6dG6yyqMwN7qcxxi8s13rB6Skz2HozIJS7G4JBg/ZYKPQu+DD
         ZCzw6tCrz4UraJBESJsGb3c7IWEtzHM5K/TSSZTFZiduLlXYr3a9X9HiGn8b+Ac0IpMP
         BBH/AMwmoEdRRSrviOT9DByYSH2zUceVMdZUKcPO6mwEQmmeHGfqRGQJzAkXprHQe8CR
         sNTIU8NtgU1D1wmQ7l+HIg791WkVMWQZxMqulEjuaCBQSd+iscqll1kU2hU3GDAFXNOO
         NQ/2MtZ2shHaXY6IPxUzuNKE51it3l872QGjErzw4Kt0S3deI/F2q4fADWCnu0qBWNeC
         Dtsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791711616; x=1792316416; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
        b=XHylWetSXCE1w8vC5w6tbwMwik3UaWYf+IsuKlM8O/qEyoqRnlr7gnVq6xawQFGkc6
         VQCJei/jXiSgqb+z6ow69PTQiIQKCMbJ5vGax5nK5NwEg6/C+QdN5B5RY0mRplieBMq2
         U9T/o3kPS/6rP0/lONYTFyhKZIWsgWMO3R40A8m672ZNWSSe/5YQmBuGwB6HOn6NGD4u
         QEGfJUFaycxYjCzZ1AayaGSOkiZfGKrl/UyorzxtcNpIE1ve6f6f5JcWTVwdor8byY/q
         YdKJYASsEIe/kfUxdToVZWXmQeH4mxKDNYW9aStlu4yFqP1b0zD8DVtiOYUPayy+BfmW
         740g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791711616; x=1792316416;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPOKLtlIOBMeWNT29ZwZbSLlX37p/Tt1Bk8EmgEgNNk=;
        b=G1hSWWbKZcLlsl9hoKnR1oj8kqgad3EXjhaWXLPD4JNBAQtDUj8yO2s7uSCHJLD38l
         6E194DU44RcEHcWYZrP2CjFhjDBPsYG5+2UdxIKXV0gM4tXJMgYP1Aba/LMONm2mxnVz
         1tPDBnFXJifP/PEB5Ra8BbKawKiA+lzuOD4rf4/hQLMRQGg4qhYaZEUfID/rRpaH+X/2
         6wAY/zZyVBr0wcHzOHLd+VBwcCzhAFQGPnljygxIvhJsk86FE6tpdrBmg9j9v7mqimsn
         nbkrFhHZXigM2Qb4J1vEQD5+19mIPLEz2ROMiapzKYfafl+oAg3lrBfBBs/sxGI0E61k
         OKPA==
X-Forwarded-Encrypted: i=1; AKwUvBy0AmAJcsyHqGqThKFPutXFhdolPy6MTFkU3HmjXSTAebNA+Wt+YygDeOgBEreu9VIaZkxOISlBAiFQGTI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9/QO2ilqNpFMgGqNnCKIDkife1h0MDUyzEPRdUrnLaZpC9JFt
	mOWNtK4GgVKFljMa5lxfJMppk0L4Cbi9Flz2PuLS+TfuTSEppfE+ZVhjJiGqdounpS8z+sQFYbd
	0gRGIS/14qivf6rWVgRidQhvGKzFUTxM=
X-Gm-Gg: AYBFou3qRZt1D/DbcFpbrGCEWKMMahPx4mZeSYiMK98bGISiaBT8mfdKUE4bbKWW6RL
	9bwQhGiFjWyD1vytFW6FaENtWnlBtrEFOe2RYffWNL99ww1EB301SU2/m1o5ah0U77a+plbKeMj
	j3A9u3g59k0Ri/Jhi7LaKe98FMba0Ds8aFjE4PSu7RupORFAe99TlIv6D9WCNz991CakvmDiaoH
	WHvfr7U4jofl65QwC2yW4gKk8otAMWXiIG59slnFnzpix2FFX2r1orzqweZLcDIpkTxqUnR2sSd
	vYMr3xJTw8/qTYxrpDYnYBiMWFFPk1uxfMVnnEGLynUm/x6q4MvFbu1RgKps5DhJiil9wmEA1xG
	52z5+SN4szKn6LhXQcO0u6Zjvxe4XLmgRh5n3xMvIqi9pH+u0+uATd3OVIytapj4ZA6rn4etQPA
	fH4KBtOL4tAddK8oBSzWdLmcUsdVDS4zdNvnutYjUeC+O/4ijpKlg=
X-Received: by 2002:a05:7300:c01b:20b0:351:e21d:357d with SMTP id
 5a478bee46e88-3537dfdd089mr17725542eec.1.1791711615924; Sun, 11 Oct 2026
 02:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008-dev-selfref-v2-0-e280b3c8fba5@garyguo.net> <20261008-dev-selfref-v2-1-e280b3c8fba5@garyguo.net>
In-Reply-To: <20261008-dev-selfref-v2-1-e280b3c8fba5@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 11:40:03 +0200
X-Gm-Features: AclHuK9QyawQ4Xsrr5oApYDgMaQgs8poCwEfL055p9grzyMuKeCNGvafhrR8JLg
Message-ID: <CANiq72n-gTQ24Kr9oMfYxk=s==LtXdwSE349x3dM7YvOuywgBQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/20] kbuild: rust: allow `clippy::comparison_chain` globally
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 9, 2026 at 10:12=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> The lint would suggest comparison chains to be converted to match on
> `Ordering` instead. The suggestions do not always produce more readable
> code, and also it can produce false-positive when not all ordering has a
> branch.
>
> The issue is known upstream and thus it has been downgraded from style
> lints to pedantic lints, which makes it allow-by-default since Rust 1.87.=
0.
> The current kernel MSRV is 1.85.0, and thus the lint still triggers; allo=
w
> it globally to match the updated upstream behaviour.
>
> Acked-by: Benno Lossin <lossin@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

A couple links for context:

Link: https://rust-lang.zulipchat.com/#narrow/channel/257328-clippy/topic/d=
emote.20some.20lints.20to.20.60pedantic.60
Link: https://rust-lang.github.io/rust-clippy/master/#comparison_chain

Cheers,
Miguel

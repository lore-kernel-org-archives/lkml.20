Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23F03769EC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812988; cv=pass; b=qUZOiZCb0dLRiPLYs0L7aArRjWjyb/Gh3wLigI1z3WrdDreoZfssncxp3MgdyqI1/RGX5DDipaip3aA3b4J/HdQ/2nz1L4CjTFlGLOILtcW2+aREOBg7AJkHK3V+hfSP9k4VNmmIWg7FReEdh6ksW/NOk8SP+qWbgLLdDhG9HDU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812988; c=relaxed/simple;
	bh=ISLS06yB/S3EGCoT9V98gqwfJCG52MaY3yT2t41Lb1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kOa5fvJhtYh868eGQKLSuesLgXn9EHxxgOX0QUdAZR9LOz9bGFQuJB+QyVdFhZq7rLPSuuTlkSuxZaUb9IWkdXRX08n0LTku2BacZ1iAPLq+G2WSaTgKE7yn8VGl4Zgahpo9l7CUSbRoIH61gkIYf1jitISqiDxONnGFZreLjos=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qEQWcimE; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qEQWcimE"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-313bab9cfe7so195619eec.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791812985; cv=none;
        d=google.com; s=arc-20260327;
        b=au/1hV2+NIVmMxisoqzqT1TL1IYlGn6MjpbItnua8IhVPtgXJ5PajlLp9FXtIzwOOs
         9Dd+OdCQ3/6DFxQ9sp+ZnJZJG3qxPK/SIoj7FfEUGF1k6LQJJmSFszKjqj2i0YO+67wL
         LNztExqx1nSt/b4rjwq8a7o6fQZrtn21u1QJlSWz9oqbX09u12ElDqDoTUJ1Fv4RXIMr
         okgxqfqX7zq5YCMEexNuv7BTImne+iaqLPX52/0loENy2cwOJ9H2ysNeXo4zTnSF67wW
         u8fXR+2xfRtUajlfIr5GjdgcTvs5j6jaUD4K/Cw0CPylL8BXThEr0wB/xp1iUdofvrfe
         PORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpCzaba4Z8+h5YN2LOxOirHmD2jHuWMJ2dQPgTxO+Lo=;
        fh=U+uMsWjME8zyg7AqTAgxumdUGB+ZBaBnamzFe1So5WI=;
        b=CT69y9JQquCKn7TbCNddkfubrSiJ4OYrOyBzzrj9A+9EkZSjRtPq/q7LzyuTkjlx05
         R3xN3HpE+3b07q9DgrpH7teaXDeRZ1pJFy5hcnh15dNKTpiR4XPqCw9ZB4+v7TZNwsPh
         ydFj2ccuWA1EG7YkZY9+VV2z4KbaTAvl+BIlCXpuY+SZr/BztD8xSU/tlVkHCTWIx0r9
         HGhEd99uPbNtvfEiy5gw9ZfWJOrvWKvYuHu3EBgMZI2sMALarj6IgyC4Wj5F+PmSdFfp
         tLPiLtw2b1sDovsfUaS0aGx1sx127YzuoMhyXkDQjKEzQhKh+heHLtAjZHmI25A8418u
         NZOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812985; x=1792417785; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NpCzaba4Z8+h5YN2LOxOirHmD2jHuWMJ2dQPgTxO+Lo=;
        b=qEQWcimE9b8CLmokMFwVrAG9prNF9C3aX546vx951Rn0IKsOxLHqiKS1qCJmJiQtbs
         5Ate4arF5jrmLcBeINsLd1kdM08gOMUWEfvk+S80zj+ithd7jo6oEdQRl8yNUK11z3Tk
         8CqR9LAnz+fvVkwet3SojpVY+cUJNgKQ2fzIs7cEmPQ6bcBtutu1w6fHObPZibRsEpnk
         mIKIOPePR8ULsvXTsKW3MyjkXdKWvaxXKXDcc7Fd68mNDS4Vwbb3zboYCG8yR3K/IvEH
         gOLSChznN0DXs3+JzLUXdZU8cfSaaAQ3Poc9UGgPCaaKL4dF6+4Us2WAJCVTp8lzLiqe
         kZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812985; x=1792417785;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NpCzaba4Z8+h5YN2LOxOirHmD2jHuWMJ2dQPgTxO+Lo=;
        b=bJg0+93By4g6dcze2O1nf9ir0SquAGXudOfMaLT7hWQYdptU9MmT11VQxmWQfCZZNl
         87god/dVvHESH/ZRSNjANb3IyEPaYvBSVGiMSAUaneqDK/oYy843XpyPyjN0NGzt/36z
         yXwGFMAPeslteABvEMxrpRUrbEgOk9CsBo1favHH6JBQ+Epmk9RALimaxkpb45xoHWcY
         65yQLnW9KszE0MTthnf9swYV6WoG2zy1es+oOiJ4I85qz1huO+Gi6PM0wcXO45PLR0v4
         8GkoBVxVn5tXgfiDFqnkbs760B/V/x6yPPFDR61dQGXA+qe+SDCiiqrDt+k5e1kSALl+
         Ei7g==
X-Forwarded-Encrypted: i=1; AKwUvBzFWJ2Vf/q839SwROohnTBPR1bOP2xvfvonpuF0pOubqVKCrH2ssYkH4HxnGaIgfDI8mhhnRSm9dfNwgg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYXW2lPitlOlIRldLE4oNea4kcl6vPrT9MBKAE2jt/oMfOxflT
	fzSP0i4qb1xav6zu+Ta4D4ZiFX/t5wQrFa/3kDkc9sPt0h/dqUuXzshuF5MoFm7MtBS6VoroO6e
	C7K2NfL3eJdy9bV+osj/JQVnZ9hwnPEA=
X-Gm-Gg: AYBFou1OrhoXtSEmV3eEEg2NTxWDqRGEQkamCSBlI45dWXldqDr6eYCnO8z+ds/xsYN
	ggLM+ciowCO60RHN73Jj430bTy0tRL3957uvk8PaZnfehJJrBXTmUdkXGWBe6LoQxz8i5iC18/5
	vMbg+zBbQjnL9ofVMJNiRZN45AhtlHAA0mH2TuRZ5qFctnBFgGUGcqVR2AUhyVFwo3glmlUbosQ
	F1nTmRc5aSEZpkxIT1VFprgfz+4FWtuMGqHj936q06GRHjz8a775DwEvu60oU5EBIh52deCE7gn
	S3xF6/MC6ZukNEzzgpVRfuiUgkOCo875XaTVenzq9s6AnuxAsObfvqx5XeFc4X0l53Sx/g1FJOP
	aREzD/qpWcWXtM2n1c1JeyOMGBM1W1B1Ntaw1xonU9GPlevsXolbbcfrpgrbfXZioAmxaetHylq
	iRjf19AvDcsl/fzE96kUzMK2C1SEhpL+PTr0vbbadcwZ7ZUTiDeX4=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr21703631eec.0.1791812984668; Mon, 12 Oct 2026
 06:49:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007-binder-consolidate-txn-prints-v1-0-c1032ed3221f@google.com>
 <20261007-binder-consolidate-txn-prints-v1-1-c1032ed3221f@google.com>
In-Reply-To: <20261007-binder-consolidate-txn-prints-v1-1-c1032ed3221f@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 15:49:29 +0200
X-Gm-Features: AclHuK9FlJBQxWuBg5ggpSstOEqtRu7wPHdBjMSfhvAc0OWk2l4KtMGqxb3on2M
Message-ID: <CANiq72mk9x4Uxzx5+TCoWi4omZ1RjzrBNHpNx-wUVEdk4bZfVw@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: error: implement ZeroableOption for Error
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 4:33=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> Rust Binder wants to store an Option<Error> in TransactionInfo, which
> derives Zeroable. Implement ZeroableOption for Error so that
> Option<Error> implements Zeroable.
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

If this goes through Binder:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, if it is not going through there, I can pick it up.

The `// SAFETY` comment could be a bit more verbose, like the one you
have in `drivers/android/binder/error.rs`, e.g.

    // SAFETY: `Error` is `repr(transparent)` over `NonZeroI32`, which
is part of the option layout
    // optimization guarantee, so all zeroes is a valid representation
for `None`.

Thanks!

Cheers,
Miguel

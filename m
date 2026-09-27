Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD4635957
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790467731; cv=pass; b=IVTtjATp6AjQzXYZvCVMLxmM0u/Han+VqgQqryv8HDsyX5EAntqaDIqkfWd8x9riKbEtyF4CegMFDntfVUHnowbax0UsS+rU/fRfW8dGWip0Mlj0I+j/MsjpxOuBBUzt+t3sKOJift5EK/xCnQYs6CeRq+19FnV7fphnkzmnQSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790467731; c=relaxed/simple;
	bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TluOt7OfAGvaA5tpBOpKSGaa/fmyhvuNTPksp8TFNp42VTyNQ+n+S7KDvBSn0TqEKKEKQPNrlCqTiT7nxKwKIDxbkkgSsSrHQuDst4enB7iMQXTZV/L6Pd3F3IpW1cAz7wEDtAcTPoPD6OGO+TbfO6kNmi3ZBinb3Ly7vd1oS+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mk5GbeOC; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mk5GbeOC"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso149266eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 17:08:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790467729; cv=none;
        d=google.com; s=arc-20260327;
        b=T/+tMVXjEXWYlQ9IwZ601PN3Ujd24DJPvr6NusQE4UrhVUVQZv532xk4iEop+/jfTY
         eDBvkOj7yazD6qKM8LN22yKeTUFXIs+sfrAqyAJr/fZm1cVFsGmWEJSq+wkD70UaRBXH
         5DfUiKFvCBfZaIJ5L/UB8AVw8f34M2BaRDe95wwCpHWh8Eq7U5FRavyZDiVnddgfvClm
         lLSnxfkrxbBcV4QFGka0JR6I1zinaVqzEk8v9pBFXl32O/g1HRkgcxHXrucP0XgSH+bo
         YQjERngOahjn5sTDWG2IZOF8/UaAHCA5TZGjsgEeqT2yHNPyx2izBPlvQjngoNFfw8e0
         xZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
        fh=ClVd4FqG15tf6qjvTGZlnLYHhgbxSxWJKbSQVFZG/Vg=;
        b=IIAcE1wNgBMCXlNU0uEfzHi374JBLkzh0F29sNGv/oXHXD5J6iH/ojLpp6fMfcsCCL
         QXl0OuQfiv0ZUGCx9pkQYkn40U3SC/ot8/4KSnpYWkCLr77lEMQyMba2XqJkljdYtGPk
         TnOl31dSvw4+5cY/3U4bwOSx9ssSda5q2YzljbBiAafsaPVzwfUXSekiMhpQZRfglOOB
         H5Q2Xc3T3RqUMf5Mwy7gZWLMen9LlzKL4EdABQMQcP4rb6YrhRBuapx1tdatAzrhFONd
         +UMMqv6INc5uMicUPuag1BNU6iIlmV5ug1RK6ZlpX6+davOmlAsfNfeaGHy4v9ggXxUK
         zn2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790467729; x=1791072529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
        b=Mk5GbeOC+xAjcUNY+gWlo+HqMyIE/colZ8PwMXiqdJvTZKfM58bPGjFk9bT4i5esx8
         xLUJ43iKPYyGXB+iLOIIMTEtDZJ0M2merNZKVAgh7Q0CCW/oCGYnkijTWWfipM1HJK4g
         2e/nM1R9tDG9Jqg9Rnr/AXArtVBQ6/PAeHGPx3c5+fcFLw+UijHYI2/7m7OSuS7p0rob
         oRy1VU4ua8s0E+C1r9rNOryMIMHd9glHqQl4ZUkmgT4PFJs4tNcIOravw2dogA/2up6n
         K8munHfST2CLVsrgmC4CutcQipN2gqbvmPSBSXkXiAhgk++9q6rWFXAaqFQIuyFF2HQk
         UjcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790467729; x=1791072529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xn5PZ6iiiFBX0SCeMBxmphmVE7WTRrTX9RR4bP5Nfho=;
        b=26hjQ5XgU7dbWknHARGgK8IwQNDrDhEls3BkKXzwAQvywehjbSweCSoj3I1wBv5hnX
         qK+ToZco6I5TAqM8FAp/bFkvZ4x6j9IfILC8xQ6qScOH4211egTrQV5qFn3TatF8OJBb
         c2+yZxlBZ9gPNdEWZTHMbThjmHuGtgHHG8o4N3UO8lLIOwK40763iB/7e3/g54XEnxRM
         41kh7z0GdETzWZZPO2Qxx41CM0mPQUzsVQgO1uc584kQ5cOV4LkgPfgjPrYB+ASh9Cze
         7VAap8G5PEgHqYYQAHtrno0ssND4ESHD/Pb/lPyU1wYUSyEBTDi7CfKu6Hwky13b8yeL
         jpVw==
X-Forwarded-Encrypted: i=1; AKwUvBw6qoiI32wgp/JS8OTHOW2Uz1ReAxugl7v9poRH6pDzqSxx5mx1ZnWzetQ/DAunT+nzbtw47xG6FkZtoOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7vBzBwVCYuj6BZsazVqdAVsuL1w/MwLXAYzhkopdMT4PUqPyj
	9JDot5F6oUOEXHlu6erZWdBVet9LE+HaVcZSdlJGyWkZt0ULr3f7KW3yrgvB0uy3cI2xEDiuZnq
	To5WQ4V/1QRvTpWibQZD0236aBP1mKbo=
X-Gm-Gg: AYBFou0OADCvbN+OM2ooEgZzfgystj+1riFEOlJ2+iEYNut4cpQusOBLCSJyCAxsy0L
	liciqViPQUTrAvg5Bi1ofrJqNAnDmGeHonQvgSF+E+0Yv6Ax7CTulrAS9pDik1DTFxQqS8Ic+f+
	GPZ59KNMhYHm5kzVa4BITZfOv76Jnat05iNlFa9l3WLgi+J7aaks2QCddO/szVZKOdtSssTwyhK
	EYX/bxrDcFAUY0CdZFB8ZJJ/iyD0fVxwMsUVeQ4aCEKhJBVdIOBnKm+sD8UHf89CWf38i2r2Zrh
	7lVjaGxwCoNPSpyKMfTmW50Mp7tOdFp16bmUMGLbqf7Xrk14QpOk4XxNi1ZIr/siJ3kQAoBAkOH
	6CCSkFiieXsFMdQAkVcbL0nVoUvJp6M+Mo/X6YWC+ez1NtD5tPgKWVSKJL4x4rvXnC27VEEltTY
	ZnQnTu5Vxd5ttVELrPyNpGA0ob4amSvaXDJhBMb1wHydIX0i2eS+w=
X-Received: by 2002:a05:693c:4099:b0:33b:ee8a:2061 with SMTP id
 5a478bee46e88-3427169bcc5mr8229144eec.1.1790467729056; Sat, 26 Sep 2026
 17:08:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-b4-gpu_info_intobytes-v3-0-e19bcb71980d@collabora.com>
 <20260925-b4-gpu_info_intobytes-v3-1-e19bcb71980d@collabora.com>
 <DLPD8RQKM8VU.3QWOV9RFLA8S6@garyguo.net> <DLPE0D8F96DE.91C7E0MAERDS@kernel.org>
 <DLPJT1IUSKQO.1CAWHDECQAFPO@garyguo.net> <DLPKN532X7JJ.14Z51ZIBUIK94@kernel.org>
 <DLPNFF0JNNOQ.14JE7RL8LT79Q@garyguo.net>
In-Reply-To: <DLPNFF0JNNOQ.14JE7RL8LT79Q@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 27 Sep 2026 02:08:36 +0200
X-Gm-Features: AclHuK85J-R98H_gMYqDRew3PEoe-FlnfCLidl5BzuhsD9_CB8w0JZU5OM3YYg8
Message-ID: <CANiq72kvkAWmJEgOathMVwuXFzUURK1dVN=OWmczykVWpSTv6A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] rust: uapi: add zerocopy/zerocopy_derive
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Deborah Brouwer <deborah.brouwer@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 1:49=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I think the skip-on-error default was added in a version newer than what =
we've
> vendored.

I was going to update, so that shouldn't be a big problem.

Cheers,
Miguel

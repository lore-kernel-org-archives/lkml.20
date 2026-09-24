Received: from mail-oi2-f34.google.com (mail-oi2-f34.google.com [74.125.231.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2E14AA41D
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.226
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790265992; cv=pass; b=I0bsHfkixxpxpHYutjM4u2B9DIB75NTiDmcrjx0MyEJ4qsBOoCeGAVd5iC6YrqfBlag5pOSbVm2i+GjZExtC9ibjqjMIAgOviW/wrdfn1aUFterWG2wQ8x4+x1fqDPpAvDQbTiE9W4NfYBVnm6YkMh/SB/sOdiHTtQYjclG8zKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790265992; c=relaxed/simple;
	bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bG9evnW6F8Q4X+cFFJz7TIkSKH56zpkrwPBPpfUSjp27/8wNYXtXDfaf2TJhKXGtR9jU9/GImxK2dGknoe5icFuGl8xlGARFeJsFVZGD++4AZDNsHI+IzQkr60Gt4kWIF2YEWbv064zEBYZmz9aWLRPFrWKyKs74wR92om7qSE8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lO48X/LT; arc=pass smtp.client-ip=74.125.231.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lO48X/LT"
Received: by mail-oi2-f34.google.com with SMTP id 46e09a7af769-7f4f0dd5507so1072322a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790265989; cv=none;
        d=google.com; s=arc-20260327;
        b=M1SZgU93cfEcGxVdXicj1G5TCgILuIzZ00ssYyPuWdvtex+CsBxxGp/5moBznCFTQt
         iugeXTWTYHXoZ8AJ2o5AkxtBB6q5tpA2d+cuY0uUXXApb+R/i3mh6awAz8jrUq5iqzzz
         sjVovZtCFW36/PPPSpiTi24lCD0UmbQMHwHWMQrtX3UKtdzEzFyr6a/C0BzfhriYKnMu
         TYxlGyy1XkmYcgRK23c3QhAYWiJSeCvccDIJ90ndoO2RCKevNT1I2XMypvpMPiT7WcA5
         C4/d6T2l1gtjCeFMxi22NCY8o/W0eYzCgoOqpQvXwdsKAVVcqwpBQfVoHnndM+G220vY
         XV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
        fh=N++seIN8rqpMnTEulg7ebjGKf91irR51Zm2bXWHulJc=;
        b=emlHdkpQU01qkTugO00gjE3zT46ntRFT0zS9kxnMAIZ/4NgiLRIJLktlfqxuc0q+ea
         8R/zv591yOzW3/wd+yxGdaBWwIE6m4JT0lC72dTU32ZHVd+NOe7Vl8k2qKGwRWvP2K2g
         GrjobiS4w+VxJJS8C/trg0H8FjBBMB2EP2M4nNaH1d0LgBq+bvOA8gpJUiXJJ7V/ujYr
         RaCDDn2akAdwQ8+O8aikZqoGj6AsNSIJc/5FcF2/pkDufc0kOG/lsSIVh9h0nwsZmcay
         fHcOZ8G9/GchA4kGPgqtTF+nn/cIokuJNx6JNPCT+wgeSdldOAU2H49OCn6rgFBVy/Un
         J0mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790265989; x=1790870789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
        b=lO48X/LT9dqCaMQDc1j6i+bWX1ERyN4cgsOxZb01EAFQT7lJvIgxoE6mvSlKj257Nf
         qeM7PP5RtKA0hBoc7oqXzpIFoMlEanm+PGG+Ny1S4LqpvXWa6emxuvUBIr886XUW5IXa
         Limf76gud0UEroF/+cpsKrbYnXF9j57Ugw22XU6OIspFZvrrtJVShEpqrImoumEfJxs7
         UOmE3XoqQEEDeldjagGFPenIWf64el1QpbBRTkcozaFDkXx5RqW4OuQIUAf0TZSxSD57
         RwSoY4jroYCQ7vooDkvz7qOeeqdRylE0lLvERLbTkGDvY5bjd8OEBsEPTbr/U+kpZxs5
         n8iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265989; x=1790870789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s87PL5rrwrP1hfiGb5q93550+Hv8VMpEJj1mpIiTKCg=;
        b=rOnbyHhyg8Si3bBIpibvbqO1jxWzzr1TguoEfGwriuM4WMzOCsAx+9/Px37Bfi1nvX
         9BLzokldvigNfWFn4sHAZl9ZuX8Bt7XR/wb+sJ1Sp+AAeIgRAhq2ugwmg2JdDLeOCTi6
         trQJvYpFw3fod3BI5P/flBMw3xB3eDSMLTCUrfkWxbxQKJZ3y2vV1D1oWyPG4pAnbPU3
         jTEgmm9wigdQphqLCMONX9355yxJZ0wQoEUjwTGonVrCocr3a1Kt0opnUR3JcDF00k3m
         zRVRNwhd9KMHTtOFnph0ttkuiFUIcfLRI/5nlg3ldwcnWS21lR3stfZp3c3JdGZkMB4d
         gGCA==
X-Forwarded-Encrypted: i=1; AKwUvByrTd3vVnRpTIhvpMzukMBQ1P+zk4fJa6rqCyxcRN8C0L2Y4BvXHR6C5FQXL8/9DymttEZKe7RXWMwfA1I=@vger.kernel.org
X-Gm-Message-State: AFuF++lrPnS17HpDChuaa7P8aVT0HKdLqfEZq13pO1GWVknJVAOgoPGX
	tJvqpkdi6CJ6gHU51814/iCgFlaUuCvPsQl9JzA/cUHUIBcvnZ7YuS5g2Eya4PS6u/mngZc1KTb
	EHoWQ/34dV8c85ur+cONhgIpQvaun0AQ=
X-Gm-Gg: AYBFou2tMHWAtd4PQ7/CP4IimqSyXvmIJmX4yZn5izKNGICOwp4bsyDo4X2TXMPCivf
	0A0Ur8wIBEJZJ/X7h0PDZEWqgC+GhC17afksenaCvpfirZahQwN5qlzq3R5ZpAx5cliZnPb3MeQ
	4/l72BF8L0Fsilck9bw5C0G8xc3IN5iBzI6zuSeyMxKH9DtPSEsYhtvkajg4G467+9tu8JTk5ui
	kt0fviGGPAd5qPINFTXglt3Wj7u+tmXWTaa83e4kZhV1sIIgkxPKXn9huR6KqJrVmoUPScst9nT
	qVgusnBj4bLn4mozVE3mqMwwnbpUDEz/FKFh3jpVAC1iOgZ3qpHXSW0exYq5nRNwvzFuDb0LTyJ
	hCp+T6/jkmOXv
X-Received: by 2002:a05:6808:5395:b0:4b9:e5fa:8a11 with SMTP id
 5614622812f47-4d728f2aabbmr2804188b6e.22.1790265989379; Thu, 24 Sep 2026
 09:06:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923022339.3340694-1-georgeandrout13@gmail.com> <arThye_219ruNbM2@google.com>
In-Reply-To: <arThye_219ruNbM2@google.com>
From: Georgios Androutsopoulos <georgeandrout13@gmail.com>
Date: Thu, 24 Sep 2026 12:06:18 -0400
X-Gm-Features: AclHuK-lOEBKK9dYOS2UY00MWakjMDOvzU7dNK00ORx8tBpC4tNpOn47rwDC-Po
Message-ID: <CAESH5ocJR9SLHcYfusixDmOR-CLce=HTpLxFU7zVQZFPtD9uuA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: file: handle fd table teardown in file
 descriptor APIs
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Jan Kara <jack@suse.cz>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 4:39=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
> This looks like it should ideally be on the C side instead.

I could move the `NULL` checks into the C helpers in `fs/file.c` that
currently dereference `current->files`. Since this would move the fix
into the VFS code, would it be okay to send this as v3 of this patch?

Best,
George

Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41FB468C36
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050472; cv=pass; b=aOvvNQnkjNc3F7ACWTVh0BoypxBEuwK4Vnl8mSjoTnPcdbJSH8GjsZONDe9pkyHt9BJmH5ZtNglzaesx/NwihdUPGFoM6SJGto/x22qrE+gpC+m5lHAc/+gTCBNLLUIYaW6X5LsC5/7KasUT/Zcf0lUAJTq/UnCcYErRT0xnV9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050472; c=relaxed/simple;
	bh=qrhbYvBNv/N0VI8PEYpw8zABc5tgbspPTRKzj2j/IcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiRu1LIuyL5dZ460HVE4EjCRvoVzMElrlBfLjOVctVyMgNfPmbyq2Va2jTFywV7NzSyXrzy7IaGG4RWpo9MJvX9YFOT5V7z/vC3nu0SzR2TXNxeTPYm9DTIX9epU+wzy5p8EcCHrTrMq3mJz3lWzamx371UtKyJCW2hEsPQpb4U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DP1Cwo5m; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DP1Cwo5m"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35f0b0fd6b3so4145eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:47:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792050468; cv=none;
        d=google.com; s=arc-20260327;
        b=EwDc8G7BGL1xK7vaBq9wbq3Dmm5g9flo41Nr9Y12hpLO2zMJWlRlpFoQV0z4fT8aj1
         AOPP6uieocyE97QQf3jiY5EZGIcrBt9tGbVYc6VpJFEptT9L4DrT+plPgnVg+msUSLR8
         RNxrt8NuSAg7xp98SSP44WvvA+jMBxLn8YHS8n1iXZ4vuvqt57tA0YfhNUvtYIpYnG31
         LMPrstt2mzteznIUhwf7pnOFzMGRHRt4mYO1QtEBxl8eEreT1WAhuYP7HtvZw7ZAxkmJ
         /GT1/zWG985BOJVqgXYNsCBkG1Wo1J6CxtGIzFJaYgvjg97oeJ7yyFZIVW90xUQPYYa0
         JniA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aZLy1FDhAffyNHLdSNSc3Bq3qLESgLIT723DgtaMR+Q=;
        fh=/2804wB0GZIQb7SyJy0647bhbsGKHt7Ilf4ovQRd07M=;
        b=g5NQcqHGSPD9y5OgNY8Tx9pvlw6/dZ9bv75e1abFjvSflH4/LPfINON2wk/8NnHJKw
         Mtbva3tEjZgjOsTiptK8GQ0WkM3e4QJCe4EK45ENMqFK1/aUU8vOEFyhVxPdBR08WhPR
         jIxdJM266wArGRziigWzNfkgoF1PSG/UdlaDrG2e2U806g/ALclf98BBTRRMwYFlIbW3
         EVl7OKtP3YeeKfoLjtGSIvikPXOlHbPclma/clfBJta2v04u+CT/jbV6Pi+ZzDnBtBJ+
         xfhb/vtJmipXMnfqsIcJ8K2EVdob/XisOQMChrdiX56khJUEZ5XNlTWr8Xdur5/dOUd6
         S2SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050468; x=1792655268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZLy1FDhAffyNHLdSNSc3Bq3qLESgLIT723DgtaMR+Q=;
        b=DP1Cwo5m/G00Qr36FrXInztSqahs9iMMaMxcJ/hFcP/20kNJe1kQqR6npnz101hC7q
         rYCdDkfMUQtRBnrzHGBICeicqiUxrC4xZnALWEt9IPH4/3PwfLSPtGtbr3gr7gd3iFBp
         NyF1Cjs7VZki2xIGfCUzMqsaJHX+xtxdg/vlqTehw2ZLOBKx0g9Tq/sgxWija7I2UoJh
         5tzlBmM6Z5MGtPKDl5+PVZltvINZbU6t5noxgKfgjE/cF2Djt7Q/tru3JTmDBljIsY5R
         k9nmP3lcjHHYX3x5OEw/Rh16SPIOpTQEcHrJJRIzvp+H8XrlBpC7KG/Ny0+NgDcohfCI
         nmvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050468; x=1792655268;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZLy1FDhAffyNHLdSNSc3Bq3qLESgLIT723DgtaMR+Q=;
        b=FbijwT7uFaGOciE7kyik88RO1JRafJPCaYzQHheC+RSoagMhNuT80vLYLJ3tzv6fS0
         DmRlF5gXspWWxKkWEmYNI7y9L7LB93+pPpKn100BOQ4TiIxxULuVZcoSbRKEtZZmXvjZ
         qrYkGmPL5AnRHkXiGgQM2eRqWArcXLEyDkQFzPKtoxPMOFtF2HhKH6JNIyCDKzytZmwN
         ysZ0pA9KfW7r8LrcGtP5CBl/iqv+1yM1YCOI4d7xlE1lNIletPojztBOEcBOeoNtXCWJ
         qYHvPtKcAdCmDcKYoJoYPPt9yK+chRo3dmSm7wmUTHX70qwrQpYPvT88GRJnkaVTUIyz
         KphQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8AMbSvw4Ti7L94crFUgzgKH2fDvptqS+poPLuDI7jxX5XcIcJ9dJqs0eosxtKlqDzDg5VHTQJPxdAl00=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8mWc1nKlXgylpk6PKzfI0TTf4elClZTcOSN2ufbgznfdQfXkz
	uvdjfh5knJpC0UOjEd0xMBi3UsZjA8Flw1B03eS+2YMLqijQSr5HLqVNmboi1oyCMUCkBTnGn/Y
	u6w6g3/fhqgptgjx/Kboj7nuCtxzPz7Q=
X-Gm-Gg: AYBFou2zyFoSysq4ZNPo1sQcrkRJ/YSnrdXXhnKdXkB+nJsHLlM+rVi1NdmUhaC266B
	ByGsJ7sx+9bZgy+987rAun7gfXHEtyu8wp+zucTtue2MNAJgFzCN/33/2WiMCZps7jUdgeZafEh
	tmWiNsIL/eBMO3bVLwH6/rLUq0TUgyp+YQahYSii0FXAeekLLKcGeEdC7TSfL0iUplWsnfPIZmB
	jK+3rsClV5YAiX6VISwFYr8llNxElDKNrLZDiZntdUQ4ufTCjuQ0fejsk2nWvKpgTv61Ia5NZQA
	76GeMvWkWooMpEA6LM/ZzBu6lSFuTkU97YJGgpa0w/rZ0dLr6QxSu/ZMD3V2g6v/ruxPo3nfcyQ
	BnrsDTVtpkDQbXPfuKp6iBv3xB7NibWLaI7NZVujk6dlS+FIt7z8xz99ocKFDUKhW0Wc7Ru0hNy
	3pZQskvZH9UsJEvMqNAMhk9y7Gl0cge5xdgNgV2LYe9fz+uXRiNnM=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr38650196eec.0.1792050467352; Thu, 15 Oct 2026
 00:47:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh> <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
 <C46E97AC-3722-4264-B541-04EBC3091E00@kernel.org> <2026101532-fantastic-deafness-e04c@gregkh>
In-Reply-To: <2026101532-fantastic-deafness-e04c@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 15 Oct 2026 09:47:34 +0200
X-Gm-Features: AclHuK8JUch3-LLJNkG2OM0JVExMlV2wP7uKNynE1Z6fAhzs1hBzwjLh_wcCofk
Message-ID: <CANiq72=wS5NJyeKKaYiHKWhDq2Wjk728qkCUNq4xVoHrPEPCRw@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Greg KH <greg@kroah.com>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 9:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> __must_init might be smaller?

That sounds fine too. I like that it says that something *has* to be
done (like the original name did). Hmm... On the other hand, I guess
"must" could sound like one has to initialize the field "somehow",
i.e. writing:

  struct S s =3D {};

definitely initializes it, yet the compiler would warn. Would
"explicit" hint a bit more at the fact that one has to actually
"write" the field, even if it may have been initialized anyway?

(Of course, if one knows that the attribute only applies to fields,
then it doesn't make much of a difference)

Cheers,
Miguel

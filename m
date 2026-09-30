Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07274D7D48
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771968; cv=pass; b=vDfijex3dYoj0lNuJm0yZSd2cNlNzmONy+m1vEpGJ0iCM9niKt2uyn4HI1DtXuyhhb1pI3r9nHUm+Np04V3zGjEWE617cAP6Ceok38sHPeoRA8oR8dPM3ynNpRzvRiB2i22mjv7psvJxbN931rlX7IWwuXVl3pwuDvlIngjscxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771968; c=relaxed/simple;
	bh=ggOnnSaPhdsj86dUOseU8Y9Ysz5RAaEBNsyAS28L3WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E4rWAymvfSEGVl7e2oKgSQLW4FvVzndOeRe1uIw0vNZNWcSY4O3Bv1yQvgNC1ljyY8tQkVYYBiWUONLySZkRd1kUjDdhI3ke/H6+fEmpR6HHb+cOwXZxKSBYX7n5fQ2K5miggV6iaw8WVc9axjXkTLN5V+PiJqDUOx8EwlqoF5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6G5O46o; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6G5O46o"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so150614c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:39:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790771963; cv=none;
        d=google.com; s=arc-20260327;
        b=rMx5Mn+OGxHYRipHfDS3qKHuomx/ZV8FzIMJSt7Eq7A6uqXH72wd0A6Ezr2ry4uyQ7
         OB15LdNAZfcJ0iX0cG1KJondu0C4gIUgja5UOSqSfnAekFh1wkhCUp0Ka60t6tJEcMEu
         EBWKrKG96vrREqvP8g/xrMVHL71C/uvESRE0BciM7AG81GULhmRYBjSWFsfvMT9RSRBz
         +5u5W6afmWmLjfUHr9SwVES2OOzBFBCyXSbkWcC0R/nMMG4MwDbv3iwgBwLTQgr7FNi/
         rgWK4g5KygQj5D851tyueI8ut+MXN4Wf0SEDQ3hS0xjm4I7XNBDLU7LyTbzEvChp4JzL
         xtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ufPsRVmbq2iTAMU5/0hWY230+5/O8NUpBJI9AxEx5Fk=;
        fh=rMJVVpT4ChsvYiz/hRFLiXm60sUyMbnG8lK8zc9ZjBU=;
        b=be8YJmEtVNEmDhqVXOIbBqov7fFa7TIG2gRDBC8zgU/KFulaYhaxJrE90B3vYgp23Y
         6Eaz6Uv9PV3ICUUVBCGnfGUL6vWiaGWS9VdpUifGEXz3uJ6IqK0XSwL6tVZ55wpBC/yX
         W5LcZWveMGFfwPKWodrM5OvYStkBcQ5Gt0/wrJWLu/oA0qHgqRzeI4t2PGhMDdnpCkw0
         UpqUDuM/YMWeYvdpi3Vvpkp7XRZYV7XcM2vgGHZSfU6O/woq6pc658u9ccUOEPJjGqWw
         1WIULvt+imSPwYgCtPttgSx8Vcbd6Foq03XdCVMWHJwgfGOY2+Y0M4uCvhdc0mpkKIhr
         oGsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790771963; x=1791376763; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ufPsRVmbq2iTAMU5/0hWY230+5/O8NUpBJI9AxEx5Fk=;
        b=T6G5O46oSkBqmbG75j8aJ4uRWWLkolcFHWvLDQp+WQ3tcKamK22O5VQxwJugk7nYJC
         diLNJtBV9wnZ1546EJQVHc9dEfduhHFVEIPS2SiXEaNC0VQWCFapLk6Gj9YGRvvd7lUb
         FGwNqZwPg1/ph1EL9Aijm42+7sngB56d5HUmvIDeLeq/iLE2yzbNGZ+w0f+F9ps/iBgq
         k7eQmbdfriiNKlb5+8YdGicPoWs+qyXJ/0kF1CXz2yJDGMh2GYAzocr2uhZN71ScQDAj
         Vgccrq3+6BqeJ+Q4rACGr73MddrNUHSsqAfApSv8CdTB9gAZxyBHvMrbhGjQVQePEqYe
         cFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790771963; x=1791376763;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ufPsRVmbq2iTAMU5/0hWY230+5/O8NUpBJI9AxEx5Fk=;
        b=LejlY86ys5oNrQkKyuY0scTJVDW2lrlZ12Pq9BmpQVygKkUGNuKVByFlLdJMu7dsao
         m3+4bTymk17/ayzuYAaBlvMZ4EyQ1GMZnCkCEngHA4yRZp2eOTfjlK6NItFPZQC6d4CW
         ty6W5/DZy8KWbT2vr5tuz/vmruzZI8uHkZzsc79rCM+lJkiK8HTphMJb+Oh81aTEgJ9a
         rXPrqeC+3R4+gzkevKMNG1jDBNLmE8K0lZDHYax19l1dA4YS5P05XsLrAyw4XYPQvlzQ
         +1U66JGKCTc3FthgoNhC43/RjJSfKG/BQigp3UKYD1ZOF5lso3rwwcowzgce+iJaMPq9
         Y/+A==
X-Forwarded-Encrypted: i=1; AKwUvBwVVVrTjfA7+hf3KEZ+AOcjdW0ZHf9Z+i8sExgpeEpgKDjg89YRHLDoOOaiYzXNcZU5hHd8BVOczJIeA7Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJd25lIIOBTk+CGFs9lhACUB35vzry+Z3Ud8kWApqk424eOKfDt
	EvsODUwjAhzSVQ43VXuMiTkbgly7HaS++xe7JFPu0I6u0U9c7ngTb8mdX3qGSqlA/OI9JkRo8V/
	pHmO6UUKU3QUqrIaIHITLpWGOV45F6YM=
X-Gm-Gg: AYBFou2XqDaO9M+5sCMPiXraXhwZMD9nL/FyN7iwZ31eTxqddsVwpUvjfYawvRHsf82
	ok/VXr8rewBoT1U8erfBj8p5DcV7VKfeer15ZRCfnYZMXrtlKD5kw7xcwYLUN5OkL7yEn7vymnm
	y/aVg9dIsY+epW/dc4C4fKp2mGXLmc56s6zzo8mzZlAiDBodGmtPsTrC4k0EK9wbr8aBSzEW02O
	gp6i3plBCW/97zyGTXeRNRlfCSiEOsXU9Cv0jOm7Jsv40/uts9NjGOVO6Ftaaw/hUGvA0Dv+M4J
	tBMM5UkJuPOVnxr0wHPsh7w1KLKgPt5o66yBDYLNnNfKwAdLNwuErM0pMyBdrZBq+rS9YnNWPnN
	it/m9lvIdMqepnMSwyQbjDQbjt4bEbHfHs5wHJwKv/ILDklrk1ZKIzoH+KTimza7tFs1+1Z0nQ1
	hDR4jdmh9G0JigB5uXVMUGVE2l1x2f5UxYerOVPEo8hfgRm38iVPs=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr2898570eec.1.1790771962989; Wed, 30 Sep 2026
 05:39:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
In-Reply-To: <20260113192949.689834-1-lorenzo.stoakes@oracle.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 14:39:09 +0200
X-Gm-Features: AclHuK-Sjsrg_okIPMKenwQ4dypX-VxuVqb8A4w8gwXJEEOTFm7LvkAnn343C9Y
Message-ID: <CANiq72nHOinPTuJ7NLP=X5tLN76uxzz0k5t4tTcU+pz_JOCPHw@mail.gmail.com>
Subject: Re: [PATCH] rust: fix typo in bindings
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Chris Mason <clm@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 8:30=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> Commit 2b6a3f061f11 ("mm: declare VMA flags by bit") added a number of
> overrides to the rust bindings helper as the change performed in the comm=
it
> caused the rust binder to not be able to automatically determine values o=
f
> VMA flags.
>
> However a typo was introduced leaving VM_MAYSHARE to be incorrectly
> interpreted as VM_MAYEXEC in rust code. This patch fixes the typo.
>
> Fixes: 2b6a3f061f11 ("mm: declare VMA flags by bit")
> Reported-by: Chris Mason <clm@meta.com>
> Closes: https://lore.kernel.org/all/20260113185142.254821-1-clm@meta.com/
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Applied to `rust-next` since it doesn't seem urgent, thanks.

    [ Reworded to improve title and to fix typo. - Miguel ]

We also have a similar typo in the `bindgen` flags -- just sent a
patch to go on top of this one:

  https://lore.kernel.org/rust-for-linux/20260930123645.302318-1-ojeda@kern=
el.org/

Cheers,
Miguel

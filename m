Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263743;
	b=w32XwPA8y1spjOAKY32tesbTfQ71YmDT1yqIW2SlkpMlm8j+FX+6sJiMckaxdir5XIDZ
	 Ra1B77uWaAfIwy6eISTO3PRIjRgxNtaJ6lZsPk3OgK1boifNlM5eY8z3WCQ/v6+rKr6IF
	 NimTVe7Kk8r9wVf6qfqKP4MzQFheQMatBcILD5OFus1nWeNVBfYFSrlQN9KRYfvlXl1R0
	 bIKFR/BTkxpm5jaJs1kwvrxiBMeU21V97hVhQqaGIBOw9M4puPUXzrl8iIXX9/pbPBrCL
	 Ul2pJ48q0XexZQ+QKq7qWEduRRqQEvHC9IojqrxnESxMvVP7rgR3IbcsaVfIiNFg9dA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
	b=k0Y7QC3d1L7O5Xws1iexr6EO9iYRdeLwg+uWwrLV1reehTOJ91/ekXcYpvUXrdkcMslB
	 H2AL134/ShSHt/ndMm1wPKOqdXRSSIqAjXjIyn3HM9U1UvnehQwygcN7OP9k7TwI6Qrc6
	 IZ1c9r7M2B+mGo5szTH7fOBlo03/+/6jL39/FUWBUKnd1BPK9E6Y4cGcdZeEx6TclA8qi
	 F/WHGVv22PA+PppetwH/Cwv4Dea38MZJcm+y4HTbI+tVm/PV9nVMU4VLZ10XjhR/2KtM2
	 P1pqctU/XCdCG1CmB25kkwBihY7zwWnz8hTJxQtB9/hiOdnWFqCtQRzKl8tDllsaQCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="Z7315H/0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0D3606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:35:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C0D3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7315H/0
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so12126325e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:35:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794263741; cv=none;
        d=google.com; s=arc-20260327;
        b=bXLhKDaZbKlDa0I78NY3ZJzSl/qry5YCJk+ltCU0F/L+IxsPuxnMx5KpYxEBIEPkjp
         jG3IoFtXgpKyQ3c/+R+VyBcj+f8xZwKHPkEGhO8d/NCmmp4odS+0hvbVZnhR42d6q2ty
         9pOo1xC2ZArR/0t8q6Y5YHJHpZTP7okNMc8ktdJtG4+O6XAiKiSq1HAumh3+9zMTTeWl
         32TNyq7qPHWKmlB8z3FZpPssUMJqtkmxI/UMQdmHQHlAA8qQoSfojiReTJa6kKLctkGn
         gpAl3t9q0Yd4snxYrOGHEIKD/Z8yeavQYNI4oM8rIkA7Z73n0DA0Pa44DzWgCIVHVcHa
         Hgew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
        fh=oV8WN1ro8BURwl27J4u8rxcd8PJue4bn0yg61wdWRSI=;
        b=RazeG+F44c35p4QdulUhNfp9f26A7qCMplA5azVQ7s6g+XKvjSzzIgpWa6uV6c9XKA
         AmexArdCudClIstmKcxjcNE7zWo1LlepnU7NDKVdUCtU+nEN1hwfXzzw97aEcDHOlinu
         fYSEx94Mm3cXYNYFV6Fxm6zWw+upqeC+kRVHETcJQ4+fNPaUAZnuB3vyBOL+vdP1cZ4D
         TcYuEubdoIGQEzedEj3nuoHUf0o8rViNs39mvHO8H8y7C/8Y/RiegcE33rjQSGXRGS3+
         LcAshHIwNZqRWJnG2uTvzlk5sC3QhoIGgcHzouuS/vN8JTeOxfGU20QRc72yuVhB+baU
         rLQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794263741; x=1794868541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
        b=Z7315H/0Km2zQ3FDV2EWUJecKwbasT7mET/f/fQWy52qEG6qLZEU4wXcIoefS7eXiK
         HD37CyfID9UFs/yfH/wPemBpx8nSR8Kvl3Jv+p+8M0sKB5ilsJiPyn85T7Dzh6InFzEn
         JvL9TaS8vmRS3+Li8h8GjaFgnbIfsjRux1FyDrGqvCGTYsEHRhDe48zoZ+fy3nzdgeK/
         nmmw0XWftfSBjn8HHqRhsuXAVR4OSoNAvsGLs2byQJcIOeGYE1ZuNSSzQIWFHpbCJVfi
         Q5GHkaHfL0vaTWa986Oo9p97SB7e6HBjCuP7ud7DUO2Dlazoh2yYhxtSJdYr2s6nQyNd
         lIdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794263741; x=1794868541;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=67p1G3+w9tarQfWyJ/zTAqZ1CBC4ltn0eogZwjXmF2A=;
        b=Y3k131CEjlQZ4ZK6dJ6Bb9CDiLkCtKcKz+m1lrSMgbeQfXj9lmrazgrzHsOTJP8qQO
         lyu7qaoCEcjwzm+FIWupxDf65YTiG3Nrr3zWfGEYyFDsR4TGPHOInfKMqz7JzgjTprhJ
         kBqsJUPDWmvkSI/GIX4ugnPr0DqysVN5PHG8DoZ0MV54kr4YqNINcN18YhdFpX0ck0l9
         AkG35dg89dw5vGlmZ/6eih+/6EWz8i1sbxGedhTwDopDG9X9O+bw2GNjJ2sBlBrfC7sN
         fcS9iEfy56Rs9/6C2yKWeqSJ/H25IhkFs4UFGJU4Z984hblzLDaIQdytjDe4Q8oXqJY2
         Desw==
X-Forwarded-Encrypted: i=1; AL+hErGLzacPRD1pzYynqJxcdnTBn9+SJLofEy6Wf0ZyuIg+qMwMcJoNSnUnE6GRbpQMCLZsUF9VCe2QhoHY7oE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SGW0YNOnJiOy7p5UIee0s2BKOPsMWRWrPukXl+sgKi3cdji9f
	h8N+SlrjZUqi5vYxS/HXxrbfxUvczge04kwHYsX/iST6F+/yyiukR2ghgWRgVYE16nVIm1pdPW6
	ZF4hKg0Nb/hulA8iZqa0zRVQKU9BM1r03hZpo+wlVNkTLyZWZ0vTs4p8+dE0=
X-Gm-Gg: AYBFou06svpS4V/DNJbj5g4D8bxt0b9jYL953bgOBF5EY5QmJDVWUB3jBSU5a6EDFsJ
	vdP2+/QFlt4N+E8ZygptgZ6DV7stz39Z/JYPqqdfzC3l1xJCLeaf0C4rJ6+9TYB9Wn+agMhaNWG
	KjK0Ad4auePhCrxCaLbBszraycnbjAyQWeZOcPW3emDZktfdEZe95vbMiqcJjCXi26gyJ19UUUr
	c9QLNgAS+a8MyTN6lpuzt4rmDu8LMQQ8pcojKD48hi51Y+qUrSKEG1FfU9S25JXr12mi9pDMRF0
	oo/gkLntx0W4JV5pcHabv3ktbDVYBcQvClrRTNgpJLwnBaKo9Yl7sPdg0+F3s1Do6TM0868zJiB
	7mZULjkRZMpP5DbW9wMJ9iufG+42dQ0DlZfsx1k2bVRoXCpcrG205Ap901YZwjG1EK1ztAYzRfp
	f2VfyczQ/P1JfARXw=
X-Received: by 2002:a05:600c:190e:b0:4a1:d97e:cd60 with SMTP id
 5b1f17b1804b1-4ba0234178dmr9170815e9.16.1794263741215; Mon, 09 Nov 2026
 14:35:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
 <18e61a8cb2ff887c.3137322e32332e3235332e313736.9d011.0000sendgmr@google.com>
In-Reply-To: <18e61a8cb2ff887c.3137322e32332e3235332e313736.9d011.0000sendgmr@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 9 Nov 2026 23:35:28 +0100
X-Gm-Features: AclHuK_aJUtfmZ40TE6V9dcFQ2Gw7esH26asDQKpi0oS6cQ6henkfr4bldL6-J0
Message-ID: <CAH5fLghTUOHcTAUC9_wqtP0xB18AWsca76xgptN9=wBx6mXUTQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust_binder: account for deferred work size in Thread::read()
To: Chris Wiseman <chriswiseman@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 4:11=E2=80=AFPM Chris Wiseman <chriswiseman@google.c=
om> wrote:
> +                    deferred_size =3D deferred_size.saturating_sub(work.=
size());

If deferred_size is zero, then this evaluates to zero. It'd be ideal
to avoid calling size() here since it's a dynamic call.

Alice

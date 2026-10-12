Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D0530ACF1
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781774; cv=pass; b=Z6aYhZseorRyaQ/qavzxQS0pghlXnIpS7rw/nORJAi7Lh/8kXtxtHda3Gwrgkr6wn5HbmG7ekwnfiruB/pbJDP6HZI789gRppxlOnuV1SpVGVEYf51q1O1wahVv42Yn7btYI9mFTUls+V9+jIqHujHT4xJtldOXngEnm6U0G2E8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781774; c=relaxed/simple;
	bh=7S/sjZ0z+yBZGs5Ta6UfTAs/YBp6b6ofkZEfI2Oj4jM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j+2YRp536rXXe3L8L+s/EsJ2dpshYQHWAY9iX3s5sLV1/pPK6Y/N3rLtSXrxCrbZX0OxmFKEC0KX/J+DhXXk1lXCpc1yGOa3KSDAySmX44LYz/fGJTofVSOKFtndOJ2/jvRc60t11YO9t8RCm8W7IxK0yJ2scIZiUSa1EJ0cmf0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bJ5mNG+G; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJ5mNG+G"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-34c522572bfso165295eec.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791781772; cv=none;
        d=google.com; s=arc-20260327;
        b=c//YjYAFSpgU0637p8IJZPCq1t+MFBc29VmFzvpCj6zBwtyD3yzB3DoNHxXlcaoYeN
         aYoOu7VswzaG0Dy8NI26NiI1KW98Wce+2J8obNoIlr2XoAqhZ5jUS/LWFiMnAiG0zcv6
         EUvu9mkiJhEUqFOUPymx+MVBVmfqoXCBMd4H+0NSQ1R2S41kZLrphmvyQ6cYEDs740mD
         qk1gQM8AJB+Wi92WCPcGEeGMBHyQQAIQg30tWjP8FnS8PLu0JixuJtJrfha8+2k+2cAM
         sHNfIe5DUb5owsIeDVAqt8lJx1l4RX2wZYU2ULarlTYBn5mx7bhXiBWAHWPYQ20ksbZn
         0rRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lLLLclL22w++ZhVf6oeIW0i9eibJmDwV660dbwM+rA=;
        fh=Jb0EYj/RXW3cWwW7TtNuwwFy2Hat/n/0F7/uws/nHX8=;
        b=BRv6EUof3+KJ7DIzkP5XOd0W8OyUkijOkJK7ITPvZxHqEudBfn6V6dWtfmSBlObXdd
         CfLlKz+wahbVUQEVhMjxgGafOCK/H5xEfhOISYJNowkDX/+6e3pOcg71a+/sgFhbUlhP
         5LZDwGI4z2xiwgdY6k3sFnaC2I7ORFs+kAnB0q7KY6SdIjQ2OOWa6L0HIQyw5hw1WLqy
         vzXd4IEOhnLc0izFr5fkQrS8AwYF+sLfLTY/85bf5fG1f91O3bnqHd44426tzK1ULANr
         uyVPSDFNX1XRs3GTCl88STWEOBq1vEfiIVGZidJSVWoiRw1ZGur198VVL7Cu1RL8ymw+
         p5Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781772; x=1792386572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lLLLclL22w++ZhVf6oeIW0i9eibJmDwV660dbwM+rA=;
        b=bJ5mNG+GOenZk+PaIqC95W3SKglsI4LX62Ow5JQt3xPGvMseB0nteJa8jSg+mrt3O5
         Dc9jrQxn4ycoyok5CdLXrczrXzGQEt9u2DoeguGFuZpqxFqza3EjL9gN7QDBHhcqnlpS
         pWmP41WgnW1OO0lNrrZVuzsUukt4nvasbIx+MtLbgeA6LNVDx3N7JIMmbLYYCJ9V08Zh
         5rqK9KAtNpmd/nFeesLHr5jHkD8ORwkpYKZzRXBmG+4pshkedfONraI5A6IVrK2QGmd2
         e3EyQlqBMaZBCWLk8cD7IX7GLGkma+DzsPIwXI9KOFzfaPK/k9EhgkEcVE/dbOLFLToE
         pUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781772; x=1792386572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lLLLclL22w++ZhVf6oeIW0i9eibJmDwV660dbwM+rA=;
        b=OUrXYW7T/HtO/rqXq1Tz14kPj5V4uOi+L2iYYhLEN7hWMQNr1T66bOPBwsXE7RX+Mo
         1n9bwdTrJ61V3GLQL1g1yF9LULCJ8qxbhzxLyJW3tn0Jd8Z5Rxb2jG1Z8/Rm7oN+/+ul
         2OaXxIWey3XLc94wEzTU3xwwodsbzkqyGbqLaUe4iejaHkuzpv66PVtSxxbKUiLEQO6K
         RkNcrMTzP4OxdHUICtZ8ZkfzzZVAee7dOO/DrL7I7hg0bcsBLdD9/SKcAcVwk51muDc2
         erOUaaqAIJ504z3oXsBWh3hysIKMkPClvkTbqVKaC6nRdzUPu4FiU5yk8J7z6biRC7iO
         nHxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpaG1xFShVjf+LRAsgQLCo8uNQ9sE9dernMsOdKiG2cQ+EVe1F7vCGtrFT2bqDUtpN9Br3B9A8sw1ia84=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw6wdo6UMTSZx6CJc5CInHkEqcO5/Zd80w2A22uQ4Rk5+EQLPs
	0xexYbBUxbBxgGLfjjyXYDEYux6meVwxp+RcWDxJ0olNCuL9CJzspQHo6iaoPXt4iSE0x+a6yl2
	Nl0Gyfd5f/fndBpqvo+DuC+aVog0DJ/Q=
X-Gm-Gg: AYBFou24dQi00n4WCGKXFKXTh0z6mGIg7MpupRkZIKnadHfKJKEeuPl2KT30jCf6R4s
	yvHfbeYYvuRrkmlPxwbVfv0cQ/TwXEox1aSdwXoSnuZj4bMiX9NUKKScNdsnlHkpvMPAfA/K3md
	hpZrUk1L+LFSH4lHxUruWFkE/k6WQDvvKxQJdymFZ6BkMsy1BZNlnH2bXFAfaaEdA8dx+c2aMaX
	y4Ddt++3Kur9NG5c70jLKxz4Ronk2BBe0w99HRfR/R/xykBMPD18Hp9EiVthfi5QIfHVV4AefLA
	rz3wwgCjVHgMBUbJ2VznZfCCmbcEqFnqn8HXeePbauYkJzEh/y9gsbs6gQJTJp2VBz6/ohRjSD9
	/Jw3vcAmTjGF8EDfgTm+QSYCFJnCNcfPkCeBCEvCVLU9cpLWArtkCcB3zBsLGo+BfdCvE8d85yB
	bXMZZ7bx8TyikPhGrA2/bH0eR5SWtRcZmrvzUkGoNi6SaadIiyRQc=
X-Received: by 2002:a05:7300:ea0e:b0:351:6d7f:e2bc with SMTP id
 5a478bee46e88-3537e04ce24mr18178021eec.2.1791781772328; Sun, 11 Oct 2026
 22:09:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <DM1774SH56A5.136OP30FCYTK4@kernel.org>
In-Reply-To: <DM1774SH56A5.136OP30FCYTK4@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 07:09:19 +0200
X-Gm-Features: AclHuK8FyNO76XBT-aFJhzI666atCoeFIAiNv_EYP3smCOzwM8fZIHSmXpX9zm0
Message-ID: <CANiq72=e=L1KYCGG+hu_p8YdU17kTKFqanKy9H7SDGKC1zUapw@mail.gmail.com>
Subject: Re: [GIT PULL] Alloc changes for 7.4-rc1
To: Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 3:38=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b9=
35:
>
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/Rust-for-Linux/linux.git tags/alloc-7.4-rc1
>
> for you to fetch changes up to 6e8339118040f24ebcc21db22c9c1b7398b7e39e:
>
>   rust: alloc: add `NumaNode::id()` accessor (2026-09-29 21:05:08 +0200)

Merged into `rust-next` -- thanks!

Cheers,
Miguel

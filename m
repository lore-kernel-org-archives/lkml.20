Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2024F7CDC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897505; cv=pass; b=ZkmCKX59hAi5CyF0s/gWnzBMPeAjvRtJH/5WnuI1l5nkMLKCT97+3NVfH2cTqVDit/byjoVIhRanzdeYvx+lFHNLusnDRwS/CbWXCvfVJo39qMckB1IQ8OVSzGbxV3XKDvb/Sxup5oBzYY+RBGTxcm1h+nqqvtwc5/sOoSGvX8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897505; c=relaxed/simple;
	bh=hJKIthmcoSQplDJE0ksiUJ2iIxFkUQVvqygF1wIyD9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DDfvYoau/YEvd91ID5DFdszdUNVfxqnIaWt0SrYWmGCNvzuWruiHk4WCWMPwUKDYUA4Fg0Hadxx25xuKxZoyMyef4iXM9naEGoNG7GwLP1bCQIR8Ic7NrDpirf3/sL3uAkvwYXJwfFfZY3oaARAKAoWC1q1t312VkHXbLIJexak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCT8EdU4; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCT8EdU4"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-313bab9cfe7so313013eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791897503; cv=none;
        d=google.com; s=arc-20260327;
        b=c7Z3sAygs/Mm0xIoo5Ts9QtK+hSEgwhEc7thIkNLnIMwGkm5AJw8bjHVz7fzWSOc18
         xw8YSQTeBq6AunfYX5GbI+aBFVKzTa6J9t/ggkmSn28KDUXAuQp6er7TWWBWjyMIAhuQ
         K9D8UizBYyHGAVlu54cGA32b5Ejwt3abtN+/URTtKnbp9QfykTk7sFil0PHotoPs4uqX
         X/7zoN78jyrY+Yd4mxTeaynsvvhPxHLiJcZkqdY0Zr28871vxQQcu0iOR+Vf1dOGudCY
         M8DiXmyzPDSJ0dYcxPZFHPkXwqEZN0Vmdz6Ff7n4evazrxo56JxLZrqGTGczXl2VzBuf
         HTrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        fh=nTh5Gir0qE7zq1bM1myyBOb+4ImSLH1pOiJHhapctH4=;
        b=dvcOCwB/MOGdGsQ3jJoeWBLAm5BuvoHjexX/E2mi16f6w5FYaQDj/4ExTkOhdKfXsg
         gNg08AfSCz1rW8jCtuCyR4M1gqvb64E51Mm/CJ1DJ1z98rfAv1t4WJVe/hcAtghVMZUK
         yep/+fpdwOkXWuQIUDnGtMjfe/jirpe/yyDcf52GAlboWfk4GgB+LDZTf5ymJNl/Q0gM
         GimdtfIFJB15ygQxqBhkcutkFOAwISpUMj9KDhy7nbvg2a55Z6aFKQUVNgAJN9i+SPVa
         XoRUhU4JRbyKUaXeDC+YOya9meJuDepO4iOrXUg+YVlAo00QHpdnTIm7OGpva6aT9dlp
         Hc9w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791897503; x=1792502303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        b=WCT8EdU4EbDHc3u7XUhEPCl0B3vko6WTS5R1Mj8cpz5p98yoT3qV5nZk6s2F9AjGep
         j5neg1n1GA9QPDVGdaVC1j7MYRrlKYBM45X6e7vIgKhtAuEEZ7wZ8eK7OWLBrtMaZjCb
         faIDNHke+fi1yPwxb3oVoLa4BI4aOV1+8esDuZZWcZpZImdYNFc3E1/CnRwgtbVoFUB2
         LQ1X4084MGzqkrbFvq5bcgddG1hdBb4NSPIJBSGwe8S/7bSkf3OB1npbHjFfQ0EIM6Ir
         DaynXObeLW+wHdgBrlVIgIb0k1wezc8PDzOgcGuew41uAevcCG4U0j2joDB7SPHNU1x4
         MglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791897503; x=1792502303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bL59kslE7Bvimc7NTbR0+OM7nidwyCwsipRxQthChUo=;
        b=lz11dqfIUoW0axtQSz5QB1N6tuZeC7aEI0BGRUtD9X1j6cpSPsMPYgK0YSYtFOlNVl
         sKiTyKLvTdlmylyKyKWOPsR+wMNX0BbPQbF1ZUerXXWO8Spk5eBC8ouL8LcNFDrJXBed
         cRa3ZXWhJiQA+Ydy6B4kgM1Jvtwr73iu+P7x7K5HDYg2PPBnArYtTaeUkqqzrEuvErK8
         vczliO1d4kRUKtJqsD930jZo3wg+plO7wQi10CxJy/aZMI+GRC7yInqwFjaVihFTOmp6
         Ek1o0oPScZauSvN9Vl8ixCX5eEPk5rnWaoTzaA1vxtmgNXRIVbtHZtjGdlMlKyNE21KW
         ZkTg==
X-Forwarded-Encrypted: i=1; AKwUvBwTVAvozlnNPxAyXJz12dWxTORjM3skhIfj3Zn0zEkP+ARaN2YoXfoax/7BstLa7SSTnto7PpEmjVXiF1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyjAvBPmYKlq033h2B9BInFzxz8yj5XB0MvRCJB2y9ZBttiuqp
	4EuBVhb5szmOJ0MmXr1/g8JMBIKhNfmMOsvcmNRht8wRG8rgtR5oR5hIyxp3VACOY7bZMBB00aN
	VO2JJXtEN9DffDSaczvESdPY3UVJH1jA=
X-Gm-Gg: AYBFou2AKbvo0TBt7cBYAOkCq0FsZt4kbQLEBE5F2+8JEcsYegtxwYTXvs5BRM34LrN
	YTVyE6dQ5Xv+kBbzI7DqMXiH6z7Fc2fUyCzFgIqaCmSnWGMZx5w+z0BzvG4KevXdpqoDWG6LWM3
	cJgd2bb2oY+ZkhBosD876f5qKrBQOfX4HPa4Z1PF/xT8qRnga9+P5lfm9eNwPT4cse/TOq1gCFM
	h5e4RQJ5ToaYSHhaGuRVC5DTvdMXEUtPJnTsPWSqf/XwngGiZi+r/genjYfVR7IUm1JY6zrn7X1
	WjPnuJuRX9BBwzgaTMq2V8Z8DqnFJe8IVICbWWd1wS1BpKLH54v8wPViMig8sY46Qy3cq0Aujh5
	8uQf6NyLE58oRJAy4NF1EQ4NNewaJpZL9dbZQzcBOGb97A6eLZisATD6Nvbh790rB1K8o904TLC
	zXvCMuY9j5VncMemn+pLEJCbR6Pea5Qn5nOjpfkHI0m66fH9PTfmMhrbvH4L6cow==
X-Received: by 2002:a05:701b:4510:20b0:16b:4f52:a08 with SMTP id
 a92af1059eb24-16b4f520f3amr27369676c88.0.1791897503344; Tue, 13 Oct 2026
 06:18:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-cv-v5-0-113a538dfaef@nvidia.com> <20261013-cv-v5-1-113a538dfaef@nvidia.com>
In-Reply-To: <20261013-cv-v5-1-113a538dfaef@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 15:18:10 +0200
X-Gm-Features: AclHuK_z220Bvz1iedMpcDzIc6RcPj5ZS2ls1iZZ_k6lRJyNsSKpCWB6rOoIE30
Message-ID: <CANiq72kccCL7DjBtLw7AF-nNcKo7OjjVwZ7Ba4fZAQXVZaMkMA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: num: add cv! macro to create values from
 constant expressions
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:58=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Currently, using NonZero/Bounded constants is quite verbose. It's
> unfortunate because it disincentivizes using it in interface boundaries.
> Introduce a macro to make it nicer to use. The macro `cv!` (for constant
> value) takes a const integer expression and widens it to i128 (at build
> time only) before passing it as a const generic value to a new trait
> `FromConst`. The value is then converted and appears in the
> associated constant `FromConst::VALUE`. The trait is implemented by
> NonZero, Bounded, and Alignment and lets values of each be constructed
> from constants without a verbose turbofish syntax.
>
> For example, `const { NonZero::new(1).unwrap() }` can be written as
> `cv!(1)`.
>
> Add the `cv!` macro to the prelude so it doesn't need to be imported
> explicitly to use it.
>
> Suggested-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Added a few intra-doc links. - Miguel ]

And thanks Eliot for the quick respin :)

Cheers,
Miguel

Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5EB45563F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 23:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789601370; cv=pass; b=gBBounWTSTUtelNvj6UMr5hxOVw7xw+oQ3mWPZAaVgdOc8PSPovOXoDrGQMzPRXPq4fnP+l8vWtQnbpK1P0UPrMsVws/6cMI1hXY6Pm7gIv88v4vX82zdv6Va+m5yeSAohJu632Q1O3+megBh+M2QD3daz/pF3kRy7mJLbggzs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789601370; c=relaxed/simple;
	bh=D7Ge9X6Ztqu/7FdccyRhbKVgUi2xAiktn40DLZZXjTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJ9Fx0pG4dUxfOG9clj4Y7pvLBsam4QeVWnNieEHNGqFjsYjeNUIggZNN+FDEl/YvmSwelXIv3iP5Le01HjhnyxXCCk36dVNhIORa38T6cU/gr05eX9h4t+FyGRi3zZzQft4LrxCKeip5LbESRwKjwkf7vC9U6T73s41bQEbQ4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=akt0EzT0; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="akt0EzT0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f88so160804f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:29:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789601368; cv=none;
        d=google.com; s=arc-20260327;
        b=k7rbe7Ek1tPVH6wPPPlOLz6ZRx6LHMKOUNb/H7TJDr7PNH3zq9Guo7h7C7OJ8EWynd
         74qU7rkCl6Ux+lv3mNKU30XH+mrJh5Zs7KKX/ntTzGCaPqW73MgH7gxkXriBLmxBz1uL
         meboY7eIMQiQH1HX4iYXhkC7c/44oWtzOmSk2/l07K+dS/fXL4pQHY86xUcurcSZssK8
         AyLdgPpa/BE0gdjVtR1HZpP/yrUzxTHpJl/zq1RnXZrFbctcosDuH/vTsh0hgBIn8SeD
         q3+5qNTWUv2akd86Pt4qGoKdGB7xZxUWkrswFyruWMByqrk+IrNurUDubq9MTj/L9gVq
         t6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7Ge9X6Ztqu/7FdccyRhbKVgUi2xAiktn40DLZZXjTk=;
        fh=abDieEBMSWHFeG4IWjl4eNdJqZD1Axt7SFPNU2DI/Sc=;
        b=GSUkIq/MD1tpmTiCMa8uuN3pvU8Rvm7xFBnpH1yrXltMb8AIYVVEFGmlJpZxW20fzS
         gWPZpgubnScpdrFi/QVTTxuU3TKhP/p8sqYze/THtWzgomJik8RbvS9nI+qStYm6Lg88
         xVmSnCpFQHniikZyrTjoOwyjMSGr0gV6WhkBUHDJOn6tzO8KG10b2i87row6Wdyfi8vs
         0iaBMtSgYupQ/zK2r64FNIqRNam+C3spxs1B7HiDXiiKow9+EIfC1K7FI5BI31oXEqO6
         8i/UInX048l3p6W0xV3cCYjA1u929pLllToNbEUf8M7NMMOB/sOgVOmm9uTFO+PPCtAe
         zJXg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789601368; x=1790206168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7Ge9X6Ztqu/7FdccyRhbKVgUi2xAiktn40DLZZXjTk=;
        b=akt0EzT0epTCdb5lKYIPYDu94F35mmD8jK7lUQ7N0N7d6786+/M/AbXTLEsqrBQWur
         S7Du+EHOhooNe9Rd25WNBavSanSF7tzD74JasAAI0mfoNXgwnTIgGITzl716EaQTCJhq
         92Yk77naLgnrlwM+UzXXuCJLz09AqFdPprAUthTteAgBg5vSK+sJqhsWTcnwVotzPQXZ
         nKyRFs1lMdU+ybEzJY/J5/Xe4hQrhmbM0MlKOpyJeltH/Htv0MGyBvO83NuMSXlvAzgL
         Vbcdsj3mHeGA8ymOmik8oDUjKycqsc1mWcnNwSW4BRoJRB3GSnMzv30tB6qPoMbH12D/
         efSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789601368; x=1790206168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7Ge9X6Ztqu/7FdccyRhbKVgUi2xAiktn40DLZZXjTk=;
        b=hg1oXRKLfBeMCA/36dZ/Zov+4CJ++sS3wb6uWOJM+yMh09D92qVp8O5lry8eRSV8zP
         zxdqMILioqzVUhmUk0L9jOEPh4hhXXeyRhWTtYOmnbsrMPMQO9fGnhivKEqURzHfYtkv
         7FXnxj58jpFgo7Uc9iekwGcaj1Rl07hFcvtp6fxRLTbPgYwIebENCc0kvTGBceM1G0Bq
         2LvuxPVOyYTJ3nw0UOiOl1I+MkMk6EZEu1imP/e6n/mIOPqmqo+iSRZZEj60U1/GSBFR
         CxNGk3UWbJwd2uq7TWrLl/3rAMvn3aWkz+xPCojfTCsL88XoFgcI/0uJPwq+ea3U/Le2
         UJcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxytgLaTpLp2O50BHWj0AmNyJ6q6EaEMw3x6daBUb2BS/ORCIfY7TdoOIGLmqq1qM7ByOu4wHVv2PO5V4c=@vger.kernel.org
X-Gm-Message-State: AFuF++ntDbNh9XvWNEjM+yljTccAx3vunTl0SXDU26ccQ7iyQq0XSFK4
	on0SJ8RSqy44Lq+G22JJyMekyO/3sRDSscXDk7iNVXDnWfXRHgyh7Z+adMcZeCvKIPZ3MySrZYn
	+vjtrBe29pehUvPXsuDEICGm+PC8eulT3o1//7Hfv
X-Gm-Gg: AYBFou28QIlU34p0KkWap1LMVcBAzDR9008RNO3YXydBvC5JWnnvQYePkxDvBKaXdxJ
	3e+4AAzmAn5B8C+gH+LMvbT5W4edLdEjyhwH0qAbOa4AoQP+QVIlo3XFxj17VtKCJJyQPUJftRS
	b00WRPxkxR/K8QyC+1UGvOWJrZt66w2jzW2zvweYLotg3xnbmTHWo/skyGoxFGVo0VqHz5WD4wV
	UImOPuGBzyp8e532fQp7tlC1w1YuFWxZoJYgRCIf51rSfiwf4ZvNM/Tg7sq4tqAQZKG7GN/Y8tW
	yZbyWd38JToQ/6C+j6TloGGIxrK23WgCqKeNA5lXruMlbBBuYimrQnk8sQG91fEMaz4LC98OQdD
	UCXdDNTdfbpqzGQlBFrbz7w==
X-Received: by 2002:a05:6000:26c1:b0:486:f778:6c85 with SMTP id
 ffacd0b85a97d-4870cf09d5emr5758313f8f.6.1789601366474; Wed, 16 Sep 2026
 16:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916120833.593407-1-cmllamas@google.com>
In-Reply-To: <20260916120833.593407-1-cmllamas@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 17 Sep 2026 00:29:13 +0100
X-Gm-Features: AcwNN1V9N7YXEIm0W9q5OmEBgRhV0s-HOmOy_FIv4QrXWCM7mnZqSF2SW0U7XeE
Message-ID: <CAH5fLghBWzoVUqQ7oRezwM+5T5j-sMTjNi2w-urNA=YAT9yM2Q@mail.gmail.com>
Subject: Re: [PATCH] rust_binderfs: add transaction_report feature entry
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 1:08=E2=80=AFPM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> rust_binderfs is missing the equivalent of commit f37b55ded8ed ("binder:
> add transaction_report feature entry"), which adds "transaction_report"
> to the binderfs feature list. This helps userspace determine if the
> BINDER_CMD_REPORT from the generic netlink API is supported.
>
> Cc: stable@vger.kernel.org
> Fixes: f14e0c8183bc ("rust_binder: report netlink transactions")
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

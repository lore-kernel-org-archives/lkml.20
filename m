Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601619;
	b=RAiA/WlyqjHAXIt2I7inUp3qONv5E1CLymRs4/4lS+3tfVb+ntQxvhQUuaBnbO1Av7PY
	 Fnzy7UUVjcSA9is2Ktb7ln7LiK9OCa/xyEvlrgFU40xa19ilC2vk5b096DiXbr9B49GrS
	 A+GQVmODtds4x4VFccEGPg60lMeaw/zZmEQM8dkmlQO1OcLG/bpP7FmZqQsWp2CtXdQ9x
	 K6rfvkGQpNxtVf8fMJXyBAgNy+7upQ2jx/P0pqI+MIlTOgIQMpuCziWnYUTe2Gh7YJjpG
	 yRE/k/1Dfdt8cCWP9PLd66yZthDHokIY32UkpCEhn8VK3LjfuDzagcpvuL1+74d+Xyw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
	b=aDnjxdHJPqLpfpZ4eVsDp0scCHdpphL0oSPLlgyXc1Gjt0rpte1EWeui6OFae8k6XhPg
	 Bv3N2syiFy3asQn5rUx02ngnpuNPdhtEt/6+4EGiQ61NABZCLkihSNu5bsMuivZ/Z6dNO
	 ObjZ0BL7NmOr3LNPPGedUY1kOU6ZhfdenLxh+4/lLBg0PtQ+GKoK5dXh3OrmPNNw5paIo
	 xX0EnRB+jiTIPG84xh7renxUQMqgnzcPJbjeOvFB6qEc9aEd8r0TveTp3mTOiqGKu2B62
	 UGZWyxLFzVbZX9gCDQVgEbTo1Z/kPp8bdK3rvmG7/2s5ZMRd4dBtaB8vgsLFCjlTYBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJuoo3LY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7E606A33D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:26:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B7E606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yJuoo3LY
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91e7af9a67fso9051286d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:26:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601617; cv=none;
        d=google.com; s=arc-20260327;
        b=AJxOSTsJJSTqklp5xfUkoimhzg58CcOVZAx9A1ShrMqeB/irD161aWijr0nBFWycow
         SafM1CKfZc0KPWWj3/F2xIeTnGQFO5cTqnLG7vplODx9Sa/EjDZ8W+EAG3Ph2mzsXSNR
         yGYZicN6c+wqalhiW6/rc8MG3OyiKeOh4WaSXTxuDvVj/S9ouw7Ywa7My4WRwVfIbqto
         yq0DZCgXZ0Z3vrioCfP8T3btvE/v6u8AnMFpBF3h+gBjDR9ZQl5Oe8qopqOuoRiXJGfB
         qRW/TI3RkQP4ZsOSd27NEmvPrI78Oq7XTl0b8A9SXteaUG92dXM+7lP+A83P7h9Xw7ZS
         dZPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
        fh=z6dngT1vzE3e1ZKi8zb7TSzc3sqOba65fkaXe9ZNx2Q=;
        b=KBvMeLDu9h+Od3iRMI06iD4iZAewG8GeL92qHGPwUxs6OlXHmjw5lZp7RkQ6M6sSpb
         yT+WBxlY6/BXewXsfyzNJ44JT/u/kbKtavHgJgyi7vtYBwbDhUkSNmWZviOLQJc+Ix5z
         zcAjG4Ych5Xdmh8bJXLd+GpV3ozGgqz9A47BVCKIixS+Bl7tLW+d8vb7Th0ETHVvTRF5
         nSBhLJQTmyW8WVMqYFEsTVuHvrsrZEtlQc4kEiGn2jHJ1oIdXEEicfDqwdb/ibXsGyab
         E8vlpWcxq13oz2D4dtxsm3GRqdsg6TdUSh7YFc2OYQPXhRDUHOrJA9WHzsSIyZzw2Lbo
         dMQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601617; x=1795206417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
        b=yJuoo3LYPuQUIE1yCLGwbdPXZZ/s9ZZb5nrp02A0PVgQAdyv/3ENMtS6TlJKI5+lvQ
         7gLFRUOC/lPw7h803x9+gpnmeprfx/BAFpptO0Xjs36LlKG4llAoOZnKESvjAvOAyNnr
         p42O2f6sA9d/lpova3ysL6uWlz+iVinZ9DT8P7f5ryyBMtE/jzcOXJY5ARfqzZkv9vm/
         LNhtd82GDz4z9xRWAxJJlrZNfA0Hf1ymj3qMGx+sgvCgMICxGMaFw39w0cduockzaM0e
         3QuxVCyWibrvQZgL6d7L3aEGE7e0UxHczkG/R3gyWLv58y4BDCg6eIy61Iidw5BMgA7q
         5Guw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601617; x=1795206417;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N51TD8kOG6VzADFHEc9ZSbuydfiGg0bvUXx6UT1l3jM=;
        b=Z7RB0D+MmKra2oRXC4d7MI0QxdNfD6K9MWFgVYvuvO6k5XluwYzvzil8DLj46cdjCO
         lRhZzSKxO4Pjp4MU8WlivUmMIH2LmmYhj7hIIQtUwsY1718yWUZtdruECpJ1fuhWKk4y
         S8cHUfROFInFxC5Nbz4lwzZmM1Ojb7AMwQW+J/Z+FSIFmIDFP/OZw5W0cJQumqzSFZz6
         Fua9KI3HyIEbgHhAmKkOjMBeE5+BinRNdgURVWsr46AmW+ROdh4zVKgY4fn4TnjghPzC
         /08OWxEj5wm6w8yXgwi+438gWPN6Ebvmlwzk3joSof4kLRbnAPaGGbLDGZEwmDNtEA2P
         r/3Q==
X-Forwarded-Encrypted: i=1; AL+hErEprSZ75drkMVjcfkCSW94iI0+A/lnf/5Rt/fgDi9RiDuoWLY+vOM2y0uBZt7ODqlhqfH/V/oY779WxANI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0kgw0u2HyqU5sCPlW8S9jgAWIGZ3/y6Fp7WgCoexcw5OaANse
	QPhPtGG4I46nfidG35Qdbw2Nql3eckqJtV3HvpX5CaN9tfCVqzhD4P7KjUytGR9QoDY7fqSvr3F
	sDhL1q99Z+OcrtdGJJmKRe8K7P8yZPds=
X-Gm-Gg: AYBFou1b/NEDr8dyV1devnY5ygukRilj6x8yXH+R4EnQ1jIgeR4Zxx+M6BlTkdtX7WW
	f5qn7luFB+2eWDgKmIjBjRPGwtapJ9iw/DwtbAaHKNtXEy0guOot6tNwEhFda5F8d6CRptFq9BT
	Se2tPa23yHfZ4Jx0xneOrlrnc/3zclel5I9uIfU5/gj7z7j2je1Wpe3EIqcHC90N0ok8CxxqTxV
	itJYTPWv7UOFIl7Rvr9dWCG9VuWyCJ3eG5yJCG2kpQsEsp8IH7gfN76I9BUKK+3YrRbik584o3R
	ob1/K3cv7BrJRTY0S81PxT0u9PaSooL0T5Ga9X0i9ArPaygOJ6Okhq8ZJt6/ypDsNUpo0X2mANP
	oSIYDw8VER0of9KcaRTYsaqAJR37tLMeoCaXE
X-Received: by 2002:a05:620a:27cc:b0:944:9dd:b6 with SMTP id
 af79cd13be357-9494bccea21mr604768185a.80.1794601617414; Fri, 13 Nov 2026
 12:26:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029150147.11989-1-mbkchelofficialdev@gmail.com>
In-Reply-To: <20261029150147.11989-1-mbkchelofficialdev@gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Fri, 13 Nov 2026 22:26:46 +0200
X-Gm-Features: AclHuK_cLts48NcMLZOfdSwAc0RmjeDt92FAQwRPmxIr9mwmNz79maXKNQR60UI
Message-ID: <CA+YDrKB1wBCo1iF+tTqa_oG2C2EssiSN-sCAdqriJqrwz5mmuw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: add descriptive doc-comment to internal fmt function
To: Miguel Ojeda <ojeda@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

    Friendly ping on this patch.

    Thanks,
    Ivan

=D1=87=D1=82, 29 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:02, Iva=
n Tverdokhleb <mbkchelofficialdev@gmail.com>:
>
> Add descriptive documentation comments to the internal formatting functio=
n,
>
> explaining its role in parsing format strings and wrapping arguments into
>
> the Adapter helper.
>
> Signed-off-by: Ivan Tverdokhleb <mbkchelofficialdev@gmail.com>
> ---
>  rust/macros/fmt.rs | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/macros/fmt.rs b/rust/macros/fmt.rs
> index ce6c72493..676156dc9 100644
> --- a/rust/macros/fmt.rs
> +++ b/rust/macros/fmt.rs
> @@ -6,6 +6,9 @@
>  use quote::quote_spanned;
>
>  /// Please see [`crate::fmt`] for documentation.
> +///
> +/// This function parses the format string, extracts named arguments fro=
m curly braces,
> +/// and wraps arguments into the `Adapter` helper.
>  pub(crate) fn fmt(input: TokenStream) -> TokenStream {
>      let mut input =3D input.into_iter();
>
> --
> 2.56.0
>

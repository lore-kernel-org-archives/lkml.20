Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793218047;
	b=m9kG6Uw2E+o4iD5tdpLPX95rYNUD5bEIdxtuXtq8t6wHmjyvwpWTpQCObvVy7hmJH5mx
	 mnAl1wAigpnCALjkhEFfQGZdmvUoPaF6/Dc5GNrV092sXWQm0OXT1lZKcf4fLxJIKw0uM
	 gm0o9ZeE0iuLZj120TkJJfKzBvDwhQKGWkbWht1HlJUX7GJOmgfcZ4MnKujMMvoJp/mQ2
	 vocSH6knClJetc2tE4b/EkmxDtp/aQuZWn6tyzgpwd6FDUc5ZOu8EPxPKOgLfdYS8Kv6V
	 LcJpUBX8jsdoBiENa5kaIgaYNJ21Wk9GZ0JmAriQvFgqx9BolxATJZF+eZ41k3sCfDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
	b=yBg9m+2vTj7q3sBRqFWE+7mVVxUgpgm24XJ0kxPrppdXAcQYcY7PzMr9c9v/Sl19Asw6
	 A3sl63E6pZpMGlCgDXs/+bYxAan/w3XscAehpqwSqU89rTAV7mBQf2j0k3dGhgU7Vi049
	 FknN+H41nWwpncmC2oMuev0AVUZEfPyA2LtpCK0Ar79ekvuShDqkTcbhcg2xiAxL0Xx4R
	 uro/E4TvIZkLXjNrSGztkGRhfhA3KzW4yJePG7PeZm4EEsLDA02BJFpSpRCMeCPwLbMFj
	 Pf8gWqRxeYjeNW+reP3CU4wQ8Dt/fwhTcAIbCJPs9nFm+OkDr+5UvsJ33HmC/LlM1bA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3taxh6+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA083606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA083606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p3taxh6+
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91c5e31bea9so19021596d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793218046; cv=none;
        d=google.com; s=arc-20260327;
        b=shfFI8u5NiQZ3G7T7jY36bhpUinQvHb0U8Egt2JaW4lilwfq/YhLYfyuVQFvmvus+W
         vJq2Vw2VI+Zeq+ZKw1d73PPK2FHfiNDqIZm1J+HIZHNgZhb0G9dglEWWlnLusNPRv5+9
         S09q0hy00brx1Ut8lp28WBAnlo2+Txw2hc9TOSFsZndXaJ7us1btzrPDGwhb8txzl7x/
         ZWtxxDzOFPHfS1/p2ifm978HPJznkDaehC8HHltTXhJtK/TC/jk6Vqq/1OONhz5RpRUw
         ylAoUR/6KDIjD4wMCoKJb6v4C9hXaKll/bwBXEflRkhilnouEu+m3YpgSYPJCHfe458z
         j3Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
        fh=k6AVN6bfXwWQ5EwSNvurvz81oKNNH6SV4GIvOjNUZPU=;
        b=liSnQd1HyFtR6YgCZsURgSe8BwlP0nTeoRnXFv1dwgZficwdJ5kLH37CqN/N5BsipI
         pA9Cb4wut1jmt/QeEQgqYjAIfDM3LjlXSGLfEbAo78D7AucpXRGSf8s8By4NnZXbFHId
         IDA3AfC6ZbbUtVEsE9uHr6BGkS3UWIr2tFhh96aQ8Xl9j3f//U0nhjP5mle4igge8DNL
         x6VgrYKolBcbgeGiOjJ6n9oXHXAk2MX2tDMT8ROS8L/GuMBquhbbQt3zO/SfY8qUtEuN
         NZi/eDbGaN/vxURBzlKZkq1dsqMOap/8hViNcj0jrkZOrYRwGSNzKnDb+gTKco6b2JC0
         F6nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218046; x=1793822846; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
        b=p3taxh6+1zzWVc9EmShmzG9CuyuWlEjpboYJHc6W45sCKXGXjeJH5Li0UcdBireTcG
         Wh4Odk8rQQuaqHs73ra+lucr5mlVAKxrGMu8R9MTBKFA0Tkq2f7uGh4xRuo88zuAGvPi
         Onhs72B24PAxZon9uswO0flA8MVCF5HJz0E9d+FhKfBpMZ0qelyQRghtdcFrh6VjZU8m
         WESIHnfjOMZCg01pxaPgugzZMI30+F6//HFuuHFjACpjDW8IYdDPglwvJTazJQ3T/YdZ
         K9OLhk1aHNfgE8OH6D7Tq6tYwdLGNTWDP9QhFVrbhJriI/QhRT7kbA/9lARQKF/hJJxH
         dSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218046; x=1793822846;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lrhbbx4CO+oq5MwiDvH/mUB5MVwGHTj6HOvSaL36hvg=;
        b=QU1CiX7vOpPcwlLNWLgqKdInlNytoPSh2Tgp+HpnZYdjfl4U+TvtvUnPYciIpyUD7n
         TeCAHArhTDk3gEpRa2u3zyV3aXnq3sKLCDDZt2kc/UZIRpmv5wvVZlWxJHPHxmnohnU0
         VTonkuY+SMfdlaKIwLwhMNryWcdLQLpbXF4e2oezU/KjUNFLdiaFQeKBUpdvb8aohNtR
         AEpr/nx1cpnt4PDh+GA9weQckJdBGopwWYeegEGr/bWKQJELzRewwZH1zLNimXkgqve3
         DrUNC6nsXKWtMJU0YjkB/jMDnSmUZtFOcuVl6r4tgPB7pmuviRBvsIeEH6J1H6+5XmHh
         Y8RQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOdvPR98ooINh0rgWVW1Hqodxed+HZ0j4WxZ9aFrtC4HLwtnxe/AJ/63107BZAPP+rnkyVlNIn/K1DzwQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzF+RsZ8FZw8otO6AsyXHcEaOlhnG+C/bYTbtmwZSJueq1RnfD
	MpdixDlzBf+JXnL8uGpO5vzsI56qSwDkLrBlwit8D6cm8S8k3c2+d/XSaPzZ+S/hmnm9I8IVmhv
	xCEDoWXtLcEWPcRfA9XqnxokWmtoWUzQ=
X-Gm-Gg: AYBFou2xN5k0ZnvqRq0w91ITwgnjYRLpEe1kWYBg8CaCUXhro+CYguYhkFYPTKlDkAB
	BSQrpNurz+apebYUGfSKH5BmKdTphkI/M0p+ELMkCLRLgmA6wpZ52Fypr0Lf9PfNscZq875q4HI
	QbyH6wmYS5yqeqEKyFIoMOoEDUL1lkfNX/ELy25X2xiUj3VYDOE5bo11lz+Cge0xKCEQgqXHBDm
	Yl2bcPcAX4jMEFoLFBcziPHPnVKStUiiFwyTEj4+tdiPB+dSEBPj03NdmdeK5UUuQwhyFy5b03g
	V08ELYeTqjS0MVBFam4C1EwIPW0E/J6pxF+skdy2+zPSc/ELzI+NdfN8ZuDgQv1Mbc1GeSkENt0
	WEl0ZuPvWJUMwrK+oDG35nRgKXSRWYPg/zx9i
X-Received: by 2002:a05:6214:440a:b0:91c:7a28:ac2c with SMTP id
 6a1803df08f44-91c7d1c8ea8mr57159156d6.45.1793218045636; Wed, 28 Oct 2026
 13:07:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com> <CA+YDrKA1hTM-Yh+qsCz7Q_O9f4m_JWqyxkm4izaz4uAao_Jz5Q@mail.gmail.com>
In-Reply-To: <CA+YDrKA1hTM-Yh+qsCz7Q_O9f4m_JWqyxkm4izaz4uAao_Jz5Q@mail.gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Wed, 28 Oct 2026 22:07:14 +0200
X-Gm-Features: AclHuK8ADXWg0BZmsFa3zyD6jUTA8KjkgEaCcTELUDSN5BqekvV-5qZiXzunHtI
Message-ID: <CA+YDrKCkQ=xzsawRUdk7FUXuO+JvKgEjFuvFAGZwMtOR2Aw1BQ@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Please note that I made a typo in my last name in the "From" and
"Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".

If the patch is accepted, could you please apply it with the corrected name=
?

Thanks,
Ivan

=D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 21:57, MBK=
CHEL <mbkchelofficialdev@gmail.com>:
>
> Hi,
> Please note that I made a typo in my last name in the "From" and "Signed-=
off-by" lines. My correct name is "Ivan Tverdokhleb".
> If the patch is accepted, could you please apply it with the corrected na=
me?
> Thanks,
> Ivan
>
>
> =D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, I=
van Tverdohleb <mbkchelofficialdev@gmail.com>:
>>
>> Add documentation for the emit_base method within the ModInfoBuilder
>> struct. Explain its role in formatting metadata strings, handling the
>> differentiation between built-in and loadable modules, and managing
>> linker sections and conditional compilation.
>>
>> Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
>> ---
>>  rust/macros/module.rs | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/rust/macros/module.rs b/rust/macros/module.rs
>> index 0a7b9e24c..6f361013f 100644
>> --- a/rust/macros/module.rs
>> +++ b/rust/macros/module.rs
>> @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
>>          }
>>      }
>>
>> +    /// Emits a single metadata entry into the module information table=
.
>> +    ///
>> +    /// This method formats a `field=3Dcontent\0` byte string and place=
s it into the
>> +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=
=3D true`), the string
>> +    /// is prefixed with the module name (`module.field=3Dcontent\0`) t=
o avoid naming
>> +    /// collisions in the final monolithic kernel binary.
>> +    ///
>> +    /// It automatically generates a unique static identifier using an =
internal counter
>> +    /// and applies appropriate conditional compilation attributes (`#[=
cfg(MODULE)]` or
>> +    /// `#[cfg(not(MODULE))]`) based on the target type.
>>      fn emit_base(&mut self, field: &str, content: &str, builtin: bool, =
param: bool) {
>>          let string =3D if builtin {
>>              // Built-in modules prefix their modinfo strings by `module=
.`.
>> --
>> 2.56.0
>>

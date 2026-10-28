Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793192512;
	b=oQPHqUL3ElPZHni3XI9B4cwZuFroBFSZprYmFodPeQ/M5jeZ27yrLtYKVr4xi3NcQYli
	 /KFmfJsTAfWcuJzRi7oKKa/MJom3UyWo20d4BAGmfMZlL/1tygIf35wVAND4nrlN57mWv
	 xuI3yG6rBlzif2VBBBgLDjDxu22fAedKhZML/x7BmsKqFpNsB5jabXJMwjOlN6WjCkWx7
	 4nceij1Ml4KnP5OsVtFGYNEjinH9kyGwww9HZ8utLKXLAba8Ppf4NfCTmtmlLTxf7IWsN
	 avPWYu1Q3MYjFsgMXtKgBez6RtMJfgOMi3BdFrS3SXDel9Rd2Va/ZKvsjo9bP0/QsbA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793192512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
	b=nql84UfoHRpVNarvNh/cwrRYNn5TD4APc99dcqAjvQHZBlz4azOKu2pGUskyORs4c8hi
	 JTBoO2z34UvddzU5LBnH/k+VvQA/kRnrRmMormxS09GbYBLJN3xLlbT1Vja039rFukuVL
	 Rv7tL0jIdUYq+NAKqj/tkz6orznSYg088kqyCd63MWtyf5Jd/xmIfUXuSH6Hv69Q6G4WM
	 oMmoDImkNXoFVO4AN3ZlZpSvTwBF8ptrlq8skdeX5FTLq63h7fDikdfyih+mM+FJR1SzH
	 +b2j4Bb97PvN4lKyYp9MQmKZqH0uUAwYOPaT4Tnwn6C4eVdtvFPLN7TFCOPyseXat7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56AE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E56AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35159e0092aso100188eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:01:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793192503; cv=none;
        d=google.com; s=arc-20260327;
        b=LfOTThzJFrLSr+NsWtXDFtilFIYW6I/yKYomiRLgYJd5d+xaG43VojOlV5YrYq63+2
         MNcuPntKhY8cGz1CtmrIFQrqp1U8p3l9/n+DMrEtt1vnKJo922o1BKYFOS7ijZjtUGKV
         wwkLOXuqMrK3VhKbENNIuKrHpf9XVHme0WBvcA9ZFNqK+eXCT0bFtdswtBgDH4W8hmZE
         fDnppGOAQpUnQHdgRq6Z7+jx6xeFfF5KSCWkqKr4nGOWvbDxL9arBTx0bqoUet0RH0jf
         3U0dRSgIUVPZW27+M5TbEGLYC6OXXXukpOa3TJKadU9nOYWsSKVUcdo+qM9hoaktuS1k
         EE/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
        fh=FySdc+m4St1+hgMFjI+Ip6UCIfUBsDXAO0IUuBXi9G4=;
        b=A6PgaRCHFmdDnSXJVfAuaoNRaosnJQBR+musFUmsHy529ogESkz4Jg7oGra1p+IphT
         TkBhukGWkGDatZ36f7D0Acg27dsXABwncGz500oZL/9AgrPdwYNqWN5wEYhdaADs3xfV
         8AI6U+GX5dLof8wTKiGfz+CKA1j19sb440XQMFI7VjW8cJYnQ8Rb86TDE50LhI2HrFxf
         dE4mlpU9EcmZsG3CgPoIBn8V5IgGiFqFAMKsqC3oftXWgHv7Sb/4BnL8ghCGKhvmkvtW
         fmfEyp+91nXeNzbjT0k7tfPLLRb7kDtfvavCw+tsRbMqL5hr47cfyB1tFHyINlpB6/G3
         QCpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793192503; x=1793797303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
        b=UVSo07jab76HC06BUzMCuuAf4Tz45imTAmpBAesaFsMWt5m39KDj9ge8xqSoQaGSEf
         9OFdRo94QXfpgOXEuPfp0p6Kz1flJvmFZ8z1Pl9XTHj4jWMD19eD7tpH2ifu9Nuol6he
         4/krJMHORCuqwn9mP8TkZOXKrZTL/BydxOhYruHKdVglNsJSGhG5Y8kd+qim7MPqF01d
         t/FwO2FqJDyrYBUpcd0oNvi8bo0cvg96UT5rsjYopYf/9Jjymc39dFGpgPyE3DgCSmqe
         4qka2O5RhZeZRWzDe5NxXroFSk24lN1FtluEs0uvqTF5hE/6fdOwAQ7No368fQ1B/wmL
         M6bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793192503; x=1793797303;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daSh52CtbzJcxQUzII2OVz21dzmtvJYNwgUaoSocY7A=;
        b=rtCVVLpwZ9ZgIH8uTi2FRbrujpibjrZ+P4+Q8P03E6Le47HVxCkv/jwTb3zoquAX28
         ecN1LpGL6KoNLbRpLGG28jA5M46Wd+uNgwf3By+7g7mOhdEwH//HK7YyUuYXwHrHNq1k
         BkFRHyshC7ieBfrw6TBprCcFeWoVbcLnu5r0qYtqshd62iVlBGlvDTTZoVkz3Wa4ICaY
         aA4VHqpvZTpBBTF9MMF0h7Tk/If8pmUlzbnfuYkBzRto+wSVpNBi4cLJMJYCxNPlPvSG
         DrqcLbbUPWClh5muPTvHrgrlDjN5/pY22Q44cXhplo5c4TmpcOTQoJQefTtWsfubvG6S
         ujGg==
X-Forwarded-Encrypted: i=1; AKwUvBy+YN7qSNtCqVXhSPcnZGL2mKQCv96lrLpne57pf9iQZDvRaxcH+onSAdoUcveQqMlanmmegyV/O+UUHcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxIkJ6wOJ+RR/wWK9WvblmIT/VzUdpPMFrcOU0Z+VBfvUA5Pek
	lfOMGe3cWWF1DksRaYyrviCFBwG3erfA6evILSyNAaluGUT1xrr1d12t8B+3s0H6wgM1ixAAXka
	dzNsgDewxJVYtHIypoOt22/5mptsbKF8=
X-Gm-Gg: AYBFou28mAs7w94uBrfZ/qMvoqY258UjlNegiNV1vE+YcYjGhM2OveNWjrZ4xOlTXVN
	4JlrfY/FjVHrEg19pAE2RBR9N12BvfgEig0K0q5BtFKAwFVPaw4EhsKdIHiYhdsj/qdLvuyW7fw
	FWBPpjg8KGkw8LbXwNpA0AlsI4jg26Ihnm+zIn46UoJY+g2CsopyqlYHAxqWkcxAzqUxYue8FPH
	VSeMv0x73VNxL4z+AIJHYPCfTizDw0JUmsWuHg5tr0mzjOSkjLM52RLjI3T3RZRFG9rSsjGDfP3
	YMsu6pDMf3NWgMEKdQwubp5I7J3+CjYEYtgIjdJuJWmedwIzmHLVcpILuYdsWtLM8bTzzkwo4wG
	N/hMKzUkL5P75seWMOT7BExQD+hyJdgG4fmO9DT+9m/VoXNMVcJbQq/YHp1XdMju0pHLSfHKnvj
	vJrYa4sEnvleYrZeUl2BDLiYgz1hq/W/yymX3vx278MMDtLUlhVhQV+g2RIuqQw1ZuHfP/NDVe5
	nzyNSEpM2v1C3DHMY5A5ed5hkMiSUkc07K3
X-Received: by 2002:a05:693c:88d1:20b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a1ffffc09mr5566328eec.2.1793192502694; Wed, 28 Oct 2026
 06:01:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io>
In-Reply-To: <20261027-b4-parse-int-sign-v1-0-7f386318a4b7@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Oct 2026 14:01:29 +0100
X-Gm-Features: AclHuK_S8S9ncRlLn5nkdZ6xCOig49JrX3uIQWvfnFY_1dU8G-aUzOG8uo1jV0E
Message-ID: <CANiq72m_S1uKpg1q-en41cV91QDrzGEsFMZqbqdxUtxEA8Y+kg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rust: str: parse_int: match kstrtol() sign and
 newline handling
To: git@younes.io
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:10=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> The documentation of `ParseInt` says that any string parsed by
> `kstrtol()` or `kstrtoul()` is also parsed by `from_str()`. That does
> not hold today, and `from_str()` also accepts strings that `kstrtol()`
> rejects:
>
>     input     kstrtoint()   i32::from_str()
>     "0x-5"    -EINVAL       Ok(-5)
>     "0x+5"    -EINVAL       Ok(5)
>     "-+5"     -EINVAL       Ok(-5)
>     "+0x5"    5             Err(EINVAL)
>     "5\n"     5             Err(EINVAL)

I think these are indeed fixes in that the docs do not match the code,
though it seems nobody depends on this except the sample, so probably
they will go in rust-next.

Not sure about backporting -- I guess in principle an external module
could be relying on the old behavior by chance, while nobody needs the
new one in-tree.

By the way, should we add:

    assert!(i32::from_str(b_str!("-0x+5")).is_err());

to the first patch for completeness?

Also, in the commit message examples, you mention `kstrtoint()` (also
above), but since the docs talk about specifically about `kstrtol()`
and `kstrtoul()`, maybe it is best to refer to them directly. Not a
big deal, though.

Finally, that:

    /// Returns [`EINVAL`] if the digits start with a sign, which
    /// `from_str_radix()` would otherwise accept.

could mention which `from_str_radix()` it is talking about and why
(e.g. "so that the result can be passed to ...").

Thanks!

Cheers,
Miguel

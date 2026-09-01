Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCAC371053
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266550; cv=pass; b=lEhWxSeb8kpIEm6x5bTYnfkZPPyvj3LL9ch8WpLSUqJ2FWhpCI2qCWlof6LwtsRHRCuGi/1V6Seq5v+PTZ8UpAHZWROYCp3/VTE6akoAlcnzH9l8NR28IAOV6Cnp/OFnl9gBnYmTSeMiq3KaorUHND4pb1i2TsL/zzgz6l0oR8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266550; c=relaxed/simple;
	bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QDwH+R9yCcMjhpIg9Wy6WKLz/6WkMDXL+9+SkrVjt/m3tDW8kBjpYkG9UT8d4n5Uguk19SyzDcfMquMDcjsgMWr2yAjIfPFZU1V6pw6AWrS2BN6X0r8I3R8UDHvbDupUQWnu2eVe6au/sCK7Vhr0jOM2fAddSQ6UQnO26FHst3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WP8yHs1Z; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WP8yHs1Z"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d30c22b1eeso4915555ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:42:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788266548; cv=none;
        d=google.com; s=arc-20260327;
        b=aElsNZghRRB8YOfwwzdQe6V+ifSvIH5s5Yo3cdnK5v8/hajE/HBP6UbOntCUlo4qTu
         4KSVs+APv4RzfqkispCZxm7gMxu4QwjI7s15TP7EOaKDp6b/PCVjw4HZiKxb1YctXc6h
         GY6UwSaE0kWN0Eca0/hjfl5E5+XXBH7PjVckW7FRGUdya1Kp0M6A7qt/i8B+8At5a8NW
         CnsvWQRACkACra/pOT51KVsLkdtSstr9eZacNYvqoAwhv60pbPd2gMFxx07ERfwKzMLt
         +IQIfTBFki/2Vhi8mTypBVq02PziKzkfu2CkCwk+zGX2Y3qOBgxIeaIrS+CLBZrmNUXI
         DEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
        fh=UxCkpsG6nYhQE/o1sGcRFYjRryelWO5TRkpUAhaKQMc=;
        b=K48expPtKQqxKP1zHeXvJsyzniYjWcYzhPINBdx7GBOzngT5g4/8mE7tfTMeU9pLE9
         c5w8Ct8iy8OO+Lao/tkbXCOOLkAf8yEpI08+FCjskak80Wl6bHzCuWa2WysCHvNtdcr7
         5zC4Ss9a0X3syfx2WT7UqKlvd8BqxxfGuFKMX4fjCxt40bEVuiJ4rr+b1YX56QU49YWs
         mTA1e+nSKBKfMZ9WFaSICBHRyPToxV2JhF5ygtNBGfdqTGkUexzpvKVCWiAq4Nz54QQB
         L3MO0oEaouwpBcuhNap0dAP7eZT1uGsXhoK4RUpUCI6qamgsfWUmYBnBcrjwEb9+ZUxO
         J5OQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788266548; x=1788871348; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
        b=WP8yHs1ZJ6F3DqOFSZF7f5mLDLSaOZgOXE1egF2FqkzaHXQWbk0x5q2SYHqCjQ53c4
         sZfNN7Iq9M2UDDG94HJCHH22rF9OBz0U4PC13mEp9EBtu/VsDvq5t6jS4AW0Za4wn1N8
         PoafNmo+faCsCuTFMQlzyJI9uOC25vedAPHEXNM6bjXI380dDGMlFTxZkTj1H3Kh5p+s
         SiWYDT7q8gv2thXxpbcD89oA5ZC0fE3cTflvR90/MgxpUfgf0C82053cZGzrdl/0+zqm
         s1N5qxTYTptMCUI8n+dQTnV5pY7l+mObYIVlCwa+nXENPuA9N5cGeT3+eMAle0dBzwnr
         eBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266548; x=1788871348;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZreO0EubD/Cpg2PFlTmnjBPWguJk/VPiiKkxH3gIp4M=;
        b=iiYdAST2h+eCHOdZyQKkE00yOFTo66vwP1oGJxDuKcQUHJ+TPOx/i/qtysxpQHbsHy
         5wVNfYNK5akwcdAYo5UjtSYV78xLhl8orM1vrXeHclN5AIOWJ/SCgkixPfRvGUVN8E/x
         qhGqAP0PKTfedy4NvkKnOQ2MQyTB6kQwiZPIp0GrZEpEeglnVK3/z7/LsnXZ4TltYyzV
         ge7EdfmBLYqxTqH+qinMMzqhtPRQo9i0QhznZNPef+zT2e4fVO8gp8PndweCmHSA0OX8
         f9c1rTb+noUSjRrErSlNWXhwOYRWELzBWs9YtEqhapzO5t07dRPDw+hNlR+TEe5hwQ99
         iWXg==
X-Forwarded-Encrypted: i=1; AKwUvBx5xK6efuzjilGLNs5U9t/bSta27iPI/e8tYJag/V0APuurb9vv7GQNg9otCUlILtwTdaso711gV9Tef4U=@vger.kernel.org
X-Gm-Message-State: AFuF++lVvapRX999gS0tQOoFaOK7cLWd7T5OfXRzrBjceJLkmL3BJFmu
	TObYzTqiEHBRgrm7dUIDJxPq2+6QePFSfcby+5wq5D/qbthcYi5o0qespPrY0QES1a9EF6lP8MZ
	BYSrzLLKInmhyKRDc3swUONxoloX7fSc=
X-Gm-Gg: AYBFou3MzbnqnQau/M9taNlhhO8l/UuweZi1jbDv7SJr8HcmhtnlO+diKU7XwvP7Rjv
	taRQnFSxp83awVkDb2GVi2sgw5jjCG5y4yqxuBM0lYWExPTgGL3jvHwM5MIXYQ2h2nCqPGVMb4K
	nKswRY1gIqXCkbNBLO/6GCG/OrkS+FiRl3IBZZloCQMw3+CbfS5oBAWrQmyinTDEPqdAarSDQb9
	nDd15v09qL6xhMBMUy7YLNp3vI4SvA0Rbnk+sjfoMDa6weX7pyhLyt2TAxQykAEQ0e3COTXLdEH
	AkaUVYq6IqFSEvBNJCy+PZOXj27qP+BLiuDqbicZelSla8YQOAV+VjcNm6kGIuKaX00l2edNf6d
	chNsk17FO7ZTKfToEsPNUNrLxlAAR/vCu2LmtkaJv3/7jusq0wb/3oXuogUOu
X-Received: by 2002:a17:902:d2d0:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d74dc08a13mr304207985ad.1.1788266547835; Tue, 01 Sep 2026
 05:42:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-fix-pci-irq-vector-index-truncation-v4-1-f94aa6932fd9@hotmail.com>
 <DL3XDBBHXKKV.G9P6KRSSX1DN@nvidia.com>
In-Reply-To: <DL3XDBBHXKKV.G9P6KRSSX1DN@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 14:42:14 +0200
X-Gm-Features: AcwNN1VnWRWOYROIxu4T-i2jI1d1fjW-RoGFUjjuLdYxZ3xRyTDBVBEFMSpQ8Bo
Message-ID: <CANiq72=GvH3KwsdTMtRq8jJcTWAh83uj5L3qD8vHbyntgCgoNg@mail.gmail.com>
Subject: Re: [PATCH v4] rust: pci: reject IRQ vector indices that do not fit
 in u32
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Sophon Zhang via B4 Relay <devnull+aiqubits.hotmail.com@kernel.org>, aiqubits@hotmail.com, 
	Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, linux-pci@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 12:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> That makes me wonder, shouldn't we make `index` take a `u32` directly?
> If that's what the C API expects, it does make sense to align to it
> instead of forcing users to make a potential unneeded conversion if they
> already have a u32.

In general, Rust users shouldn't be dealing with C APIs, so if they
have a `u32` then it usually is because we exposed it from somewhere
else (e.g. we returned it to them) or because that is generally the
right underlying type, in which case it may make sense to align
everything.

But even in those cases, it may have made sense to define a Rust
newtype or similar instead.

So other than exceptional cases, the types that C APIs use shouldn't
drive the decisions on the Rust signatures, since they shouldn't be
seen by the Rust users to begin with.

That definitely introduces some friction on our side, but it does give
us a lot of freedom defining APIs the best way we can, which is a
major advantage, i.e. since we have to provide these abstractions, it
is a good time to be able to clean old decisions and improve on them
using whatever tools Rust give us.

Otherwise, one could also argue we should be passing the underlying
types in general, e.g. even pointers.

(Of course, you know this, I am just elaborating; and obviously there
may be cases it may make sense to just use the underlying type since
it is something that has never changed or is fixed due to some
"standard" etc.).

Cheers,
Miguel

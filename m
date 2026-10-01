Received: from mail-ed2-f33.google.com (mail-ed2-f33.google.com [74.125.228.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFB05187C8
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790863694; cv=none; b=Oy6VZ65qxqeSUtHKT19Ck0HKzdBCuIrt+xntykRKQEpwQu+SkLbdAkTwSE/i0jLbagdNP20WW/GSjPz2rcUChohbkmQTFDjO77hNzuxGv6qeWc2bzbvxqFYMtTPk53v2PAwPZhnjrF4bZGE+7gM+4mz+OdEF8eKBq1McmXkoFaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790863694; c=relaxed/simple;
	bh=zECpyUBkuoTFGnpwSyLJZls4RBh3ZrxrUUu2x8F+Hms=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IwJ3gT/mUrbfR2C/Ow00yPXs4zRaZYwRNUNLszXPAdcuugVP5X2e9dtu8KZJog8EmIkbvaqN02AAUd79rUyFlWEd4rPFtrBNScGkpEA8Iu7+tqGKLwhTvu8+44pqqjTf8O2jr0Nl1UJxQFapgAVFr34lFGSx1JNXoyXCBZbJ09w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oRfj7FkH; arc=none smtp.client-ip=74.125.228.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oRfj7FkH"
Received: by mail-ed2-f33.google.com with SMTP id 4fb4d7f45d1cf-6ac768bda6aso7809140a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863691; x=1791468491; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zECpyUBkuoTFGnpwSyLJZls4RBh3ZrxrUUu2x8F+Hms=;
        b=oRfj7FkHiu21TkuJzLEjQ1WBZAQCtT34TaAQiM70+g81xaqgv4HrCXysAoxBMuNWvE
         n78oFjsZPhERWcCpn0GIfGfM3n2/cwzJrWDMhl1Ok9m0M9zCJxUW6I6ofQghh/RrL/Di
         FQ3H3lbnZXxCd/EiIVVPf1PyJ5Fx5cnZ2AFLxYFaE1HJKRmPssvs9Xkkb7+Z+4yggMKj
         k20P6SEwcqJKc9EgxyuIWnN4Yr+4subazOAxjj6BmRlqdIkmeGDS5yXqUf52guMhngh7
         SggepNmp4yBLjZxCDGd4UQJ8ITJfGhRqOvLrjIhV9wgVBun75ZGzFHN+TrzHdHz/UZbC
         wZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863691; x=1791468491;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zECpyUBkuoTFGnpwSyLJZls4RBh3ZrxrUUu2x8F+Hms=;
        b=iVln8AqOSD/jFcaXAkRUbWWS9/qd/Q23nyWTAASG4mrOTx5OKBEQ1oMHtE6W/J9CBl
         HtWikkBWsZIc9F72JnC1QFgzB8XEG2T+4OQCHdvLD3y7qcuNF/4LqJ0MZUF3OGEbbZ14
         Cko3fWcDsyxpWJkoBMwFlzLqrD83847KeCHmC8k+zgNM70Kss09jj7l7UxRakcDTvAF/
         08QE1mKwEWxchyFp3tgClPyCXW+rzcRW0MbIymzbfaQfYArSRoYCvmkV5oG8mWtOYRtO
         nQSzScr0P13YA/zH7SoNGalxbjHEtf157Rjr2CnKW83qp/VB0HMa9HqemO9cFAcSyRgk
         gkEg==
X-Forwarded-Encrypted: i=1; AKwUvBwtG/kIEMaA/LpMFm4rQJYLA/ZJB1r3VsctYUnQXiRRbzbSc4dcXMTtK+R++JN80TVIrRdxoxQDxs5mKs4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKs4aKVxrWV5VuzgC4jhdC7mCP36nevt7Q2xa10YVnh2vnEHpaM
	1ZS9bYWLJoncTT5x416fphblBFCykqiH40B/FZqcyFwqo5XhXDeuwbk=
X-Gm-Gg: AYBFou21OzuUlfCtkE41qj0ahyCAL+M7+uAYsU1w+PGyqMwL2aGGhRmFTg2knZYuiYh
	SKGb0OYd370NqZHMCRgD9G5Eomqmb3OHttYwUBDWav3YfLue6yBUikKy1rVXw6RBnki5YTbxiE4
	MiIIVNwiT4Nh3gYMwDK0lBnw0iGxnRCEZraCGjozdX3eoGB6BrKYqKHE/1d+GGD8IDKtJ4oeuHS
	TtFTdD6GBHTnMYdMNBZCmsw+xEMFw0Ihw5SxyFikALqbbls2JFif6JH6Sv+SYizz3k97jrowk19
	OJPg8FKQHoR8PfzyfTot3rEOKw/QIXnliUaLgvoKcSdE5AryKL61wEUM8+UFkFIh2D5emJEltJS
	Nf8ubg6ViHFqqbisqp74uk1p76weDJSV62QBgJl6Yxb0qJSSBaEDXGbl5Ci11buliRcWy1qeaYt
	8MudARSnprAyQMYF/pJNUEUWJFH8lSR4+tBAMUZAvlediCfI5GVbmsFr/3oxzZ5thrxXxj4tK6B
	Kum1IiV7YMjDVxrASDpt3vkKpx4QHDVmj44uv+QqVcp
X-Received: by 2002:a05:6402:52cf:b0:6ac:c4fd:c726 with SMTP id 4fb4d7f45d1cf-6ae1995216dmr3927218a12.42.1790863690562;
        Thu, 01 Oct 2026 07:08:10 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae5ca76374sm1111911a12.30.2026.10.01.07.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 07:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 11:08:00 -0300
Message-Id: <DLTK6X5RFK4Q.1OW6JA242CMRJ@gmail.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Boqun Feng"
 <boqun@kernel.org>, "Brigham Campbell" <me@brighamcampbell.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Jori Koolstra" <jkoolstra@xs4all.nl>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Rae Moar"
 <raemoar63@gmail.com>, "Shuah Khan" <skhan@linuxfoundation.org>, "Tamir
 Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Yury
 Norov" <yury.norov@gmail.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel-mentees@lists.linux.dev>
Subject: Re: [PATCH 0/3] rust: kunit: support #[should_panic] and same test
 name with different #[cfg(...)]
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Gary Guo" <gary@garyguo.net>, "Alice Ryhl" <aliceryhl@google.com>,
 "Burak Emir" <burak.emir@gmail.com>, "Brendan Higgins"
 <brendan.higgins@linux.dev>, "David Gow" <david@davidgow.net>, "Miguel
 Ojeda" <ojeda@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260930-rust_kunit_v4-v1-0-e3b0d45311dd@gmail.com>
 <DLSQJS2QT4JW.3BPUMU5M6N171@garyguo.net>
In-Reply-To: <DLSQJS2QT4JW.3BPUMU5M6N171@garyguo.net>

On Wed Sep 30, 2026 at 11:54 AM -03, Gary Guo wrote:
> On Wed Sep 30, 2026 at 2:23 PM BST, Nicol=C3=A1s Antinori via B4 Relay wr=
ote:
>> This patch series intends to implement two features for KUnit tests
>> written in Rust. The work is based on a TODO comment made in the
>> `bitmap.rs` module [1].
>>
>> Changelog:
>> - RFC patch: [3]
>>
>> 1. Supporting `#[should_panic]` [2]:
>>
>> KUnit tests in Rust follow the user-space syntax, but at the moment
>> `#[should_panic]` is not supported. The first patch of this series adds
>> support for the attribute (only in its basic form, `#[should_panic =3D
>> "message"]` is not supported yet).
>>
>> The way it is supported is by adding a new boolean property called
>> `rust_should_panic` to `kunit_attributes` struct in kunit/test.h and
>
> This is now more general than Rust panics? Perhaps this should just be
> "should_bug"?

I used the name suggested by David Gow in the RFC Patch [1]. I believe
"should_panic" is better because it directly matches the attribute name
and will stay consistent in case the panic handler changes the way it
trigger kernel panics (although this is very unlikely I think).

That said, I'd be happy to change it to should_bug if that is preferred,
please let me know what you think!

Best regards,
Nicol=C3=A1s=20

[1] https://lore.kernel.org/rust-for-linux/d20cc2b2-afeb-432c-924b-55ad00d9=
80fe@davidgow.net/



Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0E9477E31
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768169; cv=pass; b=Fs456PWGcDEhCCENfu6mkXBJsyk6likDMsDJOU2pxTnrZcqCXvKLaurEp29NwtK2kC7UH1TB9LsOwqGq2/GS7M3LgV81cLd/JJT3Smfav1clIdk6lN5S9gD1CSh+X8/VoxRHyEyz6z83VRKm7Fl0ym5+O851NOmqYNg/DA0LVFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768169; c=relaxed/simple;
	bh=zF1aZ67Ju5HSyYBd6lp0FvqcV3RgRMD7QVkQns1YJp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TKTFf196VTknG8n7kt2+EGpamMLw71YiZLgv0G68Hy8BGC0Hrj5yZKbJCp0Ixue+Fg+c9lAE16USbWHu/1uknm9AwVSqqz0RlydeAaeaCFcFOEKXHrYzSpQJ0aF9wPpc9JQ97A3EFlHnjPAYH/RUb7JOncc+Rc/mS9GqbkpkUzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+xk2BSC; arc=pass smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+xk2BSC"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33bc6ff6cadso737548eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:36:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768167; cv=none;
        d=google.com; s=arc-20260327;
        b=U477RRagX5lb8c77x0m/ot4eIoTJvKpQIICPQJik+Ip0dsl9bBv9XU2VzJx60n50YL
         9oV0KeSgHwqlGFKRXMiyoE3UkMfcd6qLdCPwvxbhpwZem25v0v5qHLLoyu22G2sUAcM0
         gY1bLV3MkYKa79KV/HbokNXWPUlOuxKOgeJs+m1YkogTocK77h2i18k2f0ZpXQNLpGCe
         7ELpxfXQIB551Wetpw4QFqxEuNOVe4APV89Op9k7vI8vO1hhnFvFnKR2vx7UZLZ1Nmhe
         iE12qah6mlSZmdbugY1dYXtJNmmMhqAPN3i8mL02FYC/40top+m5slgctsN3lFE2S2jK
         0KgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        fh=epd+GViAzT+lmKUH3/bBtk2Lu6f8AsABeJeajIs7q5A=;
        b=fJhnDsMLiHfm5+lt7lZst8ksxrEWcMymh8z0EbBj1eryKQgfT9+A/0rvVUAnrJ5i/Y
         uWkt7ke8S2KTsj9KQij8Xr+5BbXd8JouaeJOqYY0bjGQ/fGQcClgZkOIu0D9eapFh/n1
         8BiIFFYiUVj7Qnh54j+TbN9CD60TNi838V/yDQgrqv9D5tWSRhq6oeHmeHQgb0qeHTpx
         LnGCAsqjORm9F+qCVB+OIJxrSjufQKca0cNJx5T02As+zlpPujsSEEIir1/DqG6L9Ixi
         AwW+8Xy7NOwcxaF6EChMVqNq+GzsoUuY/qwia3SrMN9iYKT5hdVOR5NXe1vo2xfZfnuX
         3gPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768167; x=1791372967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        b=M+xk2BSCTP/CYuGTKUtIj5g6qS1PBAcEDpuQObcHU/pEFazJjA9GiV7cIq5lEssUgu
         0hQBxtL6WUoBqfm3cPm7RqoAeXuqVch1uSBvQij3ChtcNSOKb8zOnoMQPDZG4HdK0Ma/
         TV7zuRx9t7GQQaMZeqjGLGXhmryA3/KzvXwAwSc8kdELLoJ9U4k7cDzuRa5Fl4JFDYB2
         nHf/57mato+23LJZZns/xdi4FfARz8MQDTbiZMMXiH6n2OhePBjBzY1whbeA1YvluNZp
         UMrp9hYERc+dPtpWQRMB/dOKWIJlJI4Y6bFen6cgnq0g2+JkPus8ypBZDqM4tszqQm+i
         daeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768167; x=1791372967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eoFXCdD1SByAP8/MurFAuievxJCdo/nKRYK4zXMXLi0=;
        b=of/3okcOtPvsoBby7J9zv/WI9TS3PQ9kN3ZtzTcXa3Jf5P/e+EBhGVqHn4sSuoSh/3
         c++/sgo5VQYW9YdrHVr2TJLO3O5NPygUqxczgRpN10tNAo78d/53XM5krmHxFsxtp463
         BD6to5F7OTT2+M+Q6mWkhKoCaaIULW34NUtvCEKrwW+gm3AzgqQW1BD3Gq9nh0uE1xhT
         87jZX27DHcZb0gfsflJInEVhfXGkcLBgODNEzJA0+p5DjmJSkRbZkb4dg/L7fv65pld0
         qDf3wBT5qBe9nwDa50FkJgAK+YkXhofRLTfPybO9gKbO3nRLhGhSu4E6k2eeEOZ4oPGy
         6orA==
X-Forwarded-Encrypted: i=1; AKwUvByeGrQtNZdOaWVub5SNX521XCS0ewH3qBWFZkdxq0uzjzmm2X545RUlYz3reSb8aoceW2M8qwd4Fxxo47E=@vger.kernel.org
X-Gm-Message-State: AFq9FYImGH+Af30XhQXs6lO/cgRVheOPIdNRTr7mKGWz5YvS4yke7xUf
	1j5qPW1nZhuwpeUB5xva71RyVI2QvbDpgWnaLTB7muc6UV26356l0AKD+1qB4l0RCdX9H4I1GUW
	AWPxP4A44MHWrw5peMlSVMHNgZS1cRGo=
X-Gm-Gg: AYBFou2cYC0TvyfmJhfvSu3/u4XF+obZoJkNVIh0tsTJiMub1MnUD6MtkKVbEdm/tUM
	q5RPCmPrkFuIrlwoY/tKcrqGiDskeNbSTYUp3DAyK5OLc1q8JGNEc171nrjumUb2k0aoq/W8DNX
	i3C+pHL4LGQsth6dDlP80O4AtOlwSiLV0wxhUqYlc11I0SNMUA+5SV3VXrIe8NUxPsXOW7fZOqt
	0UTRnzGWqLzdzDoG/+bhpYGfb5KEE3yL4T9ugvwH1bTTj+Z9N5Zf0Ta46+wF5FUlSJeaC6tWTo4
	5t5eUnO2Waytnd1DNQ2kNQRNYP8zBI1sDOjP1GVczETTmW7CUvscOhi6bZGF7EEj8D1TGYbKePs
	A4TDEA/gtcdmOGwGXRVJzNifPhMW5Xu1EQ5ANBsbg50NgN4J7kITUNxqub9hJ0853MkYSLQ3hJI
	bfVT8FkCUvQiUIsIV0dvdY5R/3gOyF9kcNHaO20weAzSax/zNN40I=
X-Received: by 2002:a05:7300:4fa9:b0:33e:8552:6e06 with SMTP id
 5a478bee46e88-34cd6003e42mr2202125eec.0.1790768166558; Wed, 30 Sep 2026
 04:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924005052.2805129-1-gary@kernel.org>
In-Reply-To: <20260924005052.2805129-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 13:35:52 +0200
X-Gm-Features: AclHuK_yuuwCg9JinboBNZ8Dm3VmJy-wdX3R3QxVkeuHJ_HWhUIjFv8RJNFLV1g
Message-ID: <CANiq72kpkVJbi8ud=G-HjMmTBv0o-uUuk+qa3LTVjKgKevL7bg@mail.gmail.com>
Subject: Re: [PATCH RESEND] rust: doctest: trim function name for reproducbility
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:51=E2=80=AFAM Gary Guo <gary@kernel.org> wrote:
>
> Currently rustdoc will generate function names like

Just to clarify, this happens only for Rust < 1.95 since we use
`--remap` which already  it in newer versions -- I will add a note to
the comment, since we can remove this on the next version bump.

But please shout if I am missing something.

Cheers,
Miguel

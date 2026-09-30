Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ABB31F98E
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790763918; cv=pass; b=HG2jDKuhh6tSuzDZqrLFomepVDxhxjU1HchbYcbynbANPIOGcmBH3K3BN2IjaUk0A1PdaAimCTtU6cEptS3UpoJHj8JhccYCPa8GgoVHfkJlabDe+9BWep/kTQusl5Op7F8heJk/SFj8QSUIOmIW2/IiT7U0UmZsVhozi2KlV2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790763918; c=relaxed/simple;
	bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UzFsVlpTfCowyllJGxcTRHSTGkcaQGSbn7zFueyDPLjkjc6KR0RMFeCc51XKRPzNxufGvMAcsrBvqyLaosSehUIoqjNE7QStwfmi4EljW+lk1JNcoGWWyCTjgTkHamYdjjy/jaWgURst2aGDInMeW791T/QJdCLAT2Wr9rhoVQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KWtfpqn+; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KWtfpqn+"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-343bdca7590so205193eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790763917; cv=none;
        d=google.com; s=arc-20260327;
        b=WOP5CST7G3MKny3kKwSTOSqNN+dfr5MD0AzdvyzSTAAN0HnHyU3YQXQP6fMZZKPDak
         tp6/dvc1Xrzd098UhzLgnWsJBmF82XqBd7BL49PJc19LGFbwmsVvcG06Meq/9qIPO4ou
         VLPlX0dThMHRd430aszfqzLbJhFMs76psZA643Nzed4QbQPHslhVkf5zxhOt2N8GFS1z
         6LP0iYhnV1mdoqkFYk4qdQWKb5Qn1TED/uU1nbwsnwCz4eQFDMa3ndthomkHmR71iWTz
         y25qi7efk4zSXStsBov/vwZzYGHoGIFuBnxdN5m5NsyWt18ukyml0mIneGM2wsRwcvQ4
         Q/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
        fh=raMI9a4MqTrFISbr6d1iotD8HrhEASCVOYzzurrUGSs=;
        b=Rb9pxu9b3fccqBdyjqNwkfblQ2X38XiFdAjtzxjFYSlH+Xs/Wqm5wUM1ZM5AyG4XGd
         vvrNdqcpURhSRWxK4dk08tHkiPNDOarJkLuXXK+rOmUDYbqTzbqL1ze1HavPHCmV7HX/
         oxMRSLz1dtE1327TPgEB8YjmObkXlfSKgvPPcz7aaHYuetMsEEIAk1w7haUjNmomNtOg
         1IT8J7Eul0hbHD3Zy6YysHVgjnAnpEIK8yupD1/bmrcBlVQTjZegAL6YflNkL720rkI+
         wCUjhjCcOeg5Tp/4cq3te50WhtqmeyeZ+QDBOvS05YZmO60jyeDO1bgDfhtkAJeDwdO0
         +ZGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790763917; x=1791368717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
        b=KWtfpqn+MiEDSxElROEkXnhpxWnj/WeM4n+DWGyL9b0Vlym+6J/NW9IV+fI5aCsFIG
         2plL2ED3CWJWWBQNsX/zBCZjQyj9S5PhRLxkmlpmcvKAuDbfqf+ruhY3H3Omk4SY0B1q
         o1C0nxl9D9hzSATzyuOHMZ4Ega8XKYy8lA/9bNTD34UR5wOMAjx09vitDIPhDd+6tcrl
         QPzymo4Cj+P5Ld6i3SNdCaRyTEntzPql+KGYG1QCXWbIDL+OwmmcpzL6AOwk/1HDsJjD
         BBmN9xaFgbFGoJdbsob3NJncKDOBJLjP/MpaqtEg4DIkwDH8JJBqNU5wLFnp4IAPYwJ3
         qFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790763917; x=1791368717;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BckQeqCjf5DtL02w8iZxJTDEf4ptNGWbQZiIUkA1OQ=;
        b=oPy4KU8oqQMwSpC7vmau9lLegMhljTz0IeygAyDxeDuTS3OBdOLjvM4v8YwAYjgQw7
         aTxolED1li4+jhd+k5CqT90aBYXlIvwC7OcHho3sf56pLQSrX7hGcCeWBn9WojyOG11u
         cQnobnrkZmccgoW3q2y0Pi+NBK4y0zwQ+qdiPbNygGt7M0xJD8NcdLMLJOuo4dMo5bGR
         wrGOH/VCPvBrIWHsbz0oI/ZjX+MGKgC8D9QiavOq7+fkH/dVv0ubqnki317Fo6KZatR2
         FyiwqtdTcS05ZX8dBpeL/jHIIbHWQTtl6U01gEYAMxg/CqUTMknHDyocPudQmvbN0+ub
         CfpQ==
X-Forwarded-Encrypted: i=1; AKwUvByB5Oc77ThPjNirqPorKcnXJYlMatR8op/38slgECtFaF+vrhcov/taO3ke0kD5hhYOZoYY9fJ2/FZNTI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ5hf9dBiAiAYjLHf+3hlwAX8voQu/yHTLVRpGORfLtctvciy74
	WDPF1eCbrmG1Zns7FNLjN0IZnXw+uAddNJZ1865OsoHkTztIzxQEWpp3hbxemOIkBDKXPHsltNp
	TZXDVVnGVuixUUFbik4YfDrYN4vAnpig=
X-Gm-Gg: AYBFou3Lx89kbw1MhHkG8x4QwQHAKbRE+BSWH8I5PJQEfRacoTTc0QsU1ERZwhlbyky
	hjdNBP2LIWCORScfAdQbiNdTz/djcQ3l+d9YQs0JaC/LYhAAEvpI/iE1B7dBjNNf5EmpYXNEyc9
	MaZZudO3f/VKW5r7a47UAy/ZUazC00iyMlqwYl8zAtNiBJBw8W5pyrgMt8xdc34XlQ6OyhkXryh
	P1DJwtU3emx6wNml9joV1XuKmzbGo07xW5818n4CP9i3ONjaSYgKX2CcY9htaWj5bD38f8AT9Ud
	tGZIDDI2ORVSZaQsxFfHKu1FBMkMOZfDIR+oBV1IJt9tyODlxu6XHCzenrT/lLhU5wegz9CYF7r
	j8fmuqrTLUb6LBj1claNsKZ7dH3foFS6A609JabzZ1o4VOlKVtGgumMTkjk2YmtJatny3zG4zQY
	skiUlDYvaDO3zO5N11uuEpeGCZUKFWtDgRdqTtWYZ5H5fnrUxILOc=
X-Received: by 2002:a05:693c:2808:b0:34c:3ae5:ebc with SMTP id
 5a478bee46e88-34cd60f8956mr2288650eec.0.1790763916685; Wed, 30 Sep 2026
 03:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-0-e968ce5ee613@kernel.org>
 <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org> <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 12:25:02 +0200
X-Gm-Features: AclHuK-9soeSKJJsB6DKjyrXynv8FkCP8rCSGYJyZXnDc7m1U0RM0WwdazlNfrs
Message-ID: <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 9:46=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Yes, this one is independent. At v1 I had 2 patches adding helpers, that
> was the only thing relating them. I thought it was better to lump them,
> but maybe not?

Thanks for clarifying!

By the way, do you think the new header is worth it instead of using
the existing `cpu.c` one? If we do that, then we should probably add
it under their `MAINTAINERS` file.

tip may want to take a look or give an Acked-by...

Cheers,
Miguel

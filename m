Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793432886;
	b=Q177WohDfwKeuqBhIUGs2qX1I7LINGQ2dgr+VmO6tvD88hJilCTBARXoVPbv8xLgMT2d
	 YQ6lUFCNUiap8YY0Qjy9I7LGf8reYdjlPYvmW6mwL5zdnjQXcSp+gcY+WArseX7BmJ6VB
	 Wk4b9oQnjEodd7lPPEZ/oovfZqm4BJ81lzMDiyAsRNND/agVoTtKlS+DSGdM0EzHQMDt9
	 AFJ8+Cn+yymwccJF/IokuJUy7WydaKBXEhp1Bv00GBJORYTFb7sxjgG4c0Z6fhB1Eikow
	 1R4gzPXTnI5gWUGjAlz+zrEeONbC0axOFprH4H6LUh+Dupp1ZuQvHLeQC3Lgj3e6r+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793432886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=74V1NBIGjJhQuSUk1h4e3xvSxs7OjlFC+hpsJiBGmnM=;
	b=02ab0Vtyoq8DwYwm6Uf+lgY0+UnAniydrRPGWrIpCxuILyyNSmf98TUDBFr1UVapsUnZ
	 91jhtjWgO6u5rQetjdkUEf1Sqr9RU7ATkHX35ffKypZ/pe3JHBawankhvsJ9TRYUVG475
	 nMO9yOitxsTQCRjErXywBOLlwxZehYZ4F8tchT6T9220SMNyd5CsHF64w1P2t8ensCTZw
	 Rzm4QL1kXMNdjwPpPNScFBQe6IZS53q9sTnWuJiej/tbsq5Nlpm+yI9vf7bKfuETS4elf
	 hyV/s6wDA5CX7afAmrjqf0W26FXSnvi0wt40XtIk+sWMT7MxMjMVig05dpZypg7OKEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UGq62yiA;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98826606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 07:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98826606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=UGq62yiA
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso164016466b.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793432883; x=1794037683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74V1NBIGjJhQuSUk1h4e3xvSxs7OjlFC+hpsJiBGmnM=;
        b=UGq62yiAsCHbZ2NlaDbor4G+IWiwn6vRFyj+sHuuVA39qNZkdJe2rwZ40MRsjUp5gg
         0vTZzjodRGNv9RYr/oQkNGdOI9zRr9qHmlSjQHrgyeg5ZtB4OPZXCtZg904OxZt1fiIr
         OeHwh65HO3Epfz8J1veNj7jLg1hbUf0sOhUmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793432883; x=1794037683;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74V1NBIGjJhQuSUk1h4e3xvSxs7OjlFC+hpsJiBGmnM=;
        b=oVanM9SibawKw6l6D0YzZcA9cqdfWQElsaC2KJBB525AkhtjObKZWcwB8IYw1TU9Kr
         dVUfKN2Rojc2oq8eEICzUhcpvcGk3+RdItuXNT+V4q1IIbkCDbjw54sV0+re6LnZ1UC8
         CNN5F/5I4oKj4SRz3A5Y973EnJZLGSZzV44e/hg2mkU6NJcpeUwD1TrNRztUMJHY7Ky/
         E1m3qa32M47CeFsrcRKLC157xWcbk+6pE+WlYiL+Lyq2TYk2jJk4XR+dupqIVAC0rXXT
         DJ84tIoBK90F9mj7TIePlmeMxKu6KfRKOqMXElBbIgTYo2rJuYxkzUU3CispUB4jaPXj
         IYAw==
X-Forwarded-Encrypted: i=1; AKwUvBwvS4umQwBrONIAllkIkG8k8AzoscX42lMDwHQFpu7TWrHjcgiazw8RrKNIxez11jEm2tRIeNinZfVIjLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoqACoTdiPIltgj8Ig8MLRsVYx6DdPJH2PAKRh5W8/Q3zaL4/r
	cl3aCvE294QxBj/vcy9J3tyHrLbEfo+IeFXZkk3mWZNr3sOID9kuRTgevBzMs2KC3G0Aw29NGpk
	NMqDapzQ=
X-Gm-Gg: AYBFou1QcngJ9Tmp+lWkFTdqpyxSD+genryVet4PDpG6WkuxwdiIFD/FTVCW+vKvrpW
	/nh3hLIdd9szLSRmfpM7BWKIzJjIBm/H3a8oSzNnvcQ9VHzrU2tMH9HQZ7qtbQV18WF/HgTeNUA
	KCPY6WzkhLzah3bKIJ39cdNzO2aVk4JStWxio5AkZZ0ERAXvUMGYV+0lqqbITKshFxkm0z6eMlX
	ywB4X+Oh6cro6yxjohu5KXyI31HI54Cj4GqMv+kwSkm7fDtVe/PVeL718m3848PUexXRdMz7CTM
	BZXvNQD3k/zNwLN/HqbIkN1rwYMEZcI/jE8XIH6EFwk1x2toaawXC7vciqGVFRSA6p3PI+IjGI5
	SKvnU1/k+wA7Cy7bXZJyP4Q/yeJRwbTL2urAdb496J7zi11/NtGTV8QJQyvRJSe89RZV4Bgb8S4
	fFx/EXdsOzrFgYlZPJ9RIH9hySzAvfpdXmyGeo4YssRBk3VhijXEBj6OroQSV7uTxVlZ7RaEhiE
	WsHV+MkspepZvGdTdcrlBn71WcU5/S3/TTzH4PyCBrd6AHPJqz6Gs2JTZASw1ERHAgq1gcru+3p
	Lg6HD+NDcgAic+sVGZATDu3iF3L9DC+h9hTlkJYRHPK3y3NFJx+YrZjAFuUtDATM8zB/rUUs+WC
	xu4A=
X-Received: by 2002:a17:907:9693:b0:c49:ca4f:ede6 with SMTP id a640c23a62f3a-c4ca792e78bmr375732566b.2.1793432882802;
        Sat, 31 Oct 2026 00:48:02 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0fbd6sm779973a12.24.2026.10.31.00.48.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 00:48:02 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4697404c2bso181848366b.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:48:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByltuFqThovTn21+WjSFS5kz+k0bt7LZO/QLLQyuGOaHbDQ/s1dnpLgyW/4PCZgs+S0PdxBiVsDPuRpa2o=@vger.kernel.org
X-Received: by 2002:a17:907:9693:b0:c49:ca4f:ede6 with SMTP id
 a640c23a62f3a-c4ca792e78bmr375730066b.2.1793432881922; Sat, 31 Oct 2026
 00:48:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024185058.20410953@foz.lan> <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
In-Reply-To: <CAHk-=whVSx-=wUbY7e79bgW-C+m27+ON+HLm13mKHJBfBgUqOg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 31 Oct 2026 00:47:45 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
X-Gm-Features: AclHuK-PoafTkfrw-_O-xG5p4dHxh4twzZ1rG1r_WKPFt1VL68cMWA8bARoVDr4
Message-ID: <CAHk-=wg0+RmcNDKQ4Qf82-miG4gjZ+CzqjTBET1ZZhkrPBp5Kw@mail.gmail.com>
Subject: Re: [GIT PULL for v7.4] media updates
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Oct 2026 at 10:34, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, 24 Oct 2026 at 06:51, Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
> > Sakari Ailus (60):
> >       media: Don't hide I=C2=B2C or SPI drivers by default
>
> This needs to be fixed some way.

Btw, there's something else *seriously* wrong with the whole media
tree in a more fundamental way.

The commit dates on those things are pure garbage, and all over the map.

Look at this:

  $ git show -q --pretty=3D'%h %cd %cn' --date=3Dlocal 0d2ca6403186 0d2ca64=
03186^
  0d2ca6403186 Tue Sep 15 03:01:28 2026 Sakari Ailus
  63c578491cb4 Wed Sep 16 14:09:38 2026 Sakari Ailus

what that shows is that the commit date of Sakari's commit
0d2ca6403186 is *before* the commit date of its parent.

That is impossible.

Unless somebody is playing games with rewriting commit dates or has a
completely broken machine with dates that are several *days* off,
because there are 11 commits like this, and the worst is off by three
days.

Sakari Ailus is commonly - but not always - involved. There's a commit
sequence by Bryan O'Donoghue where the parent commit is three hours in
the future from its child.

Time doesn't go backwards. And if you have three hours time difference
(or three *days*) between different machines, you need to fix your
machines.

And if people are playing games with commit dates, they need to stop
doing that. NOW. Because I'm not pulling the media tree until this is
dealt with.

                 Linus

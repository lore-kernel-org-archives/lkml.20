Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7D647ECE5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158710; cv=none; b=o+5LSwC14XsPFo+pfTRkGxB7SDfZgJmL7fwYTh8J8pS+buYzYWWax6b5O50Rumq5H7d3gPFZWBp6xPmOuHdfZBOqZY6k/afL5EvMjaCMwE16nNXuIRa74KxtD4urWC7jUyynEgAwt5gD4wdlK1QHAGeA/r6EtkdBGrNWJRUJE/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158710; c=relaxed/simple;
	bh=Cw4qUCgB4oS+hGjTirBsh6bImAzBppTQD9nONJcjvhw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ohnJ8wDAq0cswxl3ocGbAuEggP1j/gbKsHP32SBMswCz4X+g1WbjuzXS4uTfL9k78BvdWws8/K05hlpJzqOnyP2rTkuPQBfISzylDKW7pny/3Z/aetSUrsXr7bGBXpjlMu5eWUDxLL4L5NTvuouYYq6dv7IfBTOZdT74zAmoMMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5qJf8Jb; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5qJf8Jb"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ee1f9bso3564975ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790158705; x=1790763505; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UkEzU1TrVb7LM2qKIN2UAZBeduPofA0aR00sq50xecU=;
        b=H5qJf8JbkJ/nhyNJNcLdTVmxNLPYoWTEqoJU4zyD4QX8sfFxheMAm9UcVHlEhblCkq
         X9zaF52OfHfKAqwvMB6xOo9U+w3lupkAZt8FOxdy7uZ9MDgCSonjgMq04Ozx8rZcJbSg
         A0AO01J+tjA1o5y/ngMyGo4JQt0e9hYfxh9vSWKdSbHJrfQ95UDpKwjrXu+46xiF3CHO
         pCo9UrsHJU5gKVko0Q7+fkvHZUD+AANrxDh2W7HaoFzuzx4FSOqplBqLkh4fyKudx4kF
         3KJiAcPkGd1r7PFpQWal/Sb4raJJU8QVvxOWW87JiC+F16KPY7FtdNAGEOJqbPVVzPHm
         gB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158705; x=1790763505;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkEzU1TrVb7LM2qKIN2UAZBeduPofA0aR00sq50xecU=;
        b=tyoNlDa5W2H1LziPuKIsOcl4KksulRFw5ZnyW5dhgc30HZzZCuGfQ8mCCrXMnUFMLc
         Qtd4F6KXzX43f/B7D/g9uwids/7PHvnFl2SVIyXHJpeBNKuwcrqXnB26qld7tOByHWf8
         kuUxv9G63DOWKkHMA7hypgg5qy35me6u34+KWzfLYth9FY4vPhP7UvvKTIWyS8MmHRp5
         9T6b7JYpiddKMkVMyS1WGZ2hpCjVwP58nmlCV3xee7am6UkJBZNeor9NaiCiC1hBUOUh
         /t8gA00bmmbL6UfjcU3eyYeCkQhwt2e+VQoaEnPXAzNORx0yVL7vBuGNaWKWkZ/tXq/H
         bAyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzn8FS0IxK7OYCy5GxLpoVnx8Hj9eRDYLV9X/8chTIj6zwudslCrNR/4L7HgKzkkHikkhkkr23cvPQhmCg=@vger.kernel.org
X-Gm-Message-State: AFuF++kNZbzvsR6YtnQtp7pSV9sRgxaLL1NGv/s8GBz5aA5txVguIaWE
	5uLfA2KAGR8vx1/1HYxKmHZ36dNDN1jtSI/gWzu+zGtNb0ev80GgNcaMabJOFMAmpME=
X-Gm-Gg: AYBFou03BGC27fep/6EYZPXgODue/oAcuNdOiWXdh+xY/fm/zzxO8l+eQdgomi4T3PP
	wI3Q3R9ATm330bTNxD79x+dQxMOj6enBtLdigPZ7XWm6p0CAUWVVPMnnWp7XcIJUfgKYqvZsk2i
	VXG4MyGCvneR4PoUTRQk7z1JA/RivDFw7/gl8X4gcswVdAi2Q+Atwq+EDbtRBNQlvFqQUoiBBr3
	eP2kVoOfhG+WFjiMmQFfPcEKNITox3Hpu9y02t85kdZax67KLD0X2o+zFXoN7uYdrnOfDYgXfo/
	5NAOGHky4Z6h1j31OoTxR9IihTWhqLDko3ra5AWn/UgOT/+wqgtsQGE/EAjK48XKr/1ppYYbYxm
	c5eG92KGFRVznVUhGfmXzLpo1IvapyzSK8OUSDqTuxuI+Lco1OUtm8n5eGHrhOqba/2UMI1misq
	VqyLkFSBTHFT2FpwM55g3OTSpGSJWFqlMjvsoJ+wBiS7sw4zq97FtxEU+LyL09EgB2yyezuCxBw
	WulapJIHBFcCFakQMQ=
X-Received: by 2002:a17:902:f686:b0:2df:69e3:7395 with SMTP id d9443c01a7336-2df69e374admr18597665ad.18.1790158704340;
        Wed, 23 Sep 2026 03:18:24 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a9516sm8289255ad.29.2026.09.23.03.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:18:23 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v6 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 10:18:18 -0000
Message-Id: <202609232015.ReplyLeeR7.lhw@gmail.com>
In-Reply-To: <20260923094539.GA3864833@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com> <202609152112.RFCv4-0.lhw@gmail.com>
 <202609152112.RFCv4-1.lhw@gmail.com>
 <20260915130050.E8CDB1F000FF@smtp.kernel.org>
 <20260916104305.GM11487@google.com> <202609162015.RFCv5-0.lhw@gmail.com>
 <202609162015.RFCv5-1.lhw@gmail.com>
 <20260916122740.921E51F000FF@smtp.kernel.org>
 <20260916130602.GS11487@google.com> <202609162200.RFCv6-0.lhw@gmail.com>
 <202609162200.RFCv6-1.lhw@gmail.com>
 <20260916143832.520721F000FF@smtp.kernel.org>
 <20260917112840.GJ1605367@google.com> <202609172115.ReplyLeeR6.lhw@gmail.com>
 <20260923094539.GA3864833@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Answers inline; v7 follows as its own thread.

> What patch format is this?  How did you submit it?

A hand-rolled Python SMTP script, which is as ill-advised as it
sounds. v7 goes out with git send-email, so the format is the
standard one from here on.

> If the SCSI DH the right approach here?

It is unusual, and it was a pragmatic out-of-tree choice rather than
a design statement. The enclosure exposes a single mass-storage
interface that usb-storage owns, so a USB interface driver cannot
claim it without taking the disk down with it, and hooking the SCSI
bus from a module is not possible without the unexported
scsi_bus_type. The device handler was the one hook that observes the
sdev without claiming it, which keeps the enclosure a normal block
device. For in-tree the plan is the split mentioned in the v6 cover
letter: the SCSI attachment moves under drivers/scsi (notifier or an
exported attach helper, whichever the SCSI side prefers) and the LED
part stays in drivers/leds. Happy to rework the attachment in
whichever form you and the SCSI folks prefer.

> Shouldn't this live in drivers/leds/rgb ?

Yes. v7 moves it to drivers/leds/rgb/leds-asus-aura-scsi.c. It still
has no Kconfig wiring; it is the verified out-of-tree module posted
for the API discussion, as the commit message notes.

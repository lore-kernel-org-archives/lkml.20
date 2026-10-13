Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB345372FE
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791917530; cv=pass; b=Xia2wolxpGkXgCfOBs3h86KT20d2D7Llz0caFvJmHG+FAlW/wm7IqYZ/wr5KOeJIrij3yJBbSpD2GuRM3CNpWzZOEs6rZdADcVkJUzXplV+roGu5MHIpG08mCGRmYGjaKnXCj6pCm1W4kG4deJuv0MdOhnXuaeeY/Uouu5dkyrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791917530; c=relaxed/simple;
	bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEdbu86lIdjz7rd6vZEN1KAQjaPlRNH479uU5Mzmg3CeDjXEwpuERJtdG3lzUCeqwu6k0pWlql/1gJIrGWo6omiblUCv7ZwC3sYlB9cqfFj6pYIq5xpfYMYMWsTdNZmXMdBSh8H64YP0Ze59380nfBcpMU59KtTIGJcPP/MEwSk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PykzCV8x; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PykzCV8x"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1611474eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791917528; cv=none;
        d=google.com; s=arc-20260327;
        b=MQqrnpWvSAJzlTmTuC9MMI/ksqhJlt8fCUwihQ8fWV4szSf+2sc2FZ9ExbHEzJ9KWl
         ZA3D6ji9HdU0dnAKGuCTkZ6tS33pDVKYfmy+VuWWeEuy+wvjxth4P1GHfpuOKWzvuNPg
         atwMj39MDNgEseMt1LvYvHmnsxwWzBFyqUZWs5ac09x18+6Ka8gA9eWWRdhRcs2xvMzG
         7bw4BpD5PFL6kp5dRsnREz3danz/EMy9XqfEEjprKk54HpeJNWP+PbPlW9d4dLdyuASY
         UXFnUpwAAZODemBYqlveD6h27nwJfTPS7HJfPN+ozm7c1KanBKlwEfVziiONgglo1s2B
         6IXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        fh=DlfPGtGrE4tBFG/FvRNdHPZnN2PYLxgHK4fu8Tnjses=;
        b=XyzWImMRbSG+wMqKmwMKd758oJ/q0zkqcfEDbl5R6o+i+Y258hHoaBkOO9qZtaz3oO
         XTTQEoUedRfyEgEqIIJKv+FgbGgaEs1GgYRBCQrgCfVhedOkapFaCxpOnRSp0pKZsUFv
         m6u4ORHtHk0gh7qGtr9L8fyL/bnjNbL5MpOgvzK2qWpXxYPVOIRirkIpCpF4SITdptXN
         KHZkZhojEf7QYtvVGWPIWj7R9xz7zdVX6Bk+bJMF256pF8A7TdU76wbLndWEuIkg6xo5
         RpsJs84uWssR30M22QcYk537rYXw3lq1SiRmBd+MOM3UYNkk8EpPfXdVbFj7wpauzgGg
         G52w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791917528; x=1792522328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        b=PykzCV8xwXJqSXdgVUotqocQd/VuQdr26NM5/m7EPp1bIC5NZSM4Pq8x03fGAnniTL
         FHg+mSdlQ7C6wzK0+yLLcHF93JJ1oT9mfy2E1GHDoxUePwyiUXJ0hjswwWyYcoUWjmmi
         X9+UEeJwMbtLwTw4Q2sCJxxmZkBre1dB82Zf1kCBE9I8o/HvVW367tpnSj1sGarOvyb3
         jZt76q+yxQwSYf7USqjXNrr6iQieQtsqdRM3NVZ1xRDc7Zk8CKNtdlHyOJSJe1SY9ZCL
         CFQ0aZTT0I7pHiNhfNuHPATrx9w8+3kc4YAqfsBly4ED1YSmBQv/AFj/CwNl8rdd5Sfm
         GuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791917528; x=1792522328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+im+AEx7lmLFFl3TKmYtdweSJao3sR2Nj9klyra3ciE=;
        b=AqMJmrCWTv+mas6X01aFCQkvvZEmJb2+qWwV4NhizLRq3ZaX8VuLlv9NPdnXeuT7eb
         uTcBpn2w5CiIgw0PvoQB75+MuAvbQ8n12iX6qbwwW3c/Lgkidzf1vYVwMwdCYzK2SJH7
         HUk3oxLaFcxtqs+SQTlPzs93Df0VsdVKp3joKPxlOxOprmIRd1LXzni5c5PaHD+gdbkC
         b312YBzS+4Mrnac8DKDwJNJ7BowvqwrI8CsBjZ3k6rIGptm5sut3DBrXWq6/H7OHhv1h
         /1svXIPe/XSuajkeFec4fuE3haA6itmzrh2QnJ2DOWFkRsqe3vKLD9supdXb9yPYlp+q
         J9yg==
X-Forwarded-Encrypted: i=1; AKwUvByhpYesn5s0Z6xSCKbhO0rWeGXdkttLDzBtFLYVwpOqWfwRSLZRdgKMwX3CWjKNqm5J4/0Z+8fqV8ZcUGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg1apPjlI3TmAWFSmxmwfS+ppBDKv/sO3/MS8C4crS2sudie2S
	fq0W2OzG9vLNLdHRPvtZad7gJ4tNy3sYPnerFVjb9JXx+fEqbkdupZKCVzgl4sk5A9aT6MsFcCU
	KKyZIvrsYq6/YTMqOEot6OBbCKRrpkBQ=
X-Gm-Gg: AYBFou0r7lMucGNL+I7O+1Vk4B4rQY/8QU+Nvosqgg5AVCgq3861FFQDwQH/XTmkzho
	IDbfjKesm+8NiSNeprynoKiR5esil0W3DMnu5V+0QGbncit6Gbxkhbn5mSugJFewNm1SH5qrkto
	JeCW8IDrHBgEInUaejz2IuwEWnL3tyqLDjUqxMIQlDhcECO6IpwLpG8y0RsDide8CoQgjPq0kRO
	3NWVP5fZA+PlVtde+l+Fiq8rhqmamRELpQFXZDMy3wMlBowAxFeE2mO3N22UWOdhI9hql7fBhsc
	kxA6HdiQw7JV+L+9xjVZSqFGBccg1zVizkjLgLw7VqBoCUHL+6FZTZY3ziq+xA4oOY9ehvj67cx
	UC0pXWTT/qXgJ
X-Received: by 2002:a05:7301:1826:b0:359:866d:5bea with SMTP id
 5a478bee46e88-359866d78a0mr11573580eec.21.1791917527892; Tue, 13 Oct 2026
 11:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013184755.530392-1-clamor95@gmail.com> <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
In-Reply-To: <ebfcdeef-d0dd-4c4a-87bf-4ef3fd505b5f@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 13 Oct 2026 21:51:56 +0300
X-Gm-Features: AclHuK_7ZOUl5RxszrSY4QIAZk7C80MO8yjqs5R5Q896yo4MQyJphMKMAjW3tWE
Message-ID: <CAPVz0n2ZY1L=kwSkjLeTYNvDA2Gf0Oenetj8hK13g6+qf_xnaA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] ASoC: codecs: Add support for Fortemedia
 FM34NE DSP
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 13 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 21:4=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:47:51PM +0300, Svyatoslav Ryhel wrote:
> > The Fortemedia FM34NE is digital sound processing chip used for
> > active noise suppression mainly on ASUS Transformers.
> >
> > Resending since previous attempt seems to be malformed.
>
> Please send a new version if you have rebased, tooling gets very
> confused about which v1 it's talking about.

I have not rebased, it seems that format-patch malformed first
iteration. Both patchsets are made from the same commits with same
hash.

Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDAA4A64D3
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 22:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790031179; cv=none; b=WCDDuxjT01/f7UKRCtOkMYCGEjlVxycN1zWBPBtgF5LtLg3aMTFqz2OSQdvBK3aK2dAxWcrNpRiCyscSP2AMprv3+kcXDiCrtTlVpUn6L5AuscRsWKHoN+/zNdFBxbr7ad3PFW6Fq739Maj9n1UBFqqlUDI4OY2ngvpARtqCm1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790031179; c=relaxed/simple;
	bh=VgwNYLzcFaCw310j5rnmlnCtDv8MD/s7kK28jF6R6pw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OPcuXYVozNZU7te88+Tmx1TAGaz+JLvxziIpSgUlFjDKDG8OMiKF74CaBnJwDGXl34MiJwhdu39VNaxobmiD2h1LfzIfiZ05Kk/Cm7treJF/oKs3IvChX2nsPmWzaLcysRMHotoS5kl09scKIdSVYwQWSnU3Pq8ZB30NM2Hp2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LWbVQSMZ; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LWbVQSMZ"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cc46c8so448495785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790031175; x=1790635975; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AnVLy7hVyyuk/0W7+7zlLT1tXIW2bRF33ALHBs3iFIc=;
        b=LWbVQSMZvoumr3fsPQeLdicnOFbWu0+y7IlTTQILdpMmOcggbTusvEPawOE+QPL1FY
         GviY5YzO8LK9fJ2W6UJncHzYYXcqtZSqEQrdkt8l3PH1N38ye0+X5jSGQEeHq4AGGvVC
         nV3Fw8jA2nFeGMlqHwOqbxOcZ+K5VOHyWCWNozxJZkIwLqlDKJXqh32yWmDQdd33JgJB
         TthnYXWEtXwhoQNfl0fndldw90uvHf6e97GxGij9GU6X/xDwizp4c/iwICy8I5xDG2GG
         1nMwAGvOZAQ3NXK9dFNuwrINeakT7fuK/F0Du0grxMbK2NGdAI0Tdh35q/fty0Zvw/nN
         yYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790031175; x=1790635975;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AnVLy7hVyyuk/0W7+7zlLT1tXIW2bRF33ALHBs3iFIc=;
        b=aiQh4bKE9JHzoPP/IucgS20MhOp3PzaZ6EXNylleQkmcgOQMpzyBZTvpsoPY9unfSx
         8ATkVZheZZW1mz4f2oKLMu/4BSW8B2bz/E7sr5Ns6S9sckw8Rirzl0Whk9SIZmuqVuyq
         xu1b3pP7M1KhXj6VoVZAfbNgOWjIN4AfRYOq5z2l60khY2C6v8X3wTRE3qc9IbsQRn67
         5Yjo4mSCPfYHu3ePiqYGjSpp277JTEm7GeM9396y50zc9lDPpXPKbGgpBF5HGV6w4PhP
         RuSzQ0LvuJKixGvZR8oEqXMX3WdHXQWsWGFfuCDfBHegxf5dg+31DNhf4QiqQCiiz96Y
         EXxg==
X-Forwarded-Encrypted: i=1; AKwUvBzzdzJEnixT5zBdfWO9n8huzGCGeJyzaVdXlNX12gSOequbLK7TO07lpjUHU9BheB1f0VX3vc1MIWadbr0=@vger.kernel.org
X-Gm-Message-State: AFuF++k7tgKRRXBr/bb7a5ChIrC1N9MfRmZOm3niuUSRy1jerxn6L3Pc
	4HIJYGnDmpc9Nk0W76wIhXMq6TGm0gjz5M+12R35BOotSmMGgWryP/k0
X-Gm-Gg: AYBFou0rEwnB75jhy9jeASO+EiMPXVlgWpU4ulx8xvAPSP1r7m/rlPielorXVV7R5qL
	+YGBAnmke5vyA1OXHVqTICmDYSV1JJqkHQgG/USFSN4YLXliajDuFymBPUBUDBN+SwtBz9osydJ
	kYVjlWEcySgCu71xVD86z3XM1fGuEESnQHHhMG1203C1NO1qnXI4azZ+I2jlO1F1wBjdjBZLQpc
	W1/YECAo/61Na2iU9XEeos8kCV9AJedaMMTRKmBjThHQmvdeDo5uZrx+GAJ1mrbOuiNsuXP/iZw
	E5RhVNuM/F4EZUgBcX9dUJFogbZSMvJfT7CDUee6g1lFgyWNQt1q7uUupfzuBAixEjEm/940Q5C
	x0UjxfiqqW4sLbhtycUr10prKHWd18KT1QNnZUfJRYiXNKDs+wHGXADmD+VhUbMXGrhlqNOPMxB
	WpM1W25WtLQMGiFCncNn/a3qW2FBXfubvOUt1wdVWIRdXF01LkDN29Re1lgWjoNu+drMfY8A+HD
	R3eR0kSoRYbeRh2tcDs6qp8hJ9aAL8=
X-Received: by 2002:a05:620a:2687:b0:93b:d7a0:d9ec with SMTP id af79cd13be357-93c19a8f1e9mr76853985a.70.1790031174513;
        Mon, 21 Sep 2026 15:52:54 -0700 (PDT)
Received: from smtpclient.apple ([2601:152:4d00:6110:9935:58dc:cee6:1c26])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c19bb35a7sm37428185a.39.2026.09.21.15.52.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2026 15:52:54 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [PATCH] m68k: coldfire: fix typo "reseting" in comment
From: Josh Juran <jjuran@gmail.com>
In-Reply-To: <20260907091544.36558-1-hemanth.selam@gmail.com>
Date: Mon, 21 Sep 2026 18:52:52 -0400
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C647EC67-4CAD-480C-9A78-EF5A2C2D718F@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com>
 <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
 <e038c283a0ee7a3932f3e3bfaed188280ff7188f.camel@physik.fu-berlin.de>
 <C901AA86-8D21-4E1E-A2E5-A6D99CDBD705@gmail.com>
 <20260907091544.36558-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)

On Sep 7, 2026, at 5:15 AM, Hemanth Selam <hemanth.selam@gmail.com> =
wrote:

> On Sun, Sep 06, 2026 at 02:46:04AM -0400, Josh Juran wrote:
>=20
>> What about the human reviewing its output?  Or am I misunderstanding
>> the meaning of "Signed-off-by"?
>=20
> You are not misunderstanding it.  My Signed-off-by certifies the DCO,
> but sending the patch also means I am answerable for what is in it, =
and
> on this one I did not look hard enough.

Thank you for accepting my question on its merits (despite the =
rhetorical barb I attached to it) and answering thoughtfully.  I could =
not have asked for more humility than you=E2=80=99ve shown in your =
reply.

> The wider lesson I am taking from this is that a large series does not
> get to be reviewed in bulk.  Each patch has to be read on its own, in
> context, before it goes out, and that is what I will be doing for the
> rest of this work.

Again, I couldn=E2=80=99t ask for more than that.  Thank you.

> Thanks for pushing on it rather than letting it through.

You=E2=80=99re welcome.  Thanks for listening.

Peace,
Josh


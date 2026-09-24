Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAE449E5C7
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790262776; cv=pass; b=LCwO48KXm2+A0qMyM66mhg+XA6EaS+UZtVBXFccm2wqyJwn2bhuyE6eTiTvAw5CC+W4n7Q19utiQh7sYVo5H+88YLKokdB+E1AqFvYSVFkOItfts8k8hgfrboL/n6+7fLvmjvX74/Evio4wC7If7e61agQKh+w2uzib454phKq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790262776; c=relaxed/simple;
	bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m621FxDvw97jSWodOx3F+lFAX8De9lHcocsq/962mnCEninKlM414gBZr1HdHYpSYrl/Bz+zYHk2qG3Q808oLKh0KS9vXwpqw0Yk7J32ZHY0FqX8/v/ytl0TJe7z94Xw++MJmkftZwkUfaUsKIBGEnJgXff0Wu6EeLtnEHyDDG0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sy9vj1LE; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sy9vj1LE"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so10997a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790262771; cv=none;
        d=google.com; s=arc-20260327;
        b=SUvw7+wJoSjheZ+NrGp08Lqgm+5byOC3VwPcg4WEDfap3EOjZ9cmm83laaNN2jIrFd
         k/l8uBMWxj6JHlR5i7Athoats3nU0aRXPYo082S1y4sY5Fg4fX+EN030nUlUVVfSnSOk
         rarilWmKxtATN5vTpIHWZOuLpT8uCtEUTCei95Sz4qIRBd6RgOunlWlIahh7FrmLjbVG
         zwY3Ok7H4PXck5EU5z5abOlXPgdBfwC+cSKmkFLp8axAVwxl+kT0pkvWFbHtIkdZdpc8
         /4Ud00aGxHZJngjhnStz5PNnbXzXTkPywVrJsbDgDmNj1tz4Xneu5S3ltDfjMTIJQ2AI
         qEyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
        fh=ZJb5C4evEdB+e4k3TAMeqyPn7pht/Uzvx0SA1nRuWyU=;
        b=LN6W6MJHe8WACmUe9I5kaj0lcYAO3dME/yjqgMU9tkFHlJk4IRcB4e5ty1RdhY3eii
         NzpLIHQ/+teg7vjuWb+5PF9sXcctml9QTSCKRYJRO/obfoIIc69huRm4QRpYxTaDCWtH
         3Ev4AFjuKoSKhEIGANHryei4IvfBa1IRCFDXpj4Wd8xBCux7wVu4ydhWflPsN+94HgSo
         H4ykRdWsYFm72zvmW1+9V4fKBuJRRBgqFaIMzB0omBWYcywBB3x6oPOx12cIUHxIcTly
         FUw1luXW1wHOGTVZsGY2fZ64MkuPGGcMKnXy3+OVsdmo3gx4bGdsoF2AEIZBdpfqkgNp
         RgtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790262771; x=1790867571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
        b=sy9vj1LEQ+/AmkcRo8gPmc9zlePmqcOBdevpf0vlpfompH9jFw+khCDXOc2VJng5RL
         nyRBWpTe0KqzQ/JYXa0Znj1GS3gah9JMgzY+XiSTgdvms9w/csbmvCtvsK/XjTcq+LYh
         85AZ81LsOaiWWONDQv/ODngWOqpG6dvE26NZAbvFLZVkZtqBzdOfK/PFGo44JKXU7L+r
         ZJFTh3etp+ZJcom8LcjHtCTIic5WAd9hbBuYdkHAiPv/pHM1klvhK+xpSCOe8LJncBWD
         8rXZwxl4PSkvzNW/Ruilt6c1VznDUUG10xHp9Rfhq/TGKcfq4W1YD2leccspnxTprXVo
         739A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790262771; x=1790867571;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayzFfb1FouTGWibje+shic5Jd8f745FFhgi5JrHZ4pw=;
        b=1NONKvPL6wGdtgrAltYKCA/rn7xHl9U4XZADPGjed27taJMbRAn4UnbKZmEmI70gPZ
         TDXASuCHPenQq1Lxk6aWf7cUA/HgKm9zjdCxkCQ3/wxQzTFMep/G2pEPF6cjj5zlRRAZ
         Rtp8ZrB/KvhClwisx0G3Wm8FYGXha9Pb/eo+/jsM2OnWnF4pPL7CnR8ezoJ+4FjHuVZc
         JlAuBKAIqVtsTVnwCTvUFFHdvDCN4AtkbcJ3/vYaRcE66Z4zQ9N7G7L3cmo5BbipmWm/
         /D5gHYTOPueAG7OKu0sI92qAV3zj09GcTLiSIe3w3XjUrMpMHwI+b5vXBMRH89vFybG3
         bq/w==
X-Forwarded-Encrypted: i=1; AKwUvBxdGHtf+2zWivl3BVaLID2jyn4k7U5iied9YK0mP0hrPigIucqqi48WJqmOPIeL7lD6mD6OVRKN7NhV0h0=@vger.kernel.org
X-Gm-Message-State: AFuF++n5SRmiJOuAIixNS8C/MyLD41NNzLZuU+fp4Xi8KecIPTx2WxCz
	4LXRuI1vgEuFfqNbt4hurIVJmCCAd/ydlgvyVWaMCNul+2wW/g/EXJgfUtDHyled/HcagkGVGN9
	YOzU/l9DZ9HZ2sEMCu/ldFyCNbtvOs46wXwntcLpW
X-Gm-Gg: AYBFou2KsqTRXAMH3PxTbZk6tf7tzJtiCsVimFit+tUbnz4VjtBw7OTD0PXtQ+f9yqk
	TqqGhuhgZBhoWr5pqjVWhS/fmJsN15HEP1NwI6hxg2q7esegWHWo9sLoxP7KqtDEfW+EQWFZ3Tj
	C4o2Kx2fPiiX3SKVpx+6YE6Wdvhf+T2z/95uFDjrwaKywVharVBEjxaTMOWN11X8U5PIeNr4HId
	NVi9HuYFpnQEd81qhr3feK4baknBrDH8LjzMS7a6WCCbc47TxHkTzY65xLeg9OeT8gyFfROYwRv
	DaPq9ok+yNNZlxBPDTDStgjtBicb5qqWJWzF2odIBYae6B5OiqwlVXqIaFbODpemsT9PCk9z3mA
	WizCVwhaIQGfF/NVxlO/6LwUsW/bx2zj3dO4ezyyuAuLn2nA=
X-Received: by 2002:aa7:d899:0:b0:6a9:e652:ee7d with SMTP id
 4fb4d7f45d1cf-6aac7d310c8mr56832a12.16.1790262770450; Thu, 24 Sep 2026
 08:12:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921222609.50824-4-jeffjo@openai.com> <20260921222609.50824-6-jeffjo@openai.com>
 <CANn89iK00zXGA8sdpH9Y1CkFK3n=uKG9Bci3+=69fGV0UDQ80w@mail.gmail.com>
 <arIE_i8Ysz5nOI2W@com-94485> <CANn89i+nY499TfuGMvMq3P=Pxw6vBxe+uYH1zioK=bhU--GXYw@mail.gmail.com>
 <arK0UmX8qJy3O-rS@com-94485>
In-Reply-To: <arK0UmX8qJy3O-rS@com-94485>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 24 Sep 2026 11:12:30 -0400
X-Gm-Features: AclHuK8kdadyxKWpIT7s0hVkEOx-xmt8QKZIpbxbCbWF9vh84qV429WJhqE4KQM
Message-ID: <CADVnQym70oFVCvcsGsf1PRcKX4cPK5N60uW3Masf9nNV3c+yrA@mail.gmail.com>
Subject: Re: [PATCH net 2/2] selftests: net: check timestamp echo after an old ACK
To: Jeff Jo <jeffjo@openai.com>
Cc: Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 1:01=E2=80=AFPM Jeff Jo <jeffjo@openai.com> wrote:
>
> O Tue, Sep 22, 2026 at 10:09:42AM +0200, Eric Dumazet wrote:
> > I saw you sent the packetdrill patch for formal inclusion.
> >
> > Let's wait for it to be merged and our runners to be updated, as the
> > kernel bug is minor.
> > This will allow us to get a nicer packetdrill test that exposes the
> > issue directly instead of via a workaround.
> >
> > Thanks!
>
> Sounds good, thank you!

Thank you, Jeff and Eric, for the fix!

I merged the packetdrill TS ECR fix patch into the packetdrill repo here:

https://github.com/google/packetdrill/commit/83f72d3f9085d0e26eb4d206fe4d7c=
fab5b6d872

Jeff, if you could revise your tests, re-run both your tests and the
existing packetdrill tests, ensure they pass, and then re-mail the
patches to the list, I'd appreciate it.

Thanks,
neal

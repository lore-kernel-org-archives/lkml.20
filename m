Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B14E4E8DFC
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452279; cv=pass; b=mneYgWfl0l8wl7pOd6DhDfPVsF3EMjmLc5x1XlTTMjIUdoKuBjyTNe7azfBloVqm/or5PM0ZoSF/BPl2pK6Q+c9xP8D/KpGTv/+kTQusQqWnejyeYBraYfMeCwty5LJf95FmjHe8fv57Rdkh85Q92ckKFrmbuPDeLY2N3pPFKV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452279; c=relaxed/simple;
	bh=UiSU5I5JUmLO87TdZDzVLLhzpKhCRaf7JoRdchd2ySc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKrEHBiDeF/r5JTrRIFNwytxFfhzNIbLJb9PjKkxgy/V4o4GcsJmWMo2JCQ5snp/bjOrnIHroqVFB/B83YMFIFeJcF6k+Soj4UvJlNOlfZ/8NE5CPtjzvBysg5JzRb6JAXhOJd/g1xgJ1rcf8UIqASwb86Fn3aopApiC1RpO9p4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHtdQoBL; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHtdQoBL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6f9e2f681so28263225ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 09:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788452277; cv=none;
        d=google.com; s=arc-20260327;
        b=KOrlVBkUdl7WmtduV5P6NRIeBoPOYhzVkgRw8bMQYBfoAOuHxe8hdycBjOrRONwMlL
         n1a46VfxwH3IFKNbQdtIN+FMovZRQtYrgJuC2QF4D5Sm6Jyucd3WAFfy+N/F8PfxAncL
         r2KhSOwChJXTPfvJKKfHJlW4O9SlYD/tFK0JuxvItp4xmqGykRmlRMsZ+ZI1LzcSFa2Z
         0UfB7c8sXQbgeZ7d/km0tn4ZPd0cFt6TiQQvCOWke50lKEglolMx58PVhoA3lWAgn2C6
         OFtS/C0eRNgfJPjTLAdAK/tzOrZm4pGp/uzpw9+OKTW76tnMVnEN+zWRoEXPS6uGQE/q
         roeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JMQg6yMd/MUyHk+pK+efm+9Svxwg7umvKha59T7EEwQ=;
        fh=CTcl4c10sFMpg5SKBfsFsEnWW+50rLlmIdmpuwHe7Y4=;
        b=At+jTo+pUTKsXMHjNyhL+Dc609fIGe+Xt3cnattWiLi4eM2xquE1NeSuoBFUNUuwvv
         KgoTOHrVzhGqryVuqhRi7hYdcpjPzWagJzi5Y9sXMo8fpxsFmHw8QQrggDfXmeGw4BZ0
         MGqLlRJe0BBoRTGPB9i6YmKD8cJ4FkTcOzChuDHxL4q9c/5WXWIQj01IrBDlyKyLDd/o
         DEdmaSH5Nvdbzsvc0xnz0+hm2PIzt3tZIR8L/io8srUvU69ZFbhFLcGAT4auUNa3TxVU
         bXXC6x445/l4ogYP1Fwf/h3/OOXDSzmNawfDPI81t9/KbfH7VW8rwRvYTeGDshn1Nd4b
         YDuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788452277; x=1789057077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMQg6yMd/MUyHk+pK+efm+9Svxwg7umvKha59T7EEwQ=;
        b=hHtdQoBL/5ZRhiiVCvVooRjhEfRUUKvDCk0DR1ecVily/FYx5Na0zYjMTKZoxCU08J
         QkSHg2aB3AHOfSiPGA6auZprijILQabdtz2MnRAraPA2UCck34/SoGZMaADJ4Q1EmraS
         U/uGA7WTckFzfrOLAb8Cqpljd7rBAk2LP0GKIuzTr9jKPnIOhT+LkHLEG4YzIBGhRQLf
         378rZ+jSC5rNJ9W5hQEEyU3wdQGhsjCbQ0aNYGAbb89eok6b2SGcWhA4KfS2R/l+tLaZ
         7Is8jbeCcn8ml97Xi7okYEpSAhMTDEUxLzyQpM6igww81bdD0DJsxfQOzPjzn884OQdG
         LTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788452277; x=1789057077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMQg6yMd/MUyHk+pK+efm+9Svxwg7umvKha59T7EEwQ=;
        b=ioX1PIRXF7qZRHZvep+pe/fpLkqPBf5+V+1ptGarBLywzQY98aPTytPYCqdSR5t3QB
         X1FwabqRnflkmgjdICdFaRFIdPwQfCXTBNPdHLmG0VnPSNFVx5VOGm9qhnDwZoWsgDWc
         KxU/qCx34+KZyFM/HJRu6+WzNinSAa1J8sx8h418wrx5l06SEHAriDIhpGHjP89NspRH
         JOBOKdLtJdNSczmawioj9XIfJMTwBM8xNY8Dza/DLbehrwydxDMqu8bmnge3sjpF9Rqe
         LSmGISvSZe7pmxM/+VFgWwc4dLjIiOP//xuDzo7TzURAHUyuDLPPfOgTAX5lj04tUxdX
         8Gtw==
X-Forwarded-Encrypted: i=1; AKwUvBxOoz9ymcdud9fReRRoXncMONirYI0Shgd7wTMieIkKNk3W13zT/reQAT2GxIZ5IX/GnSGcV/Tm3JI06h8=@vger.kernel.org
X-Gm-Message-State: AFuF++lt3Se5iCvvM0BQntNZlkKNhGT2wUq7+LVD5rKlFIBeR9tEBwWG
	AsO2beYE/tuAVKzedU9rbrwDdBZxB317xrr573FDHSbNjzNDUoIvwN3y/1+4MJMMN7CsGX2My2D
	+3ZCPB8GqkKb/Xld9qgr8MW2MVZ5VyM0=
X-Gm-Gg: AYBFou2e/d5Su/XucA3SuwgcPJ03aucLtNF6HuKMZX43TP5PXFaTtCa2bFCM5P9GwCh
	n6BCp4v6QHRXwiYLzG88A2iHRUXijkBG71muKVPAgrz/Tgm/mTn4Xv4OxGk8YhWSwxKjXuILQlL
	4OkvW0wDN6v/nNHs89ksFBPUxKU6/ntewIHAXl5EqIawxHqjim3zReP0PLCuJYKzFKPJnjXbSsh
	dLb2j7HKkrjdfXnjjR2b3ExO9Oz7HljeWqCvE1x2VfAXD0s+JRGP+r8ZYt1P/XRCrRVUXCvgho4
	eWZgGeyPWfhQE2zeiUOrkbF8WgkICq6fqFRtRATI14q7PQ==
X-Received: by 2002:a17:90b:2f0b:b0:398:9c00:29ed with SMTP id
 98e67ed59e1d1-39aee1f5fc2mr21806714a91.21.1788452276498; Thu, 03 Sep 2026
 09:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901134604.4052265-1-dolinux.peng@gmail.com>
 <20260901135715.4812fde9@gandalf.local.home> <f18beeb4-f3df-41eb-9990-5be295a2729b@gmail.com>
 <20260902235533.ea387f764b51b1b2a8ce8224@kernel.org>
In-Reply-To: <20260902235533.ea387f764b51b1b2a8ce8224@kernel.org>
From: Donglin Peng <dolinux.peng@gmail.com>
Date: Fri, 4 Sep 2026 00:17:30 +0800
X-Gm-Features: AcwNN1W6aLBj3SzjJ2sxEu1gH5s3mgGPWuUq6oQ8j1K9R96JYww76XDPhFhrJRs
Message-ID: <CAErzpmvoN5viidq1kHyYkP8cAfd4C4mAJg3R_SV0pB1O11euYg@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Use BTF to trim return values
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, dolinux.peng@gmai.com, 
	linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pengdonglin <pengdonglin@xiaomi.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 10:55=E2=80=AFPM Masami Hiramatsu <mhiramat@kernel.o=
rg> wrote:
>
> On Wed, 2 Sep 2026 11:25:29 +0800
> Peng Donglin <dolinux.peng@gmail.com> wrote:
>
> > >>    - Do not print a return value for functions with a void return ty=
pe.
> > >>    - Trim integer, enum, struct, and union values to the available r=
eturn
> > >>      value width when the BTF type provides suitable size informatio=
n.
> > >>    - Format integer, enum, and boolean values according to their BTF
> > >>      encoding.
> > >>    - Mark values as "(trunc)" when the return type is wider than the
> > >>      value captured by the function graph tracer.
> > >
> > > Hmm, I really don't like the "(trunc)" If it's the real return type, =
then
> > > it should just print what the real size is. No need to state it was t=
runcated.
> >
> > Thanks, I agree. We can remove the "(trunc)" suffix and print the actua=
l
> > type information instead, for example:
> >
> >      ret=3D0x5[struct:0x10]
> >
> > This would indicate that the return type is a struct with a size of 0x1=
0
> > bytes.
>
> Hmm, shouldn't both the actually applied size and the true size be displa=
yed?
> e.g.
>
> ret=3D0x5 (in 8 bytes, true size: 16 bytes)

Thanks, this is a good suggestion. To keep the trace concise, would this wo=
rk?

  ret=3D0x5 (8/16B)

The suffix shows captured size and true BTF size, only when they differ.
WDYT?

>
> Thank you,
>
> >
> > Would this be acceptable?
> >
> > >
>
> --
> Masami Hiramatsu (Google) <mhiramat@kernel.org>

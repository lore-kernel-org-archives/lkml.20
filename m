Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B6F51C052
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707689; cv=pass; b=QSD0reuxmC0diCxnwX0XNgdY8DNtMf1dGUsuYY4M2wpCyxZy2SYwypbcR98bjOcSvpJzwHzlLp/r3KTfi90nCleIsDYCSPzzIxYqBbdmTmLeVg8kQx+gVQbTgAGiMhpJYJKQikF0+ahLm+1kstgPowz/W4QL96VwIuleDlc5Uh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707689; c=relaxed/simple;
	bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UNrN5ndrf+TGWofPg1/zbgVeZnciz2Gc1nOW7enR+pKRVP6lTCPmGCAseAeQgKHxGqO3uFxi6cnjwO97fl8NJUcRCV3cBg6V914hAB43YiSF1dLENV7ljG+NiajGqyydJ3mbOAF6FT1kGWfC7UGgnMDY/fTWHWkhi0UmaK1us/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sc2acfu8; arc=pass smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sc2acfu8"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-14a08c1a158so90649c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790707683; cv=none;
        d=google.com; s=arc-20260327;
        b=jaUSeIvpiy8vhzPcwDQVMPZ2Jxuyy/XKH4dT5MyzlGOGFcFzb8EJYNrTMY4Kbu/3ha
         nlGtZrSRWuoCahbtCPki4MHOjH+GijCu0fu0JJITZ/64M9bV9E0rG9AoUD4J9rnUGcy8
         tZzYOCPxS6W4Dp7Y2ryxNq+Uuk7UqegdD/WPu0JIhl09aamD6m4xxF/W7FpCpF9D+nNa
         TktREl9Ho/e0sNfhCAwH9FMzultSZWKXeJAoUwRUMcJiIsVDTqpsgRu5eHZ78g5rHO8M
         6WKA0XB5SsCLpZr/fOP/BJxMI2QChSgK0eKvTFNj0KjgqZXTZHnjYuN1Ovpnv2z6dZLt
         n0CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        fh=WAQdmsRKwyJDgAubgKBZUdejlAtBURuhOex5gap5/po=;
        b=ddkp/InPxDoR77MNu3VSwzBueJuRTpSih2VFSxLUL6KkXDtdTZAeJVPKW9Owg2Hmb/
         xecmayGyySwovrQAN9pwz8xaagTzzkx3RgmA1M4flA73PR8ZrCerzGgM503IzS1TqlYE
         R2cRXacrXdm8mrE8JPNJq0iHcT4whTfmOhSM+m+FGc7tq2uz/GnqXEwJo8xnC7NizUKZ
         hcTO8mUtLPB7BTXXVRTsOYUjDSt70wS3+LfaaAdCWXYOBOAPXyywfQNZY9nAl7yhrJ0a
         7GuoT0wobSaZYlA5dFpaNxEgpyHiSGzlfP/4wDnW1KjwrULZUtZH1/w7mtcEmDO8qi6e
         XjmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790707683; x=1791312483; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        b=Sc2acfu8tFHnx7pa57ocImkdMp4errudOJVfi3LXzTYIvah8gO1s+XrvXFvKsVIfds
         SBjOvXD9X/WBum4P4AxJFkzWGz7thy7WwY5rERcnvYk0ocIXox2zTCC91yEsOHhiBC++
         xXIcDPkDB/EsZQtOBUjLGMfLjMbsrllTp5w3mHtgcbGJlIoZvsGpNhklTMVlu5PqHMIs
         TzKLqM7F5HA5WTB7NeVVEQunDLsoY7pltvkyswTzvkZcy41pj8jsDo5Jmt2CEbVaKHJx
         WrRTglZIjPqXd7dJBC0G3ASXkH6bZjAWZvJiaG99EPxkhalv70VGS6C85ymNM3oiGEUi
         g7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790707683; x=1791312483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mXsG2n0x6/G8L81DtdCpyrZDoIOY4779O+uiKUC11g=;
        b=ejmKO7+iKcDHKko1XyXj6fI7ZCNDtnQOgCs1y+IRWACyiyrtjXLbvLEuhIiOkYL/TQ
         5Rd+9Pc9gvi8ksGmvW17s9gyrMb1QsoYNzekBPnjXJISK6Glsitm5Iml7BuCExdocfKn
         Xi6VM5mJPGfsP4nMXy9aa0CFmky2EhuUL+I1u780uHGXWnTWWLNKKPcnCmOWKvdqAsG9
         FU+lrDt5DdkrTB1UQ6ZzIjJNpMCuBNh9BNVGfWY/A2yXM8P2LLMYm2iAWo25OzTlW0nW
         2x9lFUObJsRj6Mh3q7dsLlDEk6WKjmP5PvdB7Wk1e4MSmpB/jU9qxQmKMypTI3qqOckR
         X7vw==
X-Forwarded-Encrypted: i=1; AKwUvBzXTa+ijbvc90msWilIX0Mt+nlTLEwK/iN8mhl6AkmbEEpRvQy5ukENos8Z5rsL/oxcMUqajHnyVrnB2Lo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2lFs8QDw/CV5SHM4jXG9QVTOvWevg2Th4mF52USQnZ+uw+BF0
	U7iVf6wuUs19npOOsVYDFQY+1ZKLhEo82pGWYSn6eBMXN8KNGKmqAGDMEvJOeasasl/asScLrL+
	uTd9ZObu3htJ4PhDl1vSlxWXY+91b3Z0=
X-Gm-Gg: AYBFou16IfTWV4PgI9z09aSfloGCl6jgsek8wszN6s6rv4IDHhOoQJgOozTGXADg/DU
	9eaWEg8y3Cp+0hISem7ktfeJUVmyXYe9jF73qX6vrs+ITqw2T+PCMFFJ6ooCTMlEbR9OaQrNSa6
	FStnDEq0h2nNBz8ygaAXK1pakDSOMWRVLoB4e8LG3AodkwnSQn9cMIGBjXEc2CgkZPVpqytlHkF
	se5BDvKNLixiABG9R8G32gVR1PyeJUTQl5v/EM3x6Y+AMHumjfFlm+OvWOckwMNC5hivm2lsMmj
	7DGRgK9KzVZ75BbxtTdRjGfTf99/nseWAo61cU+g3lkK1gx5HPzKwnaowAyF+ui6TUhJc6oRzV4
	BjMAYp++zLvmS0PUV9WvFD5eqWqxEEKmMg/ksR9n6giFIK7aX1NtzsQ3IFy15gKdLWrFL5ml/Ms
	Ksm6FKSzhOaw8Bjs3tV9VP00I1ImysFQPbk6SrYLkrzMlpxZKJ/Pk=
X-Received: by 2002:a05:7300:d0ae:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34c65a6e7f8mr375267eec.1.1790707683419; Tue, 29 Sep 2026
 11:48:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929135855.36775-1-chaoji_xinren@163.com> <20260929135855.36775-7-chaoji_xinren@163.com>
In-Reply-To: <20260929135855.36775-7-chaoji_xinren@163.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:47:51 +0200
X-Gm-Features: AclHuK863ebGI2IXnXKyI5Z8WG1aeHKK_SaCRYSny_74NDfJ3eAdiAl5z7WrHIE
Message-ID: <CANiq72=ciUBTJJ=SvdrGBpNp3GvzA_m5NGeWmuCgypkFA1i-LA@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] rust: macros: exercise the intended conversion
 doctest failures
To: Kaiqi Guo <chaoji_xinren@163.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Jesung Yang <y.j3ms.n@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Danilo Krummrich <dakr@kernel.org>, nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Charalampos Mitrodimas <charmitro@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 3:59=E2=80=AFPM Kaiqi Guo <chaoji_xinren@163.com> w=
rote:
>
> Suggested-by: Charalampos Mitrodimas <charmitro@posteo.net>
>
> Link: https://lore.kernel.org/rust-for-linux/m2qzr81jrd.fsf@ip-192-168-1-=
196.ap-southeast-1.compute.internal/

I have been seeing more and more lately these newlines between tags --
is there perhaps a tutorial out there mentioning to do this or a
script that ends up splitting them or similar?

It is especially strange in cases like this one, because the Link is
for the Suggested-by, no? So logically they should be tied together
(if the kernel allowed newlines to group tags to begin with).

By the way, since I am here: it sounds like this could be split into
different patches, although it is not a big deal.

Thanks!

Cheers,
Miguel

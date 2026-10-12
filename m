Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F457368D7E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811858; cv=pass; b=CjJK6rXzjpl0yVHI8NCWjhrvJm63cofyZg9g8yIas4aNTdBTsIbzH4Ic3UFUSpIA+9HsdFNWY05kDAXtxfam1nZLu740qR5rDhRvu0KPnLO0NYr9Zr/PWJwOpE2ZcdA1vsTqY9/YV1dxcvNTGwRd8WLP8+tEHwZAgoXH5PCs4rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811858; c=relaxed/simple;
	bh=EmjxUhPi9se44vvqI3S6zFF2XZYXEIws4ovhrSHoy+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdSqAw8zjJDhJQ40idt+z/lxSqok+MrZXrj3P/6f9D/cW2diDORshemUtR2Kn2BElQU+XaLzr9qM7+Cx0dcwSbHpbh5DcpzTbqBEYRWytJyP3auN8v2Kh3YSVSx/PDFIk4Zap+SKmPyEY37RhmJ2dBMh5+iA+0aT2Mq27WHQa4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=To+M7vtE; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="To+M7vtE"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ae8541a2f0so15604017b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:30:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791811856; cv=none;
        d=google.com; s=arc-20260327;
        b=WXRSWox7D68mc8N+YAltZkCTbEXkLuMli4OGWp8ov0Xj6tNawoFOMZxHybjp7aQwI4
         a5z//Bw0zLmGdQACLYatwhsbH8cZJeUAMo8bKjL82LNGOHRMA6hpAUGt8TIgOi9OWU9x
         /NA5chokxGGaT+bAIYEEv55GRY9LlPO1QeLxUEEuP3gBc+xfK4GhUtIkrhEBktlqLrXC
         iti8FeRoK6Qz3mF/YlmS9mFAb8Y+KKn/114phabyT7YS8aHdptwienL/byDQ24l30on2
         2VrfkWW8+VunZG1b8wMyGUF1LMQ8gZcCsm+d08vU7lR1YP2jmRqt+Xr+xCbe6Gh9vDV+
         bIqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EmjxUhPi9se44vvqI3S6zFF2XZYXEIws4ovhrSHoy+g=;
        fh=1OU1zzZV+q9RCGE+KSfVGuAPJ6lTbznoe1oPgWheDiY=;
        b=Ukpavb8Yrfd9JVimMZ2peTg1e8JcDuWLp1Q0xxFJMPzyAxmsAqeejAR9Q5h2xU9246
         SptMO/hvoToZfvXe30LdNwUojg9WUbcJ4tCO2BA8dGfjQ+vuuHpTWQ5hQRslKjjw8sZz
         ASIGWLqP/F6V3ru4GJN54nKuIP/e79Un8z5boIMUhWjt1QKOKt2sRX3YdOuSi+S/8SQF
         oC5VbEgogDAeuoQNDxkhjnSegE/XO7JPzteMooBK8Tph2BsQ9XUy+De+fHDh9Gap/X3K
         EUxpy/ihgtqVhvFzIYWQSjgaa5wOcelrNDzcinzOBadOCDWMTotTbDUPOaHdB95I6wgd
         XiSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791811856; x=1792416656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EmjxUhPi9se44vvqI3S6zFF2XZYXEIws4ovhrSHoy+g=;
        b=To+M7vtEZkHjvtni0GIsJBcpb0+VCa/dx3mQlJluv7Qpe9ljPPgmqRSrKAo/OZ99xL
         3jM5alSXRo2mXSMvFY2cShficiN3ssbSKnQplu+kzxCjE8+VbiZ90UFLksVHJG6ul2u2
         c+ZObO3y8ocMfuoRfHUqAplNQgNZrVWvFRVXVffPRtSiNgA/I6FVnWKv/QTS3s6V6P3k
         U5a4GqYXtC3WUOu0wSaQRNagJJLOGHkLi1SVwrCchuWIMFAUOFJe795cA8WdgDa94gcC
         pC1lApWtK1n+JvxyZK8gXSrDpUAwYE/utCJeTMnOv7a3LGsp5hiKQqpeBgIZX+0fZdo7
         ofgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811856; x=1792416656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EmjxUhPi9se44vvqI3S6zFF2XZYXEIws4ovhrSHoy+g=;
        b=xtyzsUJJZ2g8uM+aOZUsTEEB4ncpl8U0ayIxEzdI2EV0qffR4l0Ee6nyIySCpbY7xs
         Aroi3GkOJqeiFiC8k8YEKSPV7Gu1r+fA5SYOTfWmaqJY612saj3T0syQN2Y4qfM7ory6
         c+07LQRqGYQ0WA2/tJNoJaYScu1Fyk8tugQig2JcjF8AL6xHBpbyhMSwulq3NBEJxRgD
         ZnaDVdEX+/Z6OQjBa30LlNQ6a+9jwJYXz05wQdRXPSaaR4JTsQSdXFiVr6pH2NVdu5+r
         StPMIGWhMefMhi61+NNjBnlZIL5NvHX9HVU7K6TvT2t6n8cBPrrHbqXkXg9yi4YvUTkn
         tqFg==
X-Forwarded-Encrypted: i=1; AKwUvBwpP1+Lw7/+2grfvx1uiBxP+8PxaMaB1oqECa0JSpCBE9xWjTvKnUFQ2QHg8tZjGE4GylBcHLDwLVIA7VY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0W5eRWFC+7kWarkXaMmsdNmu3LYsi2/QVw8fZc6Zh6QnS0pur
	0IOpJRXDdI1nspYjvYyiGUtBc+3U8fegGXJy0JTTS1uYTWTFF0A2uiDg9bSV+I5MZLdZS59PYyJ
	9WpDKVmSB2vy/TeMo7J0RJTbmJDAysio=
X-Gm-Gg: AYBFou3zO+GBTjEIMis9BjL7/htaA2TtjBMeIzOnUdMes6chRzhyXELWDOiLfBV3coL
	LddmwEz8+yhRGjuY8yYS0gzaHYc862ZII0UMyUAFDKA6AWAIV99YTkQZrp9rEbrxH++wFDkHEXk
	YWYmN0DRNm3rKlMGH/js///eeqkpDdZKm1Xo/jlHmOwqlQeNpDV1fOxUM4iGmqpgbLoma/VMkMz
	jSzf7/KovoZUD9/5Nz7IyxafSv+Vf+v1lkuOLgGXeSZSd7WLCeTPI9A+ISV/cs6IR6iTfk3MT6Y
	VQyv2CIicJdkn9iQyqzvdraGcdlkWLUBJxqtidXqoI+GvWswleaF5VRqDQ==
X-Received: by 2002:a05:690c:d8c:b0:866:7724:3bcd with SMTP id
 00721157ae682-8b07ed1e667mr44288127b3.16.1791811856206; Mon, 12 Oct 2026
 06:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <pm-key-management-objects-candidate-0001-v6-9876bf3e2116d47c065e@gmail.com>
 <aszZ3KPvMMHLEJ0s@kernel.org> <aszalro6U6BFO_D3@kernel.org>
In-Reply-To: <aszalro6U6BFO_D3@kernel.org>
From: Cen Zhang <zzzccc427@gmail.com>
Date: Mon, 12 Oct 2026 21:30:43 +0800
X-Gm-Features: AclHuK-JMVmEQk9s9PUAJHaHm55xlb-Is6siTbFN4AUKpBCWpjVUnqE1DSSZ9Ps
Message-ID: <CAFRLqsUB0MQRoCHg8cXmyofWqbDGyvAr7vV07i0jUpMnSaksVQ@mail.gmail.com>
Subject: Re: [PATCH] KEYS: Protect user key quota access during instantiation
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, akpm@osdl.org, keyrings@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	baijiaju1990@gmail.com, jjzuming@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Thanks very much for the detailed feedback and for your patience with this =
:).

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8812=E6=
=97=A5=E5=91=A8=E4=B8=80 21:03=E5=86=99=E9=81=93=EF=BC=9A
>
>
> I appreciate the fix but if I'm completely hones the commit message
> looks like direct LLM output, which is not acceptable.
>
> It needs to be proof-readed and edited. For this reason, I want a better
> iteration before I apply this.
>
> Br, Jarkko

Thanks very much for the detailed feedback and for your patience with this.

Several people have mentioned that my commit messages look like they were
generated by an LLM =E2=80=94 and to be honest, I did write them with LLM a=
ssistance.
However, they often gave me the feeling of being questioned rather
than explained.
I spend most of my time looking for bugs, following my interest, so
I=E2=80=99m more familiar
with bug patterns than with the deeper details of the subsystem. That
means I can
make mistakes. I=E2=80=99m willing to listen to feedback and keep revising =
the
patch until it=E2=80=99s in
good shape, but the pressure sometimes makes me afraid to continue the
conversation,
worried about making more mistakes. Your patient explanation this time
really means a
lot to me.

Of course, I also fully understand that busy developers feel
uncomfortable when seeing
unclear or poorly written messages. I just wanted to express my thanks
for taking the time
to gently and patiently explain things clearly.

I=E2=80=99ll carefully rework the commit message following your suggestions=
 to
make the concurrency
scenario and the reasoning clearer, and send a new patch once it=E2=80=99s
ready. I=E2=80=99d appreciate it if
you could take another look then.

Best regards,
Cen Zhang

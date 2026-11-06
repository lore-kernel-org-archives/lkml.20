Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924768;
	b=iE/JkukgkvT+fSGe9tjF52n0RHoiWKt6DTuD8ax5eCQVuI5gBn5+mAWpF0L4gxs7Kkdi
	 0Sxup1yy33BisKcP5SJ9bG2mZKe9g/IH7PeIiyes6KrjqnQ0ZU0Xt+jwMkUWpGB0I3HYK
	 VvJDxhMs80cz0/2JlGAQ0/p0yKv8wgROCwmyuqzLIoM48cDRuwXbBCVCWJXQ9rOTWV8aG
	 D7C1nyS6bhAi6yMQ4AsLzTubFP1mM3KKs68UMoMgd5HgM2JMF7MQ7TO3SKl9JfOy0V7yJ
	 EB/HZfIP80VX3Gn4LxYg31BJ8V+zLxLZQ9VTKKjGTHPe//NoRZlSpNB9PKpUqC/vg6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
	b=qWOJ8IPHO5eEV+55eSHgU78oC8g5Y8FhFfcxYpQ2iirdTTgXdU89xIxq1KqdEyg1K23w
	 LVxwYDzbDVEUPXA56n6UBNbyy55iaxq11WG4HO79PplsOOIhuTtlHuXDSB0dI+pC19S/c
	 Eebo1SKDr6Cb1etTgp+yL1xCG59j0oX/YCh1atenH8ZGJAr7OhpEhoROzi+Kr/M2xA/KB
	 tSKhr7LoWQSfmi1eGnWBo+7CuAJNDVEvqkaTGw6EwBBPrQNTQKs2SEkeGBYkiG7m4AzK0
	 4004OL095vtwvQ1bcjGn1F8PJfTloOy4zKLRAPSxns35p/16bQz9tPO/YBR61PtS6TQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=d83F6fjU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.174
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF860606A328
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF860606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=d83F6fjU
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso20763b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924767; cv=none;
        d=google.com; s=arc-20260327;
        b=oEWh+3cbu1dGTtlSkTZNww9rPI8vdOuiS1kmlkCT7RA2gTytdbblF8Qbj7M1sR+pkA
         1dB2Vk2u/v6L3dYUdgyvMUudqo9rWoK3NHzWhIL7L8G1yikOwb3DkNEKGFn6xuKYz1rU
         zNtQde817V1FQIlMEUN7TOxrAbovzwDkirwhNn/JMvjmr8QdcbRyu/mYRZqC2J87IU2q
         3Z1dSZfW0YBjeh0OxpkYbUchRqBic8e9s066+sfclWqSnfbJqzodERNo+BrbR0p3JEQ7
         Ftodg9F0gDfDl1tKYbdtOraWMa/MgGvKz7NanLZFK+dWbkbx/94Fpaj7GjSo27LxK26Q
         aIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
        fh=PR+oz1zQxYZvSUiQYDU7RU7Cjqrt5E7z+HT+0/FCUxE=;
        b=qk7c+LaFe/2M6YBisoqLtNheQNe/g5VWgpejq86MFwjFxcmz+kNp8OLlxSy0E1356W
         ptoz5bIlho09v765orR2Ao3+qzm5oW+KZJm/BaueALl6zGhUhdgMImNghtxs0X7N5K3d
         JO9p9SjV48pzM/jyLjLMH84gfydnIrRzoLHhDaovTOF3ATXFci5hq53dpd3XvTyrgDi3
         L5XIGtybpnGslVDJHHuH24VR6eiuL+mxG7de6liJFtzMjTCZjcZVigY4KYMoz4nEHibD
         8OFcNnwSedLCj1otLcRnHrVLH1sep/M2s+jWWoSvVcsbBmXdUQiXMbpA4g5dZoxMNgIG
         +WoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1793924767; x=1794529567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
        b=d83F6fjUa1ZBrpdME9a3Bum/toMNbXvZWQohczhN8JN0lwKIZ3meGphEY30ky2t28S
         ivzluSzn1yi2zkkf1si+IKqZEPgZZCcMy7KBpXDTAWTHVwywFDMTLG+nOMJ7MRn3DWzm
         5wqy5UlwTWBrQvlKF4dxbN7koTImbbAUBjBCzavTCAtcuTZ51wrMPOa9XEOmvwrU0K+J
         95Il4LZkk5TLU6RD4SGClgPW4lQJrm+UgBHcn6n9zB6Y9lAIEpEPQ5jB/WgLLXEwlm79
         U+z+D5RdNGl18/LGAP03spv2iKDPGVhmSH8VX23yva/Ap8mXwM2h7BgH6Tk7jgMgXzv6
         bQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924767; x=1794529567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aRM0MqaYFgM8kL5oWje8tGsrwnDPxkPfJxLc62ETAs4=;
        b=ZMWyswNtxjevIsiJTZx/+Z/GZ40dno8yS57Vfxjwf+T1WZD7Clm2NEMXNeHfEAD1X9
         3sspx+Y87ZHE2xjz1ms4NO9J9ARO7E94q0iz2ZaoyU9SkzJAZNOIIhPq03fUdSV0hQAL
         LYOwzERzo84rflubRzdlMZUVSLvgvY+uAcVbxEGqt5pwTzz9PSZYoTr8Fsx+xiCIBB1U
         klylxlH95MRMVr8sG8NKTe5/S3L655KZnD2ewEuKi+g3L2gFpjxlkDbWax2HV6lxVvdT
         epcComhSabWqo+fLSc/1/adoKQIye4R/eQ8Xw4KnLz4iBERTcYIa/gyIMV76OX3/rkXH
         rsNw==
X-Forwarded-Encrypted: i=1; AKwUvBxVMfbMBxiJ9TbYyWsBaYsSxTZaHg64eEyr47e3HGnJmBLAbTJnKUbCpah1k7eeI90OHPrgC9//3Ry5q8I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G8fvFJ6Gg/63pNa2qQn00yB0SF/cbSDwkp01pM24fyANxVlUh
	qf7uzng5qhrW+h0TNwewm1J1JbPwAMMNo0Jcl91H5qFjJ06vGMZ+DmlUr11OwqCf3xGTQYh8sAg
	fC9QfZpTUm/6NNBX9pPxPZ1e49khWR8hZrAkYMG3z
X-Gm-Gg: AYBFou3uRyZgbfR0dzTHxpLTerKY7J2TVf6918kHvCz6bmEnX7xgi286KYZ4wXUno5m
	ddFApZJSblV7q0fG9c98tvPmeoARQIZEbjUt3KShWpiXsK+Kfe4xUJybMKiweeZZzOg7NYr1pB/
	DiCeVVb1+fzMnlSvfEC31AqjmppJRxtSFZXGBEAXHrre/l68nMp3iE+RtR8dsBXgFq9w+36B7tS
	Aa7tdSOdxp19/kKDtcXFj5rth5zdh9Fwt2i/3AT2xz0+v4jp2ld6P70fxreow+4tvYd7jP5DNK+
	NdDwdJFGUNX23GoUO6YRLC7aZVQsMKHueTk2hK7yizN+7zOx3W/+bdIMRv/hETWdCmwU+rOsAFs
	6s06e0PZxJgT2NROAHY2qj5REflEzq261RssM9dN3i5lY3CRuWtMTIo844wsPR0lHyTeT
X-Received: by 2002:a05:6a20:938c:b0:3e2:78cf:8882 with SMTP id
 adf61e73a8af0-3ebb29700f1mr1259512637.25.1793924767156; Thu, 05 Nov 2026
 16:26:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791023194.git.tjdqudcks0424@naver.com> <d7e10b50556ab3b79c7132018249f6f7c608411b.1791023194.git.tjdqudcks0424@naver.com>
 <asLNxHYQ/xQ6KaWy@hallyn.com>
In-Reply-To: <asLNxHYQ/xQ6KaWy@hallyn.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 5 Nov 2026 19:25:54 -0500
X-Gm-Features: AclHuK_pI_J9bw4ryN_WOBlGRzUjsAkahBqoHmTF4zFuyNsNV4GbMdflTnlEfv0
Message-ID: <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] security: safesetid: use real GID for GID policy lookup
To: Micah Morton <mortonm@chromium.org>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, tjdqudcks0424@naver.com, 
	linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	Thomas Cedeno <thomascedeno@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 6:05=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com> w=
rote:
> On Sat, Oct 03, 2026 at 07:34:15PM +0900, tjdqudcks0424@naver.com wrote:
> > From: Sung Byeongchan <tjdqudcks0424@naver.com>
> >
> > SafeSetID policies constrain the ID transitions available to a task for
> > each source ID.  id_permitted_for_cred() always builds that source key
> > from the old real UID, even when it is checking a GID transition.  If t=
he
> > real UID and real GID differ, the policy attached to the real GID is
> > therefore missed and the lookup can return the unconstrained default.
> >
> > On current mainline, a test task with real UID 1000, real GID 2000 and
> > only CAP_SETGID obtained non-allowlisted GID 2002 despite a 2000:2001 G=
ID
> > policy.  The bypass reproduced for setgid(), setegid(), setregid(),
> > setresgid(), setfsgid() and setgroups() across three clean QEMU boots,
> > and enabled access to a synthetic group-protected resource.  This shows
> > a SafeSetID GID policy bypass and group privilege expansion; it does no=
t
> > show direct UID 0 elevation or a universal local privilege escalation.
> >
> > Build the source key from the old real UID for UID policy checks and th=
e
> > old real GID for GID policy checks.  In three fixed-kernel boots, all
> > tested non-allowlisted transitions were blocked while the allowed targe=
t,
> > existing-ID, no-policy and UID-policy controls, and the existing SafeSe=
tID
> > selftest continued to pass.
> >
> > Fixes: 5294bac97e12 ("LSM: SafeSetID: Add GID security policy handling"=
)
> > Cc: stable@vger.kernel.org
> > Assisted-by: OpenAI Codex
> > Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
>
> Seems obviously correct.  Thanks for the find and the fix.
>
> Reviewed-by: Serge Hallyn <serge@hallyn.com>

Looks good to me too, thanks!

Reviewed-by: Paul Moore <paul@paul-moore.com>

Micah, assuming this looks good to you, are you planning to pick this
up?  If you would like me to take this via the LSM tree, please let me
know.

--=20
paul-moore.com

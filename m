Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F53317C211
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482970; cv=pass; b=ddbo549v940OCRjtz0fJwS5kAqxzpwrMvn4HmdmGtj6dRuUZlnWgZbnKuiafd0cvJ1ond3Tcch0FYC5e7bWt9d0aMUgEtA33adk0hJDpS1i5gXYueF1OdOs2zsPDCgGnp+3Wa850WTU/lNgw61BIGwWitXzWyml7iljf4RAvoGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482970; c=relaxed/simple;
	bh=KLSkK6Qg4UAryK/QypN2nQ63MLecaVYHzJbXbDtiYZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T5Ci4YiSWtR6AsCPs3Aj8tCP5Uh5aRIlkkxJrnAphm63dxbpUTRJedhGJMeiOcPl6PoMPWzXtmLFVkESWCEzlKvS6Ee4IvOFybihfS0NGsVzEckYovbKzFVSrnSR9p5t3a2sSHGavUL5NcJL8cDfBTLbCdb6SPFtOLLnIhmgfQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=BaiBVVMR; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="BaiBVVMR"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6502af787so14132691fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:22:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790482966; cv=none;
        d=google.com; s=arc-20260327;
        b=drvZy5ZN0DJLuSCU+UOTGUBOOA3IX2mpQB0UCauzLhRpfeWMF01FYQEGCjRj5/1kkC
         CBt+tZvWJWrfllvwvhc8sr8OgMgK3jNacWzv38o1XY5gKBOtSU/7BaReRyGbPcmVvkrn
         tfWfhrh8Wph7XrlqgRUw9J+60pCU9r43OYX3r2QxZ3UwT8pCyHCmlXuKVXg3IYfqTq+A
         Avgfecessr2M7HM1pJBryqTBaAE4mlAW68UmQI3mLopQN9llOn3X/spu06HkMmXcS4D2
         j251pUnjJJGU0gXF0w4pyX+91OcXdLcvp2K6cXGA3505+3O++Z0Ot4upI2PFaIiudIgL
         g6FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4hVd4e7MMTnrKqam9M+BnFhXIR0nvvUtPIpD0gRr9bg=;
        fh=bACVQZV56t0bVC7lERLpThohv6GVHgNCo1rfNPohoWk=;
        b=hJKqurMVASy6lVvp8FdiBjUuVRNemo7DfC7QjDV4jXs4yRPKMfBCRLyN3t9rjExzW0
         BYOU6Il6HW7RiZjCTLnySp8HPCI8OmGXnIZNk2CWezCsfl2nMRMxTS7ZGMmdRa5oiH8G
         vs8QO6z2bdjBKCOMnZu3YTiNf5R5GnEr/XzbIWnJYLc0QMn31olQ5jZzV9dCjdH3/K0q
         o3molB2fMrcD774mtbjB4N86bTw5d0bjvxeFhQjT/EbcrPsea/xnbFuWbfqgkir7adOP
         bIoBmh0aP4obIAy6pNBkgWQQx9qb8KD0W2WP2+6RELTZK7W5sbnn27csZsca2nUNexw1
         6q2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790482966; x=1791087766; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4hVd4e7MMTnrKqam9M+BnFhXIR0nvvUtPIpD0gRr9bg=;
        b=BaiBVVMRU3n3QH0XSnvuQqc+2NaGSaZzWKIF2+GNz8QLZ7WLj/uNulbnOzyeK/VYat
         gPUcS6hnZhPE29I33DiswgMmUJ29JNfSsJX/YBsMJgjkWbYoN4UhQP4GWPu7ZFZzGLOL
         8Mo3UavDmR8iuf4tWpvGLAB+5LzLrdj1AyVobWe7B91BfZYbWaBqUvhrspkZ0ZW9f2Dc
         ND9Xo6UWG4LQZz1hle2+0r3dl7DQdd3cMx63hFH1FSiobltTgT7dn8zG9FDb/u3qWJpH
         cMsZUw28c3JmpkTjB0gp/2qmXdcVU+yUltIRcNBoO4v90UwJMdGJVCBPFV1BoSh0p/RB
         DcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790482966; x=1791087766;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4hVd4e7MMTnrKqam9M+BnFhXIR0nvvUtPIpD0gRr9bg=;
        b=h4Ql83ttqdt1LiIF86dqGS77EPFum1HLNhNM9PzOZs7X57gDgbBX7sbayuE8fet9tj
         umdjKIL8VEoKtScFJp/seCMxzbWMDn7MShOyiCvBZxxCIo30da8vB3Zqwe8zQ5S5yOvl
         i6hcBiBpwQQutjSFrFH64rGAm4XrmE+wey7Pq6CU6CFyvCTkkt4YvwRGO0rvuZ9a0S+3
         t3LBFeuWTeDl5vqshWxaivGkPhIpqxdiHaazW/1+oQWVLkVLgmRerJdwxq9NxsF2iwLl
         AQ5gTaIwAoGaNSH6dyQReix4v9Axej9pcZDHzTY+SpLD+nrlrndON05BxwRNSX+9MnsS
         JzZA==
X-Forwarded-Encrypted: i=1; AKwUvBxFXvcS1VfSQFLixSUjOdKpAYsNXdiDB5e92bi/VGUeZZBdCYmc0GFPrdHoP+AK/3Dap6MLVF6kV6TuRY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+f9f7P68Xv2fhYHKr4WXtHIQEdr9xInkN019BzRtY/21PN0du
	lRV5YfnNRAk8jPtzTCOl5SR8ClWCcVUXbw+q8wVymlhrkmoA3sELRTlLoaHcQtAINfv4eXVO5tb
	4zgOYBG1eMqvIMT0q/+FRk71I8Ow7an1VviKlUHm8wzQ=
X-Gm-Gg: AYBFou1RP4ITgNR496ZPfDCU+t9bGYhXmb0WCcKswad53zqM67tZsK4P882fPHYqwaq
	VdsIkET5FsD2DsBCptCLjFo/2z6iYIcqSq9KA2P+5ukofUGkNEf69HWdaAbnhwU6xtTfOCg1Ow0
	790hHRIacXvsVKAA+VbykpLHYKg107Ku52Co9jI5HVZWdOvKfy1w91yMaLn+rN+gLouI9JiAo5o
	Jd9ZPrcG5xOm4TNR59DtFTD5rCvFt5D/iIyYPTwy+yoUFNB9uGXDY5WYZx2zdAoEtsoojjeLPB9
	EtWKcbuQVRYJpbgh/A+UOr627cYq98xyX6KD99LImDO2T1eO1wLVqvY88TcOpD/Himvfrx1YFKB
	gAj21bNYSiA==
X-Received: by 2002:a2e:bea2:0:b0:3a4:9e40:d7fb with SMTP id
 38308e7fff4ca-3a63c0cc6b9mr23491471fa.7.1790482966403; Sat, 26 Sep 2026
 21:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926132208.23360-1-zihanx@nebusec.ai> <CAKYAXd_T=r4doyNdeykejj4SsJHiK7Fv8aujt-fXACFybUr9xg@mail.gmail.com>
In-Reply-To: <CAKYAXd_T=r4doyNdeykejj4SsJHiK7Fv8aujt-fXACFybUr9xg@mail.gmail.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Sun, 27 Sep 2026 12:22:34 +0800
X-Gm-Features: AclHuK-uSdiQSGbLHm-IaWFaZ_ga-DC4dbueRI0jyMRqGje92KnB5CWXDHu3OE4
Message-ID: <CAANe3eREUFdD8QaviwXTTmpGSF5cu_FJ3C9iHKsE1gpFMmjqeA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: avoid NULL resp_iov dereference
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: pc@manguebit.org, ronniesahlberg@gmail.com, sprasad@microsoft.com, 
	tom@talpey.com, bharathsm@microsoft.com, dhowells@redhat.com, 
	stfrench@microsoft.com, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>, 
	Luxing Yin <root@tr0jan.top>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 27, 2026 at 10:23=E2=80=AFAM Namjae Jeon <linkinjeon@kernel.org=
> wrote:
>
> > @@ -1111,7 +1111,7 @@ compound_send_recv(const unsigned int xid, struct=
 cifs_ses *ses,
> >         /*
> >          * Compounding is never used during session establish.
> >          */
> > -       if (num_processed =3D=3D num_rqst) {
> > +       if (num_processed =3D=3D num_rqst && resp_iov) {
> Could you please explain how this code path can be reached? Earlier in
> the function, if ses->ses_status =3D=3D SES_NEW or optype contains
> CIFS_NEG_OP or CIFS_SESS_OP, the code checks !resp_iov and returns
> -EINVAL.

Hi Namjae,

Thanks for checking.

You are right. I could not find a reachable path to the
resp_iov[0] dereference with resp_iov =3D=3D NULL.

Before waiting for responses, the session-establishment branch
returns -EINVAL when resp_iov is NULL. For ordinary requests that
may use a NULL resp_iov, optype is fixed and does not contain
CIFS_NEG_OP or CIFS_SESS_OP. In addition, SES_NEW is only the
initial session state and is not re-entered during this operation.

Therefore, the condition surrounding the resp_iov[0] dereference
cannot become true with resp_iov =3D=3D NULL. The smatch warning does not
account for this control-flow and state invariant.

The added guard is redundant, so I will withdraw this follow-up
patch.

Thanks,
Zihan

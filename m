Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793361291;
	b=LsfOWQI+O3sPk6vw60MXWzVropJLyrQv9R6206CWQ9IRsmWJFfG5Ww+tN1Gzf4nEkEe3
	 Oz/hc7fJ4MXYVtKEYDvDcWrYUQTI+ep+x/o9X90Q1Nu1n1pFF1F+ybX2PA2kBhuviBJkg
	 jVR+QafbO+iXkBa1iMhigPYguqpUmEZBxH+fb7j2wq6TGgGjPFrGquRJyH/Tywauc7I9W
	 /DAmKe+W2enEqR72ZvLg2Er4VT9r0rWcDuB5RC0dFqZZn7AZV1jOoYYwBRK+xhlD4gvry
	 Q5DK1yAnz1oAJVS52oLWxVs/tdVQbhhRO2i6APC9CwnfASpZAT3jp1B8eOyCgr/m1xA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793361291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6bQ6ZZpHabfRvZSQoIyHAduDOey6ACVdCtwVDeTSY98=;
	b=LdoyT+d/UUwLtn5Do2bh8B4k0CBZpuZPut/43mCREAb0VfdWyyVjb9Z/RrgI1F3P04RR
	 z0y54NNrdob+3QX9kQVspvQKlA1U04hRqAY1eGb/cfhD7AKbT8ncAL9R7E4hac22eNmY1
	 ehiPlwrQd46GVHqOQ7aAdxdcGo+bfz+wobj8MhQyynEUlHE5/flZka5Q0F6PJRkHcQR9q
	 kCgp7j/H26LhCaNviZeQFdbkF2asXJTc87Tsc/NCX7LTE3MVoHK6p6wT8Zm/qgwYkN8iO
	 be1PVA42phfjRzglL6XBYH0JG+qDw6/OM4C86zk3yXTVJZBxjv3Gnt+y7X1HQ7S6NXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgGFeFit;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4042606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4042606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zgGFeFit
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so632375a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793361289; cv=none;
        d=google.com; s=arc-20260327;
        b=pKW0BZ3qHFIsn7NRjvAbYtAS1cye9Bd6Ujj5a0F8X/NL29W04WjNTmq0bLkzPjFYgL
         BZbgfdqXpZJDOG3i+TQ+orESxWzyh93yK+6/ySSefMDu9+1SujfS/55H4vamdGUpJ9Jw
         XQq+LRJZniwZ6Ogpm7XDdYHQE/gEWKFjIPbQDRyO9ZXIjbuCeCbrXOpCm2DYri01i0J6
         3/RDt3JqmRCzhba4ysrhQ2iYojxJq6tizKMZfr/mb4OSUPfqViXj/NiGzrLY2dKiYdTL
         K9mi7hUuRAdMg002BM1u2SGwKnorNqCT1rMaCcktniWneLePcAskjoJfUPH5VzL/lONH
         sIGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6bQ6ZZpHabfRvZSQoIyHAduDOey6ACVdCtwVDeTSY98=;
        fh=VS9h/2LE2Lq1ovRdaXl7uSqa8rnfSshuhikTp90KpUQ=;
        b=Cvfa74ug9jgge77JU+qbCg01aoGc65xAJVL2g+8daaus+3amYIlaNVoXD9dCzMGE1h
         lL9B0vVJGeW3pZlojSBogngKTYWhTB0pNwYvm09lK+8UaXqUmfMpx5ihKYdBteEqWmAn
         DDYtoFGfVkBRimYRRc/kvRpvpr3JCWtftW8a2TNIkJjovQPVuuPBszCbeWihK0PPNgxn
         X9nlnvamcLy0VOD4fWoQCBBhwZB0qbRIR2CgYMt3yk4Dz8B8sG/lW5eb2iSXjd5761Sj
         78XTUaGE3XaMH/hC/rpBSkOEL9xRop5LScUasQCSiyRtDH8NSOIamT4AcU4fced2qhVZ
         C/WA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793361289; x=1793966089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6bQ6ZZpHabfRvZSQoIyHAduDOey6ACVdCtwVDeTSY98=;
        b=zgGFeFitjhi7kxcPB6FMZKpTVSC9dvTTT0WJh4vIqa7n8Tf4cbObbLBmGb10JuGBKw
         7g/oxsMH9G4Yr1y/d5skhpqjy7b+xJjMr3I2rvEnaGOdOKalZJE8MNVY5jqUpL6aF6li
         y98TRUDk75NrI/mkrQh/8jihmyVZCdeevpBcZKR5TcQJp2K+xfmHmhsCACpp40/8HCg/
         enOOeVGRANF2+jZSyKYJShpCPRXMb2VByF+N4tnBziKBONSIrkX82P+NyZAiqHPx5FOs
         EfEc0ZALBq5DW3HVORMPVjJKRdUdk4fILIYmvHYUH3Fh3G+SRhIbh1+LB1UdQuTAMwNl
         /dtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793361289; x=1793966089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6bQ6ZZpHabfRvZSQoIyHAduDOey6ACVdCtwVDeTSY98=;
        b=IvZHQFwYZs49XdShtr1oTHa4lXUG3E162J7gQJ+7wxgMOqXjeFrBMNs1+sr84fN25+
         KOvOzKUiSnl87OKtoLf7l93XVohZDoL1zIy6clmE6ftfyQexLuz4jTL/y7LEhki3ZLlF
         u7aYFdPpB+4IaqM8N4HcfNcFoxHH+4kp9UK3q/iNcfoFGd4idZ2XQVlRqsBLffPQH4kl
         V7GyEH8JyaVgSlUsTEYlFHAAJpHFab/aevcvHQ5TJy6sXLXkcTTgb5M133gD7hczv+D6
         FGcZYiz+m6m2CEPfbN7kFjNRCb3c7qqj/9S5btqVQ/FfVUR7EElnVBvjJtYEasIVkdiF
         aWCA==
X-Forwarded-Encrypted: i=1; AKwUvBwvg8rrebFMt4Oqg4+sIRaA66MUFOCjymzXAwd50KoWuCQiDJKVl3fMRce7BMlf0ytNy57lImslS8YaQG0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKij3r02LziF5URt8acJ7YIqA9jhkfaoKSJVCrtriDBb2MX6G4t
	QP9vVtUR2mEj2wl71QPc2n5v+aGZF0uQLd3oRpegMqmO95S99GM/6y5RsHXgHKo2u/HT4IU2Qnb
	SaE52Z+NjnVLdoLMVT4TdTrjPQe75Kcg=
X-Gm-Gg: AYBFou0v8TRLZ6D6NzpfrXQ3nW6446+u1o0AINEd9I+IjwxSN7uuq52WiziJWurjlPb
	/qRsBvEl6sXtLskrMuhz/HAHpGn3roRi7XSst+i+Ge5Z2yajWhpxJeA8SXFFFP6TKA7dg+ik6tR
	qLbV6HEaZyL0zSi6QZiLnC5znZ4ZzBQp2UiG0Y+bWLG3hzpnrffTReJhIjPDaHjXRlLNe59V8w1
	OKSE9rX7cH2GKoRvjhy0LoEHym+HitGEpX0f3cF2IBIqX2wOSo9QCcwfmt475anuQCxyUgHYLjg
	t1CKi75FYFv7lA32qzOP3aHtgb6zBICf63DUUHaLJu12VqIFy4RRQSfdOw/vPndA1JuwvGb+2G9
	D5neBpa+GGuQ70nBNbsCLdJ3Nf7eCmAQcBsWGISUX4heT+wXSFGGTJpZn3z/D2+262xujyQ==
X-Received: by 2002:a05:6402:c4e2:20b0:6b4:2b70:4a7d with SMTP id
 4fb4d7f45d1cf-6b4d5ede191mr1079780a12.40.1793361288879; Fri, 30 Oct 2026
 04:54:48 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028154008.67451-1-dennylin0707@gmail.com>
 <CAOQ4uxgDmhddqpFawaK874cfWCp4jVDnE67eqXyDA9eumpMEpg@mail.gmail.com> <CAGEkeHdXVTQU7VS=TxPqmsXMtFFeP=LWw-y04NmcRWJrwHa8mg@mail.gmail.com>
In-Reply-To: <CAGEkeHdXVTQU7VS=TxPqmsXMtFFeP=LWw-y04NmcRWJrwHa8mg@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 30 Oct 2026 12:54:37 +0100
X-Gm-Features: AclHuK-sTd0BhCfu01BaFX8UFonq1_wSWaurS4GV6csh_oR6EIVobO4gUcofd5o
Message-ID: <CAOQ4uxihz0G5jAijCOqzipLZ3=-iPd=8AUgxnwZYvFm+Dpkapg@mail.gmail.com>
Subject: Re: [PATCH] ovl: restrict casefold consistency checks to directories
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: miklos@szeredi.hu, andrealmeid@igalia.com, linux-unionfs@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:44=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com>=
 wrote:
>
> > I am asking because I got some patches for overlayfs casefold which I d=
o not
> > prioritize because I do not know how widely the feature is really in us=
e.
> >
> > If you are interested in reviewing or testing said patches, let me know
> > and I will send them to you.
>
> Hi Amir,
>
> Thanks for applying the fix. Please send the casefold patches over;
> I'd be happy to help test them.

Excellent. Sent you 3 patches.

Thanks,
Amir.

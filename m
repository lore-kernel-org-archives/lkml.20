Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557277;
	b=1g2kPu3QhL9PbitHTfyAsv/P097ZE4KsY6FWrxpKcNX5VvIA36oyTiP993v/jkVe9qP1
	 qHaTJwk0Qg8xo+Eos71mjMF3gXV1+Jf2FGUQgPIjCJOmbeyRKz3IiM2jxGlINYEa516R0
	 k7kD21j341+bJHNVQgYE8TDK8T4XSEUzWYdNhfjfbcjNk1QKjPkzWVOvrb3EGDpSDRWh0
	 7WGeOkk4/lLHZsK4qu5w+PLyzGYGf1N7Zw9i/ic+auWux7NmSJxG8Qeh3SSTQLha6Lf97
	 pu4AYlh0e4lNdywG137cGmcUtDczroJWUmthRwTQFZmzBAGn/tSMIlsL5n9nC8ImAdQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=RJeDyy2z7kkHFWLo9C+DbCGPGNpT15WcYw9vAIT2GC8=;
	b=UTQ4QGMwtTSQKPvXwPbvYCG8+lAlDBaHfBymKRFio4n59jfEja/nkwr2WkCrr2Q2+eUl
	 gboDVbslAmG7jeL3XtgbppgEifZwwmteGEY3hVcVmzc54NPmicXwV/aQ8N3CDuGh06Dlm
	 hdlN59zesMtEmxfi3gjqykhBtSqLWwq9WV30z4m9Daimy3Xfppus/CCovRVypujFdzPLa
	 eN1D2cB9LftmfMbJQrkTqPYk41Bbyr9KON0WdG0QwOELfGttH4+w365AsiSjDZpIHG26o
	 CrGa2OqQULlHhFXbu5wpSAjkxQwC0hUUKgKUBrd6mgBt46+Os8koJ9iNnFRZ2AyMzNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=QH6Jarga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC34606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:07:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EC34606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=QH6Jarga
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c169ae1cb26so143178766b.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557275; cv=none;
        d=google.com; s=arc-20260327;
        b=LMNdIeEyYu0KyI6iEIB9eMvJuBNkk6yV6zO+VifLl88FtstfQWzJ0IPZYcz2uIR90M
         RNZsi2lev+F2Y36qOCvGNnJCPmYDrd3O5/xEnG0tBCdPng0y00Rwg8IJBBhIuXJ9sRdw
         8F7yq83mdIFWNOzA0jQYq4PGYIfh36iUphklmyHzc0ECwnv2Tp8wEl7Oo7a1N2hX9Pn1
         OazEEhk67pOrfnV6CQpbeY1VMe7rvDvjMQCKG/ybRvZ7WXFt6ur+akl+1ChJrT5H90ZR
         R2FcvUirtz7MMEvF6Vmx2vx/0s7xsd4atjsPfrQy9LVo4k3/8XvAah54GBGOOcIYfLKm
         Z/IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RJeDyy2z7kkHFWLo9C+DbCGPGNpT15WcYw9vAIT2GC8=;
        fh=55Erm8DpfVpm9nOdS1r5H9IR5MFqSH9xEJWgzgD1m7Y=;
        b=m5oUOw1kc7Vb0Nn/Sh39WDNgr0o5pWadI1V0tBDttUNxvlxN9oPiunEAmtHpKK1PhI
         JUSyrLryo/DtDYceeI5x7wX5U8kt8ON0xcChpyDLf9/Gnn4fH6Km35aWSmnRvN3+wiiF
         u/Lc7/ePQ9/E3iyImhjHufGm5fGGyz5zvIwbv4z+YtoZ9IiTKf8x65MYPKPY7hraF9LR
         1rJhwg4dc5bSRRzHB7W/sYODSDk+e8MKV+VlKLkKX6I09aJ4n4IrOc2O8sQHnHxMmqBB
         +BCQSdN5Wd4MLCTbDKHsHLvMQYUtjIlGbo83f7+4aHgdamGs2OW2ZBo8H1zuzpq+RUcK
         3lug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794557275; x=1795162075; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RJeDyy2z7kkHFWLo9C+DbCGPGNpT15WcYw9vAIT2GC8=;
        b=QH6JargaMxC4CdhJPH4dsQNGCIbw4+vTz+kGh9LSh3mPAtUV4bfoo/2GVax3xGeHNU
         ouD9UL51e9WWuR/E6DWrHmndvAzJDQnCs7mspeAPBuhiyvMFai+Ll8X7VRj7l1lJOjaV
         xdQrIhCwSBuj4WCyai9Ob5f+E5797mfoySukKn68nUMPGNy0LQwvznlritJqc7ncFkyz
         ZGxCGLSon9hJmrv88rXn7z712MRY5b2uDxfcSnK5yDnBla6Fmn345Ue0LzraJX3Jzfmf
         /4zQ9Pb2n6mDG0JuA6ylzkOsT6G5ATn1etq8WdsuKDMEArebn3rqaZXe/9DRZAhl9ne3
         FQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557275; x=1795162075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJeDyy2z7kkHFWLo9C+DbCGPGNpT15WcYw9vAIT2GC8=;
        b=lLmfCz5lsGlrZ/vzmQKRAxhuqTk1z1dx1JWKsoE3eLSx8fzL/R7zmh7nO2SQtg44Nt
         DRe8HbCeBKAWrcEc9QJZDS1Ar7F1kqrYRVRlqBUPzlRmXsfBUACT7f5KAnyh/rWiBGjv
         POEJsyjg6NWJYeBw3nlcrwosYxGwheUCa7AALPkN5+sx0JATAr1MYB7asgQSrPfC7Zja
         6nEr0r/Z0xlm7v0bjphAJO++l2lBQoYObTPvtDKilXVZA+4NImpXfMvdi9A6cQiTHUgy
         k0aJrcMpP+yO4hs4+O0MBdbpwi6Y9GchRSpJPwtSVbvwem5Su9HzaEhFo3uKKEzwESZm
         LhXQ==
X-Forwarded-Encrypted: i=1; AL+hErEx2I7DKxacNX/HrulQQS6C0cC5OJK/Rv8xiVtEUztLddQ4sWM1SAgOdc5vQ4kZo/Re82yZ9zWycuqdQQQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qu5hW+cWG+Yaw6g4Yq0O7GKXo4TCNNEfP5BJwTRxKWtZWc0xj
	8f0IqsJ47Vr8QSABEDg4eUhlYsukrsROqG+sX6CNhiTQXhiLSv5W9/6aYNlU5H/EbqDW6wUUc90
	Og8K2kx28EpXMVSV6E/IBPvCxktvC7RGPVqw19KYmh508gC8hzmJC7Kk=
X-Gm-Gg: AYBFou3c0vvKrbn6wK+mKmCZhK6tm8NoIYqugCbPBwYh7I6KmeaI6i9J/LPxsm4jOkd
	nybP0djMW7M+gzaSm8Ml3yXnUl11/R207xWRVMNxTaaDBhrZvDDvWOD3Hin3wM1v4KWa+aRdVJs
	gKF3bmC9z5auXifIBHURoM0oB4x4Evsm0IjGt92PMoTISW6xq2s6OPzZu0acEuO5QqTdva5cyGE
	CGgX9y52QBKUF/WvoKaSmJ71poXu03fmj3WIVm/kabzP/tZwdKpd74kMft0tf0VY1iSSkuRIvUH
	LHENqznuo1RcSx80wlQGowazMJYhVaTFxeXC4IUr4yDsTmzefIhPPi3ZjBMMPJe6voHfKb5BS2J
	DBWvFtScKIBbuDwGwP6SCSH52xqxS51HBwh1pZlNHSxN3H9IeBXu9adRLTjgbglG4Ov+SaUb3wb
	a3TcXoSHmiPdU=
X-Received: by 2002:a17:907:2d14:b0:c46:9711:e30e with SMTP id
 a640c23a62f3a-c507c46b13cmr451895266b.29.1794557275408; Fri, 13 Nov 2026
 00:07:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111153631.1309838-1-max.kellermann@ionos.com> <mvh4ekf6iyfijuqggxhpl7kwxdyysx2zqdrp65bxitucxikwpm@6bkppgjyhsoj>
In-Reply-To: <mvh4ekf6iyfijuqggxhpl7kwxdyysx2zqdrp65bxitucxikwpm@6bkppgjyhsoj>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Fri, 13 Nov 2026 09:07:44 +0100
X-Gm-Features: AclHuK9zR7kzmKYvs_047uhc-z1BRlEn56R2GSk6_IjDFBx3cCWd0_4I6VnEDCo
Message-ID: <CAKPOu+91dBHnssGbHRi2BhwLPU_aoR71Bybh2ddGHeg_G=j4rg@mail.gmail.com>
Subject: Re: [PATCH] fs: pack fields `i_state` and `i_fsnotify_mask`
To: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 7:38=E2=80=AFPM Jan Kara <jack@suse.cz> wrote:
> When moving i_fsnotify_mask please move it along with i_fsnotify_marks. I=
t
> should better be in the same cacheline because these two are accessed on
> some performance sensitive paths.

Tried that, but:

        struct inode_state_flags   i_state;              /*   120     4 */
        __u32                      i_fsnotify_mask;      /*   124     4 */
        /* --- cacheline 2 boundary (128 bytes) --- */
        struct fsnotify_mark_connector * i_fsnotify_marks; /*   128     8 *=
/

The cacheline happened to end after "i_state" (and now
"i_fsnotify_mask"). I could move "i_state" down instead, or move other
fields around - but you're a better expert here, please advise what
you believe is best.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group

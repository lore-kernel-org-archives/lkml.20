Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793798635;
	b=dBKBj8r8hjUc31yMb/RlXiPGxKXrhAeLEu/teje058SI0cDo71ZYF8IUwDBYd9Qrd8cP
	 GuRoGPA2HbTvlMeE5Ike+9V5K3rnKsuLQO0MY3wgBPubOl3qR9wBN7Ji8Y92uimpVMkeX
	 2HZn8QX3aGnrxkQb+jPuU6U0r3rH71R57VLoxNu+GMC366Lkjzj94dvfiGN8/TZmFgggT
	 9ZICT4i3j0/w+tu620VHSR61ujMt6+6JgkUY2OSN6Dgp3BQAIR68SskgY8bKvweHPDTrH
	 d4YaZJ1Sff5GEZsL3ikYch6MJnmDaTw/HH8ZxUZ52F3yeoIzW6BJObaCHjvQ3mSjycg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xubPGCMNF5A7l1GbhlsuEYd9srJZdXyImoqZi75L5qE=;
	b=HupWOyLWn7i9Ja/jh2beVZwuXJ/aV05E85y3Pl0otwu9Ya3Uj5HlvJoA0LlHcRteTRe+
	 iG67LmqJ+thHwIGH3SwwaUSpEVHVNSNgopVS03XGSwpHAJJHG4M3DEM/gnyId7vIYgOT2
	 pM2InHp/fdVXgbXZnNAVjsELmtLbhLTomjysn1KO9wVYF1DmiJyWL0ajJGaIyvcpsIaIq
	 RPm2PNjE8RUbfaVtCb+LwHdZM1TO7bhNSa5ON+gdlG1f2m6GHvYMSPOTx6LjKkS80KrQ5
	 p6r+/Ck/3GFNAJKoPRKfOVCVsJJxikk4OxSV0QSf6h7LUHJX4gqGBIDdnsfjACXg2Ew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j6J/agJ6";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B9A606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B9A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j6J/agJ6
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2eb14c60a7cso878555ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:23:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793798634; cv=none;
        d=google.com; s=arc-20260327;
        b=HV1VsJgorVREeoh+EOnRKTGe3YTntPP/LDfy+jTCzFoGQk5pW320r82PfSt4TX5kVw
         vfmta4Thy7qtYnteqjeCwr/ZZLXRkLbGaOVkdr50ry/3TgZv4d7BlnH4ElLv7Zf0NySB
         3FEnRzPAM4zDqy4efODvV0Hqen4uQGjtzlhJFFv1AmJoZaDe8ZwpUs8pj2gkcuKqezD8
         m+BOO33f606r7ui5GGHPeg8p3ZxZxua+6FCxkNx+maiKV3nUN9qJwqGdNXcsNG8LaqXr
         HpxMhlJFiUfwsElB20xmRvBEH/QUvZUiWIheP0+VVkYWcGZyA6FaFID2EYOYAP2ZJtde
         2pjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xubPGCMNF5A7l1GbhlsuEYd9srJZdXyImoqZi75L5qE=;
        fh=AUBXh4TjeOSLa7ev9Qisj38s3WX8EFJswHmTmtyGHK8=;
        b=dSLPsAAGP435nrCsZ1TUbfksvbNvHRcN1SezyeVp2pHh752r50WDmTIBCNp9b35jQd
         fXVroD2oEU1SNqI+LE9oegtT88daEFS3b3/r2AO2V7KmroOY+N/na2xIEb/zM+GF3yjm
         cuXex+yDt5urUKLiCJ9SQKaa9n025ECZTtR8Vh5jjNSP4kPL26jNeF2eTi4U2bC3nj8b
         Yry1HTlE5z/Xf/3iqjdvbuS7eQnKg40f675j7YAGXQw6qY9FOjeT/RS1v7bY39jLKuTz
         T1YnFIw2ubAA/EzJsheQGThtfY/LMFeIWg5IdnldwKR28fw6hpaIxpi7WhH3Q3UWhN+S
         BOCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793798634; x=1794403434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xubPGCMNF5A7l1GbhlsuEYd9srJZdXyImoqZi75L5qE=;
        b=j6J/agJ6w7VZY5gj5/GV/b/g8aSHqZ+qA/ywIWa1c/ciAuSFKYQWeRZMn+yBWzXihx
         0VoWCWqMKKF6QlR7XkeiPYvQc7hNU/+IOu0UNLb8CHFDOssDaG3MQRMnXIhcJZps7Hdj
         h9zkerpd72sVZ0tb54NZ3CfONjG+0VDyTyx+g4V16DTtKS/gqcZQbU+j3fYuIORyDJSM
         +mLMg2eER7gLBk1zUNAui9eYH1MpKMLKL/Apeb+5/4AmFk3JWiS31O8qwngDoiL9juNO
         Kv1R8hfuU8mPxsX26qRTHjJMqMJ85yc7brpNVAlJBJm80lEl6snPBtFC+2rl3EvXgczA
         oT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798634; x=1794403434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xubPGCMNF5A7l1GbhlsuEYd9srJZdXyImoqZi75L5qE=;
        b=gS6BJLRw/3Z+2SBFSRtfgdhe0ypAk52wot/cdDzUbdY8Y13MLuR9Cc5XFyNVlc7JUs
         p1Mg76Iw0MdZrBYGAu3UASJ4cYfBEbIny0Axi9V2dah/dGmVHselRSim6aXHt3S70jzl
         oAEcPXU6jRQ7zHJeO9tNASaJjIUVAKAt0fspWy9plUqvdcbsZJgHrsKY4zqB326mLek8
         Sfn9estILuAV3rlvT7Iih3DaNOtQe+++FXO4f/SUWHzi6mXwBYljkOk6U620/taCVi8s
         jWhfUO9wVjrAgXzQgTUL9nYHkKYURnTfVFSiFcJlpfPf7vIithGMxyKpaCEv7yf8TL/r
         er1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzmMmjZeNr6kdLzpbeQ+5m5eRZO7tWGOokFPHyf6QAAP0FZy7O62Zen9OjWfcmksMeREB3uOzm42/ZfSzw=@vger.kernel.org
X-Gm-Message-State: APuU4Z98cecreTDO7dbflCK+fMW9caiApxcXc0VuhR20iGujAspjWE+9
	0MM4TvIWd8sNQpWOhXvt8ZHKvKsl6IHsb2Nj2AsDXvPrNG/1h5+O6zIsiYFiDDfa4hfjM3eoqlN
	FQsYzs0TUGRzlUcqDzfsdhue/dzFZz1E=
X-Gm-Gg: AYBFou2L7JqANcYpm99ew/5pHJUifxWdhJLGz7M82lKTq2mNFqGXRKHaKDoZ+VNab/R
	nHrv7T1CYKoFoYnTJDq3OJRZWkQOzF2U83ya8jQ6AWM8/6RzwDpVt5luWRMgeoLe/ffpOqxa+Z2
	1o02IQTH8jhvtW7u7BRpkp3/VmyYg1s8UTv1IWxfFPU/f2UhskuY0dRxyKcovd2Lzl75VpAfiZH
	KZd7R/W0sEEDV53LGS7H+BEB8TCOMp5oXvQkiZetfzaOqPSEar1AqR4+MbfzrRtTeB1bLNWgI8l
	2prM/sLMGonou1RUSyyI7IvbgYMcsYV95t27+vV5JL6bD9pFL8z3ZBa0Xz6/pUxAPoDyqFT1Amb
	VWlvKCVJ5xVmv8YyTE1x1fex16Wct9/6+g+mKNSclSM1MkuKiu6kEYQ4k0UnKGO2E5ol7N5T0aw
	0gljPkiQOKOEowO/oR2JdCpF2Zl3DRLpD1TmQ3NkSVVz43eA4OoTWrnvIviq45braOp3uSQH/R8
	c9bTRzxdWwP+ec2M6Bxur8lRNQh1AV1zu/O
X-Received: by 2002:a17:903:388b:b0:2e9:5714:607a with SMTP id
 d9443c01a7336-2eb3641d0edmr258710305ad.2.1793798634020; Wed, 04 Nov 2026
 05:23:54 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
In-Reply-To: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Nov 2026 14:23:40 +0100
X-Gm-Features: AclHuK81gVimlDVsFHkZqFlgNW62ZJXCIAlkqu-hrEQDHZ6xYcLJGS6_D0xMetc
Message-ID: <CANiq72m=HO8T_JXQOT0NPqryzoXbZa3o=izPKTk4TYcwFXVhsQ@mail.gmail.com>
Subject: Re: Kernel formal methods mailing list?
To: James Morris <jmorris@namei.org>
Cc: Christian Brauner <brauner@kernel.org>, Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, 
	gmonaco@redhat.com, ojeda@kernel.org, aliceryhl@google.com, gary@garyguo.net, 
	namcao@linutronix.de, sashal@kernel.org, 
	natalie.klaus@runtimeverification.com, willy@infradead.org, 
	paulmck@kernel.org, corinnt@google.com, stewart@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, tytso@mit.edu, 
	keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 1:00=E2=80=AFAM James Morris <jmorris@namei.org> wro=
te:
>
> I'm interested in learning from what others are doing in this area, and
> sharing potentially useful findings, especially in terms of identifying
> _practical_ approaches for verification of low-level systems code.

I have been trying Aeneas (Rust -> Lean 4 in particular), which still
needs work for low-level/kernel/`unsafe` development (which is coming,
from what I am told), but it can already be useful for a subset of
safe Rust (and ideally single-crate).

I agree there are things that subsystems would probably start doing
"locally" first, i.e. picking different approaches depending on their
needs.

And, yeah, LLMs definitely are playing a role in making this way more
cost-effective and thus popular :)

Cheers,
Miguel

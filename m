Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25718303A35
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 05:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178586; cv=pass; b=UlBlQbImLbxErtla4fdd86a32Gh6t6oYyXFneLPSMsE22TDfSrqxK9aVS2OotQJ4dY5kQjk8MTcMjqYhtN27NnsCPLCNjN584d7U2ZIFYdSu4bJEiDWqmxeON4rUunShfdxIvtxVQ85c8Ae1dtDQ2Ej8eQyHoTutdH0FbeyiSRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178586; c=relaxed/simple;
	bh=3bVd4/6TRuhZlFLsNTUd/ze81RF7sNEE2/3G7QyK20k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HbCouNyYiGu79326zF8ksIcCMrR6tmN8v1JnbVtd6h8bsjndrMX+60HKjsx2ALVT4QM8gSZhcM6ELVT6b9fFyR9b3xs4RjyAyiR9KJT1keGhTFh6vWaTeDhCb9Eg7umZcne/3mm0MFnHOOepb3FtHH/F5LHYUEWwCwbb+mpKyyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sy0koghN; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sy0koghN"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fe88f7so110212a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 22:36:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791178583; cv=none;
        d=google.com; s=arc-20260327;
        b=i3yladn/l3QgN3buQWSQ4rAyJKGBtW3iY9JdDmlvrasWISiSLMLUyIv/m5Jyvelerp
         BtUCwSCwL7q5CJOQ8puoLSsHU2hSMbT2bpO9aK9rElrcwV9ERMLirFlyNJmiBrDwNK1P
         m47pEjpdqZpLWKK8KBRy1UTvA78D2yHuGsi5CmKcIT3yIiiZHhr/D+E60iT8NzokQQSh
         7Zc7KzVL2B9oG3ckjJOYG7cjeQL/DmZ7/45YtzR3u2IoDr7fahvwctriuJ6QXj5OrdyH
         vhcnIEPBH+E+W4stpJ0+yw9zRAD87Ns6L6O1KIeKFDBif5Aln4C87r9G+QkebGKuC0KW
         JI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3bVd4/6TRuhZlFLsNTUd/ze81RF7sNEE2/3G7QyK20k=;
        fh=JXWWnHUpfKsqZdep2reYzBV5BkwZiR8yvWJgy1iztfM=;
        b=Zs9JD1UbIg6pdns0zCpQidAYPVqnJGdRz7l+JL5I3g7Xe4cFFzBIasCKKjmxN9r91A
         d5A7NFrc9GxMZYe4q6R/dCZ718zVCH6UJIDJ4TTPhT0vj4He0apR1NSxpYtTyCDQacMF
         ulOhcEsyUjshGnzoikY3ok419fjBQ02A7PfUa/sURatorRZXo5hncr9MEh1NecyOlW/S
         /h2eMsQsvrgTTNcDfHaMCEI36ZlQFeFGIubarqQhYkC9mpiVXG4CqzsYKqJe0A14hX8Z
         3jY2lQd0ROL04vak1jjKOtbnoEOhCjGZcgMOWAw7e6EsPlPQHKW9ZKPZNmFAlShD1bzJ
         YEEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791178583; x=1791783383; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3bVd4/6TRuhZlFLsNTUd/ze81RF7sNEE2/3G7QyK20k=;
        b=Sy0koghN9HrqAdBi0waqOhWkjHJaM7e2TwA+032M+AXUB43q/37pA06hC4BpZshCgq
         TikkJYWDi6dxkfl+VguwZPtYVT6E3rj9bS3ZdXaSgu7tyPZfB6rCIpX3Z+dHQ3WyNmlc
         +bwYZFrkVHC8cwYBNnQIeCM12xqDeNMhl+VHUkZsH8RJxmf1noLCO6g5nSvtvoKHYOIK
         94wqkKjM8q0wsrCsQszssSGavnHXdqxwejQnamwQ2ZGL9CBVzvb+bsRZPvSvSMDcaw1T
         qNJmg0/fEg/5a/Y1pCjhzczdwi8LpVZEt8xvJCx6bmfGRs63Ka78vmIedC4EcO3KXqr1
         MMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791178583; x=1791783383;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bVd4/6TRuhZlFLsNTUd/ze81RF7sNEE2/3G7QyK20k=;
        b=YP7vInvt2vhS5Mp6DyjzqXy08PP2Ruil+FD3LInwctW8rRuacxxEY26VmpoZyJ7qP6
         wqrfNnEjOe4nVE9J26KVmUifYDIUuII2/vCh/v/rGL2RUpU02Eydqhvd0uQ57izsgYNH
         Wze/P/uKzxrsBh9Y0RbfjZb2EqgubDMBFmnWNs8ESD2n1vcRUniwrzuJnCXloP1h4jK7
         t1hLEcGzjM8aMGi6/+8mwe+aqF0zcQvDyU8MypV70j9YzPrMApTF+GC5VI8fomtQEkB+
         SijAaWOjBHfBs29DvPo7EBCq+2J3K3dyPa72LQ7uqLG70zlGeQ+GsSiwWr201wXAD6AH
         wPTA==
X-Forwarded-Encrypted: i=1; AKwUvBzcwwPUSrzuxkCT0MenH+jAfuaLdiwj9gLFbzg/FE0oJ0Yp3nzUnHX1zMjZDWnuSd4kIEWwz8MYbrm7zgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKErLuh/T6vMamX/pMbWMnIacE026yqRQkbL1TtOX6Cus577txm
	oVnq//h/1n1fxCLOoV8cD+IHEd2PMdK/jV1R7VoMDk9Gxzp2SzjqKpmUq6rB9FtCGRcuvTlgSfC
	U/tAkl7ak4PpnD7wpYHtEPZQuj6YbkEY=
X-Gm-Gg: AYBFou1+lNz08edbZlltFQC3P/x4rfF7rxK61KsRkymwRUnrkCk7Bu5RWyntYsk1z3j
	PFt+V7Fy2JimbGHNFsbqJkJZubOFv8e2+elbuapZE2kLW5lCP/YdUN7FlMvXZ6cPbEZ02ukG/eM
	e3judBfykZ3kIdUMunX5rBIlYbmasjEjB/WUdvtysWwf1I7G7Mn/XCF+kERVoN7S3jZ6OXaeGi5
	0FDHH6A5RB19tMVHfA/Bgjv3RlGjaSK9oFNf+dJWawLNu2JhMRfnI5TeOxfieadNjbxyuie+3zq
	GSmQ39PPJ9vahvDzKE/y4l6gTcpwP2+rDmkCo5lJ7za1Let4KGP7ctZPX3REOa/dyY263HA4kpf
	sQePw/GyOEuc=
X-Received: by 2002:a05:6402:50d2:b0:6aa:91c2:63b0 with SMTP id
 4fb4d7f45d1cf-6af9e2e7068mr8641383a12.2.1791178583097; Sun, 04 Oct 2026
 22:36:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927180806.1315902-1-nicoyip.dev@gmail.com>
 <20261001182924.3928331-1-nicoyip.dev@gmail.com> <20261001182924.3928331-2-nicoyip.dev@gmail.com>
 <DU4P189MB375033B6F5978460BB988D89C6962@DU4P189MB3750.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <DU4P189MB375033B6F5978460BB988D89C6962@DU4P189MB3750.EURP189.PROD.OUTLOOK.COM>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Mon, 5 Oct 2026 13:36:11 +0800
X-Gm-Features: AclHuK8fAsMrI3qzzV8uWswviu1Yxpd03vOYqXZXhNud5CFUwzH2-M436KXUFEc
Message-ID: <CAAo+4rXFxvqNvo8BOsX5gDScidFfk-aq1oZeakXw=_Ufk-41Pw@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tipc: unlink publications without a node lookup
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"tipc-discussion@lists.sourceforge.net" <tipc-discussion@lists.sourceforge.net>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Jon Maloy <jmaloy@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 12:08=E2=80=AFPM Tung Quang Nguyen
<tung.quang.nguyen@est.tech> wrote:
>
> >Subject: [PATCH net v2 1/2] tipc: unlink publications without a node loo=
kup
> >
> >The two remote-publication removal paths remove a publication from the
> >name table and call tipc_node_unsubscribe() before scheduling it for fre=
eing.
> >
> >tipc_node_unsubscribe() looks up the publishing node by address and retu=
rns
> >without unlinking when the node has already disappeared from the hash. T=
he
> >publication is then freed while its binding_node remains linked, so a la=
ter
> >publication-list traversal can access freed memory.
> >
> >Both paths already run under nametbl_lock. Unlink binding_node directly
> >under that lock instead of performing another node lookup. For a valid r=
emote
> >publication, binding_node is either on the node publication list or is i=
nitialized
> >as an empty list when subscription failed. Remove the now-unused helper =
and
> >address arguments.
> >
>
> This does not fix the root cause of this issue: Not holding proper lock i=
n tipc_node_write_unlock().
> I will post fix for this issue. Thanks for your report.

Thanks for your help on it.

Best regards,
Chengfeng

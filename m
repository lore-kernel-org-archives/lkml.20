Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77236345EB5
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790732274; cv=pass; b=D9PG61wxJ1/36Adm+YphuchmlubNUi+eEEFJS8d2BLp4/ZE4Hk8DfktPARXdtmuPkrm3MmbG3Q1LDF56/tmBfMCALbfx3JZw1ApGsmqhEjw84Pnb/ghe1Hs9viCy8otoP6PFxmeviomp3cEB4JGfja5h2fLLIwLBUGb5FhnZ6NY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790732274; c=relaxed/simple;
	bh=bhJUcLjKo02bLvE25E0PNpH+ye50aBQvEKX0dR+Ok7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mbg0Cx60gDvd2xjRJE5PYaOQ3IDXII26q4po+lNudcLWnDZAY9rEcJ1qzPT54XmLhjkmdbd2LbYWoMRL0e+zGLLUg8BwmR3NK+OxSW5YxfDKSZs62DZoDJ4nGHa5hOhcsB23KbZDpQWNnT5tIoCYgq9lGP1T9lGRYMB+YH/B1jg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=I97lxwgR; arc=pass smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="I97lxwgR"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f01363so28357155ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790732271; cv=none;
        d=google.com; s=arc-20260327;
        b=FQY0tqN+4LtzGEoDvyTSIEdWyYko+PrnCc0BHy5/PP2EqJ+GUh2iH5XTR++3XaSaqA
         WSHRyQBg6EfnoZWTxyirfTN4rqv7VRaOPHbz8SeghKrPj+0WcsxlOXB7C/QbRxMjBN/R
         imf3Zbd8MGbZmS6PKAGAnIuliVpckoFRU4ZyGGZhwupCuXC7gUQ6klWYmUFH5bbSstvm
         wy1gzm2AWWCUdEvhmvLsOj2MFxOEyrjwUrpu5/ae//f9rONccD8zSHmFtl0HcaqkIcjI
         zTckcggeTj/UI1eGmkJYl0R0/PuSg13IRHgsnp7mXyAkGFxDhgrJTvy2zZ34cevuTv52
         W0ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OaTWYjGa88IT1G2tVr2iEi35Jf6xhHPNQWrE7gJBkU0=;
        fh=dmj06q22YPZX8Z/CQvdcBPoetMVvkjffnhv1v7nfVEg=;
        b=D2/0icN7nVxsKyd0U20l1lwDXZzBCSTyluPsCSihEZ19w4HfRP2XSVn9SLalaN+Z5a
         8Wfbiu8Ax/zLE2rl4uoVvDs7bSuFEOXV87h8Fejmpm4CW5ztW6imXx/ndxyUX+C9BUqP
         1LP1WCdlel5KXtLoS9y9w1dsn3J3zA7scoErL5ZKW41FXQgBjMflX1Fj2U/Q2USEMwhE
         CVjryghQGZIGJ8HmDgAr/U3eCIG9kyuluFHo8lIO5INRHlOa6cgptLwub4Bk2UX4JxTp
         mw5YivE24FWtoFLkxfK2GJSrSC7IXPTJBPZuTWHKDnK/o68Rowvo/i21LCSfR9+3ypv3
         8RLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1790732271; x=1791337071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OaTWYjGa88IT1G2tVr2iEi35Jf6xhHPNQWrE7gJBkU0=;
        b=I97lxwgRrLCGRi4ZUv+8vwPeqQpl3+D0y8LybsOltepQ637INvdy1Ox7aLFn2sldow
         s/wC776XNpEi9D3ReZqHy0oLGcxKsetJGRr4ZoDB6tjcbmnPuIHVeuy3YpSX/42I8G48
         e0f3yGgT1c2S93o++DAMMd31Et045nCdiIJ5iKwxZ/DUAbJoD4ctSDFu9D13NQpBDTJm
         Jt/Lm0CPMaFMcFhdNFxBUEYA7N36DdBJmT9lvVMrfFMNJw6h3quptOGJ9LqYdDEkn3lu
         q2UZxpC4RsF3kMvSus5s7kdGHVBXo8B14QkTPRBJIJZodipeaR2c1x5jLZU0b6VBztyP
         BzfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790732271; x=1791337071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaTWYjGa88IT1G2tVr2iEi35Jf6xhHPNQWrE7gJBkU0=;
        b=AknKO3NJg1B7JQcD65JS/Ee7ey74LAqR2O4lRUNAQK5YqOOooU2NGRboyvyPy2bfrq
         q0/AiP1D979q0V7siAvvFOkZXzZHD6j+Zj9pcLQWDTS31otaw6NxTZsR+dLIY9UX7bZ9
         PBT46WNrqcJKqC+EVhjBKKi1MdXlBVAtMlw3WL8oL7M5XSFoK0gpikRzbM9Fq+bc5wUm
         vx4jgCO+AfIANBxvcnnVde6+ooykBoR6mSEUhD8u7v0j3mlHmlKK/Wz1DeGVCHAofi8Y
         //qEpWrAI2CCKf9+ws8yyfY7D85R/2vxUunL0f5w4ZvFr/M/hSbaD9FavHbT9WVp0aO0
         FA1g==
X-Forwarded-Encrypted: i=1; AKwUvBxR0CT8iX0n3ER6FsxAGVL4DfxJCGZILeKPwZ4gQixj/LxVszUHFkaF48Ni/w+f2VVOFKOd6aIpJHYFKNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHtnojJhAP+iqdIw6oVNSLUzirkYHS39gPHPAAfsS+jgR6BuYc
	fgo6VSVTEy2Jxv+673DtTW4RGqzlAMWb43iG6GZy1Nw4/jpV5n76W8XOdN2GPqXRrts7xMwM3B6
	JyIgA9HodgcHDFyQ534jb7Yg3D9zzq9ZXK7CR5isl
X-Gm-Gg: AYBFou21Hg2mbf8mrD3rM/b5rE2nSJlxDbYpYBfEJB1pLXO3QLtwgptPqmpbSpaSFEc
	y5srZkj1b6ZviKaWG1W5iIS9Jwahc0zlg4pMPhciSV6jZpb7jfXHXx+V3qQ851xTmnBKzJbLpGs
	PCsH7qrAWha8BeVDa1g7LFF4NRKjBVTDcBoce20ztoVtMrGYHbaZUhgEmvIdf17OIQXwKE3pf60
	3PzTBteUTCapHm7kmnGLmSXmBx2QUtUIO7rGARlU2gck+nt/VvV4kHCSvKsOGDiIDNdcgm7KfJW
	PH2eMabIf8tlqBeLcKaPCxc1AcwWYT9ZPyW1C4BH+7KJKMfrVV2qreRIDld4AqGKrQSTg1i1LO2
	4hyidLFNkSUQ=
X-Received: by 2002:a17:90b:5826:b0:3a4:b418:94ce with SMTP id
 98e67ed59e1d1-3a4bfad5481mr925945a91.1.1790732270586; Tue, 29 Sep 2026
 18:37:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928193046.6698-1-fmancera@suse.de> <20260928193046.6698-16-fmancera@suse.de>
In-Reply-To: <20260928193046.6698-16-fmancera@suse.de>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 29 Sep 2026 21:37:37 -0400
X-Gm-Features: AclHuK9OxXVVrbvz3Zo4XSmKnOU38tEex0LOM5rHmx7snd46dBYW9kvi1MOOmgw
Message-ID: <CAHC9VhSQe27X+YVp4crJYhH_OxeVt=G6HCyrOqJgDii=MiCXsQ@mail.gmail.com>
Subject: Re: [PATCH 15/16 net-next v2] netlabel: cipso: introduce CONFIG_CIPSO
 to decouple IPv4 dependency
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: netdev@vger.kernel.org, horms@kernel.org, kuba@kernel.org, 
	pabeni@redhat.com, edumazet@kernel.org, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, Eric Biggers <ebiggers@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Florian Westphal <fw@strlen.de>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Wyatt Feng <bronzed_45_vested@icloud.com>, Joel Granados <joel.granados@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Yung Chih Su <yuuchihsu@gmail.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:32=E2=80=AFPM Fernando Fernandez Mancera
<fmancera@suse.de> wrote:
>
> Currently, the Commercial IP Security Option (CIPSO) is unconditionally
> tied to CONFIG_NETLABEL. Because CIPSO is inherently an IPv4 protocol
> feature, this creates a transitive dependency where subsystems relying
> on NetLabel (such as Smack) are forced to depend on CONFIG_IPV4, even if
> the user only wants to utilize IPv6/CALIPSO.
>
> This patch introduces a new CONFIG_CIPSO boolean that is automatically
> enabled only when both NETLABEL and IPV4 are selected. It abstracts the
> CIPSO-specific Makefile targets, sysctls, and kernel APIs behind this
> new config.
>
> By safely stubbing out the CIPSO netlabel_kapi functions to return
> -ENOSYS when disabled, this allows NetLabel and Smack to be successfully
> built and used on IPv6-only kernels.
>
> Signed-off-by: Fernando Fernandez Mancera <fmancera@suse.de>
> ---
>  include/net/cipso_ipv4.h         | 18 +++++++++++-------
>  net/Kconfig                      |  3 ---
>  net/ipv4/Makefile                |  2 +-
>  net/ipv4/sysctl_net_ipv4.c       |  4 ++--
>  net/netlabel/Kconfig             |  4 ++++
>  net/netlabel/Makefile            |  2 +-
>  net/netlabel/netlabel_cipso_v4.h |  7 +++++++
>  net/netlabel/netlabel_kapi.c     |  3 +++
>  security/smack/Kconfig           |  1 -
>  9 files changed, 29 insertions(+), 15 deletions(-)

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

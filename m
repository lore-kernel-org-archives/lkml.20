Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794255250;
	b=LBPIraKEMiIPoavHWJ42FEysHv/ABDfPo776IEL2sgUJFuM0mzelvikRMgC7zs7+yg7h
	 jm+4d0sYNHSA+FbkQbOAMXHmnmUa/tjmuH0VQTRpKplb2hRrQxulorZ8sL3FgMYIQwlPq
	 SYk892ZIdos8hRiYbYZbDKA22CvwevrwJsuj78FJ4CUD5HmFHBo9Taa8UasMSLr3CrwCT
	 U8a+BH+Ilu6qLqPov6Cl3uesCNFrvhkEr+fRVF0S4fdDdh46FFUvSDxB1I7cI0RQbyjtY
	 s9vZinZTKZG2guitBiIK2ZCSm4W1rq83FicHpjF/nJsnp5/3u23KGyIV0ci1R+0d9KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794255250;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VXIL8vk5nLZY9woNoUytKHIxYR4kPI/WQboSs45p1R8=;
	b=p/uL32nF0vI5rbobhrXEMDeAlwKt5W6Sg67HeTGJ+omOhzerSFpM7tAGBlfKJWLTJEVk
	 nLdawhXw0UAT/vA0ww4Z3BNrhW8yk3twMFifQWChAM2YN9RGBEQwvqRjpWKhNgz57RbRR
	 LqffYeAg9u3wzYw0UFxWZjXLETh49bmcya1zG+KvpGQqGP2vX2D1Z1IMJwxxxe0yZ4kiM
	 qAA/qhLRNZGRZOhcQinE5knCGPKb5M74WpHYdGisOfy9cy9HGw86dYagKUNwslRg1kLdP
	 xVonlr7ICojoEM9tjSKH8J0jXuCJzSgDnRKzxU/9rVhnYzchtVPnNVh5PcZkkfxd/2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=paul-moore.com;
	spf=pass smtp.mailfrom=paul-moore.com;
	dkim=pass header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=bPMMvzll;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DA5606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19DA5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=paul-moore.com header.i=@paul-moore.com header.a=rsa-sha256 header.s=google header.b=bPMMvzll
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so720218a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794255249; cv=none;
        d=google.com; s=arc-20260327;
        b=n4VcXdXhOUeqUdpHmGdxgait8OlxSzlSxIHes5TffuTynlogy0aWR97XXvOYCrGlW9
         lJ8waf1bbMxBKIwhJf7O1DxuAsl6BDs76MOnwOCW5aHkaqjvD+9LEhar/ZDhpfZmku3R
         FeNoY8TAG5XSzxIJdDXwZ3qrMp0KZkixnruuooL7phG9PoBdIbABpcksLvCECBejioOu
         wVZHUHouhzAio5oPC26DRLMj8Qdt7X3N9isCHXKpUbZzaRufve7qsTA/gSuiIyNJbEnf
         K7uPiokAFIwuY0IFGtvGan4FJCkqy39zA2f3Ugjz1sCyb9ls5gmwCKbNDrcwHMfzT5cN
         IfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VXIL8vk5nLZY9woNoUytKHIxYR4kPI/WQboSs45p1R8=;
        fh=H4RzgnA9Cx3hbL6Dl/fuD+6V+qVbMz16O2zj/jvlnkw=;
        b=fS0rqBRkZSnna/Vr4BqlljNLHO8xOmf2msICZbW5ghmaXaEe/vKxqk79HQTfLbZ6T2
         5x0qstjYPGXt/9XYwjJ81ndMlnLB00w9v/856adpIP7KI4dJq4+Z+7zsA0T5gCwvgElf
         3Yq5G5X+IuhydxEcm/9/WoomX/JlAuKAxTWX4EV6wp7iuiscXjQXijsnkz9aVQ0t63f7
         OTnVc3O22MzjrUOZQHiOP14QzQxNjsJVJHzMFUXFKyOKw08Xn3jSUqz42e3DfKR9uTRK
         vxaqmlOpb9RDa9g48McJnfF8kXVBUdUm5ogHgCd7Uf2E4LxmmUj0Th+vFHiQgJ/z+AI2
         tJ6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1794255249; x=1794860049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VXIL8vk5nLZY9woNoUytKHIxYR4kPI/WQboSs45p1R8=;
        b=bPMMvzllU0yTQQX3RK6h5UbI6bmYfHGmNNP5VaRJ5GDzkjEjLchbGFjBkHWEHWVEK2
         UVDCQ/Oq+cuY5K28yKE33O/gdrHWK2TsOlIpihV1+nrZJAk6wpYBe72IS4kJq9D9D7S/
         C+ATpmS4If8e9tGs/YMSBnDvsJXO5L48Wfr0GIxatVJTgOHI1eAkPn5yJpjzpyWSBJzH
         EE2xD9Du9nOx8VLIHcCMDu84GpRqn9QthLL6xH79XsJhVZoG7KLfwySEMsHLt4TvjAaa
         B7CkeP8mxW9zMB9eeQzgd+Hh+Tq11ml6UIUa7rXVebk4yGV1EII2xqGWl+Y5bJhJyz+N
         8V1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794255249; x=1794860049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VXIL8vk5nLZY9woNoUytKHIxYR4kPI/WQboSs45p1R8=;
        b=bzv2U/w0AqysNjOOjudwUWAikcDJS9rzru8Y89SZ6QjHHIqLr2gYsa/9fDJp2UMkmy
         6LR7IoKUxwgdK1h1AsUt/eyz1JTto4nhjlvZ4d56r1jh1IETjpc0/pdekOpaPs8bcy+2
         4wI20b4Acuk3UAvr76q9tveoe8rbL7cIU2elrZv2EWn1NepCEE/w6S8oIkYaDAz+tNwu
         AQ9P1CjF2kCJqKBMDvg8Fwr7gR2L4nCPmHFpc/qGbq2z9c1/ZIZDOkO281BY58SKwcqg
         4QGQUTwm7mW066RZhVeGBjUCCGTeF4iKl/tahOE05hOLd3XdmJWXJFl+3JuGn5zjZoxw
         khBA==
X-Forwarded-Encrypted: i=1; AL+hErFvs8kzIDn9Q3ScEKjS03/x09DXmeY+U5WkvwXl8pAY0MiHE5QSXz5fxTMdfZ7t9lZ5EX2gCkUG+Uu6BLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z89s00QUGReAj97gz/CWbQpaJloynYq828CBbTNLi8OLJ3eWFB8
	3iJU8dHb02lP647Nuugddn2yTC0yqrtGOpNMEvvOl1FBZrzr36dMdr8u5wn6LqhTC5Ni/qM4fyV
	Srbzj7S42Urp+W/zf4CoPqCDk5DbKm0jf6AEv/dzF
X-Gm-Gg: AYBFou2rPxFbVPUiFX8cCX+oVTKPjYwNnqFoPSRy0NruSQ9jBncfFXJ2NFLJeI9AUnn
	vpfEYDpmJS3TdzKaP60N6CInA3dX/EJHvo7Ug1GPkIYoCukrGPmv1q0SXJBTBPyHnRtSO/BbPhp
	w4PAjUL2/WXunXYbKlStouOm05FRk6Kr4U4xEl5jgkPt7Pg8C6am3jFg2pfA6HEEmTC4MtzH1cC
	IndF+JMellmAVGpdxHmLkbdWPOuABpJXKtzoFKXSwnHw5ryr9lz3bU0+zinZdDNI47ETMU6RXFm
	b+BJd+1iVaykTtk6ZZFIFB1iUfMsVMge9THNPsGUlrldpBgSfPGeh172oCJ3IoWQHe6KWgR4Zop
	xosFc9QjUPwoAJ1C0wVsGNJptiecC0if/vcTwcjX+oJcElBXMAlSvyftaOqt+76o6qCYI
X-Received: by 2002:a17:90b:4c49:b0:3ac:4e18:238c with SMTP id
 98e67ed59e1d1-3b166d1dfe4mr716868a91.49.1794255249343; Mon, 09 Nov 2026
 12:14:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-cipso-rcuopts-v1-1-31ae931d7a0f@google.com>
In-Reply-To: <20261106-cipso-rcuopts-v1-1-31ae931d7a0f@google.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 9 Nov 2026 15:13:57 -0500
X-Gm-Features: AclHuK_EGvlYUSv_8gjZT2YZHLuHJRnj0DOmSE59Zf5Dm3hlbe4f7hFETs2MdEE
Message-ID: <CAHC9VhR+U3i8xNce8Ps8k76EZr_AeVf+fHET_Ncu1+yO1G2zSQ@mail.gmail.com>
Subject: Re: [PATCH net] cipso: stop modifying live ip_options_rcu
To: Jann Horn <jannh@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Simon Horman <horms@kernel.org>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, =?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Casey Schaufler <casey@schaufler-ca.com>, netdev@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	selinux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 4:40=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> cipso_v4_delopt() operates on the ip_options_rcu of a socket or a request
> socket, and tries to remove CIPSO options from the middle by moving all
> subsequent options.
> That's not allowed - ip_options_rcu can be read locklessly and must alway=
s
> be consistent. For example, ip_options_undo() reads trusted offsets and
> length values from the options buffer.
> Fix it by doing the modification in a copy.
>
> The core change is in cipso_v4_delopt(), the rest is ugly plumbing to
> propagate memory allocation failures.
>
> Triggering this bug requires that the system is configured to use CIPSO.
> (Setting up CIPSO requires privileges in init_user_ns.)
>
> Fixes: f6d8bd051c39 ("inet: add RCU protection to inet->opt")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jann Horn <jannh@google.com>
> ---
> I've sent a separate mail with a reproducer to Paul Moore.
> ---
>  include/net/cipso_ipv4.h     | 11 ++++++-----
>  include/net/netlabel.h       | 11 ++++++-----
>  net/ipv4/cipso_ipv4.c        | 16 +++++++++++++---
>  net/netlabel/netlabel_kapi.c | 24 ++++++++++--------------
>  security/selinux/netlabel.c  |  5 +++--
>  security/smack/smack_lsm.c   | 14 +++++++++-----
>  6 files changed, 47 insertions(+), 34 deletions(-)

Thanks Jann, this looks good to me.  In a perfect world it would be
nice to get Casey's ACK on the Smack changes, but since they are very
minor and basically just pass the return code through I think it's
okay to merge this in another day or so if we don't hear from him.

Acked-by: Paul Moore <paul@paul-moore.com>

--=20
paul-moore.com

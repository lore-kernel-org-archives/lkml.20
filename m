Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792684027;
	b=JJ6cdXQhz99FTvLwH97Z4pyMBsEymuY5ROcabBxN/s29Kyc5wEtP2IDWqgmL6gAX8MQB
	 1mRz249mQ2yeQsErQFapCDHo7zRKhvpya5TN+hZHG/+vZHe48pipvdVNM6vqLr/u+USTV
	 XL9WhvgGiFAYhXsMLXwO1ygv6DWZwgRM+EY7pYtEsQ6iaRH33i2oHkc+LQ5cZFUg/+jHh
	 8ligY3aCzEqOrea/QGGLHqtbvs9kv7leWlLiYZV40M9syYcxW4XDKzWl8yL2kKxRfTZ0x
	 pIxlEfphkewTkkKk3g6AyA71e8PYnSj4FpwXvc5Yxz6m3x7j6o5oWbfoU9EPNOSmnoQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=K87CCPS1qg3XSuuyQwUVQwMf99DWkHVL+uF6Y4gOyqM=;
	b=uKqNY6Mv0vF+tLw5xHOwRLboNNDGVfTNyThizV0T29Jn/QnJkOAMdD2O9DMG5+tUaFDA
	 uPkI/A00tMIi4jvHLwYZdJgxD3AGUnpnBdptSu0UYFlRdw8CxWhZ7m1+msgprLq94hCPg
	 RLNVtFQFDoYeFAXrnhG4ql+sSr8+VLTuWwDNf82IIhziJKMMg2urkO0jMn8U+dcxH3wNA
	 BJsiMh/BRAHU9bzKky6Y3u+HnT922RgSOwUNLa9yPzywdCeGrczXAnOW1dPXgZ/21A/1m
	 jg9ju+IWuBCdwXAtAsj5NJ7YjhpHHFF6eDzoWrI2+kHhDl0dixMoWWS5mFq3FLXujqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B35606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B35606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-88cfa501c5cso2854b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792684019; cv=none;
        d=google.com; s=arc-20260327;
        b=CfvLNVqx7/7QHcK3U69VWJTPyOCIOtsD2z01zdyLWJ4MlsvKGooi69txJjrcx/LeWz
         qBIZET6i0oM3Zy3OFogalJ6Np1Q83ZIoN3H4XQ+PVdKdHQOyuwE5GmJsJqICAvA6zI3b
         JBSKChqZaqfiYpbL/gL6d/amM80jMAupWSrP6bVwswpb227P9UhVodc6rYOuB3O55Wp6
         z75BvLNIPySxfVYOk3nr10REmAXw0qUR1LY0mLfGjseVujoNV+N6WaPpq1tzTDkXrLWT
         D8jg6doUKd0ofIYFWqOzFa+00xQc2Fb62vY80JK8somd/UA9UXM1315TQsJTU+k9Bb1G
         cQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K87CCPS1qg3XSuuyQwUVQwMf99DWkHVL+uF6Y4gOyqM=;
        fh=95OuNRFZu273BlS2DudeOG91BWeaT2OR1WhPLOSlwiE=;
        b=Q/Cxy8h/cDTiBbRhraRGpCWXuCsoerRP6cwwXWu400w8+rbIbpThoc7v5RL1FgjPaG
         wBkv+sIPI3ARoR9SKmlnq9gaGKvF09T5c8qzEFbcDnSZBAdbRbDEj5aLRggXsSUpKEAx
         RWTLm9fI8OjR1Q19uQRcFHexJ1yPnTjjmOvlR9xYIWmI6c/X/19M6Y3vf0aYKNyM4iPk
         SHuHXRHFcVH4JZKniEgyyYnuXUJxY4y5HE0CQeT0cnh2BvosnJHqqj77KHXZQ+Nm9KEI
         GPtcdjBqaM21i37NKEjwJtfCZzMXHmBRuP4WzB3N/tQKMrx1tvRjw0AQ1TrLxWWWgiAZ
         tTjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792684019; x=1793288819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K87CCPS1qg3XSuuyQwUVQwMf99DWkHVL+uF6Y4gOyqM=;
        b=TsC7NEufCbv28J8S4G5i+oT1hwSTJtty6U4/45do0DqJovZpBLkWWvwGHpA23hWyjp
         BVHWoOYa3vqQKkpmcwBvjZtrdFEs/G9rrigRuQNPtiNZ24hzHQ3j3t2Xi0Vt8brw8wrl
         fcGX9wT57wm9lbBTyFcb5ZFrzncdN+VhBuGiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684019; x=1793288819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K87CCPS1qg3XSuuyQwUVQwMf99DWkHVL+uF6Y4gOyqM=;
        b=p9J58UXTqYjLL0gzW5e/MVAVnXPETGRbd563BymfLMTCmvUHt4R6CI/MQB5Bj9dt8a
         Q2bzcU5kss3exFtkc1hVRr6w6Icb2FeP412Q8hNpBHfGXnVoWXl0mQxzcM7nT974n1uS
         KwbcX5hNxMYJgY0eaJN61mC6BkaFH9O1nAvk7WCXNw8VSCwSq+CNN3GtNWhXtC9+fCCp
         7DRmFcY3+vBSZdt73beCFjybN1P/LoFdFr1/d9wdkavLvjihKXTUnGXVzPEfSBSh6bx0
         jogUMMq0FsVwvB/Yatfz0w4HpNJ7h56fQsmoWNYPeoq/NSm2FdhUY3XVUnjvuHRA62Mu
         ki3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJfDmUFvZ0cgIlbaKcauaYJ6yQ7OQSt8EpbpfcYs1M6FPvqYwsrNjkGvumyWv/rlbwQALnbTmVNKsMSRs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSPYYIxIlWmJsRCtZ4hb6jdfm6eNuJbiMENEIPzqgiVswvLBpb
	9jJ13em2qcFcIuIw1rTyE6m4SIm0RZW9BAHYGla9f3bkKW8yWkRy00NnZGojj2tk9ZW27jpHZbI
	WV6uWSkDujoktmHachCaeZ+RtFnCYAGFzz8luW7Dx
X-Gm-Gg: AYBFou21Uq3YCa/VyQc3zl2Pxk0y8cf9/ccHHznxzcRbwVDZWcp1fuiWHKIcjRGlUBe
	Wy2LIPOoH8zdclz/He+agRBQvk43UlTBfRLwrGlmwUIeh/AYqd7ePlqiNXiL8GnxXj/n5wHjZLR
	5EJNcPrupyMgEtnTHPHSWu1GGRKX2kXMYu5jCGrSCuwZcFPLM/UGb+f30mPX+ykREemjprlpaFZ
	Tc1Dz31fCIZlXVswi8PafH8UnawHkcLkoGhOOGztoSbJnRUv70BfRJgeqPWUop8MekQZ1TGkzDf
	RnavUGTvTBcZ2kq6IgNFpifM3nNV1x4RODcbftRBgmkhOa942c5neoMPatc59NirzfzKZ486qnl
	5mcxpiAWezj5M8wLg5ICwRZai+1KzxgZ4Ts0WEh7f8/7KuuaButeHLiZHfh4sv72OTH5cDkP57l
	0Q7x825GD+HGOIwSE=
X-Received: by 2002:a05:6a00:ba02:b0:87c:9094:b72d with SMTP id
 d2e1a72fcca58-8a089c3e63dmr4812509b3a.6.1792684019112; Thu, 22 Oct 2026
 08:46:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022144653.60550-1-shawnq1@163.com> <76f5a903-90cc-4eeb-8afc-99b5cd89b75d@lunn.ch>
In-Reply-To: <76f5a903-90cc-4eeb-8afc-99b5cd89b75d@lunn.ch>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 22 Oct 2026 11:46:47 -0400
X-Gm-Features: AclHuK-D0LdlgAYPPPOkW4ENypnkCNUafVGtRqQogBa08w_vna_OR2uqMMb0vO8
Message-ID: <CAM0EoMnP3VkEV6fOAMdZ9ma9egUpV4AFfB+44k4VD7jx2dHPNA@mail.gmail.com>
Subject: Re: [BUG] net/sched: act_csum can checksum beyond a short IPv6
 jumbogram skb
To: Andrew Lunn <andrew@lunn.ch>
Cc: shaos <shawnq1@163.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2026 at 11:36=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Thu, Oct 22, 2026 at 02:46:53PM +0000, shaos wrote:
> > Hello,
> >
> > An unprivileged process with namespace-scoped CAP_NET_ADMIN and CAP_NET=
_RAW installs a csum action for UDP-Lite and sends a 300-byte IPv6 frame wi=
th a Jumbo Payload value of 0xffffffca and UDP-Lite coverage longer than th=
e bytes present. The jumbo-length addition wraps the pull-length check, whi=
le the later checksum path still uses the unwrapped length.
>
> Please configure your editor to wrap lines at around 70
> characters. Standard netiquette rules should be used on mailing lists.
>
> Flooding the netdev list with bug reports like this will just result
> in them being directed to /dev/null.
>
> If you want to do something useful, fix the issue. Please do it
> slowly, one bug report at a time, so you can learn how to do it
> correctly without wasting peoples time.
>

And worse:
1) cross-posting to the security mailing list on bugs that require
CAP_NET_ADMIN and CAP_NET_RAW
2) Parroting quiet a few bugs that are already posted on the list and
undergoing revision adding more work to reviewers.

Which LLM do you use? Teach them to read the mailing list before
declaring an issue unknown. Just because it is not already patched in
the kernel does not mean work isn't already underway. If you fix these
issues, post again.

cheers,
jamal

>    Andrew

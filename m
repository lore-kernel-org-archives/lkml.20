Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504235;
	b=vq46u0QeJ9vMPqbQ1vTGeC8jCzk8Jd7ok6Dig3vBePVZmxQ+052pfZodx8WUxkwnU/Ey
	 qGEuSF8ASua51upETAQK5e/yC7uVjJfwdAQeXFZiYf5dozmnduN5sCpGBC2ar8p2asPfn
	 Hadp0tGl8TzJRKFGvGJjVLUYUxL9nfv2SfypY+O5w5clXF1lH+1FS3VtZq9w3uydiYsvP
	 nbgzn0gn4xL1sDDgrxfEqmbgklMRb5C0MPo79jXNsmpa4jqDA0La8m/QFCbn9+QChA/sM
	 Ypf8zwHMdHYaih27PAWS4mCsBJMkUc9QjxdhAfvXCNECBYF6Kl9yrYd1VfXuFq1FEWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=96lFzuIF0y8LTZ/Xj/gpwS61X9RAuz+hWffATqcJfZw=;
	b=qy0cQtPZ6MLpHTDh8IF/NBfxa+UTcSprCpvGznPEqVGVahGEU/nh9VnXXgJaI23b58hB
	 Nn1IoObcA84jMQiv4Ofs3aCEsFXZjo7xqE3mMDX9UEFUt6fjdwlMIA7sFk1U9WILD/SJ2
	 SeiPgs2tkVtqcnWl+8gLVUCKMEiWn00ukEH8G4d+21KEJtObvwJ/Foz6DyMNJeKMFacX/
	 X12Igpsrya7OxCFbhnjNO40CLeskNyeP2Zs3UayNMZsU0R5AmVBmUCtK05eLYFG1BBvst
	 l3cm7eoWAjJZABMctsC26esfMoXRmfsi/AKj1ebE1LVOKIuCEPplxcsnNvAgFZJCuAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ONkEtMSC;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7019C606AB29
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7019C606AB29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ONkEtMSC
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5eac6c5f927so779649e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504233; x=1793109033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=96lFzuIF0y8LTZ/Xj/gpwS61X9RAuz+hWffATqcJfZw=;
        b=ONkEtMSChaZ/kXr1iIEYaNVrBiwMiySHPPA4GNOuWGjsv2BrWZaUOoJ5J8X79pnhzx
         7xeioSNgPyYCGWj1xPBLR07Leiirw6LR50AaNasrNP9fdE0h+qyR4cqnPsx559blmnCm
         /J8TRgNz/PJHHKEYIHNmhgqbj4I8QUPvUY3njmNyIrRaQ/WgCBs3Y4m9U1tLESg4FdLg
         VHwJR/y8o8iNmGCnvKhfdShCGL7l9Wd13QQBbEg1M22mdwsRPfSXn3CUVUGdQp0noAq9
         +9hlGW6PebbaVKG4L+r2scB6fSxBz2vzVEP8IPYNFObQfW4GxhGEyGD7r1f4zzOCfn+U
         /+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504233; x=1793109033;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96lFzuIF0y8LTZ/Xj/gpwS61X9RAuz+hWffATqcJfZw=;
        b=aCHjSCgjUEN9bT6WsuN3KwWrjRikGVOTijMFSsnccEApj4YwEXHQhuojw/auO24rD6
         xupUPp+begQusMJKW8M+QVjgX17vMCKdwdIZ8hnCiS4V+oVHi0PnO77QSNhIeZ23mVVD
         58tfzIawIueCZuMtl73WHT3f3VqODwq1oPA8QO/nCSSlCPg7mNv2BT+YyWsgKbBuq29O
         rYsMqH30J2RUPXJcpCRiP4ePFzUMtlE33JTU8RF1WkTSk8e0bTal+kEcW7CIdmfC4BCz
         J5k7gJ9qRCycYhKJUIAzTqcz3TMmThZW9N8p9TYlWbXM0i01vgojkgfm3ad3q9dgg/ZY
         NZWg==
X-Forwarded-Encrypted: i=1; AKwUvBy5DB0+sy11hF/kyEjdl+tAJTUwsSbQgUWvMb6f272K5a1915573cmU1jmwLXLXTjNMLt3Y97Q+AEo80Ao=@vger.kernel.org
X-Gm-Message-State: AFq9FYK44iqI+ozC93IFC7zqOdEKYC+cWk43kWClNUEWaNB7HCmHaqCj
	Ca5AdkgpVicD6GagJacn7xCGOuUppjyeXFHytrnI9c8BILGC8aoLFmUi
X-Gm-Gg: AYBFou0VVytLICUmQ0X0b43bgaFa/jDhb6Zsq1O9tXC+wO87z3dDC9KvZiS31uHvhSW
	M/2sp6J/FqksTS8E+2QjdFZEVzc0l6jsHkzLiqXo6utpkZ7XSNc1Md2DGoG3IZmfx/WNg50/Cpt
	cKcg0IqVwKeXfUAaKsApMnCHiV4ZnlbSfuMrjE5bxpAIubdLn+RNOnkiN/QlOe5do8Aj0lKoEh6
	wyMK8hYoWKd3SuFwpLrJoXSEySnlvlbMoTPUwZxcqoUbMJeidN5FR8oZWiThtaK2qelfIrwlkMN
	LmamJtKGSKUZyg0h+vCsUZJDhemasN7Ohmu8KGPj1lGBF4rzcvpXa5GZLO9hzjTGyQHybpxXZvh
	ebjLqtNYSrwXOxIzRbrCDJ4gtD2C+xC+WJVJnqm6VO3dRk8zYLxnq0Mkz0Cw+v9pLj8EU36nsgy
	yQjIyTkV26tHrK6QU6dGba2DggnUmj2orjNqWLOrPAI5gqPyn9RALXMPvzGHDubd6sGw7aZnauz
	F1jz41x0LaP5kwAWqCxkEy23rYOCctRAzLsK9V+kiiy4fA0+nnpauX984tingLv14ydoOf+R8Vc
	+RhfE5iBhzu7Hkf+7EXqOvCT6Fa9jwPxbT1mpQ==
X-Received: by 2002:a05:6122:4890:b0:5e9:5e79:ab3 with SMTP id 71dfb90a1353d-5eaaa954f51mr4242745e0c.21.1792504233298;
        Tue, 20 Oct 2026 06:50:33 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eac20d6aa6sm7205788e0c.7.2026.10.20.06.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:50:32 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:50:32 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jason Xing <kerneljasonxing@gmail.com>, 
 Josh Don <joshdon@google.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1a81a5aacc334@gmail.com>
In-Reply-To: <CAL+tcoBjWDwA+MrjzRapUeAom-4siL-cnXXLQrVf-A4myNRxyg@mail.gmail.com>
References: <20261019230758.2960779-1-joshdon@google.com>
 <CAL+tcoBjWDwA+MrjzRapUeAom-4siL-cnXXLQrVf-A4myNRxyg@mail.gmail.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for
 udp{,_v6}_send_skb()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Jason Xing wrote:
> On Tue, Oct 20, 2026 at 7:08=E2=80=AFAM Josh Don <joshdon@google.com> w=
rote:
> >
> > We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry program=
s
> > to monitor UDP transmits. Both functions are static and have two
> > callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().
> >
> > After an FDO profile update, udp_v6_send_skb() is now inlined into
> > udpv6_sendmsg(), while an out-of-line copy remains for
> > udp_v6_push_pending_frames(). The fentry program still attaches
> > successfully, but it is silently bypassed for all uncorked sends.
> >
> > To address this, make both functions noinline explicitly for tracing,=

> > as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
> > Add noinline_for_tracing annotation for tcp_drop_reason()").
> >
> > Assisted-by: LLM
> > Signed-off-by: Josh Don <joshdon@google.com>
> =

> I actually mentioned this thing a few times before. The original
> thread was from Breno who tried to apply a similar change for tcp
> sendmsg. The fact is until now we don't guarantee those functions
> should be kept noinline like how uAPI works just for BPF prog. What I
> suggested was to select a series of functions in one Doc so that we
> could tell people those functions should be noinline or whatever else
> just for tracing in a soft way?
> =

> Otherwise people would argue there are more functions that should be
> done in the same way because they internally trace it.
> =

> Willem, Kuniyuki, any thoughts?

We'll have to review hooks on a case-by-case basis for performance
impact.

If possible, it's preferable to select hooks that cannot be inlined.
Over limiting what the compiler is allowed to do.=

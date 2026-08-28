Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7C5377558
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 16:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787936048; cv=none; b=FtAggJ62mqDULvO340H99jkooDkgGesvu8i3K6sxK2W+GTxO+JXfIg4SBf4Ju4eT13mRkOAoYqtNEkW2nVLXhs28fIiAu3/WX916E8u7nMDgksAR+yAXJ8vfxam/RsWVmhBQtGJjvaGdXvXKixlud9CLZ1bdgRoLUAXISvcm81w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787936048; c=relaxed/simple;
	bh=xV58Vw1wCq2qg8UpHCbXJ07X+09OeIqQniW9rzZXcOA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Fp2iMLjeylSaqlDrspKDkcrHQDrqVfZ4t6HPUaYUtZO+l7xjQzmsS8O6hEhQ5RxnYNXdu4ek8T+RSBe7HZsbpWWvfuWDk3SXKDhwgKWap/gO5iH95e6Oi/ZICLjG6jWyC0zZ+OkAmam5EtBV4qXQaLkH9B8nMgY3t71K5ewKotI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eQRVBVUU; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eQRVBVUU"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7ee37dc91f5so679268a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787936043; x=1788540843; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xV58Vw1wCq2qg8UpHCbXJ07X+09OeIqQniW9rzZXcOA=;
        b=eQRVBVUUAsgpXwzA5UNrPGLyTJK+ESsEsK+XvgKAlzSNWslSH3+1RSA7r6HJRuhG2d
         L6j1MnX7oPKxxznbZg3EQqYA1xuI5paqWMygsslG68MVEwouRrjCAKOumopp1VpRPlzm
         XnfFg96mjI358FBKeAt2L+ys3YcDFqEefHejNa6olAU1zJdryssH95zeRF1BZy1CVQHY
         XUoGcT3E0AhZ7JzlTfUXudx32slWk3JREpFpWVIpsWiV53dqlL0J1fYZIc0jUbQ9WtS/
         kzc9PRG1hEcziTingtKQ2nIF+hW68rrYI8RX0vKCJCwSCg2J1yLBsg8gdKmJEbEaD8Wx
         AgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787936043; x=1788540843;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xV58Vw1wCq2qg8UpHCbXJ07X+09OeIqQniW9rzZXcOA=;
        b=MtIDtMrgrau503Ai0r0IIRC7jHKNR7JTldjfpMVvCLI3BA606hW3GPXXNou8Z2Jnj9
         C8dfL3dhfFIQlMjgBjnuLS2GJFqCloqZSH0/3AROnzzRupn7vd/Dq4Kx9XMjtqe4iw0Q
         5SBISj1FwouPyD87dyjyGTWpqA1PcYJkCP4+PLNTPI8gp1ilDWGgb3zmHP1U/tulOCu/
         Np6ayzWoopRPQHj/hFtmh4T8jYrFvzkP18TZ+GQ0cpgEWtCajKC/Clt87+puxRQCQ55h
         3nEo594UxTvNcnWHp/L41OyXQtZV+Wc+Byb0/VYaj9hfGdBjQFx+Y7BIqZrXuQ8dEfMQ
         IKkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpFmjOQ7AmcNVL8F3i+ydfBiocGVUpvGrqnuWwTN4LFJL3b+TCDspk6vWG0hmKZe/FOJNrtQ/ehGQbP1YE=@vger.kernel.org
X-Gm-Message-State: AFuF++k+0AzL6uKeb8DoHLay2+uhe3EXacZlGQ767AMaCHjvpFZGb7Dx
	eBx1FLjc6tVwfle2i3vP+Gc6ei5vKpy7NHUIdO1lQLv/TW2ZoZ6RXaI7
X-Gm-Gg: AR+sD11VmCK5tioTPgEWqldhpHmUzMZSF0FQ+tJHkpoT0SnJ65kmMslUT79f/ACFI3a
	uwYvq2u/Om0J983PI/230bMPLCSRX3OVmbGuZ2ZzMfmeV+F2las/UOHQLKihCHcra92iRRGOnXw
	SxXCM1Z/lEclPM8QisM96aG+pJ7ahKO4az9d2S9zqUsQxADoyi6KEQb47wqhQsWdo5FTbDy0KgN
	gGetV9D7vJGglYmyxGVy2E8gywsY3AFN6XCi3NaNuo2PGVM7jyxE1WA06+kjFWNht3m/dXx5UO7
	gO8gxJ2wMtj2nrwAW7ujtxPskiqET1SECxYWMXmHBPt1DAEK/RGxONQDQ/cmV0Y1VM88jMVuxtE
	VANezecWuIDuDQO6kgFW4EfpTXSVELfecRq/tm7huUCCYhUZ3u0cNxV8FV0qGwAXgOItyCI3uaS
	fZRci5skOHgy7wPh27YXiT4ra0JSWd8VJDBIRGY+kSn11CQhR56SE8Vx4=
X-Received: by 2002:a05:6820:180d:b0:6b0:589e:42f4 with SMTP id 006d021491bc7-6b1c66b745cmr7372417eaf.20.1787936043165;
        Fri, 28 Aug 2026 09:54:03 -0700 (PDT)
Received: from localhost ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1ce122df5sm2041447eaf.5.2026.08.28.09.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 09:54:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 16:54:00 +0000
Message-Id: <DL0QFI20UBL6.3BM3CZWLDS1K3@gmail.com>
Cc: "David Ahern" <dsahern@kernel.org>, "David S . Miller"
 <davem@davemloft.net>, "Eric Dumazet" <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Simon
 Horman" <horms@kernel.org>, "Arun Ajith S" <aajith@arista.com>, "Roopa
 Prabhu" <roopa@nvidia.com>, "Jaehee Park" <jhpark1013@gmail.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next] ipv6: update NUD_FAILED neighbors from NA
 messages
From: "Lawrence Lee" <lfqlee314@gmail.com>
To: "Ido Schimmel" <idosch@nvidia.com>
X-Mailer: aerc 0.17.0
References: <20260813233344.445265-1-lfqlee314@gmail.com>
 <20260825115226.GA1338930@shredder> <DKY84BEFKL1S.1BZWGQTGRZLMU@gmail.com>
 <20260827090516.GA2014023@shredder>
In-Reply-To: <20260827090516.GA2014023@shredder>

On Thu Aug 27, 2026 at 9:05 AM UTC, Ido Schimmel wrote:
> On Tue, Aug 25, 2026 at 06:07:44PM +0000, Lawrence Lee wrote:
> > Sorry I should have been more specific before. Maybe a better way to=20
> > phrase it is that this would be analogous to IPv4 in the sense that it=
=20
> > allows NUD_FAILED neighbors to change states upon receipt of a NA, but=
=20
> > by using NUD_STALE it remains consistent with RFC9131 Section 6.1.1.
>
> I think that your setup is quite unique and I don't necessarily agree
> with the statements regarding the CPU load, but it doesn't change my
> conclusion: IMO it makes sense to transition from FAILED to STALE when
> receiving NAs (most likely unsolicited given FAILED state).
>
> Mention in the commit message that trying to resolve FAILED neighbours
> by periodically probing them (e.g., using NTF_EXT_MANAGED) adds extra
> work compared to having the kernel stop ignoring the information that
> it's getting via NAs. Also mention that the approach taken here is more
> conservative than IPv4, which by default transitions FAILED neighbours
> to STALE upon receiving GARPs.

I will be sure to mention these points in the message. Is it appropriate=20
to credit you with a 'Suggested-By' tag in the commit messages as well? =20
I'm not sure what the proper attribution convention is here for commit=20
message content.

> Note that you also need to update the RFC 9131 comment in
> ndisc_recv_na() and the description of accept_untracked_na in
> Documentation/networking/ip-sysctl.rst. In addition, please add a test
> case in tools/testing/selftests/net/ndisc_unsolicited_na_test.sh
>
> Before submitting, please read:
> https://docs.kernel.org/next/process/maintainer-netdev.html
>
> Run the CI checks locally:
> https://github.com/linux-netdev/nipa#running-locally
>
> And LLM review:
> https://github.com/sashiko-dev/sashiko#1-local-review-recommended
>
> Thanks

Will do, thanks for the suggestions. I will submit a patch once the tree=20
re-opens.

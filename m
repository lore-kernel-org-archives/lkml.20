Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792546613;
	b=ZE7NT/Fdy1sYIV0w2TRuCuS9aAiRE4AEBF4ujT0jf25XkE3TZChe0zSnZBOJsC8JGqYv
	 rxASRBGek/JE+f9mV35e+73jIo9+ODXOYLsjYLvFK8EivcuJQ8SPzt1SWXB94qv4o/1lM
	 azas0XrCua7ncGD+evmCZdeaavKMyi5kWWf/vEQXjMWZoJeLuGo4HDpkPXs8yC30/MVmM
	 +VKx7OsyB5ch0kHYfO0UgJq4vyAgcUfQ8ebb9Zzy/ESzVmnpPGCqSCXDTlVD31cchp4t3
	 OY+oKCcBfj0Z44dAAfnMQ2x/ku2TduWLsJW/Qe8KSCDBzGY1Ukh3noSyzRD8ePbyXAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5OiGzEJ/rC5y6SpPA+wKkOBW4YgT6eZO19/dli43l6Y=;
	b=REh26JHpf9aFwy7kywEO8JK5YE3RHNAJRzI9L+QeEBDvxvGaeckxuDr9rqaQ1m4xPWgN
	 UmvtZ0NFdgwa8vNHh/2ErereUW30JN4ZTYtEnKYBd+GYEyp46u0sFy0n3raZwo74pTPcJ
	 7nnt0vR0zKhWFUHURJ9ExHFe8rlk0we3ca3HZkqyxMcJdqpxDmUmV8mtLWJOj1EfZozfy
	 7ikdxHOESaq7GrylosbF/y3S7t+GqsW0fSEqdBxVvfYfrfczZE/FIEnxypqfnYunrQNny
	 Rk1wyaoUVXnUtExZBG/sWLKH/YNLtaWwrbcnC6GtV6XR1IfnOPP7TJsw/4tsWjcPuqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lKh9mCuK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CBEC606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:36:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CBEC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lKh9mCuK
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so2263e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792546611; cv=none;
        d=google.com; s=arc-20260327;
        b=ZPBgqRnpPRuuXt/CePKhXjTAqAbtDYY2DR9ueoVzG1uUugM5QYtr9/40UK+vTuJL1Z
         ODNLP57vFIzvOushuROJs8pq68dPRgzX4V5tt8wY8JiWwMLfwcajftmd5w92Spp+kGhs
         Y4olm9bp2EF5akecsapbxEQFYXB/Ejx/gI60y62eqCF3IMCZiOObvpOsbhR2kYaqNVeI
         ng2G7quswYwZPPEz8QlQRfAlO7xgcHWujuk4/2aKmyL5OAVDBHtkfxQk7vTp99fMRYtm
         ppHhRjskvQzEH6PgWapZTgGbH79ojZLEZlh5ydyb3fOmDbZVS9LQ8KaXRufgERBbiVT1
         3w7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5OiGzEJ/rC5y6SpPA+wKkOBW4YgT6eZO19/dli43l6Y=;
        fh=aDJlhxwjRFUWv/9kyEhE14DgXckRzdO91jmSE/VwoHw=;
        b=OxxWNpOuoE2gQuDLVtOosIl5sfleMZGNgwmRolpqNlq6o82lP4ho9doACOqryVTe3N
         A0IwrfQyL8QTJTPHorP3uPtWlj2nVBBtNBgTwC53iuVEpv0NaqNdPxDzYbROeSKxVmAe
         guIqP7LO7ndoGuNxkVESvgcJRqa8Jcm6QlJooSt3RATUpnhxSyue5c68f/N6E0AwzQGH
         Ea3b6pbGdl3+lBT6eSW2hWfQ93cx4H3UBr+PMhk9kIccsb2iE2OhtvLb1DzSnlvHpMlZ
         EXGwZxLR/ccQoabGiCWl3jUVTjA2cZ0GfIBVsAnLmfrEDC1aJnN415oXIaqfEdjPF/Pb
         IYmQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792546611; x=1793151411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5OiGzEJ/rC5y6SpPA+wKkOBW4YgT6eZO19/dli43l6Y=;
        b=lKh9mCuK+yM1+mHy5aDnG1mnthsSsEiaXHI9F3l2kXjK5510ES0M53VNV1GIhCC3Za
         LJT1Ym7uNexFUMc4EYhqpof6+YgTUZ/0+yCwe3R8Oq2SCTB8UYQh60vczUkhE0mHmFUq
         wZMei9N16ZlWXvanOVfuEzedBz5rniSDGVDcoFFB3KIhzDRxZ+h/jA5K5eW1lAk7KUR0
         h3Lq1dYDFCIGITpgtSbFzSPUwEBSTHnV9EsfPN3GLRZSYPLFp/Gd2KhK/XWkbGqlHfUy
         PGx2zBrTeQ64dQBVjud7Bc7gCZ02arLKcmYkX1HyuwLQgcmuLiB9BvLIqWL51+LYaYJE
         fLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546611; x=1793151411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OiGzEJ/rC5y6SpPA+wKkOBW4YgT6eZO19/dli43l6Y=;
        b=rv5rwa6a4wRvwcwVmnUqeKUGRMAWqeZeiuNXYzC7dlNCmO3g9Ia0nKdGZhM+ytnSi6
         WzdMCLf+XSjgSJ5APg93W+AVGLJsr90CQaki/3dBtHG2aQUrR+u+2NclKEe8EkE2tl7/
         JO2sIVkOIOlnxscIEOlz/s6VRO7pL0qjCQHBHtK2aN8KEYvJ+H3FgG8veDPgcKCdzGV2
         Gv/5xDdEUMU++KCofTasO9lGd1FtZgAZ2GWoC6yy4CoFtDt9LxL6urkbc2lVrYa5nsNO
         gWpejezZe9nOwWCBCvGpKUtGtz7GdTY0EIa7Qz3OYmCVRoL0bkfzHGba3uk3tyBcI8bF
         gEVw==
X-Forwarded-Encrypted: i=1; AKwUvByHM106xxjwB+eshfEIFdGcEY8QafG7WUGrPHvaDPoj9a482uhYjI/pyVrznsO3jKYCDVc33LZmUED+nx4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8GggoQ9S6+iO9ssb40oSz0r+NrCCVPM5fcgrL0G7WtiYhtRYb
	EiIOsjYBwnHqwZ0zdhpLzGa71ROO1geQItjxhJ02qc+nvn6CXKXrPeXaqRlozi069MNArzEnEtz
	JtipiK2WAjm8whadaXky5mj80L0a6gQXCzXbTi4jN
X-Gm-Gg: AYBFou2T0OOmctB7nMmWW030dvEYV8BC1ii05qLVKsilgdYrry5hKJ8x6dduZJjRCi1
	0FikQbNOK6iozUs3opTiYKkHzte7cWcRErKGsU2ciRg55Pq0XxRNax2ciiwUaZ6f2cOIyB0CS9B
	sTqeJ2YgPqpFy9zDMXAP9DipVmDrnyOy1OTPT9E0TuHyXDCyk11JOC64svNgsmh+hqEaSGTcPjQ
	fh9RJz3yWB4UYdAPhkijHHoHvK/1OcVMCQMuOU9/5m/BGm57xNrte3I8uQs/GWG/nsV15QrCnE+
	LgPolBSMdbnESCfzLsVc8mi25v9ePESb5R4P/f3g4MIWvPo5A1nlYSDsEKLiToKhbdG/2sQ+ybZ
	tfjjHZZfSvduxrbyCqI5ynTRYdrWo58N1wF6isU6MztjsTKDsJ9xY8DXUQU3fJ938mUgIi0r7ZU
	ZmfA9Y1SuB1JNbYdE=
X-Received: by 2002:a05:6512:3044:b0:5be:4ed3:95b0 with SMTP id
 2adb3069b0e04-5be661e26cdmr259957e87.5.1792546610966; Tue, 20 Oct 2026
 18:36:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230758.2960779-1-joshdon@google.com> <atbsxDZecXYSDBqH@google.com>
 <willemdebruijn.kernel.1d24f2bb46330@gmail.com>
In-Reply-To: <willemdebruijn.kernel.1d24f2bb46330@gmail.com>
From: Josh Don <joshdon@google.com>
Date: Tue, 20 Oct 2026 18:36:39 -0700
X-Gm-Features: AclHuK9NwCZA2eIFwebashV2SoBmSppHm3CCgMhePHvU5eY9n009yihziA0P72U
Message-ID: <CABk29Nt-2mHiVfZekq3vb2=kOf0Vn8k2S37EqTLhLCJfEbpYFw@mail.gmail.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for udp{,_v6}_send_skb()
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 6:49=E2=80=AFAM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Kuniyuki Iwashima wrote:
> > On Mon, 19 Oct 2026 23:07:58 +0000, Josh Don wrote:
> > > We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry program=
s
> > > to monitor UDP transmits. Both functions are static and have two
> > > callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().
> > >
> > > After an FDO profile update, udp_v6_send_skb() is now inlined into
> > > udpv6_sendmsg(), while an out-of-line copy remains for
> > > udp_v6_push_pending_frames(). The fentry program still attaches
> > > successfully, but it is silently bypassed for all uncorked sends.
> > >
> > > To address this, make both functions noinline explicitly for tracing,
> > > as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
> > > Add noinline_for_tracing annotation for tcp_drop_reason()").
> >
> > Unlike tcp_drop_reason(), udp_send_skb() is a hot function as
> > inlined by FDO.
> >
> > Did you see how this change affects to udp_rr performance ?
>
> Yes, maybe I was a bit too fast in assuming that this does not
> meaningfully affect performance. A tcp_rr is worthwhile.
>
> Or, since these functions call ip(6)_send_skb, which cannot be
> inlined, perhaps a robust obviously free path is to attach BPF
> hooks to that (and filter on sk_type and sk_protocol).

Thanks folks, I'm looking into Willem's suggestion as an alternative here.

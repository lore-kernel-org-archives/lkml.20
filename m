Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94BF21A453
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 13:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791119903; cv=none; b=szyiILBfSkCKM6N9fBOWRmyHi89bclIVi1hcQ6WvmObOED3Vc/siMxwHV98uMzIzRw/4ymnZLz9ps1E0Et6UnUOaq3b/ALQW42hRmTeg1kk8rhMjuDKiFTuwkGk8BwF2ZdbrXO43jXl3esIViWiUk5hvbDix4M1u17ScmMErGdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791119903; c=relaxed/simple;
	bh=z6rFrkhq8w0RyZKav4VCDTJcQaUJhW5zOfT4ozFYGzs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pF4nmMiXTrJB0YxIHhjhD4kG/QBlzcmYDU3Z2+lAFhtLmWyJHaGG5mssPVzEzWGDMMbgnjxr0aLDiYmCmuzleYh5+loILjwfv+ShZwYN0ab2cDRzLd4SyzO4l7HBMylwnfoDAkJlPJSeU0a/ePLgXc6rw8boxzdot++HYrlyYYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=OSux0YaK; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="OSux0YaK"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so6045185e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 06:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1791119900; x=1791724700; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z6rFrkhq8w0RyZKav4VCDTJcQaUJhW5zOfT4ozFYGzs=;
        b=OSux0YaKMQPqEWpd/pVzVPELPTbxTWpxqpxof1osuUkMV5pdTPv60Rr3scGDzYPTcs
         xPJY/4uwFiU9390NUEB6ZgDcijpUo74zJzNyQ8owWWOV+6Ayd9fNMeP8OZ30UyPNGnts
         pegaSdDBKAbMB468ZkRlp0VoLPc8yWEAquXiHwtejkwLkXYTYklowXpxn5qXClYcuWgM
         74OypZhrkGMq2mdjosE+gyZ4Srh11JHyODYLqjrU2gF99QUodWBxFolTZ8JeQgl/gnGF
         BkBupu8R7tbD09KVjhOsdV+d9lWvCfbL8jVhaH1fNRgjsNFUUgb5xm83Lzwdf0+DL7Co
         Cwnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791119900; x=1791724700;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z6rFrkhq8w0RyZKav4VCDTJcQaUJhW5zOfT4ozFYGzs=;
        b=r0bbHtWVwFAR55/MluvDwqiFiB/0tYZz0Qvc3qMsnTT1nJ9J+jOyxTzRAEG6eAiuwK
         c+flrsoEpzu/fq+PMoXFWRyc9g4xZGFO9/uXRXKMc18pXA6tFMjTvVShwa/g9UwJ7FhC
         GbxcTNwQIrZuA6NdOg7o9GGOV8GJ6RR57kqnuXrKRQe645bfQZcnSI43xqUkjmpNV2vi
         LCqt6Xcx1yKniw9qjzx6I6L9c+OBbeFmYeuKYbrbGHSpbbmYdiVnfAIfOEkGX+2TvMol
         89gAPQ/lFtvSlUZZtPGFcYTFQa8DV/Lr6GBsc8WWlL3D/DG4du+jQL/EbpryB2jbPQRf
         7w6A==
X-Forwarded-Encrypted: i=1; AKwUvBwLkV712EHl+7P4JLjSRfRbpG8esLy1PMC35QRUydnjGsT6WKRgzTdkJzo7D/XmHKb28aA19ZfPJJsrZAI=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ7OTLgYXSjrK3wx7wyk0T2mxCWBdYi62jAP1Y/XR4CG+w6K5T
	C4hcHerL/JvVm5Ym/Mn1e638heHYxU4j0Eh6IHNVFDoh+t6BmzvouIAQ1iiu81/qbt0=
X-Gm-Gg: AYBFou1xdfX+BFpw6iaLAcXHVdm5MvqgQm+CcVYTsciQuN56B8LSeQTeRCyTeOi9/3g
	xv6deGbCAXASpEcbCZN+Q7Ol5DSrzEu82euWgFEGlc1/vsIeowDHwMK2Kv34dUUXVPy4moLQ0uk
	9bIHvsQkJUb9zh69l7Lmp8MRgeQVgu6PPxFdtG2GvEaEGGIkW0mh7nScEY4OQkdHze0c8XB/n4L
	dbJvQgiSZvUi/c8dyFnncCKe+XCxHZYpimh/PXl4ROMBNH/8efrwyTHj0xFzRYKOXCfsBFakm5K
	bjmK76qyiwfxqnRi+Opc6p/A59ILx66SyFa0xDGYVpBrMH5LnqPL/8JOTPlkdvdi3KtVo7nwarl
	/DFhnlsR4hqjcD+MdLPWgENnySahvqrkT4dFNKOqQYy2KizTz4uS40W2Xnxa/FLUUr51qK2iOTD
	ULn3tfd18+Y7ar+cRZeVDXWAS/8i6z7yvj3fa1lbDtKM/lr9YwJt2rq1mivgvSNwiQRJRoldCSz
	Jh7FlObcPXssRQ7WZz2IdW4rAk3VPth+ERGgcV0glElElQ=
X-Received: by 2002:a05:600c:8b2a:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a0276ad704mr166262085e9.27.1791119899862;
        Sun, 04 Oct 2026 06:18:19 -0700 (PDT)
Received: from [10.1.39.236] (90-181-163-241.rco.o2.cz. [90.181.163.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4cfsm222293665e9.1.2026.10.04.06.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 06:18:19 -0700 (PDT)
Message-ID: <c9b5b9ffef594023e25e174cf9936e0b74575e87.camel@ndufresne.ca>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize context lock before
 firmware setup
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>, 
	stable@vger.kernel.org
Date: Sun, 04 Oct 2026 15:18:17 +0200
In-Reply-To: <20261004123920.1251165-1-runyu.xiao@seu.edu.cn>
References: <20260830144827.2701887-1-runyu.xiao@seu.edu.cn>
	 <8ea77a207f6f99d4f20610670e5f88fc56df3faa.camel@ndufresne.ca>
	 <20261004123920.1251165-1-runyu.xiao@seu.edu.cn>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-waE4nCMfjxRVoMMu6WzC"
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-waE4nCMfjxRVoMMu6WzC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dimanche 04 octobre 2026 =C3=A0 20:39 +0800, Runyu Xiao a =C3=A9crit=C2=
=A0:
> Hi Nicolas,
>=20
> On Sun, 4 Oct 2026 07:17:43 -0400, Nicolas Dufresne wrote:
>=20
> > The very first place the lock will be taken is in _open() and that cann=
ot
> > happen before video_register_device(), which is kept last. Please
> > demonstrate what the issue you are suggesting if you'd like to see this
> > merged.
>=20
> The normal encoder open path is as you describe. On VPU-backed systems,
> firmware setup registers the encoder reset callback before dev_ctx_lock i=
s
> initialized. A timeout on the shared VPU while another client is active
> queues reset work, which invokes registered callbacks. If that work runs
> before spin_lock_init(), the callback takes the uninitialized lock. The
> context list is initialized but empty during probe, so I cannot claim lis=
t
> corruption or a user-visible failure. With CONFIG_DEBUG_SPINLOCK, the
> zeroed lock fails the magic check.

Then please make a v2 that includes the mention of the encoder path, and th=
at
includes the debug output when CONFIG_DEBUG_SPINLOCK in your message. That =
will
show that you actually tested it. Its extra effort, but please understand t=
hat I
receive dozen of hypothetical fixes (sometimes multiple time the same fix m=
ade
by LLM users that may or may not follow the list).

cheers,
Nicolas

>=20
> Thanks,
> Runyu

--=-waE4nCMfjxRVoMMu6WzC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCasJSGQAKCRDZQZRRKWBy
9JhWAQDGSUaLmIY5JdJTgW6/78Eu5NkYiG8DJqlOcA7s9ZIXSQD/f+kiZ+H1prGg
XPDSh3pwtV56tX31Q+YhZqlKkIWGzgA=
=gqBD
-----END PGP SIGNATURE-----

--=-waE4nCMfjxRVoMMu6WzC--

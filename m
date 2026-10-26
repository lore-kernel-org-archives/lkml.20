Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018499;
	b=IGhQUs/5V1WzXga+Jz2M9VuC3oEN4TzsGQ81tEljkBGgNdRAduuzVPMphe0YJlvEeNqs
	 0mFctQB1k2oUmaxyl9r3io0gbbjkkgOR8Vtiib/roamUY04uD4zJsP/FmyXnri+J/37SP
	 aqJtZK1BGfrLaoNmxTdbO6jd69Rk16rx7r7Ze84d2b3DbUT5+ZHNgNDDtpSKCiOPUK9Dt
	 gtkc5VpDbOSiwsI86ZjrLSX76+cdGhtJIe9V9oo8QIvty/QL8Y14/dJaKAB4SHxthLZZR
	 qFY15ucc8wvd+VoG6oq18aWWEP0lyUowuFjhuGXtQEwt7auyq59uI3xLJ+f7/KmbBYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018499;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-MBO-RS-META:X-MBO-RS-ID;
	bh=rSbZwM6ArFWnjmuYAFuqV0i8s7gBfvuVh2SoTZC+x8A=;
	b=fy1H5/jLIZFOVfu4UK10LYUmp7KbCNY8UU6ueov2PJ3t2YvspMutFipqR1CsFolLf9jz
	 vqjh5vXi2iSb3bxvcqwTyiwLyroUK0wdy86qxG/pXwTaht+cQol/qfzPbTCWbehKWeY9V
	 cV5XXRxX1CdDngEFP2DD4rHfMmzQ4pYD1cst0qJyzAgiWynHCJoN9Sfa2pxSE3duJfvq0
	 DmaRkrOizcavOit++D84JoL7V8lvcxxyhvz7RZY+nHcbECLFgxMsyaCHYLLp5lEZJSS6R
	 sxTeGSCtrup0vi7qizHkwtfmmC0gpFwphSsg6vdpyQnLwvz3oZ0kFrl76e8Vi9/AUww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=fiQPD5+F;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6501D606A31F;
	Mon, 26 Oct 2026 12:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6501D606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=fiQPD5+F
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jCtXt5zckz8tdk;
	Mon, 26 Oct 2026 13:41:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793018494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rSbZwM6ArFWnjmuYAFuqV0i8s7gBfvuVh2SoTZC+x8A=;
	b=fiQPD5+FuSpQJSMpZyF6nTiKVYDjeyTmcs7Cu5S+MsGVtGAI/MMb1z7ywb8u720v78tsav
	zb04/v/nC25BBabOPHqTyjvDYtHWyp5U/xpbb3CJq6Zn6csh/9GNbyhnk6FC+For3REk/g
	GHu5Ses02GQywNtmwY/u+AFbZG1xM6uEQbLTRfXVuqmTF/Oi4MXBDlbkN1HbtIeoXfg8e7
	362pw7UP/rggRrs2Bfw1Xm97vOrqi/WUtsfcPEwBB3Ck6lZaRgmJkKP2QXS3EsjC+XAqKh
	KsQFGWn+mdZu/oSVUrXQI5tZzZdaCrvgwclzxpAEwgB0kXXhPBITAd/MtzeJGg==
Message-ID: <b0d8d0ceda82e303262c0f61324fe8a84fd9f745.camel@mailbox.org>
Subject: Re: [PATCH 1/8] Docs/admin-guide/mm/damon/start: fix grammar
From: Manuel Ebner <manuelebnerli@mailbox.org>
To: Aveline Noir <jm5905938@gmail.com>, SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>,  Randy Dunlap <rdunlap@infradead.org>,
 damon@lists.linux.dev, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 26 Oct 2026 13:41:32 +0100
In-Reply-To: <179301327249.2.1796164575094900927.damon-docs-grammar-1@gmail.com>
References: 
	<179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
	 <179301327249.2.1796164575094900927.damon-docs-grammar-1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MBO-RS-META: oduzt75dmocrdjqeru19648ieiwqcoim
X-MBO-RS-ID: bcd2318e5fcca3399dd

On Mon, 2026-10-26 at 22:14 +1100, Aveline Noir wrote:
> Fix a few grammar slips in the getting-started guide, like "make DAMON
> monitors" and a region "that has not accessed".
>=20
> "The line of the commands" used to be "The first two lines".=C2=A0 With o=
nly
> one masim line left, I make it "The first line".=20
>=20
> Signed-off-by: Aveline Noir <jm5905938@gmail.com>
> ---
> =C2=A0Documentation/admin-guide/mm/damon/start.rst | 10 +++++-----
> =C2=A01 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/mm/damon/start.rst b/Documentation=
/admin-guide/mm/damon/start.rst
> index d98b0eb8e771..a83fcc2265bd 100644
> --- a/Documentation/admin-guide/mm/damon/start.rst
> +++ b/Documentation/admin-guide/mm/damon/start.rst
> @@ -63,7 +63,7 @@ the execution. ::
> =C2=A0
> =C2=A0The first command of the above example downloads and builds an arti=
ficial
> =C2=A0memory access generator program called ``masim``.=C2=A0 The second =
command asks DAMO
> -to start the program via the given command and make DAMON monitors the n=
ewly
> +to start the program via the given command and make DAMON monitor the ne=
wly

'The second command asks ... and makes ...' Thus:

+to start the program via the given command and makes DAMON monitor the new=
ly

> =C2=A0started process.=C2=A0 The third command retrieves the current snap=
shot of the
> =C2=A0monitored access pattern of the process from DAMON and shows the pa=
ttern in a
> =C2=A0human readable format.
> @@ -71,7 +71,7 @@ human readable format.
> =C2=A0The first line of the output shows the relative access temperature =
(hotness) of
> =C2=A0the regions in a single row heatmap format.=C2=A0 Each column on th=
e heatmap
> =C2=A0represents regions of same size on the monitored virtual address sp=
ace.=C2=A0 The
> -position of the column on the row and the number on the column represent=
s the
> +position of the column on the row and the number on the column represent=
 the
> =C2=A0relative location and access temperature of the region.=C2=A0 ``[..=
.]`` means
> =C2=A0unmapped huge regions on the virtual address spaces.=C2=A0 The seco=
nd line shows
> =C2=A0additional information for better understanding the heatmap.

I have read the damon directory aswell but I didn't find enought to send a =
patch yet.
But I found this, could you add it to your patch?

@@ -78,8 +78,8 @@ additional information for better understanding the heatm=
ap.
=20
 Each line of the output from the third line shows which virtual address ra=
nge
 (``addr XX size XX``) of the process is how frequently (``access XX %``)
-accessed for how long time (``age XX``).  For example, the eleventh region=
 of
-~9.5 MiB size is being most frequently accessed for last 3.7 seconds.  Fin=
ally,
+accessed for how long (``age XX``).  For example, the eleventh region of
+~9.5 MiB size is being most frequently accessed for the last 3.7 seconds. =
 Finally,
 the fourth command stops DAMON.

Rest looks good to me:

Reviewed-by: Manuel Ebner <manuelebnerli@mailbox.org>

Thanks

> ...

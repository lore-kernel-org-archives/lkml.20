Received: from 0001.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A103C3F9F25
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789546558; cv=none; b=UB9MN5lEc33dLS43W2/XKE8uyQtOW3ihGI2hUyqHSDr0LBH+n0OC3pWo6HG/Wltan0VrSOHOVt254mS8Jk31+5e+d/Mt/um7CfdmgTbSJqmHTemdkmbrRjJ7jCv3Q87tf0xfIm1ZEZcT/bnfv834OVZdvzQdr/MeCf1HJRCEsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789546558; c=relaxed/simple;
	bh=goqwARZaWYVNr3jnwM3rrVR1sB3uY+t1WtIJSaOPQKQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Subject:Cc:From:
	 References:In-Reply-To; b=AbQOlEp2KY4qaDmwiYkAM4mq8newdV5BkmyzZTSAVCzpD/PFsqliA0ZlcndS+w6MvDJg2x/mVWEHa/E8fJmfXmgM2Ywt3IpdT2JC3RaZeZUZDKCTud8pGNxcrZdxT6Q+U55O+LYRIgO339+njfEwB4IJZNJFig9V7xKoASUSuTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 3B74219F;
	Wed, 16 Sep 2026 10:15:40 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 10:15:39 +0200
Message-Id: <DLGLAZ55FZH3.114WUI353COSS@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: spansion: Assign .fixups to
 s25fs256s1
Cc: <pratyush@kernel.org>, <richard@nod.at>, <vigneshr@ti.com>,
 <tudor.ambarus@linaro.org>, <alex@sverdlin.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260914-s25fs256s-fixup-v1-0-e94019455c1e@infineon.com>
 <20260914-s25fs256s-fixup-v1-2-e94019455c1e@infineon.com>
 <DLETVUMUX3AN.3SSH7NN2CKAIU@kernel.org>
 <fb4398e88939472eaa86cdc098a3d265@infineon.com>
 <DLEXS5VCYB1P.1NJI7ZU6HYUHF@kernel.org>
 <e15daee278f346cd8dae030e2409445e@infineon.com>
 <874ifqoctq.fsf@bootlin.com>
In-Reply-To: <874ifqoctq.fsf@bootlin.com>

On Tue Sep 15, 2026 at 3:37 PM CEST, Miquel Raynal wrote:
> Hello,
>
>> This didn't help as SFDP cache size is truncated to PAGE_SIZE in sfdp.c:
>>
>> 	/*
>> 	 * Limit the total size to a reasonable value to avoid allocating too
>> 	 * much memory just of because the flash returned some insane values.
>> 	 */
>> 	if (sfdp_size > PAGE_SIZE) {
>> 		dev_dbg(dev, "SFDP data (%zu) too big, truncating\n",
>> 			 sfdp_size);
>> 		sfdp_size =3D PAGE_SIZE;
>> 	}
>
> That size just being a sanity check, if it no longer fits our needs it
> must be increased.

Yes. Takahiro, could you propose a patch to replace the limit by
let's say SZ_16K. Hopefully, nobody will use an arbitrary offset >
0x3fff. but who knows :)

-michael

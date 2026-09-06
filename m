Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586A92288D5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788676863; cv=none; b=IVTDU/MfeFBkBqXBrucH/i8hh/xPgQgi4xgihzpBpMNSuNn1uSTmQC01Slq66dbST06WfYw8ChuSdBRBoGb3yzXbeJH8yeVjsMsVXUtYpT6OFuDKLRP/U3GWCNcARzAzgNBWGbATYhCafwNqC3UQ5P8Pe20J10eulde5tc0UxOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788676863; c=relaxed/simple;
	bh=DKsBa9ZraG+br+wS3RGaMdAkaeqP8KmJBWNDuSBRtos=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=lC88Mf3dmzLAAmA6u5r9xDazZy0Yj+hvpbLVV1E9eJeEjW6AiksluwkECBiSmLWzzf+rzH7W2U1srOQ9T3dq6de/2rRuWG6+MdiTmMcGDgFi+OoZBb4YeGf2OrHsHVnQq8LiYkcq2gcteggs9oOfOld677j8SGKsZUnj1eIA5uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCFapWwN; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCFapWwN"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91053c27a91so996856d6.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 23:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788676861; x=1789281661; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BoGJBejmDHmob0AE3eTfdjrKII854/Xb9FkvnCxeGR0=;
        b=WCFapWwNiAEVKXTclRKZ4WoofTnXTfV58xJGrto+B2ZpBsJB7AIwI9uGGorf2rw1D4
         8e8JH8JS5jsNkC+Rd8crvHs0TynPr4tj8TIcdjvN7esdd/T76N4QMNIpytN2himuBOGE
         q0QC5QOmcaHFSp8qIElOI2N4Vt0uR5RadFoHxk70J/P3lXVJDps/y2uzfSCYt9y9Yeq1
         3qCSH4jd700XeLvS98qwNlMzkvK6fBnz+Wi2QrmQDWabc9q7eVWbZYmdmm9kN49IhMgf
         4h+GMNW6T5FNCB2V4kUuteC/o9jmSQGJzBf8MBmi9Qb1qrxOt42io+cB/CA6K9CsP3h0
         TG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788676861; x=1789281661;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BoGJBejmDHmob0AE3eTfdjrKII854/Xb9FkvnCxeGR0=;
        b=aPhnWk/3gonB6+i0Wh6qU26bBb1BdYTG4WKnJu4VbPLETPctaAmfnOu2kTpZCBaCJh
         rtfxgrcAba7NLJQO/bh4Sq6BuRYTsc1/EAlcyJNrjsM1ovkx9nrWtR5arwV3KO5mJNTi
         zjG4ffMkR4LuU5ncplAGTwt4YbaGCkctXgvnGtf33OEOP4/kjhegnwKoOQ5tzYrYQ15D
         RlDY/d42KlJ5nb+1o9hJS1CpO6mVYzIMciWRyRZwIKhF+FQufknzzfb8llTKIItTVuO2
         JzHQXbDBCGSkTTCEqYFNAy/LGpsnJ7Ktd+DaVLZ5CIBx+gQQEguNMWsE5qSGlpXUC14R
         NVyw==
X-Forwarded-Encrypted: i=1; AKwUvBzE+8JbopXNzTGLZOVf6NTnBn8DJBdE72lB4t9uDvTR9UilhjRciarXTl+UQxaRW77V6rBDsWvipm3SrYc=@vger.kernel.org
X-Gm-Message-State: AFuF++ng4XTWJ9gZMWEs1hpbTIJHw/o4SVkWrxPs7w31rRDnVRN7W6Lg
	qzc8BNudaPBzL2GPXnP1Km1IU6j9fcuM0rpyw/1Ketwa5LUgF04m2xbhxAg6xg==
X-Gm-Gg: AYBFou0iokXYxzzZppdsN5h8quav/0NzARC97fnceYNpLtQixj/3xvyrjrBFb47DUVl
	m0rJ527n+Fk9xl+Hw2xviQuuEAF7Y0YvrfsTMl05c1jOAkpEY9GIwxmJlNO/e8sP+JkSW6BjjnT
	COFOINZbVOmb8y/JnFgrSQt8Jh+0Ldy1cvPobEO2jJ+//tidtfOjx0TvS/lN/ErxAGygQU1FrHm
	1/ONNr7ltpKUPNC3clcPqDOi1PLiTZ2gfO1/k5ZCsMepVjkMCY1zQEHqf2u9uq5p3WozR9H4HwL
	rhmSlnmVq5AUjLd3nGSHDSfAxCT/ylNBQMO5izDrVNYetDGO96ke5FuYAZi55cd4KXF9w01Oqxo
	OBX9tSRVnnQwdxXF8uiUedFO9Z1TKfn6DWIAgs56jAGjFb4JxRnWe44FhLhPeO7CODaIAEDmRlk
	+5f1Ytr3QoLI7w8bzYZYrAUaLvVDHYifuiMtL9cBKEx1Bfy81o3dBr01nwNzZbzr9P7tQZbCWIY
	objC/dN9sXU77rxmeWy
X-Received: by 2002:a05:6214:3003:b0:910:3d6e:ed46 with SMTP id 6a1803df08f44-9103f0db656mr178372826d6.31.1788676861267;
        Sat, 05 Sep 2026 23:41:01 -0700 (PDT)
Received: from smtpclient.apple ([2601:152:4d00:6110:4590:6205:75b9:b340])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91043b54cd6sm50856876d6.34.2026.09.05.23.41.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 05 Sep 2026 23:41:00 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.15\))
Subject: Re: [PATCH] m68k: coldfire: fix typo "reseting" in comment
From: Josh Juran <jjuran@gmail.com>
In-Reply-To: <20260904112336.38497-1-hemanth.selam@gmail.com>
Date: Sun, 6 Sep 2026 02:40:56 -0400
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9051ED9E-9257-41E8-B979-DB7716F516CC@gmail.com>
References: <20260904112336.38497-1-hemanth.selam@gmail.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.15)

On Sep 4, 2026, at 7:23 AM, Hemanth Selam <hemanth.selam@gmail.com> =
wrote:

> Correct "reseting" to "resetting", reported by scripts/checkpatch.pl =
using
> the misspelling list in scripts/spelling.txt.  Only touches comments, =
no
> code changes.
>=20
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
>=20
> - *	There are 2 common methods amongst the ColdFure parts for =
reseting
> + *	There are 2 common methods amongst the ColdFure parts for =
resetting

Is there a reason to leave =E2=80=9CColdFure=E2=80=9D as is?

Josh


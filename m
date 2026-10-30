Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353346;
	b=z8YWlHBLrgm5DgNv6VBEQ53fv5l8WkyTLTb6qqKK5BEeH/GmAFmrw/iUrVB+ZJLtZ+o9
	 +bhnPGJJoEMF85W0CeJDivEBdN3qEKpuV+vxDCK1GI2Cu+IKJ493N4/5hHcHsUqLEnBYg
	 55LamwJqYIfBg/fywwnORj0cYaBAseDsOm1dc6Q1uNIRuMer43lYtc8HrEln5nSsfLK1/
	 ikT/YDkS7am+34JT1vHCiNUMZ2DJLqtRL0LeAhVba7A9kIiRKuAUylHSMGZ6Kc4YsUndT
	 rxzFdMATNEUqpXzQtPL5liLh1dj5CKFRdQOorPVQ64EdsOjUUJwNOS4O4MjnsozPLcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
	b=EnJrLNk31LPmstNotFWjw3AVkM5Wq7wA1OzrrUxcS5tSSdZLLT7u/biPSTQwJ4v2dIEL
	 ub1ZjIyYGYYPsQfi9MOj1uecxZvz3XzR4l3AV8KQEbp2YlZEWYm1tOSUY9l480WnFalCe
	 okSDsznsDV0yaT3bZ0lCXrvjd+yxivLdu8KHwOqNWrxBzUFBm54iHmZUBj9hkIBlTznPR
	 mLoQRefOuNI+plxEvUp0qKz0atchueP8OMNh7SDJtilnjb02zyvV4w80M5b2BfUjaWRWj
	 Xy+Ptzj/+wGl9yGi0Ac/hbV6Cs+vJRUJ+ym54PwJbfoK2mxKZbnlKIK13CiZAMgoB7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VDvo/8AL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFEB606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AFEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDvo/8AL
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535a54bed9so837672eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353345; cv=none;
        d=google.com; s=arc-20260327;
        b=Rhv6NO6xMGH0weL1YiFVTKpt+nt+eA2SOBKQm27Oi1kYMy/H6SzF0K7mVzF3PZTTT4
         bMvj+qlprk3/I6NNt1sFC0Cjruwc6eS7hFF4zPqpsbzwS45WjaCttgVg5PsWV3yKsIk0
         4tH6Aj4SkGSB64836LOWMkxmmMSoV8angO/NQNEMDuQq2rWUczsCMmp/zSut+M3B4hKL
         kUZyv5d0imVZT5cMG6K1NGl2QAJxMkNaK+IqxQ54QdPzYCfoSgRu1FA8x1wtSq6hDVO1
         HQGeAsXOm+GMZfX6Wcv9q1E2k/+U/SRqurlyHZbgUwCJx//qn4pHdhsMOzVozVjKaLjK
         rL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        fh=U8VbdEDYZP/Pn8PdDP9nmwm5ffK7BjGNyOj/JXxG0dY=;
        b=oF+HJ2cXy58tKom1X50v3pFZLLQ3coEG2EmVN37yNJ1pfdVHPXYSC14qTv7gWq5Jwo
         Xu4dzQGUYY4cbeY456E7M6oPJC7vMpslvRcluJ4w7TdshYOrUQJ0ME6o3/N0shY+luJo
         7hkfZ2wcBw7X2T3yxkFPUW/r7tRffH1W0Ctae00v7Q7bkilzqD2NM5//HhceNLBHp7Cn
         CyK36cG9Z0jcYAa30cZOH7QPO6wKWMuhDe912dYwJp61PQo/voyR0mUnKOl5rJIU8qUl
         SU9mTPj6g0wHG364+kUON8BkUTXTLTO4YcOhIoLHFEKHW9sjwAzkVNh47A+ZdTMP+fje
         dX7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793353345; x=1793958145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        b=VDvo/8ALUv2o8vLeBrFjgi8x3hH7i8hY5DwpCSk7vhJILEgsq4TzXiHzvm7k83zNTV
         udkGFuGOUraspN0Nacg5Ghc3c16IApQsRqOaDzzJ/ElVmieliY16mbyUuEWAM1ybuQ/V
         T2P0+B36wbYw3INCWqsEKpVMKVuOBrlxmNh2siJ9dpzo2J33PlWRLE/4s44nAMEaVng3
         O/7Ob3zdUjUnrhk74MT5Lkd2I3Hnu4punHB6tcGdawA4Do0SI1R+ANYc8CmGTN2C4K+2
         eU1vHiRoX1/naqUdmPws7e7NckwbH6li5mI+L28sU9q6vWsh3uFaCTn+1rde1AOPFoGC
         xTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353345; x=1793958145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        b=cIqSzgK8ZhT3Xh0MEFUiMCFmQguFCYWO1GLOylMjSDPB9Bf6lCl4nzEpXxY15q5lqB
         ffeWOHF729iy6lmtzn5uOTyUFqZmensjf4GSsEK+blw4L3jdkva3wpRCnTDFghfjBoZw
         JXg17EedVrfm2aGblOl1e3vJjNl7emSqUWDPDpFCUuji87wbNRR6BMHKOX/fsI2Mib0t
         jJxCm7ws6YPyotJNd4k13c+ECQIXJS3/wKWOJSCsV/ubuEKZHJJf3tGMSPPKNagQE95g
         PAgk0Af3fzZIJc2fx3V2wt6mmQrHhkL56zCwBnpl6d7zAY7DeWM8NO6RQGbuv5J95dXW
         SVnw==
X-Forwarded-Encrypted: i=1; AKwUvByab38C2IbEnfn3RdaRRcXxhC0tJrE5dxHqFnfIsaHYNG41HbfSKZKuVs29flrszYcTx7RFGBeBMY4LVCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPzsw5LmNd/bFJf7eIkAdakIzepC1SPgB0s6vC+kiWwifkqxwm
	nA/dWETklpgi4XuMG41ZLUYFUiJZNlLK9D+sRkEtxp2hO//86xF/mL3GsWMBmraA1Vend8635fX
	3uhlCG4si484XKH7/5LWpK7G09SmuGUc=
X-Gm-Gg: AYBFou3c7+reeC+OQzwUx7OfoxFEEgPt/pEedJhHXTgtUSIoshGe2J7Xl+rMpUNsxSc
	07U8LrW14B4QJXwz526NiTAePgVa7D1+d3L+e7vhH6oelRQ5GHJ+NT21Fo0q5DDlEXOioqZfhRn
	DpKrji+BTN71agjSneWzMnPTYbfsoix4EGf6XQsLp8D2PA3+Wyy1JEVNRuwVc4H1OHF4CQAPsXS
	5Ut8tBjEqmspn5QlVTSpON6zmR/0oMVqScVVv8zP8M6R/lkNFBRZqPpVI5DpmQ9D3BTEblx1zWZ
	1JysHY5bnsI30WxQwBT5qEzVd4h1bJkfdhmuPdxPaQUhgyEClqPVgBMeZ4tbAeOBU/A4fENFbip
	4b/0/0OnWqffsYcjNhzgYDylkR3PLK4b/1yJHRGVwKFBy8ghCJrwxn/eN/CUwzVx2eDtpjA==
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id
 5a478bee46e88-36a4242f5fdmr2867529eec.17.1793353344529; Fri, 30 Oct 2026
 02:42:24 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029152909.234584-1-clamor95@gmail.com> <20261029152909.234584-2-clamor95@gmail.com>
 <auRjGM7briuvXDEg@houat>
In-Reply-To: <auRjGM7briuvXDEg@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 30 Oct 2026 11:42:12 +0200
X-Gm-Features: AclHuK9xo3P5XZPZURXGSlkxvgjF2BR7aWoJEgrYiYo1jUomIQQhlZvP6BUv2IY
Message-ID: <CAPVz0n2=sgbzBfvhGOoRFXeOzKDvs9en7QD0pHc31r5GzgCsKA@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] drm: Add MIPI DBI bus support
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
9 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 29, 2026 at 05:28:59PM +0200, Svyatoslav Ryhel wrote:
> > From: Mikko Perttunen <mperttunen@nvidia.com>
> >
> > The MIPI DBI bus allows modeling DBI hosts and peripherals using the Li=
nux
> > driver model. DBI hosts are registered by their respective drivers. Dur=
ing
> > registration, DBI peripherals are created from the device tree nodes
> > provided by the host.
> >
> > DBI hosts expose operations that can be used by peripheral drivers to
> > access associated devices.
> >
> > The original code was authored by Mikko Perttunen; I have aligned it wi=
th
> > the existing MIPI DSI implementation.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> The SoB situation isn't right here. The author is allegedly Mikko
> Perttunen, but you don't have their SoB, and yours isn't there either.
>

This is up to Mikko to decide what to do.

> Aside from that, which MIPI-DBI type is this supposed to support, and
> how do you intend to support Type C panels we already support through
> SPI?
>

MIPI-DBI Type A and B, which have NO support right now.

> Maxime

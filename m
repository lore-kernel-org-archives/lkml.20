Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80F39EF1C
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 13:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791295177; cv=pass; b=LlRbeTBbpuQ6e/bR+jGBQGuycj4GKO19foYfUH8l6O2BJlmxeMzlsK0FItVexviabs1VJb+QMb1cSeOviyM1aBINHt6nzAZEvdN1U+4ZoHo75LdrdeI8pVTrLagnsTkJoljbyp++8192idRMdcTTnpZLkU8jnKi7tVZNb/1mIDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791295177; c=relaxed/simple;
	bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o169/yo1M5z0on3f/R8ALDxif16qm0c+d6hcFGLm+WqpyCihNwcA91J/X5uRZIX59VkggojdK16WUTlRrJ/MnBq2EMgCglvIhqRpflBK65hrKgDGyWGCY1fKP+rpFzvH+V1PCKnxDvfUbWh0i3ant6fp+vz+eCLeGfDaXor8BiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZqnkdCOW; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZqnkdCOW"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bcb2eceb3eso529404e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 06:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791295174; cv=none;
        d=google.com; s=arc-20260327;
        b=dVEjXYwGnqJUcDGJBp+v2MarROtFWJEOepJl62yLPOwe3VHhg8tZL7YRnEUgFEKhl+
         39NhYp4iiD9wOZsSWFDpVwokUdaU5YoFze2Xuf+8hVyFgVKSMhfg7nzUZyLQwofmzGrh
         lOfac0uOJLrcU5K/DoXcGuv1kGydP4ECW7dqo06kJlJYEyEgxkCa8ZQw3hn43pSIhyeE
         5jCTpuRjZUyw2hbjgLY/9iYbk0HVXCNkx3kGYULBw8FJSv/Hz1TSn+ZJh4UgV0G2Gr/z
         E27NWzmS3LsDdwXNtoXt/rBL89isHS2Kbog90T8zQ6/GqDBCpmjHCIvLv69wh7bKtgwP
         erUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        fh=8pNAY4rFiPM4UNCWcdnbNJm6pWpZ3eMNgkqIwooDdDo=;
        b=PtH1DkogtaMAk1VpDxsN4XUGUDasnYQy0xqtF3Mvz1ACXHmAbIboskaj6Yy+WzuVMw
         aWr2TyL/g7WJ/aWm0reUGKqJmyYEGgNSNXwnF58ZJxgDk2D8ehXZimVdtPmx27kp693H
         ThS7s0QWFUqvgvGR63sXZviAoGLbnCutt54BIDCZq+MaFaQSm+2xhtEVca+LaIl9MWu2
         UYwF2crZ45xbkpwz34ohciGabrb+Fu2vPEu+QQ3zAou+zC/4SZJGfbV8U9LxR6puu/22
         L+CKv7QHH7C2Gx0Zg1mb6dLLtgHpt9E+3drIYwT2ELM/gRBSKULW83vdUb2wMT7amADw
         yrBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791295174; x=1791899974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=ZqnkdCOWEloim8WjLiU/7QnRV8jeNxk/DORaPPoi5XWMDSz7x4ZJkXcOhQHyZ+Z9wl
         o6U/T49lVU1n3QUcQAk11Vey3MsMzQ7iPOpENw9DF4k37nzcI1ST1ntN/fSOzoS9bMkC
         KA09uasvwb9ow1emFj4//QcRUJ0s6d3bI2BcJpd4dJV5n+JOLIb8oavyGtfcK0yrZ5V9
         8gVu1NJhWbAAsEiJaEIzkOsgwuH+2zzN4knXkw9FQZgmoVcsNHc1UbeR6UO64y0t5Iq+
         qfC+pYsEv7VShew0vSUcx9nkuTDSbsbqQTSoAE5z+wSStQhMqcUhT7fqowXQS+ccx0PG
         kujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791295174; x=1791899974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DfhFeA0xy4wkFSmxWrb/zdg6T7WvBFoNE+ecWH4moX4=;
        b=RvzKmB8dBWcAdHLf1Ne3no1mbSUherZc+SE4giyBRxPbduHmCGuwFfG/E3mKHFa5EM
         LOjGm6/MvPFbe1XKS6VsuS1YelhH5awWUP3GFW26AFXSV/SHM4FnLG9rfySMm6egfhVJ
         3kNd6djZIWyst+ww4ytsA0iUcyL4kJH+RUsplztujESKNenwcz6vioEBxzOm3PkCOK9j
         puisKvs3KBT3JEQG56tI8GVgB94Z+3GcAzD91yNwhWGELHS73dmIwttMItYcl2MYtyXv
         ROuVvTT81aMEnDnyLvJdGDS2MAAwc83QKSNiBFngsZJhshGrRIYcijA36OQr1f7l0CRI
         dvng==
X-Forwarded-Encrypted: i=1; AKwUvBxIB8NPbbGJdlOeMiBkFPw/X6gr5AOy1YZSFJlNglV/VxqUb39wNLeXIOIQvGS3oSUZ2n83MKsSVW89vp8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX18sStYSx7J+fF9lJyUqfT1GmUXSig4jrAZVqbRJZpKR+/7Sf
	9DuykmsXXNQPqwTWhJgtxZKZliTXnMLHOWN0nBXLEsQGpAN54IWtXppHRpmBY6UaH0EmEkROYhX
	KT9UVr57/nAxowTbrDMTH312HkWs50Nk=
X-Gm-Gg: AYBFou3Mpv+yR/6htggHUPH0rDwTvfLLdQgu3jfQsUsozlb0P5dMUYby6Ej0F3R9oUV
	JFvIAVXre/uvHAM1sPP0dC8sL2vricSg4tyDh6ACd8NCu6iSzV8Oeu7nPBsRp+9EOe3kOc0pgXM
	qOJMnCeiXTC2oYOv42psJZqFsCxnHViaHY/PGWMPj5N9yrkr1rRXpdnPlx2wBdBhsp5zIGEHoNK
	56wrHap7WUnhg5YvFUaWrrkIOS3/6gd7woru/LkGuNlWBQpuXciSArg3xu0YyoViUgd7x6qiGSN
	rt4fwzX0DwBuVQE1Z+nM+pgudPVuEEZINbzzYGbi15NlIASbP2qKG6j9H2/hkUbqBNvhIJQ8L0f
	ywNAYcw0QA6nK96qFxLjNeTqXNmFtge3g6xp5MPZjgb0=
X-Received: by 2002:a05:6512:3b14:b0:5bc:b659:2d99 with SMTP id
 2adb3069b0e04-5bccc6b4c21mr705952e87.1.1791295173932; Tue, 06 Oct 2026
 06:59:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006132512.2246196-1-alexander.stein@ew.tq-group.com>
 <20261006132512.2246196-2-alexander.stein@ew.tq-group.com>
 <asT7yvlCeQl1rfrS@SMW015318> <5021357.mvXUDI8C0e@steina-w>
In-Reply-To: <5021357.mvXUDI8C0e@steina-w>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Oct 2026 10:59:22 -0300
X-Gm-Features: AclHuK-G83UF_cmuikg5GvtRML0WChn-CSBfbzHsfZjgKlTszPVDr547oglwPQQ
Message-ID: <CAOMZO5AJiSoFb5Fy-LR4=MDqQqhJPvtzLT+-18es8j_HvYqt6w@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: imx8mn-tqma8mqnl: restrict clock for
 SPI-NOR flash
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.li@oss.nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Markus Niebel <Markus.Niebel@ew.tq-group.com>, linux@ew.tq-group.com, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Tue, Oct 6, 2026 at 10:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Am Dienstag, 6. Oktober 2026, 15:46:50 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Frank Li:
> > On Tue, Oct 06, 2026 at 03:25:10PM +0200, Alexander Stein wrote:
> > > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > >
> > > The FlexSPI controller uses quad SPI with internal clock recovery.
> > > The clock is therefore restricted to 66.666666 MHz according to
> > > data sheet.
> >
> > Which datasheet? I suppose NOR flash datasheet, can you provide link
> > here.
>
> The i.MX8M Nano data sheet Rev 5 09/2022 section 3.9.1.1 "SDR mode with
> FlexSPIn_MCR0[RXCLKSRC] =3D 0x0, 0x1, 0x2" Table 55. "FlexSPI input timin=
g
> in SDR mode where FlexSPIn_MCR0[RXCLKSRC] =3D 0x0" lists 66 Mhz maximum f=
or
> "Frequency of operation".

From the commit log, I also got the impression you were referring to
the SPI NOR datasheet.

Please clarify that in v2.

Also, shouldn't all patches in the series contain a Fixes: tag?

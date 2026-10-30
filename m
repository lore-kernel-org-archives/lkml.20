Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793354585;
	b=aDkWh7TK4aX+HSOU3mpaI+uRcjNbZPJdT5BdJwaQ5BxgXz+8IPkSjfVV6hPiiWWwso3Q
	 vLTLxkImK86UXlXOC6DrbgZN6i0MHu813d8SfXEZGah1tMx/C3reD5wJqhEDRU7VqwzsB
	 5o333NvhlOs3cliiGjYMRq3IWWz5zPk7F/EYXvzV2f24GRQTcoBmw65TjsdBE3bBroI+p
	 iqK2t/Dx8qiseLe/eRhnz44r3irx7NUeQ0glkrSFVIaOWjfFidHtCEJF9ujSm1cVpmNP4
	 kDeMFKLTG10tLvjD6lO1WCzdJZPO1az02NkzZoMKV+o/9GJUU2JXKzmehz/DbNEGnvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793354585;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
	b=fVIpNbeOVWrnOqfuUPb2uvLFpoVQo6K355jqlS0N5XIn36Azd8+DxFahCkdQDeOz99RB
	 77TnkB8ROrijf5vLEH2yd6kt0YDChmKGVGg+mXhLuAyJqbKIgk/yo9cKELyPwZiP4u0Vs
	 bfHbd/bvZvHQM9o9wWwnEBnmGVfHi/u/xoHczfUHB/7E3MOJTrVXUWqQ6ZNkP6EjWa7Pc
	 Zomj2ubxyBNtUG5sBJrFVn3EzMg+LHk10VjNJo7Bg5TawF8alsAOlPjnWGKTyeRPCIkSt
	 JNbhvEXw0cXDR/DPqnqSjO/EBeOyN9MdhP0pWZAAED1B8k+B6s59/ko9uC99yCd/xKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="cB8b/Y4X";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58D9606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E58D9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cB8b/Y4X
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so876064eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793354584; cv=none;
        d=google.com; s=arc-20260327;
        b=m7S4M4ezdwEldfvqmApGLLviqDjvinJ95KjCDtMTly1hyde1H2IWikYryzvxo01B0v
         HiKNc+d8MPRhxQLytQsCqU6qlXsRYb0xyzBjYXbdPuGDCPulMVjVsF4hTcl99KAbGwXK
         d6lRChFc3yvaQYFw0kT50dYoeGTZjbQ2+AVFdsQM9YM7p8uX4ftksbjfvFTx+++kTXGY
         85PUEpTzKcvr9mtivlZ4ZL3FwWIYz60IBU0v67DfFjvyFwy2cG+L+fyN7DOT2Y2Vd1kl
         MtWPHoWbE1eTFo8ma1XiZX9P5MHtUWW8aUfjZ1XXjts9a645ho+KJJsja6dlh9erptpz
         F6rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        fh=5CDbsvwoFhIn/aRLYbciYJf+5jHQiDTg4L/mpOsqJe0=;
        b=nbSyRihjRZb1tDCopqkpzJRjzjtZtlBn3EmFd0IJosOtueqKE0CILUW9KbBq+vZlSF
         7uAKaRLp5/b60z8QTpwyZpMkw2OHJySPzNxKEa+lL26UCEpD5rERebxhBrBtsDsTR814
         q52hM19HNms8dG4+FZHO4IDnAwovhyRsR1oI5stV1/nlmAqCUZ4iu+eUtBjs2S8tChXf
         yFlIwj/eraHqgdVq8C7I1vAGFy1dR9Spaq9mO+zSQAhyi08sN9Zbg51tqvAPJxGV8Lzx
         v9YpdiqrxYsouQvisp8ZyZae5YPMHada6KKxUPOuaZ/BkkqiA4rDuZXYSVtRWSTu4VV1
         I7nw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793354584; x=1793959384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        b=cB8b/Y4XBoH3d2mx1sKiFkgaIGdUg99+DVWd6+3nB/DQsr2antbnO9ny4/huLEhgov
         Rf9CehR+G8CfFq3vJ0jU8Np1ZHQq76IRStPZKG87lVuSp2aJRS3C7zyg23jT0pOmjdnI
         m4lGlbvP4/pA/QI9+VZPsnacGVzR/MrGJckQALCnxrencrKpDaYfoK4KVRpsW4tUUNR/
         lBCkiGaNhBRqia8LQw8w7iU/nZUVnmTu9wj2MCEdLrnmVpW9eZtWaPG4y/4lkZ9WrG8I
         Te/8SKLCspInB6mhw+Q1vVwQ1Tkc37Ot2UaWEhI1xfCJCJB1E1wU0WYPJVnjTIMhc/K5
         oEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793354584; x=1793959384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KKIoAfpAQt+lZvobWVlWyv/tAfJh09WkhRac1CVCCVY=;
        b=an3vyjXUJ1NRhx/KIWzGEMAsOaT3LblZ+sFnkzwUp8r98Z6MpMQRLlRDiWHUDVnsUm
         ZRzgvh7P3mf7SJFuAz5YD26DJeQYbjiJqpdTMX8iuMAxcyqMnDdM6ZQcMqLfpOGqGS+7
         zYxVoS4qH+n/IcqcqLZDw2YgGakuzTkQDbtY/Xy/UtDFKL0/NVzmSl6jNDMGnFNsveKn
         s15c2iyVv4mdeLg4iXAHxadxrdHXjWAgzWQ4rmt0xs/SmV19MLaFgGsCROxHLt8QjzZv
         ilWeDFHeUENXwwon2OH6ylGv0FcLMTVbYyc2mXaskBlNaUe3a7gMgocTjXwhqTgpHCyq
         BwRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrYC1HBmluCtY6OlmcYuwXke8j7Rz1YUw3gCqa8nNTr8SvgkqqlIivFaFLdRMWUNHI/bqNsFRzWLIRF6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9YsoYSV//RLBLaolmTT4uMv7EbyF0AKeJIcIMax/i9u4ISGoe
	5faioCoH1VvG5isX45x7PzfHUBo7iHIpOiNDWcjMA3OA0HL42gV2mZgb4mdoVTSFTWn8jb9C6fu
	4Up6ue+r/pvvtsRfM7lVVYz4juN2k+6I=
X-Gm-Gg: AYBFou3WRMdvgJb4yyt2ozZCuLG95KybeoOL8LBpZNX68P/ECC6oSYe9ksge+1X7WF4
	WeuTFOzwMKDcj2/b/sP9szDJJ8DRBdKr1HEn4HR6AubuqQE+45luoUWlBB6cyJfJZ0/LCUIJPY+
	fY19ZhrmP+wg+35BajKoZj1N/8qrPnyZMPaJ9XK8a4nCwW7404LUto/Q20dgwXR9a90qiaFSmnO
	lkrtN357/NGzEkg9qCO//bAdA+Z4Sev8FcYVUkZTwlSC6nILqUghk0lYtSrrs29KmgIjnYPB3+l
	ZLVGMg+13dO4H+92lHxyAjvtkNiPkeKoiPtmvM5KHI/DQKPqGuNRkH5dzo8OSaUspichPeAM3pC
	m0rhFtzIDvMU7VR3QvA54Wd7cQnQQSh5p4yyPAdCicD/anPXNGU+NX8DnSf5fNepYhALDIw==
X-Received: by 2002:a05:7300:1897:b0:361:167c:2364 with SMTP id
 5a478bee46e88-36a42362348mr4001559eec.8.1793354583867; Fri, 30 Oct 2026
 03:03:03 -0700 (PDT)
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
 <auRjGM7briuvXDEg@houat> <CAPVz0n2=sgbzBfvhGOoRFXeOzKDvs9en7QD0pHc31r5GzgCsKA@mail.gmail.com>
 <auRoaHUqMO4BRQlk@houat>
In-Reply-To: <auRoaHUqMO4BRQlk@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 30 Oct 2026 12:02:52 +0200
X-Gm-Features: AclHuK-L_bH3_AEz9gXr-D-fUGtxDSP6rDxMoUG2ElKY1BLDMKdvYmD62gCTKCI
Message-ID: <CAPVz0n3K74CZemDzVVymmjU_5GUGE9FsEKk555-AJfG0jek_hg@mail.gmail.com>
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

=D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:5=
1 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Oct 30, 2026 at 11:42:12AM +0200, Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:29 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Thu, Oct 29, 2026 at 05:28:59PM +0200, Svyatoslav Ryhel wrote:
> > > > From: Mikko Perttunen <mperttunen@nvidia.com>
> > > >
> > > > The MIPI DBI bus allows modeling DBI hosts and peripherals using th=
e Linux
> > > > driver model. DBI hosts are registered by their respective drivers.=
 During
> > > > registration, DBI peripherals are created from the device tree node=
s
> > > > provided by the host.
> > > >
> > > > DBI hosts expose operations that can be used by peripheral drivers =
to
> > > > access associated devices.
> > > >
> > > > The original code was authored by Mikko Perttunen; I have aligned i=
t with
> > > > the existing MIPI DSI implementation.
> > > >
> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > >
> > > The SoB situation isn't right here. The author is allegedly Mikko
> > > Perttunen, but you don't have their SoB, and yours isn't there either=
.
> >
> > This is up to Mikko to decide what to do.
>
> Not only, no. When you're sending a patch you must add yours too.
>

> > > > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

My CO dev and SoB are both present. Mikko will say their word and I
will update accordingly in v6

> > > Aside from that, which MIPI-DBI type is this supposed to support, and
> > > how do you intend to support Type C panels we already support through
> > > SPI?
> > >
> >
> > MIPI-DBI Type A and B, which have NO support right now.
>
> Then you need to make it much clearer... everywhere :)
>

Ok, noted. DBI Type C support remains as it is, it was not
changed/touched at all.

> Maxime

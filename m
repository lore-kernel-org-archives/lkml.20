Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883513;
	b=geuULa8jVN/UAYTE1oLbsbt4iujpN4DujpSR1cZhjdpDU0RIynrut1fABBI477vhze6F
	 znmzRstuL9TMt37FMNwPGSHtQHe/O93Q5ZP30bfM+6C4VVyE6+/Sf8QhZZ5QM1BCBawPN
	 Sjb7BDWuBZepDuOx81el3h9z7X2tgl09cs8cU1F+5RcNl3LdIzh6PHLFgLhZKJk0e517R
	 OSIoWCLI9/wWeSVSHUdLv30dObwDL48uSm3OajdX87tpA9JjgdskHIaoX8KRIQ+a6D83a
	 hVPizLHoOHOmUmdlZBocL7m6kZFZsIHQZE6LmeSYUY7GO86ESiDbLouNJoBwkkJ6XMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
	b=OxQv6xI9HRhc6E4JCdu1kYWG93zeeVz0DL0JvM1vzec7BIeOOei2T4Z4a7Z2eNTbnRMP
	 8bUa2FtPScqrBcEjO8MFHfUeBwgvzc4OZKKLGgGvsHK6lWXftxfUFaPoDq936HaW+wrX7
	 KhsTKT1NWH63nxX1BVJtVFZkRJ3kye719AwCg6H1IRjsUvP4HDJ1Fzf58HgcJcTPwVVWr
	 wqBIHWLHFes+34Q/kwJwrjZhogkEOzWUsIM8zE3IkPhU+L83FVfwcyFFmj5sCJlqyVA6S
	 y9b6ihuW6fverV3mbXbdR3SrgGUjglRjxoOrTD30BLfD3qMzyYxwrSzMsQPEfenRStw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GiM5kHxp;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9740E606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:45:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9740E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GiM5kHxp
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-15dd124bbe7so373475c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794883512; x=1795488312; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
        b=GiM5kHxpbHlSgBe73EDBEVHyZ8dR4FiqscAYsivOqTIGboQnK69HmSSSI94qxUnUlY
         /4VS6DpYs7r027pRB3TMucojsIyITIju1/Hks59uI9HPgjFotN7njLXCS9NHgLtUoUU0
         /0io4uoIHgHfERHS8WNAUGd4Xsa76xUq5aSvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883512; x=1795488312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pURlzWm9EJ5C3ayQegmkRNYY/48OUSkAow7ycdxnOIE=;
        b=ItE/5J1+yVw0F+r0irlkYsxapUqnhY+H0NlATBzgvepkbXCMXbIYycxwRyvvXoP3Rs
         Zi+wQrZ3vPB7AAdftOHEDx24v/bOh8SMTc81ietaRmn/QJdBTHqXxlfEg2NbaoyMMeue
         TxwhLLYH93k8up5x0AQZ8aOHQY8vW0nGSeF2ttP1kP2ky7eNpBAgRlWHJw1sk2D0z0js
         0Vbix1vBFCCHakJNmfo0IXnk4DsfvH8tZdoHCXFf2KSeKgZj83dA0m6P7br/hzWzrl96
         wrzTzdF6448T/yptIx0uD4lgHQhkSuDOuoWHeNakXWMwj/ZwJg2v517D3HXXO4DLnhWz
         W6RA==
X-Forwarded-Encrypted: i=1; AL+hErEfNJnvIg0Kx+ENJWzJ0BJ2WnbtWVuPi8IhJJ/sK94TYs1vE41IjzDqAs1v2LjTkjZhacMcQbT+0BPD7Io=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jmSJwAWTOqoUFy/vTr2jbtEJLtEr9RdV5Zkz/mMZ8KJik2y1T
	X2LX3qnxAQ6ekgA5aUG+MOsVMIGeyrGY8r78o88U56DWOeyd9TqcRv2KTRchnbmpsg==
X-Gm-Gg: AYBFou0HQ26QXY0K1lwlGSu/M0vg5NklZLuAQgAcRC+iwMr7chxNht6S/Ur29PLQyg2
	B0W0OMcHqgFbAY7R8fvoEDJKbxSrnO59h3AwT6PfWBXRELihknhtsLbNhsL/xWWZ1gKABgEx3VW
	30CbmGs4Xfn94RjaLwlnvSsbkFdUCxQN6xR97MfL0JQaXXZQ/gmc8KDCaO1V4/NSZRNaupF2gvw
	7aWM90CzM/VmgjedIOGFKnhzCqj6GADtAUAxggN/xx73Lx/ss60q42bw+on09bSZINLmQiLGck/
	ww+qDaMs+Gk3/6EQa1PI6XY6keDorHIParkHlqd8Hw9WtYzEuDOYHoJAtVX+Dpg6CTlMF2nf1Mh
	Fl66z7GGsUINks+CrL9zwsy3wWWOBE5U3bLgt7bqxbikg3rZsqG49yPzQItRBq3E1nSO2C5j43P
	YvQPaSKDqKq5OqRZTveHYwYBjZVcTtY8w01fwd0kCCuXFYVhzasyQ+OXaMc2fqvLwiEDlMHIDCt
	wZ5hKpfjpShphcC25XCypOW5Rbs0DVbysQPRsTOP5HmuKjuRUUNLbdpQeE9ZsuZhmdmijkBiyDk
	ayRDFycsjByPZToinT/m+7ZPT6q6gC6JtGBcsl8sjXQr0NDLOYuLv29HX2CbEFdXZpGh
X-Received: by 2002:a05:7023:a4b:20b0:1b2:4e2c:6838 with SMTP id a92af1059eb24-1b50314bed1mr11824518c88.15.1794883511648;
        Mon, 16 Nov 2026 18:45:11 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:d92d:531b:8d97:bf51])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b50319d40asm37154597c88.11.2026.11.16.18.45.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:45:11 -0800 (PST)
Date: Mon, 16 Nov 2026 18:45:09 -0800
From: Brian Norris <briannorris@chromium.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, conor+dt@kernel.org,
	linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
	johannes@sipsolutions.net, krzk+dt@kernel.org, kvalo@kernel.org,
	linux-kernel@vger.kernel.org, Frank.Li@nxp.com
Subject: Re: [PATCH] dt-bindings: net: wireless: marvell,sd8787: Relax length
 constraints
Message-ID: <avu_tZSgwxgnLvla@google.com>
References: <20260311194531.70441-1-festevam@gmail.com>
 <177344689795.3706356.13043407533958417879.robh@kernel.org>
 <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5BdxG2_raZ--ZrrTn=_i2HKTM=pCB0hWi4+CBRno3DGtw@mail.gmail.com>

On Mon, Nov 16, 2026 at 10:18:48PM -0300, Fabio Estevam wrote:
> Hi Rob,
> 
> On Fri, Mar 13, 2026 at 9:08 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> >
> > On Wed, 11 Mar 2026 16:45:31 -0300, Fabio Estevam wrote:
> > > Commit 31ed9d9d71ec ("ARM: dts: rockchip: Limit WiFi TX power on
> > > rk3288-veyron-jerry") added calibration data for the rk3288-veyron-jerry
> > > platform. The commit message explicitly notes that "the length can vary
> > > between hw versions", as documented in the original text binding.
> > >
> > > The current YAML schema enforces fixed maximum lengths for calibration
> > > data arrays, which causes dtbs_check warnings for rk3288-veyron-jerry.dts.
> > >
> > > Relax the constraints for the two properties that have
> > > variable-length data in this platform by adding minItems based on the
> > > actual data used in the downstream kernel:
> > >
> > > - marvell,caldata-txpwrlimit-2g: 508 bytes (from rk3288-veyron-jerry.dts)
> > > - marvell,caldata-txpwrlimit-5g-sub2: 744 bytes (from
> > > rk3288-veyron-jerry.dts)
> > >
> > > The original maxItems values are preserved as upper bounds to maintain
> > > validation for other platforms while accommodating this specific
> > > hardware variant.
> > >
> > > Fixes: 25f855413885 ("dt-bindings: net: wireless: convert marvel-8xxx.txt to yaml format")
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> > >  .../devicetree/bindings/net/wireless/marvell,sd8787.yaml        | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> >
> > Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
> Can you pick this one, please?

This must have hit my spam filter.

And it looks like Johannes has this set to be filtered out ("not a local
patch"):

https://patchwork.kernel.org/project/linux-wireless/patch/20260311194531.70441-1-festevam@gmail.com/

Anyway:

Acked-by: Brian Norris <briannorris@chromium.org>

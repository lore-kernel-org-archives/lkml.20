Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=88.99.92.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443373;
	b=mL/dgyHfNXzPztFOn8AqUxHVtNO4rfPPomsRHSn10hCGNSEiJLzJOJJi2mS9Aet7/fsu
	 dgRR1duEEVyP6jOJrd109/gGwlsjOQabv/VndeXuYdU2cwE4uRAUd95qV5/1PJawp5d/V
	 Y7WzUjGBjyyTFnOkZNJHwGFd1AVglQ2AbJSurgWI989hNxn125UCCkQ40QUopLXQgAFqP
	 6VdXaVV+xaIbN+BVWMgsmKl5Joc27ZVjsKxaBJbutF8QisGjD+2rtRlgCiO0BRfZCepzQ
	 lrQ4IKW8plYswru2dZ5wh4ZGa3w57oGTUI1oYQWX1F1nWxQ1DkPRaX1kq6enGwDQsnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443373;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=orKhTfTJ1loFLWK1gC5AQvr+zdn3IizBZw/adtSa0io=;
	b=V4iDr8mgtAKix129qDuMhpTRLS2C4BplwNxghoOvIlQHG3dXkZV+5MdHBrK8LijexVA+
	 I5ukh5Hyc4BYZ46K4MjvB1r6nfibS3QRnlPYq/g8WX2BA2iat/ajO8D9CvP3RFFOdnAHV
	 p3bDwjDtRAp7KeozhGHV2uBAUusTMU5XkE8PDOo4v3XNWSCLKTmEr309XDA5lH1SAa1vQ
	 7mhO2HA1tjCTg7qEIYT7OuPKsbqmhHN+MOdsimUvH/t3Z9ZQiDCeCtEP2B3Iy4aafJwdt
	 c4IgNihN7bHf4M1veZ4OiNxPxcMSz+vls+XEiJuDyXb8pzWJ9L2+Urd20yE6j2TUW/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=rojer.me;
	spf=pass smtp.mailfrom=rojer.me;
	arc=none smtp.remote-ip=88.99.92.76
Received: from mail1.rojer.cloud (mail1.rojer.cloud [88.99.92.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B74606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rojer.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rojer.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rojer.me; s=main;
	t=1793443360; bh=orKhTfTJ1loFLWK1gC5AQvr+zdn3IizBZw/adtSa0io=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HM19M2tj6EbXZb/bdYPKBiqS1WZGxaaXlQL8iTRTsCdIbzH+/igpWkRqByXAFXdwt
	 L9j/QGwr2lAarRbet1+MEYShhpZnK3jcJVqE1TrKuGH1kRfrnNNEj9ERR9uGlvs323
	 /0CT9Y21opwFnlevgLZnGPtbdlgb+qlVvE5J+R2UhHdi7bhUf5W+yYlJFiVfTWpGob
	 acYe+FJr+WeCnIGAzzt2vgnmbZ//uhsX5y5Jp+R/OIRuTWpif6SvBsvNlQbFxVYRZC
	 skvPMKrmOxZ63PdrJw4xEWGI1qcnFkiZIj4PoYaB0LtVj9xmkHlUs0vhSWAGNmEc0z
	 2ak7ritWRnHaw==
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail1.rojer.cloud (Postfix) with ESMTPSA id 706A12169C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:42:40 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-49429181ce9so978970fac.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:42:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhBYBNXhH5gNsTMuGL14jkj7HEDPZk2fHlXQePIuol7p5/PC1V2+3IYoo/zQiH7TQVItf6N8lY6npBEqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdMYddfb4VBJy86Q2NqYckL8+DLK8ng8GWir+z1zMRYzU23s+p
	lgwNy2jF6nrpANyfer+Fh6LPmKg2vJ7f4DOSr/T1UxIxBWNVU9x1IIKb7MicHYp5tdmbbW6hEZB
	gAuoYQoWI+Ds/D7uQxRzbqTpZQVu1wg==
X-Received: by 2002:a05:6870:21ca:b0:48f:e363:5cc8 with SMTP id
 586e51a60fabf-4a9077bbf39mr3116106fac.54.1793443359009; Sat, 31 Oct 2026
 03:42:39 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023235959.2988087-1-rojer@rojer.me> <38baaf87-4d5c-48bc-a11f-a5b6c04c20a8@rock-chips.com>
 <CABFmFwrWL1sej-=xCK-opxn3B9VVy=TaCyRQU43sw=6PY7bcmQ@mail.gmail.com> <4193517.ZaRXLXkqSa@phil>
In-Reply-To: <4193517.ZaRXLXkqSa@phil>
From: "Deomid \"rojer\" Ryabkov" <rojer@rojer.me>
Date: Sat, 31 Oct 2026 12:42:27 +0200
X-Gmail-Original-Message-ID: <CABFmFwoDKspgTcsStz4WKQZ+diRLLzu+MMGaRD2D9JXqDmg1_w@mail.gmail.com>
X-Gm-Features: AclHuK8EOjybxhaUBVSSjy2qBrrG1wOp4iky1FyIolBHsnDnBLbFpYQOr0Uc5JA
Message-ID: <CABFmFwoDKspgTcsStz4WKQZ+diRLLzu+MMGaRD2D9JXqDmg1_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Enable SDIO Wi-Fi on NanoPi R2S Plus
To: Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergey Bostandzhyan <jin@mediatomb.cc>, 
	Jensen Huang <jensenhuang@friendlyarm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes, i double-checked the schematics and this is indeed a difference
between the R2S and R2S Plus, the change is necessary to make the wifi
card work.
sending v2

On Sat, 31 Oct 2026 at 02:23, Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Deomid,
>
> Am Dienstag, 27. Oktober 2026, 23:10:31 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Deomid "rojer" Ryabkov:
> > Hi Shawn,
> >
> > agreed, it makes no sense here. will drop in v2, holding on for
> > feedback on patch 1.
>
> No direct clue about the board itself, but I assume the schematics
> should be correct then?
>
> So no change needed there and just send your v2, I guess :-)
>
>
> Heiko
>
>


--=20
Deomid "rojer" Ryabkov
rojer@rojer.me

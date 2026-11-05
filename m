Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793871768;
	b=ZXsSaSlf5damAh9NP2+xIEmM0azWKPxO26qs/bRs2nSpDSbTZP56e+oPivAnZYyISfKu
	 Fq9DSAR9ryto4Hj2ZLXIOFAKZ2QfNplbFB6dA3QCX2Z3/EEBX9KcMesPH3MGFwbVe3ILz
	 Cex7GXT/nZlaU3XYEM8/QCCYvsa/7/Ya3EKai51nPtWhQLqqnv8ACPiwClwQ+hO43bdis
	 pzQg++5G7Rtbzug2gq+Bk53Bb9ijAUuVfasfZm4hiWC4j2PcqFQuE76s5ZlIkU9is69cm
	 4oGsjVS823kLxzPmvfBzrin5c+aEOqvi0pfY5QXwNuXU6ikg4cc178S2YbhnA4X7CwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
	b=h2CqmpAV8iv/TdSmd5577tOjJbxcBD9GJdjeaQDEeClQ2qaewvDOcc9jBykZW5tWErKH
	 VpCobK2jRcPgFPlbjAh2IMKGdRbq3p4rUAE6hSGZ0v6FevbygzuVsFqGOaTNVHkNAa3EU
	 uWbOGNJZxdoronXxRJkjbJ47KtrElPY+v/Wf+6AGAJ7Ks+QpEaos4iLzKnzY38tl2T8YG
	 LlWfBYGWooFXYDZiXPxo0KAuDhslMEFicmBWj6DGjXccepJ30+OVXM9lOX2PWH2K2aZBr
	 f6wNE+oZEdKUWWbW5i+A2QRS3hfBehfNw/+I9ykZLA3jXjHZdlJToOFzVzSAeGei4Xw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCZOVag;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D51606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23D51606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lBCZOVag
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b571979178so1346921a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:42:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793871766; cv=none;
        d=google.com; s=arc-20260327;
        b=XYEkyRTicyAaHajxqJijJjEcpp6BwPiLtURsVBPW7n0prI+DYUHOO6EKNPXpYOyptZ
         kcGP/mto8AK5vycKiaDUN3uob48MYJ+R0XafSYRrHdG6gRdRqZzMHo3fe68ARdZfRTk9
         3LABUVjKEghfUcBTtT7jsrpJ1QUMy3lTGfcZTp8fRQDTbBk5UItlfrbdl3nIMUBIZrOg
         XDBkab54p86fh31HQEMv/I4K0Y4JewQnpHmfLpNfoT88/mujMqvWalyNa3hYRz3CUncH
         1xNJInkqdNFNwi30mCTmvYn+Wn2wAbh3quV87D9vQKIVsPXgPkuOBnz2uoiOsi4AXm/o
         v3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        fh=nb0ZTP1VteEDYo4hCsN058ex5Gh87TmfxktQNh/pOmk=;
        b=L3CPobL9qH+87g6lngDMbK30sCHGc+D0bOnSgbPX/6BZV2USw7KU8ugpgdGfPz2eQ4
         liCvCHeHhOR725tSQtQKzZO761/5xuSLFfvGVYCNP6uT59bnNMarVEOUb3l9WmdqKJhx
         YTl+EKXo1P8jc8Z29xXlvMG4ls9181q72THkrV7uk6l28yewlwHitDPlr55VgUxbiUdY
         yvvxgsMclFx/ELsUiWfP8o6vMXntc34Ku0GmyIX6DUuLrPHrXG4tYZusUmVS9RC1b1Hj
         AE10QxgFMxoumTePTqObV4PsuBSI5L1XGfSkZINAzppp/ImDX4Rw4r/34CHJxHZLtc4Z
         0F2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793871766; x=1794476566; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=lBCZOVagTQVLd9KXSuiTDMdDSUssX6sHOvFz6jllJYqirrCE9hPUTo49xM4gJtulHD
         mbB90BoJR+kAHY5NgspfzKWw2JtqDRvz3eqaznwFv3AmMzGIX8fp8vhmJSQ0mwgwjguK
         pT2aWtLj5fBJ9jcZbx+nC1NK4eQOvNHWxie867CTF/vf5DFavxvesOEdTQSHjvJofvqW
         wGHKGvjhrHgi62Vy+rz7cAxQP1+FsgnMIG5U7uhcDf9ppFWsbDTtAU5ysfnZYVzCix4q
         cw5IbWu3uYh8SbdQ59hSYfZqX6k7oxzo6nXPyNkUXO15cChw3EeKoUbntDa2K+ueweim
         kH1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871766; x=1794476566;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9KVyqZjLxhSDOn37BJsTtiq5i2CumiInDbFkl3r3JTg=;
        b=Z6NvwvHFiH9k+7zSKFTZgdkbFY1zUcS7w5CFXhNdNkoVaHqZxO/NQaqgZbI7chi03d
         hWPgZElG+gh168C0TOE+JTGcts8SpN2gtjJhuveGvE83tf98Gb6dVR1WPBlZEDxPxDl9
         SLqaCdqAqRCypAGEaMehyFhOALfAwl/cs68+MrBqa1CxYQYzApGezYZ3nQr+8rVgEcGq
         o63XWwblhwXeb0XOIOH3rlMmL/Gd1xNWUg2Kd8we3J0z95/5YcwM2YtFnVrE/swsjdtf
         vrv0qfxxAZ+epBnxOx+dPEWILpBP1N2TtSmrE0s1i0WBfK0gOs1hXJfVGEiGSF3kAA8L
         5sMg==
X-Forwarded-Encrypted: i=1; AKwUvBzUU0m8aGvi1ff1y94TPG+cOQJfqI/l3ZD/feEKhI7wDXT9MlXFP2S8V71hF6GnGkahXiANecBPT26GKWc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Xni/7WOE2aDmt5PwLz5wyOgf6XpcFxNy1U72sQOpFuzFHnM/N
	F2z9kpM3xmxopDyUgFk8i63jueTqdk72xy8zgEEmORB+xZJHFiV18ltcJX1oLPTA8DOKesZwW7d
	sJn/pyaTkbggEWv74i/lIWjzhV781zFA=
X-Gm-Gg: AYBFou3QKJLqzCEWwPAmUvp8l08/JawsS2HTOi+CtdzVQbEBJBCoqE/P8CFm0Hhp1Nw
	B6eeWMEX7Y0eLn2JfhEW1aCaFCEsJqCFxh9gE/Oohn8UhGDbGcfto/ytjGINzsoO88Fc3HwzVv+
	V07P2oNK3XTwnDi+Ap7gXmqtQ+7GmuTzft4g8vT1f+FhrugEUzLU+oWuF+T+S+uafatKDXWYgvE
	6SRw+lVlPaPAjvazzNmGNUA/4j/COOZ+4AjH58Na83PkISNcHT5zV+Yrjr8OFoeEXeRLH2U2XBK
	/JrYmfHloz/0X6oYcj94HDY8s5otAaNr8TV4UK+zGgsKbsW9uEDURDY/MV58RCk+HEqSJcIEYTB
	MqGHF1xUEY3JW+Jl/+Cwv6rqSgDq8mKowJTY=
X-Received: by 2002:aa7:c2c9:0:b0:6aa:a33a:2762 with SMTP id
 4fb4d7f45d1cf-6b4d3377817mr10254827a12.2.1793871766289; Thu, 05 Nov 2026
 01:42:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261021105109.199886-5-l.scorcia@gmail.com>
 <179310028255.2808517.13933580516140278450@kernel.org>
In-Reply-To: <179310028255.2808517.13933580516140278450@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 5 Nov 2026 10:42:35 +0100
X-Gm-Features: AclHuK8keS0URREeVHi2bDcMrIMTrg9GDE11ruNkJWdKZdjkdmjRgehGKxzojT4
Message-ID: <CAORyz2Lv9fBrKZOQ7kFBE+u-nJ-dFpRm_3G0JTS=bHtEL6n_GQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/9] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     MFD_CELL_OF("mt6323-pwrc", mt6323_pwrc_resources, NULL, 0, 0,
>
> Nit: This is non-blocking, but if you have to respin, please use the
> 100-char limit to keep these on single lines where possible. Same for
> all the others below.

Ack. I will rebase this patch over current 7.4-rc1, adjust the line
width and send it independently of the addition of mt6392.
Thank you
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

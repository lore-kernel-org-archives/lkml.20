Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794587973;
	b=2FOUTGDyovO2Efs3nayJEbzKVXwrfvj3GeeqwhSapszhfsJFinZrVYINHr5OHxZwj7xY
	 IDfMAhSikK3LvG6IH4hfxxFReGvaYmENpZMESkYo328druJ328Oa5rbPdj50ncTeaHZ8A
	 tZ2S7fRR/bAx9lbG4fD/GHqnQWeTgwKuqLMP5yYjWwBpD9MI6hXZStY4XOVQ1G+U4w1Yx
	 FCcIlF0R87yq4zxLLAXcWGsxWlAgojlFIApNT5TkL2WLmE7TMhQIfBHaIJ8kHJh26ffpC
	 wBOm2yUFOX1jnkafzkBrWTR7AQKKsnFA5nLM3OHXuce//EftvzcVmcOsLKXxzaueS0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794587973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rw2+Wu07AzcSg0TC6g7lPJt693i+bJC0ptoRBW6zeXA=;
	b=LwsoXhu0WeRr18JpsaAc9UcbFd2Aj60dTbZIs6hkcruzPd001gRO8mVooNvIvS3H+zwL
	 pQvFSqAzoljNfCafZpa2IpTLkt3q9P8fa/dg0152oluk2uBOnr/vIl/fBoHiJIQjO3Ymg
	 kiQpkfTAo6fElQl8d/5uunm3cgbDN2QGozgnCsaR2Kv4x89UUdP/r1/cnRybIviVrCOeN
	 a6K3c0KuRpqCkCWGW0d/jVI+gd9JHzs2Pv4T2rV32p+O6tJuhTp+M66vjN6QthOwjnBP5
	 JrGlGmHMjYFcOcAAmJ1anJtSmY/sPWBDvd2Zv3UIU9VuWXzPnqroqaxfo/lERatUkUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJxwPzei;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689EE606BCAA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 16:39:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 689EE606BCAA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJxwPzei
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so1760678a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794587972; cv=none;
        d=google.com; s=arc-20260327;
        b=f8QiPcmck/nSjo7gtLUzlVXcQhSYejomHDzw0YacCCpj4kQu3xx4pBHwfOWkcBfdly
         rE0vrdMMk9RJj7lF/Qg7yHcqjSp91ihG665glm+IVvRnjBWwuYYcUhfc1k7mR+ZuB62C
         JiraEDjqiS1MuUngv3cb3JuR5kFJYz2jhIbsaeApuKJrxjawrVsCITB1sxF4bbF/WmHM
         GtOO+0FnEHRvTXtjEyQdFROFL96dx7BP5MUZxRv1JSOu38LNC4z+csrQOXslHs7ksJG5
         QX8Xao6kPOWZOibUUXb9r14MVNFSNu/NQgLJsHtY/GujGm2S/xXfW9KSZFVw6a9oD2SS
         Tsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rw2+Wu07AzcSg0TC6g7lPJt693i+bJC0ptoRBW6zeXA=;
        fh=IuJkK6kGmW/Fm5uQcz6UREqTx24gqRx21jgAg7K6Oz0=;
        b=f2TQsZC42McLGYLGehyPZ2fJwrrP/HUp6UxFfYekTMLvCTRDGS7xLzxFT/nlAlKqvZ
         HcxN7UnRXvWpTXVGZ0bsJj6Cj+AGzc6/gyKen/L/xxFt+9kokZ5nOF6RMN1CFhYzaOwt
         n8fJKPIUb6hjd3nnK0dPiFfraZKgELSzc6BCH2D2ZmZsocYkCK0Pk37LXAWxjxoxPF+i
         WIPLJZ+Pb7SvdNbcCa3ELY5/HjXnuZB5UXPMvZmMx9nT2qYNN0UgkF9ifsbljgRpsnrl
         KMYnXUKc3qca3MJtZI8ZlQhut09hJRzSi+uKfh1Y/fO1k5naoZTdg6xxNGAd2cv5aIDA
         5nmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794587972; x=1795192772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rw2+Wu07AzcSg0TC6g7lPJt693i+bJC0ptoRBW6zeXA=;
        b=PJxwPzeiqzZUHmNi4ZpZ3CE/irx8leO5P+PLZjT9cYIqt1Ihc6LYUfmTeLM9OHRujM
         kiWqrg2HHxQbBnNW/0ZYloJ6IDoXIZ5b9R5QGqxqnzf2e3q8PoqIRymnhNLOpJphwcPY
         ZYLi1TAawjgIbAZUINRghR/Z80Q7GkS4PrlIQOGUjx1UaZMFDVmzhTOpvEisrBM7yNt6
         l4BqKOWLY7FoDYpD+O0m3K1cMG6r27O3NEhNdrPS6gBIYjxao0+YHpCbRdIDxxyllrgY
         AazhY6bBo6qoiveyrTxbK1OnA/duerPVRxa5O83ugyxoBT1IhEUpiHRvebJRe+uTUqPZ
         hXaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794587972; x=1795192772;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rw2+Wu07AzcSg0TC6g7lPJt693i+bJC0ptoRBW6zeXA=;
        b=Fc7UtUCT5+l9HgTjg5L0z4Ns7pECjw15Pjc05FL/LDDr6PokTgNoMMv6sQmD8JSb5J
         haot4dROLqGaLujb9Av4T9haYD948u5NdJdO8Mdh1kpcQuZJs7DxseOAHa9vUs/R4PZy
         r4YXKuK7bbZfSDqYuPcBF0CGXS13dwNzkqeqyakXKNNFfL6lthf8npH4UYalIwxiORTg
         wbn7mpeYuuKm7ZTxgmmmGzcvNRJ2zDQgCBSnDoUAdaC6lSDm6weWvqzpm2YH+axO2wdk
         Px0uTIcap9r33hSEM2uDCC/+930GnjhTT12FT/BqmLqqVaS39O9FJMUtuhzU3t4o43sU
         hFxA==
X-Forwarded-Encrypted: i=1; AL+hErGUCiVM6A3w/R12oSbIhCzcBpUyPU5J+v9I42/k/EmqvIBGh1VVhwVpJda2VamOUPZsIasawBxDc/vd0PM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/17uJtRvzbMOXSCOg+MplobRFcOUDuFIAEui/XOG99UlgtWOlQ
	ODK4NS32M1Ayeku3ynaIw5kXnMdRw0+1TNNds5W6yaoIPn2n12mr2vzl8wOhnuK1rGiQnm2Uw8x
	8Qg5akmxISjjrkx52M18zJXTMUk36B6g=
X-Gm-Gg: AYBFou0+W/3D2xUtPSY9r66N5ofE+KrxIwpZXHz7+yKm7e6yfF6yX/btB0YMsXdJYNz
	CxmnMcCIQEQNduGJh3bIdWjcAjMObVQtklRAvM9CxaOgytNwQ4Cew7ec3ar8urwMmy6BbQGYXp3
	bc9WljcEmjcUOlV2UfvDYh9Wq0QsWS+v1Kp3jANpR7NnaBhw2Ehahbjm3TJBQ+R7mtQ8d6IO+H3
	2x+traAq8r1azXwDxROI8uTSBd7JSOo2bEiAQmhOzWjYxpx4J2RY01z4IQS0BV2kaRhMN4KwdBb
	2dCzUEuJ8zmCFPwAZbSZ7TdsGY7yx2TBPOZiGTWongW17EPUlIYd3x67gUNYjgJtQ+JyEVXcUiB
	lzqosgGWnNcS2wd//bbak/xatCQVctKSnYjtylr679HXC+NNwxisQXGIbfthpx6tNYJ0eWUrYcB
	RjI5rjLl3QDGbbyesvltjuMw1Gbc/xVOrZHZbwuyz2YAR3HqhbQvQn6UNKmweRDGLscAdNKmeQT
	qp+RK4XttjpgDXglMyXnLTvLaXwUqg=
X-Received: by 2002:a05:6402:90a:b0:6b7:b872:27c0 with SMTP id
 4fb4d7f45d1cf-6b7c0c86ac7mr2641866a12.44.1794587971407; Fri, 13 Nov 2026
 08:39:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-submit-phy-mii-reset-v1-v1-0-02a55f352a91@gmail.com> <11acd5b1-3099-4e3f-9fdf-a3c5c6f098c4@lunn.ch>
In-Reply-To: <11acd5b1-3099-4e3f-9fdf-a3c5c6f098c4@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 09:39:17 -0700
X-Gm-Features: AclHuK-0ytg4Lbmg2sk7INYSUK5YlLS26Oz4Ge_M8WOZ7bj0w_qDEbjGo4B5KuQ
Message-ID: <CADvTj4oPugtaeAXPvjJ10nhfKGDWTKbtALfuyF1+wUsHu2e90A@mail.gmail.com>
Subject: Re: [PATCH net 0/4] net: phy: restore driver state after userspace
 MII resets
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Michael Chan <michael.chan@broadcom.com>, Hauke Mehrtens <hauke@hauke-m.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 6:33=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Fri, Nov 13, 2026 at 01:48:39AM -0700, James Hilliard wrote:
> > An MII ioctl reset needs to restore the PHY driver's configuration and
> > software state before the PHY worker can access the device again.
>
> The MII ioctl is a footgun. If you use it for writing registers, don't
> be surprised if bad things happen. Even reading registers can cause
> bad side effects, like missed interrupts.
>
> The whole design is broken, there is no fixing it, so we don't try to
> fix it.

Would it make sense to submit patches 1 and 2 as standalone fixes,
separate from the reset recovery changes?

The b44 patch removes a spinlock held across sleeping phylib/MDIO
operations, including ordinary register reads. The write-error patch
propagates MDIO failures and avoids updating cached settings or running
follow-up operations after a failed write.

These fixes are independent of each other and neither adds reset
recovery or attempts to make arbitrary register access safe.

>
> Sorry, but NACK.
>
>        Andrew

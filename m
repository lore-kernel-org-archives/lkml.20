Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868040;
	b=t0ByqpKodhKuJ4zHpEGqWW6EcZ0kWLMt1oIC8SzXVbDLnHQDj+AeUB9JFGf+AVRVmJrL
	 8PKZi8W7VwA7Wy6SVtYs98do0o7YrU/wCCk46FiWJEexV2QWHko2sbeZTgkO/wsjECAed
	 pH73Yee9aEFRz0ncFRSCz1Lp4KnYHUNapYPZpUxgTDQtuM24TCEtACaXkvF8hGO7oUc7x
	 yfUtZs2M1rQnpnfRORcJNkFGJCwfm+Xx7xgsgNabGh4V5QWTTeYRFPnSSXJbI9igWbRRE
	 w5qRNHnY31yMN4uF4gEYX2Yphdp+/5xA42VrkVqw7N8DqCw6BPo0XX9GyaTfFEiC49Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868040;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=J5gXWu5vrhC9QDJv+VoLu5Rd6y7WbcJ3q2qRfmo4/U4=;
	b=WbT8jftwBndDUfXo6OhogwmJQZJNP2eqxU4+ZNK0TrgUrt9jDufa7H93QF0Y1QskEMaM
	 1K2URD2Sn3hAt6CjkDRp5gL0PJPBYolrHOC5tm+770h68cZ9giTsc1/O0uRON6T9pDN91
	 LvKPnqdutnByJ1NJoVmJTFJHAjbHZZFsRoe4uw6Lhqob912QUmIgxqATwRlOTnCbGlZ8R
	 RmghmkEzqKYfEsveN0T9XNS2PubcDxVnGnpResFo6UFqdZsPwXZQgq1INFs63rmE7sFFy
	 gGLhLcJbPW0eUbQh1zgnX0Ra46nsynEeO2qU/dksur+AKoHfW6HgOGMyVdLJrQa05gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpSPsDb0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E657606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kpSPsDb0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D070D1F00A18
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793868039;
	bh=J5gXWu5vrhC9QDJv+VoLu5Rd6y7WbcJ3q2qRfmo4/U4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kpSPsDb0yPQzspx+pqXsOCUHH+PRE6+AJ0v+Slnebfzq6r6tdzfzzHoYsr5YsL5dH
	 e6Ow5CnNiAsuUEYZnq1+XUDNFXZuN7lKEoIoiAp3mXjJF5sIlRy5ARHl3LFYs1NVzz
	 SvJ5wEm/2nD4A2mG5+XvFKYG3KzUdbW+OjZ5TvnRrOhch6tab3o4uDz1URd+clau5/
	 LAtJlmietwPFF0Q6o7oE2+m3++OMc/iFdLqWBZai6FPcjRToNXZPC6NjBQOOaikJMT
	 tTVw7wloZkwDxq45GG8x8B88azC3zj7gqG5IyaC376xYKKH4PKnnJrFHI4IeoyLFUS
	 xBk+E5aNQPgMQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso1008347e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:40:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzfB2NpWTmy+G1h3gmkSWPJhMXoEyGfl0aJMXW/z8OSpjW54bUQjmg/2MRI7dS5DNauRvMtWy77qjWkZ7M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9d7BLZDGc1DEjpqbGSUCdMjjtJm3O2hm98UebLu7vRIWYr2+RE
	NS3K5h1s4Os0GAciPVH90O0p1NCHOOUxeQGrEtWId5HfL5sPrsuy4zq/Eg1nhPMh6ZXDyW3sVVg
	Hxw2NBQG4LDmjbc2tNaRrGeZcsEOSTos=
X-Received: by 2002:a05:6512:3b2c:b0:5bf:fbe4:4b2 with SMTP id
 2adb3069b0e04-5bffbe406admr445427e87.30.1793868038566; Thu, 05 Nov 2026
 00:40:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-i2c-nomadik-fixes-v1-0-655c6af2cb70@mobileye.com> <20261103-i2c-nomadik-fixes-v1-5-655c6af2cb70@mobileye.com>
In-Reply-To: <20261103-i2c-nomadik-fixes-v1-5-655c6af2cb70@mobileye.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:40:27 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9tVg=mAr=hcJuSKwFdCoRfrH792VUQ7m21avp_-ei4Q@mail.gmail.com>
X-Gm-Features: AclHuK_dYZjPrUpcWVPYkjWE1wavAEhVwWZvTK26ps86c6G9B9jsBZbaCvbMhQI
Message-ID: <CAD++jL=9tVg=mAr=hcJuSKwFdCoRfrH792VUQ7m21avp_-ei4Q@mail.gmail.com>
Subject: Re: [PATCH 5/8] i2c: nomadik: add quirks max_len=2047 and no_zero_len_read
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	srinidhi kasagar <srinidhi.kasagar@stericsson.com>, Ben Dooks <ben-linux@fluff.org>, 
	Andrea Gallo <andrea.gallo@stericsson.com>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:29=E2=80=AFAM Dmitry Guzman <Dmitry.Guzman@mobiley=
e.com> wrote:

> In Nomadik I2c controller, register I2C_MCR has 11-bit wide LENGTH
> field. Its maximum value is 2047, so this is the maximum length of a
> single message. It is less than the common maximum I2C message length in
> I2C subsystem (8192), so define a quirk in order to report the
> unsupported message without any attempt to transfer it.
>
> Zero length reading doesn't work properly on this controller, so add
> `I2C_AQ_NO_ZERO_LEN_READ` quirk flag.
>
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

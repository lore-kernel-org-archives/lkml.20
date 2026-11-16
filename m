Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794827987;
	b=1O0C61XwtOIIkCYSn+X9B/6wx7u0as2VEH1OrR8Tzz5d5clxOU0gQ1s8yxd2CuM+C67g
	 u2Rj+sG7MBu+Lk+qhOxN8KkcS8hNqjdqgRC62w0LvItNICairNP/O4Nj5064rsvByKvgU
	 OEejt8Rut1fzVEOtg2/HLMGUEvZO3d8LyUycRlAw8oDVpcC4yq7yHRQv3APCeXDt9NQN7
	 4DcK2UsMVdkVi4UMJksEJ2VlKudbTkmrw4pG6mp1nN0H24xvRolOg0GmUFi9kfnxBOTHO
	 HY7Rkc7q+qATuaxERWJe1JnF90D8NGDU8gwM8G/zkOOkwjeddfwa8DB96MnOslGcm0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794827987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=12toUiBvLkAi2L8mYkegaLZ2w5K3s+1X3UnVPi/V9L8=;
	b=INbc/hq1T1oNTT85uM+JDQFyVtmdoKX2R4THn3Ta08Muh3FPWo47Fc6d6u5XBNMsw14E
	 FfR26H0aDYRgFGLGnqmgVY7gbREM/3X15YrHC5hxu1ImriZV6gqc6VngAQIM2Z/LQ3Ot1
	 vj01sy3eJvikwuA7O0FKaj1AeAzQyiz7EpD2v+H14Vzk4AEqyyeUg+Y4Q2eBAZ9hYBar6
	 /ZGiWmxpVP25jOrEZeNkBjMKbB+tjaOdmNduZxxIR7vfqYLxQCtN+mCZ2+ISI3DM1VWJs
	 MciZDJrhq1CDnNV/e8tEcZ+hjxU4X1CHpROelbBWrqZE2DfXeZCBltUxPMmmXYWp2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dv1CJ8fC;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AA7606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42AA7606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dv1CJ8fC
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49465892f7bso2742781f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794827985; x=1795432785; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12toUiBvLkAi2L8mYkegaLZ2w5K3s+1X3UnVPi/V9L8=;
        b=Dv1CJ8fC+B7LC8Vv6C1iSSMs6MOo8POhWeVIp8ajDOulr1OPu9rz7gi3Qv8kIKnTuJ
         1QPd/r3TIhqTpU7zuqM5OWEx63Xes+8DfHcF42hwupjVyBsPWcKr0JF5Mhgp7iI+mUOO
         X0H/XaO4UvhDEWBR4XSjfXoDEDHVamTd8gVdWVoJuzIFEFZy+vddUCMPuzpCH0fH1+0Y
         Bmh7VM7qolz1t520igRTI8bzss2sRN5htXfEImLD039reM3eWNVWvda2BxzTzZrarsO+
         mSTcanTlL8zgnIB6jcTR5xZdMtLGDnLce7U2cq2+dlBvaff6Fr+CNGn0o5m/ICAtvEN9
         ygiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794827985; x=1795432785;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=12toUiBvLkAi2L8mYkegaLZ2w5K3s+1X3UnVPi/V9L8=;
        b=N0ssKCPThOhsk5pQHgtrcAgoFeH48l8wc1b+tq+taJv5YsstZ4vRPpLpF/FkXc5N/g
         8/jcFTk9f3wk9z7ruuJsyQExeMLrjSIqtSFWx6ZN6ntTiXXKF2JgqQ3xN5iIRoatqMJu
         vfnpYFPLVd+JDGQYDObqTDWNKczVHBXQ+A2RUm8kEX2+9hb7ZvJqFrjQKbiqKxt6N242
         jo6NnWk8z/n5Km96YDqVPt6w9UMHx1fJcoCe8MMQrFxdiX7Zv+iLk2yizDQVgPEFvD2J
         rnXnru+uChsNrXtqiojpy8s+Tn7h46aylc8pplqX6Cy59oUck3Bh7uw2aYS7Q+aCzwFB
         0d7w==
X-Forwarded-Encrypted: i=1; AL+hErEY5lxkmYVMI7w3W1Syy+xysqCRNw5JnqdsQTz65NSeIMWTgupVYVaTi51FtzU2h8aCCGoLy5QzXh/Eo2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9hzLPu61JL+fXOz+TJfCTtioIBawUfTjFW49Tpj4txvtK0B4FS
	xfZQ2ikLtmoMH8H1q47vPMUj0WNXel9XGkNw/TLhger/MYvFh5DjKTVynsXg7koOnmU=
X-Gm-Gg: AZFdTZekA0OrNPSjhJRaVKLjPbD9w5OU19fKrJhv3sBfbZ2DQ6ouPVW2kM1Nq/HYS2l
	sBslvqKMSdRRf6q6qbqR1VXOjnnR8Q1pn93iMwqPkDFza2s+0B7LF4agq/qXtTmgERKoEwdDtng
	SinLpM7JcpcTDqpdC4v/ZLWh/x6g5q9c9zMX7OUPk7ehrD/ahojBELbEmq1HLzqeCD4/Knwtsh/
	9u+0u9s2vbVqwMGGs+o/6BviG7IORwIwFJMjPfgzoAVOtTECKud4USUz5N9UFw15YQMnT+JKolM
	kKfUU/T7/noywrmwKvqSQYs6ptbGNdeu/D+oZh6II9lp2iPUScjIJaDB4sHZumrnBW6vP+dcxYV
	vU1nCsHnb3+r0HZ8OM7XJorvtiaOe2uvEOU3AS94AoZPnWDdkgi8M8PigZIsEFBdB7iYuhcdSJT
	Zgqm/JL5sIJZx/F3SxxxYePAr3RqKuqnVfmejDd2rMXJhrIgXuQBwQaXBd3EQMNK7VWTWT+vVX9
	LpHt9JFL172dNGFi8cd7mlueBohExoIm7yyDw3trNyl4Jbitfe74B+QCp8XiwIxW4iKmCMXFZAX
	bDCtVGoiHT2hPasGBfjV7KX2HzlOfoYwR2XxWhSrxmz21GQ+
X-Received: by 2002:a05:6000:1884:b0:498:42e3:3f6f with SMTP id ffacd0b85a97d-49c6d63fa5amr23999007f8f.5.1794827984759;
        Mon, 16 Nov 2026 03:19:44 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7390fe82sm22622193f8f.17.2026.11.16.03.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:19:44 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <masneyb@kernel.org>, Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Brian Norris
 <computersforpeace@gmail.com>, Maxime Coquelin <maxime.coquelin@st.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Sascha
 Hauer
 <s.hauer@pengutronix.de>, Michael Turquette <mturquette@linaro.org>,
 Stephen Boyd <sboyd@codeaurora.org>, David Laight
 <david.laight.linux@gmail.com>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: divider: Fix the divisor for rates above
 4.29 GHz
In-Reply-To: <avXhA9mJL0EIcm_0@x1g10>
References: <20261112-upstream-clk-divider-large-rates-v2-0-18f3bb888b0c@baylibre.com>
 <20261112-upstream-clk-divider-large-rates-v2-1-18f3bb888b0c@baylibre.com>
 <179449618653.1227210.1767827907767958978.b4-review@b4>
 <avXa2Z3R6Xogr6Sw@macbook.homenet.telecomitalia.it>
 <avXhA9mJL0EIcm_0@x1g10>
Date: Mon, 16 Nov 2026 12:19:43 +0100
Message-ID: <1jmrr92fcg.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 12 nov. 2026 at 10:53, Brian Masney <masneyb@kernel.org> wrote:

> On Thu, Nov 12, 2026 at 04:29:55PM +0100, Carlo Caione wrote:
>> On Thu, Nov 12, 2026 at 10:09:46 +0100, Brian Masney wrote:
>> > Hi Carlo,
>> 
>> Hi Brian,
>> 
>> > >  static int _div_round_up(const struct clk_div_table *table,
>> > >  			 unsigned long parent_rate, unsigned long rate,
>> > >  			 unsigned long flags)
>> > >  {
>> > > -	int div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
>> > > +	int div = _get_div_round_up(parent_rate, rate);
>> > 
>> > _get_div_round_up() returns an unsigned long however it's downsized to
>> > an int here.
>> 
>> Right, but wasn't also DIV_ROUND_UP_ULL() previously returning a u64
>> that was stored in the same int?
>
> OK good point.
>
> Reviewed-by: Brian Masney <masneyb@kernel.org>
>
> Jerome: What do you think about this?
>
> Brian

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

I would welcome the other fix regarding div type here though, if you
don't mind Carlo. I don't we ever had a divider going max INT_MAX, but
still better to tie this up.

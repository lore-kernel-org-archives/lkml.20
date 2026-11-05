Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793902032;
	b=1SsMc8azf/mwvjMspGXhzth9G6pbhgJh/tqhAvU2+JW1yGSPkEkAB/2yi8OCqQhP+iFK
	 0CzaT8PAtbXZSBwde7B82rZrnrYi2mS0Tw2vozX6Hj8YK5RDIYnLp6/7F4Gc9m5i0mukl
	 jcMfqUEKFxYPfMCbkHlXy1wUsDem/i63fj94vbOR7cCkeFyjs3j2tB9sFu5zirZjh4tTb
	 tbEtofY0P1AOfIBRNP8fRKUirZQh/NI4+Ojo/GCXwwwKV79RtbOJMILClJHdt+bC6xrRr
	 ZeSBAZ/McVMmKdiXLJsiWr9Gjbh5Ar5qpVGM+biknGzSq/MPhU0wnvN7vbq28bzr6Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793902032;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
	b=p52b/PD7kUQjRqdMbk22DOJpUp5fAxcfJUv3PzO89zAt4OcaPuGCJ8MAK8Rh1hO0ZJju
	 oHcGtvQopKCHykvlihMjXjXA/LfdfQygRWjA1LIJ4WtUs/uV3bGdXWDaRB51MGXs1YcFC
	 dQUYjveaNTxFbOktljDfxHwQiDDK+5oVLc1hMndyDjCkwM/svuSwXQl8nPBqC/ahI3Ow4
	 4O+TQo2AjQ0L+jdxZdwn5gOLI96MYZWvw1WdGn/qJvG/xq/wOzEUittsQFPvMP6IjRD5+
	 +0IzndPkJb8CpCkWEy8OqXYllFRI0Awm4ZLI+P8g0zL7P/T5CO9AIvnSpYlyI3k190w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5UCTITv;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D722606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D722606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U5UCTITv
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36cad25b8b0so3241256eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793902031; x=1794506831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=U5UCTITvXWwFAMjd4xA/eex0qYwQOmYLDActLa+N1l7D8a8wyRtF7hpXuTcLzb83hW
         OpYR7T0gTEzY/xFfgSBaFHKkGyyWC19rgNGY4YnMVY963R5LNu+6Ysa7GJfhgKd9tbCH
         k2D+OaUerwk0ehLHWWQRQj8ebKEn5Gi2t1LkLfuNudcN4yyXYz/ohhmBjXYDxz40o0o4
         aHJArNw3iM08FnigMyp7t/hUxZcRNzPtUNGBrlsNk8ZcgOl8VwvTzt+rei5o9QCXTpk7
         GqWvwKJajtiw/IPmJnF5PnREMj0Tuw55QuXIan9StpKXScRuqpDfmBl+orpP5KizUVP2
         ABNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793902031; x=1794506831;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WNyoqfFkSiqIaDnNr0KZB++i/w4miVNCO0u6spo9AfQ=;
        b=EPmqhgJ1gACUU+K99d95iRw0yAWeLbdKaPZnl0wIbuL5iTZ5vbM9kfF1pcjXMggz6W
         V3/yHpsTNym4GXw+idJG8KxGLMpitD67xTo6Qu6nKsJAucRu5+ilLuYQA/oY5H0FJssp
         AK9QGeLM3PiL2ipB9J41Jlxd/qUGVNjs1qJ7jYGnrGIJnU0zdJvC5OMb5r9vt+0clFIM
         F/dPdbhtb10AqdOWbZWf42/kyGu3T6KOyhwSjXeEn4njgwddSSugnEfI0viNO8EfoM02
         37wUmbztn7lDls1nID+rQloXPpWGov4kblTaGSWs0rWbNL9y+dDUvwE+jxQBGyxijfwi
         2lGw==
X-Forwarded-Encrypted: i=1; AKwUvBzclEtV1WU4TIGrbf766khOtX9rH+59nELwYklY+WZ9ogkAA6qDHU0kvCNXslf6j/5wTPi8IX2jrKV//j8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6w6nOxsTlwH5yzrsufukcbEL49oW/oma7etXSs+HSv+cAbzmi
	zz4OvMhkwZvHMz5z+97PTLJ+kpE3hYHPS93RE+YB2oQAsZ4+UQWgVCbO
X-Gm-Gg: AYBFou3ZPqqcaYySvRNQfCxo0TjqDGX5A45qFHgH3TuJJ4UB2ue680chEDkAM2O6/Ac
	JRMaPe7sDEeQLUoVtRc6hQEOazrtBmgwH3+5wm6P6IjAiHyhcNmCZDTsgK2KgqAOJmgfna0Cq5O
	hrGmMfoeumhvuaCfvKt8A8S42xgGk8EXnsEFr4P4C6wMgubiQK1wgmHCASZybnOK/9Dk1S2l3Fy
	W24z/mkJbZNya0JV3huGhQ+mB+nlr1iDkVTA+/++p6swyeQ9WUQ+r/TxM7kc0xU7yPX+4AHPQbG
	OnGNuvnscjXSAmZ+LQPDaQOI9ug8GzhnFCUOBT1Bsn+Z8XzTk3bKir89Y1W9nRYAsSckN4Bpvvx
	LAbihi0JlHJOuAv9ZldJ6Q0VNeG0TQ+JECOyDcg4dn5S7bH71vdRpFcZbSpTjbBJyMPFi1p1vWY
	YzwV6N6TGH4gBZMFWwh81NsDuRmc5QsLEG5JxS0VBqI6VnhXepX2urIYaStyt+dtAFhT19SEnay
	nCszUloAaK+c+cdK2FHgzu8X3V34Qq8ktVXHncKiRNhjZ8RRaEkZsgPBowEOzNcjDIAzR7XNmsV
	78g2kMIYQDxiO2sah3NpMuHGGd0S8tvarwEkqYIUSwJ6iQ0/QJljxXA/KWWmBC7XckHhdw==
X-Received: by 2002:a05:7300:e9cd:10b0:36a:ac68:c745 with SMTP id 5a478bee46e88-36aac68c84amr14869976eec.25.1793902030913;
        Thu, 05 Nov 2026 10:07:10 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36db94376b1sm12512067eec.10.2026.11.05.10.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:07:09 -0800 (PST)
Date: Thu, 5 Nov 2026 10:07:06 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, mfd@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC
 regulators
Message-ID: <auzFQkIPZScADEeb@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com>
 <20261024-samsung-kp-v4-1-e21253295e68@gmail.com>
 <20261104181429.GE1650678@google.com>
 <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
 <20261105085321.GG1650678@google.com>
 <85817548-28f8-45ed-987d-a4996c2bc4ce@app.fastmail.com>
 <auy4Qbxg-pW_X37E@google.com>
 <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9ec396-aab1-4950-8ea6-dd72d8938464@sirena.org.uk>

On Thu, Nov 05, 2026 at 05:19:30PM +0000, Mark Brown wrote:
> On Thu, Nov 05, 2026 at 09:12:38AM -0800, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 02:43:17PM +0100, Arnd Bergmann wrote:
> 
> > > As far as I understand the situation, wm831x was used on the
> > > reference board (Samsung smdk6410, removed in 2019) in addition
> > > to crag6410 but never anywhere else upstream. The question
> > > then is whether we'll ever see a DT conversion of crag6410.
> > > This would require finding someone willing to actually do
> > > the work, and coming up with a way to handle the autodetection
> > > in mach-crag6410-module.c so the correct spi/i2c codec
> > > child devices are probed.
> 
> > So I guess the question then: do we need to keep this board at all? Or
> > it is time for it to go the way of the dodo? And then we could drop some
> > more drivers as well.
> 
> I don't really have a great replacement for it.
> 
> > My goal for the series was to move along legacy gpio API conversions, as
> > well as move away from the GPIO lookup tables (ideally I want them gone
> > now that we have software nodes supporting describing GPIOs).
> 
> It is a bit hard to get enthused about software nodes :/

Hopefully you do not need to pay too much attention to them as they are
hidden in the legacy board code.

The benefit is that using them makes the driver exercise the same code
paths as it would on DT system (unless you insist that the driver is
very special and should only use of_* API) and allows dropping support
for bespoke platform data (in most cases).

Thanks.

-- 
Dmitry

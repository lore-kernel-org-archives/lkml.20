Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2DB495AE5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942347; cv=none; b=sYyn9SzPekxYVKhDOqptvhIISh5bMu+hxrmzU51vXbpAk517UuFwpK/vw3ygHczJJ+0gdcQjgRrXip9O9bUjdMYMbBzh/id6vcQJtbhfoE5VQwXuAhObjKQ8tqgli+tny80MAjxeJrhFAacW6mxaL5UrgIWiAKPzps8DtrlK+EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942347; c=relaxed/simple;
	bh=hqsUH0xvoOGFRDB3jEl7eLagso4wlU0QytZYQJqM8hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e8HjcB4ld7rs+l0QDxFtF/fd9kXztdNMVvHmWEA220aPxrbw4INyEaMva+aPJM++mOlIwY2qLilbc+57prsG5HnXXsLjD4yQ2PhR8fG8aYHNc+7dr4GgRe08jAxQfEOCMt9YGcKKJu1QJ154hwI55KvVZjOPR7vylb4riZCrcYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q1VBAPmc; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q1VBAPmc"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f63546c5so6657352f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790942341; x=1791547141; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2Jhfl4IsYX/26MbYUd05Eygx5yXfRkgTahQeUMWqDQ=;
        b=q1VBAPmc8BjDsgUnhJ1wPYNExgqlQxY8GlGnksgzXscW759U8QQZ/TVVI3pOGvvQbO
         hUCbj7AKp7znbgq3JS6Fe2Za+DS/Z6A8Fq5rXsoTYUyWo189Lvp8MhssYXknRhZlVb8c
         1LM6dTNdZ32SULhHr3BjC6ytzMOxfdDY3BUxBaIAW74Olsvh/rfqoQbUWdyaAjTs3tro
         X90xSS0JEtQVrF7vpEw97q5Z2JB6xbqNxuB30fYEd5KdobJgg17yORMZK8/rCKp1kHRc
         87+VtgRHA+lfI1I4NSbCDYF4y3X58X7bonO81jMKFXZ+Qqr9wwIafxhPxFCkaSrg+6GQ
         HY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790942341; x=1791547141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A2Jhfl4IsYX/26MbYUd05Eygx5yXfRkgTahQeUMWqDQ=;
        b=ZnfgPb4tzWa4kbccewZFyUcSGWqrKia2uUA83cnORx0QYQq4f0rE1BKLoQatOv0lNq
         FUxA3Eikk8ONSjZD0puou69jDi/Cb/1kSh5BFN2hoW3p9raNKa2ndpyosXNiPhgr+fZy
         Dby9hRuvE0MmHdYSTUVNdDJUS/QHvmbpmSzRKoOwOJfshDCMX+y6tnS54UJMIyFYwDgB
         12aZuuKhT3+O5fBdQVinWzOWSjJ4OXMMg9SCjRaDZvZhB6lSB26r/j4X9qd4uzS0NxA9
         tpzebAu/XMFtyFd+dMWRTBWymqaeJ8IP3SttcXha8AJupercc5HGdC1dIG34cWJ//71Y
         tWtg==
X-Forwarded-Encrypted: i=1; AKwUvByb+6n2XfXjcATrwdUJtJI8AzEpQdVUE8WZ4ZAH5JFFst0tA9S1e4feslX8HVt6I23QaUQ5l0v7PqEyOqg=@vger.kernel.org
X-Gm-Message-State: AFuF++k2MVEbJNX+Kn4W3iLLXSfaM/s6BBgvAj3L8jlhoE3Exm4bg1C/
	Rs+Usd2R9ErBZEnscvIN6a5qj7dDh2lb3rVygkXjzjUuHCAgCLq+7Q0P
X-Gm-Gg: AYBFou1iLg0M7GQbuMaSx0cAaESNjlN1Jd8A8EgoFSL1fzXvk/HqUJ/VWVDTOTorAlt
	BEpk4pdD5Ow4wyBBXbtKQNrRrXXHOAuoYsllTvq+J5iqaR1TjPUFuys3nAHlfnwx9Ftaejc+ZRM
	ygJ7ch83ldqv+upbEIQrtmFCwam/U26sRK2NGV3wy6Q4dejeQnSdCvBak9KQXwjmzsSan8kOqYJ
	zjuP+A6xanPsOw9FNBM7Zczr5QWzH2dKB1TJ+6LgtId/wMNphFnXQjZ8JM0MCNABD6K8B9WwdlY
	Zw0qdQw1kMAmLgdiGMfzISDvbnq2TAXs4+6BtMF/n89aYo4qajLKk2kuOt9/+IOKQKYtWJEpMIs
	qzJhyJa8BJAZXAGjLkZeHWsGiBq35aH20YcBtR4uH+dSUNFF/D6mbYxNJB7Q/cYAD5ptFBwjiOr
	GqzfjXCfPxqqy7tgjI/bdxe5CGzdDuMRI/xSZKVcJtNMCdoeADbTTlYWzv+uO/IWQzQRwbukBYj
	GI9wyOzuCFaEAfgZojxRt8/h/tBSVM69Ei5AiFqW8UMwR0EjwE0oQw4qvKqTAv09x9zkdygBNjC
	iPm5y1n8Xn1qM1ulwO4Qjed8ED8c
X-Received: by 2002:a05:600c:4307:b0:4a0:b6:4619 with SMTP id 5b1f17b1804b1-4a0274569f9mr32626085e9.0.1790942341160;
        Fri, 02 Oct 2026 04:59:01 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff2280csm44613255e9.4.2026.10.02.04.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:59:00 -0700 (PDT)
Date: Fri, 2 Oct 2026 13:58:57 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v4 00/13] ARM: dts: imx6ul: Add Variscite VAR-SOM-6UL and
 DART-6UL
Message-ID: <ar-cgeR8U0dmOTvI@Lord-Beerus.station>
References: <cover.1790693249.git.stefano.r@variscite.com>
 <20260929121455.437291ea4b53130e3e19778c@hugovil.com>
 <arv4MwHV4LntROkN@Lord-Beerus.station>
 <20261001144344.2100854b8f5e2d81cf87b424@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261001144344.2100854b8f5e2d81cf87b424@hugovil.com>

On Thu, Oct 01, 2026 at 02:43:44PM -0400, Hugo Villeneuve wrote:

Hi Hugo,

> 
> Great to know Variscite is adding support for the DART-6UL.
> 

Thank you Hugo :)
Over the past year, we have been prioritizing security and consistency
by adopting a mainline-first approach.
We have added support for almost all of our SOMs and configurations,
as well as several driver changes and additions:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?h=master&qt=author&q=Stefano+Radaelli
And now it's time for the immortal i.MX6UL!

> 
> Please work with the existing modular DTSI files, do not simply remove
> them and reimplement them into your own files.
> 

Agreed. Where possible, I’ll reuse the modular files you added and
propose fix commits wherever changes are needed.

> 
> I tested it and it works. But like I said, if adjustments need to be
> made, they are welcome and can be done in a separate patch to fix it.
> This sequencing is something not very well documented in Variscite
> datasheets. I asked Variscite support to improve the documentation for
> that aspect but it was not accepted.
> 
> 
> > For the LWB5 option, the procedure enables WIFI_PWR, waits 10 ms,
> > enables WLAN_EN and BT_EN, waits 200 ms, then lowers BT_EN before
> > re-enumerating the SDIO device.
> > The other Broadcom option does not use the separate WIFI_PWR step.
> > The existing regulator and MMC power-sequence nodes do not express that
> > complete, module-dependent procedure, particularly the BT_EN step during
> > Wi-Fi initialization.
> > The scripts also select the Bluetooth firmware according to the detected
> > SDIO device.
> 
> Firmware loading is handled properly by the kernel without external
> scripts (tested with Concerto EVK).
> 
> 
> > We use that procedure to avoid sequencing-related failures for our
> > customers.
> > This approach is not new to Variscite’s mainline DTS files.
> 
> Yes, this is an old way of doing things, which may have been
> appropriate in the past when proper support in the kernel was missing
> to achieve the proper sequencing, but no longer true these days, unless
> I am mistaken.
> 

We are glad the kernel-managed sequence works on your Concerto EVK.
However, it is wrong for the LWB5 module configuration we support:
it does not follow the required power-up order and timing validated
by Variscite.
The sequence is based on the module requirements and has been tested
in our labs and across customer configurations over many years.
A successful test on your EVK does not show that it is correct for all
the modules and configurations we ship.

The GPL-2.0-only userspace scripts implement this required sequence.
This is not a matter of preference or an old approach we kept by habit;
replacing it with the sequence in the current DTS would risk breaking
supported Variscite configurations.
If a future kernel implementation can reproduce the complete,
module-specific sequence, Variscite will be happy to update all affected
DTS files to use it, after completing the necessary lab testing across
the supported module variants and configurations.

If you need any additional material, datasheets, or other information
from Variscite, please let me know at stefano.r@variscite.com.
I’ll be happy to provide whatever is needed!

Best Regards,
Stefano


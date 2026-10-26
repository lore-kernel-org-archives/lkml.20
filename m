Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793005188;
	b=VjGFNLkIFH1v2Q3/mtoPMKXHzAA1Erce1lEkLcsDz1IYcUS8lJcNHpPHLoylsfQorMOo
	 U33gAs0anBGpbcA4jowoNldF15jityff4tCs+Ruzss+qFBE/sKzKxV0rQ+1QfKgyHLJdS
	 baIdghx3ysxWvcHa68Xf3FAiG62WLq2J7V98LHaCVoMLjehpaE1uXwer+4/Exwx+wscsd
	 MtfRv2YVYKeKX9zfG5ZWrTJ9Uup61TbJe7boOi25taRhq0WVvhA+322FVqY5odKcx/315
	 XjEhSJ3ARgozIv2DYcYO8tXzWoP7uvmsOignj35dVXThwmGW1JqfYQbFPen1Qwib3tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793005188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
	b=nGJNyHjVJeyLsT64GIXq9IxWl7W9ON9BOgb2bfrwOeFUe4FFnKlXBSMCVux1MFaGRvSE
	 F7LPnshPs7oxMYBwngo7LY9Sl0BXST9/DoXMGED5Uw28gNQpdkk2mIgc/v3hbbBxPJwbZ
	 gkiHzjnQPfOwIqFdYG8DwfNDRwPsldrUAUQSgD86e61c5pzuy4oVkPLgPywUGG30bPWu+
	 dhIZVnDFSUzcooBi/sNII32Wc1gQsKdvYeiqIJSuEduPB2OgqwwyZxX/TUcVgrNLbNjyO
	 R0ndyVf7thBol6K8/8RuYHEvVBNXZFb8Fra7hmStEp3+EWncdkPApL6I2HCCFdlcBDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w0PcWQ7s;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F6E606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F6E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=w0PcWQ7s
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33fb4680717so4956402eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793005187; x=1793609987; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=w0PcWQ7s1jwKnNUWE5T/YOshA42iaUDUUhGpDVV/1vK6RT9R1FUequz5lDy708udX6
         XQ2CnxkMcFfd0QMdOLg791j212YiRJl1MqaUIm9FYOP4i82jHT14cg9eWj/f3JIHdbFw
         ozqjcvK9xbUHL8sC/Te9aw7gwRzSCJQSglC44zBUvT74xxDkm7Uahb8MTZffFSaJEk9B
         Ziz4jO9I0BbWb5DvKCz3n9NN/51UaFAuvppNPSCMbEYMLJpXoQ3CQfZA/FjpEz+yNRz8
         THOHu1MVSkPKmIcLqxws1SuWjsSkZ2CihN1soh5iSuzcYy1g9h2P1FMFfLFHXw6t9vvV
         fkzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793005187; x=1793609987;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=49/7WOJdVSLVzoq5oWG2Xe+wRQoxoxRWiSnOqn8O/K4=;
        b=c5iIj94uVlW21LeFH62bUsWGVfv1IJJm8k5TwI13gf7FkrYI39bYOmZuPHfQzzLpRz
         PcN7nUyWlBxh+LCHVNjF4Vh9Di4J87kj+pJWJzF/ihC6eUB72aYEc9Xj+kr0MZHe6wnv
         W29YPKELrwTVdo5eAHez13jXpvD7+6dzbQgki40S7mK3IrcvYXN35n7pAI7yoSlXH0LR
         dMlstyFpSGp4kLImpHA4404+RbO2kE5c67cKaNUO5ND5lf9RMOx0DGwzmVnKOs56ewoz
         DDkkSrFd3fvhUi0mLjXct5SpDDHfyBoFmq30ajCWXvCq8mbX530mpdJGH1gxRLCKyyKd
         C4Ww==
X-Forwarded-Encrypted: i=1; AKwUvByuIMX6smqMWYUrg1lDFFeSkxFXLiw9kNEnYKxVI/BIDjSoK/fJZ4dAH3KDVGVj35nNLPGCYx+wr+nHIOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrhj2ooosSa7rkHMrzFMWO3vnmRwm90spojReM78gbog9hvue7
	xgFfFTE8raKUFVg9drIGog9vKlUA5C4kEdqbLZiaj5NezEbw22Jff5sJI+szVeUSpYw=
X-Gm-Gg: AYBFou3cY7/usoYoUO/KktP1BkD1oGVCXwPLobuK/p1A3cU1pA7+5cY1azuapTTTdky
	mxq/1fCqEYpS3nKx3v+FfA6AoNrQWdy17aWVfyeOvT/jgoyW9M7NWDfN+XV6QGB4J++KFP7YngZ
	WLblWjN05fRyywtKQfWXiXfLXd95vgcseBi4kJ2TfaYXg8PLWGud1c9naYVXQkCZJIrBx/0HgIJ
	0wwkZUe9eYb82qBXEsk+/VEP/tV610ezgExinGZFf4hiIGCiaV0fP8FS///XlMxVVflAi3y7A/V
	TyJlrSgRArxhS0wT5Z9dWljFc9H7lZ9IL1zLgU+FprxpJxPTlTNisPisfZyv0uFm2LCVNEbZB9k
	f2AEeaBUluq5iZCdffvzDG9hduVgV+acIUAxr0m0pzvX8jANNqbdUuV9AehB7v5j2tEwvsUyETx
	TdU7RSOiJ6lNbfrxEJBq81QagEGLhBx8IXMYyo+/WjCXBnLFsDuwj9cDoHcZtd/2HXAhRt+e3lx
	yBtKog3h8reB3M3D4nDNvR5Fr4sCd7agTS3kEsXsi2iDutFw063SBht4g==
X-Received: by 2002:a05:693c:6017:b0:369:21a:dcca with SMTP id 5a478bee46e88-369e848a2d5mr8835197eec.10.1793005186447;
        Mon, 26 Oct 2026 01:59:46 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a03bea5d4sm4608834eec.6.2026.10.26.01.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 01:59:44 -0700 (PDT)
Date: Mon, 26 Oct 2026 14:29:41 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org,
	sboyd@kernel.org, bmasney+clk@redhat.com, khilman@baylibre.com,
	martin.blumenstingl@googlemail.com, rafael@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
	Christian Stefan =?iso-8859-1?Q?K=F6v=E9r-Draxl?= <ckoever@outlook.de>
Subject: Re: [PATCH 4/4] cpufreq: add an Amlogic speed-bin driver
Message-ID: <at8WfX_G0tfTlFrm@vireshk-B250M-D3H>
References: <20261025192219.209137-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192219.209137-5-christian.koever-draxl@student.uibk.ac.at>
 <at7lXEqds7ukoR2V@vireshk-B250M-D3H>
 <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1jbj8gkff1.fsf@starbuckisacylon.baylibre.com>

On 26-10-26, 09:57, Jerome Brunet wrote:
> On lun. 26 oct. 2026 at 11:00, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> 
> > On 25-10-26, 20:22, christian.koever-draxl@student.uibk.ac.at wrote:
> >> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> 
> >> Every S4 speed bin runs the same CPU frequencies but needs its own
> >> voltage curve, and the bin can only be read through the secure monitor.
> >> 
> >> Read the bin from the firmware, select the matching
> >> "opp-microvolt-speed<bin>" property for all CPUs, then register
> >> cpufreq-dt. Bins outside the known range fall back to bin 0, which
> >> has the highest voltages. Like sun50i-cpufreq-nvmem, the driver binds
> >> on the SoC compatible and needs no node of its own, and S4 is added to
> >> the cpufreq-dt-platdev blocklist so cpufreq-dt is only created after
> >> the bin has been applied.
> >> 
> >> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> >> ---
> >>  MAINTAINERS                          |   1 +
> >>  drivers/cpufreq/Kconfig.arm          |  14 ++
> >>  drivers/cpufreq/Makefile             |   1 +
> >>  drivers/cpufreq/amlogic-cpufreq.c    | 184 +++++++++++++++++++++++++++
> >>  drivers/cpufreq/cpufreq-dt-platdev.c |   2 +
> >>  5 files changed, 202 insertions(+)
> >>  create mode 100644 drivers/cpufreq/amlogic-cpufreq.c
> >
> > Is it safe to apply just this one ? I can take this via the PM tree then.
> 
> I would advise to wait a little for Amlogic to chime in.

Sure, I wasn't going to wait for the maintainers to respond anyway.

-- 
viresh

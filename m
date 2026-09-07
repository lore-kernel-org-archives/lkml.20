Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BED14CCDC7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788794232; cv=pass; b=RiwWLZ88LFsMRG3ou0tb02Ua9CW4uKH+DztrVtC5MQroXZDrP8Pe1iUQnskaL3tzc9WJ1dLZB/2SwY4Kps3m3XGWymsJ7v+v3xYNXGrrptCWIJGq3yB2MEaT1BAw4DaEu1sZLte73EOHk646v06N0DrkcX0zHkAA/ccxa1Ayb2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788794232; c=relaxed/simple;
	bh=tRadtUkaVvj04esL9CJgzsoORuST+i5234dOZxdyPl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZZvinYTM6wOOc29lzqBXOFzVoEOu7Vhw2m8Pzy1UKKAhIcMPFMOQXUzZys1RX6Iz6yNkvKE8un1FrEcsB92grw6x83Xi9fkwY/lYEgBcOJEZG1t/+vBRJbdw7jl+vvT+s2U6MnnEOE1U/rOkhWwXP0WuSkdOixHnK5bqtpvMC2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=3iW/nw1V; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="3iW/nw1V"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2533d83e3bso614537866b.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788794229; cv=none;
        d=google.com; s=arc-20260327;
        b=hCO2Mud4adbh8PD6KOnwxrR7JyEqh6sJ5wu8qbbotYFiefV84pk1ACjmiGIr73APEQ
         P+haj92G51AF3tbpqWWIor977DHZN4WGzsW5WURjcbPxivzRkVsWm0MwgWXWsf+s6xFb
         CMyCVuEACBD4PseaHvPMvPjp7hnUJurFwjSqmlkDW87HBBCExm5xvw5xa50qhJvSCGRv
         DPs0agGjfMI5/wF2X8g+qY0guQibxjCaadh9nFg+evpKhch5Nbc6FhAGcnZhIqTaqTAZ
         uhygm8NcTG96wMxNReR3wI8Fn/aRPisZZs+F8AG5lqwBUoCGxVDpIqqT9Ax/f9KoDpqv
         gYEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKK5R4Wa7HrnZmxxyX5YlzuTj7TxD9g6ApN3R7me0Ns=;
        fh=odxYQIRWWN8lvtjejGHqKKkU4dFxByhtr0GtT1SL6C4=;
        b=ITe8D6Yjd2elij2YkrLcZlOci9ac17xWFnCrW+Qw8lUsZrtRMQF/hMFlgIvMoAHqKX
         hZCRI6SPM/RwG0lDg0cjHiFBlu3o1ebOOOFGDNMg/2Cz44ZuqzPOCOT+/8P+wCe8MSc4
         +dQY11+Q8MaEk8/nar7lAtenqoOZJjrbBgERDZ4dGAwKYdTDWl2bcNlhY4xcNS5yVTp9
         O72fxpnARnnIQTRf7/GDaoUnOuQ1bmfuYs8nTeSjlnKPMapr9AhrQiQ4/LXSfvNzoWzv
         Pwgqnvg0+K3Tm7jHV9sz4dCa1LvDrC+CQ2jKDfhilIDPLRCVxBHqS2oewX+drAWB4L4x
         9LVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788794229; x=1789399029; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKK5R4Wa7HrnZmxxyX5YlzuTj7TxD9g6ApN3R7me0Ns=;
        b=3iW/nw1Vdh8ghzDkYFr4HbQ0k1NentvcGosN+qxMNj45+uXsaH8fBQJ8Kf6aXPMC4G
         MrGJDT2VH2XbtRsQe7LtPVLgA4NHwowtUQFG+l+nZLadtNJ4emJlG3ts2lmb+s0R7nrR
         Y7cdqH3FIlSREJ1hnXAVsK2ydU4v3pWYHWDlESs12KHDsFk31BuFvdxQPM43W8Mortl3
         PP/rLQ1bW+Xmy6QYRgZ94u7bXii81fnHUfPiM6bh6Lte3juyB3M29u/DAQNJfUU18vQB
         iNkdRt8cn67pH/Gy/7B3JkO8DNLFQOTeOfgSk46JzM9JfPOzCRHagSHMTRKVCCAEn7ku
         i4Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788794229; x=1789399029;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKK5R4Wa7HrnZmxxyX5YlzuTj7TxD9g6ApN3R7me0Ns=;
        b=jF60LO4pu6DjNMoU13ctYst/ks3jxeReshvgCtAZbfPXd7yx5mI6Qdqucy+tMqtplF
         FrR1tJ1lPy6e5SJiXeVU8pLF6HE6N1GWbSAqI4ukueyvbrxhdrYni+cjPUe6eQsbIkOw
         jDB3V8qQ1E5IcBWkcOFOLdlT8msCtnThU4vTRaQ9rMoITDjKDSkkpt4z6RqdZ81UqtUx
         s7FtS41us5WHr8IF0K3U9GTofMlpkdJpAdsSFixZCdDWCqEL4uuzc1E4PQG0UsoVDYZ2
         Is6bEfCBWpgcUQI/EanHjULAW3RIR6RApp9S9a5XwLDk4rpV89truy3SKCNDHxQBoBcn
         rgiA==
X-Forwarded-Encrypted: i=1; AKwUvBwVQAQGr/ZhBOeJP+oaCKyFipZJ7Wp9d3fkZZV5NfJNt2nu0TYVki+tkzSuGXFuuYkHN7uxzaXHsjv+LPM=@vger.kernel.org
X-Gm-Message-State: AFuF++krIhsivtvLOXVSeyvGHmJRmYqfyOZD6Pk5qwT2DK1BwtV6ec/x
	IgvWixRgOsZ5hW17rzl7H96Qtk6XjYtScgDMvME7cl2F9QSZu6usSwAtpWeMSbi3lPs+oyDkhUj
	ZcmtEKXpmm0JdYNhtEKGupnommBCd1w+iMB5mnsu6jg==
X-Gm-Gg: AYBFou2C2QGBFs9NwwCjUPEaNhTPSyG11+P+vd8jJEDNeFAcpgNvbnRCkl9k+YICam1
	iyY9NwU25CtQpuOJU3HLFpelDpCksKxxJ+7zy319a4M82aYRlZawBXe7GZZnAOW/1EYbfQyEhen
	s4Rsw2J0X7M+GObQelf//BssJfwE56+RckcphGu9f4D2FdRl29Az7gxjfXk9BskkN747kz3/cxT
	9BZvGm2CtRAK4pIQ1LTkNo5v/s/QZtbyiepVcMXrdSodfiXcr+qh32APDmnkuo8Z1hCpqEjGq5e
	nAoOeyH0Vjc2HZ+UuhXLKedWAgRxyHCD6+bwDBT1OWw1EZvvgUk5TSN4c42dqv72NYTVXtU+SVG
	Za2kLxDjD5rNF
X-Received: by 2002:a17:907:1b1b:b0:c26:3190:2965 with SMTP id
 a640c23a62f3a-c2631903285mr1089445866b.12.1788794229405; Mon, 07 Sep 2026
 08:17:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-bq25792-v8-0-c1c70473bbe7@flipper.net>
 <CAKTNdwF5yW4YFFmsvDFVY+Q+89Uo=YS79nb4qYrT4WyKOszyvw@mail.gmail.com>
 <CAKTNdwGC=AZ9jmD71tz6JqCWk-00QLWCYb9wiG6RRQ0bO=mC4Q@mail.gmail.com> <7c9d0cfb-361c-424c-9e12-0fb35930576e@sirena.org.uk>
In-Reply-To: <7c9d0cfb-361c-424c-9e12-0fb35930576e@sirena.org.uk>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 7 Sep 2026 19:16:58 +0400
X-Gm-Features: AcwNN1UnkWmNQ4cjm6HuUENUEdivKAN15-Dx3TSE__uWOXkXPewLiSPKYPBjbEI
Message-ID: <CAKTNdwE-m7_=EE1cp+B6dF0D5VXbrfnkYrJx48=78p04mccSVQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/2] Add support for the TI BQ25792 battery charger
 (regulator part)
To: Mark Brown <broonie@kernel.org>
Cc: Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 7:10=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 07, 2026 at 05:49:55PM +0400, Alexey Charkov wrote:
>
> > Gentle ping :) This still applies cleanly to -next, so I'd appreciate
> > it if this could be applied.
>
> Please don't send content free pings and please allow a reasonable time
> for review.  People get busy, go on holiday, attend conferences and so
> on so unless there is some reason for urgency (like critical bug fixes)
> please allow at least a couple of weeks for review.  If there have been
> review comments then people may be waiting for those to be addressed.
>
> Sending content free pings adds to the mail volume (if they are seen at
> all) which is often the problem and since they can't be reviewed
> directly if something has gone wrong you'll have to resend the patches
> anyway, so sending again is generally a better approach though there are
> some other maintainers who like them - if in doubt look at how patches
> for the subsystem are normally handled.

Sure, but it has been over a month since the last ping, and several
months since the patches in question were last changed and reviewed.
At least two merge windows have passed since they received your
Reviewed-by, and no additional feedback has surfaced. If it got lost
(as it appeared in this case), I'd rather ping than live with it
falling between the cracks. I didn't mean to get on your nerves.

Best regards,
Alexey

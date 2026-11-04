Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816744;
	b=wmwECpkUKfNqzHqjxbNFa/ksjapoq/waWx+GugLKkHhOrusLi4GaqOh5QJaWlEOhsWOs
	 YvMGEaUZlqdzfCiQPfimHUJkkISiwTSVvZoVlcTt+58qBDhOdPDLPy/ONLqnuvmo5D24b
	 /h16T8abdTlylVqDf+eXBA3U78jTO67SFIsYz3KqDmMlORRvYrErX/sjFe4GW558r0mH4
	 rtfAgGCPMboDhLXgaHF6gLIb10hxaVW/hlBxP+uchLwrJ+dlWjA4J4L6aE9zjlljFuvlB
	 1d9CIeASwCOxSSyLshTJ/wpuU+nrTYiTJJrUe93RVno872g1WJpAjLtfSntwFshcD/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=fptg/GN9hp3PA+p/fi4U4fZU1Oq/WcTwcwO03y32q8c=;
	b=gR6Zg1D+JLFPUm//9GjFMxcIjXV3uHW284u6BFpu2kmUizssFSWwjCDYMy52WwrwADO1
	 zt3IN0a+MjiQ01Ukk9irQFjuqFJMI9tGZt44IJCB6AVgvaQ8pqNbopdEQ+JtXlP3ZxLxg
	 Z/LalS+6/FQXufggTM3jMbS2MuO+5ZbSep/mFZ6kOSeIcZYYef1WKTTch6uuxdwtGQD9P
	 oKqZumwTTuoUvWeUea2tf1qdryxt9fBMQ99mG0SuPkpavPLzsPx4Kc9TvE+OgYWmz8x8n
	 wKz3KA4TfefEJ5GVKrxGCVuaCocOo09Jc0B+BtcZE+G99FztUwpmFylnM6f7cTmH/JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtiBVlUa;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D143606A334
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D143606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RtiBVlUa
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so9360865e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816743; x=1794421543; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fptg/GN9hp3PA+p/fi4U4fZU1Oq/WcTwcwO03y32q8c=;
        b=RtiBVlUapp2BD5jpqUoc2UgPlRWeu3VomA8/dYgkxVkFsxCaggIFbJf0fdGKNeExGB
         F1Pd8Uzs0ds61GnXPpcy547rROKrX2VDLBaQpuvBWU/wevPBG9ym2Azi5miKq2wmpFr9
         XRrTFZtoru0ll4TXBICUTQMX2v/XWTHWgilcmoVyVDBaAPdnBkQn5vweOH9MvKGIKvU0
         c4uBUn2C5P3bZhlrcPmHRpeZLfOZEm0bL9db/MSaivkkNUP+YIetV0KEYo0SXkmDyerA
         Pn9GbEe/cXzsrsqZMeOB/d2pi5LMb9m8eU1G18nBHkk5Em0uEn/+cLdRc1YQ7JXgzSLl
         qedw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816743; x=1794421543;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fptg/GN9hp3PA+p/fi4U4fZU1Oq/WcTwcwO03y32q8c=;
        b=au7oxgZu6sETc+Bx6S4C0fesMw7jIb3aDaTBhuAbwYhzrilOO7wJvmsQxjzpj3dJkw
         fe0A8gvtWKB4dDReZFwl0ZhPsvYyzEED+yNUnSScCFah+NYeszwhIhYd5jB9Z6vfm5gJ
         cPPPRZzt0aHl8xbG9WxMelGF2l7e+hFdGg5c21cm5Y7KZ96MwjQIEALSODWpOQ6OIxEL
         iKSp468bG1FNwuLy3jY2tcIAvrACcSV4+uPz1mSCQCOLa2APDLwA4dYDm3vXEK8QM/9H
         KPsMtVxeYyqfjfiAnBdpL7rtgZYxoOIwBSxCFq0sjjwVozbPgXYwUBXxplNreCa4UItD
         a7gw==
X-Forwarded-Encrypted: i=1; AKwUvBy5MG/hp1E6GLfR9cI7TBaR5uWHIQ4xnr8qFLy/IlrWGbzY12TaW+2bRW+hbQCn1n/rBD0YmMnePO2/BjA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kriuWs1kt1cFRjYkQMBASdmiyNOJEtl5tBE2yjdVPr93X/jcH
	tgaXvMRSxPrefPyO8LqAzbTxIGJoK/egKMeYN+ePdADopbzIM+T6y9E=
X-Gm-Gg: AYBFou221TLcs5sy60lw6AxK0uZwICesEcu2lAuuhyx8Zt6M3POHd8XfuGu0SZZMM61
	3qXM69va30dkL/an3x5j7ajjWvOE/HF52bpBnxbWy2aL8LoQTPX6+4VcKOFbBTAXRJkTmPo/UWE
	L5ZuDOSS0s4EfukqQIrayDI6f70lonnjji/AJJPRaUGpWwSGbbhNWZUllF5NFCmzrKzFYCTlrTo
	mu73M3uAKZ2E5ar/t6lMmiIPh1fb/d8HSpwYWQe1/NPBMzGLZOLAlJ5Zc2fMUaqZ784k2JI9evi
	xbKs9XwV2yRISHW7Qo3F6+Qzco5m1prhJamWasKjn6bjtT2cReAk1SYcQmeQeqmdN6BcnbApAj8
	jpKAQayR+7De1KGBGAeFbqSvmiRS3YK13kfS4auk/p5YQQWtEjaY+B0bmP5dann/7b0uijN2Cqg
	hsCfVt0EjiBtMxGmlTM3TBE/4rtgK4HHkrCwcaNXW9mtn/bg92VIgtqyv+CkCOprxdN6Q+q/jpO
	tRHn/UD6xo1Ox3N1ZhN/hyjxrD9xC+8u5wSWbBff4MF1zQjvUau72cU+GrgWU8zmjjS3xA7G1e1
	q9HK1hOBCisIjwA=
X-Received: by 2002:a05:600c:c87:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4ac186b1a2amr391659435e9.18.1793816742817;
        Wed, 04 Nov 2026 10:25:42 -0800 (PST)
Received: from p183 ([178.172.146.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4533873f0sm68175905e9.4.2026.11.04.10.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:25:42 -0800 (PST)
Date: Wed, 4 Nov 2026 21:25:40 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH RFC 17/38] net: pktgen: reject device names with a '/'
Message-ID: <0233f936-1086-4b57-ab09-b49018e34361@p183>
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

> --- a/net/core/pktgen.c
> +++ b/net/core/pktgen.c
> @@ -3831,6 +3831,10 @@ static int pktgen_add_device(struct pktgen_thread *t, const char *ifname)
> +	/* The name becomes the name of a file in /proc/net/pktgen. */
> +	if (strchr(ifname, '/'))
> +		return -EINVAL;

I posted string_is_vfs_ready() to catch dots as well but it disappeared somewhere:
https://lore.kernel.org/linux-fsdevel/vqeq3ioklrgrf227zgdfho4virh74qrt5reoyptmzgktyronbr@c2mw32pqikft/

	./../alexey

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970771;
	b=apIVIc2Fy0/WS4RRRsLJNEsVh8iXaCY6pPDp5C9shYVtzHaSnNq7ClhM6T/2XM1hCmdj
	 LZmqbYCpgBbYcfxq550fRsMOYFj7eR6hvveDUEo9SemulnOIf7V5Dxv1lAjMXvL2UlhUY
	 vYFrHLkgvMM4OxiPNKuuwqPtEH/pnslVuJ/xoc5wYozK8+/8RPAUV76E/Stzkvd2SoZ8a
	 hlSuKfHfJCGdR0AzPG2yDHCXJXzkzHo3nC13GdjcOqbJysVqq1STc+jinFhXrafs/Oft5
	 oz1ORrs/4NzsN5fPB2B6hBljlt0mJg5qmuGm2Dx/HIi8sLZECD2WFgyLCPY0EMdY8mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nMQFQ8BDOrUT0auvNASy+gGD9i27W8XAjSSZ/gLyZKQ=;
	b=lk4/yREJF3PxtY84SagPcPky0Y/UewbiOgs5+DhY63J4HbudNL6S+PMjFrlfbIvueYfk
	 0zo1B7cojR9Tno28qSV9TADtcD5Tt0zGH2obgig2ybmr2Lw6msGgp+noaP0aLd2I5SD77
	 oTqlh76U9xKQZ3z3Ax9/LryreWv2A9jECpYTEPWLlGTCx9LJW8/N7L6JvBvn4pDsUSdPz
	 rFl1hY6nnnQ69bRASQS9y6zqPuAOEBy6MTItoCzv+CpoO+CYjHFHgSAk8V0sXrHWDvwQS
	 uQ9dudCTbyVzWMMbcKokI3WeA3mZe1zLTCmtaQzBnYhr4mG4p/KOKgxGs41tx6u5f4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNG+uhvQ;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18964606A32D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 13:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18964606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GNG+uhvQ
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae18eb9b69so760740c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793970770; x=1794575570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nMQFQ8BDOrUT0auvNASy+gGD9i27W8XAjSSZ/gLyZKQ=;
        b=GNG+uhvQ8wcnxqxp52uVVeM2YEE85v4wCHqopetRjF5IjXW6mPpKCobkTeIUeE5Sto
         p7OU8K8rt7A2AP7wAL0t6iywwFALw91dHLRyK4Ah7xJhka0QfT5HyVz+DxjfDiTX69+q
         S72rUgXpHMLmS4UNx0QzSMRSVpW53pmajsfIZmK+/1F1rxy2RTjVheDd+rVI3lFK946n
         78naGOo/BEcXEip6czzjX/zjdjhrhcH3ABxO8jafbynrilaSQiCcCunVRMrEwG+dyjO+
         1f/PwPS+20PZpOX4pcA8ugIiGaZifM52JLbv1mcre/rvB2WmZ2gvLJP2UQK4rbhWq5jx
         3qwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793970770; x=1794575570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nMQFQ8BDOrUT0auvNASy+gGD9i27W8XAjSSZ/gLyZKQ=;
        b=tdLsEW0X47mk3ENOcxwQBQtJljTzP37DDlXBrUTUIMX0QQByy57dnhWt3mNr1b+Lzy
         yNNjAdWnhNu0n/DaCZ2VH5ub+iC7mho0vTh+kT09IoMTPdt04m8Y5QDNlG0+e+L6V3AK
         xq1+CDkDu3T5CXkYj/6eXMGuP6H63LleJEFBvYQPgxmwR7fRHGcmy3kkyXziarJ6LsNG
         Q3Bn3hr0efqh67aghoNm4jTWuMXDSbBGuDnO0Ortv/daDuR0rAu5JqSv/GAZu2vQIxrl
         TLBzcZvMhxtRD63hQBSUHfWx9cdlnlv05XPs9FANvAldvUSWcOKIvkqkAzCReQt4cdwL
         NuLQ==
X-Gm-Message-State: APuU4Z9R0IYhOKD50Qpv/qNUE1PQCEWePEM90j5jgvZhEJLhPa1ztgB4
	s+FFjJas5/csWMdvCKjhACvExH9tzSND7AGwRzyzZNOZjxRhTpXqZJ5O
X-Gm-Gg: AYBFou3O6d4jDyPng23HKrcoBjHWUF8/uTJz2iIkMN+VTYjqKIMse+NiF1p/EJ+MZA4
	GHVokylOmbIZR9uyP4XijHM+RMhbntru3mjP/wP5eWZrKdFlOD1fjiyxYXLsNlXAg8fHQn/U1lU
	cnNCJ5QR4k192WR4YL3GmHa2Ax1TTrdo8l3I2BXbwVRlBxZG+DZpocx/JRIQMXxF/Arha/8phxz
	FpwGR1GhZ41ZSBFn8SmvR3cyQKuFzQNic6nSY+ovgrjvPp1gxiXKMFDA6Pz5hpSYD6Glc/A605/
	YZ3B6uejEu2gIjNu1UDPXqEPfgj9grG9/qyTvelSWBv85PglBJjlRI2WkvdhDRc3giiH43IGx3S
	k6xr9lkhO5zhXQ6Q/TNfzoVGbSLLMHTSV6UtI65xn8N6Dljc/uOjJ1zQVqtO0nhACUIK3RvdaSz
	HCpRAiwa2tntOjJs5WacEoKfJKvEVETuRGcDlIwKoZN6h6xNTjuq6jSEerwjUu7p4GsfpEk4Ou3
	OqhNUclOq2fAQrKEp6FLeZgrzdICHg8ve8+iUxulgFnmdGMT5IgnH3QIKXUiJc8kxge5oPcBqlJ
	WO43HDXemRvlNeqfQJM97KeDXFNPJjAvw42R4e5AlgvVvq8+Ey66
X-Received: by 2002:a05:701b:4516:10b0:194:f017:5a01 with SMTP id a92af1059eb24-1b25d35a8c4mr2668276c88.42.1793970769934;
        Fri, 06 Nov 2026 05:12:49 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.186])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4f03f5sm5756052c88.21.2026.11.06.05.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:12:49 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: linear: Check frame count for all channels
Date: Fri,  6 Nov 2026 13:12:18 +0000
Message-ID: <20261106131218.2638-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87qzgyp1dl.wl-tiwai@suse.de>
References: <87qzgyp1dl.wl-tiwai@suse.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Takashi,

Thanks for the clarification.

I understand now. Since the frame count must be identical across all channels, taking 
the minimum is unnecessary. If they ever differ, it indicates an internal inconsistency 
that should be caught with a warning rather than silently adjusting the frame count.

I'll drop this patch.

Thanks for your time and explanation.

Best regards,
Sreeraj

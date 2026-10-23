Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792726156;
	b=nxeFonQVx9XngJrcX+00c53GloNuKZ7U8KV9vCY9LgKDeDGxufJvdW3kGO4NA1ilDDhv
	 HVleMyrkmwxTEwgRfs0Q+O7dmH3KwX5Kt7J7dcYT4Wdn7nR7d6pjOpHX6NhHFZc74fB3L
	 NOqtCQLtmfoA7icHUVV7wc2sSdV45h2CSVAsH57MmUJ1RU2WTQ1i4hg3eiN5rVXugANfw
	 TOKwmCmmAfXsjHfwN5P1OD7tPD1CUJPwRV1ZIhx4rAQj4ivVdk7Bm0XRS9vB99dEXfjLj
	 +HcIUOAnAVt9+dIlVxlCAgE5gbjSZ98Ja8kb7B0Q/C9qGZrAvWzd38aJXbUUFBDKAWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792726156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9uNfDtdkpMmQSCiyYsn9we+cKJrdTwJ3vYkFgm9/S6E=;
	b=1uhgkEWbLBVm6PS+N86I+FUapCM2Oq8yqTpgd4Mem8TziykJrW3DCvqp4mhBPRoogA2/
	 pg6c/cQS9XdBbduhX7gakuqh6dsTCnP+tpyuyFvA2BmRuaeiSGyeWQ1YO/H3mmImkk6Vq
	 sqIl6SLWIC49/suhlJmh+NwutyaKhAKIlLyThLeeZz0Sh/wX1LdbdvZDY6APRIRXjPtaz
	 GGCtlA3nBE72Zl6a10jEEaVf7LuSr8yVj/rOiUBveVzDaqMsH8rw+OXAJukFf+bEA4djI
	 2AjM8Ra/mP69Jm227zTjc6JTDITjGY7gAR3B0Pe/Go0NLJMrVt6y5DdzwRo5TEnTrEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RHWyzEEh;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE73606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:29:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BE73606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RHWyzEEh
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3535a54bed9so774148eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792726155; x=1793330955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uNfDtdkpMmQSCiyYsn9we+cKJrdTwJ3vYkFgm9/S6E=;
        b=RHWyzEEheHXz6R/y+gk0o01HFPAy+REbbvRwPIjcQ/9j6oRYd8N58kVd+iCcZTEeo0
         2Mue+dAGvPPljXezuVqGqRP7q3TJO4N/GhIiMfZjzg5R9BHvnVpxFZD35rKSvOhDYl6y
         pRtVZitdbbo7AsfGakMowKzRF1V9TvAl7Sp08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792726155; x=1793330955;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uNfDtdkpMmQSCiyYsn9we+cKJrdTwJ3vYkFgm9/S6E=;
        b=tVyCtjBz06ynk/1D9B+PTE8iq5x/GOkVVRB8dUGw//dwMqkXu5L5gMQYjpisMApyWE
         Mg7eH5mqP83uj6+S9V/t78dyohqvLPspiiXQz4m86NdLvfb3tO3bpDc8RZFHw0NDNKFF
         sPiLiH80o1Tzg+qcIznnFwYtPZIKjR142xzXtGjgq75damqAkDZyfWxMyckX25UilAzi
         awl7rVd8CxQaBzERYBljD9R1qaWTuhrprvcEn3UdP99URw6aZvVMOma8ur6yQ3x+pyal
         OZrOSclGlPCFwyXGqSpo9YSIalwE/iz4NIOBS2LPTdvpdpO2J/kZmyehtHwgCn9FbK3r
         vcew==
X-Forwarded-Encrypted: i=1; AKwUvBw1sQJgdIgomkLg17KtBCM5Kes8PHINTbyIYOeeUWmZFfCn/zUv4qDKOSZ1fNutJAmpauJZrMk1UG7XoIQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4nFAyZCtrN5jGOmOwG4iuws4K3E+wtOxOt3jf6dvjAlg3F6Bo
	HFaUJTHbXi/yn7Ws7Q6pIMiolp/yOrV2cj05MVJQNcYpwdFG4dkRErE8qj/+tsxAeA==
X-Gm-Gg: AYBFou3xluJ1uRcXPRw13jvNAcwrZ9CtKKvu2YhYDMky7xvChWPFEYv+lX8tWAkl+vv
	9/SWDWHUYHwlYHt+L1UHVPT5fYTEgzcUpEBBUHlAVNvXeBkNudiCl0p7FweipUOBdeQ6yr8tUsF
	pZFHWE5xPKdLeSp4iaXnBhWubCFqu67xbcX9VqbW40R4iZEuIeo8n7UT8IwGByU2gbWcLCzx+Wa
	tmheXxOHxpby9hl+Jej05s6LFrmkqbTAZGZ/YGoEjvhddm/fq/QQWbz9KwRmm1E2PjQIMC8ezUb
	ItbyvYriph+Iuc7IuN/oYlgAiLfc8OmfLPBFmZ2G0rXj85CHt4W8DnpX9i8CbxcjJBwswyTqhWE
	LLqPfOq5QmURcHPw9tpE19wQCbfXqTRchWJIiyISfrO6NIkBULoVrfonwSOFSvHP1fAFKgQu2me
	90CsMZosXOJkMOlAAdd6VT5czORVOgdEgyW5K5D3rp6FhQKqonm2LApOx8PH6mpI+Or63WsGg4R
	exlRH09YUvLSSvtG3dwD8SHzxh8RZ2LN4Hz4gMCwdUJdn8ixv+oSuQZ8KslCtGERdbYwvO74eLn
	OMIOVKIE3buGl4IhMpN1xA==
X-Received: by 2002:a05:7022:150d:b0:195:9228:50a0 with SMTP id a92af1059eb24-195c74c48c2mr1343680c88.42.1792726155374;
        Thu, 22 Oct 2026 20:29:15 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:30e6:10e1:f7d3:a06d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195e5163e7dsm2445013c88.2.2026.10.22.20.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:29:14 -0700 (PDT)
Date: Fri, 23 Oct 2026 12:29:06 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Hillf Danton <hdanton@sina.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Brian Geffon <bgeffon@google.com>, 
	Barry Song <21cnbao@gmail.com>, linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-mm@kvack.org
Subject: Re: [PATCH v6 09/13] zram: split zcomp into separate R/W streams
Message-ID: <atrTd8REbAo-OH5f@google.com>
References: <atlt8YGuSxgRb5uE@google.com>
 <20261022232538.978-1-hdanton@sina.com>
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
In-Reply-To: <20261022232538.978-1-hdanton@sina.com>

On (26/10/23 07:25), Hillf Danton wrote:
[..]
> So the decouple sounds like the half baked croissant, HBC, the
> Eric Dumazet dude sometimes is happy to deliver to lore.

I take it as a compliment.

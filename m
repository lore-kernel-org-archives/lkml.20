Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A30535FB3
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790072617; cv=none; b=jbTsZt8Y7m4eKmhfZsN3dGg2KkFPU4kw51lLxiWIq3tGwI2IEWn4mW6AmntB0foi5ozm4H7TNnLHTyi2Jkrm1TFPWKOtm4r7qAe/jaLIvE5rHDBwUjbRVuFH5ZFY2gMSSewlPZaxMwpjLAAtaeh9oFK3smhZZUj86m/RgTxL8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790072617; c=relaxed/simple;
	bh=pkRjLax3zzL81fegkKWM65x9n1sdWMbtEO8ZJd4dpd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmrUCUYwesT+A3rX9Y9to1jLjgUwsGZOkEF3RndukkEjx6rhYI+quTiZOgtfEB/P4w/def+YLyybsshcfacpWYaP+dfbNm9AAgPgEmrSHq+AWuHkRpa4URSkpjhe3vvEWaiAFIJY+qNNuYBqclow860IlQ3CeiHDQzlOWMqRA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ElMP3diE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OOLKst/s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ElMP3diE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OOLKst/s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790072614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N1CYMfDy8oUHGmL4D9db0zZo1jNjyFLIMfncfNhVlyk=;
	b=ElMP3diEwDDOvNc6zqqzQGboD3XhEmOp89huJmy9PMzbNmMMxYyugoA/n+IV7iMVZNsRbi
	htyLu/dOV6saKR66Jj67JQh9SlyHGPNmyGGYnKk3VZwlATNlquBF/cSza+H7XiQwWxAISU
	02eq5iCDok3dFSI9ZVrAFrvOLhmFO90=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-660-du4qTbR9MsKg9YpMRYnP2Q-1; Tue, 22 Sep 2026 06:23:30 -0400
X-MC-Unique: du4qTbR9MsKg9YpMRYnP2Q-1
X-Mimecast-MFC-AGG-ID: du4qTbR9MsKg9YpMRYnP2Q_1790072610
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49d156c917cso4419455e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790072609; x=1790677409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N1CYMfDy8oUHGmL4D9db0zZo1jNjyFLIMfncfNhVlyk=;
        b=OOLKst/sKdTUgUSr1BL+2Mr91fjyITqW7fi4BuoMLngFw80M5yHtuKK4gsKIzAFs9S
         bi7HmsTLRxx3S25DkqjYy8U3zPfa5vGQRrfYlcdsE+2a5BLKpvQSiIVysqTACWGKG6on
         t7eMlT8ke49aEaM/5IRAOuhpGbYY0OucqzxBYghOzohZHBIDH9vgXgKGvxI9j1Az9Mel
         SzvqW/7c05Dq8iaJAu15SmVGkC0jlmqBetJB2gUpE5zK8xu/u2hb840BmFCZbdsqzKNb
         wcslhjHz5b+XFm/6iy5Dt9tV6LgvCmPzAcWNLomXgxVcXNoVMdneNssKw7MZBu2fi+iO
         5/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790072609; x=1790677409;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1CYMfDy8oUHGmL4D9db0zZo1jNjyFLIMfncfNhVlyk=;
        b=Vjlof4JXyrehHk7zRLSqciMIkDLkfBvWk6Awc/xp2MfiDA3Mq911xZ19cVjhTCmCQn
         KygiFgHQphvO8dHHBD8qHP0HjisplG5+Q56e+IMlR2XnDDBBzAQr5D4rkjvsCalHhqjH
         kRFGUSb273DYPywuClJ961qWayqwHWNa1A4JLLOc6kyuE3QicVmORE60pgjaz8ChFVsr
         UNiT6pqY/d+5tWWTWJ5BKLp0jHEmJexxdtsTt27dLtW/tEzj+6N4JUcxkR7D9U6v3gXK
         7SvgPBUkYXmz4f2sE5uMH1XJfb/tHYZyI0nA5Gy8ic6dyJ5rtNzGyc/y7Z3JOnAokXkR
         i1hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwg14rbHRg2FblRJvDll38jaV6b9lrzI/pRQEfqaxCranBBovDab6d7WWcgQPR+/7LLuOsXFyn2o7ZunZo=@vger.kernel.org
X-Gm-Message-State: AFuF++nn7buTFXvcHssgdZDXDwTHv7xFXSlt7CiL1WFvEB9iTHK4dJEx
	wBteABzX0wRvpdmIk20qHK8D+XoC0gnx1bRIO6s6hJJmbvB1CAl6JzpLlE8n85lIlMXGMrBNxkR
	WTcBT3ic2Al6d60iK8N6KjMVyHEFdFjsWrBS9wS6l/xNcTGBUvqhe1H1zzoYBORcn8Q==
X-Gm-Gg: AYBFou2XC8F22N/MtevaVB+zO2jRxFOI/M1pQdzZROvzM8CiFSM3eSkTW5eYc8hdiEx
	FJObrpevgDscsqEuVwLj1dRMSSyMZitXhUvmICRhHndmVlpoNQI7r2pb11TIGsHbeyh/xc6Y95B
	Fh8bV8wVewy3Ur8RirYF1sXwENlURShNUYdneTche7b/eXfJo6CR7/Cv7hOlRzwQ592QcwYp6Nu
	KilY8d8LUCM+9KQjDkPb8FGVOzUjgeugm+63aoJSwENhhr21vtUW+t876023ePyxLW5lHDv8yi7
	zploxI7mqxpwSy4l4mvx/Wp4BieSmXQkSN8Y00fUjBU9uyZzK9Oh9QGcUg/bmjJb0/QBHHGxt7A
	PftMKMlyeXmfJv85+uygJYbc0tXMhORbalnK4LYAGfGF48P1a46/aSxJXywxI3KBurnE7Iz4Ggg
	==
X-Received: by 2002:a05:600c:34c6:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fd88607e7mr39791335e9.5.1790072609603;
        Tue, 22 Sep 2026 03:23:29 -0700 (PDT)
X-Received: by 2002:a05:600c:34c6:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-49fd88607e7mr39790745e9.5.1790072609134;
        Tue, 22 Sep 2026 03:23:29 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaab0497sm48489045e9.3.2026.09.22.03.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:23:28 -0700 (PDT)
Message-ID: <a5fa376d-0826-4fdc-b99e-cc4a0a623cbc@redhat.com>
Date: Tue, 22 Sep 2026 12:23:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 0/3] net: phy: Add driver for Motorcomm Quad
 2.5GbE phy
To: Kyle Switch <kyle.switch@motor-comm.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, linux@armlinux.org.uk, Frank.Sae@motor-comm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: ming.xu@motor-comm.com, xiaolin.xu@motor-comm.com,
 jianmin.wang@motor-comm.com, jie.han@motor-comm.com
References: <20260917131441.3428554-1-kyle.switch@motor-comm.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260917131441.3428554-1-kyle.switch@motor-comm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 15:14, Kyle Switch wrote:
> changes in v20:
> patch 1: Add phy-mode description in properties in
> 	 motorcomm,yt8824.yaml

At least some of the sashiko comments looks legit and
relevant to me.

Note that the cover letter must carry some brief relevant
description of the overall work.

/P


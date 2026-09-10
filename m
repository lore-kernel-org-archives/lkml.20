Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458BF39A066
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039670; cv=none; b=utHUC669teJUnZYCHbd5ctTKUl8b7i0wiia+P/jz8roL0aKCMQtFQpezsCKo+YOeaJEcLNcPHHswnienjI5uYFjnLKSumGTNfnRSAa2yZqSUNjVQeSjAgdLfEZ9NmKCG+5xiAcfhrE7zGy9E1fEfxueVRDU+Jp29/KRDDpM9glQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039670; c=relaxed/simple;
	bh=4CrwJ5iXW29xR1B9ic/OTu6MoVXyZPeG0uhyIiSglP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j6l5PFbXdH1hbfakttoy0Ep9Ikb2NR1dtAXojj1CldinKNCdt8yOAXRZOhV27OHA87ARjT9LWd+Zlbcxdb3U4UWqvq/s1NH49UKre5xaXo/kXvGrZYDy7PRyvn5z3fSazjNLvO3MDdPmu0/DYU7XK4z5hyEOy3K4JN6q1Y5uyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MJCXj8WS; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=izux76Sz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MJCXj8WS";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="izux76Sz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039667;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+CPMSwBIbKMNx+ykYOgoG6podj5+4wemD8bUPdP/A1E=;
	b=MJCXj8WSkdJOU4kBrcYrtNh5iZ3/9EPbh3m+TCroD/mG+yyEGfIygEBbYNdWdwZsqsNL1g
	rPZFMoica5ikNQ//JfZFbDA3+NHymVCaHZgH1QR+isaMRx3Q5toiDyWIC6AcDKRjYg8+lb
	0x7iBWO4xzMRCSsV4DQnJ/aX8eU3vXY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-PLPAOgLcOsmxpr1maAkCgg-1; Thu, 10 Sep 2026 07:27:46 -0400
X-MC-Unique: PLPAOgLcOsmxpr1maAkCgg-1
X-Mimecast-MFC-AGG-ID: PLPAOgLcOsmxpr1maAkCgg_1789039665
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-495689bfcc8so48108015e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789039665; x=1789644465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CPMSwBIbKMNx+ykYOgoG6podj5+4wemD8bUPdP/A1E=;
        b=izux76SzTENHbSScXgbbMmRTlrqgdhguBEAikDl4vkPnICRo3adFI9u86//LjMm33q
         DKiUX0a55TYWClXDZ1xZ3rn5HDrHwDnBbLxILzJRmRyCe41Wnly7QDEHoiIAQSCrveo1
         mSBH2XtJe+2h3FiSM4n9muKLZYvGTDTwkq3i/ZiXKlLqQav1ebmkfft59OHyIoWpJSSA
         vRb3fQxpdPYOfecic7kB5GG70aAFiDFJR/lINDdLwToB9fSR0+7yZLkRKZEkB74pPhe8
         1XOxviH8qyGzo6MKES0Hf3o/6cJofGZMra1J/Af+23ZQkvpgHlIvKvUsRcxqX4E7Esj1
         pjJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039665; x=1789644465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CPMSwBIbKMNx+ykYOgoG6podj5+4wemD8bUPdP/A1E=;
        b=CGiI+/ksO4fGNjUaJrVdPTW5Plc/esLjiBYyhkZiXcpWggj7bSFUUZDxB6ECuX7qTh
         084csLZTltsJ3i1lcQHWfC2uygzS6bkA+DwMqC8ea7Ajoxc8WMSWui/mzbRz81I7ARWc
         gMo5Qn5bjIoc9eo9BXtRiykJP9MBHCO7VWWL+xUbgidsfG23pyBwvoZV5asMialg5t6K
         K7KeHxGtT/k9GQvCKBIMAG1sqPmyD3P4zPGeByPTWNNaRsXOpwqG8S3McloJT+SuGk2D
         II5zjZU3sJk/kPr7tX4K8WimKZPConz8fm+lT5ifYX/ZWcUdkYtJ92dcDAQ6C+JOh9Lq
         lh6w==
X-Forwarded-Encrypted: i=1; AKwUvBzDNKYrD5QZJU/LdgnBZA0J2LfOGFACayBpJM6vbDmIvIfUgqrEke1up7yLJEuctj4qLED+J4zJr7UgVZs=@vger.kernel.org
X-Gm-Message-State: AFuF++lQj88MUUXPfSpwgTRQHuKWIx1tpall3PwB6tghFMFBcxQn1V1p
	XUetI3yOyUGD0mf45K9bipty+3PhHL0kdCAGpMa/tjFiIH042WJMWbaGr7//XWq0FuLAJwR2Yht
	E28kHTiWEayEy2Gk+0QZGEgDRPxvs7HEeOzjTejMHlPpEy2SNImDfHOCtDMtuErs1vg==
X-Gm-Gg: AYBFou33v6lRsckrrDLJsnbYcYWBfR/USm/EXNKpsWpZHBKAOtjiVXlfNIcCjNfR48L
	wVEy9X8uB7vQxoTLbfEqFl+2n6w9AoktSOiqqVsfdjZnS8IBnJ9tAIzFozFX25n5szL8JucKVZZ
	lRjou3BO54Vs/vPpj0ETqAbMjdruUv1O7ZkD50aD+PQb50oIlnpHEe3oDbSfdP+KaiDJXZpVQgu
	TMJwtutbi6KSO5GB9xbrpoxkeDGu2k+NNsVhfO9+DRX77hnQ/0HGjcgbZstRhDSUUQ0JQIr4D0Q
	ueenP0hLthSQqv48j2GtAUmbDuMb0RZkUXvULeU+Lr5wHxgDwxLgCJ1J9quz+LIwhopGN5tP08q
	tZ6GwgrAqOqZl2omiU3rVkHJUI6gkOqSL+CzD0y0v6TUMXPbfk6rvc1GApF62wRm53TK2GUsjFQ
	==
X-Received: by 2002:a05:600c:1385:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49d258d85c0mr59112785e9.8.1789039665434;
        Thu, 10 Sep 2026 04:27:45 -0700 (PDT)
X-Received: by 2002:a05:600c:1385:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49d258d85c0mr59112385e9.8.1789039665038;
        Thu, 10 Sep 2026 04:27:45 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm53665292f8f.10.2026.09.10.04.27.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 04:27:44 -0700 (PDT)
Message-ID: <013fffd2-6d59-4e99-8214-1377b1cb46bb@redhat.com>
Date: Thu, 10 Sep 2026 13:27:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 3/3] w5100: detect carrier state using link
 status bit and optional interrupt
To: arthur@marmottus.net
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 arnd@arndb.de, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20260904-wiznet-link-gpio-v7-3-69f01b70c96f@marmottus.net>
 <178895754151.219967.10801079239966954315@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <178895754151.219967.10801079239966954315@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/9/26 2:39 PM, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider:
> 
> Critical: 0 · High: 1 · Medium: 2 · Low: 1
> 
> - [High] On w5500 the carrier state is now sampled exactly once per ifup
>   (and once per resume) from PHYCFGR, with no polling fallback and no…

I read this one as 'with a bad config/devtree the eth could non functional'
which does look a big deal to me...

> - [Medium] `w5500_get_phycfgr_lnk()` returns a tri-state value (<0 on
>   SPI/register read error, 0 link down, 1 link up), and its consumers…
> - [Medium] The carrier state is computed and published by two
>   unsynchronized contexts.

... but the above 2 looks relevant to me. Note that ordering the irq
enabling and initial link detection is not enough, you need explicit
synchronization.

Finally please note commit c82ff94592fb68f529afe63ca7f5ddb7dae4ba83, you
should explicitly handle sashiko's comments.

/P


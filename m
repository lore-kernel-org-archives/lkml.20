Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794280670;
	b=H7TrVdSsoba5wxVgQB86Sb5pXTkcTPdIt66uh5jv8kmqqsmi5HoNIdGye5gCTUIMcY+C
	 Fpl2kKEFsZo/t8hG5AVzUDs5lwWHFnpFUXTzDu9YcpcUnIGrqe4a00plWd/4Qnjol4l52
	 bAwkVgcv+KEpn13N54X0Pj8bf87cInluh1YeEX7RBd9jOYqKnlj/ZYnVWOQuaKozRNMR5
	 HUeIfjVNBey8xJeMT7wnWNvdEU8L1D2nxf6horUpaeDGZdHVG+zIcCFzK+bIaPJDqm/Gx
	 yWHxyFFCvUuRuWN8OKKK4MIDSPyzrofkXZY4vTCDm21TXEb1d7gbBcAy5Px4Qtml7Rw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=DY0x3Q1cjK/pWVa6jRiEqiywRACTTD4vdqT0Fn0+Enw=;
	b=5Se3d1B52vwbEv9D1NUmQIdBpLw00KjMrTL7962+mH1yuJD7JBbqs2sw2qxqG0wcMOpZ
	 VWsvLJGKbKA4kabryKbBaWm8lgMN6PVfYJw0u3P7rTZU1NqH40xGMEINBEmHaHOIEQkt3
	 sfYwx0/a2rqqWCe8cfJf85IAeXnj5pyTsTYrZr9UzBHLNSmhS3SJPjYmge+kMQjfhIj+c
	 pk6b4nQ1LEa0m1QXEXDxTKVqAs/0g72EH6kTP/lH5Wf/7iWAyG2t0bPGhaHxj5vC+PZ8Y
	 SKRKbdDFOifrlCjKiaC37dBV9up6n+pc8pa9rQqmu6jYe+z9/U7dphrWvw7TSUmHXuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shopee.com;
	spf=pass smtp.mailfrom=shopee.com;
	dkim=pass header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=hwlug512;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE74606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBE74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=hwlug512
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so2653933c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:17:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794280669; cv=none;
        d=google.com; s=arc-20260327;
        b=HZBRVMz2PXIBc9c2kcQn4HMKW2rBHA7x+7kQkITKMlVkwM7DiKQZQ201gZjAoNAqIL
         S1g3tkdQqOgtl2pH6FDVZQpMFRx9grfbp+NOs6Rp/ucQxW+aCMOcsB2MsuE+BsI5R09c
         xjUMt8bEoW3jQLIvmzOTDBYx7G54TnrLZwsiyrCMUH0eVuEBQNxo9b22ah36/o394Wai
         6xYLtvRu2Y5xwo7kWsOSbzCZhU3Mzm+IrXt7+Dy1a+GsJnceF7hetkiZam7tp86VlJNW
         IkGbcOs/VUQLDO2vSRL/u+G08A7ktKt7L/oH13Y7OHf33L73cd8dE2YxyRaYQ11cr8BO
         P0xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DY0x3Q1cjK/pWVa6jRiEqiywRACTTD4vdqT0Fn0+Enw=;
        fh=WPa8wiB93CjUktaNLIj0/nEXBmiaIUlE3RX3ySr+dSU=;
        b=dNqcOdZmKNxYarUCDEjqs8LM10gisuaQ+aeVF1u0QpxUdbDwt4c2AtYW3XKtFYdeNO
         ARWUBwP8BTWzbLCmMxMgfT5d9dQj5+SAycq11pdBwSjR9H0eGX//tIAG99HR0Wx+VJsq
         dky6YmPkQyVaEX7tzByg8vSJjf/+SnGs2WOSVVf6BOtGuL5V/Ze3XNyy2XSM5Xgl+0H7
         OBiEf80Q0Uf8sfVZVF8SpA4VQIswmORaHy28ffCa1h7/5nIECHc+TdPvz2LFkJ3t5DAp
         /6gMQcwAUPH/UFtpQQIzFOPyGNOtSWD6AhtsaYYKOc/9p5dgWpl4bs35BIherSVejge8
         4O9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1794280669; x=1794885469; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DY0x3Q1cjK/pWVa6jRiEqiywRACTTD4vdqT0Fn0+Enw=;
        b=hwlug512V39UWgIVYDbscunUdwqURuICey4XvY9cv88MfiYJvReTic8ckU6JXkFkW0
         g7/neGwr64k839thdRs8UeSl9YqoUUZFeXbdgSRAIcv/Nc2mywiiXl0LChpB57CUgZ+2
         fDm1fidkpT71sT3l60g/AymXCuEUOU0GajDy1liKm+vjNIkumZaIUT1V//iJdqB+RuOJ
         RE+tQXoXPcEnobPPSf97earNMYkvYuGcM0vUJzhCmI9vBi92ux45vTOOTwVniLBdF1hx
         E08YJ+ZT3vNt0leyflv4msiFLP3WE3qUKpMYgowwmY8RhvYiMmx7/M84fxAhmh9otnxJ
         7FyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280669; x=1794885469;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DY0x3Q1cjK/pWVa6jRiEqiywRACTTD4vdqT0Fn0+Enw=;
        b=lKT1mxX6vVXTZPTzOBZdkIApL/gFZ7WJlQQqHg5Rdw/5498LEHZThX4kBM+pMiOMua
         CbWxxbamgbFPRmt2D8zMhjPbfYMOJUBuoxyHAs8D2VEQHLUW5xoGiLbJ1UTjM07kEHgM
         V7dUpi06khoQDbky8l+HLq9eXc/GzTb+c7aa8cFlR1WG7jtMI73vU2IYQSWB2v60jvm1
         oRWSN4T8WOD0ZzjBWe374ExMQd6yJuyyjmX+VKoDfrp4ew21BRIuw9McYuu/nwBuELel
         qA1EyTvQzYiyYJ+oomZVm2DufuerBZsGIiFioOJHSUGgnsieJu55ieFzn4iLFN/0prCo
         ZVRA==
X-Forwarded-Encrypted: i=1; AL+hErEYt24DeAQcZVH3tctOxZ+1AFcqXor5uN6DIRsQCysWz+QfTkUNzStt5ajIC2oVbhvN1znfQea4xCx3Ae4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xsS+2uTVsmf8VMcL208lWv9JuKIx/X+Icl1sw3shdUoZKBG1i
	vsK0C4pYtZxY0vBqPBzJ9vxLDu0snaJAakY76xtyzMe77BMBJF/dAMuZ6o7+gD5NsyYM3lq+wqB
	LKSM8pPZ63msh02lZ/JSZ2CvEHfcMZg1c9WXQ4JeXUA==
X-Gm-Gg: AYBFou298j++TKbfAwfbsFv+LdDGMA+kHnhtZSeB7TosQNkIztqEQZf7GO3Yx2hzlco
	+DH6M2eK4sa9bIXbn3iVotVP7nvGk0WnNlaKMCVhXzj/wkng+pqwZDa8Dg7IEIE/6P+apLOBhhH
	8YWf93jiWqSlARZVOEPbU3P1u7uIlf4z548Km3Jgh4rgp1tYfqaOtg/nf/ZSasnkyl1kglDPcra
	ow3l6DauIo7Jsh5CXn6Z+5PZyb+1kv1l4ABx906mUsa3nma24vWb+oaAg4UklMhPBzOLl8EzHze
	zBEaXI+2fQMc3TsYCy87vz3K1gsTDtPe8X12vsEIaMvCfOQXiWFNBsOaUki7zx/i5vH7BtQdQ4M
	6mjQLEFdqfnDdWlyUjPdZOGkkCwv1sCizqSsKIA==
X-Received: by 2002:a05:701b:450c:10b0:149:49c:233 with SMTP id
 a92af1059eb24-1b3b603e878mr1944541c88.27.1794280668922; Mon, 09 Nov 2026
 19:17:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260911032905.63683-1-mingyu.he@shopee.com> <aqRXqcynCx88D2QK@linux.dev>
 <CAAoBcuS=sqOAPFr9Gda9aTwuCMHMPzBMEee8qvPNHtNxrRWKuw@mail.gmail.com>
 <asy_L2s1TNcN7bOK@linux.dev> <CAAoBcuS5VJwsYyw9=77SaBUf3N1hL8NfRtGwpBhmyUUhT4+T8w@mail.gmail.com>
In-Reply-To: <CAAoBcuS5VJwsYyw9=77SaBUf3N1hL8NfRtGwpBhmyUUhT4+T8w@mail.gmail.com>
From: Mingyu He <mingyu.he@shopee.com>
Date: Tue, 10 Nov 2026 11:17:37 +0800
X-Gm-Features: AclHuK8HAaIrM0LQouKy4b9klf3zI6EsjDz59qge6Fr9-5V5H_IdiVz2kr1PIPU
Message-ID: <CAAoBcuRfhFf4p5qfWZnNs5=4foeE6jtGFggG5XHmMi6cXwje9w@mail.gmail.com>
Subject: Re: [PATCH] memcg: keep propagating stats updates to ancestors
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	littleswimmingwhale@gmail.com
Content-Type: text/plain; charset="UTF-8"

hi, gently pin this email.

Thanks!

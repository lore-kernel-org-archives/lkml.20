Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF9A2264AB
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 06:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792218334; cv=pass; b=nhck0V25dIaLey8/sWbOVCW8iGMk5vj8h43lgQ+e5ayqsxnwUT2gqwE1Usfis/sqJDZlBVwb7/N7jhF+uImvMc7Ju+Ws6zeKhKIGm6hFNVHtis+t6sRQMLYhIKEQQi+bP/bwfCFvTOP+7OWcCjmN0Wws+2ZiWHYK9HRSGq7pAtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792218334; c=relaxed/simple;
	bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o4+RU3rZLi4T3AkEI4WZecjynghvLcJnHsWGTKsxjFlq+P7wctX8wYpQFVyrsbWGa7ZgLz4BQ3Ox9GkhEi3omz2zuPqRUH8Cot6ztLEQVwutQoOfARcO0kF7dSvOXGjs8H274XbRNsBTi1NjbyXT3DLPn2U9m9oQbsG8ZpkjOuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APrfs2YB; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APrfs2YB"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6774639a8a4so519067d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 23:25:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792218332; cv=none;
        d=google.com; s=arc-20260327;
        b=ANTxTVoo3GE4y5qu+Sk/QwEXzC2Kp15t4k9vX7dZlkYy8IJpMaq3cuh7aMtFKgOTWH
         6M+bJCZZSedz9Y7nAmlpV5xV/fsMPdJ6CdCb+CyPgGsPSMP9ynS8m5pwo6dUZ40+VlVl
         BnpTOW0cbabmXr00vUdEFYgMAKbNcwU75BLMm64bmZ0kUe8YUSvcAEULQql8K6HJVsJ4
         aOKByaT2zp/6X4jmfghS32KMHRfh+z75Y93veTVINMbx/eNk5xQP7iJU/M8JVrx1hJvy
         xxVylwAAQmaD5MUwrdeQVId0REhU1NGlI6xweymQXwnlYwd4CqK16FgYF7SARtHOnGzD
         fXbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        fh=xhzOmPQ4SKrFIVvWtJbwPo6kdmne5X5SdCXOJBKLdkc=;
        b=jdyeRjQ5Mf9QgqHh1Hb3t123LTvtKSBiYRmOpT9LcxlZpEF9tICsnb4z9yGwJ1OEDf
         e8AHvU562bJb/jRP8D4JzWJX2RAVOh1C7q0+OtcgTFaS61IeJJVW46MnYvjDWRZMq8rs
         Hnok0AwAnCGf8Igr1mTvv/rmyo5T8v2SHdzedAiXqCvEW/roGSst1VK6+k2yUqr0jq4p
         NqXVMqIixZWvPWDLplER9oGmodyE7PxyhylponzjD7gnE4fIZtPOLawbYsfLsHyj3eY/
         s7TmmlO7d9sMwhkCNKTADHgzOWmkdT0fCRBrLNdqm/DUewwScePkWCh5ir/UpIUKjrI3
         w3gw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792218332; x=1792823132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        b=APrfs2YBDFHGJtPhqgMs0AiPP3svRWUO/jQoDuHxksXf2dphKg2ql9PZaW/wYWHaMC
         C72v/g7e3oqUeH3S8wGCIPAQE2WZa9IFB9eqejY2BV49oLnwA7PQhNsb/IUY52AfbmfV
         dHQYCYT05+ivErla0Sr3Yvpk9lTknw3IpMmTIyXwkCcknieHuzdDC/yYSesm3YwRNfTQ
         cw7t/scBWjh6xGsNPu0xu/cFZDY4IV5i/rQirWWpz3aTLMbbWgVVLyv4X5Wi9hGQUVXc
         ixFIs56Nt0Tyus9pxL5bFVtWzdfW83X41sxH5vsMoWrPgALTA61OTTD1tBJyQZx0dkmN
         6LBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792218332; x=1792823132;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zzt0c8oiWWB+D7Y6FEX6FbwGZj4gKt8+25GcQYnqFgU=;
        b=VIiMLlMR83ooJryjk6n8PRzbzmmzxiqGXYBbzKJkpF0D9hYH+S8IcpjjCDTxm0ZYSN
         csxjcbLLkfTPPD1DZHN5cYjIXMaYPqu3bY2kt70udrmI6Fmnj8XnaTQlecxmQTYoO48c
         l+gPWeJVlzHrJ9FbokQXSng18qYw0r+ryrHcb4FSzfPgAU5CJAVATGi8zLMKuX15rNqu
         3gjP3p0Df/JdxCimB/7zIQzbBaLnY2+V3Y3S7jJ3XbesNkpD40gsMeXHd/eNatIlNAuZ
         JTn2Cmfw0ssbfmiskHA5KAxT2fECrwc65BGyO6SAtv9fl4cvjiYIRoR8j3ar09uQZ01p
         FLGw==
X-Forwarded-Encrypted: i=1; AKwUvBwD5WsadqWtyz8P0QcM0xTl+7bdcbmijER6qfGFT4YjshY341tMVGjwZGQ8aXpgCzXKK9N9TbvpFFA3TBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9A3WRya8CwfZK4mpTT1v7uc/8gflL+vulCqvE7dX3oJPXG1YM
	QVirrkSTTDBpYSiw0AxInsrMXC85ws36faKsZkgs84G50ZTjMScWt2pmXJU1a1ZE7tL+kjmGim6
	YS+Xari1TmwZonM3ZNN6ih4yPHVWEiWg=
X-Gm-Gg: AYBFou3rBcsIPghhEK4kYG5oiC07JhMUr4Mb/fD/8BiSA3AGMkfvm/3QQhok+BIzChZ
	svH0rLGE8hedG+2JWTenQ8nm8eDHQQi2Zoatc+VKKC9+lVBwkAoLCnoxKAUbXCEoIFj6qck6x1d
	65WMr++oIjPlSok3LVmKuXkTVvyc8jwmK45+ldXL/QAuomPWsICypbv2jWo1OZwTiZqzV7vVbWR
	H77KnwWZ+JClntAd4mIujAMgXkDQBw1eVmniijhPt/gm1KifMwhrFS6QXcGnE8MCRxya4uZBgjS
	KJlpKJPfMt+BjmHsolM5VoiAbSzL/jtI5D0odxCLrNdMQjC3zprLHhg=
X-Received: by 2002:a05:690e:138e:b0:66e:5e37:2ff2 with SMTP id
 956f58d0204a3-679ca4d20b2mr429681d50.4.1792218331819; Fri, 16 Oct 2026
 23:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016090930.947830-1-wyibo6109@gmail.com> <57d28e27-459d-4d58-b6ea-78739936d152@ixit.cz>
 <CALQ9cS49UzOPA8PUh8Yf55+D5oim=9YRF9iHw0Hi0sXuZFDTVw@mail.gmail.com> <2abeac6e-226e-4fcb-aa6e-e0f89af27251@ixit.cz>
In-Reply-To: <2abeac6e-226e-4fcb-aa6e-e0f89af27251@ixit.cz>
From: Yibo Wang <wyibo6109@gmail.com>
Date: Sat, 17 Oct 2026 01:25:20 -0500
X-Gm-Features: AclHuK-mqUDVbuqHQaakUsbtYRPEG8APrmj9DlSeAzxy8wzOvvdrEuT53g8Ab34
Message-ID: <CALQ9cS6GYe_hYq7_iuQb4xe8Qtxu_xAzGKWUgncvObGL0NAcCA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: dongwoon,dw9719: Document DW9714VA
To: David Heidelberg <david@ixit.cz>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. I agree it's mostly documentation, but I won't send a v2 yet:
the same chip id shows different behavior across revisions, so I need
silkscreen/firmware confirmation of the exact chip name and rev before
updating the binding. I don't want to upstream unverified hardware
wording. I'd rather send a correct v2 once the rev is confirmed.

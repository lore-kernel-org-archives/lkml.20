Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D7A4DA9CF
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843156; cv=none; b=cogWkvsl9ZUjRK3FuqPOqjE0ZYbONIOswbE8R1LZCcTWWkuGarWwMEiFyFj9eUcHA5QwRD0Axm4qnjIEbePouwMhErnEzbkQ/uPweAZKrVQR6cw70VBlVIcUvtS0IpIZwdvUoUCTxreOzsnDneXfw+FxMMMzzqZHqtZglXGVqUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843156; c=relaxed/simple;
	bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLvmWLnL+yyjgA8bskk8xpc2xvxD5BidZwsHAoosBg/12jJerYm2ugWtQ7zYHy6+hc71PS+5CW2tCV0TX2xh+lRilo4vp/iWxqt0UN/B2qnRbJtJkuCjKLOrMX3dhQp8kD588nZE0TA3UoUwn6CkNBSHuADDD9vQJ6LVCEHd0BA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4zxn7b6; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4zxn7b6"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so50134635e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843151; x=1791447951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=N4zxn7b6ik3XZmkw0SNQddw/ORdwIJ0lW7RMg+a9b4//ogbCekk04Ppcka/zq0l7ry
         SCCc89efjQSuIjf7kSuVZaYDgktyCC3PPMy2JKAaqS49//0JubDdKqZu++3Nf+PP3ZpT
         D1CEKJ8OD6DCr/RKuwtxsFHhFdO2bUWvYgDxYzoE9w1tNdyOC91lfkoVSiWtVSeI4Xya
         LyWzG/uuxw1OJ+yjQE7cEhAO5zCWBKXzQRWr3AgLwAxNJ86bk0+pD+ykQOkH0mnbdhvS
         Ew+44tw3+1+KR1ZPPZ7fCGLKv0ljj2lg8c7eMYm8DmP6M3/FkPm+EWTwiB1JjMdUKrMd
         Z67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843151; x=1791447951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W0Zrat5nw9wyDAslGsAewf6QugMnqYJ61MC6tpHasAY=;
        b=eqNs3pAF12jaabJ4huV610cKvinuSrlWXU10d8K2YLqRG8DAhiWPEvjAFJr7cU4wOd
         QbuWsbA+0WJzrvj8lllb6LSS2w+uL+Pr6MKGpylxOF57IsL5P1JPpgcSVW3atbdkADuJ
         grW/6uBXIQiKYRD4gMH47boePgS9/N4H9HeNhwLuC/xVKxuwnzbQ2CxixNmpv9aQM0/m
         9xzPaE8VfPwYcRdeBnGnBl3AIJNU8ZJWLBNQ69DE5xDY9aoUuPgTvR6fyIaVo/CZi3jW
         /KmYAdTIcNWH4Xtv4aTBcAQ+xr9/2ImuWkE7mbscjnllTkCT8U9l7WcHbtD06AtrYuHA
         sYOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzm/wUeVUS9khHctRaCxnUDhS7swWPROJnwoj74RdTtTPxSyMYsCCB1yyHJbik9GOkq+oTI+0sOZnUrTBU=@vger.kernel.org
X-Gm-Message-State: AFuF++l7wGiePvwVNIUYaOtDbBqNX4iNn227dWIaYSn+kLEWpTq0vJBT
	PchHH/AQ8pZqFv6J5Mybfrc0P0dcNjuNSIZ08+hN8sBMitFWY4kigD+b
X-Gm-Gg: AYBFou38kEepEMw9/QvFBylbLEv7xwj3bKDiIn/l8QSJztvXx0uZMoiJk9zgaeU28n1
	Sty9fibbtDqFgtEGStsZXu8CgWMsJAMvfT1jzdYANm6tBP0MBvQz32DG14WM16G6VmHPdw14qoz
	l4bn+McKLDckV5MsXkh3QIUofnqNAZrcz9hnoBUX1jfr53qz+2S0FmrlkqgOq445sjmSMPJKuhb
	8tagLHnTtdeumjmq5+foxF4nZwKbgHM3ELapJUogPvyCKbvLzdIfEO/IpTNqz6TT2zoSK1OPXNh
	Geqall30AIO52cm7jxm7PmBqj6inrS8ZYrlLD6EMH6KVUHzHcIHWYhSxqLOquDGxfXWKmHVpNLx
	2zpaF4eWoYVW++RG/rDPLNCMu2o+Anl4fJdYmD0X1wB3k/0ONANdo3vyjmL9WdYT1dZ7YfF0w1R
	YscczyIe25f0dNPzFd7yy4UnBBBGiRmpwx4SKF4yFG+GdVv9aHsKac2JA3oWz1u2Hr2XRX2Yw7Z
	90P1BJYT7ZJ4beZq9xYjBrbLYmCi96F14QYQCJNsxMaKHCrzo8LWk4g4TfJLP8T2y5f1AlY8g==
X-Received: by 2002:a05:600c:a45:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-4a01afde48emr58311595e9.15.1790843151361;
        Thu, 01 Oct 2026 01:25:51 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f947898sm54455885e9.10.2026.10.01.01.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:25:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 10:25:49 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/4] arm64: dts: freescale: Add Verdin iMX8M Plus overlays
Message-ID: <rq5ndq2sqsyoqwhnbdy34etudy4xevdqpm7imgd65uu6gy55nj@wpt6jrgnq2vp>
References: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-verdin-imx8mp-non-camera-overlays-ready-v1-0-ca0c63c2994f@toradex.com>

Hi Frank,

Is there anything blocking this series from being picked up?

Thank you and kind regards,
Ernest

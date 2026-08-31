Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF0244606A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199886; cv=none; b=aOc8z4PsUi0gbd/KYuXy72porQeCqQfEKtxHh8n4oU3DOrhI3IX9pMQqbpfge4LaBhjdNn0OCs32xhPVhGKYM3+HEesIELlRyOCMIkhC19JT66oYk9LdHw3ImASFLuh6I1o7y151GXWABVj8hdLpW1MjacDyD7wB2yLiX/dAClw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199886; c=relaxed/simple;
	bh=//yqev/fe+TJRoxB9jobDnK5NwPcao96GrYOBYekoR8=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rqkTS7zZVhO1gRbigrH5ly9cerUxDNexsdwuVJHy7imxEZ2/EatIiMGdOG/bbvSkQ3tetn6sbctD9WuNJe6yRjx7F4y0PZYStS/Qmo9WYlIVK0lp0Q+13lv4miqNNZgIkPA8Gy82BTQZZ0cjYIvg6JOAKeXgBuo1KTm8hNUiRGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nvV9o3Rp; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="nvV9o3Rp"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39266382df6so3212089a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199883; x=1788804683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0OemJiih1sslqSbQP4J3cbLzB8Lyd73Gg/1M0pWEdtY=;
        b=nvV9o3Rp9TMITZ2+7P5/845axrYh7W5Yz3UxlNX+0lcxuHdrU/xZllck1FpjLHCwvH
         r/68F45q/Fh1Ya4BbApn9TYQ3E/d4RqGvtTQmV4eU92orZGhtPyU/rDg9c9yE3UtLg/C
         BlhT5BH9UaCWTQ2gb2FzCJo1sPwxBx/K8QpS7LspDjtiwMP/1JC5BQaaEhD3Pl3gzu3N
         xn1SHD578jK7BodfJDBteLY7onvvZIe6zL+sRCI8rLiZqDVLgW97F1ylOr1anAmtE5f5
         aouknvh9ZUHux2Uk9FaAcvC1TsAIJXwRgrZReuBEVOsCQGrzwsCD+iSuVClxESqeXOHs
         7BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199883; x=1788804683;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0OemJiih1sslqSbQP4J3cbLzB8Lyd73Gg/1M0pWEdtY=;
        b=O7eHnh9HlaBqukE7V/IOuc/yRUpP9Ujj7eBQiwhJsEZFGIdzNk55I27P+KV0FjMowq
         qioH57ck+cEtD6w+DMrF1YGoWe5HXlQFcM+u8ZT77ojOtCL0OmeWvegj0o4EoG+MmEf3
         6OV5huuj60FM7jAFNCX+vf3kCn3F9Xw7gTgQF0HTFnZsgHCV3VaPdfXTGUq6ebydfdd+
         cQ31dWhNu1KtdgFp4y5CnJLHlU1R4oye8QxdYD8uDfLl8JygyCfSPtEgJXn0Mw2pZF6W
         fkrm+5N0Rh7sKclsdKPQ4nNWPFjvx6nN0ePNBhSZ2UB97hce7Fn9EzJTavji/OpDUBZQ
         16/g==
X-Forwarded-Encrypted: i=1; AKwUvByXrqE9JOrAcgBMovRhTVWqJ9McxY/QjBWhQ0I6grxDfpfknnUvYHFQ92OVkb0sHaAi6mW9AyBUsJVyGGA=@vger.kernel.org
X-Gm-Message-State: AFuF++k7OROsc6D5TeqXJ/ADBFSigs38rdI4vI/+uuH73aiKavGvAd9E
	x9n1QoFTyE4U8KyTJ9/ZgmuWFUBnTuvICU/97N0mkaVPEv1UW48knBaLw4zks1mCCSNg5rw8YVS
	xLAgt7Ko=
X-Gm-Gg: AYBFou31kxMbMzFtqXXijO5L4hiyv/cDFUDRBxkAh5GMVCOrUkobNQUCx7FEjDcLdrP
	7c86XkfirZQW7dfqCOXSMS32u2EaGyyZYsOkXAHUx2agWSoRROuyQOIO/dx6Qqv1kWSEn3aPtOl
	b1Gn6q4u2x8xpsrXPtf5VgQb40HhqHxOEL0rWFX+/BI40Nh+1z1kND7vTQB1Ujdpn0GTychb5QW
	pWB6xbxdGvcm+zBxbBRCQ1x2xmpWbwAubnJPsaQ+gJg+wklaz4UkMAQf8SBOKeWFtInKV3PhciY
	TykM7mKGj+og2YqWIHBmPapCDL6X++PDvqVBnQG4MYjMoRhq1iKOVhx1n0p5bYsX3gajtXLv4qH
	onAK16rS93Xe179lX57Sq47ngJJMRP/mb7J1XLPh7h9ejfTONITF/l55v+ESyx4Cfox5tptRvO+
	065PoAAyh7b3hijhBiEn0aYZ5kjiPpvBhuh35QKcpWZq/1i5LGiuhfqHMgDA==
X-Received: by 2002:a17:90b:4a02:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39907ab0960mr2402339a91.2.1788199883302;
        Mon, 31 Aug 2026 11:11:23 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-398a2f5187fsm5504006a91.1.2026.08.31.11.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Enric Balletbo i Serra <eballetbo@gmail.com>, 
 Javier Martinez Canillas <javier@dowhile0.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829194003.107677-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194003.107677-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] ARM: dts: ti: omap: Replace spaces indentation with
 tabs
Message-Id: <178819988246.2869653.4070159664676583942.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:22 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Sat, 29 Aug 2026 21:40:04 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied, thanks!

[1/1] ARM: dts: ti: omap: Replace spaces indentation with tabs
      commit: 973ca75604c81c985224624f685f0365e1ba78bb

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


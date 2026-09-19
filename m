Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC75DBA3D
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 17:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789840684; cv=none; b=Ueln7qrcprx7zFUuGbKfDA36mE/e8B5rkFMRmtTVli+dbiJA3tZ5v1hcmpdfkxYdPwVP3qJFVqQvp1LugYvKf8D7zPfaFgX0pH6b1gSXyVccbL2kDyxTh7oShs0eYYVgNAxM13kltiCwx7KRZKwczVFTwH4J/2CJdr4dUVKquaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789840684; c=relaxed/simple;
	bh=gkrM5v8Z8AFSCzWEhhTbEQrjNi9vxs7OrnpaOK7S1R8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4UurJwzTXtrvVbKRSHtwrYMG8jfbPWsept/3B3sk+36khEts0Ve7Rut6v8IHqs098Yf8kUppRh5ONp0UL0AtOXrNUE32FbmQdkFkU8sgphbgVP5JPVn4wW1NZ2f1bsrV+YZzN9bIxeW/QIGXVl59HM014smwUFaOgcuRO1eyPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SCqdOYnS; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SCqdOYnS"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e8185e037so9645905e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 10:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789840681; x=1790445481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jzCui5c9sCMeQVnJ/YLx7hFSrD4TPszAJb/z1w6QkdI=;
        b=SCqdOYnSf6EKB4Nc1m3jE0+H+J1DfBg/lSyn7n0NL9fpgyJ0lc3SeJdBDn3mBUhNxe
         kW9+DY0ZpeZcV5etU6EFWF6004dnjZcn+nTqsOr0qNd07AbCEOX5NTG+KH2cMDneLRgM
         2P5cEj8BJgVJjnMA239x8h8s0qbzeLX5L4AWEbzHyGSOytxmHI7JbAYc+QlOLA6VBiJf
         ALi/fBvArh2mlIVA9sU3eIGSJBtOC/T6af76xjuVESdtaC7vStr1y7qm0XAImr/LT1so
         tr4Jx2XecZZK2+nW2kq1dG1bAaayNY1U4aNpf9UafIjUdARcsRz0cIJcqlUM4ZdoC70l
         A6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789840681; x=1790445481;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jzCui5c9sCMeQVnJ/YLx7hFSrD4TPszAJb/z1w6QkdI=;
        b=ckwU9VJ6oV7wtwo5sQJ+8X4r7XZgGXQ2nHh0uyQxVE0KquubPDdNH9GF+pirk5fbxZ
         KT3pN1w+dOtdo2eamM2Y/qroKZDh/kQYXTEjCkqygocEGbTh8JhLO37xsv0jNiCURrKX
         FRO6tg9JPP6vGtZBeIlj7cjH1E3eaZQJQLHTpG1Dy+9c2IKLqWRMIqQuI3Yozg+UXSY6
         9MUB2PjmJYysF8c1/wqpiVK31ZMEj8UyWvmVtGRY2gsCySZr4e87QU/KnDjMpXnzRtQQ
         7wnLGz5achvK/7ZUvmmz7EA5kTaFjORJbBTmrClBy/YfgvYFiVviBtIuk+8tpHM1s1Pn
         ex6w==
X-Forwarded-Encrypted: i=1; AKwUvBxXl8GKe73YKOr3tEc1Waqia+2/QPornPudhXSM5YnkpCc4qZ0DGW3R8ehEMnDTV4DO2hUS5IqW2fRGuC0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+VmNHSyitnmJf5cvUel9skV4XPcgsQE3/WtljDhZrpN8a3Pu3
	YJql2ig+Kjdpf7tLTpQMkAocHSFj0C/nzZ0SoRYaF5fJAZDyqxDA3Zhh
X-Gm-Gg: AYBFou190u7zgRbn3+aB+YMt0L794EwdCd7LFm1xEegM3tGfpGVTHYuVnfvG7/a6y+U
	jKJWwOJ5haBVVvdXFav4UaMG568rCupH/xJhfYiMiHzHItWhOwuctjnslbE+tYsRHUmsTnA4UKp
	xWMabG2TYn9oO1MfQVYbDggNCWA2bC+zOFtVaO+zRyJJvNQiaioEAQqKWf71lmp6Xkz7FeRLbR+
	9Hns/0nxy3nEqXXhWssSXvPHnYX0OEAURMTVdnYSpujMK3gFt3K2OjWMgcMjzkX7jUaHdnxNBUL
	ealKiY2aqea8B4A/96lauIpT7iz93t+HPQdeuUw5ygVPxfLl9gEFUKKzlsBqRwHDgm7JOqUhVA2
	YSSkUGcSpsnEybwKcXapG7fCV3II+l2wfT1vJv4jZZPk2l1J0jWuSUh7QPSR89BUCRkbI3/uGrm
	gX4+houvEi0tIGR7RdZhrX3S1U8Hi7DXHISoYf5avlfVaO/Uvoc4okqoh+V7kUW/xE3qOq/P9S6
	0ivQlRykYqR83YneXx9sFswoNjqcBfCNB3dDR1/PqKeg/pkZoigDxs+97tY1lzIEIc=
X-Received: by 2002:a05:600c:34d2:b0:49e:6838:c813 with SMTP id 5b1f17b1804b1-49fc5865314mr68775935e9.33.1789840681131;
        Sat, 19 Sep 2026 10:58:01 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd115dcbsm88240355e9.15.2026.09.19.10.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 10:58:00 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <0bf09003-b6ed-48de-a826-9d978f3edb70@gmail.com>
Date: Sat, 19 Sep 2026 18:57:59 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] kconfig: tests: warn_changed_input: Simplify by
 reusing the extra env
To: Nicolas Schier <n.schier@fritz.com>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Pengpeng Hou <pengpeng@iscas.ac.cn>, Ulf Magnusson <ulfalizer@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260917-kconfig-tests-minor-updates-v1-0-286e5c985244@fritz.com>
 <20260917-kconfig-tests-minor-updates-v1-3-286e5c985244@fritz.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260917-kconfig-tests-minor-updates-v1-3-286e5c985244@fritz.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/17/26 14:38, Nicolas Schier wrote:
> Define the extra environment once and re-use it for the respective
> _run_conf() calls to increase readability.
> 
> Signed-off-by: Nicolas Schier <n.schier@fritz.com>

Reviewed-by: Julian Braha <julianbraha@gmail.com>

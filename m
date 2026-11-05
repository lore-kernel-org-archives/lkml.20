Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910976;
	b=F7qFmBQqiv0W4J8mqDOmOugijSRV+y3MzdURmIsXG/K4A3NSj9QcoCkfSdqzLswcLdgJ
	 yk+6n3fpd4qTfhJ6xw9reNfW9LSghJjYnsDRd49TZsKyema+AmXB0BAgfB0v3XHz2pLbu
	 v5vj/Vegcui4A64tScOufVeOxx3ko94k7nVzfRrVo2/6dplJdDHOSu2ILBWBT/nkOQxtM
	 LwBsPiWPRIJp2SUH2l0+znY9bkP6hrHSO7WdB88YKSJ6+jlQ+dQcTXh3jUtAUA3o4tJKy
	 teT2It0jHEk1fnn5wmm5MBt/5Wu6eWPnnqxQPUDCK75PDP/9/ZOs/TVf6zWRnZ1XL+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910976;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
	b=5mdv8DnxN0lPm5KbBb6sZ7M3oFwpuFuu6ohLzs6W8EmAigYqYb5xcyFkhsPv8tCvtflK
	 EPnB7kJVFwYbL7leJtHKby3KiYoOUybX6oDXkN96GZ3+5h2EnMWIToIfQ/pZy4GMzslR+
	 qnvxjSzBLxAgpIkrzCk6I9GlDVMhUrWxiBFVpAXt9nuo0y/pMnOCunTzDbzJkVwqacV4Z
	 ZGAs6ps5nzQV1Ap7YW8CYwBy0n341RsmYjTkPKH3hwqgFzZ0wQ0A5j+16W885q0KvzsL8
	 gBkX4X8dFGC9ehFfZs5Yox1T8B3IuV4UW8J3S02mpjUL4Nc7jbHSeRuQ59EvTs2GSdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8A6606A32F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A8A6606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1448603a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910976; x=1794515776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQl1ERSY4wmOR1OEbq5mx2PtZRC9i6q9Gw0tuk7z0Is=;
        b=I1/mMy5kROarWCbAjrqQbLGz5wgJECWYQ/p9IVpOXNjaf0EmqVaOkTE/6S34mGxU9u
         29cPu1KNSZ4Ol8RouPSMRJtBfEzCliWZbxORTyEizzoIXdaQRZ7hsl8gI0Wsd2jZzsP7
         JT1/rEIq8RYZBVnJoDhV9g35tn/cR9y5cTAwjX6p3ESe8fKM65+dIy2ZllsuyIDeTPHv
         PaAP1fR3lGQLFuUfRMk9LQOzGsjXcjzkW26KNQHYO9WASm/IKKYu7y6A1PMZ/3mJ2A1s
         Ezhnah/AgRei/SRzhGhW9NA+BJlE5NJz1Y0qYnFPeVp1rIqhKH9E47YPPLaaxmo/0T2F
         bILw==
X-Forwarded-Encrypted: i=1; AKwUvBzBBDzbpffnxy38DbtPc2dsZNb50x1mUt8nkfGzCsQGSdmcgAvgQmd/TaH4fjLRyQwPAgpw+qQ2RS76lwU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/Y0m5+LbhgueIPCFV437D9le8bRdGaDLEwzx9+dkNz6vp0z9H
	kcKl4KyHoa89yn7THF1L8E4tSHS9uLoBAQ6mFrE3Sxp+nBXA/7i/kPD41WaGWEuM
X-Gm-Gg: AYBFou2A4inaSen1aY5xzF3LYyQdv+6cxwCHqm1Asin4AvGHS9IxxT1bs1JaVZUUBRk
	FAaMo7+vcYRYlHKBKV7y1INPea51c5LfaDY1jZMWuK+fu+0vj5G8JjCGGtENpMMvxlnR3s2W1nr
	e8KH5N92l2tzmNBFtCvANCU5JDqANrHb+uRBRgEraHLSfVowIzaQ/Ea5/5DutFT8s+Hy8nNtcim
	3sjk4MUtf9xKB/ugPxQexE8k9/W0JyU/kuipcSjQoZizm1qA/dVOaLhpJwvcb04xDfBljMGA7we
	l+S0lA1OY6fHvcdpOUUAMxe+F0zq+Ba6VZJryL8Vtzx1kHyJH68XPQ5bi6csI/2DOWTx7e5/v3A
	iOfOUMCD8czIPxg00xu3zXkGvM7ewcV4NNUOmbDSWAxsmUR7X2MHkCZxKgHr8Ct08EgMc2So9MG
	SNoWQHW1WX3M4g92sCq5JOJER8HGsGg2IUinCV5rjvaS5+29hU3bUsOgx1df8+30mneI+6SSStd
	fJOJQS9hN0L7bTHbkLimeGedI1KUa+cjoHAg+AAZuGZFlu7MwuhxpHZhHqpByc3PszMMAy/GAlV
	iPmS7IHcG7cx2dCOCtW1CxIxBsk4Akt2jpOB80rJvs7S++qE6aTuxeNgYKaREfuBSkqaKDuoAhO
	vLFqDA+PN8uC+rIdYsn0oUDzVwF9IOhDGOm2VTIwCFhs=
X-Received: by 2002:a17:90b:440d:b0:3ac:a521:95e with SMTP id 98e67ed59e1d1-3b0db708d50mr159345a91.47.1793910975714;
        Thu, 05 Nov 2026 12:36:15 -0800 (PST)
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com. [74.125.82.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c42a7dsm603529a91.5.2026.11.05.12.36.14
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:36:14 -0800 (PST)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1357499eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:36:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBygt3zE3bN6CKCVJgYLrl+X/BPSo28qgi4notqZfjQJP/am2xHOQIQzsCmmVcet9/eElScJg7obdxYxKkQ=@vger.kernel.org
X-Received: by 2002:a05:693c:8008:b0:369:d486:457f with SMTP id
 5a478bee46e88-36f73e72d61mr409769eec.2.1793910973768; Thu, 05 Nov 2026
 12:36:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
In-Reply-To: <CAD++jL=Bhbm3eNafdRTSKcnjyivhdmp0Mk1iHZ=HKN9sy_3Ozg@mail.gmail.com>
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 5 Nov 2026 15:36:01 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
X-Gm-Features: AclHuK_D3HUaJCQYumF5y8SooLOqbAC7H10kZ7apqTopxHnLZbvIW5XAq_-o6t4
Message-ID: <CAPY4CJ4ExRTFJ+1q7GDw8ow=_ekk8urUqfC7ZtcYckwf1uO+vw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Completely pointless indirection, drop these functions, just use
> readl/writel directly in the code.

Thanks, v2 will drop them and use readl() and writel() directly.

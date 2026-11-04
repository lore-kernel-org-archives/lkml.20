Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793818629;
	b=vN3TaQKQkN5fj/zdh3uCpRbVaBZPv4m/qKAKPunS6JO4Hx1V6lfL1jlrkyj0Mxiilmtm
	 qTmDiMtXf6m9u2c1wcdS0/pZ9rSx76t165AhtfbV4vwd5Mi6vD0jCd683vpePm2psZDUf
	 4pARajPMV3PPARjoT9II/ZT5GoAhpQl5Q8+wLPquwvDWOhMs1UUrsmb61haBUpFapK+nK
	 /60/VcbXhP9nxLYxAqC1oUqja9CQY4Bmm8KZR9Nw+sz0WHEbFEKcR2F04kNVIeyohFdFE
	 oNFKJej5ZDKtuN/o2ulPJgcTvNgD0FwG9yMlD/DeCoDr9BstA6pMDi56qKzmUVYA2LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793818629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IZ9VKwNlWQHUSDTdUub0LUYCE8kQAhoKBrGZa45rXWk=;
	b=xGTwZRBLxPSGQ/PNRbSlMxGSwVgiz+J8z16BZzRdZQ+eT/rixIR6JBNSRd3/3wjWTM5f
	 w8c2J5gMNSALgid7TOAAEbYnx3imAdLPz206Pnv3BBoqJ0A/NMVIHK0OEi8OA2vC0eEfQ
	 CBY8dgfJcs6bzCtKvxP/sWKeUnkkx6IoPcyvT0FIuYL/NbzFSpSBDZJCHYB2hx7GETVb5
	 2Rv/MojPw49Kv3qsvBu5mAxX0bRAez2Wiz0TOEvUmxFaKhpsUPDLRnTSDu3QfZh03Ov7V
	 Yc5n+YXIMkoamv6OrQU779yP3j7duS3VRoBDTvbwykg21//qiIBYweBliN4ZuDfcnCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b="XHe+/Z1X";
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF0B606D830
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF0B606D830
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=XHe+/Z1X
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c03744ef27so316682137.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793818628; x=1794423428; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IZ9VKwNlWQHUSDTdUub0LUYCE8kQAhoKBrGZa45rXWk=;
        b=XHe+/Z1XXeMglCcuzLURWowoZhofC+0/u49JTB+vvbU/kYZ81DsPHbMQRWOI1gLE1W
         0Ajn5G/D+3lsDbC15tNKUlVnDCHZ/GhQYHZu3tGq6taphGW+6Or3tH8l1W2n3NHou1K2
         c2Eb0270DugjZUhVLHUXAbwLT+vkASJddylrg15tCPop7uzH4NFTJ8FjHV16hxXCYHhJ
         wUpzF2GBFgqNo9Bp7OzxTUoz3oxDGJQeyPO0Oy1fTSaVvap8fOKVcTttYCbc/AmKJ4kA
         hE3uCap28ZoZdRAb/ywuVw/cxn9RjCB8uhzi2UhITKIWwSoEhhD2Xw+DkG/ZQjYea6Kl
         J6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818628; x=1794423428;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZ9VKwNlWQHUSDTdUub0LUYCE8kQAhoKBrGZa45rXWk=;
        b=uP4OTMARjLot+YKAjuh/Hs0nl1qPKc296O6EM85REcz03IpeHmVtZRHIKKvLpvQo+F
         yxermhPdq2HtJBZeiaBVy60GnuZZpcTHMuIpacGzTVQWyzD024bylAMW/XyY3DHmNGWo
         V655/P0GHkoljqpMcMEKPhjC3+qYp5m/Aj9tkTon/qO3PkYvNfpg3P5IBo5aQw62FuiB
         hb77VQiw7Us5bceQF8sZMKPsY4ZUgBadkFLCtY9UjFPfvqcdI2+PAeXnB599nycwac4I
         LRnO0JyIzdIC/ZiHRH5CazYlsV08wWP40v8IvTdiRFqnUvlLX5CS968b7xNfl02RmkyQ
         zhlg==
X-Forwarded-Encrypted: i=1; AKwUvBwDeqzW2pQeigQtD1mPsE4u2HULO3cCTcn+Yx+/jEcvdRK6gWHVCYSlcw6ySHaDRDUU+Vv+8C+2FTo0AZc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/UxLa7JRfLOdnA3F6OVdSV6lMeABVSgHlAlND7ZnELPFeXuwM
	njcsfzwASMXGrM5k/o71IQKPscU3IDY07FuSweQp6NQZ0MAMsLuh2SK2FTE5N8GWPuw=
X-Gm-Gg: AYBFou3PYmuQMfcD8cwb1GutTP3luYE88vuQsrNTGLa8dxl5b5195MOegfQoARpZE/I
	UIstl8P3w6f7DOt6NcJ6WV6wJvnEBhuBz3iNuc8e7Tw9hOknpjD3CpcdXMmYc3q0kdUIn/iwM4b
	ybmKbQ0RLHjyyIHdHy/iPi5DH3h7a4g3LNsuVFhJay05f1xsFwkzT5VyxYdQTBj1O1JmQ9Yz3PT
	B0GzahcQXOO7oI2trgSSmgM+r4oBZTpafk9pl/4wvNxzmkHV8gUx1XXoQQkyPRvnoAqlK2BFEko
	6d5gNjEjUmYPl91y3knjYm/aurGWhNYNkEE/ghyjV3xllFJiP9ecUYNkZ0k5X6n4pT6+m/+jkJo
	iTTwoZPSEhQ4oN34fjKmJrqbDfjY4VYziyn/34/kTgOHfluIrv0Gzah1W3Nih6yShQdBRpEAV+Z
	8My+qwpgY+u3oZGL6esYxWJNvd8r8pv7EXBkNE0UtVaJmvK2ux/I30a37qfa6nypgjqnxKP7PFE
	af5O7Bq1CPVXGPpnpKkS/Cu12OVI9Yp5FU82xUWX0k2dBWUhI1zKBMSkl55RDd295nXvdUOyp3a
	XhQRYfH9Rzh2hoORZUV4LZ3Nrg37F1eTwr9xmDS9b0traCRaHCL96PmdXsbWPFdGakavwfZYqhb
	mcSEecbaMYteyXUlky/pjTN0WMaYRETcDZKv0ia4+UuRx
X-Received: by 2002:a05:6102:6cc:b0:7b5:7cd5:2a1b with SMTP id ada2fe7eead31-7d072634fbamr5914702137.10.1793818627742;
        Wed, 04 Nov 2026 10:57:07 -0800 (PST)
Received: from soleen.c.googlers.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-999f3006224sm736210241.9.2026.11.04.10.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:57:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/3] kho: walk bootmem areas in address order
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>, 
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>, 
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
In-Reply-To: <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
Date: Wed, 04 Nov 2026 13:57:03 -0500
Message-Id: <179381862319.2089669.3389816529046759968.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=pasha.tatashin@soleen.com; h=from:subject:message-id;
 bh=DDkD8JSCYr5RCeQfuJIIi1Yq5YW3znOE6F47n0yvgis=;
 b=owEBbQKS/ZANAwAKAbt3KEzbc3reAcsmYgBq64ABQgh991wmWzNfvO9Qyexu0ErvASNIQxj0u
 FQn5xjnR/WJAjMEAAEKAB0WIQRBMaqT7LRvGvB/NmK7dyhM23N63gUCauuAAQAKCRC7dyhM23N6
 3lOvD/9RGW9gp0s0uJweY/yummMqVsr2SGqZNj6EGSPHNlXQmnWsxASxm7OJ9Vse40GT49GD+Ln
 kKoDGlELs1gC/2S+p07IIGWU+YOXN3mdiJ3WDchwha8Pjbw+WkYXrVziUAniPdr2o3/g6tQ3aBO
 GeeYGRK2ZA+cMpQlrKZ8BD0sI9C4c/Ago5YACznGJWbXdrmP53hL2feaZGuP0e5ZJjL6//yUjQ7
 UNwj4WA6o/SlAsZHWhPcTCFp2hbVmQ2Jppyvbq+vN+jsCJcAm69GEnQhzNfGOmn70Gsrr0ulGWF
 Z6nnsfLjpGwca/Ni2NWsl83PcqB88BqIpx7+wTNMQZdRTT2ZFEW3DVt1rsXDqxepV67TiWnREJO
 02GhYi3tuXCZTlgrRwyRby9wJbdILAQMEJqzT2wqeLbyRZpjdxhRJAe4srjeidOozyvFc8OGUEJ
 9GMxnPDY4/nCZWw4UmRSk+7++9H92jrkQy9circt8AbHQEWOWtlffF/We7VZroa+b2hWnZzHY1A
 yX+EmUvHDO017w7by5v3DSX34tON7P2hxHBfIo7PeE8S/FDtrt0h3nTn8M0i3ed1yhWAHtvuGbf
 7Zjq8sKqzVdT2BLuJiGiKxO939WgyGsZXvEIzBK3cBx0dXE5RnFI0vihWDLWgyJsdQ3+AsmXXIc
 WYdLSQfHpUQTV3Q==
X-Developer-Key: i=pasha.tatashin@soleen.com; a=openpgp;
 fpr=CAAAB722DD22A081F0D49F35633A6A993D43B569

On Wed, 04 Nov 2026 18:50:09 +0200, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> kexec_add_buffer() users may depend on the order in which memory holes are
> searched. For instance, arm64 places the kernel bottom-up and then
> requires the DTB to be above the kernel.
> 
> kho_walk_bootmem() walks the bootmem areas in the order they were
> reserved, so if the kernel lands in a small area at the top of the memory
> there is no room left for the DTB and kexec fails. For example, on an
> arm64 VM with 2G of RAM and kho_bootmem=8M,64M,64M, the lowmem area is
> reserved first at the top of the memory, the kernel image takes most of
> it and kexec fails with
> 
> [...]

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

-- 
Pasha


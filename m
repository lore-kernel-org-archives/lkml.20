Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794102703;
	b=Vk8HBjGVebDqKtBJb3ynlbQ8ysBYTwrH7rxgg8aI/98x2wPm+NvsRYAh5hVmXJIrXb/l
	 hJvmEcQSzLMu7zR2ZwOgm7oXtQEOgFkK6osmdeBIs5EMzpeJrXVq2zTEiFbF7UaWOqbjo
	 H89osnxQyiecE/oxaVl0MIpHEReiBwbI1DoKe0d8U+qtgip0fpjeoBeEeZEYK3yy0R4CU
	 e+wiM48MsM89kjBUfv6gMXp2DpLpBYt2+CA5hO+hj6eOuEb01WalFLpzkknBw9I68kS+F
	 ZtLQQanhCc3aP830rX/7OllOcmJSXrc6/FFg/WcCknGvXzgMGZArZ8LNal06n2h9JjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794102703;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1xV/fJ4AuRrR5u3NqFuBRHGOdyiZjuQaysbexctAYug=;
	b=3rCs7D7ZAXB7BWSjSQh7uGKTrjBg4UgHQtJRS/8MZHpvvR8sErJ1T4mSDwJMJNaL/sy5
	 mVPqQwmbbKD9xrrUOnD87Mgf/oT/y6nT89VX7QOC7UFG5HtxUkzkVy2U2CH9oL1D6Lw6+
	 5+1ZAw9StqCAJ1WHPrfh5bET/aFiD1cIjb0wQo3qJeCn8++ilCe6IK8SK86nkohMsNmn1
	 ZuUWhHZciGsuwc3JmlBEnqQaso3aQoOOx1GkTTw3/CKOQo/a8s96zbYZ2Fh3MCnV7ADtE
	 C7cvfSe2BE4/iFigk0q8ijBjuDEIrdeHlx5Cb8WZx8SPBWw9oL9b313+FGqaMuU09CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=calobrisi.com;
	spf=pass smtp.mailfrom=calobrisi.com;
	dkim=pass header.d=calobrisi-com.20260707.gappssmtp.com header.i=@calobrisi-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RVpGsrRk;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBB1606A31A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 01:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EBB1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=calobrisi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=calobrisi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=calobrisi-com.20260707.gappssmtp.com header.i=@calobrisi-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=RVpGsrRk
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-93f36c18b75so3905485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 17:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=calobrisi-com.20260707.gappssmtp.com; s=20260707; t=1794102688; x=1794707488; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1xV/fJ4AuRrR5u3NqFuBRHGOdyiZjuQaysbexctAYug=;
        b=RVpGsrRkBKsl5ZRaGa9drVPBv+Zj0NBO5KR8r03cH6buOy8xfchv7XxTD86SRSpt5K
         ngj56EQu8nsvCRcw/50yqSNXxZApGYGvdlr5LoIFCfuCkCdaZkYPpWdLBcErEjy70caG
         watxhJsBBFpNSeGRmRWZz+w9d/eXpxfwLWmSBjqoP/9CuXhic0rxZtAJRTh0ypAoI7YE
         svU6dhVKI3XSPKgPt+GxIoDuXbfmwKkFEbfzRIUu6oYKfIspYl+HnADRlKp42CQzI7EW
         Z53kdaCpPPya/CH5DkmneTbwpqDgTFLAlNyfXejpFNrVYnYZJ6UHiAsKYMmBgtve77cN
         aj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794102688; x=1794707488;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1xV/fJ4AuRrR5u3NqFuBRHGOdyiZjuQaysbexctAYug=;
        b=upQ/0NDeg53c2+6sekokpbeZKF55Y+Cn0EI3LsabgKanAj9/yqwi79F/Sf62beK6Xu
         Cy22Uah+tB4Z6Bq/XBFQ6Q1MgbDJ51rsz0q4dxrPPEssEGXGneyUBlalvtU16PmHW7dD
         L5Ev5ZODq8pLNi7UB14XwgLvnPYjgPxqNUJT336kxoTRW1N/WQMfZGvKqoJ4wGWcgGQh
         5/vs5ZuNIe2ONQAKZ4ar3isvGGFogI5kOnlB/f8Q3X33bwcKBPxJwMzB2jLF4GOe1mYi
         qRcGCXElEpB0iKHLlq/02hmE37Eo03Bs5iqa2q2JxrsLzrNZjThX6i7wetrAJ91OroWC
         s0aA==
X-Forwarded-Encrypted: i=1; AKwUvBwzy4I6/T1JsVdW91N/WrNQ7h8Czm/cGdLKBORCrgTGp4PNxjmsJ31pONJVaEViotVszhL9ui9NfQMd8Yg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kEF372IghgQCSClMYmsnfAzi6IDf8iKBs1Vp4DqQyMSbXTk5K
	qwYrvyivg/PrjHmFGt6sbKP1/VqK3+G2JxJu5n23Kb2UfRFS6HJiNypc9qKh/bkdexo=
X-Gm-Gg: AYBFou2x5/pzfA0Cn7JUvnHlxlklJxwwyqCl6QTuvqpBXu2vUwGssvV+rEtdX09Sb7L
	xG1s9jwbS0Vo4UYOHVklLD4mI+P3hk5IgehSRD3uvdw4SJu2ltO7rUbpAjd03TXKAbKMUMAWKQK
	ujqJNxG5oDUzYDwQhlZAEVZ0PX9Wps44aRCEYwGWeFMPVebUsis90BMK7yIf+10/cSGN7mMSOFR
	tjfz94X1yifsHo+qj04uim2aIIKS/k1hPrb2s0/njREBBNzezp/XBby8Jq8ElUfmfpMQlFC0Ey5
	jRhOeCsJ+Dx76aERd6Wq/SVnF2N3Y4RGvk5EbEqLftyc0oJWFVqScwIx7Iu58y2cXEWVeCJEKDp
	LkPvIo1PB7SBogu+LGjEwwvZL58/ez9WaIFmT+BJMlHnWnZP3YO2SA1Sz6Rh7rv9sc0RZeewNbr
	ZbMGFudfhGl3A6CKM5ACodBwQjC4vsEWsuhRKZhnRdZCVuRqWCw5XcZF+uVlRm6taNgipgCruSB
	JhvYPEqPp+pbG3ZSW1Td5XdPYYoIYB7m5n/2sjC2WpZ/KEAr/jS9kGdPZdMgvpi8FWR8FgEm8WU
	21hGNNOR8CMZflImMti3En5VoHp9s6tdY0lhk7pH4sMCbWrJ7+c5CpaZAelSyWN+ymQ83eoIsg5
	V1Ib3qCSJGV2BdEz/+8ERGsLTGzcPUQ9d2mYTYQ==
X-Received: by 2002:a05:620a:1d0b:b0:93e:c12c:fbcd with SMTP id af79cd13be357-947842b51e9mr47600785a.73.1794102687950;
        Sat, 07 Nov 2026 17:51:27 -0800 (PST)
Received: from localhost.localdomain (c-76-99-126-200.hsd1.pa.comcast.net. [76.99.126.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782ccaea3sm78072585a.4.2026.11.07.17.51.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 17:51:27 -0800 (PST)
From: Doug Calobrisi <doug@calobrisi.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikolas Joshua Britton <nbritton@exabit.io>,
	Maciej Grochowski <Maciej.Grochowski@sony.com>,
	Mesih Kilinc <Mesih.Kilinc@sony.com>,
	Geramy Loveless <gloveless@jqluv.com>,
	Eric Auger <eauger@redhat.com>,
	Alexey Fomenko <alexey.fomenko@intel.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
Subject: Re: [PATCH v5 00/14] PCI: Resource placement algorithm fixes
Date: Sat,  7 Nov 2026 20:51:07 -0500
Message-ID: <20261108015109.65207-1-doug@calobrisi.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106134341.39493-1-ilpo.jarvinen@linux.intel.com>
References: <20261106134341.39493-1-ilpo.jarvinen@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 6 Nov 2026, Ilpo Järvinen wrote:
> There have been major changes so any retesting is appreciated

I tested v5 on v7.4-rc1 with four AMD Radeon AI PRO R9700s behind a
PEX88096 switch on an X570 board. Each GPU's window holds a 32G BAR0
and a 2M BAR2, so it's 0x800200000 in size and its BAR0 needs 32G
alignment.

With firmware ReBAR on, the board doesn't POST once two RTX 3090s
are also on the switch. So with ReBAR off I set the four BAR0s to
32G from Linux, then remove and rescan root port 00:03.1 so the
kernel sizes the windows again.

On unpatched v7.4-rc1 the switch window is sized as the plain sum of
its child windows, one R9700 loses its 32G BAR0 and both 3090s lose
their 64-bit BARs.

With v5 everything is assigned:

  pci 0000:0b:04.0: bridge window [mem 0x2800000000-0x67ffffffff 64bit pref]: assigned
  pci 0000:11:00.0: bridge window [mem 0x2800000000-0x30001fffff 64bit pref]: assigned
  pci 0000:11:08.0: bridge window [mem 0x5fffe00000-0x67ffffffff 64bit pref]: assigned
  pci 0000:11:10.0: bridge window [mem 0x37ffe00000-0x3fffffffff 64bit pref]: assigned
  pci 0000:11:18.0: bridge window [mem 0x4000000000-0x48001fffff 64bit pref]: assigned

amdgpu then binds all four and P2P between them works. Logs and the
test script are available if useful.

Tested-by: Doug Calobrisi <doug@calobrisi.com>

Thanks,
Doug

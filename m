Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FF738642A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124953; cv=none; b=g385ldz/CfPqMQ0E+LJjsc80R+6qcJEWR2Z6QKrz/9MHeOdZI1MyRK9pqdBCbeaq7/nF7fciKosKMd2K9A7f/i1Gpx7MzNzIAWrjqsDcoq6UEuZC0xfVacO5g4qRGq8rnqCtveaLV9hqIpqy1tMUl4aOlS6NBeiVyPDXMkPcy3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124953; c=relaxed/simple;
	bh=L6unIE4vBVMEmCJjKLuJkLHsik5fxFgTZ9Kdo1htpnc=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=LN6qIYGbvf2wr6GmPs8/qMJfOzf9Q9dtdomIzlTSTE/dv1UIJSyf/nINRUIfAoaYGFAyxqu2Je7GIG9hYHxLPjUTmsy+v/rYjuJoSmL7n7Kakv+rnK3nwHxZQ6jrzGvTY2MP/lH0ZJuIUdvh4en98ds8BJPgjvQoen1mcjnV3vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBpBRaCj; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBpBRaCj"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1581494eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 21:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792124951; x=1792729751; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VE+oXeqJtxt10+roATNVYTIoZbK6JmE9LUgIix6h9S4=;
        b=qBpBRaCjX+etHxB1OIBgKZt737yLL3OIrBfsHIuk8FDCV1z4E3m+/2WAUQs+Z8Hfol
         zbGPltY5Ijq21S0DyU6jvqpxcj5blOAiyYqkz7ojVyc2BxV+KkhEtkUArT621kLeNGD8
         J3bfSwtgxUyYRrpOpzGeKVpQTX36B+Qt1Le2Lzwhm6eYPIpsTxAqjb6HOU3NZ0Mqqyv6
         LkvZZiLMJ8YxUNYRmdLmMCGKwofmo9fCSXeaw3med0oaTZE2E9flXj9wtQYHGcfWZp2e
         jn7gqguM7AhP29f6AtTmqgtfXvhe2iIqqFwJpTD5tLO/Wcysz6w5yhWVrp7H7cJwqoeG
         QVIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792124951; x=1792729751;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VE+oXeqJtxt10+roATNVYTIoZbK6JmE9LUgIix6h9S4=;
        b=bjv0AsmX0ft2phgGLNJKStYDZLI2Uuh2XiQjGjhyimwam5xR/uzJpv/ayzWIQxfahW
         5nTLVlmJWxcSTbYL0pe4K6Un8GApBCieb6mwsMu0d9dwpXtiXmSr0HUQBlHYEMI7JMG9
         n2tcFvVCdUNfqLkkdoM+fBA4HInVfQUO9mL+Mfu67/+gcUL9JFUSKe6WVzgJSyCdljn9
         Ix6zcIXo3fVZhsFdUTQov2e1Evwkpzgm8VE4ZCaCAl85/05G195OufdmW79pATGXber/
         bzq0DwWCn+cBlaKhOrPFooqr6FncOpeMevXP9qPqNtK9acPWNMu1KViKNs3XNSCQcpDt
         cRVg==
X-Forwarded-Encrypted: i=1; AKwUvBwju+6eh8lyMAtl6XgCHMgPs35yoU1kLGqScQU3CrVdh850DR/x/iaZY6q9a02lzRYRnt9bv7z/50AArP8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdNkg9cXiU9yebhay3TYBnv+ucBcv/lblfLyPoFChKX/9G308T
	QZOO+tTsJ2Agh0tM9xo3Z12D2E8MOGEdEKoYysH96aHooFkOJopEe74T
X-Gm-Gg: AYBFou3TVEAiEPUFy+9e+GjH5c2CpTkOLzVheAmsZZuFLJv2Ou1aKDBGRx3tSlyOCMI
	Bj7YIsczLSWMjKV3jCCrA6FzLPz6LCHqOcY1SroFzD5RbHlFBKsBJ+1APd3wLjrvoI4e5CExy3P
	miWWPKV+zTSHpvp/dcRHI94qQd2nusdGMIJsOiS467Gj7IDfwCTG0qfzBmjNHWqMdWBFYxFA/KE
	Mki4U7hOPNM+ltPIX6KrdzNUC4oTeGOm8G8BlVIH2gwsEAnBk3EZKM0Z5yxhVbSyY9HRsCvxpgh
	aLD8DfKDqPL0pm6Ttqvq3PWSVRvNBdBmc8cSiRaae2cnOnPgrc0fhTEeMUd+w4x9pDtrx9l3qH+
	T2RqEl1XXjNJMsGPncaL+2qyTIS4zZj5+XdMAU1QHqsMw3pEZlHsYoAe5nmnvPZpGIjE1QcfeVl
	lWFefL0Mny+ZyWCVDsfCI17Jq6CR36yTSuBLpG0DfomHAdafP6vyKT9U56nLtUk8Y8OzYTgGBeE
	xomFzc19ws4Be7O3PdGeAN23kLaegQfChPhxjC68HiqNRfc5raZiYisFQ==
X-Received: by 2002:a05:7300:aca5:b0:358:1f59:48c9 with SMTP id 5a478bee46e88-3581f594a27mr34564904eec.24.1792124951215;
        Thu, 15 Oct 2026 21:29:11 -0700 (PDT)
Received: from [192.168.10.146] ([67.174.242.98])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2712719eec.13.2026.10.15.21.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 3/6] riscv: hwprobe: Report Zicfilp and Zicfiss only
 when available
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>, 
 Zong Li <zong.li@sifive.com>, Charlie Jenkins <thecharlesjenkins@gmail.com>
In-Reply-To: <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-4-radim.krcmar@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 21:28:41 -0700
Message-Id: <179212492177.1746949.16726340758762763295.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792124948; l=595;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=L6unIE4vBVMEmCJjKLuJkLHsik5fxFgTZ9Kdo1htpnc=;
 b=27DVxDiUimq1C4Uy/7Q0HGA9NWUoxHvXFovcrKUJUroX0TJlDLg3s0cpKAVy/TOBS0GPanNx5
 rUCtz9qvgcnD6mbqCWffZJdUhz8lEJ9/UD8V743Qvj2+v9JegUWExES
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

On Tue, 06 Oct 2026 09:53:00 +0200, Radim Krčmář <radim.krcmar@oss.qualcomm.com> wrote:
> User-mode use of Zicfilp and Zicfiss requires senvcfg.LPE and
> senvcfg.SSE, respectively, which we set only when is_user_lpad_enabled()
> and is_user_shstk_enabled() (CONFIG_RISCV_USER_CFI, the extension on all
> harts, and not disabled by riscv_nousercfi).  hwprobe reports the
> extensions from the per-hart ISA bitmaps alone, so it can advertise
> extensions that are always disabled in user-mode.
> 
> [...]

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


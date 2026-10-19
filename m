Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445528;
	b=T7eXc+4Ddi7AH/eiJlgi3W1pO8czTMwZbPN3VX+0GuTb5O9HdlSIcawu/AXNuJ4MhmxU
	 XBcUwWlYr0VRxouFtAFxfr+lAzQ6WRUyWftHV9P8/s9ROjFevi3FXdDWsHNOMASBETvn+
	 BxZ1Q7xOVw/gxL7DaSBNxBSAOYfnnRjyhvC/Wumh3Nj4aKTXjFxraQRXiCc5dfQR+W5sU
	 TJfBuyF7K8SuFp9MeEB4RUKO61hnQXuwzrR3Nkm7JgSRKjCacfHFZYpXwWIOTnwQc5ZVo
	 btfvIOVv0KOtgKOl7E8QcpFRXFPT90zjobLF+RYLDT2W1tKsSyKXioBakTZzpCq4oig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445528;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
	b=pYoxLpd2M+F6OQS8ZPenznhnvJFphninMrYuq3kfjBy5y4OYe+VGvTCmLahDy2NlLVAJ
	 srRDXMeBnlwVcYcjuHVPFGgwLKZ67T1fOpqwtTF+e3PoDZKdTtrWjVede0quS3EsyzD/r
	 cA78sOWwCeRLxaikrOOtifT3LvfuZuHQB1xctWuDmxC6+Tdhqw7dOi1UYuCAgubIudDwM
	 JgkyBVhjSGFGg+8JjaWtploaNLnKTGsQJC1/5wW/qMXOli/y3cy/BhzOs/MqC4D7pjaJ4
	 Af87NJxcE552GuQ+n3Q+12m6cXkNlVOYwJEQxX2ITH175OVRxrgU/0Mf2En2GxfEknA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sB0vLkAE;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D723606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D723606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sB0vLkAE
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35ef6b49813so4867271eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445527; x=1793050327; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
        b=sB0vLkAEH+wKhJ8Cxe/5ZMP162nPvlE5GdfkvBekaDyBFLX0p/o/PJGYJ3m5YN3CQQ
         rE89zT5uCaC49tspBnG8VEmCCJazzuLMfdmqU77AYNC0IN3+CRUM7ufo/V2ry+fwvyTF
         5bYx67SjVPyM5xZL9GakJ9GcWKHEH+Wkgjkj0cQN40K2z4LXR65r6ShUPPfNzzyK/A2E
         UXUmfrHJ8Hj4MLHs8sNiLM9ScEayvARU4cHzABtX2K3eULznPMq25pkjXuBjrbpNLV/M
         Mu8fYVIX14Q/24xaNeJQV6G6lp/fKKlBp/AuY3x1nx7+fezvo/wOsXPwDvxl9okBAeTK
         X4Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445527; x=1793050327;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TuVHoTWOLcCyB9PSRvxtA5wjt2JdJw+LyuZbMuRvoqU=;
        b=vn+sURz3x6vDazYVq5dq8FbptHFwtkcfFjksldZuVB2HvSfc4MmE9HzGWChLQH3L1r
         Nkr+JWpjeGk/1RP61ajiGqh8HmHzEz+Ni6cel+n7KBQ5CiFEOtpeYNhB1MPPPH4s1K0D
         zBm3m3Uo3BXEbPdBf5fZU/5q3O9/HtNvH8FPy7hXjm2tBaJyjWsGYIGLqpAxrG5hGF7N
         6Qpc40GtpPf+Yw3Jrm0kWxSqKLRe7PTcBl/QmIjpW2UxgwNe+G7I7x3UGP8n8PHODEis
         KI1E38yNxGpNOd4WW8jBmmh9s+hTw/VvaiKtm7hg8OdHVsLl00M8CE19eDGe0JaGysu5
         7PRg==
X-Forwarded-Encrypted: i=1; AKwUvBx4cgiGpzmyJSle9FdoIPcFOsR/CW08juX4Cm7ilY9fkioYkhjwUZiO3yJtIUl3NpvLwfI2gHSelKCwKww=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1kxShfip3CeTGH/4A3dvR0gaPsab3GVPqO3FqTEydwUIMmmdX
	RywETmuJvosu2XH59qkTM1Piw6mzY4XpsCrjaxJq+JOtszpyOXbhTugI
X-Gm-Gg: AYBFou2tEKX/jtGZmWRaJZm095kkWeQ9HEUDc7fDUm7iVRiKpHsu39RQPx1GFqjZw+h
	ZSl1YplHXKX80ugzpOBgV/uUUMmx9GVDs6vIh6vm8WcGIsqntqv5FizAku3KXoyJsmTIxGHmIhZ
	+mXfLgFeuvq86ek3znedSE02hUhTjqPMLFBwnnTCS11F4DJjaO+i/yoge8m6d0oOgvkZf7cGiOS
	figJZ/eZ82XUdIGHPDhmsVQ6j8XgniC3ik0UNgWQJkJpPH/cdvbf5n8fq0xXS6RrnWlJfbiw9ux
	cVMVgDIYy4d3ENnt+8p8GUnNYbNdD/Jkn4aWEq768g9G1JGEH6oaMGYgO+Nhf37feiUPBeHOidy
	sP74h1PIgYOxZ/sJ8UYjJOuPEhUjGVjzdJyspVfR+rTNgy3nzs7QUEnPwM+Bst/XgiFc3M3NwRQ
	bOobQf31sc4IpPS+Te8WGxUKjuWXbSZ63STV0Yzk7ldZzDxPYHRDgftc429Q82Q7pmd2t+Vxun/
	biKbziHxkkHmNNhR+qSiHrfR5Np7H4CEXtTafs1
X-Received: by 2002:a05:693c:87d9:20b0:365:b147:b458 with SMTP id 5a478bee46e88-365b147b492mr1344116eec.3.1792445527063;
        Mon, 19 Oct 2026 14:32:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:7c21:7991:4e59:de42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36082a7b33bsm63920435eec.24.2026.10.19.14.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:32:05 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:32:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank.Li@oss.nxp.com
Cc: Support Opensource <support.opensource@diasemi.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: input: dlg,da9062-onkey: Allow
 wakeup-source property
Message-ID: <ataMRZc7a0y6IUnG@google.com>
References: <20261012210054.2848389-1-Frank.Li@oss.nxp.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012210054.2848389-1-Frank.Li@oss.nxp.com>

On Mon, Oct 12, 2026 at 05:00:53PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Allow wakeup-source property to fix below CHECK_DTBS warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-emcon-avari.dtb: onkey (dlg,da9063-onkey): 'wakeup-source' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

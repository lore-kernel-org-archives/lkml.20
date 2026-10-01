Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15DB525A9E
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867692; cv=none; b=M4yL06rzJRHW2zhhfI9XG+GqzA/SQZ0bdkPhV3W+K3QoNZYEV0YYguLMNvynNQGEwiiYAc1/cID/B3lhJP8jkZQMg2GLjlZ7ue+F9C+3yEbWfI1dTO1sapCuYVed1xnUgeBM2QVrBQK/T0UtVVI9J617Gr/DJnLcrVLBgH87zKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867692; c=relaxed/simple;
	bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MM0i4tBIvb2swoZGGOADWRv3/YDnH24b+B2WGNTl2Vh9W/ohT+VuPmDFmMy/7ZQ8xJgQT6HtT6qvcZ18/+x+zUe+Pc0z1PS+nldt45RcJZMRwGWxyso0eTCp322qg7uUgFZwVhHg50GAugKpYVktxrhjEntjPyzUKmBpxl7I4wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYAphiRy; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYAphiRy"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48aff58e6abso1180637f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867689; x=1791472489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=oYAphiRyds91YFZijac3xJ6+FxFwOAdrYfc0gdMRsAU8DDd2w6HxhiT6rlJisUiNeh
         iSnACMFPbHw6vcKwHomXeUvNxJMfMr/ZPJeYbytK6qpXWvUXrCEUXCwz1mFnI96yYSRi
         cI+n6mvmcIgTlfS2mBSQ6kTef3LqYafCs83pXsP2FjoXkS/qx5D8yRhPye6Mkw5EKbT2
         d97mMvlyexO6S8Js+0yGFFQUY4XFe75PGH0tcYpWYZhCssHrnVRWJZcOHsPrkAjSf5ve
         zeK1XqodHNlDv9/xbIcDC54PgJfNHajEW/puhmnxUuZjfYrBiGkzbxdfjpkNiWhhEEIy
         Y+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867689; x=1791472489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVazF3gyk1J8hFATxW/Weu9ULHvZlQGk8yLNNrf/izQ=;
        b=HWo3a2JSmsA59nQ9Cpiollu5SOc9/6QjbN0BNjpgiSmKofTe7sVTyT+E8AowvfQymL
         HD9k5zKHwytuqd0Oh1MWVrJlrHHWIhylWPJC2hYoYm1HsBTWf7qAhA75ApcwYgttdNGn
         4vy/LRis/iSKs2YdoEyb5XWImLRQvibzic9xjlVOfFpWtzq9aFsdB0Z+QnrVSPsAvahT
         ZCMrjqdM8fFgM07ZIomVAU+M4tAHRqb8TuPuZcfm9tDokfaYfnRawhzj0HhDMTeJVcYX
         Vff1LlgOJfbmxgeQg0R6L6gwVFqiQUOclFwTwN3RtBgpDNbCg+EaxkKho7vTvHt1wljL
         JX/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzfe+C5MK3Nf70kI+5islvnh1cuQHEGJ2JC4iM0fJFDaGuZMCfCR+AL86A2DtO/+SaFXh1aJlKEQYlJ0A0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI09m481ndAhzLQhIfTBNzWUfHyZfG7TW4+76ZMPcPxKeBsWuxZ
	A9l6dr9NBxUCKbv4Up476nx3S5NRK6dyw6gcaNmqLOl4wxJleCzmuEmC
X-Gm-Gg: AYBFou2plPJzoNeV1cs4mPXXRuS/1D6ZiIRdV7L678wYUHgi9cYBpD2WQUrH+p/8t3k
	KQ+0hyjpyH2h39ZnrcTwDGvnowgdfie8QJPrMvaeRZtKBqQN5y0VfsBUUWetx6XsXN25NC2SAjA
	op4QCzn+rNNx8oknrA7nKigJEBqNWTtNGVGtLK8ZScdWrBdut2FyS/V1adityncsec1gO5tyI+g
	3nLZm/J93SNffv342EZoSbjbWcA1NqfPcMvoxA5DkCur4PvcVC+r+kxhGWlnvkwMYHViGZO+4n1
	ydOSZ8/taA3QHBjuLq2XxjdvJtbXD04qLELuq0IhRk4iXgJJmelML4mj8e5RNWfvqIvmOzBo8BK
	ME9RQ9Tp84Jlx/PGjvwRAnbaTStp/L4q28AEP9CMJ5m8Xnc3+PU5CX7EvtBjMo3oxcg/vkDZsPJ
	IleymPBkWaT5Jjzsxhroa+VYfPGLep3drJvEt0q63rUXSmfkiV3qJROK8WbnAaTtemvgdU9JWmY
	7FFH2FI4tmwqRL5tY7ZW5OElo/TAuP/D2LdBt4TwqaZTtua+kQu2Gt615ak0/87hX0h6d98eTwr
	vz+ir9XMkxXlOTkdbUxDM7aBruU=
X-Received: by 2002:a05:6000:1ac7:b0:488:823d:5060 with SMTP id ffacd0b85a97d-48b02544bf6mr9213320f8f.48.1790867688738;
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
Received: from thinkpad-p52.telekom.ip (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de0dsm3293500f8f.43.2026.10.01.08.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:14:48 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
To: hfranco@baylibre.com
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet 
Date: Thu,  1 Oct 2026 17:14:47 +0200
Message-ID: <20261001151447.12076-1-andrey.lalaev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Hiago,

Please take a look at the patch [1] and the discussion.

Thank you!

1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/

Best regards,
Andrei Lalaev

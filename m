Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9DB47F79C
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932595; cv=none; b=glrGLVOJvTOfvbOf0ojsj+GcuZEEXTI92Dv5AC/C+o4bZWbcg325e8jlM3gm1fRedkvOsfPDOJIwfrge7DarDUhTIqgw8GXq/052I1j1jcl3V+us/CzllQXgHhyquumtyOzG8vQ834YzsIJ9iChUZboZm1u8SKlmPi5FrZxR4Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932595; c=relaxed/simple;
	bh=wzEvL7aoXZ9DPdwZv8U1uHRR/rUu9UnMW0cqiOXa9sM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=d+/cfN4bXNUIpm659xg1KRaaq/jWjMSSzi9Z52o9yKwDL3Nc/2ZJowO62wPXkkNT2FLjig7X3+G/9ESfWu0H64QsUTZ7cl2c/JOyyETUbn0CDMr8RkI/DFFvBuHOzX4XJKIX1bw77eP5nRwbehl58J42WSYtwnpSwrxNM7vi194=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZG+QgGoH; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZG+QgGoH"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-4885a1480a2so4417366f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932591; x=1791537391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9dZvdj5g2Xf7CgbEOngSTP98R8970sBXh4beZnL1CI=;
        b=ZG+QgGoHvd4Ky5ZxCCKFq4DEmC8GKeSoQFb5L/x8fAPFfHLxKPAchXOkrlEG3Dr3VI
         hAa08uSWVQJsIwbBd4QGesH+bn0b2xCzIhLlGLgWgEUncrAaYRmLNX3Svgwn0tZ3IFFD
         cQ1tuPjWVMlFP38nBRH99PrgHdD2eJ2DDo6iJgzlMW05a6mva+7hd6DJWK+YPdCvFiWx
         rhsyxFh7R4QzkoAfL8Z8eU6HhWvRNWSj/f62XWG5+3vqd7x/B4yIANPYigbWbOi7QxHZ
         A5KQFifP4eH/sXjaEFL3T8Ft0xHPDwch9aADd59u7jK2zr3A6Mh9nwrmVMoOX3SCCT/z
         YCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932591; x=1791537391;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9dZvdj5g2Xf7CgbEOngSTP98R8970sBXh4beZnL1CI=;
        b=c62j0YP8T/0c431cOdEvej1mJroVzXBAS4zxZ767fFaF1xTXmuElKKX7W2g0Xti1kw
         Z4tfkdRshhF8vfKWjTZtmgk6iO9U5W9JXaASxV29vtwCEYstqZk/nIHMHiPE0poqHy9O
         QNR6dnW2/tlstFtWVE48bwcQ52+fznjGlhxdlAaPcQfMUhywRsYz8RMZh4DyPKnyMKw5
         6gsnS2lSLO879l4ZRhqSWXVdwESOw9hni/8hcs4+viz5jGkGJyRgsyajN0eSvJcRkSha
         jVWygnPpwwWdANEKdOXGWvxnag9rr5znUsr/v+1tKJzwns3KB/SBVDdcB3K+ff7q+gCT
         0mUw==
X-Forwarded-Encrypted: i=1; AKwUvBwT3O82HhMvnhPGNqNywYCArC+4jkZFsvJ5+m/QKE3mB2YAxIramU4qyw6YyxVC/6O0ObtUHeSijPn9ThM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhG0pRSpxWDeDQWlf9zX4B6iyq0j6+q70oc7jzvR1eqJ/zL40x
	9VSrzDZU8TPw05npt4UsSsYfWyrXtnIh4+/bKpi4eQUXmH3zkBLUV+tkUQEqprlyfKg=
X-Gm-Gg: AYBFou1dGB7y+yExgOuisCs7bliCUMNqYR/yryHo96niBXWd+q6DBA/X9JN+iWYI0Yl
	o75oGSkFdJwasu9gh/OHjolvtEh2QXZ24ah/V5RYvYnafpEC663AeYiUXT3KchzzYHRsjoowm3Z
	lM4UbT12Nj1jfN/FiOsbv4VtLj9jbDwnY48HlTfV0JRTRRtXTg/gT/VPN+bDdbXwym0kRldJeaT
	1cWkmynDShwR7ZkGxd9gimKIFCbWQ+z4g5eiOL/qpznXUkwYn/1mL/lDP4SHgdRM99QILrLvBu1
	0hQO6VEM0xM9tSgC70z3c9O/6KK9e+pE1rqH58A762MT0mp2vI/iC+PisfCo4byqDSNeZIifChA
	4Qs6LJ+oW/VimPXGWFZVr4dUZDOsveZbg3bdJHDPnRLS3qX8pD/fEzKI71AGogYNJ/7nAgboW6n
	lS6FjoPr0xsXBM+wEEOzSITaNl/auDoyB0iLgdwNnxlJy9AqqD6VG2ZkOkw8gjJUVVq1o20wGIU
	duWZTrmv7ME2WtMOus=
X-Received: by 2002:a5d:5e92:0:b0:48a:efed:ac97 with SMTP id ffacd0b85a97d-48b1271d746mr4025071f8f.33.1790932590900;
        Fri, 02 Oct 2026 02:16:30 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:30 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001-asteroids-panel-support-v4-2-fb228194ad91@pm.me>
References: <20261001-asteroids-panel-support-v4-2-fb228194ad91@pm.me>
Subject: Re: [PATCH v4 2/2] drm/panel: Add driver for Raydium RM69220 DDIC
Message-Id: <179093258996.2282096.10304907203936947883.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.1

Hi,

On Fri, 02 Oct 2026 01:51:46 +0000, Alexander Koskovich wrote:
> Add a panel driver for Raydium RM69220 DDIC based displays such as the
> BOE BF068MWM-TD0 found in the Nothing Phone (3a).

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[2/2] drm/panel: Add driver for Raydium RM69220 DDIC
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/54e61ea6c492d69a1717018826d8340810c812eb

-- 
Neil


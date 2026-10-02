Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD68472772
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 09:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932592; cv=none; b=BE0XH5rL4i1+qCX8M7JabvfDDo66LsX6WFaoRlRWxURCSz7iwKKow6klZetGM+wg0mNTctvCFFmwdr8RNHf5ZzDQpzDCDJE9qQJbMU+eJ8T1Vbo3dzM+rjt+Q9WO/aiNeih0Plq0dR5It/xtMeRkAwzem4ndbsTspSyM4+2J4Dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932592; c=relaxed/simple;
	bh=c1MekjqISxF0fGn1yJW4FB6LYLWcYNOjlAKoEXUwTOg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nSmydERF1OfoJIQAnUaIlZ0rcehRTfo4nLtQERvVQdu1hXlm5DNkAyQRbKto0WDlOZ/r/BwKCdmpsaq+4bUn5LZDLanX2GbOD9cxTnRu7RjT1OYqixLpxO4zrQ9uHQZ7GXFx0yUcdzNKVZpd3jZppfAJpKwtZ/ejHjQYprBSvnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FIDFt7mg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FIDFt7mg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9621c5dso46977255e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 02:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790932589; x=1791537389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyzeELAx9pVH5pCQHDGoYs+swgzoejgakWVx8elkkIY=;
        b=FIDFt7mgTOeQw+5ogyHWt2BAR5aEkALbz32G3bhkxPYG3IkcTF9Oxs+YN18gL0jDpj
         Tea+2sCigAwTbF06osKFXbi4chOLtwywH9yyRiw71HdOI6iZRQ5DC414/pUZwhIeHFIe
         l+B8SFmk3Xv5zpTZ2ZPppURLwu/tGNcU62qJfIhLJ9hIwud73qM44xE+45CsKSbEAAxq
         +JBVFFbF796t5tS8tH3XLW8a+k2Rfnk7/EmpuMerShtekP5I+wReyLyBgK50KySl5zce
         tCdifQsXyo97LF0Mq2ffqWkC9txvy0X6J+Cl0pFU7p3UxlJYIf3r0b9Bf0t9gFNpnCD/
         6wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932589; x=1791537389;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyzeELAx9pVH5pCQHDGoYs+swgzoejgakWVx8elkkIY=;
        b=CVtyopvUzw0cjxeNGEMPTnKRg9bzOY46jf2Wf9b44o/t+ZVYJRx+hqocpZCCf/RMYY
         7rxdUt/BDqb++inAlkzS9Dx224BRXUB15jJ0wsK4fgjrVUcQOyTQTuQfaepmfZf/Ez9o
         PsWkanEv1HDNA26NQBczAzlrQfSoOY8bW6m3q+N/77o+xlSaIt1gOcUol8o09RkB68PY
         5rBQUhnvK5dxApMdXFRIbCXOrJbJjS/PjD+kLaqBzOG93iT5uHpYUb+cIVzLDKyPiJoM
         trXh11QK2IoCghNv01kjF6dBsAcpNkui65veNM3VYXSHv0uhTDb7O8sKCZ7LqQDRbPl8
         h3MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMq/g+0S8PdzfqUdoAKyjizQOaXm7LOgItvGtGpq+WXXNaUXeOS5H9wed94JlGcfjzDNXwHcWQf3+5Fwo=@vger.kernel.org
X-Gm-Message-State: AFuF++mHgrfKQaKEyedzxmPc66z85P0kRY1Mzrqi8sh9MYEQGcAOz9S4
	kTJSP0Gl/b+YZPlk6w3Ehyjhbe5L1YxdxsCAisGO/Wswn1IaQeKM/HFSLGhbHpIMfwc=
X-Gm-Gg: AYBFou1RnIORgMaaYboJITiPPXHPAlcJl/2qR+9OwHhSuSql2c7S/3s3FXpoTH0xeh8
	nNVktylbN0bxnVXMlJpyoHRxdCrHWs1goWwaMiI+ngkZMDfzeeV2yYLZsZzt7s4D+LPV19Obuq7
	prVkYFcKW/jiZsN7WCu8pCRNs8+FgmO6qB94DboGmtW+5NFV/Hn9MQjLyaHVUTiZGd/hzVM9D6h
	vkwV8omhw12NY93VlH32WSz/ErHRhJuOGmKBmNWM7HLZlUqWpxl9iJ7OgvNHh3/WFFlcs4jViAU
	7l3vKevv/pKD+CN7+JIO2Vb7lGnK1kDrnoS8qTVLoNX0qpRqq9Qiar8w8sXOpUlsqgGzQ6ab0eP
	lFo/fjUmHt50CNUf/PgAv61a7hJfeYXq3rWctp5CWgaADkKyzIvTqTKRQsxDfmsndmjsIodO4g5
	eJe0D2Ztv924NBSWssIe5WFykJ8rCmr8Cpp02k+rw8sJjIk6Ghw1PiCGPaG5uX33xwN9FmJVIXC
	6kMDaQdMlNvSubsXys=
X-Received: by 2002:a05:600c:34c2:b0:4a1:6425:be69 with SMTP id 5b1f17b1804b1-4a16425bff3mr5735255e9.17.1790932588885;
        Fri, 02 Oct 2026 02:16:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f9ad6sm4461292f8f.40.2026.10.02.02.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:16:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: dianders@chromium.org, jesszhan0024@gmail.com, 
 Hsieh Hung-En <hungen3108@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch
In-Reply-To: <20261001004940.110776-1-hungen3108@gmail.com>
References: <20261001004940.110776-1-hungen3108@gmail.com>
Subject: Re: [PATCH v2] drm/panel: ronbo-rb070d30: Ignore DCS errors in
 disable()
Message-Id: <179093258722.2282096.3857794392092899182.b4-ty@b4>
Date: Fri, 02 Oct 2026 11:16:27 +0200
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

On Thu, 01 Oct 2026 08:49:40 +0800, Hsieh Hung-En wrote:
> If rb070d30_panel_disable() returns an error, drm_panel_disable() skips
> clearing panel->enabled. unprepare() still powers the panel off, but the
> next drm_panel_enable() sees the panel as already enabled and does
> nothing, so the panel stays dark.
> 
> Always return 0 from disable(). A failed ENTER_SLEEP_MODE is still logged
> by mipi_dsi_dcs_enter_sleep_mode_multi().
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/panel: ronbo-rb070d30: Ignore DCS errors in disable()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/00efe8a685658deb7033d68fcdbf0a7e6796352e

-- 
Neil


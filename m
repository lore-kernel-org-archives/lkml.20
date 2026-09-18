Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D083CC9EA
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789699065; cv=none; b=VUMl0W5FRaT+WVYnypjh2NXFaEUlgyf40K71716P+MlciI84BQ9lGd/yDO0Lvj49k4/pr2GqVkZZTWwfAiKvGwcqSUWKfnm3wnVL3RU/q5chcWjF1yeEut2G8qV4iFT9qSyavBtUyIRt2qIdndeoLyvPajO9TYjwosh+vkPeHF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789699065; c=relaxed/simple;
	bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MebqI1/IPFufOb+CJwlSD6+2QT5ZVT3WUlq4ee0Vrl4zbkUyyMiVuuPhvyqTQv4OEhrk5Wzbo5E7gWsxBBLiOhUSFhEUE0uTcC3r2MYBgNeh+a+85GWS4OHwhUCLLVufqV91139KHy1FF6/bVnyWqL9ZNSTzNJ0F4vXfI8GULqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EyZuyCN/; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EyZuyCN/"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso188749b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789699060; x=1790303860; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=EyZuyCN/syvco3JhnB2GfxTcORb7BNAMn1ycHBVGDA+XFfz0jZtTFt3p3y+VbhqTUe
         V14jR4X37jc3sS8Pyj3SbcWjXSiLjt/weWWvAQiy2wGWPFkVV8wQ8M7eoZL3/+3i+HVV
         kENsJIlV0HbFwZVZJ3qehnwecztKvzrulHyBIhelGVfqynMKHzfqJBvZu5fsiX/iB9T8
         nQWT8CywZCgCj133xgjlGHJ/0ttIAiykJ9hZgeIOgkyqgeOoG7Fss31kl5MuVrTF4dAJ
         8fHHhR0wD3eYg44zY/N6txioltVk/BPYrp0Zt4AAfHyfIAfmAMxchO4TZfMFl6pkQ4u2
         MVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789699060; x=1790303860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xp96osNKNV73rMrH2Cx3GnQRPM4ktS3CCX6WmIYhStg=;
        b=EIZI9bm1H4a/91J1VP0FeTVMHmfuhgAD3sj0MFnDJ80+/uxKfPgnAIn1IY0bRX3slo
         K9dcwPhc2d1OLOsuHts/jxnti73N+Wiktu/vUwJ51gZvtqpbAe/uJ2VbV/+odZLSLqQg
         PceruMZo1bW2WeyUnzaxUp+4b2lA/syzNcKionuytrpYs4IDQxzqG5mqumx5uAMok2+y
         bO6Mp/rXFYV7OVTX6TqmH3ubfyqyP5PEgI/lx9BYBPE02ugmivS4GkYNLA3pe+9jPw5w
         PjUZqjepJB1oiCWOj5L3T50NW9ZvSBywirtrbFN0xq08rp+YERPW2VuoRTC9mrD8WYjk
         JZWA==
X-Forwarded-Encrypted: i=1; AKwUvByUokUZYsc1BdqATdeYpnUqhWqWBWv7Mm9NYQoTQXxpa/U0W8L2jWvPA6rqUt29Gep85mzCN4iZfT6V3cI=@vger.kernel.org
X-Gm-Message-State: AFuF++kMcY7vw0NgOFgmujR4eKs/q4aVTkZjAMgftlB0YJvP7QpbYBMW
	EqqDoSNNvxHaSWA56Ox9uz6EERD3asgdnRlJ6kZm0IzrjQPCdREdKSZe
X-Gm-Gg: AYBFou1VNsScMjunLFJZGTpQ3hWTTHgTlbJst6PiDGvBZMM3Mnk6hryUa8RVWBXcalw
	d/J0RBRhFgWg/vCG1JMzvUeUkTrD1Wp1p+yMXYMCX7TA8BsLkutO/Eu1VB31XDdJMK5Aj7DiaDT
	em3ianZNauGpF2ZbQD30SaLdmBOTB4a1J7d9Dg4Sl6j2rzIiPVpPwBHUnA3KkWD5bhpDbDPZGqd
	v0gtL5R76fejLLk/1Uemkp+I1sOvvANPOMl1IQ8LimLttPJ+ITtmCdZZiZrMyxu58V10IfJ86RX
	6Yhq4XCWpb0m/6zPqKhekJI10Gqp5bhLJTzebkgQEOCApxyQPrBNytsuSwKixujV4cAge4syjFh
	fY7Ionqo5Rb/5tGJELXwHOh/CP2QkVDXY4nRAbG8zVOs+X58p+NON4oD/2PyCcj5PgPA/TFDmjX
	skeHk2Say/Bl9/79GVRh1iDUk5HlDDnucgzWJ1LD8h8ABTVJAjPwaJAEFLXZC4o9Zw
X-Received: by 2002:a05:6a00:4185:b0:86d:3958:6b13 with SMTP id d2e1a72fcca58-874dd5f0ecfmr1988918b3a.19.1789699059693;
        Thu, 17 Sep 2026 19:37:39 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dd3ed2f5sm76564b3a.40.2026.09.17.19.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 19:37:39 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rosenp@gmail.com,
	kees@kernel.org,
	balbi@ti.com,
	tomoya.rohm@gmail.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: Re: [PATCH] usb: gadget: pch_udc: Disable VBUS work before removing the gadget
Date: Thu, 17 Sep 2026 20:37:24 -0600
Message-ID: <20260918023724.10584-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com>
References: <CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>

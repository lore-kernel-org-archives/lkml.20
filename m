Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B7349CDD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790258371; cv=none; b=Rh7yH6hYS+1T4FRiShQHnwqp2th4K+k6M0eYZWW23hNEQoNg48ZbQauw93W4qSs5sSoctV5PVPpZVvxwDfiPfCfg7o7AkmkpfL/n+yy801taiO33b0s/ImDmOKq7eqdkF4wZl1JcFH0UJpxnrBZhCJ+nSrzX2tgAA8aLCerW/e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790258371; c=relaxed/simple;
	bh=JpqOeur7GpbN7ezXANNXc+iz0nVAxCGXy8kfPhgmAqs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o178nrhIkBeK9EL6U3leA5i041b4Zoe81W/ineH0EYe9Ctm3G7AJhVXJOweZMwZj2NpFjEuFCgHjBdRGkBzrb3IS6FmnsloopDfd57MDTE5hdUesCXGN6p+2f6UnCdM0C8xGxMBqAxtrxEtgI078fBy4zdZ38bXvJQA/hqRJO8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xkylD8iy; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xkylD8iy"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350faaso1390147f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790258368; x=1790863168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRDlFyxUk3KppsRNFoYPmaT40+fQeOq7faNwXvSK4kA=;
        b=xkylD8iy+rfMATOyklNh+KekcA/IpTEDD0jhfZWX3dDtgSLyMYN+wt/DGsIiLPJelP
         1RmaS7GVLF+rzxKhCYBvAKj6UqMaLkY2ZP0fveenlk/tmzbl/yXt67lTvj7tkXiG0u0L
         ZmtZFHpeXHwey/G6XHgvCZdinJLyoZfEu8DM6HZgHNhmtDd6kzBVTZuqhacbYCK1plIK
         7P3S0fNOtT5xLMjqjJn9rsCX1i3wi5Pb707SvSlQz5OnItYanyEvW9fdYOAgv8DBEMxg
         y0UrQpR7+FDrMT547mpVSseDYhpTbaLBeRFDdaXL0O2lrP/11Ct1mKrtrv6KKSwomMMk
         uZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790258368; x=1790863168;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRDlFyxUk3KppsRNFoYPmaT40+fQeOq7faNwXvSK4kA=;
        b=wXu9aZVHt+yR3bBG4RRTIm6eAfpCNj9ce997GPs0webafHS+wk6e6YfBip/rv4Y+sE
         07QC2FEGXzDwLzcyXDOWW5ygE8g6BhvENguyLKnenFpsSDa/SOwIJqIkc20z4gUK32xM
         gKYDOhL0lS9/aky6NC7m9+9qkCP61ax5aiCfxc9Q1+LM/Sw/NhOdunQtpespe8oTs+Mt
         jg10mD/66h7rGI9UGVC6PQHSakQAchedWc0yXFSQx5/C56VhD0fp2IRhANLkACsxlwyQ
         nF/cs6Mal0Pkfem9lyrnGFyqXOywJGzWeaFXLAic0CLgL1rXJNOZG84edetr8yblXsJy
         zo3Q==
X-Forwarded-Encrypted: i=1; AKwUvByo9HivR2JS9rACFlavBW+/+m4ftq/PzLWHoLOgLUjhRBNYGS2bBhaAJO+6xaAKNY7paYddVXS9MSnwGW0=@vger.kernel.org
X-Gm-Message-State: AFuF++mvL6YI6xx28aIEIQsTthU+3N5yzMjcwpCe8oCchmFV1MvOhQbi
	RrQhd3CZ2LLJ5jVc9J8twj7D5cH8XKyCooYhX6igffYqe0MtMQDwTxOdQ2MS4kkUM9g=
X-Gm-Gg: AYBFou3p5Zpqwf+aicUchy9bGp9IEw8LSNh+FtA7kUBCGTCUrZ5oFKK7hP+KCJBxnMh
	QWYpAfYPpdYBeicUIPX4ZbAEumHN1J2htOU1ec19MkkDrNRaSeXrY3PnAEulN0DrDPs5oFjtnZH
	8J/jmTziO1cVhbr2ic2EqKW3sCsn0lTy5gIAGSXTWSPinCkuMRPQ/ahj1k2wY3eMsoETByDKRRt
	I7/PEoXv31zVDi1owXlAsR4HI7qPCC4f14vnM74SUSmo1IluyRRaZrOlOaE7GtrLoKeGHmPbk+f
	WBBxJzMndkNz9w5wZrNxSmbGONMkszPWchnOByufQAPIL/vwG824OsRtpSrNlPWTKg4DoeYSeZJ
	46sdeIhInWtZAE5auHzrkkJcezTjy2AV5CQZIuoPQR3mY08nmRR2N1yRS3Qbj4e6DXpIq1UtbZI
	tVwUWFo3VFA1UgVfprmfiVkvzM4XGxFL76/Kk4f2RFpFPmC2fvpiQoSQicGBQ1bJOLJQ+5kAMiQ
	BRAveIMBN2qutx79QcZ
X-Received: by 2002:a05:600c:a00d:b0:49f:ce73:7ab with SMTP id 5b1f17b1804b1-49fe6708b23mr50754095e9.34.1790258367671;
        Thu, 24 Sep 2026 06:59:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm15799213f8f.19.2026.09.24.06.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 06:59:27 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Joel Selvaraj <foss@joelselvaraj.com>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Linus Walleij <linusw@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 stable@vger.kernel.org
In-Reply-To: <20260908-ebbg-ft8719-fixups-v2-0-5454ae1f5581@ixit.cz>
References: <20260908-ebbg-ft8719-fixups-v2-0-5454ae1f5581@ixit.cz>
Subject: Re: [PATCH v2 0/3] Xiaomi Poco F1 (ebbg display variant) fixes
Message-Id: <179025836659.3234093.17562514637378483936.b4-ty@b4>
Date: Thu, 24 Sep 2026 15:59:26 +0200
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

On Tue, 08 Sep 2026 14:45:01 +0200, David Heidelberg wrote:
> Been broken in mainline for some time.

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/3] drm/panel: ebbg-ft8719: Set prepare_prev_first
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/4eeeac9d7c3600a6cae75b2a7bc9c5b67530923c
[2/3] drm/panel: ebbg-ft8719: Fix the MODULE_LICENSE() string
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b1885bd1c985999b8a5393f2e23eea8dde3109a9
[3/3] drm/panel: ebbg-ft8719: Split initialization into enable/disable fn
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/012dc8a8e5b6bca57ef7bb62d6015faff7690e0a

-- 
Neil


Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B980485CC3
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854474; cv=none; b=qRtwOdHj7ZNKqTii1jbKXcYohroOpNZ30VAX7L/Xs/JOD3edGYPgpZUx/uURhy08PunOvohuwfpTO+oqsLmN3V2pvffbJfDojaiDzrsy6Cjy6emTLDRiWsjmdszGEHkqMyYMK4YmlmeNmvyHskxYYgZA2IXHCyBazHAVskvOOnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854474; c=relaxed/simple;
	bh=3IQXMKl218PannBxAxFOsd0Xh9anJurCy6kfS6SMLEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ELqBdvj8r+sgqdFRYsBhUeorvTMdikdgnHE+TahCV/zFGFhKl/7omFiaz7JdKGzA7wr9gpb5kKOGT8sGrcOPwwtzOH0+yg+x5q4HGGc8P3dR1lkmKAmvabG/9ePEI+XvygTQvKGSsh81Dy3v2/4L14mJ1Aw7cKMLIZmTUbnQ/QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R21+E5Wy; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R21+E5Wy"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4957eefd361so349295e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854471; x=1788459271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3IQXMKl218PannBxAxFOsd0Xh9anJurCy6kfS6SMLEg=;
        b=R21+E5WyEQoxB/juiO9DsJieZ66V8ZelCzJxs/PAHeGj3VLfMIyGgdDtABGOWfacDt
         qB+M+qntgfPpQN1ITkQDAA1RIlPoBVXPvPTQr6Nz27MPrame/PXDi9ZfpRFd5P0qQoUE
         y6qdtFcAvnRNCriSIwDbBs4jqwsrnI3jwqaG6gULOlFZ0vukDN1zGfyjfaVXjle0Czng
         wplmxqcqfW/ys/eSY/mKGa4b67Urd3lDBIJxJPOL0zUXRRTdiAqeRJNr13Sc62wRTVaF
         MtAr7YroWJtsoL0lFYAbkfOZSzLUY01SQ1Ltfp7DI1/5Cefft2yImQJXFStNPpej75t6
         6c+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854471; x=1788459271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3IQXMKl218PannBxAxFOsd0Xh9anJurCy6kfS6SMLEg=;
        b=DWD7fS5B/X+d8XN3qOqSE7kdqgDHrONaZZUh/70QrxAHAwPUnmm/E2yzBe1UeCOz1Q
         strrcyY2kqo9fEbaW2nqz2Dlbhht7GVDXtIUrc6mCkEgQoZ7fgIEmfMvq6ckqFiICy9h
         xJ23Xg+Ne8Cy0udKc1AMN+kNDaY7CZZI4Vxu8ideIqnJqrHXN0JXFNbfD8uongDa4CGC
         JOCGmF+jGsxJtxBjbtAvNEsyeqX/lM5x0bEW6nXUb0ejK9w0i1AX1GL06vInwwcHP4AD
         AEDFconOSyRS1hDuXiXf9z60r4NYX12TMoh1cEboc5F8bphb2/VI7RT91unNedlSE3jC
         uqSg==
X-Forwarded-Encrypted: i=1; AHgh+RonVx6vqP2WNdR/E1vgazJHaHbWxrOtNL2Ao1aWfA6dK5/45rDo4Yhc5dsxMEfS21CRZYxweGRVONuuyO8=@vger.kernel.org
X-Gm-Message-State: AFuF++l47M+9lyEepPN2AO1U3wblXwwKIGy4xxNNFgDmi3e8IaZa1o8v
	I/8g1PnBfg+Enkng6HfyjEpEf9C77P2p45qJPAq1ozKhB5mb3TAxN8em
X-Gm-Gg: AR+sD119EVdAoCXrgl4t7MzP1HqzxYQtu/myGE/tpZNP4jhUldWjoybiBOuogUYJ7bR
	vPN9h3as8y5HxyX7t85gv1ur5IG7JoWuhMMAWsMt2grWobl2h4ezMxQzTLNAk+lZTbTUt2oN1vY
	dEOj4tVwjUL0XKjYpgvfph0+YEZNyoqrHll8xGckMAnViko/LBUkBN785vgCqe46x+Sf2C5tkUS
	v/8XPT3zXpSE2Sby4+nj/u5nU3uutogxGtPwPAmh4o784QZo13zTIAivtXRUh5f7SRM2qz22DGe
	1NfyUsolniM8SRYr8Ryd7FvXziQZwOuWcFw7oBQmRI9j1TRGmSisLtOGpk81ihT7TaojZj2UggW
	elgLU1PxxpEKREtOZjN0Rp96etT2dHa3fnbZBZ7+x38MNJrt0KJtP7epMxNGnlNSFBEEik8+w+g
	dNauxX8YHLqT3OexfZ9fwcq8t0241MrFN4HS7x4cOmyy3/AMDSO4XUlHrjS5IIGfOD7t/8SPKlx
	SlNsPLRRfaq4ZNxA+mbs2xkqDJvWeJjVjlHSFCW0WDXyvl22xe+K5U=
X-Received: by 2002:a05:600c:8b42:b0:496:c93d:e2f with SMTP id 5b1f17b1804b1-49b91c57d64mr11486265e9.15.1787854471407;
        Thu, 27 Aug 2026 11:14:31 -0700 (PDT)
Received: from 1Z10 ([78.213.170.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4942366asm65174905e9.3.2026.08.27.11.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:14:30 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Yauhen Kharuzhy <jekhor@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: Re: [PATCH v4 1/2] ASoC: Intel: Add Cherry Trail RT5677 machine driver
Date: Thu, 27 Aug 2026 20:14:28 +0200
Message-ID: <20260827181428.2424693-1-mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <901421b8-6e7b-404a-ba67-10c3166911f9@sirena.org.uk>
References: <901421b8-6e7b-404a-ba67-10c3166911f9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thank you. Both points are fixed in v5.

The trailers are now one contiguous block with the Co-developed-by directly
followed by the corresponding Signed-off-by. The codec fixup now clears the
SNDRV_PCM_HW_PARAM_FORMAT mask before calling params_set_format() for S24_LE.

Maurizio

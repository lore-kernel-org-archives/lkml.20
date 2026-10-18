Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346A4D4884
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792360614; cv=none; b=nQMCCK44DjxvpCBBE7VedZMRbre6zClHRlPrMjs7Hc5ksXmKk7d+6p5KJPjsjYiqQQHEOWFq7dVpTg1oSPX5eLJW2+O4RfSXE7414sJWq4TEty7F1n0TLJTWnxdVwmhNC2e1PNZ/PTaywhxcg6Y6pGbIDuEPhA79YO5Qb9ZCFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792360614; c=relaxed/simple;
	bh=GPuST2lg0n0E0s++DBETZe7atvtvRXP9mMNzFPHYaTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pAXhMFrziVZCvDPaD/fCLOWA/nHVNMyY+3at+zce+OJdpebERphrBkfPSRQNj8cqNI1j2Vph7LcC+e3NXbvTQpPjUrIo/ufcP1hzeAaYEVzvTZRJyMIXIVuKNmncy547c0nmsDkwdjHbE1LmqpqjX6pbKmi+K/RbXXfM1ssxN2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkuZ9Q/5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkuZ9Q/5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1dfd49525so6969125e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792360610; x=1792965410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GPuST2lg0n0E0s++DBETZe7atvtvRXP9mMNzFPHYaTs=;
        b=dkuZ9Q/5Ru9bka7HA3KLJEWF1aipaZIimkgOkFJAHjH3/wRansfkWLXR+GfG6o2faA
         gCBad3VKmOXsdjqj4Cyn1Yp2BjDUynf2fBU5TWQGf8YY45MJeXmJqbduXQ7vkWzVdwe9
         /eOZSB/E6iYJLNdvHpSK5zagER5QSOGnhftVvZUnE/0UsBoyX07A53aaOUjxes7mtqzO
         LNo908+YVCyRSGtkPeT1H1WfY6XZxuz7+04u1mow0sBwM2FxktdqZaLX7UPGaNbKU2x2
         Uqw4XlK7DKTKHF5tMH2f7UuCpKzKtRCNuafVCSzPVxZd/Xh8wC2VuzyRheZIB2fVlvUx
         LFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792360610; x=1792965410;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPuST2lg0n0E0s++DBETZe7atvtvRXP9mMNzFPHYaTs=;
        b=xZtNblSn8hbEixipWb76kBn1FgwgEjEDIp7VvnvQC721Mz0zF3xHw2vm7HqB3IsGRT
         aHO3Vp4RxRx+jadda5agcQlRSoP2R4C5S78K+/hi6sQ9ZJQuC+XU3tE6FgTlqplWtn23
         owfC+Xjh6GJvUVWh+E8GOXucEBIV2VyaUeLKBHOc9rLpFLFyjjRLKnhYpjhgIYYr5myX
         ve7aHLQSwW6G0rtbOrael9oEnpL2EZCNlY5MJdD2xdpt3DgRXrE0I3pjYbvq+NB5xIQa
         E46t8icQ9L9pc4oMRNDm6pWqzscf9Ed5rFDDrrzLPuTDJXj27Vj6mqOiwY59XXZeDuNA
         a5Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxtxTx8ry/mUCVVoFNX1qm/1uDe66E43RbSZz/X+1Xxxnxiavmxss3YpIL6HYxv2okFe2VevdzcjAyvGuM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSpFmlaY+jen/Spb6IbxxLcbXFmEqaZAclmk4kHINzwcxQUuFR
	hlE5D3S2Qn0iWWIxs6v3pJ1lDjrM773vOirJe79DfCBdQjL/f17XrR6J
X-Gm-Gg: AYBFou2qqGRJXStub7XEEVf02zSIPCuyUZSDsi0zZQT9onWz06Nntk4frqlVX2C84Xo
	bdHpI3gvbAQNT5wvIXEGCIJwmYCme8ppc57FztXtAH14AOLe7Vszeas9VAaXsmlfSuwQRtaUbua
	9MvozLbOBH6d6e7qOGAJS88DQgatEo57nGQhReFYm9kJHssRh5EnJVP96mEp2DpcflYGJVNHZ6u
	3azlhOIcqA29IJPV6lYab6pkMSvRKyj/hrBAD8hUBYp2aLAQP9A12cFa+W/XqNrQPnYvz4MIYTQ
	O8rKDm3xEXU317Cn2Mi/fdVgHzOh8hBGyJPenbJe02mcuJryByUah/Z7piXXu639qZ+4qDCRyJ0
	dfrimePQvamUKjdzXHa9LJU3xpJqMCJAzDH6hUdAiBT3WynXKSMMbpt55XVM+IsdwLZMqm/65Xy
	nnaKjzb2+uPgZycFUi1riv7Um7cC5hHeiytZ3ejHUEtG9IQGis9J9xUNCAPFx4X16zXhC8Cfigr
	PHhAGvydyQ1OJo5Bw1S7yRkUacLPFQJeY8eIhyeOvAaYBi0xvrGgIt+gLe7ipK0UkNEOpyH5f5F
	Uz0JUaTO8hE=
X-Received: by 2002:a05:600c:190e:b0:4a1:90d7:88a8 with SMTP id 5b1f17b1804b1-4a1d76106c0mr131795365e9.25.1792360609943;
        Sun, 18 Oct 2026 14:56:49 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd91c55bsm278449055e9.0.2026.10.18.14.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 14:56:49 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: sashiko-bot@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: keep vblank enabled when entering self refresh
Date: Sun, 18 Oct 2026 21:56:48 +0000
Message-ID: <20261018215648.1329624-1-ramonjesusmiranda@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-176261@kernel.org>
References: <sashiko-outbox-176261@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the review. Both points look right to me: the self refresh
exit path in dpu_crtc_disable() returns early without
drm_crtc_vblank_off(), and with vblank_disable_immediate the vblank
worker can end up touching DPU interrupt registers after the last
runtime PM reference is gone.

Please consider this patch withdrawn. I will look at keeping the vblank
IRQ path consistent with the self refresh entry/exit (and the runtime PM
reference) and send a v2 if I get it right.

Thanks,
Ramón

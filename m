Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CEF44607B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753229; cv=none; b=lxz+eyqti44XlHeh7Sof4/LWlRIHo9ue4FQPyX7kJ+3kaOgWnkkbboNKKgzz7PGpaddfmuOw4pfbJNw1O8x8qqtscQuf8+w8qrL47zBb+BRnA7CT2ssBkswIZge/fv1ios8ZNbnIT5wabsG2jiQN47TnJgJ5oN23G9LjCx2b2xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753229; c=relaxed/simple;
	bh=bHLJL5B7MvFZaFWnj48RHwfjVHKRLYwyTAtbbTpBQb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxPQ+YjdXbdgXRLNQ/zi8H7bbUJWLttss54xFDASrnDWg2bSxWIMClD8VWGzJkwqWEPSjVShC4IFGRHj22NL0BFIcgrWdXzap+PnE9fMNuqiRkGlN/HoJaD9I+UAbMtVlW6LOqzE0CpLTwIHpQzCpqQkaYLApLJQGbuMWh33W2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6MIp9yy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6MIp9yy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso31006665e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753226; x=1791358026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLFV8VQJPR2EUGQBE7Yw6RyHTydVlS4Yy5dyO7hAtvE=;
        b=X6MIp9yyhRT3nGwHx/kYX/95zOAXUmKE8dTu0HLU/nM2qTBzc66/tMXyxBJTgGPMQG
         U89qSev34cPMN+jEpWgd+X6QC0qAVEymLM3tgTkQayR8F55g6m0oXMi63W314ii6OnNV
         OL0S9Pq90SxWgFxSE2O1vfOGX83JOjOcqQD7/esvlpVdNLTmjvDzMOLnxK3WU0Id7Xzj
         qwd3sadZQbJ8ZpFXvCWmwRyxCetpzFwgmTw3bacxFEsCPY4naydMXoy44HhLccyzV0Kd
         wvfOcSKEwcJOFK4EQYHe/oHu710G7kALi1QLTScHjFQFcxw2Pm2aPTOscPldNBVyV7Br
         e1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753226; x=1791358026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLFV8VQJPR2EUGQBE7Yw6RyHTydVlS4Yy5dyO7hAtvE=;
        b=qQNkaFYGQHvYub7lu8vKepPYxorj5BjMiAP/unqfwMz0YaojdVegggKEcrnN+hXc93
         ctafQQus19DlWH1JBipkGlmqhJce0sAzr8HuCLmdtWyPjmDrjGMnJl5WfPImeqFO/fAA
         T1WKYQAom3npHlLYHG1dM+R2WMflmreWy2WPNq5hFaDZ7lmxyqhyA7qmU1J0DkKlIJxA
         fRDAdV9lAeRZ3k9924H0U9u9S+HWkNTevD79YLQEcjCRZC9CvMjX1Y7kyIa6+dKdEyXE
         N+V1EKd1LJhD22ZYq1V9DkzaS4tBLM+L9M4oIeqDvLQdrRY+jEtqUfNWgJh4EgkJtbjK
         Yy+A==
X-Forwarded-Encrypted: i=1; AKwUvBwqS8gXbJJJYt84J40u/Lfs+cfRabY7ysTSkuYihvNgI29+8GrAYpYIF4vEgYzB1ewE/O73rHKzeWHDknM=@vger.kernel.org
X-Gm-Message-State: AFuF++mM9BcqQv+ECYL/I8jXW1lOjhpPNYp2GpelCTD3fZtufFT67rDv
	o3+4asfu16WjBsPE6Z15GSYVG/FfleuCpmuLh+Pmsn2XBFysDbFVzTPc8BXfMA==
X-Gm-Gg: AYBFou2D9ygreFdutcrzhdpmuMg67RMiBI2HRISLkjlnECG5CCROuBZY5Tpki3RumvI
	sCPrCqABxwkeXBJSBf1AAUnHulwyt9d//litb+XzlkBPGa/bgSMnVoeKUEPoK90Fv0c8ffNbaIJ
	9LtgJWkjAWzQiduCVr3nIlAdfugjBZr+yieHcka0lsXOgIQ7VuNMX2CgH1DaQZulq92wVqtM7dg
	cD0aL53qcxkSk5GjXrNq+24LpXd/CyBaB3BEGtB1KUsbERkS7X5kY9u7ecfw3SZu7ZIRCX+pT9h
	DvF7nCuNPfYPrLiw0wvCOwHr1nL+PCzspKW0fVqqhYPY6I2Dr+moQzGd3fFSGAeyw3rUSITKQZT
	crQAc3k9ObmUAuYcx0/RiF3nU3Uc+Y5TliiHId7r6VPCi2iQKx8R/V7U9u/Z5QtUFZRUlQEtCC0
	jaLSfOQCxdwPpL/3nYMJkbh1Nm/Wb7dLHreQfkbXW+IM62PDZuLxTNT6jBlNPXrEHNvCfyU8iJO
	I6t
X-Received: by 2002:a05:600c:46cf:b0:49f:e4ca:e1d with SMTP id 5b1f17b1804b1-4a01b115536mr6566685e9.27.1790753225797;
        Wed, 30 Sep 2026 00:27:05 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017504518sm32000775e9.13.2026.09.30.00.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:27:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next 2/2] wifi: rtw88: support channel switch in AP mode
Date: Wed, 30 Sep 2026 09:27:04 +0200
Message-ID: <20260930072704.1981414-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <bef3467b008b4bc790ae2baedc1f4625@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-09-30 Ping-Ke Shih wrote:
> No need to mention rtw89, which you have mentioned in cover letter.

Dropped in v2.

> > +       rtwvif->rtwdev = rtwdev;
>
> Move to be first statement of this function followed by a blank line.

Both this and the INIT_DELAYED_WORK() are gone in v2: the work is now a
single wiphy_delayed_work in struct rtw_dev, initialised in
rtw_core_init(), so add_interface no longer touches it and a hw restart
cannot re-init an armed work.

Best regards,
Mehmet

Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE99136AB54
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755057; cv=none; b=abX0nSzacp4PUUOha+o2hcq2U5MYCUG3R8YnWkBHFtWUU4raW1keU0iJtkinSdKYHxvZC5k8doltpFp7zW5jEQ0SdOzmfzJXuDDhHkfHBtAih/2yB8IH8QDH43kmf4q8odej2U87W6+oy7I0ORTvKB65hw2jFXCgIdRjSd0Dlas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755057; c=relaxed/simple;
	bh=dx4jmsLn1OzsTtFdudK1GzV5cgpBf4/PwaAcMa9tz1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CBiKJfsUesU0cLIIAnyL/WaAlFmjoPj9gWgiMJs6xYR/22A0rhdkoNM3CW+husJ8AzCsuLvNI36/1KL74DOKPYjkfqnGsiXtbiG2E62eKrC3V+MCM5W83nAp9bT9uRnoEdao1dgOrzNpUjsDnTjZwHSiY7nJXEiTqcEm+u8kNeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwEDK2Kv; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwEDK2Kv"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so2516081a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755055; x=1789359855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBu2LuPpjoahvMmaWEwQMcGkzlxXBLBPYT/w4A9fsYA=;
        b=VwEDK2Kv+YQEWLukrJybxS2diyG45ahAdS3yV9JXKmQxAyu7SSnzh67qrdgROMBzMR
         Uxs/1RNIic9nQ7JXU3KJq2poSwls3eZSX+RuIzbp3rXsVKQxU+QQ3n9IOw0dMK8wICBt
         AVruqnlz/r1umhJD+WmJ733uyqrYNK5Fa0FX1Cmij5y3VgmVDc81qSc1O2eqnZ5jUUsW
         +BHxvkqGTJn+QJfxQcw5+YXCoIiHZiCSVgDgqkj1t3sXWUEVG0n2BV/8pGISr+TRw/jf
         mzZdfwQKzGLTlzZnQgcpgaElfkX+bWw3PYCq0jgK15EZ9/6gjwy1U9SEtJTo3pMS1O+M
         M3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755055; x=1789359855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fBu2LuPpjoahvMmaWEwQMcGkzlxXBLBPYT/w4A9fsYA=;
        b=dHg+FO0kFveKuleLxS8xpddiE4TZFBpy+gg6EKhV9hm/pdRm6sF0mBP+JPBoo0P8yu
         r/T8ZrS/ZOv9YBza7h/f7Zlgi9dr/1NL1kCHG/eNJYfdiXlXaR7h1GZdJuTPa9wL7SP8
         DdZSQMEj9e9usZm6rUxyKaABFnQis1NG5aLvnvbzUDDmWRJmdD41A4u72ZSQbZxIoCh1
         A6fhpGyKrWw/lKDCyFL3D/7cCcrf4Plyyfb0k1aYi9bFfEVhAcUgV+q+Dsi69/US4dk9
         949A0fKRrd82qygNcxADqNtcNi/Hp2PtuRRni54eSymPb/n8CbrxDTeAcz1cat6qmQsz
         Tqnw==
X-Gm-Message-State: AFuF++lQPunI5/YkIahx/fXJrv/xHTnrr/1YZnRw1b4yHsV+eMy5k4Rp
	ZXZYCfbZoK9+ILtPzHvxLjjpnMuy3AIMuKCxY03Mnm8fCeV0Uj5G2gg0
X-Gm-Gg: AYBFou1nrY2tVjTsmSezUx0VfxOsrvASq0vzOGaJtvuxmI9/5VR1P1cKuiTJJ83lp1I
	sF27FvlBQeivTwbnCiKLlP7RpiHzr0lskCCAgh+nrD314kih9gEBAo9kFIOicxbOX6M5K+VQWb9
	g8plYAvmV5HrKSMeFn3NJQK2a8LDF2eAD9q/52Of4C28e3bgFBcLZeTSIbLNhBv1k2Hw8chJsKU
	nbL7IJ6OjqlPyzB1nlfUNdmvFiVh05qTbs7oDjmV1MC35gEY3eOUUBtMrfmgoYu0gQTbd4dxWLr
	hhYUjIAOucnosB2ONTcUZsMFoGNa469Mt0vEz1OCXM0OWaN1Fo6Cr2IQYT0ePbDw5i3gC7k8Hi6
	zlA22oZdr1iPscF4jXo1XMl6TyWIfBXh1UAAw6Mn+3buXonmwUCf1UO+io3BPWLhtbTNSA8mjMQ
	9de5D7ETGyrvHNILkX4BcszygTpvGINbzTJPJt7Zr0a4olxQ8pDtai+bFDv4dEs9eqKd1ytuosy
	zUGzAWDf65Zo/w=
X-Received: by 2002:a17:90b:39a7:b0:381:cef1:11ac with SMTP id 98e67ed59e1d1-39b26125efemr29120236a91.10.1788755054931;
        Sun, 06 Sep 2026 21:24:14 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm22629643eec.17.2026.09.06.21.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:24:14 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm: fix repeated words in comments
Date: Mon,  7 Sep 2026 09:54:00 +0530
Message-ID: <20260907042402.12893-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120430.17224-3-hemanth.selam@gmail.com>
References: <20260904120430.17224-3-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks all for looking, and point taken on the churn - I am dropping this
series and will not resend it.

One correction worth recording before I do, because it is a mistake rather
than a matter of taste:

  drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
    "Add a view and the surface it's pointing to to the validation list"

That is correct English.  "the surface it's pointing to" ends the clause
and "to the validation list" begins the next; my patch deleted a word that
the sentence needs.

Natalie is also right that the dmem hunk is already fixed by 23df2e995df85
in drm-misc-next.

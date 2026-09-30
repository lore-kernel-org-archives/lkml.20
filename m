Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C264FE2C9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782469; cv=none; b=P+coaPamziHe9qgT99AC4L9b9Z5jsqVpt/qONqPdhTCF0bl1z2tgoo3pcj5dB90oMCMcknKmmV6SPfwfNPootLyQW+bFZUjfTMPZSXSdotbOPCjEowQBZ5KFdURic4TttFPwB1ZrUcWNS+qhwjYtB4ur/jOL7YjLetK2P/AC8L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782469; c=relaxed/simple;
	bh=RFV4e8w44R9EEfvzAjYTzq77LpYMZclEZGehM0Ksk9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvYMBzlOpLIRsbtebIMnu3mNJdBjHt3MVO5XuweB75oWWD2cZfDx+Fq3GY0z7f/ssnVOdAoAV1Ro5CarCgQLki84zfdxp4bGEMRj1iHKaDr1fXmZzGPy037uMXWj1YcnKTB+Vors6ArgyXQrABr1/HbHNjH1w2I5Exq74gynPaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tCoPtEIz; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tCoPtEIz"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48b03ecc019so68877f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790782458; x=1791387258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFV4e8w44R9EEfvzAjYTzq77LpYMZclEZGehM0Ksk9k=;
        b=tCoPtEIz3mI/9s8IAo8qSQsHCTUUBRflS0U8vwcgPH2JmxxtrEDHxuuaoZrTDXuqPS
         XwZADs1G85k1CGVBlGdmFE1y3b5PHZXvqRwfSS1gk6W94Pa0tpQrJPv53VW9GKsFT5Af
         z3iHsIvr64S3D/AeqgUQjg1cSjUXPTiJjZa8U/E8V3D6wTjsikEEGrutnYgMRj7V5YPb
         FgP7pTiKHYP0+2JvpzaqDH/ijxijAMUkyEg5a4dL/GzB8eKpTN+e63LNb+4Frl/T6K9y
         jTXSSs2UW5dpTm09cuB0R4Vjsrno83dQWIp2dZpfMYVYU8RTsSe7tp/hgThPNzNzAXTW
         202w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782458; x=1791387258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFV4e8w44R9EEfvzAjYTzq77LpYMZclEZGehM0Ksk9k=;
        b=D292AgrbtwxUnUVwT2y0JVsPyvZpz8eBoKk+JRxBmMlwoQLmr9b05UNbywDAVvcHV4
         bIMuPIh0ny0Ms6cxuJYPR1WnE6n+AfW/+xmUWWDYsjZJ2Xq6gdJP1hXF2y+442EMHW24
         hUUMuTyR7ov4j5czNs0Ks029MY3ksJlxRUkFsnUxKo8l5Z3DPzlrKHjIucnhyb0qDAGH
         ws8gVl2I12diwkiRDdylb14r+hZ3Xl5L5olZ0W6DN7grG2kVjX+uQL7KDN4AcgOGOCPj
         V/8REcD3/jmUyVMGWFZ+ywX/14/wofvE6wdVRNhwadrT3scUXhZnJE5awuZ5P/gx/o3K
         EMcA==
X-Forwarded-Encrypted: i=1; AKwUvByUbylpgBeK2djcZv5urCfpToKbTIGbK0yAQ13//LAqCsiPqt+GGtu3BXGI7hqE4X0CqiHKmhZJbJNYORw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJTVmMbjQRQsP+68bEmCCToIg2a1X78kMIDtyfHZKK5LOs15O7O
	z3xgJQt+kfvVa5VUT29BkWHzYQiezpNk5ezWcKmxY1JJcKYQ9oDG8prx
X-Gm-Gg: AYBFou1cfjs5bUdEKQOSUoiOj5uZ4v1UEqVuejg3u2U7Nuzm6NIbTh0aiW5is59LTuF
	XV4ZwTwTpQjWrAonv8o/jcdjHdP7cVR89Y+m0YYnOGVg19RkoUJdg8fBgpjc5IHdB9k1hEJQEVL
	PM4wuqJ4SsvT6mgyBpwtmSpiV5ztF+43IB6RhLMpiQ/5VNU10ap5rQAzueP5JgOaspbZkEpTlYY
	TWupwc8ylfjuyyb8i8q0y65GYmeeRVfg0Yy3VuGnYdl1MlVriEn8xcNh3H38OTi4xqvXSHzPQ83
	7vUYkrLy1a+DaUWcH/A7FrDj8gcQxKdh6RHH1DpDnOpMeIb5EoHSAhUwgPE0NgTL8oBw+ir/Mt5
	dK62j/a281SoUOQiO0yvdQEwKjklJ04i6CvQL3eH1Y0IvW+ccjGfFV/4FQ0zCf9F4ilF00awGGP
	w/mSkVWmCzd2AW9a2/A0ZclsV8BAkZ7LX1+UoAIIqxj+ZxHqD49RKcP79Aov3+8JrWuV4bxI8Kt
	LpcBRCRiKjVT3KCNioS
X-Received: by 2002:a5d:5f83:0:b0:488:85c9:120b with SMTP id ffacd0b85a97d-48b024c5a76mr3382476f8f.3.1790782458127;
        Wed, 30 Sep 2026 08:34:18 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02a0dd0dsm3972005f8f.35.2026.09.30.08.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:34:17 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Subject: Re: [PATCH 2/2] sched/eevdf: Keep expired protection expired across reweighting
Date: Wed, 30 Sep 2026 18:34:15 +0300
Message-ID: <20260930153415.214768-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com>
References: <e4700a93-ebd5-4c7e-88b5-d606437a13c0@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Thanks, looks legit to me and I did a quick rt-app + trace analysis to confirm.
> I'll fold that in with you as a reporter if you don't mind.

Yeah, I'll won't :-).



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745595;
	b=zvqs81OxhvYHMoNkc0BBgpBNBWDZhNoHgz/2OlBTkILMoGAWPMGtJuAmbhhiHo7LZqOV
	 lvi9sEIvQUpbokivuk25q9Q7/EO0QT5ZjPESreyPQp7mxdnZ3CSoGDM9sA1cuP9oXb40h
	 FkN4yUQRivCNNqWJiufBPtKSvRTa92gaX3wWDX1M27ZV3g9GaCnq2niiyht37iGD46E6h
	 sa/2aq8FNMeJwxARhAjsnFjYJGmzQgjrrfzvhMXIZ4cGXFBkoai377So6lPQY6jeGYxIJ
	 2pIRMtc3eMTk63bbMRTusDGMQrOQ/0ZVT9reQ488+NOPaN3tu+zvqo4dSmJvQam5srA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hkasm7w43b+dUY5l9LtRYckjAHHkeZc9T5ParUJyZ88=;
	b=e6eFZ+0WEPrgZ75ouQ59J+47m9vCE5TccYbRiXgB+1JCmOKLbf4rAKPW400wriKRB7SU
	 xyM/GZXi9LsDAGe17UzbkD554PX3mRd4483KTAzBI+iTDfwv8cnEhHNQ4VqjSAkmtl41w
	 caWNmHuw9QQLASy1xFwjT057JwJ3tZgWNQnfRSzeQbJVyRPv2l0ESbTsPvsN0E4SvdrcC
	 wQPaEtZwXCEedfd3OpsmlCD8rHVZdd8pCgA+tx4Ocf8LA8aPEjw4fVKn+N/gvphcuYmGJ
	 HIn1GlUGI1qNPzUt1m8YZrkAyfDgFfaMGq65a8RdGfqIFk9HJRd/F11EwPIH8OG0Ckw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t9+0qfDC;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0A606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCA0A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=t9+0qfDC
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so105450a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1793745594; x=1794350394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hkasm7w43b+dUY5l9LtRYckjAHHkeZc9T5ParUJyZ88=;
        b=t9+0qfDCYwLylSmVAKRemuYBtlBZtSEc+OwR8egCGuHW44FrD9qGXupxIVP2sK5RcK
         gmHttwu2rBCZKtFtMJrm9PyA6fBRymv4FsKNKVc1zw+XE1ZUKC1PcXjm3fKuNeKOoVTr
         t8HiFndykiCtgEK/lMZajxktnukuNLVgoXXVfg4jQFKtczvWw+/pOYmokImYksBc/ITd
         x0k/nEIdiKco/iaIxoJ0jb2mZ8ry7s/ssMr9cql7NhE7XIaIsRq0H5la4a8ii+DwXAcK
         WaytQ+JGfu5tiiZ8chSCPiCUMyp8RHuwuHwEn1Ww7Jrz8LGwFQMtspL29OMRaeuMMglF
         m5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745594; x=1794350394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hkasm7w43b+dUY5l9LtRYckjAHHkeZc9T5ParUJyZ88=;
        b=iMEuPJIGy08I+8YUr7lHyA+RyRU47lLR2ZJXrf5knHay5ghztkjSkuQ4mRrKdXhvv/
         xo8eOtm05swu11Q45iqObHHFHk3pEyEbaM2O7Mn2wyRtXebk6Vz24VnvLev6wUMrRXR8
         nZLW38uqltP2CSLV/7qaUXdcfuFX+Pts4pGu2C12CFngWC2FsOnHvlUs2pCW/ChG+KLh
         SiOUI4LQOhnCp5DMwUQ4YUhEZkqZRwYpgAlaxxLghzE+EZqCSXP+FG9J0ZUionNybbWO
         5YDmQoaKRUthM0E9C+cLGHwBI8YFCkKt09joKCNl1cKSZZvJjtnnMTxoEiKdAB6djq4X
         lPQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuoONmnumgvCyU1naFWwyDocE9FZcaFBEo3X6+evrBNt/F41ikfRAEqPItmrv805oNW+KRIWZZsbebFh4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M9Njqvev6p4xnA6qHiKl39/sIgJNngXjQvV+eCvI44axS6/Z5
	+buMTJsZb+mUFdUxzWxgjl4xd0onJiFXfhxiKOu0F9OqZ0Xi18EHZs8K9yNtSsHRt/k=
X-Gm-Gg: AYBFou1ZYSIoIqf2aV45EmifSC/WMUtyJCZgdOc+uahLTI++9kSGD+yUFOXmWdk8BuD
	/2w8sDChnSEgvLOIJrpIgbcJ1guPGKFuuT8aFMPDHi03cyRdgSgy//f7tt8PQ9Qlx5r3Cq1pdw+
	N0pbYuoL7ohJOB0bJHkRdEWYvFfp3DzIXTOZhKbu8ya8Toace6IMrngcht7QtCE4qRhMdDaIkY8
	Q/OeefL2usxdbBXzL36VqQAFtgyykdpIxfvBFnkE5o5VZwjax0O9WOKD2F1PvGyqCVn++FZCJ8y
	/nQtxQPHVDzX/t34yDVR2a207JmNRigPAK+v72hsF3QShL118aPBH88eSt5p5+aT9Pv/Xi/fzYp
	ak5xsWYPMRqGAjYQGGvaqkifs8sX5BWw7TDvXfWvtLMRzf28DO86SdOPF7SKJs/kLzFtymbTAhi
	whL1iz8ZChVu+Y0BobsPGC1DuKbmIEi1GpQ1TRvS+7B4SHhmpGqHHbRSFRs+beLWUrBX5Susj3A
	QEuAm1O25FsuRdVt3S0X8leauTAcSLohtcEr3mKea0IM4BMdL2aVy6Yba81vaCr9MEAksqxCQGw
	5CW+4a7BqZ1xrE2lQZoxWWKi/GItTPBPUlG14GlWzIKU+nTbWdgCPinGU+s+ZSDs9OMGnnte/Gd
	0DU6JTphgnO8rG147bYbTeTevY94JrVztZHPe
X-Received: by 2002:a17:90b:1844:b0:3ac:9c37:9429 with SMTP id 98e67ed59e1d1-3ae89838746mr11403550a91.52.1793745594421;
        Tue, 03 Nov 2026 14:39:54 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:744:cf40:a7b2:e78f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0944a0ff7sm886691a91.10.2026.11.03.14.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:39:53 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Sagi Grimberg <sagi@grimberg.me>,
	Max Gurtovoy <mgurtovoy@nvidia.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Christie <michael.christie@oracle.com>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH v5 0/5] IB/isert: fix the device removal use-after-free
Date: Wed,  4 Nov 2026 07:39:45 +0900
Message-ID: <20261103223945.1697775-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103125955.1530355-1-yhlee@isslab.korea.ac.kr>
References: <20261103125955.1530355-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is superseded by v6:

  https://lore.kernel.org/r/20261103223802.1697607-1-yhlee@isslab.korea.ac.kr

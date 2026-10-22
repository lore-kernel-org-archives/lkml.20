Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792692962;
	b=nNMSsz800zinMDFVfi/4dhglzDhI3u5mWw+ZAJi7uXcVj/uDK/gKJdusaAZwcfF09/OY
	 ol7hEKUaHkH4PAhdbjaAWVt/1t+LymacuwOtkmfelNYSeJu75C5JpUCLRpS1UeAangRB6
	 yBxSMSvWSjVp7a0y+z/LKyvoxO5IJkAJP/cEw47zOa9SSHX4zY/VJs9+YeTuXoc92xGM0
	 0HFdrP9a92CbDSBz4WNfnu3fJjNc+kD6o+FFYrBYWu1EQxInntksDO4kgSxPFNAVKldFR
	 KsMQdPi+1zwPF1HJP8Jju0tJK5t+vFXYmL8dTLb2m1Mgxawv5+GvgfFjMnDAE48APLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792692962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=lV5YdQZY6ugatSUWQ2s6iPsnMBrzghU6pgYdBb3t1UU=;
	b=FeyXkgYdoJqUEv1DMrl+0O4etQHeOQafU3eIk80lPRi3iqs7LmuqIaZd+S18QM7CrRTM
	 /5yo+aGWA0kNYC2GEWsHR5zAkiM9c6K7OJFH+DBMgprtwaXNmE4FSyp9Qa6B0f1lU07zG
	 ClKhrf0ycYnUGLguGebR7zExhfwxXqh05KJH+Bnvvmp3GA/YoXjFn3i423k8k98P2d1ba
	 Ef+se2hM2g6MzQACeskLf+nSD37Vx1v4Yyqh+3SXNNeUnwp/4r4OQD+xCR+OLjtu662+u
	 bJ0oRtYVG7n5zvawz/TOQxQeT9BtEX1VnvZn4A5T3qy9cBP+H10DoJ6ysz9R9qOTkgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SUC15hpL;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8D2606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:16:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8D2606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=SUC15hpL
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a01cac8733so114052b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792692960; x=1793297760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lV5YdQZY6ugatSUWQ2s6iPsnMBrzghU6pgYdBb3t1UU=;
        b=SUC15hpLmjAXHuU+ZW/v4EzAW0sUvPzV+xIGiD58nZmal4dDIlWvOYNA+3V+j+Hm8h
         5FoNm0tce+a1YjeoYofPA5gjuUeBxDZoQf6c2pybde5UtZLACr+gmax3fLOsUNua+1qZ
         S+2hyNPEgKdPT6dXhNSKJdA4veGGHlBNAHW9+FhP5zwYTSPuEm6nvzUOy9NiITXw9c9+
         H1cgF6ANDxiexWMucb3BO417vNnQWExGtYxY4zQuv8Pdds59vP9c9WpqaMVK/a4/N/0b
         WIWa5k2nVWww0EzQMYliqwExN0IVzfoAfbPHOiJOX1JX+D70xEczmTfVKrlyqXJyjHxA
         XsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792692960; x=1793297760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lV5YdQZY6ugatSUWQ2s6iPsnMBrzghU6pgYdBb3t1UU=;
        b=uZ8bA282G7lsm/jwElGQmsdm8cVQoXbeqmB+sEb4f06wLblcl8HXHZj/6ik6ysM37h
         o7YUKe5ZpRvgiLVcQYEu6nTvKbB8aVH1hFwgpH2jMbj3gTyDZjYljQu304V7CPG76WSO
         GOEH2Jth+OnwLj2FO+byj4dNdTw1OSmPXPc27h73RBwttmKalsEgDCNQh7pKKTBYRVov
         J5nbDqFTyJPriLomWiih+v74Ug7uKqmRKxvpcJIl70atx0SllZGDgCGuXfmjCUNuQDhf
         78MIoDARBmEM5R3vxEj5G/z/jb3u/GfmyDnMAUKu71vryKER5PkjL4XdZYtCyXW043eG
         PhcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpdh4Z608OsKy+VdoKXCWup59QRCp3fYm9qL6GFA2FMGESHSAI+Y72oSx+COcwuiDzPsV6oeXIRF+AN50=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG3lrcy/kKq/fNEioLGNW/PII1ozTBiMXVYxPecHl3knFQ30IY
	gyVbl68n7wsQci8Id6Ks6wxYA+G/zEQOKuAD8+bDl6A/wu2qsp0QNGgRZZx87Yk1+xvEDbgt67F
	iEISs
X-Gm-Gg: AYBFou1t97IzgP1b8ms+hIkIt1uC+9okf79bpYNtFguK9nXqJV4exYv4aKmzBlXGdws
	y+ROF199exi/qSd0OsfCpW24jCnOyPmYdOFHZEabLgfgXwM2DCZf0q107IIM5Bxc/+bOFZLUoL1
	90YgN8DqC1ocHbdnRDbqnbYtSb9kQjUtnO3xvKm0Kl7OnlRruvhX+yT9NIA2/1YaMWutOiGpmLA
	StVvtJCXGgEUpeF9/ABipMgvFmotjF5JkRX35477G4MpwBZDDE3C9sQFykibY4+i+2qNsELbilT
	5Yp6rR2W4ORf3WrrwrUdiXmjZ1XrBJErnxn2IT2ZyE30RA+i6OZG4vSKbnCET97kAvr93QI67Nl
	x0WTBP1HZxz9j7Iapm25hlu1iclbePhxc8lRrlnO7l8iLku1PQI1lOfApEgEswlPuXzbutw1jk0
	ugM5TuC7p5NNcit14Ul9EpackYkrqCiwZiESQBRBXQ/Sk3sJI9yRBN+voZhfDr1RbZw8eun73eg
	KyEhtRPQYXWWyPovbCAB+KNzFyMVfozVbZcoAMjjMFtrgcABbuMkwp7IBIAOxgP0VSsKIK3WMZA
	zejsCGHi2Ieej/9pEvg=
X-Received: by 2002:a05:6a00:328a:b0:89f:450d:90f5 with SMTP id d2e1a72fcca58-8a089dc75admr5056028b3a.11.1792692960553;
        Thu, 22 Oct 2026 11:16:00 -0700 (PDT)
Received: from yhlee-960QFG.Davolink ([115.138.38.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a28e23ea52sm774370b3a.33.2026.10.22.11.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:15:59 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 2/2] RDMA/srpt: widen the indirect RDMA context counters
Date: Fri, 23 Oct 2026 03:15:52 +0900
Message-ID: <20261022181552.3002041-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022143901.2991062-3-yhlee@isslab.korea.ac.kr>
References: <20261022143901.2991062-3-yhlee@isslab.korea.ac.kr>
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

The values are counts and never negative, so an unsigned type fits. I
used int because rdma_rw_ctx_init() returns int and the sum is guarded by
WARN_ON(ioctx->n_rdma <= 0) in srpt_rdma_read_done(), a signed test, so
int kept the surrounding code unchanged. I am happy to make both unsigned
int and turn that test into == 0 if you prefer.

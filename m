Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810946;
	b=BjCh17yV+9dRSjHrLC7/YMgdKcl2555XSoiidtCfW52aoakxwUaXvmOsZMZ6+cxnMyj/
	 VcP5Z5TlBOXPgeSdiW3O30N3FyEOSyL8oq2kNbEAmazlrG7mv1rhfGcCz+uEca2VjOkHy
	 k+WNEFMueA/1npeumJXlgDuQyvzKVCrvkjL/WyWs5RMoM3N3toULgbuzIvnn7z8YqobGP
	 sZopRhxfQKznt969ri6s6qQuSrWbgSz9xWyFWFVGtA0TlXtNxn1gUoxOUTzRca1xuuMql
	 0HaqehUuZFIJQq9iDioZKY4lHM265V6ROmoXSLOVVFIs3KN0HnHhGt4j1v4//F0JJug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a1b5LqRY8mdvBUKXOEQXg0mPK4S5xc8s9ZkWSNVbjB8=;
	b=veXOi3GSFh+8QpBM/ds0boW4SlzEDSNgP9cNZFlgyCNV+NYSq6+Jb3NY0MnFTToH0Cmc
	 ACd8pCKWAHBVO7sX51WErjF/6LDFnwgWK+Qgt7w+v4pE2FWpvZ1FwxeBM4QU4PYolmtb7
	 /9Szx7XPrG/vO9UfYZECm/YNCFVqlIRfQa94VCzJKOY1PDFx+dSoMDAdxZwzKn7YkOowR
	 uwI5dPiQjWeyW4zGkrkDdj3ye2aa0zP+0OYlNWkOe7eFLhuF4Ei2EfkwQbX8jTm13hFlQ
	 vNgq4lk4neW3tK9qF0vLdtIbuUdpFdzXhphPZgnXu+Jd6UqW4Y4ahV4SCrJL+wXCtFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3kxhTVu;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C588560A2620
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C588560A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=W3kxhTVu
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6dd7070699eso1054736eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810945; x=1793415745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1b5LqRY8mdvBUKXOEQXg0mPK4S5xc8s9ZkWSNVbjB8=;
        b=W3kxhTVuQ+8cLf6rhlqLOrYzMcLaBl8I6Dag0J4MjPvsfpUc9TzSZxPf66HrcYBPcx
         UoYI/Bz8LC6fRbrkUcS/lhAjs2EAWt5n6AgJGiztosBqlhc+/ySrm1ZWyyqGqhr9fb5O
         +lHz/tlj6SJ/1pFAlZV8aoqB/l8ZIfMa2QpbyDqTiSLAcH6EGdgA1VXviQRRiDsXrWyk
         jgFx+hP7LF+kRN5k7lVimwFt+20nuEV5PIyFUPPZmp5umDg6QSQqvFyjB5+MXyAcbLhN
         K2DlKrvrzqFBVdQkG1boYm7RShhXEh6w717TtNYkYhAC61oq4tgYj233iT+LzTZ19MI5
         3dRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810945; x=1793415745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a1b5LqRY8mdvBUKXOEQXg0mPK4S5xc8s9ZkWSNVbjB8=;
        b=Jun2RVyK4rOS/IM/OroYe+1jOPW2ptUisVDCgG9vjdXoN1K+xqlP100uPNkq+QJUtI
         sFX13GsXYc1juq/RSSU3ANOoGLdDtFJbb2q4q4VdSbKFVusoTwfm6nWeoSITlEj0CgzI
         SRMQRgBp8NI11aB9iu2K2af7wdb6/KvrO72YnjJXUdyM+ak6wpiosmKdCwufEq1aw13Q
         8JXmF16caO7Y7YOOz3hGOlPdlYbh3EifOnhUc10rSybqXTSYFbbeMhb2gWC/HlVxd7+A
         SLD51MF8e3JD6oXp4UaWrJBSqyyjhjxBLqw44TNnN/gZy44D5VaY21jR1q04qmvYVEiU
         kAxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJuAWP4souMS1sb+oZzECvX44xBnbuxADln2pQNJwvC46GNsCpv29xOVp2voWoCa45ioaqkcClkrBtuNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJT67rDRtLq6dRu+dllJpa+guAmhN4DcGXd5P+RuwbOrO2iJ2zy
	SZVe3rL43bTlOqchckW6JYOTTjNGX5msWqiSpxGwkyC9QXYOMZp7WTkF
X-Gm-Gg: AYBFou0ZbGcu6mHZ8FQs45et2AngEx93YYFV9WUGck8Smx2WkaRn9fqI+JGdnr/4Vxu
	iLQiYQTSdQytvjYr3+/9ae23pN4GuY8Rfkn8TuSxI08cS89JLJA5IJpbyehB3S52DkW1hlKhGhk
	+LXM8eD53oNoUfgnTv/vesOBLpluzBQ0/cbM52arPqzDzPhY41wprWIszCUE9RmQjBIxvwZ5xdM
	0AdlcvttwDD54vIRGULO2Ca5V6KiXdV3DtaEsJZqoFgZHL9kDi1T2MxFOR91gJEvVIBEuvMmY3c
	VUoqus8+aU4qSUnUPuzLKWpL/RRAvA/fDh0E/LX7fRMakw4UgSyv0hCR8LiycNJ0gfIWAuoKZJN
	Qe3aYxhKqmbOs6F1mFvGjA5CH5U2mqraasO1BQwVbM5fH2wjbMK88n3tC87h8tTJM2185JF3dGu
	iKFubXwtTuwkiViHw8p5fwxOmT0yal3cqqSxic7VCjoTBXixTZgirw7NU+0k0LYksq7IHBszdMC
	QBy3McrPjNBYnqEYNIo/yLL7rpuoCqRUMswfQuYTPBn3td4m4YsDHlvuMD53CANtlZF8Nw0kbTc
	x7N5gA==
X-Received: by 2002:a05:6820:1627:b0:705:cb2d:e0d7 with SMTP id 006d021491bc7-70ba0d9eeb5mr369148eaf.26.1792810944770;
        Fri, 23 Oct 2026 20:02:24 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:24 -0700 (PDT)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
	Mahadevan P <mahadevan.p@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v5 03/11] phy: qualcomm: qmp-combo: Update link rate specific DP PHY tables
Date: Fri, 23 Oct 2026 22:01:28 -0500
Message-ID: <20261024030142.13643-5-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-3-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-3-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:20 +0530, Nabige Aala wrote:
> Update DP PHY initialization tables for all link rates (RBR, HBR,
> HBR2, HBR3) with corrected VCO calibration codes, lock compare
> values, SSC step sizes, clock forward config, and bias enable
> settings for proper PLL programming across different data rates.
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)

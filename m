Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810954;
	b=QfiN44MDYhWIGAxx7cFAeqc70+SEzGSd7yfsXpmOntXZRK0RyMrjpJHswIMSJx+uDPUm
	 pUvL+DUo3x9qsZL43RQsQ/dFSeA4X/WhqMYJg4dJQtcbsxiDYltpVCytqeBKmvzkwKeES
	 yLQOE753k8EXYYmOljnTrVEGPE+mUZ5LpOW7Y3/se4e9ByGB5xmuF8Uop5C2mJp6XbeLw
	 DxW7FcHbCLBV6FngHZrM+e9mlKWVpSsUgOOZAR5XS8CHXnXPXMTrUJFbAVmHiXqZZwRBp
	 B1BS5JIa/xLzCREOG5CM3tYYoYaYM02+hqes6WR9xhOXbmuFJOKi6GU+Yw6c92X59Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810954;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GbN4SqJ4UovFCwps805z/P2L2TfzFeTdUNr1Xb5RGPA=;
	b=MQuxLDC2jDQSUBBqjPS/NO12ewHgCkNUXUXsdm89DaKpyY/NM41Bz39U2+5cTP1XXFTm
	 FEYyxDyY+iltFodLi+1iCsl5mPCFoXAMayQRd7THTTwCKKL6mDkryeSKy/9aVOqQFgsAI
	 BQRbX1TAPNOu45ww9Heoe3lQAMuAWJbcu5DAvhSVCcdnvOtJPxl78ms0lg8LGCfFfgsw9
	 bH6Is1rAFZljnlbFaXrpumksQefWHr5QxmL3we4qrpQDcJhaTTn88KhxKalsJ5jBnFaje
	 M3c9veW+7kJUeQLsOr7drA3Q1OkHYQDeik55Pw1OKP2VlDa/X37FkSbGvdCWdkvwE3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D7zeSjdQ;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABB460A3826
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EABB460A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D7zeSjdQ
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d7e06dbcccso811469eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810953; x=1793415753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GbN4SqJ4UovFCwps805z/P2L2TfzFeTdUNr1Xb5RGPA=;
        b=D7zeSjdQHVPwqhtsdwt2+gO4PYqGIf+3GLh6AOFF6v8yELGuZfL+OTYJ8P5qpwBhAZ
         TkN46v+LALBwkVezNZcUXQB+5knLcp0KjGSzrewiPvyY6rHQcihrNqFtUU9Fmata9cKP
         S/EfR2U+/V+7hu2iAZj8EicZtOsiK4Sy0w1qomTCn0FYa1kUwt443Qem7RvwghXzCWeh
         spwpstEWC81+bQwTa7PivVgx7lgnwLyaTFT7bBdbLjWvoxfQgQimY/xAU0ayXwTeWo12
         q8++jEs2i6UraHdkADDgbQO8mujD1ltcqihGpyjmz6k/Bdo0tmKm+Hc+FuH0DEbtTe7L
         97HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810953; x=1793415753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GbN4SqJ4UovFCwps805z/P2L2TfzFeTdUNr1Xb5RGPA=;
        b=N02fq4V7Hx3YQqLr+iIRQ6ZdsO76ioWk+efOKH/fR/rtqLeQhUBe1CmobSnTm+yJak
         +EtuhegkWwgYeQvlptLeA+03Dq+RCSlbkUlqcsmvbslyiOh9f49aBg4e+xhpKbc7HlUg
         k2P9o7ZxlHh/Tet8RmKYKjLugCtXYB8tIt2/17c85ZYro56BhIr/EJL/EX+IHAO07msv
         ZmXpsIYmgM1/aTHramzHKZ5GelsGFuDE64dP3aHjCUBUXYoQIgU0QV8h3DfZM565iR8x
         0ys9TXLV0suc0fLiiqQt05tt3iA7C3k96NNZaTJClRmiKl63CFplgj2jraH6nH48RIT/
         fWfA==
X-Forwarded-Encrypted: i=1; AKwUvBz+zFcGeakXzJghZrcCBHcRNhlo2JXSQW2o2opsM9Uaa7YSC2hvXFY4tWzrexzdC+TUX3SMHSsDW2LCZVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOG2Kv1i3GG6azQp85mOQZBqnvR4FlY7ec7dkFNesih7ypLlC0
	Tgk9TSZjswJ56WHgFKbtCLyuM74lm/kxOpI4MLi0FVWP6nwaGdHv0LTG
X-Gm-Gg: AYBFou3lkHY1NTmR8aXct0ybS1vETP4M4UZYxJxLFHCRhfYGoMckqPbHMtrmNt5bcdq
	veKQ9PkTujIBuzDHrCtTzTBJiAfZTeLwsjmbia3ZZK2GwE//RelEZgBpuQC9vCLUu/BejK6Oqjv
	GolDaF5h1WivF/YzeLh5Neq6EB9NW7+FaHYnSbF3WtZFy8m+duCfab57vabp0pUhemKqoUk1Js7
	1WM0Y9M3E6ehSKGdF8hFEgxVXV294iIpRG8LaZ/vyvpvqS+qRFScjaVh/ctYTNbZm9gKr+Jl0ez
	zTkSuOQKd4JohrOGymppTU54zu3P7nBIrG+2V6eFxT0ze5A2MXaeMuepRTM/CczitCsDz6FfzL0
	c/6rR+dKy40EG2VNWrrzlyVXQnZAMtgBkeQ2zVy9dNeN/bec5wvAQN0JRTJrZqIdM1AdY+KOLV8
	UorR/1TRWUmlzaCCaw7EIv8tRLqXxln23LAyFARyndVfglg7MGhPqHqBYE3IoCkjNv837pztiGv
	thTnqIHZaB6PskTNetab/IBbEHUMSW2e4nzDWxAZt1hn34fj9IGErWTYLvEMiLiIFY9Xl8actav
	rpUi
X-Received: by 2002:a05:6820:a08a:b0:6de:1457:fe27 with SMTP id 006d021491bc7-70ba0e76707mr330211eaf.57.1792810952975;
        Fri, 23 Oct 2026 20:02:32 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:32 -0700 (PDT)
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
	Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/11] phy: qualcomm: qmp-combo: Add per-link-rate auxless/LFPS and drive level for Glymur
Date: Fri, 23 Oct 2026 22:01:34 -0500
Message-ID: <20261024030142.13643-11-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-9-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-9-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:26 +0530, Nabige Aala wrote:
> Add per-link-rate auxless setup/silence cycle and LFPS period values
> instead of using fixed constants:
>   RBR (1.62 Gbps): setup=0x03, silence=0x06, lfps_period=0x00
>   HBR (2.70 Gbps): setup=0x04, silence=0x08, lfps_period=0x11
>   HBR2 (5.40 Gbps): setup=0x09, silence=0x11, lfps_period=0x33
>   HBR3 (8.10 Gbps): setup=0x0f, silence=0x1a, lfps_period=0x55
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)

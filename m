Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B79D436A36B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272410; cv=none; b=snOkwI0J0+RFK/qyWWqZqukvU62B+jtnBo2dEHqEK+Phw472vnz5bxkYo3QvMRp/lDbrQxyNqmY9/gJIVwZlkiutZbDyIpnHNuU4ocabEsvIwcmzOJEath/Y5p4/ebFZCKfhZfU96t099YqVgG7iiBLNVpCfgvKm0MVs7SDYtt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272410; c=relaxed/simple;
	bh=sI3arS1m5ClcMAlmrPv7uI+K1rcejtMI2bAVU044Ygc=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=hoVIpdxZUuEeBnWUZNGrlRVn9tWPOwFWopfpURuVWFQUdXHfpMAVAnj1xPCT18TGrR1AEJZKtgSHehMd6/hNxvmNv5x3t9ePCDGr3aMQLAyb2cTY06jULjLKHpmvDVk67xRI5zqshS4opLgkCSqcx4mm5WKMhZEOeb2/zZM69aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bk6u6Bx9; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bk6u6Bx9"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-39266382df6so4146244a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788272409; x=1788877209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sI3arS1m5ClcMAlmrPv7uI+K1rcejtMI2bAVU044Ygc=;
        b=bk6u6Bx9VzipmiozDGAtcHUxd22Lgx8uJxYdruLf+RoS9DsAYjOPtCjaADtiX9fOVW
         SKCOr/MJdQ2l8oS2041H3NXKyS8FTaQR9hLwAYMqg/WYjHjbuN3so0wJ0j0EHzOEzOO6
         M2fu3fjZvgbTBkRulIoxEgSaTQ8lTOU4Scu98Mu6liQijWU7GU8bR9zy7PNCwYsqQCYU
         nyo2wL+DTH9rwWLIWNS7n+8fyMhg9v8CZFSG6n1kMszvZ6/1+HC0eCp5xEynOeEz2xHl
         lc/HSntM0uhCjL/lhBZb0YlP21QMa8yU15dWz1fkLiL/SucIoXZ3V44ROX+wbJeloL5b
         K9mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272409; x=1788877209;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sI3arS1m5ClcMAlmrPv7uI+K1rcejtMI2bAVU044Ygc=;
        b=WRiHh5cyVV66+2okSPwiy+zcna11I4reETVNiACyX2IO2yTYr+nrcaMuUbuqkmGqDW
         CyRW0s/UNgoMjAKPLKA/+v1V/gcWDrpoIfoIHgVlzC3Ut12PexUyznLC74GfnjTiNL7v
         Q5pTxo5PvELzvmxHvPbpSjYbzMRxFm8gbbT9u1KY0bRRMTBHWTAaQIVSorYhdtZvO8wV
         7lgodP+Ch+rxakwgI457eZ8gPe5KGYsB8jT8HVDyG5F0eucmxlp/JwdoDJb37J7DOQG9
         kkIjtLwZytSADQQTazeEq685VfgF7eDF8ouQesGreZIHCk1y3NdU6pHofgfyDy3IUyla
         rpyg==
X-Forwarded-Encrypted: i=1; AKwUvBxFjIufyKj2qtRsMn4EJYWmemDEv0QEse/yv1dXI2vhyuvwavUY97hIVecfxPLFaSy1R1mgrHUwpHtzP/s=@vger.kernel.org
X-Gm-Message-State: AFuF++lKdDNTbIpFmF4bu8Bvz1obfB8+SF715dYvkd1w7h9DPYUs8MUo
	myNCOnGisVRM9AH/HCORMEnNBGgzeWptYq8QX8RJ6qJ1i6p9m34vwSdq
X-Gm-Gg: AYBFou3n2RPc4eJ2uYXXrDEwI4t+TGajoXC/CmQa1IzZh46Pq8U36rGDNP8BG3GKDsE
	mmLDDO/fdXZGtdN3ugT9Kzj7k8YljCKPM578YpO9XmfyeHCbuEVKYc2ynPCU6srlWvka28Xwnsv
	nJyTBSFrB6DD97z6HQqGxC42E6m97YJ8MU7wAoXDjYoL84DxgLiZoePwSK7fGCPAkHAjp5UoEOD
	7ScgEB8DGY45HYI5Sfz65dMAmxgi8nl46sL3XrDufHHmibyXhIZ6RZNMAb2wURz1Nom2wPAa7VN
	+nRMMJsbCcp0DGwnYdI18sc+EWUgR7Xg96cbSAbZBjH0qabHkkkzu2TAjizpcokPPo81H7Nc4Bo
	t0Q8uqchWUZ+vnvrzlXtukjnaqVMoAG3tBn2R2SF55zTrplElg4kUBIJJpR2PCJWKuMlkFClo5C
	tE408MHb4MAEJE2O24qISY5xJ+t5IKR9CTeCisvQjxqty40WHkOdcSalNT4VfMGDbq6CnfFYmsu
	Gv506+xbkHZNJ7khpo4FAS5K1ewodV5/yfCAbbqnZlj0uwpYVb3iPeCQA==
X-Received: by 2002:a17:90b:2888:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39907ab0ea1mr12700245a91.4.1788272408748;
        Tue, 01 Sep 2026 07:20:08 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:f149:be84:942d:9300])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d4b336sm37722217c88.8.2026.09.01.07.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:20:08 -0700 (PDT)
Message-ID: <6a96df18.ba0ac10c.150968.da3c@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Date: 1 Sep 2026 19:50:09 +0530
Subject: Re: [PATCH] staging: axis-fifo: fix underflow of tx_fifo_depth in
 size check
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 01, 2026 at 10:06:00AM +0530, Greg KH wrote:=0D=0A> S=
o this is just a bug in the device tree?=0D=0A>=0D=0A> How was th=
is found and tested?=0D=0A=0D=0AYou're right, and I should have s=
aid this up front instead of making=0D=0Ayou ask.=0D=0A=0D=0AThis=
 was found by static source review with AI assistance (Claude),=0D=0A=
not from a real fault report, fuzzing, or anything hit on actual=0D=0A=
hardware. It was checked with checkpatch --strict and verified to=
=0D=0Aapply cleanly against a fresh clone, but it was never build=
-tested=0D=0Aagainst a real kernel build or run on axis-fifo hard=
ware.=0D=0A=0D=0AOn reflection your first question is the real is=
sue: tx-fifo-depth=0D=0Acomes from the devicetree, which is trust=
ed input describing the=0D=0Ahardware, not attacker-controlled da=
ta crossing a security boundary.=0D=0AA DT that lies about the FI=
FO depth is a bug in that DT, not=0D=0Asomething the driver needs=
 to defend against. I don't think this=0D=0Apatch is worth carryi=
ng -- happy to drop it.=0D=0A=0D=0A> Did you forget to add an Ass=
isted-by: tag for this patch?=0D=0A=0D=0AYes -- I should have dis=
closed the AI assistance in the commit=0D=0Amessage itself rather=
 than leaving it for you to notice and ask=0D=0Aabout. Apologies =
for that, and thank you for calling it out=0D=0Adirectly.=0D=0A=0D=0A=
Manush


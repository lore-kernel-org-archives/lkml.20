Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76F83AE187
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 18:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788199873; cv=none; b=DNt/jUe3GUASkHqbK2+hboT3tq+pFhhOV/fKxHcGBPgQdsgaDEOtfyKYrYhxD7gbl+gDIKDgKQPw5rTJti/itlPglBrh4nztY+10fR5iYcj6epocOiL78CHk9uBSqrVmI9r1/PseqIIrxVy3VVeOJQ0/aMVKWvKCtt2qgRWiCnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788199873; c=relaxed/simple;
	bh=VX9aq1/R5RrwRZmL7z7ZO3HDaJciT4M9uo4YXELNbqI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=elNwidSxp/lKF9ajMZu7AYTiDKPenkJzYhHGiIvYy/rjjybaa9dKmNSfP7tZx9cFwV2cHInCnNA+xpDFyTzYFwGUNgFcp67q6lVSb0P+Nt5FghBEyeIGWzqeJZgjAB5foaiaVP1TunbA+jBCOHHWSR9NReuV6AfSpw74tjrQ9uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=fBfCCKAR; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="fBfCCKAR"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-381b831d535so140071a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788199870; x=1788804670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Wrt3p9UIC2EP+ugVnAYAftXrBkKybsqm1b51KtSzCs=;
        b=fBfCCKAR9qEL2RzDJqdpp8hVecn3yNx0in8YWyfJ2MdIc4Xa3yHrYOhu6WjNAWIAez
         HJ1NAky5+sNAFQsvKKvoIUdSQiAs+dZ2fxaFsdivwomgbRkRk4AFaVI2YsUUzzzxBhsh
         wR4sDoeYlBL8fuRnlWstCEgxWvg1UQCeGiU4CxauGrtDZTIUqjgRPElejWFB9b2cgmq1
         /rRYvIm7grg6NlP6/hjfH2mxFyY1EYSiI8BN+YCtjbe9yfwTX07WPAtisr5Ju8cA1FB1
         4/0Sxeq1gIRWBhCcz8wZ4wiJnnlH63T7yLUrj9mNeA4mEBYiVkVDQoiKS45vgNYZNdST
         F4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788199870; x=1788804670;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Wrt3p9UIC2EP+ugVnAYAftXrBkKybsqm1b51KtSzCs=;
        b=lPJzgxCDGzTZSjgbqh0faxy1Kif/p1n9IvtG9yiQqOD0BAFY0+csQlpX+S7z7G6ord
         I8NOtQfHXUHdksYjt+W1zH58PfTFlmz6KfsZGUUnmTSq+d6kUcV21o5aCpY++hdF642B
         rf3TeXuhvxShd97TNjLXk7Kp1bHiQ19IYCAm/AIfRxcISzpBdmRFc4pHfyJRNtqbg6iU
         ofUqVbS+pNG3daPeo9pOEYAFszv5lmPe8VSMoy0qtVl+kZinfnrPqFiWH28bxc7hpP/d
         aVW9VF6zBVDBCoN30cHaLTQItj3jQV8dO6xQo0a/ck25Sl2kkK4D8sQpR+YEyw7rYrHL
         WNlA==
X-Forwarded-Encrypted: i=1; AKwUvBzYIkH3km1b1UBBCcThOgE2ITZfqZi3azDwpCkycgF3ZBbe+pcpERiPMd2Yl/5cksycIqoDlP1dRYPQ5ks=@vger.kernel.org
X-Gm-Message-State: AFuF++npJzfoL4oMU34lifBlzy94dBblp/i9lSsMJJTTmugRQddTQBE8
	ut9wc6seWMil6eGMRlU8vgK8dnYKn9xzyjFBjpcNHCzCk4pL9KmAwnSgELlnC2fp7i8=
X-Gm-Gg: AYBFou1ti4II0ipUKt2gHiF6tKTjFog7q6TBX+CGkgG9npl53wM1WN6Vf8m8mIqVjpR
	MmBfMufe4ecx6RTlCcc5ekPsbO/idhpH2r8tgqhG8x1sM4eN2Rc36yXx+u2/CyDNBbskIknKtz6
	zP4jotZ+K/zP7S9Xq6ddXIZE6/JILAPNMUSlka7JztteBBWOJAXVPxxlW7THj/WHbuMxcsRqsJG
	1NxiXiTLsqWHDcHRDSgwA59TQTC/hVnPU2FlLBZu7CBc0aqg4F0qzJ9/yZhiYTBXRwn+xovQzaj
	R2HJN7FT9bc8/HHK7BCB0nxd53iV+eI7iFdf6gO9spKwjPGveVcBpkgGq84zbBKWkgPqc/3nxAE
	5/ZScbV8bmH7QNgiANRcwqjpnfYUqaIFf4neThn5dazQf5Ozhy/N3Jq3rTffDwJ4MsqADBlEUtr
	5whkKRV/MN+BYc+/YEDpKWfSLVmtiXL7bGJtnpzCS0F4ydiBUZyexBJKwwXg==
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr46228745a91.12.1788199870028;
        Mon, 31 Aug 2026 11:11:10 -0700 (PDT)
Received: from localhost ([71.212.197.238])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3990d4ede7csm757891a91.13.2026.08.31.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:11:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: nm@ti.com, vigneshr@ti.com, afd@ti.com, aaro.koskinen@iki.fi, 
 andreas@kemnade.info, rogerq@kernel.org, tony@atomide.com, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com, 
 Parvathi Pudi <parvathi@couthit.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, danishanwar@ti.com, 
 pratheesh@ti.com, j-rameshbabu@ti.com, praneeth@ti.com, srk@ti.com, 
 rogerq@ti.com, krishna@couthit.com, mohan@couthit.com, pmohan@couthit.com, 
 basharath@couthit.com, Murali Karicheri <m-karicheri2@ti.com>
In-Reply-To: <20260723102041.372148-1-parvathi@couthit.com>
References: <20260723102041.372148-1-parvathi@couthit.com>
Subject: Re: [PATCH] arm: dts: ti: Add device tree nodes for PRU-ICSS1
 instance on AM571x
Message-Id: <178819986914.2869653.5429087561211412067.b4-ty@b4>
Date: Mon, 31 Aug 2026 11:11:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev


On Thu, 23 Jul 2026 15:47:23 +0530, Parvathi Pudi wrote:
> The TI Sitara AM571x device has two PRU-ICSS subsystems: PRU-ICSS1 and
> PRU-ICSS2. DUAL-MAC Ethernet support is already available on PRU-ICSS2.
> This patch adds device tree support to enable DUAL-MAC mode on PRU-ICSS1
> for the AM571x IDK board.
> 
> Each PRU-ICSS contains two PRU cores and several peripherals, including
> the Interrupt Controller, IEP, MII_RT, MDIO, and eCAP. This patch also adds
> the IEP and eCAP child nodes for PRU-ICSS1, making its layout consistent
> with PRU-ICSS2.
> 
> [...]

Applied, thanks!

[1/1] arm: dts: ti: Add device tree nodes for PRU-ICSS1 instance on AM571x
      commit: fad89162c71bc2f81f99191d93edc63d5f6397a7

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


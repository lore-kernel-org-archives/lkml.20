Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792810947;
	b=xxrUe/PVtNb3CisResSt//TUWv0zs2I+WDuPUKJdQRSmtXNnCcH/dTmW/SKjnVJL/3OZ
	 K06yWFbI7Ly0FZGD8ZFSshDTBmI2etUI5hSVcVfYXniKb8W+z1R8fxS0MR8pdY68zfdXx
	 RbNI5impgzMYAyI2J+rb1hs2sxILvU7x1HIk/oPFDDIqxa8xp/9TsLbXxzT21Cv9yi2G6
	 Ah3bBKtH2eBDPhmabCl4XGoRHIqZ50t9GwRMLcm78B5YWUqV4ey1W2d2J2j2GmZ/OUNFc
	 BHz9qf2+DS3mnz/QHMd879vcKgR3DHpUFS1HQNW3oYfUZoN5AvVOBdZ1kLHfo4bSYqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792810947;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=19hh/+WHY1QppPzIy1oNIREpwHyJPWnwZ7GJt11J8h0=;
	b=bUFF6yo1WK8ruWhp9Dp0eyPV1YyYDN4LBZP1clhccbxFEM92cce5lDaFViz32/c/3oRs
	 4uWWUcn+iybMDrb92M+G9BAZq7wUx1rOfBMuurGeZU8m/2xDuttXgcG+xAz6vzmpi4eDc
	 tCwWG81VBgKD6xicqJXpm6g0iQUnnkEYzGz/4O3yGO7V3iZu7tajfEPmDlhTNwlgbcGyM
	 Uzzj2GsHedAFVnQkoq1m91FRJbh1MOhYQ8lirYrY67nHA4OKKXwx9QtN9PhvXEBchhfMY
	 77JRiK6jKzgKfE8sMdhNiM7OP5xR62Ltbi1MpDvV3d1jmg6lZZ79K57pdq243Ef007A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=miXrIXDO;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4829260A262E
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4829260A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=miXrIXDO
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6faddda49e7so1257852eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792810946; x=1793415746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19hh/+WHY1QppPzIy1oNIREpwHyJPWnwZ7GJt11J8h0=;
        b=miXrIXDOK8g3how+NK4ph2kcI3NyopKkZupvbcGiCGo/73yTn1jSe3WwhkEcAfpg0Y
         TB8lW7EzeBvYWKVhI5M+YK1nVgKTgZzzZ8BclFhEQn0Pi7wCKcrAQevZH7ahf0i9/iaN
         cLErMFiVXkwWV++StnqsyNUI75X+jTGOeW3bhgL7dAHEPEKnSM5vg7PleJoKsa8Hz+Ns
         kPQbfTFkVnbbi2cpqF0mquyRXU6MGqHVbTH2ob1Mxyg32HKhpJBsWR5jk0fG1At6HtqS
         sacHncJTARw7LB+DRzg1U8WMe7BUDaV4K2npWhDDbYV7drZxvYmlR9ltvsWGuRCX5oCp
         LEDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792810946; x=1793415746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=19hh/+WHY1QppPzIy1oNIREpwHyJPWnwZ7GJt11J8h0=;
        b=p6XUrG0S7O66+7urPVgtcOwHaN7XASpr9KRPPKMybMRpE5zEvwh0MTS49Ds86Xk4zw
         E0jmcYPrUKDzCJTIppopOaACneNz8T20iDTURCQrIJkg727/IiKr1fjkX9ktywROOfS/
         8FGyGH8sh0poVC2BJBQrKJ1kNUBNfWdSulrNMqUXDEmjyeeLhvBICpDoYd8VMqD4cT/e
         whryHYqYgCJGe8Iz+qbHBFVMMtXG3SiCF+qClR6SRNPBaCXUGr+/2WwOGaJ8Q9PgOR80
         29jMfdJLjNHZzubhg2RywW2b+btefS+/34J2pQLe5ZtAf+V7x3RvV52cGQBxxT+7R67y
         6lkg==
X-Forwarded-Encrypted: i=1; AKwUvBzP2Q0ihdZCUsiu7E8qmzAPIH16KgcBBn5izkuCJj680/bwbfmzcn9x15vrPKD9Xz3wqKTBUtkMzeUwshQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLph1C6sLo7DViUWMfyGY2bGfCdDs5etkmJkHe+XEhU94Flwx6p
	LrpNDRLdA9zunWyJRyxuCovmZnkvw8H2SWXmq4GcwqlWlm/tQ1vAOBeK
X-Gm-Gg: AYBFou3IbbnsSKP/7nAjZZpVsoom8gXRo9VXQdWUj8dMArnUAp5s+Lj4/5p/V+WqU4f
	QnIXfhziWA56Fs0j83r6wcr7xDlP+X374fDJ45BqoBdwp9mIbu0IwbcHHjyupWtthW3AX48dzOs
	lIokNvv1ERa0A+jmEO2QgwHj56GCo1fBPtlMC3hggPolBvOzL7YfZqmRhlDCRfwWkVVl4Ed3B0d
	DWO3L0hpEy7aIhEFvE9K0RZtzYljyAk/PDgiBZzVlbw7wyCxoH/jVd1Z4eWXyNviZcx9BLy8P9B
	4CzmNscee0sCcCtBmt/uYhg5eOAarf9JasYbkurC4TAeNH5RuNhQvKT5xhZmXvHhT4/iRFNsCxE
	c64WPH2XCrXVT/1u+ukBd3eao+jUSD2stkhAXDv/1Zl/HieP521Q4oHrHxWiSaC+96c4C+mY8Nh
	AvnY1ESta7y/Z8J4N8Xr7pQde0OLj3a/WkL37kT+5hUjPJtU8kjwyitLrk/IDXRubtFe1Dlsnaf
	gVZc3QvpGUxLF0XzHJMbgctiC2l8h/ceGdhGc21oKSlbWxxsQdREC6IsgD5SOJcB1Ecb+77DIe4
	Zig0
X-Received: by 2002:a05:6820:f012:b0:6b6:93d6:afcd with SMTP id 006d021491bc7-70ba0e13073mr403628eaf.26.1792810946228;
        Fri, 23 Oct 2026 20:02:26 -0700 (PDT)
Received: from jeffmr (63-152-17-145.cdrr.qwest.net. [63.152.17.145])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9e1fa334sm824552eaf.9.2026.10.23.20.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:02:25 -0700 (PDT)
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
Subject: Re: [PATCH v5 04/11] phy: qualcomm: qmp-combo: Ignore Type-C orientation for Glymur DP mode
Date: Fri, 23 Oct 2026 22:01:29 -0500
Message-ID: <20261024030142.13643-6-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-4-3848c2615d5a@oss.qualcomm.com>
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

On Thu, 01 Oct 2026 15:04:21 +0530, Nabige Aala wrote:
> Glymur platforms use a fixed DP lane mapping and do not support DP PHY
> mode reversal based on Type-C orientation. Add a configuration flag to
> ignore reverse orientation during DP mode setup and enable it for Glymur,
> ensuring that QSERDES_DP_PHY_MODE is always programmed with the
> fix mode value (0x5c).
> [...]

Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)

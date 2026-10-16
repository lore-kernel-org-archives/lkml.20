Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588A9385521
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792150384; cv=none; b=oqBzILVml5ZZttbg2tUNfl5Mzd9zkY5R1FxPU+VQDAcMZg0JVm7IvhQh/2j9f4xrk/CBpeSFEiiXeRWOavVxixkU4h/ua/uyRlt6hondOMU2sDOS+SRMG4rvd5JCz1eisHF1CAcMq+jtkPAXXUc4PtjDkboe0KcDQSvraPJGTok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792150384; c=relaxed/simple;
	bh=F+/gdFBwGyd9NF1wNEDnKR1WRHrb87+RISxVG3LG6nc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSvY38eHic6MJXJSnCBgoOvtbrZx8726ram1vSGHwslAxrrFopHc6UQKuHgDsjnCKUj4L4t8RizkcEe+W+D6c/LtY07F02vSXrki5kWDWuYdpAw66q1GcWLrocPRraID/0j6MLqXaXBSQeoA93GEFPQR/0iVpxD8Fhw6ozEpYpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDBTxqA9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDBTxqA9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48afbd2c386so3769842f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792150381; x=1792755181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+/gdFBwGyd9NF1wNEDnKR1WRHrb87+RISxVG3LG6nc=;
        b=HDBTxqA90HEV5zn4gAoLyOHG7K5OBxhRwNVOa8Iaco83MAnOU3jvNOXeSIZetWA1+B
         l558jlaSIniv+vkWR+NOvQMBx0d5GvKiDPN3bqu1Khi+zdU+l8aj11hIa7mdjDkUnDvu
         ZZdMwfhnz6pqSv/5mOKsEA2k7DXvgmJeJkF1FgGrWo3P/RD3+3rwso9rcUc2lWVjz9S1
         Nx6NQfehhG3guGRnjkJdzllTtvfiPs8FLsqPWhXuI5JR0D35ZgaAG6oXXVX2SkeAp2N/
         nCe2j42eflPdHbyr+x5Jb469UTg/zz4DsMOaDT5wt2RdJ7UP3fX5o0824Zj/95lc0YXX
         TK/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792150381; x=1792755181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+/gdFBwGyd9NF1wNEDnKR1WRHrb87+RISxVG3LG6nc=;
        b=nnksYjCBAJgYFXYv0jhriSs7rPHyW6AbJ8NqeAm5z7yzdjAC+AijQN67fcrprgQUuR
         gP1+WflZ5BVDz2AYUBIXwRHRHRLqGrui2nIPcNMse7pAa0X7Dz41pIs6w30oT1ICNWzM
         ZaycR74Mjml7ca0GuHC9AoC64P6edFAvD07lRWg6aQ+e8AcTVGfTWZJ3MgI3/3u8A+Eg
         9PMBytKIdrOB43weUEf1jUxBmk23imnvmw0AKElZC52SlgJlZJVU+v5A7r3eSlwGw7ZP
         lCpfD2LOqDZ5E86/Gq1542NzuDFYgGUo3sIDTleSr9mab5yY+OBMkNATTphm2v0JbEK8
         LQ7g==
X-Forwarded-Encrypted: i=1; AKwUvBweeqOr8hDdcsaWqp4y/QCqRXxMnpFD0jkcVaOxSzR26zwLonOVpmFRdRUpQupGH3Jtk9hYRi8CcMbDfNA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrs1GW/OfkWUN9DBUFQoXQkr6FvcaSiME+mLJ/VO26pQJZV19b
	XmwL8nmLvCR4BM3K/sI8Jl5uh0I401cDi+vIIo3fQqxZxP3SdhVJS+l+
X-Gm-Gg: AYBFou1eXqEGK4voRC6NGB6NFyqcB7Mo/ocCQiEEAMFZfOA172eMuxYdO4fKwWHiiar
	Nk0dmgTiG6ZsgztcnV0s8XwMlxbb0Y9IatBvqY4gwI31b8d2in77EyXfm8Wk3Vo9o9nJ9541kk9
	9ymRLYpj1iz7BF1cyhLXmuITOfQ9BKmAQSxGV2pe8BlASJykwQIg5wCWTh+cnHD1FgL1846RIXb
	oe5VvmmGbHFkWoQZ8CT/FBg6OrdDZ9tjOVd5yfV3evipXRmKXCTUZN/6ctK7Ch2QITGo2bFKb/h
	zLIllOrHdVQu6zFdWFg7nWULTYqf2XLobMRlOFtZ2ZYmtwxw9taWYHbKytjuGglQlC6mTvhgLit
	NKt9p9A7P5OTijU6gfp2iQt0w5LSp83QTQgllS+j7F8fP5rgh6N9nYD/eztG638aq4z+k0S4g0p
	qWwfrOOetoXoqAdo+lYPkDQx5bsHC3hK3fp4sybLVIlUCkRK/jeOg/o1fNCmiSMLOozIV5bhoc6
	S7BVC8oToXiCMG2QpDY3YfhJIhmWzE7OuiX5SLC9+yumSF/gcfQzYh9sJYaxSGBBx6ZonCs
X-Received: by 2002:a05:6000:24c1:b0:48e:6f:19b9 with SMTP id ffacd0b85a97d-48e006f1ademr2357813f8f.23.1792150381293;
        Fri, 16 Oct 2026 04:33:01 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd47104csm5057285f8f.8.2026.10.16.04.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:33:00 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	David Heidelberg <david@ixit.cz>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	tjose@qti.qualcomm.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] phy: qcom-mipi-csi2: C-PHY for X1E80100
Date: Fri, 16 Oct 2026 12:32:59 +0100
Message-ID: <20261016113259.40819-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <b96649d9-5c1c-4fc0-a77d-d0076cf80b86@kernel.org>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com> <b96649d9-5c1c-4fc0-a77d-d0076cf80b86@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 12:02, Bryan O'Donoghue wrote:
> Small point of order here - this is not really @ RFC status.

Understood, v3 drops the RFC prefix.

>> The kernel was 7.1.5, with linux-next's CAMSS and CSI2 PHY built as
>> modules; the test build needed shims only for API differences.
>
> What's this ?
>
> "It builds" I can verify myself, "it works" is the thing. Just slow down
> and get something you can test on hardware.

Fair point. The frames in the cover letter were captured on the
hardware, but the kernel underneath was the 7.1.5 one this machine runs
day to day, with linux-next's CAMSS and CSI2 PHY sources built as modules
for it. That is not the same as running linux-next. Before v3 I will
boot an actual linux-next kernel on the Surface Pro 11, retest both
cameras there, and say exactly what was run.

For 4/4 I will also move the fsleep() change into its own patch with the
reasoning, and put the lanes_enable() decomposition in a precursor
patch, as you asked. Thanks for the reviews of 2/4 and 3/4.

Thanks,
George

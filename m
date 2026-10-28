Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219047;
	b=nl33En/DbS0Lp72K0Yi2Zn31XFrKKq96t6Y7BdeO2tsq9sg1LxUmV9pENtHnJpDdKaZf
	 CssbSDYX4asN50Iq1uF8miZOC33+OTJeHVAA5ejnwcz22loP824tEig2hztQ1bYSlyqBt
	 aW2qnX/TTTESejlVUSlilCvstTIWEY1KF07XoyFHAoKBLpHD2GZFW+1duMqs1cV7jtxcE
	 prVbIc+2y0zhdEyOrFP72ZMAyvgE0NHmK7azKazdaGS79AYIYqkjuvy4MyHlrOw2ZhIsA
	 EZZXyzD842T4GXKk+QfZaWpWHb5+UT5R2qK1YhyIrjLc6yl4sysfCEstvt5Us47OYLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5lS3F0Cpg++YyxcvMj5RtcnTaD4p5NTHQ0SzmxT4UpE=;
	b=wKa/DGH+t4Bu9WVbsRfEDWAs4h1xOBugz5tlf3LazWgCN56FQTDj9oDOjn2ATdsLVTnc
	 GybJ1+6T12AOUH3lPAW0/xYqVG95MVHt3VKB7msOkypEwsJ61c6BLLBNEPQG53+4v6ncg
	 kuSLuBDsity2ZA/5JY4agng327AtN7kesf1N3keYTvILdw3ECyBMNTMvlfvkL+eoW+lVu
	 oLnZ6yI0utIv9Uejouo9QyE7AYbslkwrHVFvIubGvTOOI42a/VYNevEkTkOJrxUKiXuQN
	 KD5aR1Uc2XYCQv2R1Nliz1KGQFevgNkzdXS6j/tCe7Q40ffx3mdfw91gkzxS/d68prw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b="apIzO/FL";
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD025606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 20:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD025606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=apIzO/FL
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so15872185e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793219045; x=1793823845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5lS3F0Cpg++YyxcvMj5RtcnTaD4p5NTHQ0SzmxT4UpE=;
        b=apIzO/FLOIPEPyIQkW/EQOtJrZIBvmNI7vSesQpObzJ/kDpba9EGoD4T0k5TLlc181
         0kXlmFAp56SVfPFL1kLdPKR4f2B+BRrUslAmh3XfWufk1Fz0R8M1IJCBxkhHREtkD+WG
         LCdDG8bhnGcuRLHKtA8Y12TW8DcnlEZwaJtoYDyddQoafRj8VPtbu2HI9HSl+jTMo6L3
         4mrmKgltCTm4etvn4GMrOmZfhQXwtmk4GdiyOmA2LoD32RcIM+ruzwDhNDTv51XJ3VJI
         /PsQsjLABk+gmp0wznLa0iM8ZKncdgktyGSTwKEYlLe8CgK4cEc+8ZA0gSjh9Kwp++jl
         2fIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219045; x=1793823845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5lS3F0Cpg++YyxcvMj5RtcnTaD4p5NTHQ0SzmxT4UpE=;
        b=mqXMvm9ju4cxEbTUIQRCY6ODt4ZeYa4FeQxuXBuYwbG+RM/tG2qYQ/PaQRVOB6y5S6
         BQaJ/lNNE4U3wYVDdbMdgYqMPBTbsvM2pMTS1WJHi7WiqcObIoPGNrrAIeQYx5gomjCv
         5OQPo+Yf+leVo1oTAiA/OcurfWowyKJv66GPXCj1NMa0qp75h24JqkUM1joG2a7Gft5K
         yhyDv8L0E/XcB3MhHpXO4ggv3YjshBmGqx5lSYbK0whRG4MuIcblDW6m7NhiHISSx2Nj
         Z84ZG6iuYpGR+H4eTixF19PyhT1KQa937zEgHGkk4lOUxsEu4n/5uXohDHAXk7feZQtS
         ExGw==
X-Forwarded-Encrypted: i=1; AKwUvBwRPUX9YKj1x8AhIqORP3fGkoezSBRdbOwziLGvVcwyLTlqqj1wecH7VkLHGl6JFutV4T5kvx7195R+dUc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJk+gF+Ui4OiPoj1mVTiIhXWY9Gh2NZnSQvOo1lnLwIC0tRzWiG
	XyDBIkBN6eIPOAtjNzl1PNcvFSmxHePU6ENEcba2zA6Eo3Trk45V51Dheui2hZTafA8=
X-Gm-Gg: AYBFou3znlBYExYPgFuoUk5FBlYW0SVV9DbUZcdvxhik+aVLDG3m3NrFWQlDP5vPMT4
	GF7HAaTxvlYdVIXzE8+wDh6FV7WAp6xZgXRevS7U9Yeiem/eG9MRpDwGB4Y9f+aC6ttQRaSiV1+
	Bm0zqwssDxmY+/V9q3dFDCAyUXPcCWAxczApomWxvhAzcCBVmEWBchlGYY0WxmHjEy36CDjAl8N
	dCTjvvNrXXrB2RzolGL3YokvdNHuhyEMoAM3UHqDA77rVkRY0ZcZCG+RxUstchL1FnP5LqFPAoE
	lDcxy2w083W026wUCJbn5P/qoQ13OWIv8fKHDuaF7qdSrcdsRv7Q8W3Ptepn4KnZljO5rXsDqiU
	LgzzN+cDQWn/tiOdrxJzkmK5LBLvtA0TIN5RLJlsfZUCxP8l4/HZkhSfZ6QNxvq4tnPChPR/tPz
	RgD2hSrMnfUfNCEJstAeRLHvHK1yfDiNJGUBHEHBRagWJar9Fb8NSxwPT1NqYDdm6Yvjfi2fFF/
	Qh1v5z/2ozahFxSdP9XsfPqZpGjJSUZBb6CT//xHnyz5unlc73nkB0Sya+BUjluYh5RcX8qkzax
	WRdBihVc7YACmVQjjHxc97IdcK82G0GPdlwUOUleFYn2Jd0dOvZK6b4Or3h4fCSm2MsFO2gYc3P
	FO6J1FljpTVk6RhXpVRRnt0ymhT1eYfBu
X-Received: by 2002:a05:600c:350b:b0:4a1:fe55:88ef with SMTP id 5b1f17b1804b1-4a966c41721mr72974675e9.20.1793219045017;
        Wed, 28 Oct 2026 13:24:05 -0700 (PDT)
Received: from irdv-jinli.dev.purestorage.com ([208.88.158.129])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4aa7ee57589sm17498015e9.2.2026.10.28.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:24:04 -0700 (PDT)
From: Jingyi Li <jinli@purestorage.com>
To: vinicius.gomes@intel.com
Cc: steve.wahl@hpe.com,
	dave.jiang@intel.com,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	fenghuay@nvidia.com,
	xueshuai@linux.alibaba.com,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingyi Li <jinli@purestorage.com>
Subject: Re: [PATCH 0/6] dmaengine: idxd: More error handling fixes
Date: Wed, 28 Oct 2026 20:24:00 +0000
Message-ID: <20261028202400.1144290-1-jinli@purestorage.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
References: <20261012-wt-idxd-fixes-v1-0-30a35a445077@intel.com>
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

Hi Vinicius,

We hit the bug fixed by 1/6 and 2/6 in a kdump crash kernel on
systems with DSA: idxd probe fails at device reset ("Device is
HALTED!"), the error path oopses in destroy_workqueue() on a NULL
idxd->wq, and no dump is saved. With slub_debug, the duplicate frees
in idxd_free() are also reported.

Testing: I applied patches 1-3 of this series on top of 6.18.57 and
tested on 10 systems with DSA, triggering kdump with idxd loaded in
the crash kernel, with and without slub_debug=FZPU. Unpatched: 10/10
oopses in destroy_workqueue(), 0/10 dumps saved. With patches 1-3:
10/10 dumps saved in both configurations, no oopses, warnings or
slub reports.

The failure here is at device reset, before idxd_setup_internals(),
so it exercises 1/6 and the idxd_free() part of 2/6; for 3/6 it only
shows no regression on this path.

Could 1-3 carry Cc: stable? The commits named in the Fixes: tags have
been backported to stable kernels (we hit this on 6.18.57). Also,
from reading the code, 1/6 alone only covers the case where idxd->wq
was never allocated: with only 1/6, a failure after
idxd_setup_internals() still destroys the wq twice (once in the
unwind, once in the release callback), which 3/6 fixes by removing
the early destroy. So 1/6 and 3/6 should be backported together.
(Our kdump failure doesn't reach that path, so I haven't reproduced
it.)

For patches 1-3:
Tested-by: Jingyi Li <jinli@purestorage.com>

I sent an overlapping series [2] before finding this one; I've asked
for it to be dropped in favor of this.

[2] https://lore.kernel.org/r/20261028003708.834341-1-jinli@purestorage.com

Thanks,
Jingyi

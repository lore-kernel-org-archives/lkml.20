Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C69379991
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162530; cv=none; b=u+y14Ih+xhQ22gIMZM4XdqjE4ycKpHIPZ4s7EQUYAoOxADlVDmp6lyw2UmLwLhC+RwNYBKDpHuS+6gYy9zcQpjGeSrtXOk98vC0BqS9584FZJ5IFq1CPrHJNDyFttqqaj2CDRTAP6zH8OTvSbnMP2VVfhFCPd96DQHAVktbwy8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162530; c=relaxed/simple;
	bh=JZjJe/mZazRkNVQjc+trRezxwdNtkxCjK1msLq43IJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQiDPixT6nSyTxefs81aTjYYqzmAUB4mOgiFo3blRjauONBO3W3OeFC7GbBsxY7V2OCHIII/gCWL1RE+ApqFz62aAdlD728lEDvVmaK3S6jfluonQeMwRkKm8hh7AzY1grKlg2oZSdzGorQcGpHqRE+xBTy2RNFHbSijubT+oTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKvCAiVI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKvCAiVI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso375015e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792162527; x=1792767327; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDjufEIvnKCHnzQuqZKJsy8InAts45tbC4Yhybb8ScI=;
        b=WKvCAiVIFZKeiV0LkvKiUQCucAAphypPK5C++55v5Ucml/rq24PQxbuXOoNt3bHjre
         I0hnj65Cx0F+snYB4JPrn1S5kj7kcuxFTrcdo/eP7PLSHH8xxe7Z2vTNfKWqsAP229RO
         2l1L47v9XHlFocHK6WnAwr5HXJ9/m3G3Dzl4WnLPy0FcYCqBbK5Xk2vC9ulEcIBFnUDo
         /qNcmJ2+fPhKy+N0c3iimimZGPLtZps27qUATBLers5UC46rAaFIQ2iI62xw0PeU8BXJ
         eXDerxb22aG67d40quUzDCsOv68jearjAAgiyBevdzQd2ukuPxyX36DTUw58wkrl3QXS
         gEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162527; x=1792767327;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDjufEIvnKCHnzQuqZKJsy8InAts45tbC4Yhybb8ScI=;
        b=sBqkoqe/2gsTGWa58ivz3EK/GP2L2J/VbkTq9h8x2inmiYLDcBpVwoR0EGWy28/+UW
         UiyU4ULbd8RSzFYDwmdYz/VVV1xrHV1qVmUn7kM3HiRcbo+mkOMEv5QTApvVAH36FA3f
         dI7D8wvVXGKWzlABIWOcGB0w2HHzHEADpqgX1vTZMfyqlcLKDzdL0/cDMAdFYGrZC+7O
         x4cibUdcpVFnRc39kKW1DPq2MxJVwJbyjwzmjtf02rseDLuYvViZ5QWgmTYuOtkGOiYO
         626hUGvh8OR0QSz7VH6TTdcPe9++sbr8r/2BQyB+2omtYtJzjbCB/zGpsvCxWMheeXSI
         UAqg==
X-Forwarded-Encrypted: i=1; AKwUvBwCbl+OSbnfmZxQwhxVyZL5dxAqfwogzFrQ6vXokx9jk5NxbEJ1EVbYC8DzsRyb5OMA3MGwshWuup+LS6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGXt1wwUMq/o4ZcPR2ifqlSZS6Acxi8WSJ29LG96qff69QAVEZ
	G8eB8FpL9lFYmdR1AJl9VVeBxzvOVjoXM/gOVC0brXbcaAG5vOXhB24D
X-Gm-Gg: AYBFou2grXkRUnyTLmORDKJ2K0wSKV0/e040xphtWUhOQcL/4EV1i+ZZg0oMYdxjwCg
	gnB7lufjvgI4/R77+uPcBvKj9VapU7ec+hsx2ZY4Ud2gFwWeUogHv16usCbbd64gG3Ksh6Ze8kQ
	OoVKX4BfWR2ELz/jbSfgQc+UgoyybdGRubLi1SA97smN2yw0YgrNqW06U4TxPVdtaxofGiGc+eL
	yiMwiTEKOQSlyHtRVFntfvNw5BceAitvcb2kKtZtopVd+OlVDjhNZd4Ypn2bbI5eF2Zp+0Gv6Cy
	w1caxL81a88zec8Xv4zBKG/mC6DR622zhsy4vArqBYH6VmPfT58XYLOkGnwMkKq0kZPJdEc/7Iv
	uP3Ov00zelF3q/vk4ctRyaMgu4zRM6xBD4NPJ+pM7VOVcC3RTz5nq9Mvz/yHEnuyZcgBZChyb+S
	XRklw/m8slSUgU3YQV639etrG/idn6WMTrrzVeA1AoXV2I3WwWUiGrfLf/o6Fm5/YqfFERPaClp
	IUi2TO7720M7zopw3yKWKpdwOmBi2AVZYdTDKoSbnw8tckNmNruase4pD7lit0wLNweYqAxO5nz
	ZyDHUHQ=
X-Received: by 2002:a05:600c:4ec7:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a1d760410dmr1027935e9.19.1792162527070;
        Fri, 16 Oct 2026 07:55:27 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4ecac3sm6026423f8f.27.2026.10.16.07.55.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:55:26 -0700 (PDT)
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
Date: Fri, 16 Oct 2026 15:55:24 +0100
Message-ID: <20261016145524.36641-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <efe328a8-83d7-48bc-bf45-90f3535e2657@kernel.org>
References: <20261016-x1e-cphy-rfc-v2-0-377654253193@gmail.com> <b96649d9-5c1c-4fc0-a77d-d0076cf80b86@kernel.org> <20261016113259.40819-1-geocausa@gmail.com> <efe328a8-83d7-48bc-bf45-90f3535e2657@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bryan,

On 16/10/2026 14:27, Bryan O'Donoghue wrote:
> The bit I'm a bit alarmed about is "stuff was stubbed" which makes me
> wonder if what lands in -next can then said to be actually verified
> meaningfully.
>
> Could you git rebase linux-stable/master for your 7.1.5 tree maybe ?

Rather than rebasing the 7.1.5 tree, I built next-20261015 itself and
booted it on the Surface Pro 11, with nothing stubbed. On top of it:
this series as v3 will post it, David's v9, the two CAMSS patches from
v1, and the sensor patches under review (IMX681 v8 with its C-PHY RFC,
OV13858 power-on v3 and its DT support). The board DT is out of tree and
follows your x1e80100 camera DT v7.

On that kernel:
- front IMX681 on CSIPHY2, one trio at 2.4 Gsym/s: 3844x2640 at
  30.01 fps, and the sensor's colour bars are byte-identical to the
  reference capture from the out-of-tree driver;
- rear OV13858 on CSIPHY1, four D-PHY lanes: 29.90 fps;
- the settle count reads back 0x1c in all three trio registers, which
  is the computed value.

The same boot also turned up a NULL dereference in the CAMSS TPG test
pattern control, unrelated to this series. I will send a fix for it
separately.

v3 will describe exactly this setup.

Thanks,
George

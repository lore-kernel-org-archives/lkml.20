Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9D537F30C
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 07:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792220688; cv=none; b=bN/b3HQsWoz/zG4CMtj8GfnC0Zo9+LxLCYZ6cuheys1oJvI8f+clL/K8XhLuLK6OLhNtnxwSSRTA+n31UwQ30Zi0XAaoRwLgnWdx0Pwv/z9NPhoPrhxEkTZi/RVJX0T17QFEqKhRz7uWbKbIZPHMAiN36+nZ9205yG+uAHU/ILg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792220688; c=relaxed/simple;
	bh=rxDPqqfdCHuDvD8yKQQePfEYQGgg7u8qfF++9QenVmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fx+5tRPoBcNzTJkdcmdNw/Yz5u/fj6GmPplm06VpoegEOjITO0gNPG/S7c96zl44RyNagjX61+DMu0/SHLcjncY2H/6asl38xsx+hauFCKfQOcfnGmzaNoMxnYOOK317uW7LEsqYZagBUWkWhv564LP9M5FHhM4XQAXB1TsOOsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cGwU865j; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cGwU865j"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so3877335e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 00:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792220686; x=1792825486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WbAvIHCV2ZftO19xbd69sV1gKtlfgITtC4/NwtZnAR4=;
        b=cGwU865jJ9K/kd2zsnbgXD/+OXDAoBsJAmGJ3UbhmZRT6lCNPeMsDp0V0s17cC4y75
         BjFDmS6uryJohps17CAu9+Djv327S7QJHpTEvIx+4bvHSgPOYbjbZg3mbLkrUXkvBHOh
         qCgbkCLACJGIwxGs0qWfxS1inTGjEAU16bMUg0gHBc3bYgaPciMMUGxR9LORNqSd6eto
         EObGTb0XZS5I6OHWCwJohX5whh0uBzsuC8W3tbGlVY0yMnUeun/Ko9py1bnv8oz4Ecfg
         LQxuzOoblPZvdcZwmmN1orakp22TtAZKtdA0mVdfRJIQ1clO70mVitjBZl5citEy3ECK
         6Uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792220686; x=1792825486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WbAvIHCV2ZftO19xbd69sV1gKtlfgITtC4/NwtZnAR4=;
        b=iHzQnCwzIPTp4Rxy/qvVVoJNUahFkKZeGePKZpUjhXWNqLsECj9q6I54WtqBT6PAFQ
         gmsnlORFSdgjYrT5OH0whw8qh/Ug+QwYMSoEBEi7Zu4lYVctrI1vFAUR0AC+iHWwZVjn
         vFpBAXBoVVjmyO+WzgGaKJJo4KRZgwxK0uPiRVcQySomktDxFuEz/fhp9AwxHmjWy76K
         VPiHG8+7p67LlERebdHEyuvXGOP8Lk16XiDUcaLZmI+SRilX38IoLWAJLp+47XX9v5V0
         ptaOQ+5ZKymxo63rVrunrMKvN9tLCNP4ohcvENaq5wKiwC1Xp9MBxhoOvSOxLNoy1ymW
         9xrw==
X-Forwarded-Encrypted: i=1; AKwUvBwqH256RubjhOjo9nQ55XGIwmNDUEx32Hoi5AbZkCQEYWjY/HVGYDSa7b/6VEOY2Kv4aU1lt0y0Qgq7gWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLR9cd8a/1M0BzpoqAj53vI1qWBis70wGkK2gitOJ3yal3VrGfY
	TmYS0k8benKWCwU30fmyvuYm5lUod+j50P+apRjirMVJBdSTqimI7GIp
X-Gm-Gg: AYBFou0GXr9aDT5HW6Erg2OZNv8cbmhyg3IMmTqt+I6bHFLHoUVpBKRcanr8vgZnzAT
	T7odFq3giVVHNexzCKNpNHVC5dKw3MVGUq+EpCiGL0p5zUIaeixerRMGe7Qj5OKx9X7snVOpLmM
	gQi+nE8gQyRdo3BJGPV6iN0Ef/2wjembnTeNT3lGMuDQR5dyVJSk5V14cjVM8iAitJl18q8LcyN
	qeRtTJwZV7QpqkBxben7pdlYdqj+vRVGeQmGOkIj9vWoh5NS1B3Ovneb7Bug2GufVER4xsfrThE
	c2t2B+hPVUiPh38NymToPE4+eFqXRhrOBi6+5Lj/tDTAYH+BCMGBxM5hxDeFwpnrT+IW8QdS/P4
	A/9g2uD60tIAiC3vmWUc3TuMct660MgacdMJp8U8TCCuy0kO7bt9AqlnUJSvY8zSHEKtuPBL8RW
	iYzBeeRZgPG89kgCiQzlQCDbNeBI7q6l/AC3P287tGBOYC5Jy6ZJBzyp22nAyUNwYraOQ5oZUWl
	cCeXdnPsFLWvmVgTpfDGAVyqNznnEdVsKR8kVigtjYSJwLlOEN8eaVcI9xjwGLwodliH8Xu
X-Received: by 2002:a05:600c:5251:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4a1d76315acmr38850985e9.34.1792220685574;
        Sat, 17 Oct 2026 00:04:45 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b35a6sm194605425e9.6.2026.10.17.00.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 00:04:45 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
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
	linux-kernel@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	jigarkumar.zala@oss.qualcomm.com,
	hariram.purushothaman@oss.qualcomm.com
Subject: Re: [PATCH v3 0/6] phy: qcom-mipi-csi2: C-PHY for X1E80100
Date: Sat, 17 Oct 2026 08:04:43 +0100
Message-ID: <20261017070443.989736-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
References: <20261016-x1e-cphy-rfc-v3-0-40a346a72153@gmail.com> <db2fffdd-634c-4728-a2a6-2ab1816b07ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anusha,

On 17/10/2026 05:31, Anusha Arun Nandi wrote:
> In our series we split C-PHY hw-ops into a dedicated
> phy-qcom-mipi-csi2-3ph-cphy.c (mirroring the existing -3ph-dphy.c
> split)

Thanks, I had missed your July series. Your three series cover what
this one does and more: the generic C-PHY API in its own
phy-core-mipi-cphy.c like the D-PHY one, the C-PHY ops in their own
file, two SoCs, and the CAMSS side including David's patches. The split
makes sense to me, and two versions of PHY_MODE_MIPI_CPHY should not
both go in.

So I would rather build on yours than send a v4 of this series. I will
send the X1E80100 sequence as one patch adding it to
phy-qcom-mipi-csi2-3ph-cphy.c on top of your series, and test the whole
stack on the Surface Pro 11 (IMX681 on CSIPHY2, one trio at
2.4 Gsym/s), with Tested-by on your patches if it works.

Review of this series raised a few points that I will check against
your patches and comment on there:
- the settle count computed from the timer clock rate instead of a
  fixed table value (Nihal);
- a u64 symbol rate, so 32-bit can hold rates above 4.29 Gsym/s;
- trios instead of lanes in the C-PHY options (Loic).

Also, Vinod and linux-phy are not on Cc for your PHY series.

Bryan, Vinod: unless you would rather take this series, I will follow
Anusha's.

Thanks,
George

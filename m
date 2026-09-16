Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2837A4A261D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565390; cv=none; b=qgCcu1oyTBN7/PyoixKJhF4keAeojMiO3BXkxWrVl6x7EFaDUF0YS+Zf0HCHqmLoN+Q7Jlf19G9c6UvI1l5eefQXfF39mjFWt0Cvs9hU9HYKRowm3IJh0QyK6d3HMWuMxrmncp5/1BL6X2FC7jHIe1LtF1abcODtm5sUt/c+VC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565390; c=relaxed/simple;
	bh=pB0+L5OLcmL52KZ7MnLhTwXXE7rnrcFAPfaF8iIliJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dHJbL8w87Oh1Lm3JgcF4Ma41veH8p1u9WoFoeTDl1j1Y0OTknRdXKcev1VSMrO+Bb1yMqRk1HaOCDNw8s0v3KTqVjhUV0Zn4WwW1dPT+IdUSum4w7/S9Xmxg6lG78RufrFtHdRzDXb5sfM2li3+yZUcf7yEocxg5R3z2cGgqvBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOYEzCBO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOYEzCBO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so6654845e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789565383; x=1790170183; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rUUWWKVmm3TYP5508zsFDBoNmLN2rO04Kb+yJop+U20=;
        b=pOYEzCBORbyCAW/s2EBBA5pbH+5U1HHxTzSbzrAy8aWjU6gEXH6U1t2MIwdKBHN1Vv
         YJ2dUCSypttpbFbcNjVo4OHPH/5wIfxH02K86N5v34LCma/Z86/unOYoyZ7OP5zRijAU
         DflsZicpob2D34cHC50hCEtFpMgZonZWzQpdOTBPR8dHuFn516KVFZ3NlSNZsCrmdEb6
         cqF+hAcwbtDKEZtt/9UWUh6ESBlRHtiDNvuLYvfWPqgJPi3uEuSatM5dv12lmncwN1yX
         8lcS4eVd8ezclT49xaPkNZb/zTnWfXi69s2ysFg1AqrOVrAHAnZLL+KxI0oGDb/Lyy1G
         YKBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565383; x=1790170183;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rUUWWKVmm3TYP5508zsFDBoNmLN2rO04Kb+yJop+U20=;
        b=oluQ7/KSEJcgVsV5Aiijcfsjf59WjMdCYsxnxYW2Kv40CvwUsBkpp0UV42XcDExBFd
         dalKQsFT1g6crAJxZWfQwAnYcZNOc7pYyoF3/18y6IYoOJ3uyl/aSwvYnZmyy+l2oR3q
         iTRGbPDOlk9wQrdd63eGYvQh9khnvy6s8L6Y4krV6WoliO6K30KYm6G90gJcJbRMNEkL
         34oxKIyNHieVjTDlMTgBQLZRM/a/+YYBnsf1n+DXmCiSG56lPThveC5c0Bq8vMJnbW3J
         tl5KJn5/ijzJrM5UHxZtIrTBn5wbwlymLTX+a/+8gmZxdlaia8+SsZpIJy1f5FQEg59u
         5xqA==
X-Forwarded-Encrypted: i=1; AKwUvBzbwhBDGWuzyz44X0QiXshDAnQxXuOWW8cRMIbPee9nJPX9vSaPsEWo79Cbmoj3C39x+SPEvAyPpLs5j9A=@vger.kernel.org
X-Gm-Message-State: AFuF++lDee3Ktlt9KC8wksVgIFwIBtgw715zJihzoGnC4sUqsRHg4dfJ
	CaLvefbgRbFvW9sXbWsNF1InHHZI8SHDQ/DMbG4N5unDgCDNKdPk06F3
X-Gm-Gg: AYBFou3eTGSg2pJbYucdmAMb5F1rSAH4sA70lkqgiZsCN2x8zbAqCm5fOmle1iWiB22
	Z35lIfk+l0ganmW4jw1Pglzi8JtlbGBKNqxjmM/IW/OeWvOq6bo2cCeSEwd8Lg70jO60epAnOw2
	aiJBhR0Sftwcqeq5oftWHydFTpRm2p4pbfdaPGs3Quf/SCG325CZManS45OaaN8W2q7dsri5kBu
	XTlztWQZnrLTuzFrr5NTYLPQyfUsQimHNAPTkkoQmyQ50wdsR6kUdtZwEhdASsc4CYEBCpqXsuE
	olDL0CVkRBus19ovXd9rdI/X3tJ6x3THSnDVPeZTWXdbnnS/raCwwR6kzv8cDVSXDwFCYkyNp3I
	ZwH6Z39rVjRzAq4gvQ0kIhk4s9a/eIj4xROnfxHIB+yyA9hR8wnRdoSKQdE0QVooUrEBqSeME9h
	pbmAfKa7S2dnzVQGMuAfizvn7XBmXye8Cl433rWXBBddS08m5vXRpzlnQcks3KmqX2Jv5DWnyD0
	fA4Bs8SmHg=
X-Received: by 2002:a05:600c:3ba4:b0:49d:17d4:d6ad with SMTP id 5b1f17b1804b1-49eb7337325mr40903525e9.23.1789565382845;
        Wed, 16 Sep 2026 06:29:42 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bf1f80bsm6884173f8f.7.2026.09.16.06.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:29:42 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 3/5] media: qcom: camss: Add support for PHY API devices
Date: Wed, 16 Sep 2026 15:29:33 +0200
Message-ID: <178956537382.2699.6279926603215472320@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
References: <20260728-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v13-3-ae811e2f0799@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Bryan,

On Tue, Jul 28, 2026 at 10:35:34AM +0100, Bryan O'Donoghue wrote:
> Add support for PHY API devices

One thing I ran into while bringing this up on a Lenovo Yoga Slim 7x
Gen 11 (Glymur, ov08x40 on CSIPHY4, two lanes), with Nihal's Glymur
CAMSS series on top: the two ends of the CAMSS <-> PHY link count lanes
differently, and the CAMSS side silently ends up on the wrong lanes.

The csi2-phy binding numbers data-lanes from 1, and the PHY driver
converts:

	/* Convert data-lanes = <1 2 3 4> to bit positions */
	csi2phy->stream_cfg.lane_cfg.data[i].pos = data_lanes[i] - 1;

The CAMSS endpoint still takes its data-lanes as 0-based positions;
camss_parse_endpoint_node() stores them verbatim and
csid_get_lane_assign() packs them straight into CSID_CSI2_RX_CFG0's
DLn_INPUT_SEL fields.

With the reference boards' style on both endpoints, i.e.

	&camss_csiphy4_inep { data-lanes = <1 2>; };
	&csiphy4_in_ep      { data-lanes = <1 2>; ... };

the PHY enables physical lanes 0 and 2 as before, but the CSID is told
DL0 <- 1, DL1 <- 2. Everything probes, the pipeline configures, VFE never
sees a frame and nothing is logged. With <0 1> on the CAMSS endpoint
alone, frames flow.

The x1e80100-crd and glymur-crd sensor patches use <1 2 3 4> on the
CAMSS endpoint; with four lanes that yields a lane assign of 0x4321
rather than 0x3210, so either the CSID tolerates it in the all-lanes
case or those boards only work by accident. Two lanes are not
tolerated.

Would it make sense to make the CAMSS endpoint follow the PHY
convention when its remote is a PHY, so the same numbers can be written
on both ends? Something like this on top of 3/5, against the parse
function:

	if (!legacy) {
		if (mipi_csi2->data_lanes[i] < 1)
			return -EINVAL;
		lncfg->data[i].pos = mipi_csi2->data_lanes[i] - 1;
	} else {
		lncfg->data[i].pos = mipi_csi2->data_lanes[i];
	}

where "legacy" is what camss_detect_legacy_phy() already computes, and
the binding example for the PHY-attached case says so. The alternative
is to document that the CAMSS endpoint stays 0-based and fix the two
board files, but having <1 2 3 4> mean two different things on the two
ends of one link seems worse.

Happy to send either as a patch if you prefer; this is your series, so I
did not want to do that uninvited.

Thanks,
Oleg

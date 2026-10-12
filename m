Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9616C4F4CFF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841663; cv=none; b=jkJ6zfVzmrLs5xeyI//Y3VYTLIbgOW67+/Gt1tVCMtOXqaMj27+AWdGTKRwBoh4RXCE3hm6mHh0wGl4v8Ju6RahWKRhF30HOdZkIg1goEfuF7ATs9DS/WnoCpKbAlX+PMaE6Tzc4mqoA2pDcKSzS0sE3RbHnZEjNLheWtd2n9C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841663; c=relaxed/simple;
	bh=gBFBxLm8HkrP6Q8DthyOwtOjSWDTaFoDbTRkrYjC0pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fd6PvUa3mP7LzjOG59eNFi7yep8lT/Zi9yda/6ZYSe6l3b+fb8LpmeCQ9yGcuJ6VfR663MaM7J0aFdp2fRdbNE7RJlEyGRC43hhcepdTe0Rqba5NkxS3thUn1UuHEW6k39iJN54hp1mVuSznd43jE6UDaaz2eOlHdh9ILXqBeeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp3fjWl+; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp3fjWl+"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1313589a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791841658; x=1792446458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=Wp3fjWl+JaP9/5sMmj4HaTG4AWArX95YjxrxwjLkpb9imY30dUvc9ST+Eg0slPPuZG
         QBGzVEsA8TY663YMpP0M0JpM+wFR+y/TVbmh1p319HogyJtzLqyO17GU0RFjWGlYLlqk
         bONZOrDUZjIa8X3g9GDTWuwgI4t98o7Xx5VpPc+jELtck4u1OC/3ChWxdx6g2F0XMeyM
         S0eYCOnD4aJJr0iUmlfk93JF+DLs4Kep0EYdw8aqaKVyb6+rlw+VXNXnQFqgswmawzdJ
         wIjSz69B/v0J0LXNJUcanCOYDHf2zWZBPalbRubZBmxRVyzFj03oiNZkUyT7F1VgF45R
         GkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841658; x=1792446458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQBJTSOmJET7mou+bxBw1N4I5xwZbM40VMBF+pO+89E=;
        b=qFF79wKggcA4BTQtynW7ItL72c70NzrKbs7mk+oOAcdT6extPD/cBcBi+BruxuEg9k
         4TYTRxIhimqwmd5yvdpkwph00VRy3slM068J+XbFJvTbJjNls+fkv14GxW6GiKZQPKWH
         2EUcvfjGq6yF2Qg4qVXZ9rdvXlpiw0FmeViESuM6S7P+xizO7oKd8iWwiIzg19RV82hD
         eQuoXkfTbu8Vtpt/J6rw+joAtzAu43b3r2O6ckCTdqYCAlGquvMYhklLPeyWs7dGt2On
         5ARsgG7IpxkMW7tZn2sd39OFOimBNhK/pcpK79fGqn8/DDhnb+Mxrotfy7eUmju6Tht2
         gPqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfnk/fNR9p7QFydkekOsfOOE5bwWRRI6OtVC8kLqcAGjQReASWgvqoI0lKYyNj4JSW2xLWVtBez6Pc34I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSLGjj9AuKEriTVIadp6QBR/jiY63lsFl40RYmeOCmcvpfdQVu
	v+rlNvOZZWkHhhrRxDNnPrunjXeVEDaXmL7B2zo6kq2+QXu4ib+k1rhA
X-Gm-Gg: AYBFou1Tos9B05qBugy0GQoUj8r5kt+y6ry60GqFiDvkL3fx7AjzVrCo9XFZ7JlafdC
	fTUrynTeLEXm4tYzLXM9Re0hb49srP+kU+2vpfT5c00DMDXkgSm4n+vOc5vHKAMUGW6mv1uXOgC
	yjJMRNKwJYiEiS6/9kGCcd6V8393ruGB71VHbDr4UqqGEx3G/m2a7DaudJ0qSDjMiTkfhhueRKq
	MN09webfvpKWgbxaHurMxjXaJoxFfZ5R2vJ+S/0+8Iu2BYpud1Xw7+gNqQpjfa1dTlwC4h3/NZF
	Ra/QRmZdft06rlkKkynSNO5iPeDnoiVxp9VjfqvMTOU9oB5V4WgxfxQcRf/m05UnOcKphVOSKr0
	Gp2ryWhz/m0CXRhHwa6JAeLTcTYBqrBl1ZJD1KYqmu6rzSM68RgdUtp7L+w8v8puGIeN9ZjL3fL
	oWuHr6by1i/pHsQ3fyg8rnQWNilN0+KegBwR9KjyBTXQzj00K8wG891eWExAavEs7bzOJzNQ4Ui
	aiZ9Zs55MucFj24cfM5/YwzH/J6xfFad63mY18cL0tpsuiCCRFG9rFTdtwjUA==
X-Received: by 2002:a17:90b:3b84:b0:3aa:f4af:1e16 with SMTP id 98e67ed59e1d1-3ab3a4871e5mr8322337a91.7.1791841657487;
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
Received: from ryu.remote.fontis.id.au ([2403:5814:a404:0:cbc1:7a8e:f385:c576])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abdd5adaadsm7208435a91.0.2026.10.12.14.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:47:37 -0700 (PDT)
From: Lloyd Hazlett <lloyd.hazlett@gmail.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Lloyd Hazlett <lloyd.hazlett@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: Re: [PATCH v7 03/12] arm64: dts: qcom: x1e80100: Add CCI definitions
Date: Tue, 13 Oct 2026 08:46:57 +1100
Message-ID: <20261012214658.357133-1-lloyd.hazlett@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-3-1a63eb35838b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tested on an ASUS Zenbook A14 (UX3407RA, X1E80100), which this series does
not enable. Applied onto next-20261001 together with local nodes for this
machine's OV02C10 on CCI1's second I2C bus and CSIPHY4, written to the
pattern of patches 07 and 08.

The sensor is reached over CCI1 rather than a GENI controller, so these
nodes are what make it addressable at all. It binds as ov02c10 11-0036 on
a Qualcomm-CCI adapter, and libcamera enumerates it by the path the node
gives it:

  /base/soc@0/cci@ac16000/i2c-bus@1/camera@36

Both directions of the bus work, not just discovery: the sensor's
auto-exposure writes take effect, with analogue_gain moving from 96 to 199
between captures as the scene changes.

Tested-by: Lloyd Hazlett <lloyd.hazlett@gmail.com>

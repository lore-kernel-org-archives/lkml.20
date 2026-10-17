Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3232C1EF39E
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 10:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792231952; cv=none; b=EWePjyGpps4JbDoRLDRGz5i72YJnsY8c6BeOGlBhJZbNTRs3IZp12t8ZVsNZ+gyORHNj+u8pMJojagtpHNMl8DLY7s1+Im76ScbfVsXRmQ/jh3hL3X/4pSGk7ZU8e9klHHzxpk3PlDdH02Wknn/Pu4pQPIpIa4GXz2f3/2JhUGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792231952; c=relaxed/simple;
	bh=qzvrrLy2qj+cZQoZi4u9ExBicE4rIpxnRBO9CfMg51g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WNHzGxKbDqwmL2hQV12EUMWdeRu8Xj/kEfnGfvTE9e44lkOjTP9jo52fqbXwUhhcMFGHOl/G7aAamNhe6pIsxkAxnbnxN3HQR9krgEmDxgGCePnF6mt7rfdATq//v9PHLQPPGL0bCoSHlbqSeSQequVOKOtA7MT/j6p74JBfdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC4AEspa; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC4AEspa"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e0d885929so95765f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792231949; x=1792836749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKoUY67/0brH9PfrEtDz8lEuDjVGpCp9GkyhQChz7oI=;
        b=NC4AEspaLZ0jkCIpN6Uk3ZRdt+4i7DlqAmAQ1r0JyKUZlNTH/uOHj8hWMewDJt57s+
         xwrGpxlFXIc5l+wn7Wf8AvsKPKzg/qvKGzAQ4jXGV3FWAT2RxJTdSBtjYTjTcoCBW+FC
         eESeNMxGDzKm7iMAs6FlcbrHNQWJKcAfX8Vu1IGwG9JDgCiBbI576vCnt8RLjp3t2bXu
         xJfvGBrm+VMUozelVlQHpHoQJl0KayFgD3PdozYphwRjGjQd6o4SszLT62/FphvkN4wX
         Z7/I8m2pmvDlrAsjzcbVJl1XH8jcUad7XuappsZG6R6okSZFYyvj9CVfpQnHYtY3HTaj
         XIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792231949; x=1792836749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKoUY67/0brH9PfrEtDz8lEuDjVGpCp9GkyhQChz7oI=;
        b=DdfY07Nsabz4nxjPT9Xim+05teF4twXjUiLAOl6bllPYvxpWcuGEqFiLTaHlmXokHE
         6aIEx76PDlQBpF2heVJDHgn4xasxfQsWCBywCAiEuYckrixduv3HFQHKq2Uj4USRqdky
         LHejYn8UFd8P9CDN6bzgle85UQkvAZTGaKgAs2GWKywYjv+piw6eKNhSxcBcYwmJNx4R
         bsBAu+zm8SrS8u6//RvZQghHpJOxTS3d23m4fnkxgPjsLNmXh8t6zUD/IXMR3mBA2zqz
         e9dc9RjDe3CPjVGiWA3DN6rcIp8xP5FMxdcqetY1Ekt1Vm3J8zrpNFroswuBB1b8cUhG
         SnBg==
X-Forwarded-Encrypted: i=1; AKwUvBzlLCQ6q1fUwHQU3lRntTFdm1P/X5c40Df8GL5Xlz65/9nG4ANFgDWPvlYUTcGioRpv2K/XFAlUjD0Bf+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcpSwpppo/lfZDYjhE4oPH8q7syz1h6crcf68Gjwjh7QfKrBxX
	aT1fwfIc/Hb5Xnh+VyFqfRHkYTqXMtgjfMd85hsyPQa5M1MaX6lARxSp
X-Gm-Gg: AYBFou3I8CximRSX6SXWXVZ4o38lwhwgs38vL6AkVpUytx57oXdeACkko9pCSe/K0ph
	7DXPp0jFocXTdpGUb2F5XZYdMjgwAcMZybPTP7JXdOJ7lVyikdeW+GsQcwQvem3FmPKIu9uLyJ5
	ZHvl0IrGQHZMArkzrbl4/8ACV1UZHUXHNEQZ2Al7UazoUr1l8K/s9BSfRSptgmJ8Cl8ukcKucDI
	GSTS3wbAOuGWgptxmTFLcN/2l0ejopx5OH4dxsnDHqubRhSYgxzvMXWxRJKISqrsZDSl0ym2yFm
	b+IIPeLVBFSDerxChyZIZZdOI3iAHEjwzhjbTG8cxSOhdQ676cm3U5/h4M9nvIzScJNw2wZc/Ah
	KH5yKQlWEcuscBiG8UoKva0XaV+vYZ5DY7xsmA4Vvfohd6ZIFdZCArZYMLyJS/JYTdBT24tXEZY
	WcYJU0AWU5NM5AlBI5kPPXcWR3l1xbFM0PbRIv1GwnBkI13VSfm64+DTs/l/aQflZU/LA0Huk4I
	bJlGaUSTc5/hsHkQIxP0AaOo9EjG9nH8tBEJ1ikkfSvsXwxj52AQ6sSQpPHQ/Z/Z3UFDWOl
X-Received: by 2002:a05:6000:14b:b0:488:8525:4979 with SMTP id ffacd0b85a97d-48e07fb5261mr2934328f8f.45.1792231949280;
        Sat, 17 Oct 2026 03:12:29 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5957sm10183948f8f.9.2026.10.17.03.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 03:12:28 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: David Heidelberg <david@ixit.cz>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	gjorgji.rosikopulos@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	hariram.purushothaman@oss.qualcomm.com,
	akapatra@quicinc.com,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	daniel@quora.org,
	konrad.dybcio@oss.qualcomm.com,
	christopher.obbard@linaro.org,
	alex.vinarskis@gmail.com
Subject: Re: [PATCH 2/2] media: qcom: camss: account for C-PHY when calculating link frequency
Date: Sat, 17 Oct 2026 11:12:27 +0100
Message-ID: <20261017101227.61271-1-geocausa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com> <20261017035221.3816464-3-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Anusha,

I tested the CAMSS pieces on X1E80100 and found one extra receiver path
that needs the C-PHY select.

X1E80100 uses csid_ops_680, not the gen3 CSID path changed here. The
C-PHY flag reaches struct csid_phy_config correctly, but
camss-csid-680.c leaves CSI2_RX_CFG0.PHY_TYPE_SEL clear, so the front
IMX681 stream is decoded as D-PHY and capture times out with a zero-byte
buffer.

The equivalent change for CSID 680 is just:

    val |= phy->cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

before writing CSID_CSI2_RX_CFG0. With that line, the register reads
back 0x01300000 on CSID1 and 3844x2640 RAW10 capture succeeds from the
IMX681 over one C-PHY trio. The rear OV13858 still captures over four
D-PHY lanes.

I also ran a control with your posted CAMSS/qcom-mipi-csi2 module code,
plus only the X1E PHY table and this CSID-680 select: both front and rear
capture successfully.

Would you prefer to fold the CSID-680 line into this patch? I have a
clean follow-up commit ready if you would rather I send it separately.

Thanks,
George

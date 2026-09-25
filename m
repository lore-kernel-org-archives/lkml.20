Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1104E80B2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354525; cv=none; b=HR7Jk2b0Zbjx2Glff8JLy70mjkHd4xdGl7I2Xka1PAUdIkyPL/9ZVUPyWiw56Ro/UKxyjzaq+XmAABEA4J2g/IHW0OzHM7sPQ6PXnJJjDUA0t4WlJrxI8n8ITHW+vhSqipvx/FPmHkdSyzZHJINjiKsdhP1jhsv+PcY0Y+a7x+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354525; c=relaxed/simple;
	bh=fggcrxfuRaOrEhqaxdzPjwQprECIofXEF06YEsSo3TQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=axKCkZvRV1WNKhdqM0F4TYooaOk6tUmdRBqDOV8r7xnS2g+7Dg8FPvrK33vS9wAt5YAQaS3alw3ru1MY+x+UiCK+NNGwzlbnQZKK0UymyfjA9I8k7s8zA86sif+Lx/Fk7syFMza+Nh1GiP1STCWfLDaYy+V+oGt7UwDHBx0q1pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org; spf=none smtp.mailfrom=thinkoid.org; dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b=ZjNsImsp; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=thinkoid.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thinkoid-org.20251104.gappssmtp.com header.i=@thinkoid-org.20251104.gappssmtp.com header.b="ZjNsImsp"
Received: by mail-qk2-f39.google.com with SMTP id af79cd13be357-939922847efso98803685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thinkoid-org.20251104.gappssmtp.com; s=20251104; t=1790354508; x=1790959308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fggcrxfuRaOrEhqaxdzPjwQprECIofXEF06YEsSo3TQ=;
        b=ZjNsImspxI7ck/a1axuhV+jVE75x4V+RXSRPRWT4pc2p4pxuEljKc3/bdCZsX8aV/8
         aZcJtY02mahB5JZa/qIm9Z7dJ2C5GrLrCIRh6yICkwAH6i2Cw6PbBZ6D8A55Xjf2gt6Y
         2KbP2/YF81/P+Z1I+Yp6bSy98B/p5SWDfA19ZVluyoq8NUwkay8quWmmmGMcdQ2BzPL5
         OBujvvXAZNWa6Ji0r59RVeVBM1SJ7Vjvgvl0ea8hGcMofzlrCMlXuQ7SzEXjxhlKUDEs
         EOadtXUU7/e/UPPDNDn5DKk2ripXpWKbL9x6nk1zCaIGChuB4HKOr039057O7u6PY3WL
         2kEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354508; x=1790959308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fggcrxfuRaOrEhqaxdzPjwQprECIofXEF06YEsSo3TQ=;
        b=x1j5gKwAAr06Fs428gFd4CV+hz1btb0jaa/6JseNEqAyI7Pd36Ni5G8eUzdV/M+QrM
         9s8nBeGHy8C9c1+zszwVc1/20M+V7WFK0QUqJERT6r1MZgGB93bcNaIORCTABNmn+AEL
         67xr5quDH3yTG31cJfzeXGgqdvzX444Y/8hglvf7SNugtOaAszDcPMuDQ5s3E7/I6L1l
         gsyTWfDjpWAs60sGPxW1zsTXGlYrEnm1JZXAqLxLkjmYcva9sprYFj41gecHvyP0Q1Zi
         dtSoI2x77hYRc1TJBgI5VNALDI0GAflNjt5aWK2FYT+1u3fIt2I+8Wc8/LNt/DXymuHE
         LsXg==
X-Forwarded-Encrypted: i=1; AKwUvBycxUx9g52AQvsxpRGmYlBFV7TeOkpGom0gqzozKH/gi6XHopRB30+XY4oS9zSwfkIjEpIw6PPbyvgXUXY=@vger.kernel.org
X-Gm-Message-State: AFuF++lW7rnq7v/1pwQC/59TtN9ZGhPY207y1yyovKUBPnX1azJdjpnH
	GyRL+e0FCrSrcYwOJLWjGCOoHCxLcFPjZQates23beHCiugEvFFg3NE+g7nmitLMQns=
X-Gm-Gg: AYBFou2ngRK/w3hUlUL5XdTQfuucJUVlRkUS+MAPNKPCsbtXIksbf0mE8ztfiL5iCbS
	/aUOHL0Ycd905NGLzQDhJKIgVVahfQBiCj1s1oOITy0VZR/I/sAJIgv9yBoYtUSSqsTZgkfOLCo
	Ni1xw/6VTPWnfD8V/z563RUG+UisCaVOid+YqgWKtDfvmYwQFF53JmPQfO+KzGcoNmhzcQ+06VQ
	xZ2ynlF9YiaM84iPwsR48pY3al16xdS+oUQySZI31LFIApSG+fjj7Wuu5urQgM79S0OYSaEF03W
	WnxxyJHgWv4I2Ll962wI7DnQRzKgQ8Z2OtNbkfg2ZEF7JsjdfhVm9zgfnuGHVoy5rsMIH98O5Wf
	ZGKGFT8mzDgZJigZ5t1m7qyYYh7NjDIt/0yXbb/7Y9bni/hnE/fwgMTPx3qqohKfykcuP5g/TOl
	f7K4dexrpucSs+goz5vwegjCN82JrH1yVUXPR4aLLauUT3c2s=
X-Received: by 2002:a05:620a:2548:b0:93a:2d07:142f with SMTP id af79cd13be357-93c43b833c3mr577686085a.7.1790354507706;
        Fri, 25 Sep 2026 09:41:47 -0700 (PDT)
Received: from armok ([2605:a601:a61d:7a00::2])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c54183888sm37869085a.45.2026.09.25.09.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:41:47 -0700 (PDT)
From: Liviu Nicoara <lnicoara@thinkoid.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Felipe Balbi <balbi@ti.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v20 6/6] media: qcom: camss: Use data-lanes starting at 1 for new CSIPHY mode
Date: Fri, 25 Sep 2026 12:41:38 -0400
Message-ID: <20260925164138.26326-1-lnicoara@thinkoid.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-6-dc244e124e71@linaro.org>
References: <20260918-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v20-6-dc244e124e71@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 18 Sep 2026 14:56:41 +0100, Bryan O'Donoghue wrote:
> Introduce a simple flag to differentiate between legacy indexing @ 0 and
> new indexing @ 1.

Tested on a Dell XPS 13 9345 (X1E80100, OV02C10 on CSIPHY4, two
lanes), same stack as for 5/6.

Without this patch, data-lanes = <1 2> on the CAMSS endpoint programs
CSID0's CSI2_RX_CFG0 to 0x00500211: CSID listens on PHY lanes 1 and 2
while the PHY powers lanes 0 and 2 (COMMON_CTRL5 0x85), and no frame
arrives. With it, the same DT streams at 30 fps.

Tested-by: Liviu Nicoara <lnicoara@thinkoid.org> # Dell XPS 13 9345

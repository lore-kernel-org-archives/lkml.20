Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E26443C26;
	Tue, 29 Sep 2026 03:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651783; cv=none; b=Dp09B6AHy90bjP+K9Garzktp/g+2bknW9xp2g2l7J9iycn2MuX2ENVoAMoGh9pchpl7EZHa6I1rs42Xrt9nfSXZMQPLhZ7Qh/tYpMYaEa0BcyXVV1AuR8SF9XJl6Ly2JvRBkSFURqHF+q4cn40KhzqAgzrqnM/hLpqQMq5pA5Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651783; c=relaxed/simple;
	bh=v7VPoa4lzxOzrwlGfJKA0ieVZ+g3dgqkncfJGHlkWGU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GBQvmLAgkHORrHBw13806d6Sk36Xwt4V/z2FNf4C2ml9n+wtwTN9NOnzjGEFUud0BV5QJr6hDSHVyanfD4tty6IYcnO/jzmYvHIDQe594gBqUskUNUPo+lnET4EBcqvSlWTfuZW80T+fcCauDFofIUsz5dRETrmTDk9wGHzo4LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QgSXb/gz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QgSXb/gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DABF1F00899;
	Tue, 29 Sep 2026 03:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651775;
	bh=0ohlPmIWFldfey9QmVeEfxogMhYCAEr8G7bJBmDnMBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QgSXb/gzdvD4RkSp9sinryAaUE8SsPp8nY0/cgu1AEB0zZQDbzEef5/wZs1Til14k
	 opA/jy6nLSjgrRiI06er7zhh60mUmxdbsiiSj0R9zFR/BcC+jD+wr12eWEyebyIVfX
	 MX/3v/NCYREqCFWDuoD5KndvqCtvnWXEsRre50EJ7AcfmDswJR1NlcFfR/+gk0Sgzb
	 bum0eNcl2ZofZzJC0bEmKAXkptb6j/SBDsGln0urn4PFWxBFVGAvjULsy8MMuLmBC6
	 4wntOlKIFSevXmy/Wd7HqZDPTTiEmvaQwbrLt39eOHZrj2KBYxCmWV1xLspzeIeljv
	 414ONv/8p/h1Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v5] arm64: dts: qcom: sm6350: Add CAMSS node
Date: Mon, 28 Sep 2026 22:15:07 -0500
Message-ID: <179065170964.2673486.936406235602291576.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-sm6350-camss-v5-1-49020da3bf35@fairphone.com>
References: <20260901-sm6350-camss-v5-1-49020da3bf35@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Sep 2026 11:44:09 +0200, Luca Weiss wrote:
> Add a node for the CAMSS on the SM6350 SoC.

Applied, thanks!

[1/1] arm64: dts: qcom: sm6350: Add CAMSS node
      commit: 0d30774864138136e46e2f209515f7b332cd5c48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

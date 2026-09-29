Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811A7330652;
	Tue, 29 Sep 2026 22:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790722045; cv=none; b=bMJPEVPRdSoex4EUzQJFB17D9gmNR+ubQf/gVlSA7+CEt2v08JrVIxcuyEQ+WoWvXMUmqqTm4NAEzKhxjSJ19fx7DZnghQaxtu/kSPJKW3iO3EyDCSEVR0eMDO0KNaME0Oyy1zNLwbLBXh1LVMOySTlHrUgTViuUvD1aW549dDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790722045; c=relaxed/simple;
	bh=OD31n2ECVkb3iCbhsFdc9ZOrACn0uwFM992vezmCOEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lmTPioSJ0eH9kFFMA1GIQw6uPl0KqMF6Flqp80q5lPAUGVITQOvLNMUXA3TZtII2eBouakC/0VfiGp4iWZkRqKaNCIMM0j5pCFm/AxN/3JV509cawjQl28d/MNYMRfBjbZn660g5FPWK7Ybh7DZY/qQEVXoTvNe8vbnFDOdb5FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZGvepZM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZGvepZM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4697A1F000FF;
	Tue, 29 Sep 2026 22:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790722044;
	bh=Fq9UwA7tmBCoVKr+lTO93Hr+1x94HCbeSeWwfetERnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MZGvepZM8qnDR9CcIfrxZTCVKY+/KLfk7KapWO0mklGkO7I4hEzsmngNqHY/gfJxc
	 i+XgQQZ14trJUPJ573j7h9nHTVV1DUt5docuBHcM/xhHZl3TtgStDhbDBetAqfKZow
	 qhCEqEBSz+KGspB1pdtJUuOslNuuJfpBcgoJOroQbef1EsVHgB/hvJ3d+agl4ZPVCb
	 ZtgLnV11tSC7kKP0hzyjdAA6NyWe/bHAhClP3Rfs19ZXOwfjCIIrwZ9I0czWfn5r1n
	 xUFj9R+oY6OAnKjjhl9EN8AZQxc31/GWMUZWBHQ8k5P+0W1s+dKVaF3X8gGXktcz3v
	 wcoGN2fRFf9AQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] arm64: dts: qcom: Lenovo ThinkPad T14s Gen 7 (Mahua) support
Date: Tue, 29 Sep 2026 17:47:20 -0500
Message-ID: <179072203782.2951570.1766529662437114473.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Sep 2026 15:51:19 +0100, Srinivas Kandagatla wrote:
> Add support for the Lenovo ThinkPad T14s Gen 7 (Mahua), a Snapdragon X2
> Elite laptop.  Patch 1 adds the board compatible under qcom,mahua and
> follows the Gen 6 T14s pattern with distinct -lcd / -oled variants.
> Patch 2 is the T14s Gen 7 (LCD) device tree itself; it follows the
> Qualcomm Glymur reference design used by mahua-crd.  Patch 3 adds the
> board to the QSEECOM allowlist, matching the pattern used for the Yoga
> Slim 7x Gen 11, HP EliteBook X G2q 14 AI and Zenbook A14.
> 
> [...]

Applied, thanks!

[2/3] arm64: dts: qcom: Add Lenovo ThinkPad T14s Gen 7
      commit: 300f5c59beb257550ae3863aeeed2ba63871dae8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

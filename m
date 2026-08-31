Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF9BD48988A;
	Mon, 31 Aug 2026 17:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198850; cv=none; b=dKOkafqIH5K2KyvkrWvbLDvnUM9+oXh0pVujdzPZf5d8eQr4jVSdjAUMi8N4k7ZJ08F3pnado01ROgcqqh0HoutJ2anor948vaZdor5CWdTyjeaCpVUv7KyOunUY8srhBLqmW7DLLgOelxaWNXEZKw0oucWhG0F2NOIfSqdzisI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198850; c=relaxed/simple;
	bh=+Z2EBFoOLO9/dEWJFoUpsVvKO1YWOhk7fYwLwsAeUk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QEBlCKKP7DwWjLlvoS8tlh0mlcVmA0oS5IZ8EEbw+9JXhUGOuh7wUeHl+tpUuUM1D5dB1m9HFq/HkHfzAjcfCgqGV+kvLIcOhHy63HPHL6LGKBe12tMiie+QqZNBwrMA1kBlVhp/jM93bQpnwvMTXIFhzwKzCczC+2XOKksVA1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hCkJqdMe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hCkJqdMe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 923591F000E9;
	Mon, 31 Aug 2026 17:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198848;
	bh=GxDiutAne7CeSBThzq84GD/SgbxMuOPIz22YXMx+UlA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hCkJqdMe13mobMmOG2Wq9kGisVzcXQTjtExB0PffG+3K8ZmOXYY4kqVIiiQ2l0ZUG
	 C/9ZAE31q9m+nPUWkhRJcTR44TeAJUVC3hUJsyK1ZlqlK5MfEWexxph6nsOv6+My28
	 NF6lfQ4CWgVhtHdM5llRJK+Hhuj0RLlCmnhg7pB0kVkQAZmNArWemLVLZOXU3kJ+mi
	 JI/8yi04yLlQ1fZdIet9ul8yJbWyJYhHd2gSFY4XUXAtcRnAWxC88xn89CchYg7VNF
	 bh9eh9YgCE4Wk2eyL/c0sHyB5ituSd1Qzb3VJGBucW/WGf2IfkpHvroZJjfJFxyUNl
	 nt/sQKX06UwTA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Reza Kurniawan <imkyufie@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] arm64: dts: qcom: Refine device support for Xiaomi Redmi 5A
Date: Mon, 31 Aug 2026 12:53:35 -0500
Message-ID: <178819882995.1411250.8777262616139079401.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260820110347.98068-1-imkyufie@gmail.com>
References: <20260820110347.98068-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 20 Aug 2026 18:03:44 +0700, Reza Kurniawan wrote:
> Changes in v4:
> - Simplify commit title
> - Add commit description
> - Drop redundant status propery in LED node
> 
> Changes in v3:
> - Add vcc-supply for vibrator
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: msm8917-xiaomi-riva: Enable debug UART console
      commit: 205e698663f5ed1593fea5cef825adca8828b426
[2/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add GPIO haptic vibrator
      commit: 067e6289a46ec5dffe824f1f4331deec55f4c356
[3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add notification LED support
      commit: e82b1285a11478ef00827b2249c31c2189fc6b99

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

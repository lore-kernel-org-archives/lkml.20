Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CE6490C14;
	Mon, 31 Aug 2026 17:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198856; cv=none; b=O73X7KGyIHkfmO9d6ngqDzmPyMIXxsIU4fnldCq4OMKxgj3iIfUcHNhqi9eK2/0KdkIVIrtibfOWdRP4YDlPQs/Zaabo6ENwlXNNSdscOk99uBa8KjcVogO+ajH/wbibeVWE7ya2P3fe5UFIdurqb2HwdegY0rdNUO7udgYh+WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198856; c=relaxed/simple;
	bh=MYP/IKCT7V7CIWlMxU3+Ad/iToIzDxOyWbzbToXB1/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XX2GfLe8zVAA/0lV2Ald4yd4SRUkGJZ9T0dO11jeliqLbL6IYbIO7xYx5P3bNhWQiMyMgVN9jGw/TMJK9ldUgCYEdHD2Xhz83pK/nV+rEHR1bHOKhEX3bMywoyLvXFn3nLe8TkEyM8xdHtScGs11VmQYb87fhDrs8FuDbOuypPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSB8WQd+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSB8WQd+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B261F000E9;
	Mon, 31 Aug 2026 17:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198854;
	bh=bq5R9FFiEDojyvwVWbwB7Kn6wxZyxrobO4+TMgGULuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DSB8WQd+myAazv4wQLN4VD+RiDRAU6zTm3WH4J7M3YLSut9EY1womoqrVIqgGtjIr
	 C9l0rR5MW4rSSm8yFMT0QOft75l3WpKU/Fq0K7Dmxea/NaiUXFtiteGS8cOy3oo1aW
	 +3MxBzxvfhgtqKGQGm01/CVmd5UUhFL42bCszYed0NhvvqmSvDCA98RzVHc/Tt07VJ
	 yMuOqmhjfOPFl789bGVuMvUJcFpa4TE+vJS+LH7bUX4feheH0geuWmW1HcEiG9ZLen
	 N3Gp+WhtyjGNyq33ZwXVguSwWwXHDPEyXyFpe1xFTBTCYV30qOk0l4RuuRStm51q+M
	 +JChanX7wOGDw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2
Date: Mon, 31 Aug 2026 12:53:44 -0500
Message-ID: <178819882998.1411250.15303424922068348805.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-topic-sm8650-ayaneo-pocket-s2-defconfigs-v3-1-bd8ef3322632@linaro.org>
References: <20260831-topic-sm8650-ayaneo-pocket-s2-defconfigs-v3-1-bd8ef3322632@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 10:22:14 +0200, Neil Armstrong wrote:
> Enable the SGM3804 regulator, SY7758 backlight and Renesas 63419 panel
> drivers as module since used by the display on the Qualcomm SM8650 based
> Ayaneo Pocket S2 Gaming Console.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: enable the necessary drivers for the Ayaneo Pocket S2
      commit: 6f422914412bde4c431706079525c581bf439e03

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

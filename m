Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8953D16E4;
	Fri, 11 Sep 2026 02:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093552; cv=none; b=bQ+1GXs3YDY+5BsR0HljJviPpDvFfZB8eKRXrbQnTUmuKMHBxg6VzFvIbaDBHasbFusSgqzY2hoAdcAMN0V73eWwHC3mTamF1ifX+bYDQfB+0FtQ1SpoQ260sObcbg1nInw3iixuj6dTDSjtyuc4aXguc17owDUr1zXz/fvde64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093552; c=relaxed/simple;
	bh=13PtI+Rg8MRUth+b/ef5/wGv/kE8+GfeJB+CviyG90I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZuiNE5ncC16SBtJXDSz7oTLltPajWduR7U1WPojh1zBVZh2ZGoB9rjQKV8W+8XXFA+WctuKebIWc4lmUD8+a4wGjCkuqG69EJH0dKO0yL32mNjf9P4No69r4iaUx1caACCoyZhB+YBotDgbn+RTGV96Fny39Z+K+uB2EjLHwMZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HM9Hzs/U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HM9Hzs/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 284F61F000FF;
	Fri, 11 Sep 2026 02:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093550;
	bh=W8KzYpobFfBZHjHarsEKRUFk0wtOx0Qf+eYC0M8z/L8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HM9Hzs/UTAwONIiwFugb/545hRz1OYTLeiCtl8R4WbLoSLQo7o8vEPICcDJrUKk/o
	 9uSnZL7+AAC5/WdjOya16LxhBLZ1lb4JwfqcOZeO2zxu41S+6iQZ6cnBPc8MUMkGkx
	 Rt2sUY4m9nEsJ6IhPVO3gjgz3t+FFq3CX5F3er5ML9E8/2mZHsVtBqeDp8+3zBt1c4
	 8PMRlcypVTC0EyXuNOvXQz4e7z24FatCNJxqz1NIcljc23UhaTL2hw5PbsDb28vSBY
	 YHWd/KiJBaSDlbIopvor4ai7BaqmUDA/UYhV5E5RrNHph5JPp/nu1LHiEBNhtzYHFC
	 9Vm/V5OVOcaPw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Add support for SD card
Date: Thu, 10 Sep 2026 21:25:27 -0500
Message-ID: <178909353846.920241.8454936291356682122.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260903-dts-qcom-eliza-mtp-add-sd-card-support-v1-1-25c906b12707@oss.qualcomm.com>
References: <20260903-dts-qcom-eliza-mtp-add-sd-card-support-v1-1-25c906b12707@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 03 Sep 2026 14:22:25 +0300, Abel Vesa wrote:
> The MTP comes with an SD card slot. So enable the second SD host
> controller, describe the card detect GPIO and the board-specific supplies,
> in order to provide support for the SD card.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: eliza-mtp: Add support for SD card
      commit: 8c5264b3da23799798e26962496245164952c031

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169421;
	b=Dhchowxd7SmHYvvOoPOWF8FapZxAwQfRAYInOpjRP4UyMoOQXltd/HDlccVIfBfsdEKZ
	 Y3iCc85DJEtlxqJgA3FWYjjyGWECt1RSOIQXm9TBaAZPQYWOt73osZq1e5n2bdpr0gwst
	 WSpAJ6otUlJXiN5vKRS7V72zdZRqaowBD7fX4DVL/zKerLWI5ds+4u/f6C3mfOg2ckd9G
	 890EWThaYmiwH403Z9wHR5fnrsqycI2D0BMl1lELEUsjmvQmxK0Ou8eI+0+hZY+a7gagq
	 uP/hgO8FtiJjQVWhVkeTXoBSQEeDMRCI3ve8nO6kbJjXyhA16mvVUx+8RslVYeq/AYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169421;
	h=Received:DKIM-Signature:From:To:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sXkPcwxU6YZ8OKvvHZqjFOu5SNL2+1NUSdeOdljECB4=;
	b=2k/OMBAqEaTWAQayCBTCF5K9ZAUS1cwizz2lgOCvqwX4GMJ16FwIE3O/IAKekXdRXAlS
	 b95ptu/Cn0RTsiRz9BQf2JDODrxQFLQUrktcga/lBpvMkrYJb/CbX+C53tScWP+1Kqcg3
	 WS2qyQQLkCPtNDbC8v2czTVl7MhYwFsxow0bJAQGDGZ4QzWxVrH3pvwq/TONiNvC6cMSU
	 Hd/drBHlbmPkvC1Hib9e0W8Q3Rdkwa06GLLvFAwge+NWPkaAHNc9aQ5a3vF/Rjhs0YIKG
	 uHfkTEHTp+dvLt5mLJ2UGvHBLE0pwp2pb3qIU8FSbRF7z86ZtkeYb9ME+mwjUgc5zhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0D0lgz6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F992607343E;
	Sun,  8 Nov 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0D0lgz6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84BF51F0089F;
	Sun,  8 Nov 2026 20:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169421;
	bh=sXkPcwxU6YZ8OKvvHZqjFOu5SNL2+1NUSdeOdljECB4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=P0D0lgz6LD/AT8dr4lJDlAZiGNUkSGZ5bh6kiQoFlVu8nk5aQ0EpPm1FNN7/nRjr1
	 dtnmjGoEVCWr4TJwGI7i7eZ04lASqUEZQos2pn4lmKcSwWibwe1tBEgPLCjeRJKrho
	 5UylMRRVdqgXG+moD9ebZ6IawQkg63CyDUraaiWTNG4XzXDsveuvjxNxd7UsIwcB48
	 YSla7useK6UoJPbcvlH2VKrpZediEryXhFNbRalIvBFlm7itQn9iyGsf3cJPrweSWw
	 BCwEY29RlCoJkO4xAiIMRwfusZ2tmHQORmTMyIdq+ChpW29ZSyu0nIC5TU/7Ag+2md
	 RixboYvIa9fNg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: eliza: Use GIC_SPI macro for interrupt-map
Date: Sun,  8 Nov 2026 14:20:24 -0600
Message-ID: <179416929211.628393.13752107264449337583.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261106073742.99552-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 06 Nov 2026 08:37:43 +0100, Krzysztof Kozlowski wrote:
> Make the complicated interrupt-map property (with multiple '0' entries)
> a bit more readable by using known define for GIC_SPI.

Applied, thanks!

[1/1] arm64: dts: qcom: eliza: Use GIC_SPI macro for interrupt-map
      commit: 23f9f8447af8399f55da0d9f878050faf9e78294

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

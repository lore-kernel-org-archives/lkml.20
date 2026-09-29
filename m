Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFF543DEA4;
	Tue, 29 Sep 2026 03:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651776; cv=none; b=iQVoTF4TYKX1vz1qeG8/Jj0aJHW0Xnvi4E5X9J0E8SBc1dHZEui1vu/nF90lUCsYSKpgz7ANAVBgwrv+q2BYz9CCHzrKnm8nW4LV0JDYW7CCwpug+7tH9sU8aHKy2hOM2tpsTHyGg5TQaiUIfNCIqx6IKtNKxkuJ1nT+30e/TJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651776; c=relaxed/simple;
	bh=xrlWi6Hgqw5dqCNreFy9RZCbFcBfFsn0QSaFeIQz00I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=h9QrOdC9rQXka98T0oQzHg2YM6b78BimqvchhFAm8gY0XOOcQKbp+cjuqi1Mh5xwOItPDmJAvuTXJEnNolnV++J5LgBEEfbfxrzv7/ZEqDZPPPN64j4hs7dxilkjpvBQ6LUoL6KsXduVA2ZUSo0Fu7u72IstkUcvIR3B6CgaElM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wu7egh8b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wu7egh8b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D7EF1F00898;
	Tue, 29 Sep 2026 03:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651767;
	bh=Pu60Aonp5fRplcoVv/G3kuYa4Y5jeXS0EUFSRyUhXag=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Wu7egh8biytkkYmc7niCCCIG4XDAaR7Gz2/TxaJdUAA7P9IEfXyQnajP4bv+OKVf3
	 ips9wyRZZ441mKZdOd8eMhYyCcmUQXfKRqpdUHH6L9ykQR5wNu4vXRVYYBHZ7Hs7Q0
	 OTPrv7m8rEQrmuafCUfofLrQcJb/7ySfD6pmTtjnFnRv4ee/vf0tLKAl32lxVyxCSj
	 Jgghd4EzYlzp1gbnqHJMVO00AR9C16UWwLcXuIrcuIT3vnHCnbvqdEtFXlDojEJ0k/
	 oHEC1Po5GTUflL7o/2ADp38B+kxaps8n2U7dbpO3ufG/GgMmcX0fmQ2gl8mzPCF/NY
	 TRIglySJO8+Rw==
From: Bjorn Andersson <andersson@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: phone-devel@vger.kernel.org,
	Rudraksha Gupta <guptarud@gmail.com>,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/7] ARM: qcom: msm8960: enable WCNSS (Bluetooth & Wi-Fi)
Date: Mon, 28 Sep 2026 22:15:01 -0500
Message-ID: <179065170989.2673486.6364941402563355375.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 03 Aug 2026 02:03:44 +0700, Antony Kurniawan Soemardi wrote:
> Enable the WCNSS (Riva) subsystem on MSM8960-based devices to support
> Bluetooth and Wi-Fi.
> 
> Add the required device tree nodes and resources, including memory
> regions, clocks, interconnects, and communication interfaces used by
> the WCNSS firmware and drivers.
> 
> [...]

Applied, thanks!

[2/7] ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks
      commit: 852f2692b8ecb8ea48595ed24ade3b44cfc3f4ae
[3/7] ARM: dts: qcom: msm8960: add SCM
      commit: f3da0adc48f09ea11d38781e062a47f22c31d8fd
[4/7] ARM: dts: qcom: msm8960: add SMEM & hwlock
      commit: c55503516d8ac3957f2181de021ce97ec1b008f4
[5/7] ARM: dts: qcom: msm8960: add SMSM & SPS
      commit: 0abc6d0c187f390353559571aa7c57d0cb933b23
[6/7] ARM: dts: qcom: msm8960: add Riva
      commit: 6453789d4362f325cfe4f95afc34663e6966c4b6
[7/7] ARM: dts: qcom: msm8960: huashan: enable Wi-Fi and Bluetooth
      commit: 54d08947a7eb9163938853bf00588ebcf64f6561

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

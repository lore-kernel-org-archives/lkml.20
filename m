Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE94351C071;
	Thu,  1 Oct 2026 14:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790865569; cv=none; b=WykZ7teazH/KusGXMlcIaPOFFqEBwlsi9YMAvKvgh6V9S/PVlF7sZCglBnSSSOb8JAfi5sumsOmxVGP7RfguhdT/H01X3mdcN5/Lw9BMMzI56TYiq4o37+/3hq3obf4gwDl92jFVuvg7IPlYVsDrJNFK4OqWyKJ+Dr1RXM7XEwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790865569; c=relaxed/simple;
	bh=QKzTTqC2EyS1nDBGRixG7YEWym1k6+YhD7Ty51tObnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y7SX0FNj9ITQ5J86v93gBwZQg3c0d/BtRGDTkAHWKtRnQNO+vy6n0k6mMyNaYmksuhNN+mR/TdrDqWTZNDhA4oAwNECKPaShjoo7UkRVvT2YdfztQu5Gkkt197sOsWTcqB6kYNico5xZCAg6F/ezErCC3kW76PQKS0+auf8wc0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D8w+ctB/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D8w+ctB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1D71F00899;
	Thu,  1 Oct 2026 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790865561;
	bh=Ye76ev0ZhRCxzTzgPxWx9tjW9qOYCWWyNsQnYPt4Fx4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D8w+ctB/L5U5Wr3nqdbOkfuDs05lynDT3t+p0pFm3g2bNKS8t7epEpYI9QnWxpfB+
	 DW1GV+ZTED0qMdOxZpa6TnZxIu9N7FD6PjZkQx2f+Lrzo4/fkNCNsw0x3TTrbffWCp
	 8od+Zg6Hmj4bogXwadu3VmLE7lGX2Q/P1HM0dwpx5x7Le8UMTPca7+FAqIuLtEUGba
	 6F/1hbUz6GQVL9evXUJJyLMcK2G25n8GJ6FKKvcHK9AI/eU+eY09W5IDPUnZhqYquK
	 3Q81tYWqHy6XLtWWW2pxlt27nc5rtvCO+rvprpPPtG5yp4C2vA+UQkT123sf7iKuSW
	 FnoGxGNqg12yw==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Hamamdjian <azkali.limited@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Teguh Sobirin <teguh@sobir.in>
Subject: Re: (subset) [PATCH v6 0/4] arm64: qcom: add Ayaneo Pocket DS gaming console
Date: Thu,  1 Oct 2026 09:39:06 -0500
Message-ID: <179086553000.3495936.4705555205925926983.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
References: <20260824-pocketds-v6-0-370161574ca2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 24 Aug 2026 22:58:18 +0700, Alexandre Hamamdjian wrote:
> This series adds initial support for the Ayaneo Pocket DS, a handheld
> gaming console built around the Qualcomm QCS8550 SoC. It has UFS
> storage, WiFi/Bluetooth, gaming buttons, microSD, and USB-C with
> DisplayPort. Game controls are exposed through a Renesas uPD720201
> PCIe USB 3.0 host controller hung off PCIe1, while a dedicated gamepad
> MCU is reached over UART11.
> 
> [...]

Applied, thanks!

[4/4] arm64: dts: qcom: qcs8550-ayaneo-pocket-ds: add the lower DSI panel
      commit: 5df998721b264a401f343ceeec78191d6f1cc96d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

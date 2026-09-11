Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E533F9F47;
	Fri, 11 Sep 2026 02:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093568; cv=none; b=kE3sPbs+EgZBGPob9iILf+kpUDPYN7XfLffWys8obsCCT+m3myPqCUd9OaOUtx2CP0cFe2bnGQ+oe7AxZRHsuvaM5FFI0835Lf9DHJI4VaICBCGo3Kon2l47htMKR9gA95WqjyEahbmVFR16ut9i3yxc5gcfqwuxrc4J0c6fJ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093568; c=relaxed/simple;
	bh=hw5BFhybQ1FB8+oKJAqCKDFNaYZcN+VKbvviaqpUiBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZgYTUJiwwLgywPEOMrFZK7MhZoOyNH1zLrDVrpfZQhSkz1zS5LKakKHkI03LA5UlHsOKPLESUXuNJL40NGUPzvZpM6BYDz6zjcjyop4/tUYErPAhk1BMchSI7S7nc+1KkHgoKf8smrcOiSo6ZRSp1HlyxFKEsCKv5QtwjH6R7nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AA9ooE3u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AA9ooE3u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEC41F00893;
	Fri, 11 Sep 2026 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093567;
	bh=QPV6E+D3WCFXN1dKNet04E60KYJIiFCRZWnYJl3PFpI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AA9ooE3ulbKvmL7/uJEElCsvWdWxzv+pcCaDOB+PIiAKWxigAvwZUSAzT6dQ4gB+R
	 LVF1AFZwIAh7ATSagA/qGDuNWxLW6Kw1ASmJcnHMW12t6ryNUNf/7dScj9aVLIxpTb
	 tT38vzxU5JiMX+eOjcOX15gNO8kYCZBMHtXRgWAZPMwi36Dz5vXD0Q+dsFYgWVdBRu
	 x2qaG//VsM4ilahNE8I8/Xx8dNq7pxOuAAIggd5w3G+bQRGnpb1RLRRYrvy+wytSK4
	 WV4PlQZVYD1ZoLUlDBUISXJ41r4ZWtQ4qFVgc0uYW8iy/NyrwuC3rURr8xQVnLaTpL
	 d+J5T8wcWW79w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abhishek Thomas Varghese <tessolveupstream@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch overlay
Date: Thu, 10 Sep 2026 21:25:44 -0500
Message-ID: <178909353850.920241.13841514575652332172.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
References: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Sep 2026 15:18:24 +0530, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: talos: Add RPi Touch Display 2 5-inch overlay
      commit: 83b6b72ee8489f15193cd6a19eed8c4fb65aaaa1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

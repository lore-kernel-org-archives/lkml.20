Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789513AE704;
	Fri, 18 Sep 2026 01:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789696202; cv=none; b=LW3HhOMRD3+gbvmWqLqkW12y/a1sFKKAD8i/ICerwOoZPR8Cdd41QtHZMXDM8sh87Z/FLalSV6WptRC5+0gyFU1sfZWm35R451kLSku1MRlQ/cd+dssXCR3lUtgnTEr6x59OW7Xl16A5M2bqhQn38j4mJUg1ZdHb+QSy/ifUGd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789696202; c=relaxed/simple;
	bh=qLt8cMpE+LPDVQj70dNYypgNom17/rcBBzPVMpndapc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vr8XfZDe7vBXQTZu1ZwpmQhKGozgfl5qMC4PmyU3vsmMTIElOWIg7JvBStDGxiXDk+bo+i+puySpYHZ1ny+eYUOEguopiALMDk6BmDqngk1APZ341EfyyfwMhfdpgT26J4zMDEpIfY/UHl3eSkcbeW59PVAQ1r9yNUTCpqS6ZRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NdHDooIX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NdHDooIX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E8091F00899;
	Fri, 18 Sep 2026 01:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789696197;
	bh=a0KMh8lCcYJW0E8Ak3dliBKtA9i80R0TLdRxYLXGQUA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NdHDooIXn20lA2G0GsJkSIZBsVaG56xZzoAkJfnBAglI9zuGHPDyaXP3aek5nmbhR
	 msbdVaLDeUtGmGisdC5wNy0KKuHr7LlNSDY3BBanIy0z09i66frUcScI+jbGvn+1ce
	 SCqcrUbhmXPu57kbObbXxj7KZThis7ONFJ9BVL3/qyqTaX5mPsVWnh8ZM++Lfgxvda
	 sFoK4ryUp0iO2I/xN37XQFvfBmxfZ3wEjUalu3gHSfSP/YU2CxeJ9EZ/HxIgLRoqdj
	 u6imGugDvWW/7nhpFoDS1D3dJ9YNuNS7IlgYQ+YlTMvxuCZcYUGI84A0u9t+LfoGWZ
	 IpJKHej7wY/gA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <jie.luo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
Date: Thu, 17 Sep 2026 20:49:46 -0500
Message-ID: <178969618820.1582337.16129260010756643840.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
References: <20260811-qcom_ipq5018_mdio_pinctrl-v1-1-14ae9dc62a3f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 11 Aug 2026 06:36:52 -0700, Luo Jie wrote:
> The external MDIO bus (mdio1) needs its MDC/MDIO lines configured via
> TLMM pinctrl; without this the pins are left in their default state and
> the bus does not function on boards that enable it.
> 
> Add a mdio_pins pinctrl state for gpio36 (mdc) and gpio37 (mdio) with
> 8mA drive strength and pull-up, and reference it from the mdio1 node
> via pinctrl-0/pinctrl-names.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: ipq5018: Add pinctrl for MDIO bus
      commit: 2cfae284310731888f4899a01d147baf08a58ffd

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

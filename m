Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27AB47207B;
	Mon, 31 Aug 2026 14:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788188236; cv=none; b=Hud02LnLVn4h5iicXOFNJg4EMf9Y5WXObn0TIvZiIfKGOEW9K0YssM4hqn32DTpnviX5AjJq/Fa9ByIok48ISUxbIf7Hmjvbm5KW/G+yQXsu7Y1dLa2FbO0A8miNjFaH2mfgGjjHt5HybE3bB6IGrMALAuKcA9rPf0GbCKQJM8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788188236; c=relaxed/simple;
	bh=cKtt/qXzfNkR64EJuj8cydyuvo2B/WFA8rIgd5APtI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Cj/E4EHcNPkOQ/vZuZAEIY+3Szkg/tzjRUA1Dme7Tk2salH09j+7Z1FkYkZYtzyHx7OcwwwR7iPVHjSB7jEpQBesxZGYFWFws+Rlej78D+XmM3yMRFkJowVBaL/sW88N7MDheiMDDcAg0V1TJjuTt8VKUSJVipngQwjel50t0es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vhpzwoly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vhpzwoly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E717A1F000E9;
	Mon, 31 Aug 2026 14:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788188235;
	bh=8kn1sO0B2pApEMi4uAFueoHD3l30/tgmgtuTGqygbcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VhpzwolyHp9nnxNYB1cbBQJ0hNxBI+iFbYg6KLOvZQWpiM2xJdjCdKTwg4AggpTav
	 Fnhdcv/roWXY2KXKv6lEjbBrMwZ+0d5lYvMXMWvdjA8lUXtgruOcorsfAILdVBm58h
	 fJV3PvZokr+W2D5EOA6QR+zDIR3ebfiGa4L270pOuJ2yJcVP7mDHWItRULw75hpwBw
	 Iwa9VbcJkcXA501eRWmDHES9UEjrN8PPC7uyrxZN2ENbKqc/KSX4SGRiw5uzYsYq0u
	 yDiZ6x+wuzUnEzxGXTRZOH2b2OFKuHL+7uvF6ms/QfpiVM3DoTGfhH78QiVHkMPe0W
	 DZSDg1i3Ts+8A==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Mark the EC reset gpio as reserved
Date: Mon, 31 Aug 2026 09:57:08 -0500
Message-ID: <178818822451.1120617.17208953172489408680.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-v1-1-4a9da88755d4@oss.qualcomm.com>
References: <20260831-dts-qcom-glymur-crd-reserve-ec-reset-gpio-v1-1-4a9da88755d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 31 Aug 2026 12:11:36 +0300, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the Embedded Controller as its reset line.
> Reserve it to prevent Linux from requesting or reconfiguring it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur-crd: Mark the EC reset gpio as reserved
      commit: 8ab228ebf968fe43afa55630fb98f1069828988e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

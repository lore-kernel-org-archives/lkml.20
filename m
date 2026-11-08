Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169436;
	b=U779h1BURc2aZY8mFZdWVMyZuBCMO84sNVuAH5TWVfTAGf9pcq5N33GU/u4ZBiWrX51Z
	 jBRug5+VQz3ECFuzZ9xe4Xm0l/TJjM2kknfy/AKXrOZcA6iUIbzV+IfC2IlpbcW6keWje
	 QMyDpnbrXTqyZBeYteVmX9F5mCilT37K00X1Kq7jAASW7TYj+5peDrnno9s/TfHP00lVX
	 wy5jjWgxzjghnAGWw5OzQmw+9kho/BKablD7VMt0akNPVqrfOXDiIgqc56lIM3Om7Vz8H
	 bHLHjNYWN+NsJOWJIk/KFDUL2dZpWrHfKd9e9sd6QoxZcTf9BodCNPd8UdNdQWMGajA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169436;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=yM062hjqe/L/kjeMXCI3lCF7NxsgX6Rg9G4er0qrnSc=;
	b=Qvf+IhbXGwj9AeX17G4JsUoqP8oo1Mpj+aYh83rVUZOaPvr5eyZovep/RTbXxrf72v6l
	 4s8BdEZpka8HjVaPypuAXF/N34YBR1286BDtluhFGFM4I7tkduMi2PsahxJMBSRB8kT6N
	 fQ/WUbiy10TqgWUHDxNWBIFIlhjEDFHZMyUl4SeUn61Hbi4s0I+A233SjQBL7IXiVqP30
	 Ld73LbBb12JaguZTf4n2nBqkQUYuoW2S95cekPDjbyPba2+nJB4WtRV8ipxTk0iiLnqea
	 RoWLZ1XRd/wPclRdrRXf7XKYrbdf3dw8wTfZGIFxqPQxyzlB+m/0ZKKMvYwjaG6M/bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chqM24d8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24ABE6075993;
	Sun,  8 Nov 2026 20:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=chqM24d8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF431F00900;
	Sun,  8 Nov 2026 20:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169436;
	bh=yM062hjqe/L/kjeMXCI3lCF7NxsgX6Rg9G4er0qrnSc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=chqM24d8IvCNEM0ribOi1Avyo5REYzY2sUgfR9W5a5rLN8w6RzL3+fwrxmDJq38Xi
	 lSl6rzk2CGeDn27ietQujTPwAQYbhKF2SVBkOY1sjr/ZDSXp+EPikPg48/lxdPlXex
	 cGG3xUbAiVeLvi3eRafTIiiTBrWuBjTsRStRmi8Y+9BDB2Q/6bN2Ft1PK/rl56cT+b
	 NzMYwKG3mb8bIj8Iga8klFLx2QX8vDpyjeP5phD+Y1t61xRMLR4t4ZPBCzQ5hr6uBM
	 9C4j/8VDPBiW2Ya0sRzlM+lg10lQX8eFdObjMH/IJj41I+EOG4idfMzLoAL+5hua19
	 6aG4vv396AAHw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	=?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@oss.qualcomm.com>
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	akhilpo@oss.qualcomm.com,
	jie.zhang@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
Date: Sun,  8 Nov 2026 14:20:35 -0600
Message-ID: <179416929545.628393.4745607631367828558.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
References: <20261102142812.1353199-1-lukas.maerdian@oss.qualcomm.com>
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


On Mon, 02 Nov 2026 15:28:12 +0100, Lukas Märdian wrote:
> The GPU and GMU were disabled when the ThinkPad T14s Gen 7 device tree
> was introduced, as the Adreno X2-85 found in the Mahua SoC was not
> supported yet. Until then, mahua.dtsi inherited the GPU and GMU nodes
> from glymur.dtsi unchanged, describing them as Glymur's larger Adreno
> X2-90, which is not what the Mahua hardware is.
> 
> Mahua's own GPU is now described: mahua.dtsi overrides the compatibles
> with "qcom,adreno-44060000" and "qcom,adreno-gmu-x285.0", and the msm
> driver carries a matching Adreno X2-85 entry. With that, the nodes
> work as-is on this laptop, so drop the board-level overrides and let
> them inherit the default enabled status.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: mahua-t14s: Enable GPU and GMU
      commit: 6927620c6c9d10b4e9a5ffa3f1d08be34051807e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

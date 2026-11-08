Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169352;
	b=giFz1LqBg8QcKBXzxAFDGHXzEeZyHgNwiSHBKPVW8/3q9PCcbODmM0wiHFEZWmjPbSQZ
	 +zlCNnUVGaF5D3xTHZnOUbqUQ8fkBGnyMzwtcE4B5ah6LKvw1TJ3zWupeLcavfZUT+1CB
	 yUHWhvhZGgHasGNdTGBovp42VYfFgZmDQvCobmyCnM0n4qA5snNrw4fnpvHwCgnF0+ZZy
	 1ChdsfMTGlN5rQAYGYs2rsPo50q+cZKpFubfMPC6n/VH1xI0tS/PvW5lLSOBB06zJscp1
	 bfddhRpiGgFSaB+b58WLV5g+hn9DyInuDAm5v6G2BoMFf6QQ3YF6uavFTde5dlmwsRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169352;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jNa1knLxWWdwh04CkLtdtpSFy39K4lJyzCf52/ThYmw=;
	b=Fs7l6SseXF85Hv9sBcw1zs3FQ0kYQ1t/dfyy39qIAD98Z6+bIrtT3SyHGtw43nSGBl2Q
	 6A4yzyAWRl3gIgPQhqeasbxkBxpGqRjb9cmV0lqjfO6AOPwKaAJlVAz5+wE1RGQngwdLh
	 KW94S80nxy20ZTU+v/Y8RBAAQwjHvBUZ0Gt6QQ+0ggIUeg5uwLIntztHo4ToKxQuIi35J
	 2O37Yms5gS3zs1TX19MhrJ7lgA+ADyA9SRs4D6rPsRXN+JZb3F2R7uzAe6Tf35h+zfGi1
	 idE+poGPFDUcjHmjedYypUcbpsDTRvGizusYuo/V0R/3RavsP0xAjZvOZTOkE8r48HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAcXbwwb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C3A608361D;
	Sun,  8 Nov 2026 20:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eAcXbwwb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F201F00901;
	Sun,  8 Nov 2026 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169352;
	bh=jNa1knLxWWdwh04CkLtdtpSFy39K4lJyzCf52/ThYmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=eAcXbwwblvFo9FOwFSLv6j7Xe/sN6tThbj0qfFrhzAsYD5h/06bPj3ExAZmaaTAym
	 00i5iCOLDTE0lVwveaLBRdu7zt99kxgCRoGBL3HnDvaIDf+6RFCQ3xaHeclJco/T/7
	 nZ592bH6KtIvKOLG1v/G2gIhv3KT4/4qJ1VI/ShdtkTkB14addamfs/wlDwtt8Nxs3
	 Bi6YN69eaMrBti07DlWvq1lKcbPGr2OIq+2RRiap/4HS3dVdxIlMunxpPftDm0pWC1
	 Yr7Ftp7FsqTPc2quql3OEJp+j24DII19GMwWUU4kBkv2Lh9A+1Z33dypp3f1On0qN3
	 0BXwRbn7S8xgA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for audio PD
Date: Sun,  8 Nov 2026 14:19:39 -0600
Message-ID: <179416929452.628393.5603846744093943794.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
References: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
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


On Wed, 21 Oct 2026 10:26:41 +0530, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.

Applied, thanks!

[1/1] arm64: dts: qcom: kaanapali: Add memory-region for audio PD
      commit: a573d5c23caf77f0c95ab2fa2e4b0e8307cd92e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.11.138.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571351;
	b=okQx9jvZra69QRxCrYeu89FshAP8mbFF+lHhs5v2qO8iIC6qmrNg7MoAGoeld8jSHWhe
	 I+WqgUbY/isGll7ahJInq7boFX7BNxGzv9t79zBj3HR0RdyhiZmwgCW0fnxHaPXLiLReH
	 Y/18d/Pelke8QDmLpOkbqR9jSX1YuhZU/trNM/h4u9QHHRJjl/f1IhWxMzUt4hOPhmGHr
	 9chJqjvL/mJTMa/52lb4sg+KYG3a8lMG6H7COI3/J5y/ggp5guznscg2wHcH1jadw3kvt
	 HJWSgeyo8aqTbkR/P0LNfHe6mSqD3f1dvq0B99Mc5Rw8BAtUmVlc6UTRBAhPvCntL9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571351;
	h=DMARC-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=mUcjaVQ7lyI1vitc+H9u1tzf0raKfI5LNSobORLeUkg=;
	b=E6ZanX0i/MZ/7e73V1cyaD+yXDCn8CxRUcYqlzHu12WywEQ/1DhWNfGqGJVorLVAppQb
	 HS97LYrgyFzvMAWyn5xh2xqqLyJPqu7F1oDFCmUrIoqW55AZUr/7JZcwoxI3RlLS+dT0P
	 iMDX1jrAsepVDwDHH3l+C8IAZbfFhc61IWFklcXskvffCU7rqIBOUbxnDgE7LHjW39Kj+
	 dM/Uz29bu6QgyAIRD5fw5Ofnm/o2t55I3O06XE3fPRyeB/5ZhGVCvCA31Pe6I79K1Q4dH
	 AG+0gSM1zOhxhSDsax+svIuzYGwxY0sDmg8ZRJ3i4aMlXKhTJ3f6BUnlDZvVKvusq3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sntech.de;
	spf=pass smtp.mailfrom=sntech.de;
	arc=none smtp.remote-ip=185.11.138.130
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E48A606A333;
	Sun,  1 Nov 2026 22:15:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E48A606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=mUcjaVQ7lyI1vitc+H9u1tzf0raKfI5LNSobORLeUkg=; b=dJPZ4lf0xCMO5WIF9dnHeRq0nE
	QwMvkV4WnCbmPJF9dTEftjXGWXVgZSGwDjOulqBiaD6baRs4KFtJfyMBKYbnIi48Sfu2fIlLLOJpO
	kQOgtx47BpY8Dx5T/TsBD92rH7sFi4LQeqnfrtaFEMtxhAywbvh3UD8F5l2PfM2VhERPDgX9wazT9
	3vOWHD57MCwoo81GrMpA4CPjJYbFmUCi281qAU2GYvuU/lXMTX1jLvVwLgPXGkoxBRT7K0oz168LD
	vfPVGZEfqTvkAaTFI8YiKvlhoAWZi72uPITpL5aR6xYBAsNSu42EQCaAirwzFJH36JwILxFzlhEnS
	Gv6oxP/w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Igor Velkov <iav@iav.lv>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable USB host0 on Kobol Helios64
Date: Sun,  1 Nov 2026 23:15:27 +0100
Message-ID: <179357131396.4107717.3550186345621350857.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011-b4-helios64-usb-host0-v1-1-693fe316701b@iav.lv>
References: <20261011-b4-helios64-usb-host0-v1-1-693fe316701b@iav.lv>
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


On Sun, 11 Oct 2026 00:51:50 +0300, Igor Velkov wrote:
> USB host0 of the RK3399 (USB0_DP/DN) is wired to the USB 2.0 pins of
> the M.2 Key-B slot J2. Enable the host port of u2phy0 and the EHCI and
> OHCI controllers behind it.

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable USB host0 on Kobol Helios64
      commit: 5d96282894c536c85259ce0f25780b48bf77b9b6

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530919;
	b=kf+8o/tb4CJKr3OhaAJROu30MOsvUOhWcAAhgg5D2/2M5UutG0y9T4/WhfKi/SfM+dtV
	 sFqhbBiPBL5iHw3CTKVxz+e2ADZKH2pa+dXqNnIP86dopa8+UwRILVRR1HxBLraANkcOK
	 4QwzPybWfJF4RIZA4cpY9uA6IhKnSwF1XKVzQxyJbBCfFdZQrJIQUVOp+zIK/w5gjViNZ
	 HiMuILxVs/K8y+ZE7YXCWnKmyV1W5BLzjb0SxX65ynbYx/MzdJ69Kr8uUxatZXff6yttI
	 3eLRdNZE2BJEW3OuJ8bHeY4FiyRk1Gkmqb0/QKzEs2RWgAyGVtWFBi8npoxm3pDap+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530919;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=RiZmgFh3xnSQBEGWpAS3H5JJBIFZV61jNEtW4X/AT0I=;
	b=hemqOYSJgUU3tQeM8p8ZbjFcwNmeoQDnNBURrU6BmwrTg9JktEnIOmhB2G0JsSes8vqL
	 4wWxiO+8KTOMQd47sEUexbwoTEVQEsQLv/BNbVmwA2wLbFFLdzpMIKWmyN0wfpYuV9bdE
	 tejfp49yDDd3yDfZwaOmGGDwcuSioHc25lrQl4rUyX6frD0szul1EYNgl1mKt+hiprQGi
	 6sM737L4aY02YfhRoPYgK52EmbNVJGMhp0B9G1CmotkJzdXo9SCfHTtw4PCa1kx3hDlU6
	 HokKCCXvrG5MQtJgzYBGh8UVaYzQNOL98uOsTvAqdvFq9RFN7nB3M0VvuLIceN1VQJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcQKNvmp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E82A606A325;
	Sun,  1 Nov 2026 11:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LcQKNvmp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B56CC1F000C1;
	Sun,  1 Nov 2026 11:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530919;
	bh=RiZmgFh3xnSQBEGWpAS3H5JJBIFZV61jNEtW4X/AT0I=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LcQKNvmpydvM2vMq8mfvYlu/04MuPKvJwFj9o3buJcRNP9d40WBBJBJkzC1S6AGoN
	 Q6wZ9mTF+sTIsymik7ay0AjaVgcI+nUru8+IfkIqnew/brl1yL0UPKOZhMXEI4z7Q0
	 OXUcJ7ZeATEy+k3ztnd+MErlZ64iBLhFS/YeLIuK4YxEIlAR/6kglPiB+EqTQcS59m
	 FWGlugfrx0XUMDWtQJtNAXeJ6OxgMqSESDCrM+g7fqUW9CbNDE7D7ONswj5xFrPdqd
	 gys0B+pSlsKgx1ykwzG+oK40ZBliaPBxWyaUxvVN9+gRM7iZUE+GuueyyPQeFChdK/
	 jsG6XwgFrfYOw==
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v18 0/7] usb: dwc3: introduce Rockchip glue driver
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Igor Paunovic <royalnet026@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 kernel@collabora.com, Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
Date: Sun, 01 Nov 2026 16:31:52 +0530
Message-Id: <179353091270.2955.16595397888583885694.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=952; i=mani@kernel.org;
 h=from:subject:message-id; bh=fNfid/f4nVrJ+xNTHZ1GClR2jz3hkQhfG2OT1eCx99E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xwiFnRbm8Oay8GyVL7tHfVj0GAAiNyctIiP2
 zQwXWMobVGJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauccIgAKCRBVnxHm/pHO
 9U1AB/4hhi0dBYHAt/Cc6cpYSYHtZQsQrpamcTe8vNxhzT81wuhwrDZAuJFPG2cdJVsfqwNTQ5s
 Nx/aAsDHKTsLevjmGD1jVkfDamShrSJhhaoBLMh8RPnwS+YY6y3beV+wddieCQbpZd0aEP7KM2s
 XsDh6XU/876CYy6JmbyM6JbSbM7sqacuuRyQGpdPfh+MA0j3TZxikbrSkIxkAVq/rSeKMVWdGZB
 9yw0nmnbNrOzBMWNg3B5tabtYci1zoUr92veF9IbO+2OaNf7LlLooa8p3pq1wA0aGMyF8JqiYpd
 sujQuUxzIcaymM5HhXM5Gwelpf4ISFdSAcrc00ppjsha/HxX
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> The recent Rockchip platform have a combined PHY, which does USB3 and
> DisplayPort as well as muxing the lines in arbitrary order. Changing its
> enabled functionality requires a PHY reset and as the PHY provides a
> clock to the DWC3 controller, this can result in an SError. Apart from
> that the PHY might not start up correctly when the DWC3 PIPE interface
> is running. This series prepares a Rockchip specific DWC3 glue driver to
> help out with these problems. To become useful more patches are needed
> on the Rockchip USBDP PHY side, which are send separately.
> 
> This was split from the USBDP cleanup series. v17 has a dependency on
> the patches that have been merged to phy's for-next branch. There are
> some additional Rockchip USBDP phy fixes, which depend on this series
> (which is effectively also a fix).

What is the merge strategy for this series?

- Mani



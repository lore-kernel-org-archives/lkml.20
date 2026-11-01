Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793531179;
	b=FSciFDPtHGAhw9aSz1pe5tvJoooy+znb60pzR13hEjM1WuU7123fQiUivUyZD5cafk4K
	 7zstBV4oH1XwLJswG6ZY1TEjCDVvHV22qMF3yWkSpKWJavrqNbgtc5EqM7HEreypZaQ+S
	 JquvKu22k8vYM+dw0AKZ1Z2iui2F4wh/hAmwEnvejcq4bgagloMPabxFUi4SjQ1iyeSfX
	 GeoRkLIm35WKU8ttZEh1P1kqsm5f2e5kt17et9J7WoIWN/mzc5O8SckS0w+QWaQCVUv/A
	 cPsyhQlC+wl7STpx5Etd/UTl0tawSj1Vgo+dsEYPni4TuqxHJQmcrb5ObtRDXpD7IGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793531179;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ICIkAf3UPu4vp4g9wq9pl5fJ3rhAB5F7TqD0Cz1UXjg=;
	b=JGPDLTEu/6slPTNQzmXyG58JOn4mVZ9kbDpmNDqNAmKCLR11nd8zP5Og6g1Q3alXZMir
	 NvojRvCCaBKEI5U4AWc+ougwtcqWa5SybTgswiqAj6FSvzAvIFyiRKGLxgoVeUT8NJ4vF
	 lQiwMZ0kaLEnWynSR1QAsm+PxNLy6vn1GMsZoToNmr754SGhxudXxwQ7S4DVJiYOSBjmE
	 tgWo02pnp7EX2kDSgG4VvALFWQTRsMlNLnCRBD1PDL1qPj9VBm1UDIoVGkdk9vd0cvLQz
	 U4J+oda/v0LNshVLk7ZJK/CSaxHcTSdW7T60/yS3Lw8yRma5Ke1fMdtZQvI47Oag3xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DNTtMyDY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748EA606A324;
	Sun,  1 Nov 2026 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DNTtMyDY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DBD1F000C1;
	Sun,  1 Nov 2026 11:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531179;
	bh=ICIkAf3UPu4vp4g9wq9pl5fJ3rhAB5F7TqD0Cz1UXjg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=DNTtMyDY6sgakprgJdluxjvivbsnTtKQfLxmqRjCbVA4kgZOmhZOwV67noWIzTw9k
	 XRTQbPddEJWqhsLM5zko1Agcsj12H5ke6W0KbT9Fv3sDhnCkF4k/qN09OmnrQHwlRW
	 TzvnEDNp85FaCk4ZJ52ytdc32NOIYM5B44joQWlCSWL65KQq/+ne6briCWGmsi2gkx
	 tR1zAvGLWy1QwJGBrOXbiT0RxrVKRpv3aRO91Kwxo7xFdxMbzwo+2T2nTTlN66K/2g
	 t/M4QWYsoIYwayDtpDQTmj+5rpqiHtMcdo+iP4FtTsCg/hnV+osY+zLkLkLc71JbPx
	 tCOIUQ+oUIJfg==
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
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: Leave the USB PCS alone in
 DP-only mode
From: Manivannan Sadhasivam <mani@kernel.org>
To: Joonhoe Kim <26rote@gmail.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
 konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com, 
 val@packett.cool, wesley.cheng@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261023123512.1912-1-26rote@gmail.com>
References: <20261023123512.1912-1-26rote@gmail.com>
Date: Sun, 01 Nov 2026 16:36:13 +0530
Message-Id: <179353117353.2955.16116793673558325261.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1723; i=mani@kernel.org;
 h=from:subject:message-id; bh=Qm6xI6pBQHw/JhBtXoNijp9M1lQctxsjcpVxgL/i6NE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5x0nDJe3fEmoyf6sZec61aECAaAg0o1cX25Ki
 FMLJUqTzDaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucdJwAKCRBVnxHm/pHO
 9VZUB/9HhdfzEhaz1Jw9bmrIhDzgSuZ1RwQsR89b8mh4mJ9zXwYloZnv6WkSprFSIE6EPp9RqZt
 XKHYgXFs8bZYfS4UxpKutjkQS+HisdIx+1mkxHgfzfm264wxnLJuTOfhKq8x7UmcYv/rVc/8oKw
 cpZICoXHJfuHgQZOsPlyFEw0tj3OT9QEhrToa5W8qG0EWOtd4n/NR9jeuxcOn/G3sYJ/S2zaclA
 y9CJ8X6zfLb9ApJkpWyUre08yNOnIsyb+IBqYlRx6Mier6ZMlHo34ZmaKli/oC9fbAiGZl84q1d
 cpmOD6JtjKVavlf9u+8cXRUZpwr4SrFllq6wcvriV7ZQsWsc
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-23 21:35 +0900, Joonhoe Kim wrote:
> In DP-only mode (DisplayPort pin assignments C and E) all four lanes
> belong to the DisplayPort PHY and the USB PCS stays powered down.
> Three paths still touch the USB PCS in this state:
> 
> - The USB controller can exit and re-init its PHY in DP-only mode, e.g.
>   across a system suspend that loses power. qmp_combo_usb_init() then
>   programs the USB serdes, lane and PCS tables over the DisplayPort
>   configuration and times out waiting for PHYSTATUS, and
>   qmp_combo_usb_exit() resets and powers down a PCS that is not in use.
> - qmp_combo_typec_switch_set() powers the USB PCS off and on when the
>   orientation changes in DP-only mode, e.g. when a DP-only sink is
>   plugged in the other way round while the mux is still in DP-only
>   mode.
> - qmp_combo_reconfigure_phy() powers the USB PCS off again when the
>   port leaves DP-only mode.
> 
> Skip the USB PCS in these paths in DP-only mode. Keep the
> qmp_combo_com_init()/qmp_combo_com_exit() reference and usb_init_count,
> so that qmp_combo_reconfigure_phy() powers the USB PCS up when the port
> leaves DP-only mode.
> 
> On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a USB-C monitor
> in pin assignment C, resume from s2idle fails with "phy initialization
> timed-out", the dwc3 resume returns -110 and the following xHCI resume
> hangs the system.
> 
> Fixes: 896277138c13 ("phy: qcom: qmp-combo: register a typec mux to change the QMPPHY_MODE")
> Fixes: 89563a152973 ("phy: qualcomm: qmp-combo: Add preliminary USB4 support")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



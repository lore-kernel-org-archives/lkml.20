Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528175;
	b=faXryvD/ttKb5yTHsz6ctELpgIGCVKVKEAMIvnO1c4eXkglNXCajLGTq7wzFUQYk0hak
	 iYQ3xy/+uzFk10VtUXXKkUoGv+11StwhoWwow5c6QMTQEOiUA2uVeLjKaAVO11h8p0hHt
	 hrXLoNFXpuzFqlpd4jbESZiYejavr/hvvGQTHKV/9ylZJktpHg6YzeATakzk/c7EuVbcj
	 pTZ1UeTr/ybBcACAD2t60N+52fQVFrUIma3L2wSn/7zhqUY9k+MwUtKOjtROhrVH0ttjD
	 b59Fuyih3KmEAAv/jjJkh9NLITD+msvtZ116lOWASJXGUrJbUdsKFaqHlv48MoVQRfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528175;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WlyZSmXqoNem4BYxWTM4LbiDAqtNAeNEfmW9zP2dGqI=;
	b=wjw062Gjit0LSzdug/nUhjDnforqsuQWbVefF6BvPwg6asDBHp39GPwJyPFlVVl+j1S4
	 V+qr+5CwpbmtHj7N9JBcAHpZlRKltcJSTXFEcaRYbY1LKkb0Op4qI2InkSOvqHAKSTNuC
	 Cp+4R3kIEz3r9N8aClKpTY3byEqVXgq9UBXAkskLCxh9KxrJZCjNB9ANYof7hsZQBFcn7
	 xsnmB5JaTBD6y7Kmkutp+R97QE2PMW4ix/D/UQ+pTp4hz2Fae8yArFzKn4s+f7DoznRn0
	 MytK834zDsjUGfUgGnl2hLXi79/4qUZlAzePEggD4OUmCebat9AIvaWc8yGYs0jHBCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BIqx48gV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FAB606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BIqx48gV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490771F000C1;
	Sun,  1 Nov 2026 10:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793528174;
	bh=WlyZSmXqoNem4BYxWTM4LbiDAqtNAeNEfmW9zP2dGqI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=BIqx48gVerpSZp3TIv7S9rEWVLbSgq//SFRMil1HVp3LOdwPLoPm9dYOn98MfqZYH
	 6hcgUC8AdQ0MBYcIo8ec5E2onfidoy6PtYcIULNKgVCdSAVucUkuJ8nNc4KMq+Tzk4
	 LVVveSF5mU8o2DETRIjUSfKVRRCj21qwlD845qB4vz27leJBkoRuxJvSgweiWZde92
	 gOSyX4vvyGa3p28nO9gg260rWqL5n0nf9tVDKpB8K3VXWxa/oshQ5tX2z/3Vu5ZSez
	 dPdUutjWDIkY8E4saqEmfqlvrd66kxszuENNHsKbBbJW/oFdT3PErvV3xs5Z0W9H2m
	 mVDtZgVNEtf2w==
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
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: Fix overwritten PLL SSC
 control bit
From: Manivannan Sadhasivam <mani@kernel.org>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Vinod Koul <vkoul@kernel.org>, linux-rockchip@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <1792036787-37927-1-git-send-email-shawn.lin@rock-chips.com>
References: <1792036787-37927-1-git-send-email-shawn.lin@rock-chips.com>
Date: Sun, 01 Nov 2026 15:46:10 +0530
Message-Id: <179352817065.2955.12861358728899992039.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=819; i=mani@kernel.org;
 h=from:subject:message-id; bh=swTg6Ncr3SBC3tfOWyQgwR6RiQDdKAS9vN/fOLu60Cw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xFsyj+J03oXK/LW1Mh7hQdN0TRMcBq7xI7Y3
 f51oK4cR7KJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucRbAAKCRBVnxHm/pHO
 9c4gB/0fVuDYxlRny1zg37lWWevofXo/uIoYcKZ7ruzT672dQejgZtSGIMdz1lrQivBQUY/fftn
 /Nab1sjiY5iVgQoiozItGAethezmNkJyuJgcTx6a0jT7RkrnSCXPzJAFWQLKjibFikSxb/TWTkZ
 Qh+omLlpDhyF/qjWiZgeKgcVqaD/oqAPiAX1LS45MjrFR+iqG7/0QM153+MBjcfXw5oqNdP+ooP
 fqUTduZQCto83QOBNuUFeS7XA9qMRJ3YOGRxVm/BteyveZvfguw3c2+tCzmIVNbIpDNCP/9pFCJ
 GfGEIu+JYYYnDT4/YkXsxbPwPmfIJiNYF09Gtsnk65EhFtdH
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-15 11:59 +0800, Shawn Lin wrote:
> rk_combphy_common_cfg_ssc() first sets RK3568_PHYREG33_PLL_SSC_CTRL on the
> RK3588 and RK3576 SoCs, then, for PCIe at 24MHz, programs the PLL KVCO
> adjust field. The latter used a plain writel() of the FIELD_PREP() value,
> which cleared all the other bits of RK3568_PHYREG33, including the
> PLL_SSC_CTRL bit that had just been set a few lines above.
> 
> Use rockchip_combphy_updatel() so that only the KVCO field is updated and
> the SSC control bit is preserved, as the comment and the pre-consolidation
> code intended.
> 
> Fixes: 0b31f297557f ("phy: rockchip: naneng-combphy: Consolidate SSC configuration")
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



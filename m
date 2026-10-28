Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187277;
	b=MdnB29rTbAwoiy2x6qJnB9XauzElimMs6cQRkhmelq02w8o9x6zQKemNsSL43iAy6qZs
	 Xt1wRvRTp6573/hGRUQ5bFPJsiXoj1YCt4TCsD0jwYOaBxk2/Xd1h9DyghhcuFcvExOCe
	 XUvjAPpakM+23LpTV/vsQYoEHffOXy/de3rBXi/eHcum2YBu8FnG2ViF/P1j3QeTt9EyQ
	 wJYD6vIGBMUeSyc2GxSQ7p6ztu7tO54PAIKEwedDibyGWp81AMAVENZ8QvtWCoTH7LjC4
	 y3SpFhm5jDYiYAueajfFGySPjIaUv9obxiFDe55p0plCJHEJwyhFkbTEMh3nGf9BbHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187277;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Dm2204N5q4pUPSLYAJkabKLi2pj0kqDbpxLVbB0EmvY=;
	b=dhZRJEjHUtj5Zrjn/rEYd4Cz+10bDve53GbKCVZ5rVqrLgnpgZWxwgvQvWCLt+KV+v/f
	 zK9815dyeTcuHRnQ8BvUVRfxyo3rlhBzESU68dCR309VT67LMZYloWKf7KkhxlVoRZhhA
	 Kdu4tFZHyoh8FPAx0JEm//fg9KotlxMVm05tv0o2x0+pb3daJrnPNWSK3NBPeN7KknobF
	 PObQvfK6vOpYhlmOaAoqQjIg9VYZYuDmtJBIyxeoP9P47EWLZZnF12XaYruQERFkDJTnK
	 EEB68YA+PTJuMWZaMpbxo+BNpZbtTcMne6oHaPtEwwA4g4dfkZAtaLrcHC5BD438ZIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncrqWbEt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57CF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncrqWbEt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8171F01825;
	Wed, 28 Oct 2026 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793187276;
	bh=Dm2204N5q4pUPSLYAJkabKLi2pj0kqDbpxLVbB0EmvY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ncrqWbEteNkw0tdcqQJOmlYeN4rLNB/aR3RqVXNPszzMrAsYqA4iMxuffdi2o5sSG
	 BrbEhi3fDg6jMtb1HRRdt8nnbkVr1tJ3epwMA1a57QuqNYL3SMYR67fT6trC+bBOuv
	 p5WP2Jh6TUBKIL/15kptjV+FB8/1TLusBTDPyxBfA/JVvuhdLgQZ3fLWr5E96XZNdr
	 httJhs9evRd5CrylnckTJ6eIOCuFpcakik1peGJRcmcIjGl9Ywd4zOGUBBCkOpD8AR
	 vWrYHVyUb77X5eMdwl0O/J/jXaD/X0MCCbn5E/LuURcK4AxsiVcz6owhYopJvrMHM5
	 95LazxELTTByg==
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
Subject: Re: [PATCH] phy: marvell: a3700-comphy: Guard missing polarity
 argument
From: Manivannan Sadhasivam <mani@kernel.org>
To: =?utf-8?q?=C5=A0t=C4=9Bp=C3=A1n_Daleck=C3=BD?= <daleckystepan@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261001151939.23658-1-daleckystepan@gmail.com>
References: <20261001151939.23658-1-daleckystepan@gmail.com>
Date: Wed, 28 Oct 2026 17:04:29 +0530
Message-Id: <179318726992.5872.8966112619057702864.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1495; i=mani@kernel.org;
 h=from:subject:message-id; bh=fR2hoJz11vogsarSjJMB47094/svk4kkI+B5BqmBXeI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4d3IfjcamPUAIxgUX26jrukCB2rCPDjl/4WDp
 BL5kxdCIACJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHdyAAKCRBVnxHm/pHO
 9X0YB/4t5U7JQ00GkNTsEc4oTiFzpHouhrDd1D6Tjf8G7s8kD7w1G5xn5fNXGZ4l3B1zlnYIsv5
 JB9RVmvXA6MHEqysE27yXwU/wALJG+3UUSgH5dS4LmkyGzqBcWKZIG4gH2s4HnKuOIrP9IwN2U2
 fb6LqKaPXpNg08mC0i7EGU5L+/V8dPPNYhm6lBlDQZQFML2z9mpkb1lNy/tFKdmv5TfGI7kdHBy
 ceHEOk0qn8foJ+oObdRADLYfn7SHAXpHkaa6XJQBhx+Uj/dT8ZGXFNY7bG4gTQb1L1DzJZ9nKk+
 LRDcu+WFlXj+6612XfBLqQuVLCOh100GCggOjyoUWcmK/WgW
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-01 17:19 +0200, Štěpán Dalecký wrote:
> The Armada 3700 COMPHY binding specifies #phy-cells = <1>, so PHY
> references supply only the port argument. However,
> mvebu_a3700_comphy_xlate() unconditionally reads args[1] to select TX
> and RX polarity inversion. The PHY core does not initialize its
> of_phandle_args structure, and the phandle parser fills only the
> supplied cells, leaving args[1] uninitialized.
> 
> Using the unused cell can program unintended SerDes polarity. On a
> Turris MOX with a Peridot switch running OpenWrt with Linux 6.18.54,
> the CPU link reports RX CRC errors and fails to pass traffic. The
> switch PCS does not record a partner advertisement despite link-up.
> 
> Check args_count before reading args[1], leaving polarity inversion
> disabled when the second argument was not supplied. This does not
> change the binding or introduce a supported two-cell interface.
> 
> The same change restores 2500BASE-X communication on the affected
> MOX with no CRC errors. Cold boots, reboots and interface down/up
> cycles were also tested successfully on Linux 6.18.54.
> 
> Fixes: 934337080c6c ("phy: marvell: phy-mvebu-a3700-comphy: Add native kernel implementation")
> Cc: stable@vger.kernel.org
> Closes: https://github.com/openwrt/openwrt/issues/24069
> Assisted-by: LLM
> Signed-off-by: Štěpán Dalecký <daleckystepan@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


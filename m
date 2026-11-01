Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530094;
	b=FP2nFwV19Hj77Que/wWCopAHn1rYGioFL92reRH/f+v1Oc3fzGy47csDsg8zfwxa7n+C
	 ZdqQ2Dhs0PcEqPMlAlnwMKETjVbMxP7qu9PMoYzIYQ7oSOPvSWo34ZjzBqZBk2cbu9hVo
	 gzY3qoOUh1AU0nuXOIm1KUgDciX1TnYihLroazvl7MvenTSnCrU1DO0IXeSzNCm3Qx3j8
	 Sg9Eu4wsu1buk1WaBeT+SZ/VZSCDkaAmOENJPpwpkfCsw1Bouwfntno1ZH/Eu8OmFIq11
	 RW+YTZUcalM1izUv5WVFWiJdqRFnSaBdbRcxyHnBDt5DX/dcyhGnZK4nrlZSCxRQ8mA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530094;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=BMQUGc8pOLTnBJyiTlM+ASww/xGX9AxzZ/D4UbJM1AM=;
	b=ARjJWTC41OXZ1gDTK5qGpFeAA3MRR/EMWnGFqojiy6JJx3dacQsbjm5IfkIlC2U2GBZg
	 uf3NMY0TG98fu9g3l3+f1OKT13WNcOMyAkqRCe2JQVyK0um4KyMuCDHhnjrcqyNBPVUZa
	 yJJ3uKvDwIKErKB1LP7D3KinR519/y9Qn+R9jrWPlWHQOjA2/bBBbFgzVELbLx7zxfEPe
	 kIC6w7y1H6MHgcJ2MSp2IdrQa67xu4JwxfR8xheMehEXj+DAX67mVr2RKyWPX9nFxfInp
	 VfmUter5on2Vid5se7h0Mi9DCkW3YZ2HNB4BzH3AE1NXAhrnsqEZQu5akwR4HM03qAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mY31B47N;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30721606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mY31B47N
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7C421F000C1;
	Sun,  1 Nov 2026 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530093;
	bh=BMQUGc8pOLTnBJyiTlM+ASww/xGX9AxzZ/D4UbJM1AM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mY31B47NXm9vGgMA+O9hBvNDxrddozkZjkpapkt/B3TSXFuUrdFVjc6lNgTHiI8GO
	 fpjgx7DylENb/VlnXkCAJSkJ60ODYFBuD3pyQTFlgzsxRAhn0P9QUU+3UHN3QCQeSU
	 nW/M7Wo8eRORGAV7G01YUK4ZDiP6f+l24m6QiOFlqzpsJG0EEKURat59A4RA/ropDp
	 Hh7nOCrZ8k6gqEnrJQDPTVtYLaDmG6Y9Rrw6pnjD9IgoQ45utVTA48hnyTBDpMu92Y
	 TuVxPddN8wRZTkD8oTPPtSsSHgeZZ15ENvHqNEKeg1dMGMWySYlAxyJDfyz9jBwfZw
	 mem4r5y34xRzA==
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
Subject: Re: [PATCH] phy: rockchip: inno-usb2: Remove redundant dev_err()
From: Manivannan Sadhasivam <mani@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261021102155.609575-1-diederik@cknow-tech.com>
References: <20261021102155.609575-1-diederik@cknow-tech.com>
Date: Sun, 01 Nov 2026 16:18:08 +0530
Message-Id: <179353008876.2955.10222865416793608606.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=470; i=mani@kernel.org;
 h=from:subject:message-id; bh=d9qcRACxYqkzjfsatuzXIuqur3dqsdhTxFTZxd6NSNY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xjqQdU3ny5oNfS60dQBJ4ap7IUaL4G8WCWNS
 y3cxGPUrrKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucY6gAKCRBVnxHm/pHO
 9biACACXgFhrDkqPj23vKCbn037hqK6+nC+dX29PpgBSCwTZQgNw0N5SJ71VKP5wXZiZ25dB2ft
 OYM9GrpQFGbikPmT7qiGGUZKEnedYTEVJsZbqMxl7Ulqc/JQyfDErI4CUBPjFYst0euX7J0HEOz
 craIYHCilDNRAdWRpAKDjuAfHdCXfVdrpkmXTeTDYIKK+ZHoUk3krbvtXmBOo3/5PLNAf15gvaa
 x+rk9lDCRhabAV/DJhjGoQuhFKPLiqgm8lhFCxj3PB3zScTxk5ZpKCHJZj3+jeG8ym0kaxloQqX
 Rf0U+s2QPQgKJGM0ffU0Zfdn+TAQNrmbr8ZFR+adx37sFlj4
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-21 12:21 +0200, Diederik de Haas wrote:
> The devm_request_threaded_irq() function already automatically logs
> detailed error messages on failure since commit
> 55b48e23f5c4 ("genirq/devres: Add error handling in devm_request_*_irq()")
> So remove the now-redundant driver-specific dev_err() calls.
> 
> Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



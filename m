Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530697;
	b=tlr9WuWhweQeQBSNwCaxK5ntgdrHD4KbgavflPPIFPiqlSF6lqxOI55SsI7Ia9qeeLZL
	 9oTROsi/PyHNwoP4fZomPb0IKZO5WzECh4LEj2CZg8uGMiOquVSTd4kJ4JrFllpbf7kjP
	 QImeJ8o9BoSq8yTZzauHqRBQjz1gacOHFIa0YzMLor/9XuBybgq3+jOXrVhO9OL3J6Sku
	 jjwiz6mHjLKb1w837+4mMHGAVqLc+8z3sYs/DoemkKa+7Il/pjlm3Mm1zGCtoJRJgs+cQ
	 hhjtbFl8sWuBTXIi0rXYv4ZwW4C+MRfrnI3zEWyRKdExZ2rKuNNjeBS404+cC7yY03A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530697;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AjOm5itLLaZPzR/tAo6X/hh5/JJzIWsiJUfZJmio3GM=;
	b=fuK3m6AW0S5p1Gbv46chwnhrVAHuHbKrvZzROJjALha1gdfgqC7zOUYn82jQQBbhH4hf
	 WxxCN1XUTjtGGDu/o7EtyjQ077pRSXslgqO5sodPCLdWriQGhaPTF1DOvUwk4nyj5qRkA
	 52x7k9LOsajV9HuvShhfg7+aSbo+C1WnAecSMKkLs/likMlsmo50DhB6wi3cO4p7rjdgy
	 /pfdmwRfFPU0mTWAgemTwfI+SM9zwYJOeuGQq08h6TKdRiBjR3qv83LGPrwv8g6lz+md4
	 bokzfRXMmyOwK/rfC5ZVHt66gWwYY0oMdJckO5MUgqqcQVoHOsgAflYOt2f+E6KPCEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3W+6QOQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87887606A324;
	Sun,  1 Nov 2026 10:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3W+6QOQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFCB1F000C1;
	Sun,  1 Nov 2026 10:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793530697;
	bh=AjOm5itLLaZPzR/tAo6X/hh5/JJzIWsiJUfZJmio3GM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=h3W+6QOQFcZc8oDCXkmzOOvczCIlomQUSyFaW86UyrATsUVayqop5U9DYtTNpgLYl
	 0GwSJSUECuWJNBAEiTElAT8DxKzlbu+QD4qIVVAeOIaRu0RDsPBJSbNYdp4T/ixyW8
	 11hNt2t8sQwVbGLJAUhf7tCOkcMTRWqAzKw8IElHpPlglQzcDC519pYufEZTdDecj5
	 nb78H9KBLdorKKLWyJaEtcppiqc6lBJDR/4Zs5pKKlQZ519d2XGskB3OYbZVKS7KHC
	 wHL87gmzU+5C6maivErEBNTUJuC36gZC67Wd3gWGZkFYTDTW4JuRV71KbvHOkIjxnT
	 5ONB1dFCWfoog==
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
Subject: Re: [PATCH v18 1/7] phy: rockchip: usbdp: Track PHY power state
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
 kernel@collabora.com
In-Reply-To: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
References: <20261021-b4-rockchip-dwc3-rockchip-glue-v18-0-60000d03fca2@collabora.com>
 <20261021-b4-rockchip-dwc3-rockchip-glue-v18-1-60000d03fca2@collabora.com>
Date: Sun, 01 Nov 2026 16:28:11 +0530
Message-Id: <179353069145.2955.17636062800413643927.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=347; i=mani@kernel.org;
 h=from:subject:message-id; bh=/Xjc4dd3Kn79T6DBExQzfzf3GV15xNS3edAbpVBalow=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xtFkLHGHY4Dte8tp134lDqaZDFBOFkH/LshI
 aNzuR6MJbOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucbRQAKCRBVnxHm/pHO
 9YcPB/91VG4aHMmJm8c5BSrj/2Xm5CnNIPpgo+RDCVAjvwcxgZHkFiZchWJYqHiQkYrOzz+GaBK
 ww7Kt2ghLx9mYTOlukkGgWJCkIwZ0WR3BV+/tKUDhrkoSd2w3ZnaUwwChxXo5QAnvhxPALJYdGh
 Fz6RTAYgBTwUt63C0+me+H/eHO3YEQytHJuFOjqKhiHitY/npIGlJdf/wNHMePklLcUmzLY42UF
 Pd/ETjFa9Lvlcs0JaPOzk7eYddtKYLLBKox6nLLPWEDvBjqzVlDiKOxEofw/N1ISBI6/qXO605H
 143Tw6SaKVNhCGV7BRYx1XALDZ6qIRh9KfKAzBoVBEET6/Jm
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-21 20:05 +0200, Sebastian Reichel wrote:
> Track PHY state requested by software for DP and USB3 individually
> in preparation to rework and fix up power state handling.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



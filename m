Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775151;
	b=f/Hsb/LcX/khTekYtK746CqkMgSKm3W53A1SIOpIGO+TU94irDH2Lt8aG89gOXHeiInS
	 FLlQmy0M2tPB0F7C0s885V72HWp3QnQDC4H+4xuxA/98zKfuJnMzksXe7bnDdw8jVVwyi
	 x3T2W23Wm3/KZLeKv+TFi0j5eiNTbhFjeUv6obGjQVXv6E9S373hJrYPyMGA/MqrM2WgZ
	 F40PEFM2+DAo2MNamZrg0OjSG2xA3OBS2mAGIlIT6pZvQUFfOIRmfeHzclpp28JX2nK2B
	 n6egW38uvp8lbOhMVC9ASKgbZ1c6xE1tIUmrhMqymtNjTMgx8ArIlVkIH9LVZg3FwVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775151;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1twIXPW/IpeU816+betUtrDIHPA6s9NPrxCovSDRYjU=;
	b=EpC/hKD9uVhIvK9puETYO+4lHWJideUezkuMRNX/DWmaPvq54EvnWnDrz8v+kNkt0lKT
	 4WTSOE0vpHJmv76uy+kmXo4iWDB9xtNxyiLAoZLev1hr9Ouiqs5RwZ4rEOUMebdHm85vO
	 FQP9NRolrxi0ysViphYRvK9DKSHj9zd2jblgqhg7ZcLkwkH9bkEZKrxWbTuUnhgY7q08e
	 s6UJfxhALrLkMqKKMIaNOZa2NknFmZNF8kwspfU74LiF+JL2bQrq4VaG606C9tMx51mJK
	 1lpZgFG8CMgoIbcMAwto8yK+mJ8us31Iw8+Z43dcoHkTri+UVQrdjGRu/g31Z4dljLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABFE606A329;
	Sun, 15 Nov 2026 20:39:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1AB1F000C4;
	Sun, 15 Nov 2026 20:39:05 +0000 (UTC)
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
Subject: Re: [PATCH 0/3] Fix up AON clamps on qmp-combo-phy
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
References: <20261102-topic-qmp_aon_clamp-v1-0-141c2cb6cdf6@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 12:39:01 -0800
Message-Id: <179477514161.135135.15496134606156270634.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=549;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=CE9Usf85/MZHkoZKgSpfe9pR+KrAbG6HfA4cqMAWr3Q=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+hhoO0zCatM3Dit24TYBspItj3Ja0VYwmTW17
 smj+vasr0qJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoYaAAKCRBVnxHm/pHO
 9dZTB/471eIwW+6+m7DLfD8yfvSqizbOeA06WnzmsbBlpJ2XIH+OOfnJ7wLSDIDY9wE9qSH2pQi
 IEGxV/PWLeblkXDHyWWeV+u1YWMXQfA7wFl0hgT9dxsduWikem45rX1Jf7DAob1h7MTkAvjxgm5
 DX0BRer1Qd4dskKp0kl1Gu5Mof5h2sS6uADiAoJadHwd1kj5mbEzrSb1dz8XsxtDy/o/350M0lY
 2IeFPaK0kruDuP1APaPe4glm2gosIQgo39zqQTnGzjwIC+nGXBQaeOi0EDyceAbGXTlTsuM1MDp
 gfCCz0rXUCRFunnGfOOyJdzZHOfejqTS8qK0BzmISxYvykTv
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-11-02 14:59 +0100, Konrad Dybcio wrote:
> Various platforms have apparently not had the AON clamp writes end up
> at the desired registers. This fixes that up, based on the robot's
> findings.
> 
> Depends on (reviewed and ready to be picked up):
> https://lore.kernel.org/linux-arm-msm/20261023123512.1912-1-26rote@gmail.com/
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

No Fixes tag for any of these patches? Anyhow

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771925;
	b=d8LQlx/8FM7748Szmca+ZX4gXkoB1wGNbuTZWTMwYLKJ9JC0EDdQO1YzBsQ3+a+vg83T
	 detiPCvnUE9tlBXRPn3/fFiaZt0KHAoGbp/YD8MJxR2m8xLpnirur0z12xR3tNOWv4Nxu
	 waisB3Sx+nsNwUFLaaRUB4tl8XyfPLoSeag5JQlpiS9Kl/iUHVdR2vF4SVxXFVcbYCnt3
	 AMgTiBz1vg197ouvd0M7hbRmNdiRWH9AMXx2wugLZWZWvGhMyQT4qp3k3xChYu7wCuRw8
	 LZk61lKwt+DiD0sCKdKLPdrE/nvlSdcCeGoQWxCj/SyQZxazw3gJajXcxFNXxP6Fwfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771925;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=6vPT76ulLO4cxp6gW0RIOC7kkqeP9A5yUEJ7TToOaew=;
	b=Sg9XkX0ll50i2d+jel+lilsCiVo+uLL71K1aS6wTsXqOjy6Szg0KJ1E4l68lPSYat9I1
	 nUkCvFHJDZyXxPnB73xvJJKXoJuOb539aYKXV/ydpeLYaSF4FCPQYCbpinmpPMFU0Atwh
	 VUL77B2yt+4mOEaa7IwPfxdq/DfUKWApJqFYL/YyYQ9Ujs4TgEnQarfLFjC4476nBHhiy
	 SfmXPj54tKO4O2LpnddZnVZ6d+V/sjBrzUO7XdNV2yBaiI9GywJey78s/nWL35X5ksLMO
	 vbHZVKealG3lng/aVukyhENFpwifXTVhpetsX4gjABHCsDn/T6b4r5/drdm8RkBdQGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEAF606A31F;
	Sun, 15 Nov 2026 19:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F321F000C4;
	Sun, 15 Nov 2026 19:45:22 +0000 (UTC)
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
Subject: Re: [PATCH v2] phy: qcom: qmp-combo: update offsets table for
 x1e80100
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Tapas Rana <tapas.rana@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
References: <20261030105515.1948430-1-tapas.rana@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 11:45:19 -0800
Message-Id: <179477191938.132702.13137454785343235801.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=762;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=JRUjBJXo+GEfXop0V8NK49VdWI5pwUUQAk7AQE3FkZI=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+gvSBpFntFsicBl+nr7S2MAtRjt2KJYNvqFG+
 w3g9FVDOrmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoL0gAKCRBVnxHm/pHO
 9ZmaB/4naZcfHpZ/Es4f1bIYGrXJ3XitoD9kofj9bvPqgNF6RQ3gAPeolQ7LocGLtU283VAoq7c
 C5dQLqw/MRpBbMMc9YDng5pbJdfN4A5vFQUKbl/z9xPysJ5YZV6zeChF2YjOxLsSjngtFIMElJp
 QlgqvhyOhI+InOajCpKgXRor3+9MHeYm1XrQRQEGDgivUXQOL+MNhHg8RBzOCQfX4sDCuywPxOY
 /zYQcJYPg++RaItUjdftoHMfFVO/KmfykWQkD22I7GpZVqvTOfZRDXynratNmhosHWX4zREkAGv
 ueu6kO13e6gv7FYFnwTCQhbI4fTRB4ZY/7X1uCNc9pD+7yZm
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-30 16:24 +0530, Tapas Rana wrote:
> x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
> places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
> it uses qmp_combo_offsets_v5 currently, which does not define the
> usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
> autonomous mode falls back to pcs_misc for clamp control.
> 
> Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
> and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
> through the correct PCS_AON register space.
> 
> Signed-off-by: Tapas Rana <tapas.rana@oss.qualcomm.com>

Missing Fixes tag. With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


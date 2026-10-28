Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184992;
	b=aMNWcE6mftzdVYBRBvh+eSKiw9u+Hm7gsdfGo1+qPakDewEWtlGmtBYmoC/DIuREwUJU
	 OGHcVxShppJShPSzDXpkL/lcAAZlnD+e1LQ+AaHVwgNU4PM/drPtKjaRif8HTjVZj3h0q
	 j8mlZg4E+jv7zOSwy5hMAsq8SvCN5p08erEi950ZEZRvlVU0YDlxXds8ZQkxQfNqzHA2M
	 zZzm/6CV7dsiehzGd5H9zXL4i+IPxb14/xzgTs/FnARz41LsH11pUJo5HB+UT8UEwmyl5
	 jpgVvbRclJSsLfO23FnhLjb3OY2YVQVOQmY0DCBxpsG5rrHyRfSWfyGqx+V6UgS5oVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184992;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hVZr9LSDJpK7Fp5q1K7wTqRWzM5rm5ZVQu5noT3RtdI=;
	b=tGOtA9oXowZD2e9lusYqhPA0Ix5hlqC2kzsaG/Ug9qKfP5L991r5tcWHv5UGA3T/d/jN
	 l1Rm3cmN2W3DyfJzX64ad3BOjE5TaMITj/1rQRIIQ1Tm6W6GF1Ia/R7bgAtz0M33A0Rpf
	 QKIT18J4tG4LCwk1mn1Dml41Kr2nwYUBeSpeRtZulm2NrQdXGq1AIJazqFeCCo/7mp8jB
	 x+5xmuI2A6q0cf6vUpg43yEpGZFjRar21c8MAmNOL6u28MukN9nfdvpmX2ZckxBcLmAQi
	 pDuzykAClaeMva8jYX8Wtn7AK1h+oSdmT/CDqoxmPqai//PiF7lQiQhV6yxSRJ0ZOdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FndXwbZo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFAF606A31A;
	Wed, 28 Oct 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FndXwbZo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D90011F01825;
	Wed, 28 Oct 2026 10:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793184991;
	bh=hVZr9LSDJpK7Fp5q1K7wTqRWzM5rm5ZVQu5noT3RtdI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=FndXwbZoYzD99btSoeEtZy2DWl0B4zsQxxKxcQykAynV3Wp/UadcoLT1rX7gNz3it
	 k5gw59wqRfW980nVFf4YlBhGpoI40KZRG579qqQTamvSMu60lX8ERpHdbEHRVdXkBm
	 GSRp2ogsEL2/vahyRmF3JlOz8np+IQx3y5vgDaieuWCWXvg4nMPn5Xob9SU5BPyvtF
	 6ffVc1DuzAXZ8FgKPcXB6v6+EiF6/cOndfKeasB33PNWmY5Rr502k1LQN091cY2oRm
	 n7xmwvKRrBRfjvTgncDhQCL/a9oKPE9aS9UmkmsaYwDlPK+KT3NOaelYEV8PbSQArP
	 dwLoGWNzIKXDg==
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
Subject: Re: [PATCH v3 3/3] phy: qcom-qusb2: describe autoresume bit
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kathiravan T <quic_kathirav@quicinc.com>, Baruch Siach <baruch@tkos.co.il>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 Manu Gautam <mgautam@codeaurora.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
References: <20260920-fix-qusb2-v3-0-c273e75c9fb7@oss.qualcomm.com>
 <20260920-fix-qusb2-v3-3-c273e75c9fb7@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:26:21 +0530
Message-Id: <179318498140.5872.2401839534067541401.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166; i=mani@kernel.org;
 h=from:subject:message-id; bh=hnJwp/Io02dO6S3ZHXQgYf/WeurE6cUwHj9/l8YJiL4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4dTYlntVeRycHVthR+BHqh/8GgFTiB2Otmhya
 hP+7KpGLkaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHU2AAKCRBVnxHm/pHO
 9Tl6B/4gL+u/n7qty7yWxD3WG+aQ4rJ1MKJAG+gXyWC535NlO7G20LTyl6T/Z0ncz3rNxIaOpC8
 E7ErcDoZwNfNdcSRBmSOp6ZJiOLPq7yFERurrQHNbR7WZ2PA0sddKDCLGbGDT9KvLEwGjYJvJka
 ueu1/kP6JDCydrE1f/xG6VFqwdfcgIZQzpTWFTAubQ57N4auoLhBfjPULgKWyZDVxUeO7p0hWyj
 8bUK3ACwWv4tNsXbFxbMBCGvdgxd3vzCMvyRvNhSwaCTwuTOnOw9+lb8Fabkv3gOfcKjsiQsho1
 iPs9pXG5IIpGgL91150pmZ08WvQ017joybnlqCVbEhpGokqr
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-09-20 16:59 +0300, Dmitry Baryshkov wrote:
> There is a confusion regarding the autoresume bit. Some verions of the
> QUSB2 PHY have it in the TEST1 register, while on the others it is a
> part of the TEST_CTRL register. When adding support for autoresume bit,
> the code attempted to simplify the handling of those registers, putting
> both registers to the TEST1 layout entry. In the end,
> ipq6018_regs_layout ended up correctly definig TEST1 register at 0x98
> (because platforms using that layout didn't use autoresume), while
> msm8996_regs_layout used TEST_CTRL offset (0xb8) for the TEST1
> layout entry.
> 
> Update the platform data to specify the register to be used for
> autoresume handling, define both TEST1 and TEST_CTRL registers and merge
> ipq6018_regs_layout and msm8996_regs_layout which become identical
> afterwards.
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

With the commit message updated to mention the impact on Shikra:

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


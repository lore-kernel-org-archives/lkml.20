Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169507;
	b=K9Z7KQIPt5uQ1rFy/7kRbUKNF1V8KjmBi6rW11B2fPC0SMZiYGnYXSA+wvhTg2/yxiXk
	 CdH68FdOyZ1YyeA+d7FbdaQ3BaBNc2f+kGULckc1y6a/w0U43O2GAhwWSVMNvqyu7ecvA
	 g3xT0XIMZBCEUR4tSIOdkfTfdpfk4Nx0Aq6M+Z3YNjjuzPN2XQbUKkheh0XrAO7t3iqEy
	 8dOD7tkttGEkpRiKjW9fKYtNH0EK7Z2fjHQNByCF7WeBiXxFXgd91qwnN4ho9q8jWtmqZ
	 RtZcjLeT3kNal1jdIUTOEt3z9bkAWjDrWvqXNvWHk1tr8e0t7N2i5dyUoWlSLxQA/8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169507;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=b76MrP8vb1NveZduxU4EPxdtvgqIJ0uwY1EaJx729tg=;
	b=HZTXWoUoSq3m7q+2qi27PI8wulyf8cx9OcEw1o3lG4jATKtFczRoUlZ39ut5AQ5fCFp5
	 XMEnYBmGzfmyjIMMMSVzTtc5JHKrsC5rzFWCoeZ8HfI8hN1F+TKtDzg2oAnTlevmJy5d/
	 CYpnW68Rqe9uvBci9/bP987mT/J3Ym5ofVl7IQ3m+mjJLx6Gs56wNTf/MVFyNeU9jvxXk
	 WdMOLdaVeDfEMtUXYM8OEbbeSCcI5jvJJw2INuMPnsGNy0A3mKW4Ne69x15g2MpjKL3Of
	 AfY/gJsreP6pofXU+lviFlK4uvZN1YUrpxBuP9qcfOj03Frvz1W+FLJuMV3QMz7WS9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Weojoug9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB4606EEA4;
	Sun,  8 Nov 2026 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Weojoug9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7241F008A2;
	Sun,  8 Nov 2026 20:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169507;
	bh=b76MrP8vb1NveZduxU4EPxdtvgqIJ0uwY1EaJx729tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Weojoug9ywk0tz+ioo2wwc0Q3pNV/Kdp+BEt1GcdVM9NO52Ecwm9EPsIgEsoX+xyB
	 DGG3WawGFWoVhluMbIkxJByVi2ci6aLh6XQiC+9RmC+0RFMINuG6PxFDfQP8RHNa6n
	 WGoUKl6CS0pRzb3qcv8VFYB0/0NVZbwMtgonhq4B7j+wulAAenmxRPAlXSDi8sx+XY
	 drPf8GVumdPYdcnPQ0ZFJ6AlB4CmrIU1AVMIb7KV8vY7ZqcPurdpgEmcwyfo0PFCcC
	 w3YxFCJeNCyiJEOTJ4pjpGSFaN4nz7EVtjPsEMWgiyuhacz/LGxfOGSBAgWzQQF+eg
	 kAgyP4Hn4Sb7Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: mukesh.savaliya@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] soc: qcom: geni-se: Avoid redundant transfer mode selection
Date: Sun,  8 Nov 2026 14:21:29 -0600
Message-ID: <179416929366.628393.10644528274382007761.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
References: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
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


On Mon, 12 Oct 2026 17:50:20 +0530, Viken Dadhaniya wrote:
> The GENI transfer mode is commonly unchanged across consecutive transfers,
> but geni_se_select_mode() currently reprograms mode-related registers on
> every call.
> 
> Avoid redundant mode programming by caching the previously selected mode.
> Pending GENI and DMA interrupt status is still cleared for cached selections
> so stale completion status cannot complete a subsequent transfer after a
> timeout, abort, or reset. GSI event routing remains enabled for cached GPI
> mode selections.
> 
> [...]

Applied, thanks!

[1/2] soc: qcom: geni-se: Split IRQ status clearing from mode selection
      commit: 3083e5dccccc504cf6c0b384d32334dfc576a92e
[2/2] soc: qcom: geni-se: Avoid redundant transfer mode selection
      commit: 3096ee721a7f444f67d1dbac8361bc8612c72baa

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

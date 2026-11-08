Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169402;
	b=Ba6Oz0I/3luoa0cHWnToRYRiitD8rItM6MnosHnyV3n8ZE8cdZyn8UuNl8T37rQ+e5dW
	 wuHj9o+E3DGUmVkE7R9QU6c2e7165tEMGWDSfElkjmxCFHSAU3BsenCkXiOKfLdMf19PR
	 WEf3CICIxeRPLH9vFNdsm4WW0+3IwH/6t3uhpVIJn9VXIXgP75CvTacSXwMHu46ZcQx5Z
	 nI0cQg7Qe2XMSE51sMFyXYt8i4AbXBkKpJQQPTtKqr5x4WLNYejGzRegS9tmFEJrO//xZ
	 lDAz5v0dOGS6lq9PWS0a25cgvBZGBQbm6gc+szvo4oxyWlh9dsLmGrW9ythSb5b4sCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169402;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ea2NadJLMeWQpkEhCEFomrAapl56Z563nHfrCP3upl8=;
	b=SU4172Ze2ZWfUX2hesyzbUFFOCkUG2xYQH3c1rYQsy6wrrxrzG06q6vrnt4OTdiDlC0V
	 XTDf95+bLXsdg7yj609epDDIRtLrBNZaXo/9/0jJHMIPK8ktoPu+6AaTL7ZO9UiT01bbW
	 K/jdDUPq+Yh9UCLBTwJBVs4fiVNks8KMpvyjhF777DlBUrS00sHiPJN7maYBIQLwrWIvI
	 U9BL+aQe4gzOERzXo50aQ3/28nB8KaFCus1JMc7LulEdz2BzRk4qo2i/T8P/SSdV/kUAr
	 upJRiakz9/ziIb+f2qEmt/g+09zkJFD590Xi4qtOXcSw+348Q545MA60rXsic9xO2XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7efRrAO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8421B6070CC0;
	Sun,  8 Nov 2026 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y7efRrAO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56F21F008A2;
	Sun,  8 Nov 2026 20:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169402;
	bh=Ea2NadJLMeWQpkEhCEFomrAapl56Z563nHfrCP3upl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y7efRrAOJoAELqU1AVec3u/Zarb4EkKTAs08kHs2wAKMFfJ/QhCZz0yh8i5le6Xce
	 ID3hFRd3C2CY217hJxKgrgaOtHGothHdhRowJLX+QXOw8JDsDPh7L3irEISv7F4npw
	 ZtQCnrZSZrtJSR+FZbydHTbYzdk1oo38bIl3Po3fRdgNBIgIX0U3RhPndPsR8ztc8V
	 4/49Z9q1rVz/mVsu5ZagETvZdQJrNSGGOfcDEvJXQ5+WpzVAima2DyFXWkRCcNsmlw
	 5OdhVdiMjRO3ZJi0IbgCcCBFxKB2M+/k8i+xmo6hlox6fjuUuxnZWLCI5HoPvn/3Io
	 FtLPHcai6Zi9g==
From: Bjorn Andersson <andersson@kernel.org>
To: mukesh.ojha@oss.qualcomm.com,
	sumit.garg@oss.qualcomm.com,
	konradybcio@kernel.org,
	harshal.dev@oss.qualcomm.com,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: qcom: pas_tee: handle a NULL resource table
Date: Sun,  8 Nov 2026 14:20:08 -0600
Message-ID: <179416929326.628393.16808176255820702875.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
References: <20261006064747.2454980-1-jorge.ramirez@oss.qualcomm.com>
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


On Tue, 06 Oct 2026 08:41:49 +0200, Jorge Ramirez-Ortiz wrote:
> Stopping a remote processor clears its cached resource table pointer
> but leaves the size set. On restart, qcom_pas_tee_get_rsc_table() copies
> from NULL when the firmware has no resource table:
> 
>   pc : __pi_memcpy_generic+0x110/0x22c
>   lr : qcom_pas_tee_get_rsc_table+0xf0/0x244
> 
> [...]

Applied, thanks!

[1/1] firmware: qcom: pas_tee: handle a NULL resource table
      commit: c44eef6401b625f292f51e854e5a829e2e6748e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

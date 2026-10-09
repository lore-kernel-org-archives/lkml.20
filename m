Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002183DB300;
	Fri,  9 Oct 2026 09:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537476; cv=none; b=ck5mxOROABrX34ai79A3OUojJIH/z9k5QTf9OjMtZ3U6dJLgN1CrImWULQfofg8aui4MgjggMVHYFXt/HTOmTZL0RQf8ISY43J5UTf+PINCHbvCEOhk1xgJB3YDnHMoN6HUDoicyS09w68fcJcToLWDtqeo01ld8wTFw6PH4T/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537476; c=relaxed/simple;
	bh=uDL1q1jepWIeKycCGmUBL4IwG57b+P+RWjDjMTqXI8Y=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=OgPgGgIsBFRaevGwmohFxEAH/0Jl0bmZSKwKyY+wa89TOj/TqStOWtdHrEpdWihHfqmpyAPushKg3GhSbyOPyBq/8T/oiQE+PuYrV9LR9P0bRuHgF+b+arOW3uyWC3U+MdaDi1d6bYHgpFGm56WDfJbZnLp0Cst6cioPM2dJu7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N8BDitKF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N8BDitKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 413E91F000FF;
	Fri,  9 Oct 2026 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791537474;
	bh=T+nqmGC5pkhy9BJvwuiFkxR9pZ4xyGpc+m+K9zRwl08=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=N8BDitKFkWOHutt1L6qstaLab5HpDxT0Rtc3Ev1Jh03Cf6raDt+Ei9+rR++j+4ctC
	 et7gaYNFOZsmVMyI9ElMZs0UVkFFvjfUCTY27ZPEIoZTREaOCwx92z1ArwTS29dwwb
	 0ul9/K4gAsUpyTQhljhcEqUiyiNnAWe0RBN5d8ySYYXvRwNYVPckC8ucRYb8NuSVRY
	 xSN70477ctn+1BnvLsgvjMJUypce4gqQfrsDyOvaTt9Y3CvqCn31uMPxIKTFXAEUNW
	 XwR/UX3lH/ZYAnvCNzFspfze8my8OgfkPbsn1wyZS//HL15lRJS+AywkmO26QHSi23
	 /gDvqgMXGJuKg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 4/6] media: qcom: camss: vfe: Remove unused
 frame-skip
From: bod@kernel.org
To: Hitesh Patel <hitesh@ebytelogic.com>
Cc: linux-media@vger.kernel.org, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ravi@ebytelogic.com
In-Reply-To: <20260928121508.1404808-5-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
 <20260928121508.1404808-5-hitesh@ebytelogic.com>
Date: Fri, 09 Oct 2026 10:17:50 +0100
Message-Id: <179153747003.2596899.14946434357370335339.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; i=bod@kernel.org;
 h=from:subject:message-id; bh=uDL1q1jepWIeKycCGmUBL4IwG57b+P+RWjDjMTqXI8Y=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqyLE+xoxkMq+FSWwkOxNQ9rOKab97lcJQr5Eud
 3Dnv0v0XxWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasixPgAKCRAicTuzoY3I
 OmE9D/9Ez22s67yrnF6nTBQ4MQvtNYe4GxYqg4hlc71U8X/PUcHgQp+uDCv7DLii5yev1cKfDFz
 9ubCyXMYIUJ1mGtLNsAs2uzF4099jgCihdTbi1+zxc7AjPBs73Tyfcfub29GKLR09nvm7DIEsoY
 Q4H943Bs0TP2YpYcECswEQA9SAG8NSZAA6axnL5x+a572XpNr0cBCnk0VqmI7Oc6x0T19bSzyLg
 LHaEaHmWgSrIA92GSnd1bVEImyA8rcq57b1HycOMV84PMseNpPsStDlHWWWatJL9QKaw6g0PsDC
 faW1RMbidLCllQJygep2vakUlDJRDOQkhZK6xp766Xpswu99xXEPY9LXUWWG7LA8IONgu6vVShX
 K50Y/TESa3J+uod23f4GYT7qtAvX70nsf8fAjyhrTQYhfVQMMRzYkiTztU2DgS3N19AU0m31LXa
 fVX8WQCGTmUc74nDpK8/U8sB0MLbKXJSZKSKhNQhhuNQ0nY/YBV/ziZdEDRUQ/F7ajZE0ZBqIXw
 g/+CmqsQ7Dhdr1x2LwYayz3wUNXj5g0TX//EjaSWUMQ/z62agfSaRnidrDykUdHaMwxV/ZxM1sL
 5atLF++fPWdlD3OZ8GRM3b4DHOdvXu6bXfaUzk0Csu86kP9Tj/tQyiajyTgDMghyP+AZXDxW96O
 b4cqYTEzapfIbNg==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-09-28 17:45 +0530, Hitesh Patel wrote:
> From: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> The frame_skip logic originates from older VFE implementations where it
> was used to program the hardware frame-drop mechanism during stream
> startup. The Gen2 path neither consumes the returned value nor programs
> any corresponding frame-drop configuration, making the sensor lookup and
> g_skip_frames() useless.
> 
> Remove the unused code and associated local variables.
> 
> Furthermore, startup frame filtering is generally better handled in
> userspace camera stacks, which can discard unstable frames as needed
> without relying on driver-specific mechanisms.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod


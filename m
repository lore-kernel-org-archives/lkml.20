Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063646;
	b=yPu5RYvfYM7cSm5+R6GOkO2ZC5MQ/7jWXnWUTbzGVhsx1VCW8MNXZmeVcViIc17rCWr8
	 ESSfF+Jeool3DaQ9Pd9pNaYRNXoYuNrsKZZhn6XdUDzcFs451ev0MzkFJ4f4p+p11OPr6
	 Dwln1NCtOemF+V//RHSpJ0yJaWQqrzB6RIMDGBlDzYEhCpsEk2LUntsALhZQRdt5kgT7/
	 tW2Wo0qPHNH+PUlAeqe0G/UnrGu+XQb1zUW8tM11YZ/t3N4/4XQapQhAvXx6OEIvjYazq
	 N4WM7I7huR14eNBRoUzjJMC2aKYgLO+F6aQ6VnIOW0KsrwqpgTWQcbdStctkeGQB4Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063646;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=q9Bi0tahlAuUAjwyCbyX0uGfbCI4CIe5HRgmjbxUD50=;
	b=VwrvPyPn/txIUfOrY71h6WuXyVqv7bUXPthB3xALOeDL7uaK6U0Z3vJBTEfQRPvSrfke
	 vBIbHBmiAMI7laNQRAwscG+FAwEidY+pOmExj5cH7n/gqPTHYpgluKb8GXd6qPn9ymUgA
	 raoQTyWD8VFAgT1fAUen5yJJOJ4eGd7cjHasC4NzWcOESCfNzHkDPut1S3UC2ZqzSGHqg
	 lExwgwxwIgUHSYuFhAMhZMshxAelafqKuJ6FXoLa+R5RU8xTJT/wpLePY+UzXbHu8UM5O
	 Umc9DKMo5lPIpEDJv19v2dWkaDtqpz7337zc5PgZ94nCvj37e8WcYP7FuX83HzSq/PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsD2wS6y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F631606D827;
	Sat,  7 Nov 2026 15:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WsD2wS6y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DE181F008A1;
	Sat,  7 Nov 2026 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063646;
	bh=q9Bi0tahlAuUAjwyCbyX0uGfbCI4CIe5HRgmjbxUD50=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WsD2wS6ysh9jVow34VjdTGooGY00OP83R/XQCMu2NQm2eX9SkwPrDBH9tEQP/2Fxy
	 tA/4p/pURk2t+e8jz74nN1PzwXem3+ELUQhklCvHr74DkeLuLEV55IFLlKb95YEOBA
	 DvuPRKXBjlDW2A6vwnOqZrmKwvc44Xr7U+qy7CDw9XKwyWOYbORnkKmtok286rLGr/
	 ubKtFoR2Wl23wbTdgZF50emAMcjEO2PIbhI3ISr0rLbkwa1PmcMrcv8e6bSBcM30yH
	 N74TtDSd7AksIeEPRmPARZAHFnSR7u+neJDC/ZMmow6xGOnFMndM/0uOyKiN0bv3x4
	 fOo9Ru34QWLAA==
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
Subject: Re: [PATCH v24 08/15] media: qcom: camss: Allow CSI2 PHY devices
 without CSIPHY resources
From: bod@kernel.org
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com, 
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vz@kernel.org>, Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20261102-kaanapali-camss-v24-8-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
 <20261102-kaanapali-camss-v24-8-d6b8f3f6f66f@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 15:00:38 +0000
Message-Id: <179406363848.650304.998225523239519511.b4-reply@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=676; i=bod@kernel.org;
 h=from:subject:message-id; bh=6ClyclcQAm9+Ak4E3bcpIWErS8e0PORFMEQJE1pwKjM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBq7z0XWv6K3gNFjeKFzT8jxmV7/oCMfZT2S0yYP
 RVlXOoywDGJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCau89FwAKCRAicTuzoY3I
 OkhZD/4jKi4nBcmggrLh5V3wbJURfqY7+F2qsds1AjMnhzWgEnbOLpxYBOMZvnBY+vW2y1OfsyU
 QvJpDc/OM2/qYwRp6QV1tYPe0+TC9w+19ius3C3jAC/1yYQxDXl8TgoiFpikfT/uY+bNv5nyKEw
 MNrhdZWRuywfHzORCnK7q4zbX9e1OeBKfpUNJbd03GYxyHlyLrvNI6VSRtdnkGphSjUQEJKk4wz
 3oE2+ahrBm+EMo9xs8WZKfXC/JmUEFpTx8TvqCpYcuooRu8GP7ZBRnwu6HFyCDDR0Z5ZfBRfQ5z
 2FUNDUOXfYXjzicVF6KJdoEz3rcQI40V0SmAdJYTb6p2uPlUJ/xTTmEPU0hldeY3H/eudAX3nl6
 rAdno+evM2Xj8A7hT930Xox6q5+O5dbbviua2qCteI2ReWllDKz6d2tUXcrcyJm40XJygTTBtVd
 7Sy2504N90w2gW/SSDBq6rTfSNCYtohqLPaKA9odxWSTQThWryIdSG+Qvqq9tmckBmXjPXntsVd
 JVmXIcqkj0kx72vtkgCSUUxvDcZQjUHvE75YhO3Z7Ke0bBZUCjjq6hZa8enRzkFfayLzo6UfBWc
 gorN3Yc5G3b0udGLsxGQofeUx32WLfx0z4HAT9UsGse3KYrXHACfru140ek8VwjhD5K2rhTG9nx
 YAvJgfqXPwGNXdQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-11-02 02:42 -0800, Hangxiang Ma wrote:
> From: Vladimir Zapolskiy <vz@kernel.org>
> 
> If CAMSS CSIPHYs are supported by the stand-alone CSI2 PHY driver only,
> there is no need to provide description of legacy CSIPHY resources in
> the CAMSS driver, therefore if CSIPHY resources are not given for some
> supported platform, use CAMSS CSIPHY port numbers as CSIPHY identifiers.
> 
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>



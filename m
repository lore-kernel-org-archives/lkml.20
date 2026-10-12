Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C133B2BFC7B;
	Mon, 12 Oct 2026 23:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847187; cv=none; b=SDCs84qQHWAZ1+KCp6hWQH3ZfR00ynxC8z1/Ds8YgwSIbrtulUC9ceUXZGEYneqAW4G99KYrvcFoqStQFRnlnyhjx5x8bGOu9MdvM1cnXHlw4DmWvf502B3O2AgshZpZbsHUS4da+w9e4fov+HqGUJ2ehgKuoz2+gpuc2A49yGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847187; c=relaxed/simple;
	bh=XekL7nLGfOsrWj6iwNLQF96d617X42cQtWzshXk7QG0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rzdOV7cgj1GOdL4MYQA+lWjbnchmPUFdLzAGncPbeuOqRlAtn3rq/Yz+PkcaaNp/5V48OfzgGbbmcGToMjy0kLnp4nOykQLRJGJ5P+30466IaDfN9Gi8tkkSWmi2LzXNZLbSlE6GMo6PBVS+0nXPz0ueMJbAB/UcYQ4wSgAwLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAtgtxLu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAtgtxLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B181F0089B;
	Mon, 12 Oct 2026 23:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791847186;
	bh=zymbzV4xuuOmUW+cDFy3VBYZaS1DX9dhzhy7OD6YcaU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=eAtgtxLuqiDgdxCq1PCNs6+jqK7rup+awJICYqFyMCyLMEc0YvnglO/0VXkGWkpL6
	 /mZIlo/jVJwQUbCM5DoXzgSDkMkUHKhChV+E/3X4XvE9vk6b1nvNqDYIsv3UM9h5vT
	 n+c3+jrA/DxeFknL2edvVI8UFB2A/Gs/bdNlg309/fvyZInT81lDt3C0aP6G7tnaFx
	 S18g2+KPb4rA9ALWNzeg/V+0t8/o8Nzi715KaSwMSfsx6hN0sX8DZBN1Dc+75UeoYA
	 Xi/qCbMvCN3/diZ/51SVFoqL6pyotBakpB7D3tZ3UxDoV3pGZsWL3bxIbkjKClwwYB
	 CWFeDeb/1ddKw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm8550: Add the CSI TPG
 regions to camss
From: bod@kernel.org
To: William Bright <william.bright@imd-tec.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Depeng Shao <quic_depengs@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261012-sm8550-camss-tpg-v2-3-06dbbe36ecd2@imd-tec.com>
References: <20261012-sm8550-camss-tpg-v2-0-06dbbe36ecd2@imd-tec.com>
 <20261012-sm8550-camss-tpg-v2-3-06dbbe36ecd2@imd-tec.com>
Date: Tue, 13 Oct 2026 00:19:40 +0100
Message-Id: <179184718069.1635143.6101594072316608239.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=455; i=bod@kernel.org;
 h=from:subject:message-id; bh=XekL7nLGfOsrWj6iwNLQF96d617X42cQtWzshXk7QG0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqzWsMHWIdcUVxz0Trbqj7gv7wV5DYAD1eU0Y6c
 0bzRGQi/BeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCas1rDAAKCRAicTuzoY3I
 OkDVEAC32p6ACRZegAtjXJcFSrXjRcOugX6cTgWkrfcod0uivXN3Qa47Y1PMAZDob/y2f1vVRZh
 Y0qjUWXrTqI1d9YojzuBr4KVvVeEMsVYpzPHcO/D0qfYZzgzyJ9WkMEBWnwo4zAE8YkrfFnAbtr
 jZ+hTLjQGV/ias0BnVMJ9iM5IWUHrunBpvb144ARSd4oVWwGQNDEAu2UbjAojyzmyTv98TpQ9dS
 8SjxKEJMVEyc1S4E4WeLvRK2pFR+Qjtm4YYqt9/y+tKGWwsvSGGjEYD3c5ZP7lAjcvwsJogScen
 qv4/Gz8FF1gC9OdVEEfNTuHRrtRrx2iZXVKdfYkOlv7FVbSu6a6ufk0d4MGLwOVTWgavffavdUK
 1Wa6GkhH+Pq4t42NZPiBZlwb/N1nWCk9vIpnMyCTbjoODRbnf9dsG5FjtlrGwYV2YCxAh9mGnWs
 FZEY9MsUzYLeKFEHkcTYcqv1L4mVO6o0ZM0/eLmhgJExpVjQKRUcLwrkMFkv2v/30gznxLaaL9k
 hqvFMAMZ2RBAZhRHYhaJam/JJzR6jUWXbpDt2acr8PDq4o/tqdCMO1l2v8Q+pUrZZMabuX2s4vn
 skPHWAR95Ln1KKM53RvlgWiMt2TptiftwHG62O2bGpT5yrCwIFQjGJc6ZIWij50GegDVGCt47OE
 P7oXfTdZATjPdfw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-12 14:52 +0100, William Bright wrote:
> Add the three CSI test pattern generator register regions to the
> camss node, matching the updated binding. The TPG blocks sit at
> 0xacf6000, 0xacf7000 and 0xacf8000 and are used to generate test
> frames without a sensor attached.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: William Bright <william.bright@imd-tec.com>

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
bod


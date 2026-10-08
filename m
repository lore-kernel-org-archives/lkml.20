Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A551043E06C;
	Thu,  8 Oct 2026 22:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498758; cv=none; b=JL490Qnp29c7d8Fa+1VVySeTom8JpWTttErU4E53BHr0NKH31YjP8tVw5M6Y9laslkGOmnqB/WN39vFReNy5x7QVgpZxSG2aK06+pSsd5d6fzNmo9N2l4fhmIFaMWjuIko4uHQ7FgxFmYpmnCoH56Ma1TRG+DBKlOqL3dZYP3IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498758; c=relaxed/simple;
	bh=gynBiJ2XpmpWqYIos0a76LAWJcyd5WtUDWCj4iUsRm0=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=CiHJ5Z0bHDUOvHDiC7SGR1zwv/u9hgerx5o/uOw8UHcyzPU8CD9MKlR8Bg/WP5ZsYNjtSkZTwcOjvMveJdgh/87ivfEhOU8t2dnKC73NG+MfY94FlDePCYPdsbIW+EChAjfmKvLAWIgm5Tj4Bt/jUPd8GlHBYV6tLGjkPIRD7O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9GPfPM8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9GPfPM8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 404921F000FF;
	Thu,  8 Oct 2026 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791498755;
	bh=fm9WOXdln1JSVmOw4YJV7wQqlGzRZ+cLM0C7l5OeRkI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=E9GPfPM8CWlfl6VGD6t5IBrURhLx+Wf0Thn45Dj7iMUdiVmoMIH3CPI0YnHiCu+3I
	 BY1JK2/8+vk+psiycmSSy+YnNia5IqOOqGxQ7flj5F2AJ6cWn9urYZ6wAKVdZlqmR4
	 GIZd4TYn43cKkEuQeS+YjhJEqT1IffKeuczzPQCr0hwfiiXeSEZoqC/llZcLQgtuSt
	 fuTzv5i7aYMHvgnZnIc05G7O2kz5bJYQ4LwhubXeM6pZl1wQaEPUNZ9A/tmEGiDFLa
	 6fARusk/z5toXZW4JbEOpRBsMH4YPRXFBmse9cMAnpt6aXGHToDqVB48vpsMNM5J7N
	 6OF94w0z+9VYg==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v19 03/12] phy: qcom-mipi-csi2: Add Kaanapali support
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
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-3-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-3-b2c583ef50e0@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 23:32:28 +0100
Message-Id: <179149874864.2596899.12300116428348336432.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=317; i=bod@kernel.org;
 h=from:subject:message-id; bh=gynBiJ2XpmpWqYIos0a76LAWJcyd5WtUDWCj4iUsRm0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqyBn8lyHO/rFIh94QUlLiNw7eGFN+kZXZl3rLa
 xMnbfwU0SWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasgZ/AAKCRAicTuzoY3I
 OhrDEACWRhEok42o2PnBb5Rr1aaD1ez+Z1apVrTSKkg7Ucj+oiGsvee9lGeyK4QBX100IMXpvX/
 SFIze3cPzwYWKJ+p8oAgjTTii6nylGSLixQ+vC6pANB8hyeiVSs0zFkKGFZ8eKEFNi6UPyDvaJ+
 1MFnyirRb0D5sWpeOagJODxXbjMJEop2tZumjoKngvZ7t9/DsHPwL+2zkSXDAuTCUZwecTwEfmj
 41FGX2MXK6ZnIAnydaasCFsvKSB3U6awedcK9ORki19c3cPAenHnYdHyBUZLww5+L7Iwk7nbb1k
 qjiXtZP5oqQAVz3AGU8T1785oOmyhcZvWLshEOPC3TqH/hIYEVCV+M/13gNug+5O3NjWtED6CV7
 ljBu4FJ4rmjqERuDojQJXncm/TJ5np/VsxPuHzqoYC3T2vwCPTgEbNs6gp6EBfUaX0p/GK53cST
 uWsjS+qUgUPxNAlrsxTlUQUKivk0TPU+kGnubnbltqNHUJ/bGRyHSIFlrWFtrq9kfYI+iw7Ivm4
 WWdZzT5ydK735FMM8UVK0mzQd7mYFt9vSkQ0UvLyBA/V0F+q3jl6JSzAydXHJg4HccL8G7vXgPA
 oz7O2FYaIqynDNTJ0qjaQvrooxkVpulSr8WYMnPWEHfrOMtxof+zF/09WHClauoIS0RKn4qLYUL
 yaePaN4hlEtQpUQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-08 00:14 -0700, Hangxiang Ma wrote:
> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
> driver, including the Kaanapali common status offset and power domain.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
---
bod


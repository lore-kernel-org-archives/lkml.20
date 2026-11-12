Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794481128;
	b=n0wkuBEQZ+Uajo4uPI3zXHT/sQ35aaMRwXONvKE5+12xp7cyN/rM4UvNB9JGpRbObkww
	 mynBbSJOzrLt5AoRI6KQi0PA/N9GA1YT3kU1F4ddUDiUzH3KEs5OthKwPmI9tjl82U3St
	 TbwfaYyTuAQ8HvvZphyGwcfaAN4zk0KbSPphvZ9xQ7+lLKYQ4BUKrYuuqN7TMQaNNzm/2
	 G8NbA3JX6JpRYLSvByt7IMfbGZZPgVh21baq+ISXo+C9qbzl5dyxSLuC7ykNMWLSnAErm
	 v4StULxkvZn4G61K1ZST7R6wdTKOV2Oma6P9H7y5xe9JRZ1aNaL5DQfo7DaJYQ+s9hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481128;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=S2gkOP1/qIQAJzXNhe4mvVsSzVEh1jzUFKXLm1UVCzg=;
	b=tFJYCCPzbcx2RLDCEpN4QW/zOJfiunzjxG3cri17uIVurPdZEfzF+6JL+66tnOmkL3ED
	 aYXTKYbEYTm/JkoN7wp22JtCiDw9eDC9wGeJ98UqV09IQsgjEaSuFUCUjJx8+P6FfFcXJ
	 /tFo7/T1sykz0grFCaTzse1Rye6hv9S/7ZqezYFDVWZyv7KP2WpSU8U2kfjGaYzithjme
	 f4i9Ci6UEnLr2Td6PN34Moe26H9Cnt3tPspMEkbw6+39BCMfTzL2p/jaiE+PRMqTPvn2y
	 IcWwNXMQuAiwrrWzzhzuVvjSvMwT3LV2wlg2FXje2Dx3KUtQje5ZB33xkMOwo6ZMGRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEZ4ROVX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241D9606A321;
	Thu, 12 Nov 2026 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kEZ4ROVX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E45191F00A05;
	Thu, 12 Nov 2026 10:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794481127;
	bh=S2gkOP1/qIQAJzXNhe4mvVsSzVEh1jzUFKXLm1UVCzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kEZ4ROVX7l8FW/LLDv8IWEOHQSGOsaEQ3+Ixl0PxTsM+uDXoAwPCYIT8MdZwpKrJB
	 J8TUeXELk8Uf/w7i9CEkjISRv21WOSmK9ve6Bs2LY79ZhCYYt5mbfxVHzsrsBHeEJy
	 BzhUzCVIYVeQ8+aio1RytBMBfnx0zgKks82u8oNaMBgped2IjRkrb5bRD6tC8J8T41
	 esPnVa8CwzGHVdeTEwNcascCzoC/K3wBqR5Mp5u91WQ7wvIicXVcQCAOstuR5mO64Q
	 YBa+rdg3Nj3r2hNBD+B3xPbURZBRhcftVaefuoyjuzyu/NZD6HHS7ouFXdUIbqsFPb
	 rnr1AX0UeigCQ==
Date: Thu, 12 Nov 2026 11:58:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S7
 FE LTE
Message-ID: <20261112-versed-original-centipede-aad240@quoll>
References: <20261111-master-v2-0-5eb864e9f38d@gmail.com>
 <20261111-master-v2-1-5eb864e9f38d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111-master-v2-1-5eb864e9f38d@gmail.com>

On Wed, Nov 11, 2026 at 05:54:50PM +0530, Vishal Balasubramanian wrote:
> Document the compatible for the Samsung Galaxy Tab S7 FE LTE
> (SM-T735, codename gts7xllite), a tablet based on the Qualcomm
> SM7225 SoC.
> 
> Signed-off-by: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


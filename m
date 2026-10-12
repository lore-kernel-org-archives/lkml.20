Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92C4348C7C;
	Mon, 12 Oct 2026 09:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798543; cv=none; b=jZucJrMLaMvcPsmnlc87sRLxMTFEoRk5XERPfE0FllztdwE5tDAQXlZVPBi+TKS6Cspkry0myFba+m8K2AFuZ96ssXMI9Ua1OnDLWbKu9FL7WHES+wQIqF+a1+VGzLaaERVzc+0Uv18cOBkXryPqSNTPpsSvAShIz3+eHjAq0gI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798543; c=relaxed/simple;
	bh=c3Vkd6GCjdOZy6cEmc53ID+ZjmAydosCFSIWGD0k3zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deqKaKAJd4OvJMFGHzkHqww9TblwlIXZ6HJjN/FXMTX00RLoQRxlYvUiXf2v6aQTO1mWuKh5rja3/hnWOYqj0kVCNw2D1RDHPAibbJebUb+xTpZSXDEgwi+ShPVXgx5ycaD2BJNNBAusTkycXo4hXf2T7nYUqR2MK4Z1V8C8nz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ebSJjVr/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ebSJjVr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED8C1F0089B;
	Mon, 12 Oct 2026 09:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798541;
	bh=qUZoz3Vyo+5MjmvRhPwpPLfyp9i8i48N0/Fi8znCRn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ebSJjVr/BO0vGnRBgoG1jCepzZ3euoILCX8iLucbo81jQYcjnlMDHLWJrnNbv5x5s
	 F644F/JmJOglFYrDLWX9Ajof3i6SpA1yxCtaEeecT75Yf9Rm+whTE/I2EIpqLy37TF
	 k3oQ0Tuxl43VhMUUulRed9FBULoPjGFso1Y6vyJsG80WHMlh64z1ZxrREPxr4+LnXg
	 KPoduJK6bza+f4VAzWy/PyR3Rb1a2SmgKH7Ewg6uMqjp6M9SP5/LnO6pVeQHFzwWlD
	 2EWN2C6Z30gbAYl6U88JDkcTrTtuEGcFBbKYJrCv+US+PmN5L0sHJM7jyENN+zRUOk
	 tTX8eT7VJGiZw==
Date: Mon, 12 Oct 2026 11:48:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Oleksii Onchul <oleksiionchul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Nothing Phone (4a) Pro
Message-ID: <20261012-garrulous-smoky-tody-c1b3d5@quoll>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
 <20261011095221.24767-2-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261011095221.24767-2-oleksiionchul@gmail.com>

On Sun, Oct 11, 2026 at 11:52:20AM +0200, Oleksii Onchul wrote:
> Document the Nothing Phone (4a) Pro (FroggerPro), based on the
> Qualcomm Eliza platform.
> 
> Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


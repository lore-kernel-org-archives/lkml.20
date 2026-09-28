Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4066837DEA8;
	Mon, 28 Sep 2026 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577093; cv=none; b=TiM4peAR9XtrNjNT4YGO2zzuaMY9msZskEzYU6NCjEwTX8CJOjEYDMdebVGWdy1Xra5N01Pmpnt/vePlq5YXx2nQpiTNcZq9pgy43GprcLlKGmShWzF1Te939JDwKho58yZ/UDhB3H2T4EXBtyR0nzK/DZ7fME9fYVXBmqDGvxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577093; c=relaxed/simple;
	bh=eMuDvW+NBTXeL78n09F+UAoO8LRYA+eyqEsukEvtpMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQnElJhLH+0Vwgd+d8mntxrOVq1QWMsTPmTsMw4u8+zZuWm9XPo6Zj480eTKhvu1WAurF4VCjV0Q6xg5hq7RWjnrO9ASJa4HnuZWnED+pDn+efIutBZFE053m2Uxor/mluKZLlKIi99YDHof6eGqCVQdzfavcQ7AbsDE2nbf8us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jVhHomUK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jVhHomUK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFFA1F000FF;
	Mon, 28 Sep 2026 06:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790577091;
	bh=yC564v6T+1ylPjBK8wy5FnaiuP6oylmuWTbwzI+MHy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jVhHomUKNN+Hn7QgJXt9jyJVQFd+0Q55Z1nei6tb6QUdy74Zr+LomHqwVvStxnS+0
	 1Kms7t5MFYHhdRMKbSAIz5LoHtu3UcjmulnIH0IGSmd56ZlKIVF8Q5ICEBY0haxonK
	 Brxag9sHNaTxezrU/lU8WVzYZ6BzuzLeGv+fPK1R1oJ78Rtb+E2/E7sosXYTt+IqQH
	 8iPtMU4iFtqeJ+BK4OuPka/Jw2Ae6Qns4gpyesg1R3ruLEmoyR0heMdvbHgZGACBKI
	 x5Z0H7qXOnTGJEiQLDJkVaPsZ1xgamJ6G5ldadY1bmFUEyj/vLEwySDoYzm1Lp6g5/
	 C+aR9lG2gGm6w==
Date: Mon, 28 Sep 2026 08:31:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,coresight-ctcu: add Nord
Message-ID: <20260928-lucky-loon-of-acceptance-789cba@quoll>
References: <20260922100850.527109-1-shengchao.guo@oss.qualcomm.com>
 <20260922100850.527109-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922100850.527109-2-shengchao.guo@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 06:08:49PM +0800, Shawn Guo wrote:
> From: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> The CTCU device for nord shares the same configurations as SA8775p. Add
> a fallback to enable the CTCU for nord to utilize the compatible of the
> SA8775p.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


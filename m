Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F488440620;
	Tue, 15 Sep 2026 07:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456255; cv=none; b=JHdirRbLGSit7xbZsgUwWv5Jl2Ih7IwSUcyp+27Bd32hs7NCT5Zr43DtnTsj7nZuPXacIkuRSAqGenSyfrHrI2mjg9bqsnjBgz7fe9Wj2AWLAcqZfcOOdAgn5oU+9ZmJmN9xD7ouM8EVrv5QQQ/xkUVjEitPnMoYZq9SI+N1WGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456255; c=relaxed/simple;
	bh=X766vbc0BdFfZ9+iXImOA/Apr0cO5sxhQjabYZjB6rg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VE+BBt1zbcHq7Yp6ooRX3WqX3Nml6tVTxC6q6UT3kdMd/iO7QkQY2iQbMfVdrzgyfQdevqK6TTNfaP48cgEb7a4PHqyCXbtfE35HuB18ddEE/f6hntJV7zeP7+J1QINCOhO7PVZWmcumVHSGMtTkv0z8BdErR7zxnmxy/YomcDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I7P9d9F2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I7P9d9F2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2171F000FF;
	Tue, 15 Sep 2026 07:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789456254;
	bh=9Cs/Bceei+kA3qhLuDydIsUBP8oU42eAtr6Drfrvge0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I7P9d9F27zaxXXcGtS1f5znyFr2AZ2oMROLD36XMcupxLg83qE8QqOxAFVmRJeDTS
	 Le+eJriOLTmBIumerApj32tY/O9X1YIc+BykEPHRw2OU6biCTcJT93jtHdFkFh0ZUy
	 CxOFwlJFf4DHkApahfNqN/Lwk4GIr/wczuDB1UPGfhk9xo14+atHJGfAHZy/wYC5ur
	 luB+uTlzgd2IPxozQNcjZ8Mzq7YPH+AdGK4rkXtGaRzPXX7FoSxlFHX7r0XLysYWnr
	 5jG7M5QJ0Nd9Kq9rhBhH8FfLslowIe3lcXpJb7iLoKNrNnutBhahpuNNqlznu4gTPs
	 rtl00Vh05Ynrg==
Date: Tue, 15 Sep 2026 09:10:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: media: qcom,sm8550-iris: Document Eliza
 IRIS accelerator
Message-ID: <20260915-chubby-wakeful-oxpecker-5aed5d@quoll>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
 <20260914-add_iris_for_eliza-v1-1-e8ccd9b8cf7a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260914-add_iris_for_eliza-v1-1-e8ccd9b8cf7a@oss.qualcomm.com>

On Mon, Sep 14, 2026 at 05:54:23PM +0800, Wangao Wang wrote:
> Add the qcom,eliza-iris compatible for the IRIS video decoder/encoder
> accelerator found on the Eliza platform.
> 
> Eliza belongs to the same IRIS v3 family as SM8550 and SM8650, and uses
> VPU3.3 with an SM8650-compatible clock and reset configuration. Like
> SM8650, it requires the bus, xo, and core resets, so include it in the
> existing allOf constraint that enforces resets minItems: 3.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


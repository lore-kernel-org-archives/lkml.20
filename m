Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190740;
	b=PIh6bsIqRqcZGnCkGA2zEO/ZSQYe/XAwMM6ufih0eyUL6Rt+etR1oNqYysHJQTYEsPim
	 5IeJZPESKT+xlb5Ibt7BNT6SGNmDxIlOoCHdStFrk1h1C90Wj+nG98IUm0hzlezfJVGhr
	 n64RxJ0Hp6eBVjMKqyTHDeCGeMflmfkDPPwPLtB2qJmnTekyPJjBAq/rZbpApslSJgvYv
	 U/TBJCb7B/1OyPcQIePYo952eYygqExU80b1gtGXGdGwgqRSopJ2NrtDVryRk0Z1uxBxz
	 p9W8Ww/E8SG/A5RzWOwCouPavDmIsNVukyy9ITbPjuBPw93IvdAZxL3GZQyz4vPRVKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190740;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=v9I8aBwYQiXna0K4b9R5EzdMw2Iyv8e6dSEyABp9uOI=;
	b=LEaqsBqknH2sYB24hjqoubCnRD0b2tWOeOtX93G8Kx+ZtmTG7v+BLilkJQb8H9LBOJWZ
	 aUpX9Pp8h+li93DkvP3DyYhbGJNlVMaEahUSCdj7eAqzygB87SDYakGIWjK49kkOSr7Ak
	 FOrCgblNIEMzqioDTwzy4RXkSEKLfrcSQB8XzbLVi2lyp/IwbXq9DFNe3eoV1bJqwZE2r
	 W2RR1PcrFf89OIck50BW/1t1oBF5ipQatu5uuwmd6gEP/DVXkCnTnc7gMq3WkQaivQPz2
	 H/biYpeL8iyDh1Y3MbsapD27qhCWoHklZuTwlSWGS2VqA6CIzi79KttAHq1saA54sfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqH5FBNU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1AE606A31A;
	Wed, 28 Oct 2026 12:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bqH5FBNU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3821F01828;
	Wed, 28 Oct 2026 12:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190740;
	bh=v9I8aBwYQiXna0K4b9R5EzdMw2Iyv8e6dSEyABp9uOI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bqH5FBNUwWBoVI2G2c+7UPWAdL6oXWKWhvaa4sWh2CFSm7sZKUiyjNb9H665iWUU4
	 ePEe5BBHybJYpWfOQF+bfkzuNp1/x2onspl99RhN64L6cAmIiW4gi0eTZ/j2blG/w0
	 U5C7m6RIDXm/uw981ZGOMqRe9m/dMPaMgO5oc7bhQ3Ty8uW9MHa+jlSpqcSRQ1W3X3
	 /27YzeNK1kPKZOUzJXICGQMCVJDnhMjXvMm5r7NhawV1EUAis0LfUbZWHfGw/o5BKu
	 /7DCY019NQzFWsdYP0pJGcGATj0jiQJtq+GeKlI3XMXwfoTetzMMW1JqVMbMqNHX6/
	 qo1zPIo8jk2+A==
Message-ID: <0f436944-fa9a-49f9-ac1d-8779a36ab13d@kernel.org>
Date: Wed, 28 Oct 2026 12:32:15 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] media: camss: video: check that a buffer is DMA
 contiguous and add a prepare hook
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
 <aNP6BDdaIMVxdesvKY18R93EboeI2PlecN-rVQlfwEmM5q0sXv8D1LEtDOxZZ356tjWL-gFqH5nxl-CKK1uAMg==@protonmail.internalid>
 <20261028093003.722745-7-xiaqinghuan@mail.ustc.edu.cn>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20261028093003.722745-7-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/10/2026 09:30, Qianhui Xu wrote:
> The write master of the newer VFE generations can only be programmed with
> a buffer whose payload is physically contiguous, because the frame
> increment registers describe one linear address range.  Check that the DMA
> mapping of every plane is contiguous for at least sizeimage bytes and
> reject the buffer otherwise, instead of silently writing past the end of
> the first scatterlist entry.
> 
> Also let the SoC code add its own alignment requirements to a queued
> buffer through a new prepare_buffer() video operation, which runs after
> the generic checks.
> 
> Signed-off-by: Qianhui Xu<xiaqinghuan@mail.ustc.edu.cn>
> ---
>   .../media/platform/qcom/camss/camss-video.c    | 18 +++++++++++++++++-
>   .../media/platform/qcom/camss/camss-video.h    |  1 +
>   2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
> index 0852eb6f1..027cf024f 100644
> --- a/drivers/media/platform/qcom/camss/camss-video.c
> +++ b/drivers/media/platform/qcom/camss/camss-video.c
> @@ -155,7 +155,10 @@ static int video_buf_init(struct vb2_buffer *vb)
>   	const struct v4l2_pix_format_mplane *format =
>   						&video->active_fmt.fmt.pix_mp;
>   	struct sg_table *sgt;
> -	unsigned int i;
> +	struct scatterlist *sg;
> +	dma_addr_t end;
> +	unsigned int i, j;
> +	size_t contiguous;
> 
>   	for (i = 0; i < format->num_planes; i++) {
>   		sgt = vb2_dma_sg_plane_desc(vb, i);
> @@ -163,6 +166,16 @@ static int video_buf_init(struct vb2_buffer *vb)
>   			return -EFAULT;
> 
>   		buffer->addr[i] = sg_dma_address(sgt->sgl);
> +		end = buffer->addr[i];
> +		contiguous = 0;
> +		for_each_sgtable_dma_sg(sgt, sg, j) {
> +			if (sg_dma_address(sg) != end)
> +				break;
> +			contiguous += sg_dma_len(sg);
> +			end += sg_dma_len(sg);
> +		}
> +		if (contiguous < format->plane_fmt[i].sizeimage)
> +			return -EINVAL;
>   	}

Is it really the case we can only do physically contiguous on sm8750 ?

Hrmm, first I've heard of this, it would be a gigantic step backwards too.

Can you cite some sources to prove this out ?

---
bod

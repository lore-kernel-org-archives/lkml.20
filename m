Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360F4718CA;
	Mon, 28 Sep 2026 08:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585366; cv=none; b=uWufQQuIKqEu/CRGFSr6CtStXI8SGq5Ouh+4//0TtzxxxPw2Kll8X93IRz0RzoI7+Q2xLtV0oGzapiySYnvk4QNOUEI04jL5HkYu8agevWobBvdPTykLjS2hQgdAi3SYo8LDGKLGz9jrmYuhVNiK/7sBkLUEQHxQgD78o4p47Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585366; c=relaxed/simple;
	bh=OfCLiohuhbyWMPoHKaQlg2T1gfW+pDj5nssHyA2+2pg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Irt04mTxW0krQcQRh8H94YhQ757ygCXY82zj81YaFbcFWDicAf0xuL9K0d1d5MpDxVppxFG5cnbxs4On/lfW7OH31aq+7vNKgPE8+9hZtNiQQOQHEodoXKSCPdOPjS3ApdQp4/N2WAre87tSc1ZSR+toymySfb42JeKBFgn/pqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnudo0Q1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnudo0Q1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59811F000FF;
	Mon, 28 Sep 2026 08:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790585364;
	bh=L8DvlVON08rYuMFKT7B6LMBAAtrayUN7D5me5i20LPQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=gnudo0Q1D/3j8j4/Jrc6CKrcxqLAdyJiiFu5/e6bOj2FkNNZDoGBNSGHjG0EfOABq
	 CkhyvzEyDnCApeXo0eUD0QxlsHvZiTAjduHo/naqNQ7cD4mU7xAwXZWXXp500xWqRX
	 rDnznmfUEbtOe4NonHkv6E+tdDF9F6yjxqoJ8pygiw6vjBK3+TbLBNXCd3XuFvrTYG
	 /T7FdCLartfdsBNeG7AKGCCzOgYQtVOW69bfr+1+d7AX7v+qTcRExZArDZCtR72cpR
	 oxXDOlg/rbquAPQSIOeNZfwdu8QjJXY5SHf9WV/6lfN8KdD8oE3px1djZcesui1Jgf
	 KXlKfGqMdiQew==
Message-ID: <cd778fa5-6382-4378-af18-1e19cf0d6c9b@kernel.org>
Date: Mon, 28 Sep 2026 09:49:20 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] media: qcom: camss: vfe: Fix VFE reset while
 another line is streaming
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ravi@ebytelogic.com
References: <20260928064336.272659-1-hitesh@ebytelogic.com>
 <AUWm6RUt4wq08tOrslf5-YmXeE35IBXGTF7WiyDDUpoCGUj31vjn73KkU_G12myMNA_akchIV_gtQmW3RN8QKw==@protonmail.internalid>
 <20260928064336.272659-4-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <20260928064336.272659-4-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/09/2026 07:43, Hitesh Patel wrote:
> @@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
>   	struct vfe_output *output = &line->output;
>   	unsigned long flags;
>   	unsigned int i;
> +	bool last;
> 
>   	spin_lock_irqsave(&vfe->output_lock, flags);
>   	for (i = 0; i < output->wm_num; i++)
> @@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
>   	output->gen2.active_num = 0;
>   	spin_unlock_irqrestore(&vfe->output_lock, flags);
> 
> +	mutex_lock(&vfe->stream_lock);
> +	last = vfe->stream_count == 1;
> +	mutex_unlock(&vfe->stream_lock);
> +
> +	if (!last)
> +		return 0;
> +

NAK.

This can't be correct, in fact its very racy and will break. Here is the 
existing code.

static int vfe_disable_output(struct vfe_line *line)
{
         struct vfe_device *vfe = to_vfe(line);
         struct vfe_output *output = &line->output;
         unsigned long flags;
         unsigned int i;

         spin_lock_irqsave(&vfe->output_lock, flags);
         for (i = 0; i < output->wm_num; i++)
                 vfe->res->hw_ops->vfe_wm_stop(vfe, output->wm_idx[i]);
         output->gen2.active_num = 0;
         spin_unlock_irqrestore(&vfe->output_lock, flags);

         return vfe_reset(vfe);
}

/*
  * vfe_disable - Disable streaming on VFE line
  * @line: VFE line
  *
  * Return 0 on success or a negative error code otherwise
  */
int vfe_disable(struct vfe_line *line)
{
         struct vfe_device *vfe = to_vfe(line);
         int ret;

         ret = vfe_disable_output(line);
         if (ret)
                 goto error;

         vfe_put_output(line);

         mutex_lock(&vfe->stream_lock);

         vfe->stream_count--;

         mutex_unlock(&vfe->stream_lock);

error:
         return ret;
}

Here's how

stream_count = 2;

thread0:
   vfe_disable()
	vfe_disable_output()
	mutex_lock();
	last = stream_count == 1; //false
	mutex_unlock();
	return;

thread1:
   vfe_disable()
	vfe_disable_output()
	mutex_lock();
	last = stream_count == 1; //false
	mutex_unlock();
	return;

thread0:
   vfe_disable()
	mutex_lock();
	stream_count--; // => stream_count = 1;
	mutex_unlock();

thread1:
   vfe_disable()
	mutex_lock();
	stream_count--; // => stream_count = 0;
	mutex_unlock();

vfe_reset() is never called.

this->

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c 
b/drivers/media/platform/qcom/camss/camss-vfe.c
index 34e4319d8f80c..3dafd5d778630 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -828,7 +828,7 @@ static int vfe_disable_output(struct vfe_line *line)
         output->gen2.active_num = 0;
         spin_unlock_irqrestore(&vfe->output_lock, flags);

-       return vfe_reset(vfe);
+       return 0;
  }

  /*
@@ -850,7 +850,8 @@ int vfe_disable(struct vfe_line *line)

         mutex_lock(&vfe->stream_lock);

-       vfe->stream_count--;
+       if (--vfe->stream_count == 0)
+               ret = vfe_reset(vfe);

         mutex_unlock(&vfe->stream_lock);

---
bod

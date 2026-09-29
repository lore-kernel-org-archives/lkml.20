Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD20D3D79EF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706290; cv=none; b=V32tj/0e95NsO+TECM3S0iRD+6dWJNArgPsH4WWtPWyeytQeAJixxQhzjcP94Y0+9lANPFqNTakyIlZsYqaJfTSYdc9ljpGK8/WYkNe8W+IWhF83lFX8Bhg7ApO3m9ZZu+LjEoPYL1EESpKno8ls2SyhHQ5tr2/sYdKn/SNT3TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706290; c=relaxed/simple;
	bh=5ZpoQ6vW9ZwnwxeQfbaTmz3p0YbxfvEbLvi9mAagRCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LpBLl1drsesosLmngJ0w6Lgc++lmBGTcUGocKQHU3eHp2Cey14UHTIexmq+DJn0f/PJwkLRPTbhEHQruxFWnKP+VXsTmFS0DzWW2VHv3KRacfr4YM9uh+3Ln02gUHqIchOncwFuR5fglHZukUodQj6bEbBQhVF49cb90dUpnqGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx10XmVa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx10XmVa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9B81F000FF;
	Tue, 29 Sep 2026 18:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790706289;
	bh=IrC4cWja7TCbiw78bWvPQDNptyMl3nO7KwA5wFFZroM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Kx10XmVaId7/ri+3fc2IQCfjoT77F2zkVT1y3XpBpPg1MeDypM6MiusbI3Z3/3fBF
	 J0NIei3R+KW0yrrUGtvdIbJKuJ7jPvOnDYilQTMoMI6rPFMLkr3c8li8a5v8dVQc5w
	 n/M5AvU8AX2zh17e8hDhJ56IklMa34rdhPZNhgcKhLyjTY9oE6hd+EKP1blcO/1dYY
	 PoVqwOAem5fmGafiqQp/3gviF+hMWyFhwpSP5POVg2UfWsmRWxo6u4HX3JIw5wRw2i
	 lqMtOY+rTMEPAchZT0vJlzGCCP/u3fqtGClOpvH4u3k7MACz6iFTQOQgB2UbFiVPoy
	 kP2Vfq6YFOumQ==
Message-ID: <aee76270-590d-4d2b-93ca-23e56bc3f482@kernel.org>
Date: Tue, 29 Sep 2026 13:24:47 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] accel/amdxdna: Add support for AIE2 revision 9
Content-Language: en-US
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 karol.wachowski@linux.intel.com, max.zhen@amd.com
Cc: linux-kernel@vger.kernel.org, sonal.santan@amd.com
References: <20260929181459.928468-1-lizhi.hou@amd.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260929181459.928468-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/26 13:14, Lizhi Hou wrote:
> aie2_get_dev_revision() fails to recognize AIE2 revision 9 hardware.
> Add AIE2_DEV_REVISION_GRGH to the list of supported AIE2 revisions.
> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>> ---
> V2:
>    Fix sashiko comment: add the revision string.
> 
>   drivers/accel/amdxdna/aie2_msg_priv.h | 1 +
>   drivers/accel/amdxdna/npu4_regs.c     | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index fd65a4236d49..8ed2b5701dcc 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -530,6 +530,7 @@ enum aie2_dev_revision {
>   	AIE2_DEV_REVISION_GPT1,
>   	AIE2_DEV_REVISION_GPT2,
>   	AIE2_DEV_REVISION_GPT3,
> +	AIE2_DEV_REVISION_GRGH,
>   	AIE2_DEV_REVISION_UNKN,
>   };
>   
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 15a161384625..c9648c8032ec 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -153,6 +153,7 @@ const struct amdxdna_rev_vbnv npu4_rev_vbnv_tbl[] = {
>   	{ AIE2_DEV_REVISION_GPT1, "NPU Gorgon Point 1" },
>   	{ AIE2_DEV_REVISION_GPT2, "NPU Gorgon Point 2" },
>   	{ AIE2_DEV_REVISION_GPT3, "NPU Gorgon Point 3" },
> +	{ AIE2_DEV_REVISION_GRGH, "NPU Gorgon Halo" },
>   	{ 0 }
>   };
>   


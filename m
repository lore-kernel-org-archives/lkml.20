Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DC73A1E8C;
	Wed, 23 Sep 2026 08:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152548; cv=none; b=GOoPXhFShVB+umiIyz4pULshx2hXwr9Jjiui3DLmyBwjkJ3bOnPA1JReN9KvWHc/il4LghvWe/z0BjQh3B+4ld48kqMz11FBbRLx6n+npzgaAlb2wDA0PzDwdYHYfTYXAN2wuEF7ujdFMxdM0Zx7QsEQyms8cqvJoWGAHj/9v5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152548; c=relaxed/simple;
	bh=Kr/Xd9LH8Gk6I5VgZgmbq6oEqKwBzvwrjbCo2r0lK3c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UKeONcx87YW+4h9ogVpwkxNU46/qtjrYXWl8NqhsnqQIyew+/+WygV66dO0PteM5YZRkwJ9yb2j9YfZ10L4BRk/d5Zp4BmK9NgcQ5zD/TdZTYPM3aASKFSjLKk7p+ROkSnBRxtEPl7eouxxFtHzaomfMvvSzSeC+o2c8Txoci3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdoPLl0T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdoPLl0T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFB3E1F000FF;
	Wed, 23 Sep 2026 08:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790152535;
	bh=xcHmeC4HtsHnBaEvav6MT+VojyrSYCAIvDipmUfuBXE=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=hdoPLl0TqYLXQqCvf5YBTiDSDJIKXQdaVG4e4sLHTX71A2ba6BQnmYaNi+EpLma2j
	 /3AzJw2IhmaXW5iOryUiGXHVoUIqfss11tG0e5KVEYi3K65SBjUv9Yml2EcWDXPgJr
	 JOXbecpveSagsBvHtHKVE3kTqcvQbgXGfjkTdpdzY723aJsPouMaOzphc/6muaRyd6
	 EticdiAgJF5GkSdhOQUmCqiIpzDWKozTM9y8ZuLB2x4uPvovDtogoMEw1MUz+TMrJZ
	 /5rCfZCS3NWYPMMDJV93nnq9QGFcaSoWHg8s6UQraWHViyBjhV8dlo5KkFKI/G/pJT
	 zKKGxFt9gbZxQ==
Message-ID: <55649a1b-a3f1-4e4f-a07d-416fbc0edfe0@kernel.org>
Date: Wed, 23 Sep 2026 10:35:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: vivid: check for NULL dev in vivid_probe() control
 setup
To: Rohinthan <rokinthanp03@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com
References: <20260922125434.19361-1-rokinthanp03@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260922125434.19361-1-rokinthanp03@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/09/2026 14:54, Rohinthan wrote:
> In vivid_probe(), after creating instances, the driver iterates
> through vivid_devs[0..n_devs-1] to populate HDMI and S-Video
> 'Connected To' controls. However, it dereferences dev->has_vid_out
> without verifying that dev is non-NULL.
> 
> If an instance fails during creation (or if devices race during
> probe/remove), vivid_devs[i] remains NULL, causing a general
> protection fault:
> 
>     Oops: general protection fault
>     KASAN: probably user-memory-access in range
>     [0x0000000000005f38-0x0000000000005f3f]
>     RIP: 0010:vivid_probe+0x579/0x10d0
> 
> Add NULL pointer checks in both loops in vivid_probe() before accessing
> vivid_devs[i]. Also set .suppress_bind_attrs = true on
> vivid_pdrv.driver to prevent concurrent sysfs bind/unbind operations
> from triggering races.
> 
> Fixes: d7c969f37515 ("media: vivid: Add 'Is Connected To' menu controls")
> Reported-by: syzbot+caaca441bae2799984d3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=caaca441bae2799984d3
> Signed-off-by: Rohinthan <rokinthanp03@gmail.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-core.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
> index 62cfb5f..31a90ec 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.c
> +++ b/drivers/media/test-drivers/vivid/vivid-core.c
> @@ -2116,17 +2116,19 @@ static int vivid_probe(struct platform_device *pdev)
>  	for (int i = 0; i < n_devs; i++) {
>  		struct vivid_dev *dev = vivid_devs[i];
>  
> +		if (!dev)
> +			continue;

This can never happen, vivid_devsis always not-NULL for indices up to n_devs - 1.

If there is a crash, then it is caused by something else.

>  		if (!dev->has_vid_out)
>  			continue;
>  		for (int j = 0; j < dev->num_outputs && hdmi_count < MAX_MENU_ITEMS; ++j) {
>  			if (dev->output_type[j] == HDMI) {
> -				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = vivid_devs[i];
> +				vivid_ctrl_hdmi_to_output_instance[hdmi_count] = dev;
>  				vivid_ctrl_hdmi_to_output_index[hdmi_count++] = j;
>  			}
>  		}
>  		for (int j = 0; j < dev->num_outputs && svid_count < MAX_MENU_ITEMS; ++j) {
>  			if (dev->output_type[j] == SVID) {
> -				vivid_ctrl_svid_to_output_instance[svid_count] = vivid_devs[i];
> +				vivid_ctrl_svid_to_output_instance[svid_count] = dev;
>  				vivid_ctrl_svid_to_output_index[svid_count++] = j;
>  			}
>  		}
> @@ -2134,13 +2136,17 @@ static int vivid_probe(struct platform_device *pdev)
>  	hdmi_count = min(hdmi_count, MAX_MENU_ITEMS);
>  	svid_count = min(svid_count, MAX_MENU_ITEMS);
>  	for (int i = 0; i < n_devs; i++) {
> -		for (int j = 0; j < vivid_devs[i]->num_hdmi_inputs; j++) {
> -			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_hdmi_to_output[j];
> +		struct vivid_dev *dev = vivid_devs[i];
> +
> +		if (!dev)
> +			continue;
> +		for (int j = 0; j < dev->num_hdmi_inputs; j++) {
> +			struct v4l2_ctrl *c = dev->ctrl_hdmi_to_output[j];
>  
>  			v4l2_ctrl_modify_range(c, c->minimum, hdmi_count - 1, 0, c->default_value);
>  		}
> -		for (int j = 0; j < vivid_devs[i]->num_svid_inputs; j++) {
> -			struct v4l2_ctrl *c = vivid_devs[i]->ctrl_svid_to_output[j];
> +		for (int j = 0; j < dev->num_svid_inputs; j++) {
> +			struct v4l2_ctrl *c = dev->ctrl_svid_to_output[j];
>  
>  			v4l2_ctrl_modify_range(c, c->minimum, svid_count - 1, 0, c->default_value);
>  		}
> @@ -2240,6 +2246,7 @@ static struct platform_driver vivid_pdrv = {
>  	.remove		= vivid_remove,
>  	.driver		= {
>  		.name	= "vivid",
> +		.suppress_bind_attrs = true,

Nack. We WANT vivid to be unbound. It is part of the regression tests.

>  	},
>  };
>  

Rejecting this patch.

Regards,

	Hans

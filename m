Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC64D3B2FD1;
	Wed,  9 Sep 2026 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944704; cv=none; b=YppDmZGie3sPTc6Ri/WB6bboX5hhjeHAjGLZnjn/Iy0QwoOUitygvbhBJoeBMFag3ol5KTrO6wD0WIqD1YqycvHth8ev6h51jKs2NLFz7XrVMi8n9vlwhoNIwNr/9GZkcma0QkUC8rtuscvRb7/jUsKVFyQcMT0rOkB2CjbqLJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944704; c=relaxed/simple;
	bh=hfwaaXSTdHWn5dGY4xL49qODKtITstkykViVU/ATm2I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KYOhJPuw8kQznM/AWUwKdgutqclUr+qHldfO8QnoHe1taiUG5LmcevW4wGfVp9IvRFZXIwonctSOBAe8MxVcAeNyVIQnL5lb8bxEhQ9AnV0QtpdKuGfEqalC62CDLxg20EwskQ2iQ6OmqxGwKh4Xyo40Nfby/yEiNGMTbyELQtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAPOBb1m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAPOBb1m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7691F00A3A;
	Wed,  9 Sep 2026 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788944703;
	bh=SjM5wCr2+gDn5G0QlL9Q6F4IvozPWkX6FtcI4rtZZaA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=TAPOBb1m0kucPoM8KgDsdb7EKb8HWrQRHRCEMhz8W8fIzIUstGKnCjTeZwen6bE4c
	 dDV6T6xJe7fL5pc7Pzgs4QOK+raOA99PDzhq0cUim/zMzNbJxvRFSC8aO4xqY1qLX9
	 S2uhchRg75BOUa2R2JkJ19vyIHA5J7IzCN8/qvB0wnKakwbKYjDtsTW0/VMbFGKKeT
	 8/Vei+/e6PPQhEhizyxz/xVw2FxtKO5Y8xKsv/gXgzbivp5CgLgs5Keki7mDFALO6N
	 3QfGccd1HSEL4UYuUHPJk+jMLkLLPUdb/xbiZK5b6JELOzopyMkCWM5CmnBlDhqtiU
	 2nEqY7jwbLUmg==
Message-ID: <a589c1f2-e823-485f-9768-a6e471ffeaca@kernel.org>
Date: Wed, 9 Sep 2026 11:05:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] media: cec: extron: validate response prefixes
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, Hans Verkuil <hverkuil@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260830130356.159-1-pengpeng@iscas.ac.cn>
Content-Language: en-US, nl
In-Reply-To: <20260830130356.159-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Pengpeng Hou,

On 30/08/2026 15:03, Pengpeng Hou wrote:
> extron_interrupt() dispatches completed serial lines by comparing fixed
> prefixes and reading fixed offsets without first checking the current line
> length. Short lines can therefore consume stale bytes beyond the
> NUL-terminated message item.
> 
> Require each response type to contain the complete dispatch prefix before
> reading its fixed fields.
> 
> Fixes: 056f2821b631 ("media: cec: extron-da-hd-4k-plus: add the Extron DA HD 4K Plus CEC driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  .../usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c    | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> index 3c6ce6f3d93e7..66780b3cf9188 100644
> --- a/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> +++ b/drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c
> @@ -851,13 +851,13 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
>  		if (debug)
>  			dev_info(extron->dev, "received %s\n", extron->data);
>  		extron->idx = 0;
> -		if (!memcmp(extron->data, "Sig", 3) &&
> +		if (extron->len >= 5 && !memcmp(extron->data, "Sig", 3) &&

All these extra checks makes the code fragile (i.e. easy to make mistakes), esp. if new
prefix checks are added in the future.

How about just replace:

                extron->data[extron->len] = 0;

with:

                /*
                 * Prevent the following prefix tests from using stale data
                 * from beyond extron->len
                 */
                memset(extron->data + extron->len, 0,
                       min(10, sizeof(extron->data) - extron->len));

This ensures that bytes extron->len to extron->len + 9 are all set to 0 and you won't hit
stale data.

Regards,

	Hans

>  		    extron->data[4] == '*') {
>  			extron_process_signal_change(extron, extron->data + 3);
> -		} else if (!memcmp(extron->data, "Hdcp", 4) &&
> +		} else if (extron->len >= 6 && !memcmp(extron->data, "Hdcp", 4) &&
>  			   extron->data[5] == '*') {
>  			extron_process_edid_change(extron, extron->data + 4);
> -		} else if (!memcmp(extron->data, "DcecI", 5) &&
> +		} else if (extron->len >= 6 && !memcmp(extron->data, "DcecI", 5) &&
>  			   extron->data[5] >= '1' &&
>  			   extron->data[5] < '1' + extron->num_in_ports) {
>  			unsigned int p = extron->data[5] - '1';
> @@ -865,7 +865,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
>  			p += extron->num_out_ports;
>  			extron_process_tx_done(extron->ports[p],
>  					       extron->data[extron->len - 1]);
> -		} else if (!memcmp(extron->data, "Ceci", 4) &&
> +		} else if (extron->len >= 6 && !memcmp(extron->data, "Ceci", 4) &&
>  			   extron->data[4] >= '1' &&
>  			   extron->data[4] < '1' + extron->num_in_ports &&
>  			   extron->data[5] == '*') {
> @@ -874,14 +874,14 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
>  			p += extron->num_out_ports;
>  			extron_process_received(extron->ports[p],
>  						extron->data + 6);
> -		} else if (!memcmp(extron->data, "DcecO", 5) &&
> +		} else if (extron->len >= 6 && !memcmp(extron->data, "DcecO", 5) &&
>  			   extron->data[5] >= '1' &&
>  			   extron->data[5] < '1' + extron->num_out_ports) {
>  			unsigned int p = extron->data[5] - '1';
>  
>  			extron_process_tx_done(extron->ports[p],
>  					       extron->data[extron->len - 1]);
> -		} else if (!memcmp(extron->data, "Ceco", 4) &&
> +		} else if (extron->len >= 6 && !memcmp(extron->data, "Ceco", 4) &&
>  			   extron->data[4] >= '1' &&
>  			   extron->data[4] < '1' + extron->num_out_ports &&
>  			   extron->data[5] == '*') {
> @@ -889,7 +889,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
>  
>  			extron_process_received(extron->ports[p],
>  						extron->data + 6);
> -		} else if (!memcmp(extron->data, "Pceco", 5) &&
> +		} else if (extron->len >= 7 && !memcmp(extron->data, "Pceco", 5) &&
>  			   extron->data[5] >= '1' &&
>  			   extron->data[5] < '1' + extron->num_out_ports) {
>  			unsigned int p = extron->data[5] - '1';
> @@ -899,7 +899,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
>  				   &tmp_pa[0], &tmp_pa[1]) == 2)
>  				extron_phys_addr_change(extron->ports[p],
>  							tmp_pa[0] << 8 | tmp_pa[1]);
> -		} else if (!memcmp(extron->data, "Pceci", 5) &&
> +		} else if (extron->len >= 7 && !memcmp(extron->data, "Pceci", 5) &&
>  			   extron->data[5] >= '1' &&
>  			   extron->data[5] < '1' + extron->num_in_ports) {
>  			unsigned int p = extron->data[5] - '1';
> @@ -910,7 +910,7 @@ static irqreturn_t extron_interrupt(struct serio *serio, unsigned char data,
>  				   &tmp_pa[0], &tmp_pa[1]) == 2)
>  				extron_phys_addr_change(extron->ports[p],
>  							tmp_pa[0] << 8 | tmp_pa[1]);
> -		} else if (!memcmp(extron->data, "EdidR", 5) &&
> +		} else if (extron->len >= 7 && !memcmp(extron->data, "EdidR", 5) &&
>  			   extron->data[5] >= '1' &&
>  			   extron->data[5] < '1' + extron->num_ports &&
>  			   extron->data[6] == '*') {
> 
> base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72


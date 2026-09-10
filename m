Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A182D4825B8;
	Thu, 10 Sep 2026 13:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789048302; cv=none; b=ByD/Z5d8vBLzuQ7ogLyt9QDJuAl6HjjPJ/P9O/lFI3skp6vPbwONdQzn/BqgbjJgE9fY/eOWxrzZ1ZMlole3sKr98zgLBfqriEJaDXYTxmAmsRfD8FjaRxdrpPo4grFE3oAegd3E/mJPAgF9vsDDa4tp3T1/QO4cPaABxn/8zIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789048302; c=relaxed/simple;
	bh=OIVCL+91sXAX5V9V2CkS3dfj0v4gl4M1LGsQNTcBiq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XkmA0DmMNRBBfTuc/6aVxWvcArsfFE/TP7cZZpg8NGE1PAsB29c2Rzf7evPwOo0ZNoLJKr0UQWtNt/0st8WgHrqdbwGFO4uLKpvO//KYsLMKOsmWs3VrfuMimqM6YTiDMrQ+XfavGX0M9M3wlQ+iqDHk5HKV3YEnns83v+5PabU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nCjDBMHK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nCjDBMHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3691F000FF;
	Thu, 10 Sep 2026 13:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789048299;
	bh=H2YH1JxGqaZT4ML3CJbP3dQevg9d7BkEz4Paw+1vhBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nCjDBMHKiALdb560kcb+fRnnlvXGXSXek54XXHo0twGn5D7mAAByVv2x9FXnyOzW8
	 TJMv6J5SmPOOZS+lhFKzKvv3Docll4spwEYnngK5kdh8EowlYIumYPC9CyD4FAzW9c
	 Z+G6GnqnVEoq7RS2LjOJaiQDvFAOWEQLRq8XSNNoLzAZZn+KP/lxPnfX5r/iStTFI/
	 0SPGC/kYFvzqamw70xG/10XyKAS8qvS6IlvvXzpcotva2G4hSI0RTJmLvqScObeHqJ
	 I78wL/bRhFD5L1a0xNmjy9LgporsDogkr8YPU3wP1nszujTyK/naGwB8wGKYsABbef
	 1Jfa6SeHfk/2A==
Date: Thu, 10 Sep 2026 08:51:36 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Message-ID: <aqK0D-dnQEi9cwCA@baldur>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>

On Thu, Sep 10, 2026 at 02:23:01PM +0530, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> Update the read request message accordingly on RSC v4.5 and higher.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index c4542318eac4..f84a399fa5dc 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -86,6 +86,7 @@ enum {
>  #define TCS_AMC_MODE_TRIGGER		BIT(24)
>  
>  /* TCS CMD register bit mask */
> +#define CMD_MSGID_LEN_READ_v4_5		4
>  #define CMD_MSGID_LEN			8
>  #define CMD_MSGID_RESP_REQ		BIT(8)
>  #define CMD_MSGID_WRITE			BIT(16)
> @@ -499,15 +500,21 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  			       const struct tcs_request *msg)
>  {
>  	u32 msgid;
> -	u32 cmd_msgid = CMD_MSGID_LEN;
> +	u32 cmd_msgid = 0;
>  	u32 cmd_enable = 0;
>  	struct tcs_cmd *cmd;
>  	int i, j;
>  
>  	/* Convert all commands to RR when the request has wait_for_compl set */
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> -	if (!msg->is_read)
> -		cmd_msgid |= CMD_MSGID_WRITE;
> +	if (!msg->is_read) {
> +		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;

I know this follows the current code, but CMD_MSGID_LEN doesn't seem
like a "fixed" part of this message anymore. It seems rather that
there's a few bits here which denotes the CMD_MSGID_LEN and the value
thereof is either 8 or 4.

If this is the case, I'd find it cleaner to define CMD_MSGID_LEN_MASK
and then just FIELD_PREP() to put a 4 or a 8 in the "length field" of
the command.

> +	} else {
> +		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
> +			cmd_msgid = CMD_MSGID_LEN_READ_v4_5;

If I understand your commit message, this line says "on DRV 4.5 and
higher length is 4 otherwise it's 8" - but there's no way anyone can
read this line and come to that conclusion.

In contrast, this would actually say that:
  cmd_msgid |= FIELD_PREP(CMD_MSGID_LEN, 4);


Also, is this really supposed to apply to DRV versions such as 5.5, but
not 6.1?

Regards,
Bjorn

> +		else
> +			cmd_msgid = CMD_MSGID_LEN;
> +	}
>  
>  	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
>  		cmd = &msg->cmds[i];
> 
> -- 
> 2.43.0
> 

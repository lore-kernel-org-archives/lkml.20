Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2089C3AA1BF;
	Thu, 10 Sep 2026 11:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039817; cv=none; b=Q1x3gC9HJjlQpJxvM5smscDsQMV0dymsD7kIzvz7S+yKuX7QQBg/AuOaYlzzmSjX72n4eb1Tx2ydRTy0oJDGbnDBLyCrsdMYJS4gFHoqw+cKoo0CTs66zp2jOwLeT8rEXWlQOmAreQbpMJNNrHr+xmrCGW/lLwpYx8AKbAmn5Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039817; c=relaxed/simple;
	bh=6AiFJPXOBz0NsZB4YLIZxgmmFuo86Cn8YBhTsfKPLrM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=R+3l+lTaGIVWc2Nl8HjYBR9pY3Dq2L8GQd2WiWhy8qwVRizkPagom1YqmcmN6AvJYwm7Cbw7U/nFP3CmNcEWc6PWqx27/huxTsLk6uZDFshMWwe2/gebBODBOtPZ7iU65Ujxt13//rB5tvciHyJ0u++LTut8VMe0vsbOg4Nrttc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHuroU/m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHuroU/m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2501F000FF;
	Thu, 10 Sep 2026 11:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789039815;
	bh=Xb2rExb+py0EDDTrB/q7BpPBPl14qSCSUcPK02llU7w=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=dHuroU/mq88+wp1QyBMi7DZDwi4h8cA0uB0bFBQA71WWj92EvZ4h+etd6OD4LzucN
	 XDkEJYUCCxkFxRTxf106YzxEGUZuNDiO0aMXYXk/iablTcrhFABpD3LKMuOamA+wKp
	 aWuI4/2DoiXI62ZtuRViG8J5x5XRcRKzUea2tN4RPlyM14aYR/fknGlfZeOqjYFLOH
	 bf+qIRyxZSdxnGraaTk9Xj2KTEjlNfcp9MuR/1dy8fiWEpTXN8XD79kOgUnjBl3xBP
	 8V+qGX3Pj8yh57PTha2SmovB8fi6HFjnZo6kirdMmAvjCnTHueRxBrIWygjGCpI8CI
	 1IwDNYkBZOf4g==
Message-ID: <3f13417b-cca2-4403-8fb4-ac9c65f1311d@kernel.org>
Date: Thu, 10 Sep 2026 13:30:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH 2/3] media: fix repeated words in comments
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Hans Verkuil <hverkuil@kernel.org>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260904113450.15838-1-hemanth.selam@gmail.com>
 <20260904113450.15838-3-hemanth.selam@gmail.com>
 <20260904133645.GA795906@killaraus.ideasonboard.com>
Content-Language: en-US, nl
In-Reply-To: <20260904133645.GA795906@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/09/2026 15:36, Laurent Pinchart wrote:
> On Fri, Sep 04, 2026 at 05:04:43PM +0530, Hemanth Selam wrote:
>> Drop words accidentally written twice, reported by checkpatch.pl as a
>> possible repeated word.  Only touches comments, no code changes.
>>
>> Assisted-by: Cursor:claude-opus-5
> 
> This is not a good use of reviewer time. NAK.

Actually, I'll take this patch.

Laurent, feel free to delegate patches fixing typos/grammar to me. I hate
typos etc. in code, they actually make the code harder to read. Patches
fixing that take very little time to review, so I'm fine doing that.

Regards,

	Hans

> 
>> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
>> ---
>>  drivers/media/i2c/adv7175.c                   | 2 +-
>>  drivers/media/platform/renesas/vsp1/vsp1_dl.c | 2 +-
>>  drivers/media/usb/gspca/ov519.c               | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/i2c/adv7175.c b/drivers/media/i2c/adv7175.c
>> index f1caab8e2abd..b6f0e1b24383 100644
>> --- a/drivers/media/i2c/adv7175.c
>> +++ b/drivers/media/i2c/adv7175.c
>> @@ -209,7 +209,7 @@ static int adv7175_s_std_output(struct v4l2_subdev *sd, v4l2_std_id std)
>>  		/* This is an attempt to convert
>>  		 * SECAM->PAL (typically it does not work
>>  		 * due to genlock: when decoder is in SECAM
>> -		 * and encoder in in PAL the subcarrier can
>> +		 * and encoder in PAL the subcarrier can
>>  		 * not be synchronized with horizontal
>>  		 * quency) */
>>  		adv7175_write_block(sd, init_pal, sizeof(init_pal));
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_dl.c b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
>> index 6430f2ec8b32..8257759421f3 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_dl.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_dl.c
>> @@ -649,7 +649,7 @@ static void __vsp1_dl_list_put(struct vsp1_dl_list *dl)
>>  	dl->post_cmd = NULL;
>>  
>>  	/*
>> -	 * body0 is reused as as an optimisation as presently every display list
>> +	 * body0 is reused as an optimisation as presently every display list
>>  	 * has at least one body, thus we reinitialise the entries list.
>>  	 */
>>  	dl->body0->num_entries = 0;
>> diff --git a/drivers/media/usb/gspca/ov519.c b/drivers/media/usb/gspca/ov519.c
>> index bffa94e76da5..57219a738c73 100644
>> --- a/drivers/media/usb/gspca/ov519.c
>> +++ b/drivers/media/usb/gspca/ov519.c
>> @@ -13,7 +13,7 @@
>>   * Copyright (c) 1999-2006 Mark W. McClelland
>>   * Support for OV519, OV8610 Copyright (c) 2003 Joerg Heckenbach
>>   * Many improvements by Bret Wallach <bwallac1@san.rr.com>
>> - * Color fixes by by Orion Sky Lawlor <olawlor@acm.org> (2/26/2000)
>> + * Color fixes by Orion Sky Lawlor <olawlor@acm.org> (2/26/2000)
>>   * OV7620 fixes by Charl P. Botha <cpbotha@ieee.org>
>>   * Changes by Claudio Matsuoka <claudio@conectiva.com>
>>   *
> 


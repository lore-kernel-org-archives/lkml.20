Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074797;
	b=3gWVJf2PqAUKJLhqeQN674Xh8FFcHXA6XZqoyrASqP28ZYgvC3b5Oe9SUrEFyUhFYqfg
	 ONP93EXo/s0tmbDf9cDWkujIQqef8mCk3RSbxUtI20UwTAs/VgEkwRxwlOmm7qqhwzQuP
	 1A2SJPo7Wwo5l/LVPMfwE/PY1K8oPuuSJSSilxM1PDL+zfbIQpz3v1cjZmwQrUdwSx/55
	 Kf8bUpq/mDaQA2hWvJ9ECNRftxVoBnFqX9aKgWSl8da3O8Sr6VKHSjWWccZvWkktF8yJF
	 UWGOmFwRytPFlgiQMDOSg4Bc6WNfc2mry/viZe3092WEboiAvHb2AjJOxhTaF/UwmAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2IKPabMjevdIrFHwPzaYFWyTHibi0SlAr68tYluFRSM=;
	b=xpXH8oiPMalJN+6sWt7toDIyZjwnZd27atQdC7IttOye82SH5rqnuA7flY8/ufnk6VQ7
	 ZPCFjb1oq9BDOBZNWnrzFgZBjnowWcb5pKBg6xWghBtvtw8GatL7KwNeyqa+Vg6NUuPnp
	 NTE4Ol6XmSjPhTR2JpRt7LfcvuTJe6L//9Qb+WsGUOI2ymw438PFZb+KCIUTwSgN2nS44
	 +bH3fC++F5JgCHSdUeVvraCqT3lU2KzBHWRTXdefnmg6RVfSh2JvMQ1InePe6F/gRq/S1
	 hK1VXKVqvSFXk9peYhkWellz6sn9PSVQnQLPi6lXUbkT42hKp997VGYlcvfxIJx9aBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lrbO2PNs;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAE160A261A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CAE160A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lrbO2PNs
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-156cbe59622so3057328c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793074796; x=1793679596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2IKPabMjevdIrFHwPzaYFWyTHibi0SlAr68tYluFRSM=;
        b=lrbO2PNstJSFZ68SLpP4XGxtXDa9+Juz0L9If8HZ2DXeH/oibvaaZmfC3HzSO0ne/f
         soLDJQcQG1sFdovslAO6/STxQF9gk+gLzz2HpZuCLQP4sDijxOAZnu/iVTiQ6WKjNjxU
         PE6YjL+TKEDoQnsnJCryJ18UV2khJyAlEd3I4OeawzAWfP3jG0UmpF/4FUjx5DGimZiW
         jxvNS0hi8lGgC3rH2gjowO04Wu4EWOFrUx8qDhbjLvvO0pBvyYPrLFttg5Gpg+rmR50h
         Kqo0itbd9EN9yIHW7TsVNwlfOLYwEcE+9wDWmR+UPYq/q4J+xA/pYDodWqSV1Cw13yfy
         1tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074796; x=1793679596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IKPabMjevdIrFHwPzaYFWyTHibi0SlAr68tYluFRSM=;
        b=CzdzuVhwFkMiNCLBA8Faj8KsQEbyZyzeUQTbqiAacUE2ZGh3C6ZBvx4Fpu0lHkdznm
         lRFLkf+AMW3NpIqy4dLJAogWf3m4ltTHatNyN0Qozkr1NEm6dCHtWlshiTpds5DnuIUp
         dUt038PYuU18GpG+5RLOIspRpgakzUNX8M3Gakir0Rd75vtkw2HDDLdpLB/AC59IVcp5
         fAvNo/Kkc4B6TpqHdFh4c2wsm8PBuCzkdWR8aN5OShOo09CMNsFRIJmwwhvZTpxCYf0A
         IbE7bNbHFRJRpUfD7qmfam5gJfj2Wi4KeHuMUvoAQ64HM7BgJU45pyy7zDx2XcxzJuaM
         GfjA==
X-Forwarded-Encrypted: i=1; AKwUvByE44JPINpYoft5NdRkcc/8y/DsdW8yaymRFxk04/K8G3xX58/dbGtWoikf4ESaxmXgIL8sXEnyshe7nVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIslY+COqdEHGUBZZwEpZRQucAIYSJF1ro0CszngJKSvOLzM3/r
	YYsRYhSXP3wvp5oTI+JQ/YppAiQ7zn5UFFBQ3yFIBUZrQ0h0B4Acx2Zo
X-Gm-Gg: AYBFou09Oj5kO/pMIvo/H0jzgxDc9kfzqd8M43zPSLHSzzXxr46HOqJF29RZBSG+bUX
	Jo/EBEScSbJhuJ/0pNEv9t7m36U3qc0pe2L06XFjzjcL6gykHVVpoFcHi2KqL7SJCsFYyCyOeu8
	HG3p8yEnEQZ266Iped2dbi87LPjBDkjpygE1Bd9KtAv1il/yLxpA5Gur3QLqd1ZhlCtHtmFLTyn
	IsREeWdWFn2OGR0k9EH4ZTc+IifSHK19trCo1rivwQ9uYWxYcIVdLH62VnGfNuC1ex4gaOD/XX3
	Aw/evIqaQfvOyREY9vW679uPVxPkLcOdpDueeUoinVQ2sei7uCsTt0YHC0Ao+FLMXX5r0X6l2lw
	HWLwvtHPzotBZOXeBc3H12rh9J2V34NZu48WRwQbuzNeYdWpPB8cqIcw6VxWO51cqrvRakU+sAs
	PTles6IKukc3ulEuHkyq+ZBEdVfZeUSAk16mqt8SdYlagtIZsgy2rDo6rmpT+460pyf6MMEaXiF
	1Q5CZcV7PbNKOHGJnNWOWJofhDhcnkCYG8/uNF/uT/k8K0b
X-Received: by 2002:a05:7022:7f12:b0:179:a1d0:be39 with SMTP id a92af1059eb24-19935fcba5amr12404995c88.29.1793074795876;
        Mon, 26 Oct 2026 21:19:55 -0700 (PDT)
Received: from [198.18.0.1] ([38.182.104.55])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm32351783eec.21.2026.10.26.21.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 21:19:55 -0700 (PDT)
Message-ID: <a2d84436-1b28-4fdc-8c27-d8022356013e@gmail.com>
Date: Tue, 27 Oct 2026 12:19:47 +0800
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
Subject: Re: [PATCH v3 2/2] ksmbd: fix named-pipe reply loss with small output
 buffers
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey
 <tom@talpey.com>, ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
 linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <SEYPR02MB69642EAEE79F3CF02F782597E6612@SEYPR02MB6964.apcprd02.prod.outlook.com>
 <SEYPR02MB69641633E70AC3FBF14BB14FE6612@SEYPR02MB6964.apcprd02.prod.outlook.com>
 <CAKYAXd9vAUH6J_Mbx3ZTzGT9U+unoOsdDL4j_Q8UsDypW3a82g@mail.gmail.com>
 <af546d6b-d1c0-45df-8f81-ad839e7e4d6d@gmail.com>
 <CAKYAXd-OpiRi2uQzK81rJpHis0VkS-gTaZpQWJ4TZH_RJFzL6g@mail.gmail.com>
Content-Language: en-US
From: Wang Zhaolong <wangzhaolong633@gmail.com>
In-Reply-To: <CAKYAXd-OpiRi2uQzK81rJpHis0VkS-gTaZpQWJ4TZH_RJFzL6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


>>
>> Thanks for catching this.
>>
>> I reproduced the sequence you described and confirmed the problem.
>>
>> For the READ path, your suggested STATUS_BUFFER_OVERFLOW check looks
>> appropriate when a positive-length read leaves unread bytes from
>> the same reply.
>>
>> For TRANSCEIVE, I think the correct fix needs some discussion.
>> One possibility is to return STATUS_PIPE_BUSY when cached reply
>> data remains, without issuing another IPC request or consuming the
>> cached data. The client would need to drain that reply through READ
>> before submitting another transaction. MS-FSCC §2.3.48[1] lists
>> PIPE_BUSY for a pipe containing unread data.
>>
>> However, I would like to confirm that this is the intended behavior
>> for this SMB2 path before preparing v4. Simply omitting the WRITE
>> and returning cached data would still silently discard the input.
>>
>> Would rejecting the transaction with STATUS_PIPE_BUSY be appropriate
>> here, or would you prefer a different approach?
> I think the former is correct.
> 
> Thanks.

Okay, I will use the solution and send V4 after thorough testing.

Best regards,
Wang Zhaolong

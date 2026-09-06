Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EBF39A7E7
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 11:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788692781; cv=none; b=TQZZSlsE0rovcgYXMPVDcLOd0/W5rZNVBfkP0WNJvo5wR+3trkYFeafD6wqYfqrJxhivEqPXBc5Bn0zmvEm2N3zpYTmlefoT3icxK14fS8CMCHhdh/upzLgs4IIXGIuwEn0lmxXxWzB4VFOgveWHE1AojlwgZNpuBpYrAQS7M3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788692781; c=relaxed/simple;
	bh=N/HRc843haF7GhRaeCjYuBNpl6Jx8wyMgtTtNTc+Uhw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6bdoN3iwwS6DtYQPTL/6hpEO8Rnb07OTXZyCWc10nZCdiw0iID2IX74JM4GKcDKbTqBHXVqFZXYOLyNzVy4pAb6FzKknoqN9ZBdayi1xRrFO9LSuUEh924lwQ8E6esgz/tD1NvRPQ7fUyCZBOF7wWtAm2xWYhxYzdti17GCKzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzXJjOiV; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzXJjOiV"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4843efcbdb2so1237038f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 04:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788692778; x=1789297578; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IEig/JE3WWqe5qqWFwj9jUgs0T7aqJalyU5R1FMFTAM=;
        b=ZzXJjOiVnD1/RDmYNJdXHg0IKoPSr9IAVbEb2SWyjkoFBQP5w1OL6ghfAv78/0LzNs
         T29OZRfBEgSDxVna8FPQ3oursF1y3iR8w5mMulSnfIkkiDLDUAFD7AC6F37zDCJlIAGu
         tijj++X9XnmGezcEGojSB4dJwVDLqHa+wL/Yla1v6Mq0VV4DqULPVn/K9Ws8OIRIprhQ
         QglaTuow2UZJussgEknZqrN2abIXghwKFt7Hls8TjQM/NmnZsYwTamkE6fo83HbnILCe
         10lWsNC7GBMgNrLzKa/cdDgpqvftBrutITQ5OUcfvS8bSJqw38c1mORXB5ZwwasEOlLr
         XTEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788692778; x=1789297578;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IEig/JE3WWqe5qqWFwj9jUgs0T7aqJalyU5R1FMFTAM=;
        b=qjUkdt5N8ePSf5KFDBlPpSp4sCrXYpr2bE5Qyu+0Qw9LmrJ/SuDHpke6NxrHanyFcO
         L7fDbmdXEGWgKTOE6S3Zbn5DEbtfzbdgj+MnpU1yJ4i0DG+oBf3v953tUnKY8FoxfTCm
         V32OdP03Tvw3YfgLtftjfuxiW9LL+GtuVhMcOSwokGNC30KpgpHMSiO5VX7daEjX373l
         hYP0tEy78dvRaImXC2GlPP32ShC4lboK2RTf69WmHVqKMdeOVSzO5xXrWpHvWXjBFK14
         dcSNMkYgBTI1O0UakIVf6RcXqZqvA1y0MAYtRPhRyUNdXRaABJMQV/7PtiX8iYWFJm79
         sTGg==
X-Forwarded-Encrypted: i=1; AKwUvByE7UzuWG6w1TjnSa4FfjPcEq+6v6JpREgyyb09qcV0JbtF/aLWXIJLIjmWx2TZKjoEjduxWpBRNWV4/Pg=@vger.kernel.org
X-Gm-Message-State: AFuF++kRFGkQ/5P4DkLEWBmf8kH2qtGC4ZnPbf4/xkrdThdqAuTApyFU
	kYkYowdiTPXP2u+MLNl2oqkVjJYzNGcDF0B0P2xIhFUOJhkiuBdRk28O
X-Gm-Gg: AYBFou3dkxAJuphufYBrjdiRhLgDC7IYtV2rctXJ8tD+QdIWg7m0Qsygf7M1Ij/uiD+
	yZ/q1dIU0wKEBQZdWoqctvz+7w0pT0MhVfEZokFiZQOy49fEXQgGsvVpYqGigFtn+mCgEoChcwU
	hB2vTNVacF1xx03aH1LQNCzQdAhf4sb8lJg9VZiz//FXaIRqi40C9sJHjJbW20o3cdAr7Im/nPT
	P6peW9xfAOF+zFS2jtyLZZ1TxnF9CN/lT+/R+787eSZP5Spm8OSSw5EbcVrO5BcUjLPetka8+0f
	Qg0cpKMu+sEe3WUj3taGLdMbprrH5GfpIgUiVAKUUAWaCIuTbJmXqjYog9Qe9a/ZuMIqS78lw+F
	fw0Iotnd/Ie+3v+bDQnlKwJTqqO9YakmDs39gsJLB9TMXNQQf/RlMjLBrxLfeb/U2BlAVeoOX6A
	MBQ6jZO/dXNnbZHnFkAuGEOIXLDBJPdctnlob8m4Fi2XaVgrtIXSCWADPqUq6+Iod+bCbkS+oZ9
	sZGTsu3lB4kdedTQHpEWmPeSZ8se2ODGbWfz1WecLqWyxCdUDaC6rZBTMKAhOKXg2k=
X-Received: by 2002:a05:6000:2282:b0:485:8a47:5b82 with SMTP id ffacd0b85a97d-4858a475d65mr16888274f8f.31.1788692778352;
        Sun, 06 Sep 2026 04:06:18 -0700 (PDT)
Received: from shift.daheim (p200300d5ff3cee0050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff3c:ee00:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bf3f0sm22605582f8f.33.2026.09.06.04.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 04:06:16 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift with esmtp (Exim 4.100)
	(envelope-from <chunkeey@gmail.com>)
	id 1x3AhT-000000007rj-0XAD;
	Sun, 06 Sep 2026 13:06:15 +0200
Message-ID: <bdca394f-0371-45ad-bfee-b044444ad724@gmail.com>
Date: Sun, 6 Sep 2026 13:06:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: p54: fix incorrect frame length check in
 p54_find_ie()
To: Wang Yan <wangyan01@kylinos.cn>
Cc: johannes.berg@intel.com, zilin@seu.edu.cn, linville@tuxdriver.com,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903081200.267514-1-wangyan01@kylinos.cn>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20260903081200.267514-1-wangyan01@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/26 10:12 AM, Wang Yan wrote:
> In p54_find_ie(), mgmt is a pointer to struct ieee80211_mgmt, so
> sizeof(mgmt) evaluates to the size of the pointer rather than the size
> of the management frame header.
> 
> Use sizeof(*mgmt) instead so that the skb length is compared against
> the actual size of the management frame header.
> 
> Fixes: 0ac0d6cedf61 ("p54: Move mac80211 glue code")

It's older than that. I traced it back to:
Fixes: e5ea92a7528d ("p54: AP & Ad-hoc testing")

> Signed-off-by: Wang Yan <wangyan01@kylinos.cn>
> ---
>   drivers/net/wireless/intersil/p54/main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/intersil/p54/main.c b/drivers/net/wireless/intersil/p54/main.c
> index 57a62108cbc3..d3e1776174f9 100644
> --- a/drivers/net/wireless/intersil/p54/main.c
> +++ b/drivers/net/wireless/intersil/p54/main.c
> @@ -76,7 +76,7 @@ u8 *p54_find_ie(struct sk_buff *skb, u8 ie)
>   	struct ieee80211_mgmt *mgmt = (void *)skb->data;
>   	u8 *pos, *end;
>   
> -	if (skb->len <= sizeof(mgmt))
> +	if (skb->len <= sizeof(*mgmt))
>   		return NULL;

In theory this check is actually superfluous. Reason being the rest of the code of this function:

|        pos = (u8 *)mgmt->u.beacon.variable;
|        end = skb->data + skb->len;
|        while (pos < end) {
|                if (pos + 2 + pos[1] > end)
|                        return NULL;
|
|                if (pos[0] == ie)
|                        return pos;
|
|                pos += 2 + pos[1];
|        }
|        return NULL;

The check in the while loop and the checks within the while loop make sure that
no "pos" is returned unless the IE is still within skb->len.

But true, it should have been *mgmt and not mgmt.
So:
Acked-by: Christian Lamparter <chunkeey@gmail.com>

That said, if you want to respin and remove this check, I would also ack it.

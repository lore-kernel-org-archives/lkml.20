Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447B4AA41E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 16:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366935; cv=none; b=CSeekWNB5HLaZJ3/iTql/T3X4ag25zqQiKYxUbiUAAFkyV3nPz1FrmZjZV+vo8lJr9zMey9G8NuWCv/5jy5JJpIfj7tx7u/pH68ic/xLLUgBwKXol6QY4rV1Pnc2YQ/kiT6d6Hkt8Mx4VPXCgyX9rL6RDwKKzmJ9TEDZHUCPM+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366935; c=relaxed/simple;
	bh=t8PyCRFnuTEhLx0POxPFJ3IdfbvAwWXeN2YROup4iG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/sVjSTSsAKB8kdbQtfQiXjQQ5m3HyyH3mFj5VxTWzxuup630WiBALmw0CFKTSoahGQc+wgUcbZISsBF7rw0OZdYpX1cK+zsRNXZek1h+CCM38gTHfDeWTThM1PRJgacaggji+IABlmPA+h2d9EYBtXcBnjsJFhuLw+CiwpYogE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rdm8Lfna; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rdm8Lfna"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482f9309813so1276794f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 09:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788366931; x=1788971731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=em+yl1HWPBHYUcif9OtkO19xDeGpBr2gFlnBjaM1mAI=;
        b=Rdm8LfnaDziuYcsYxiyyY2nqhhnjDM29brLLyZ5rPF72JGs4v9VL1YBFb+nyEUE7vx
         /cELDvLzAnfNDmf2x6xwkbrGtmQoo9qmOnIlZBF72qmlFDYHM2N52W87s9kUa4XU9lS/
         jVmgm0uC6RReFcVXn9lVt1qWLPFBouLzv7SvPm2CgftoiIkf21z3p9tjbypsS0HXB07G
         xbHEVXJvk7RCDQ8X933XpDrkljTK3noB3nQ2+fOT1S/bR4vSB/acNA0pslsFlvFKhXMw
         85vsFaJ6MDZdrzEmfHiAlhGKzJ7ecjSWnXi/XD1XoVqvbq3BEaCdzS6TIgBxywT9XxkK
         6h4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788366931; x=1788971731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=em+yl1HWPBHYUcif9OtkO19xDeGpBr2gFlnBjaM1mAI=;
        b=f5BZyDGg8g5IiVIypJ1lbsBkxvjj6SxTGHC1ojqMyt0hl1/3VLGf0eX0KdCApUw5Pk
         iabS2pXCQgUWVwdrByii69iEtqnygFijDytSIzvW8v3ge96yjt0wVosbGX6iVhrEWuNE
         UKpQsaH1s1/TvMwY1ZZ1isxBDsWNKh03raEMVuRfc/fYYN+D+FY2S0RCjltacXrQbDQ6
         zo86MsDBHuUCm2BqoUzCOmpz9s3ik31aQwPAcV+da4pbSTz7V59ZFZi6yVOXdvegVIYb
         BMz0AqRIRbp+wHo6jspCMj+oPL9hoVNNUrRTNFsXqSF0+MIhv3NjW8UtBlN3YOuIouYs
         MiVw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+Xa1PNsJQk0fpiD01SAwODJOsDkVDaB1QO/M036obyO+pt0zqRn3Z1neT2eS3OH/l2+xgMHmFZzQT1kE=@vger.kernel.org
X-Gm-Message-State: AFuF++kgVFSV3ipXHMSugjN9KqDf6S3qKTRa0B39zgZ+IUi13Y4Tk6zd
	1gwiZqWbtXfN8X1McUwRiPJbJTSYlGZ6KL4vn48uAQD+TAAYiN4oKN8xGsx9Rp9YNQI=
X-Gm-Gg: AR+sD121KQsPJ+ejL+rLDzVL1Wk3FDf+lU3X4NHLNml16WwJjlQy02gO4mCtKxFDYSG
	xeJDskeEqykRX13QW4A/mMjJ+2S94BQI1elum04SZ9XjlsYikfsSN/4jBjS2BBhViJba6LhoL6y
	hrYUb2ZBh3bEqQiTk0hcC24RJlWeNoze+w2Q/3bYKDMx6lj60o+oUmCJDcuAf3Ts06Pky0APJPf
	bJuB2FuhzAmTvxHOzY/TcVF1JcC0zHd3vvmWmWACcRtRIrLe557NpdmX0W5k3pVeuPw/eL/jcsQ
	FHbTFUzhl5izgr3AzGbYwhDvHBfZ7klFEHpHPhGiYN93YKulaKFOoc7fDdX0eeGqfQ/QvOmuAfs
	iBCSZmE0YvaRVzgrBIjj0H0nmSbJV4QatrV8O9iaSL7I4qgiqZxBh4C90mEQls/Ml/nRj4+b4PF
	f6VCmuRXzBDYzJQLcfqfZgc/EfliyHJLB+LkVqSedcgwJHrd6AkoJsuWLaHGfGUakhfBbDqnCqV
	9d77T+KFBlpT3ei60Ih8Az8DLba6D2gVUGfUvTbGgUU+BDVdXcbVzWBSps=
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr77886225e9.4.1788366930621;
        Wed, 02 Sep 2026 09:35:30 -0700 (PDT)
Received: from [192.168.1.208] (athedsl-11462.home.otenet.gr. [87.202.45.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm66601835e9.1.2026.09.02.09.35.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 09:35:29 -0700 (PDT)
Message-ID: <3552bfc7-ac6e-4133-95f9-69b4e96a5005@gmail.com>
Date: Wed, 2 Sep 2026 18:35:28 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ihex: Fix 16 bit truncation in ihex_binrec_size()
To: David Laight <david.laight.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260902-ihex-v1-1-67fdbf8d97ff@gmail.com>
 <20260902163151.59ffe47f@pumpkin>
Content-Language: en-US
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
In-Reply-To: <20260902163151.59ffe47f@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/26 5:31 PM, David Laight wrote:
> On Wed, 02 Sep 2026 12:21:19 +0200
> Vasileios Almpanis <vasilisalmpanis@gmail.com> wrote:
>
>> ihex_binrec_size() returns uint16_t while computing be16_to_cpu(p->len) +
>> sizeof(struct ihex_binrec), so record lengths of 65530 and above wrap.
>> __ihex_next_binrec() uses the result as the offset to the next record. A
>> length of 65530 gives an advance of zero, so ihex_validate_fw() spins on
>> the same record forever. Lengths of 65531 to 65535 advance by 4 or 8
>> instead of 65544, so a 14 byte image passes validation while its first
>> record claims 65535 bytes of payload. emi26_load_firmware() passes it to
>> emi26_writememory(), which kmemdup()s 65535 bytes out of a 14 byte buffer
>> producing the following splat:
>>
>>    BUG: KASAN: vmalloc-out-of-bounds in kmemdup_noprof+0x3b/0x50
>>    Read of size 65535 at addr ffffc90000075006 by task kworker/11:1/174
>>    Workqueue: usb_hub_wq hub_event
>>    Call Trace:
>>     <TASK>
>>     kasan_check_range+0x10f/0x1e0
>>     __asan_memcpy+0x23/0x60
>>     kmemdup_noprof+0x3b/0x50
>>     emi26_writememory+0x29/0xd0
>>     emi26_probe+0x2d1/0xb64
>>
>> Return size_t so neither the addition nor the following ALIGN() can wrap.
> The ALIGN() can't wrap, the u16 value is promoted to 'int' before anything
> is done with it.
> What it does save is the pointless '&= 0xffff' after the add.
>
> Since the result is added to a pointer it will need promoting to 'long'.
> But the compiler can assume that adding sizeof(*p) will zero the high
> bits and nothing extra is generated.
> (Not that this is a super-hot path...)
>
>> Fixes: 9fb4ab4d3dd6 ("ihex: Simplify next record offset calculation")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
>> ---
>>   include/linux/ihex.h | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/ihex.h b/include/linux/ihex.h
>> index b824877e6d1b..0da1c4e3e693 100644
>> --- a/include/linux/ihex.h
>> +++ b/include/linux/ihex.h
>> @@ -21,7 +21,7 @@ struct ihex_binrec {
>>   	uint8_t data[];
>>   } __attribute__((packed));
>>   
>> -static inline uint16_t ihex_binrec_size(const struct ihex_binrec *p)
>> +static inline size_t ihex_binrec_size(const struct ihex_binrec *p)
>>   {
>>   	return be16_to_cpu(p->len) + sizeof(*p);
> I'd always put those in the other order - matching the memory contents.
> (But changing it would be churn.)
>
> David
Hi David,

Thanks for taking the time to review my patch.
I had already posted a v2 before your mail arrived.
https://lore.kernel.org/all/20260902-ihex-v2-1-30bb117cfc77@gmail.com/T/#u
So the problem in this case is the fact that I misplace where the wrap 
happens.
Do you think it makes sense to send a v3 to fix the commit message?

Kind regards,

Vasileios Almpanis <vasilisalmpanis@gmail.com>


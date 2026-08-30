Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B781C386C0D
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788078911; cv=none; b=Z3Eby61rVCy2I8yE4+fuVZtX1HukyMU2KnoC5gg6zQn2aDouic0pVZFo1wxXhAbRTjv2W+lOZZUrh7aci19eV3/mVbkPji1s5OeAWo7XWwERc8CA3jzHKbqK1Hx0J518mk+XHPSnwi2w56xg8ZrNXq9xeUxsYfmJZ4DgK3ozAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788078911; c=relaxed/simple;
	bh=c96ZSUeJEjcxvGP7WpBQGII8OiT+vmcXUz7HcyhNHDY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=h/IAvqoRqt+p76ElvXtIggQPTDG3FJqbA13zOUNSjtY0lm01hc9GAkujvfoB4cSCvC4kybWp70SCPYJ4KIdidVTrTvMzrE2JCMJIpUB4scabGHXRV+5rH03iuT6WSqNjkBWjvXP2DI8w4SgJc7VIj00w6EKrIm0JhXCceWRbAbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=VoM/Sqek; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="VoM/Sqek"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48433f36a21so508818f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 01:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1788078904; x=1788683704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lPERQ4gNn92lOKV4sdrKZ2WIeiK7tfsawsRQ1ZqnsKg=;
        b=VoM/Sqek1wdX2Uiko4C91WcBS4ollQ/LqPJKwI1GaEHQVtpx3skyL845CEY4XA8IEi
         W2gmNpLZCX0QiY/RmK3oOe1P8sfaNYH4Euppb0G7xPtY+zZ1qUmFDVcA5XtURNiojfoS
         Gmu2VLCTsurXeNp1Hubd5zblRUUBydYC6o0WPRd7isaxVLzfJhubXy0SoEJFeL3EcFZO
         LENtUrWXLw0Qlma8E+Ny7jCG5aC1znkZZtAof/YHQnYzDyYqU4Niu1mvciuoDL+Nzhf2
         1M3M+dQHx/rAC2QxQGRNEtr872J38g7soJHjakMwDOYYVeT12XMLk7UDNRFf41USLLcD
         iLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788078904; x=1788683704;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPERQ4gNn92lOKV4sdrKZ2WIeiK7tfsawsRQ1ZqnsKg=;
        b=kdp/nX653TtXU9RQ/TFPRHT2fCFCethMQHr5t1WRkL2ldQV3SOtS0fbVoAOrhbWBZM
         5jn0m9Clt0FX1yX4Fc8so9rY3Fgcr4aWVW3FkFdJh1cH2ieB6LKK3S+7WBfbpzydiKgC
         eG8wHJT20Bp8ANXRdDcieBHDXxwx8/ONbagnEHcyusNYpY+fSK0uW+XzgSuC8Wk+WDMD
         R76sK/+Hqt5u1Qt/8YXZ9izQBkJYaujLGiypcKGy+B5AFFJDJaOWUKLftGs6lCeyTAc8
         vrbMrOpM4t+s/hEtmZ9DO8DJ797ezrggBw6hjAM0ewuz6N8w+ArZh/kceZKG/nsQXD7o
         jUrg==
X-Forwarded-Encrypted: i=1; AHgh+RquQIr2muLUquyojX0Hp6K6duUA1WrkV9pdeUXOqzxt8XFp9a2x29enrioSQZO6M2/sf+gioOHNEP0AqdM=@vger.kernel.org
X-Gm-Message-State: AFuF++kCk+Bmxn7/OOOoWbH/mzLsZhwcaoRgoKpbzVlEkxFalJIcLdHT
	+KfjirM90lPn/ZRqERnc4Xd5JgNqaRac1RkHqHNQ1sZJQWQKl8EchIZUuIZvcbqN5t8=
X-Gm-Gg: AR+sD11ZZPktzQi6sOUAGpn+VfH/SX6RhU352+zAJxUEJxxyuLbi4dfIhTNzybloO0W
	2aCzD71kL/d4+RkfpAR7k+vFcr7AVWPQYyk31k620ZR513R3UEEnYJr2WjtWjMnCH58YyGwSwGt
	PTHOUXmcrdPmoyLQzvJ+ogOXqIgL2UHV+pjRzQ/V/99BMPlwaCJOZ+BeVbiKNbRLWPDobGYvsDc
	wO2GD+40k7IRy+Y9DQKkasOpJAVkDF4kJcUW+RkwNMhmYTnP1bq5dE9CKaaLvbn62J3s018SYp6
	yCvG0AEUARRCyoTGLkcr8uTrqgqhGm+P/UIXSrWPp/+Svr9NRQ39bbj7nk+8Wb3CPvakHrz1UYE
	on/sark2jfu1kfxKm7EyNLS715uVe22pDynjLWbpoRz12DZzAu8gn+d2mOiA4l+v0Q8BRsOkt9W
	cOZ1w+/j+xmAm+gU+/6CWoXhdbYJAv2ca3Xn6rTuIi/a5a18vHl3oBk2GQ0D+AuLU6vGTYLLJJz
	/p4/2QqE4EnTN7OQsI=
X-Received: by 2002:a05:600c:870f:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49cd538cb5fmr21200585e9.3.1788078903667;
        Sun, 30 Aug 2026 01:35:03 -0700 (PDT)
Received: from [192.168.0.161] (78-154-15-182.ip.btc-net.bg. [78.154.15.182])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9617179asm85766775e9.2.2026.08.30.01.35.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 01:35:03 -0700 (PDT)
Message-ID: <2ef6bf41-8626-40ce-8ba8-82dbd3f0c30e@blackwall.org>
Date: Sun, 30 Aug 2026 11:35:02 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] vxlan: mdb: Fix use-after-free in
 vxlan_mdb_remote_src_del()
Content-Language: en-US, bg
From: Nikolay Aleksandrov <razor@blackwall.org>
To: Baul Lee <baul.lee@xbow.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Ido Schimmel <idosch@nvidia.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, federico.kirschbaum@xbow.com
References: <20260826173604.90158-1-baul.lee@xbow.com>
 <c985ef2a-3e0d-48fc-9e21-33501bb92cf3@blackwall.org>
In-Reply-To: <c985ef2a-3e0d-48fc-9e21-33501bb92cf3@blackwall.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/08/2026 20:40, Nikolay Aleksandrov wrote:
> On 26/08/2026 20:36, Baul Lee wrote:
>> vxlan_mdb_is_valid_source(), which validates MDBE_ATTR_SOURCE and every
>> MDBE_ATTR_SRC_LIST member, accepts the all-zeros address.
>>
>> A source list is only accepted on a (*, G) entry, whose source is the
>> all-zeros address, and for each member of the list an (S, G) entry is
>> derived from it by substituting the source. Entries are keyed by a plain
>> memcmp() of struct vxlan_mdb_entry_key, so if MDBE_ATTR_SOURCE is present
>> and holds the all-zeros address and the source list holds it as well, the
>> derived (S, G) key is byte-identical to the (*, G) key and resolves to the
>> same entry. Omitting MDBE_ATTR_SOURCE is not equivalent, as the key is
>> then left with a zero address family.
>>
>> vxlan_mdb_remote_src_del() removes the forwarding entry of a source before
>> freeing the source entry:
>>
>>     vxlan_mdb_remote_src_fwd_del(vxlan, group, remote, &ent->addr);
>>     vxlan_mdb_remote_src_entry_del(ent);
>>
>> With the keys aliased, the first call deletes the remote of the entry that
>> owns 'ent' instead of a separate (S, G) entry, and frees 'ent'. The second
>> call then runs on the freed entry, and its hlist_del() reads ->pprev and
>> ->next out of it and writes through them.
>>
>> Adding the (*, G) entry with NLM_F_REPLACE and no source list marks the
>> all-zeros source for deletion and reaches this from the sweep at the end
>> of vxlan_mdb_remote_srcs_replace().
>>
>>    BUG: KASAN: slab-use-after-free in __vxlan_mdb_add+0x1cd/0xd70
>>    Read of size 8 at addr ffff888102852500 by task poc/84
>>     __vxlan_mdb_add+0x1cd/0xd70
>>     vxlan_mdb_add+0xc0/0x140
>>     rtnl_mdb_add+0x157/0x2a0
>>     rtnetlink_rcv_msg+0x207/0x5a0
>>    Allocated by task 84:
>>     __kmalloc_cache_noprof+0x153/0x360
>>     vxlan_mdb_remote_srcs_add+0x2eb/0x440
>>     __vxlan_mdb_add+0x803/0xd70
>>    Freed by task 84:
>>     kfree+0x14c/0x3b0
>>     vxlan_mdb_remote_del+0x129/0x1a0
>>     __vxlan_mdb_del+0x4f/0xe0
>>     vxlan_mdb_remote_src_fwd_del.isra.0+0x162/0x1b0
>>     __vxlan_mdb_add+0x1c5/0xd70
>>
>> The MDB operations are netns-scoped, so an unprivileged user can perform
>> them in a new user and network namespace.
>>
>> Reject the all-zeros address in vxlan_mdb_is_valid_source(), which covers
>> both call sites. A (*, G) entry is expressed by omitting the source, so
>> nothing legitimate is refused.
>>
>> Discovered by XBOW, triaged by Baul Lee <baul.lee@xbow.com>
>>
>> Fixes: a3a48de5eade ("vxlan: mdb: Add MDB control path support")
>> Signed-off-by: Baul Lee <baul.lee@xbow.com>
>> ---
> 
> You should wait 24 hours before posting another version

Reviewed-by: Nikolay Aleksandrov <razor@blackwall.org>

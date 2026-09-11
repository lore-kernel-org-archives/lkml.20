Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A2C3C0A09
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789111416; cv=none; b=Kk1eMovoxIklxHFeongmNVBa/u0s1wjXwogA7Mu9WhA6n+6f/BVbTvvGi/GCJiSfJE/YvZxzoRCMPOK1vOzjxXG9JqhSXn751smiPLMODF4qylkjDGp3xfydwWRENFA8tAR6o8RwYofYJ7pV3ip6ByYPWwci5S3yXtaRb1UJqm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789111416; c=relaxed/simple;
	bh=SSGy064aA07uBrpRVs3NyDQHNpVg8JK/JGG78pHuF8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjUnD6H1V+Jpa0hoOE5e2HyoQ4MWt+pf7Kd5b/RPukUkk55DeFWc/Uj7RphE/KGEGTj3eNCOpGQ4LZ2ZTaWNzINM2r7W7hKL3jDroR847uM5spydJt3DajvjuzLKszTLMAeywTFivFzBv5NuNEvAkKT6gVAHA5kNfgS7NNVNbMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org; spf=none smtp.mailfrom=blackwall.org; dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b=ZlUCEZny; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blackwall.org header.i=@blackwall.org header.b="ZlUCEZny"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso6709995e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1789111408; x=1789716208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G/xay3K0AzfQ8Q3vQuKemTWWKc9Kxb4fIjc9QaIhAnA=;
        b=ZlUCEZnyHtLwts2iUkV7A4huvKcxW1XNpnFwbMvt5pqlQGiKo4OcrMhXpa/OXWVD7W
         ekboPgCcC5CYPcdg3ChiMY6a3Tkf/Ttp3fxeN1R2tHt6ozRa7O1p4FLBBZkfxUYE/w8R
         2sk5Hg50YNLYVoIxExEEAII55riLS8m1pSbLlqVpc5FuMFbu0drwHpWyaz/wwPE6hoGQ
         Hba9hohh6Zq9VTWuejGvjC0OkSt+UZlJMaIU3VvkR7gMptg+jujjGiQoHKDdavqMPECt
         tCi8U5AJV7uDiezp7+dJlf6sJ63iu+rGUWHeIFUltJaOzXYuDhUM60oAkP8jrp9bcLm9
         KPSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789111408; x=1789716208;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/xay3K0AzfQ8Q3vQuKemTWWKc9Kxb4fIjc9QaIhAnA=;
        b=LRDmtAwNUw+sQNcEaIRoLsGhgV9SfdMo5nS7FuEQMUJx7YKvTNwoYUWoS5ZWk2hwpl
         GWUeaQl7QYpM0J4Jdm06Sz5GaUDq2ToyXhSUEvHDPpDT2NqXefE+8MdNzvliEK3p7NeD
         V7fAReeqwoHJ6Xj4+knU9Ec1j4EXPnK3988CQ58dI3eUBZJetnY52Z60TWhRsC10ZFg/
         6ZSqEVSiDROmsIrhc/qOwc+M1qnAoUcH6ds5BLPciSmnGy3/rxRd6nHWYAEC1KsFFac4
         WjItsGMXOLxkE1OTBJ05iXXJd55wfQHtmCFMWA+K17SQobHioT+ioPqI972YZqpuqaeF
         ib/g==
X-Forwarded-Encrypted: i=1; AKwUvBzDJDGTecbDehvPl/ryfYxawDOVrggGEKy9g5cMRNvFKcseQt7LcHXBx82vvuoCzQV4xiK/5PDm1r8g2FM=@vger.kernel.org
X-Gm-Message-State: AFuF++mWd40l4tTJUhziTM/IDo3ElSOvg1oEVCZazvR2A2sT1nbM/d0R
	v6OYitbiWIVqxDOj50owMyNvvpF18yQ+NV9aF+PAnfWURgNutlKbKKoPpYjaRK4nfdA=
X-Gm-Gg: AYBFou308OGn6gHI41yT9XS2zsqiL7hhzAwCIg2Qs0qTQ9ZJSru7z4DSgf3f5ekF8+z
	d3Hy82JLrXqZLMo4Dm5x1tIRPdqsXz+BCxryVSX/tEv2IXNpBr+/H8M3ABD3/sbAvihct50De/M
	6dd58BBryaPyF26GY9s/pyRpFxuTEUZ0s7wUFq1wWz3qNMEUY/au/1912p4dkYj5ohOIODNSBsH
	JhFbkewuMIigHSPWNSWdHw2uhuwmy7MmwXysL72opn7yinRBEi1ekk8CYqNfJx1/oi3WTFc5GL7
	wv/+LBxBqBw5VktUc5IbPhn5ppMT9NmZa6V/0MRY9Y+oS/Z0EjKttmLlP/XmZyPThGNqvp+wI44
	r+ucXjgmtaOYs0rpkVCIrxzlaukd+cF1pB6iybo2EgZnq7cbU/t/EROTT51D2/E9GcjrKMW/MxE
	hDclas8KbEU3vUoVWmbumuiQDBAfwlGD10WgTFA/Mjtgno37ySySqXPKhwSgSD0hbxzZwsbieSs
	PypLiQCHycM3uxJD3vhEBFyydYB0w==
X-Received: by 2002:a05:600c:8a1b:20b0:49d:17d8:abec with SMTP id 5b1f17b1804b1-49e619c1912mr21023585e9.21.1789111408029;
        Fri, 11 Sep 2026 00:23:28 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a32803sm37300935e9.0.2026.09.11.00.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 00:23:27 -0700 (PDT)
Message-ID: <8149fce5-04c3-4a14-969c-c65a75dcf699@blackwall.org>
Date: Fri, 11 Sep 2026 10:23:26 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] bonding: fix slave_cnt leak on XDP error paths
Content-Language: en-US, bg
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: jv@jvosburgh.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 daniel@iogearbox.net, linux-kernel@vger.kernel.org, liuhangbin@kylinos.cn
References: <20260907-bond_slave_cnt-v3-1-57df3b3cf2cb@kylinos.cn>
 <178889459114.219967.6984751596437332187@kernel.org>
 <aqOrcoqnRMsvpS_5@fedora>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <aqOrcoqnRMsvpS_5@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/09/2026 10:19, Hangbin Liu wrote:
> On Tue, Sep 08, 2026 at 07:09:51PM +0000, netdev-bot+sashiko@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 1 potential
>> issue(s) to consider:
>>
>> Critical: 1 · High: 0 · Medium: 0 (1) · Low: 0
>>
>> - [Critical] Newly introduced slab out-of-bounds write in
>>    bond_update_slave_arr(): moving `WRITE_ONCE(bond->slave_cnt,…
>>
>> Pre-existing issues:
>> - [Medium] This problem wasn't introduced by this patch, but the XDP
>>    error paths the patch touches are still incompletely unwound: the…
>>
>> --
>>
>> bonding: fix slave_cnt leak on XDP error paths
>>
>> This moves the WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1) in
>> bond_enslave() from just above netdev_compute_master_upper_features() down
>> to after the XDP setup block, so that the three XDP failure exits which
>> "goto err_sysfs_del" no longer leave slave_cnt incremented.  The increment
>> is placed just before the bond_update_slave_arr() call.
>>
>> Link to v2: https://lore.kernel.org/r/20260903-bond_slave_cnt-v2-1-02e27304ca36@kylinos.cn
>> Link to v1: https://lore.kernel.org/r/20260902-bond_slave_cnt-v1-1-36e95bf4a6ff@kylinos.cn
>>
>>> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
>>> index a9bff7663eeca..1514a8ba0888d 100644
>>> --- a/drivers/net/bonding/bond_main.c
>>> +++ b/drivers/net/bonding/bond_main.c
>>> @@ -2284,7 +2284,6 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>>>   		}
>>>   	}
>>>   
>>> -	WRITE_ONCE(bond->slave_cnt, bond->slave_cnt + 1);
>>         ^^^^
>>
>> [Severity: Critical]
>> Can removing the increment from here overflow all_slaves->arr[] in
>> bond_update_slave_arr()?
>>
>> By the time control reaches this point, bond_master_upper_dev_link() has
>> already linked the new slave into bond->dev->adj_list.lower, so
>> bond_for_each_slave() now walks N+1 slaves while bond->slave_cnt is still N.
>> bond_update_slave_arr() sizes its arrays from slave_cnt and then fills them
>> with an unchecked store:
>>
>> drivers/net/bonding/bond_main.c:bond_update_slave_arr() {
>> 	...
>> 	usable_slaves = kzalloc_flex(*usable_slaves, arr, bond->slave_cnt);
>> 	all_slaves = kzalloc_flex(*all_slaves, arr, bond->slave_cnt);
>> 	...
>> 		all_slaves->arr[all_slaves->count++] = slave;
>> 	...
>> }
>>
>> The window that now runs with the stale count includes
>> bond_select_active_slave(), which is a few lines below:
>>
>> 	if (bond_uses_primary(bond)) {
>> 		block_netpoll_tx();
>> 		bond_select_active_slave(bond);
>> 		unblock_netpoll_tx();
>> 	}
>>
>> and that reaches bond_update_slave_arr() for balance-tlb/balance-alb:
>>
>> bond_select_active_slave()
>>    bond_find_best_slave()        /* returns a slave in BOND_LINK_BACK */
>>    bond_change_active_slave()    /* BOND_LINK_BACK branch */
>>      bond_alb_handle_link_change()
>>        if (bond_is_nondyn_tlb(bond))
>>                bond_update_slave_arr(bond, NULL);
> 
> Oh, hold one. I miss read the comment. It's not about the
> bond_update_slave_arr() at bond_enslave() we moved to.
> 
> This is the bond_update_slave_arr() called by bond_uses_primary(), which
> is before the ndo_bpf ops. We need to either also move the
> if (bond_uses_primary(bond)) block after bond_update_slave_arr().
> Or just use my patch v1 version, that add a new err out.
> 
> Nikolay, what do you think?
> 
> pw-bot: changes-requested
> 
> Thanks
> Hangbin

Oh well, it is becoming too dangerous. I'd go with your v1. That is the safest bet
that can be easily backported. Sorry for leading you down this path, I missed
we can still reach the slave arr update via active slave selection.

Cheers,
  Nik


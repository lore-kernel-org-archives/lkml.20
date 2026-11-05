Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.224
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871867;
	b=hcuLhouDZAVg+8UE9iksl4331RIWtk4HljeUCy6a3tR5u9APxOwveAN19RUm8NC4mfBF
	 L9+DqwJgmdBiGwj2WTWL8A4+aOPwStlGDzqhzA82/gUnq0YL9xbN0i/jFvFwZyycSmjT5
	 JdZyzop8oDSRNhbJp2qJ33SaAmOvT3mPqZQQC1AHAwE5XfnHKuQ9ke9zbOrfrr2xB93vA
	 bF7aY+EskOygIN6oCyQDD3joxBvLANRMiqB8+drkOp7lMgA+RkYjfMbhLmK4ytQFXxWA3
	 EZzLiGgmMIpqfIuWEU4ABz0uY2b0BfBcpFYUkTOi7ZnyVpK37vRWBsIkWvdHxKvMx7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871867;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=GjKSpRpZJGQx4i7CWLGU6DV5BbDSRkOyHaDAbETweWc=;
	b=jV3UD7TdPV2nbfX5j14wcGTqWyJLQ7pMxA6pZLf9Xjd2pVsl7DpHO9Y9/NO4EFJQFM+h
	 3YFuA7qv0YKHAqRhSn0t1H7JB72ceR7L3To7jCYfnJA8JNDivxb9Zye6lomaH+SHGHZfo
	 1BGA1Xpt4sBLeeXIloRdItbIa571fni9w1LwO+p/Pn3dUcoXWbaGKFZlZbDOYg+uYVINd
	 CUoSOLMvVgY3dG0RHlBnSR/Hd0XgIILyPUBR5QL1i+roH4P4c4c6hB+eLp2MlRo8SAtxt
	 bD32CRwiYDwC0MDYk4b5D8ox/3QntHmEDNYSFsaxLNzAwMRjBMFO69NgtiM9UaaKnSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PcBfgrn1;
	arc=none smtp.remote-ip=113.46.200.224
Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8DF606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8DF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=PcBfgrn1
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=GjKSpRpZJGQx4i7CWLGU6DV5BbDSRkOyHaDAbETweWc=;
	b=PcBfgrn19D2DPfo95DuEzm6OFu5RY+m8UPdP/upFN71tmXSD57TKNJOu+iXrE5NKU32m/ahXe
	emItw+oQ7WxufQV/uh3LC5vkzaDwgQGUUxv1AGVBpzWmNy/Sb8IHcLoz/E9PB5eTv+aPx9cAzba
	53t0+gklnFqnZg9heaijTyw=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jKy7R6xHzz1cyQD;
	Thu,  5 Nov 2026 17:44:03 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id B351240586;
	Thu,  5 Nov 2026 17:44:15 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 17:44:15 +0800
Message-ID: <88f7174c-8f78-4232-9edc-1eeeef71eff6@huawei.com>
Date: Thu, 5 Nov 2026 17:44:14 +0800
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
Subject: Re: [PATCH] arm_mpam: Restore the cached configuration when a write
 to an MSC fails
To: Andre Przywara <andre.przywara@arm.com>, <james.morse@arm.com>,
	<ben.horgan@arm.com>, <reinette.chatre@intel.com>, <fenghuay@nvidia.com>,
	<gshan@redhat.com>, <jonathan.cameron@oss.qualcomm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20261104101541.563113-1-ruanjinjie@huawei.com>
 <7fcc1d9a-1c19-4827-b602-0db416af2e2f@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <7fcc1d9a-1c19-4827-b602-0db416af2e2f@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/4 19:24, Andre Przywara 写道:
> Hi,
> 
> On 11/4/26 11:15, Jinjie Ruan wrote:
>> mpam_apply_config() caches the new configuration before writing it to
>> the RISes. When mpam_touch_msc() fails, the cache keeps the new values,
>> so a retry with the same schemata is skipped as a no-op and never
>> reaches the hardware.
> 
> Do we really need this? Has this been observed to solve a problem?
> If any of the MSC accesses fail (for MPAM-Fb only), we already tear down
> the whole MPAM driver immediately, so any subsequent accesses wouldn't

Yes we call mpam_fb_disable_mpam() for MPAM-Fb .

I originally worried about the MMIO path and it turns out not need
the rollback too and the current behavior is correct, see below.

last CPU of the MSC related cpu goes offline
       ↓
    hardware back to default value
       ↓
  user writes schemata  → mpam_apply_config() update comp->cfg[partid]
        ↓
   mpam_touch_msc() → smp_call_on_cpu()
        → -ENXIO only if accessibility has no online CPU
        → comp->cfg[partid] keeps the new values     <- this is right
          ↓
  a CPU of the MSC comes back online
     → mpam_reprogram_msc() replays new comp->cfg[] into the hardware


> work. So I think there is little point in trying to fix or restore any
> configuration?

I think we should drop this patch.

> 
> Propagating errors up the call chain is another issue, but I don't think
> we need to care about any hardware settings in case of a failure.
> 
> Cheers,
> Andre
> 
>>
>> Restore the cached configuration on failure so the retry writes it to
>> the RISes again.
>>
>> Only arm64 MPAM systems are affected; x86 does not support MPAM.
>>
>> Fixes: 60e33a1864fd ("arm_mpam: propagate MSC access errors for
>> mpam_reprogram_ris_partid()")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: <stable@vger.kernel.org> # 7.4.x
>> ---
>>   drivers/resctrl/mpam_devices.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/
>> mpam_devices.c
>> index c067b6d57d71..bb667a416660 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -3412,6 +3412,7 @@ static bool mpam_update_config(struct
>> mpam_config *cfg,
>>   int mpam_apply_config(struct mpam_component *comp, u16 partid,
>>                 struct mpam_config *cfg)
>>   {
>> +    struct mpam_config old_cfg = comp->cfg[partid];
>>       struct mpam_write_config_arg arg;
>>       struct mpam_msc_ris *ris;
>>       struct mpam_vmsc *vmsc;
>> @@ -3439,8 +3440,10 @@ int mpam_apply_config(struct mpam_component
>> *comp, u16 partid,
>>                        srcu_read_lock_held(&mpam_srcu)) {
>>               arg.ris = ris;
>>               ret = mpam_touch_msc(msc, __write_config, &arg);
>> -            if (ret)
>> +            if (ret) {
>> +                comp->cfg[partid] = old_cfg;
>>                   return ret;
>> +            }
>>               ris->in_reset_state = false;
>>           }
>>       }
> 

-- 
Best regards,
Jinjie


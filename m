Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833649;
	b=GU0VxZOEgzCE8DxLRuwSXGA/X+PH7jMkSmZ01zI+aUjH3Pteh+Q+h97GY68rXs6JEYYh
	 rdKOjmXKWyFZVw3EQd6qWtR5rm82jSEcdZoMz79vd3wMbwsn8AsjWn1Gxv4doGxpIB/AB
	 QA7VmXqaZZbzKNdR/LSrlASthsGuapmkzbNli8UsYJpCZ5Ar/fVXYx21qLvBqw9bGsk1L
	 k0rmQ2JcULJ9L8ZGRbNpjXLE2Uaygvkqk3ula9Ajt1tJHPoZaXzIzTTIEkZZVnxZpuClg
	 8abdfD9VsbSFIxUrkJepbyWUbcf2u2j/AiJXV7TUvQnAB22tyKNbWJqZ+6PwKnpxOMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833649;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=SxStVO/+/LibcRZjmL0Tf7EgrvcD4PfJi49cwDuHtsc=;
	b=wltiFd5T+3dallPwiWgb4DIBspzeFruaGQWEoj2Ses2IHHTuuu32wrSkJ5l6c6yRkWAE
	 bj5q7Ae3zFo93IEwNcgopZZk5ZWRdxb1HEjS4ebGOt4bkAuu37knZs3fUbOYuamnUXL3e
	 IAXSFp+c+Ft4jU43e3pkEpXnliRzuyNM/yWr8+qqehLqRBu7PClux/FsjjIQsyHb6J4zw
	 6jXvL5hUucSYHF75wZ1qiFTYDWnrmGbxicWGQBrXbqC2HmzMMOGY2fZ8KB/P1Q0aoAh/b
	 9BkxRgqbrRgujom5drwpme/cpsrDnHWgJkxiclI06IzStcKWWP1UW4zR01FBRlL4s1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=U+L+ofV8;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1ED606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF1ED606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=U+L+ofV8
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SxStVO/+/LibcRZjmL0Tf7EgrvcD4PfJi49cwDuHtsc=;
	b=U+L+ofV8YdwcBjofUnG7fFL0JplKwxP9Vh7jtopja0wjbmgjl0GfPpdEDt9pKXDaW0kmlXb0H
	lxVG0CDRrnYFxbRgqZzs7Ft0qMgpHf+BzDE8Qxj4ZOIBwxFFrChDtI32O65aC9+jO+OH8GQB7eq
	OWKHj+Gech0UyW6qIPrR8k4=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jSnph41L7zpStt
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:16 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 305762011D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:54:03 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 16 Nov
 2026 20:54:02 +0800
Message-ID: <bd944ffc-002d-438b-bf04-3f76ada76a21@huawei.com>
Date: Mon, 16 Nov 2026 20:54:02 +0800
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
Subject: Re: [PATCH] arm_mpam: resctrl: Annotate domain list walks as RCU
 under cpus lock
To: <linux-kernel@vger.kernel.org>
References: <20261116024834.275512-1-ruanjinjie@huawei.com>
 <f89e485b-33b0-465a-984f-fdddd60a35d4@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <f89e485b-33b0-465a-984f-fdddd60a35d4@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/16 20:12, Ben Horgan 写道:
> Hi Jinjie,

Hi Ben,

> 
> On 16/11/2026 02:48, Jinjie Ruan wrote:
>> The resctrl domain lists are RCU lists which are only modified while the
>> CPU hotplug write lock is held, so traversing them is protected by
>> cpus_read_lock().  That is the convention the generic resctrl code
>> follows.
>>
>> The MPAM implementation omits the condition at three places, so lockdep
>> reports a spurious violation with CONFIG_PROVE_RCU_LIST on whenever
>> they run:
>>
>>   WARNING: suspicious RCU usage
>>   drivers/resctrl/mpam_resctrl.c:1762 RCU-list traversed in non-reader section!!
>>    mpam_resctrl_get_domain_from_cpu+0x200/0x298
>>    mpam_resctrl_online_cpu+0xa4/0x160
>>    mpam_cpu_online+0x2b4/0x300
>>    cpuhp_invoke_callback+0x304/0x700
>>
>> Likewise for mpam_resctrl_get_mon_domain_from_cpu() and
>> resctrl_arch_update_domains().
>>
>> The lock really is held: lockdep_assert_cpus_held() is the first thing
>> each of these functions does, and the warning's own lock list shows
>> cpu_hotplug_lock and cpuhp_state-up taken.  Only the annotation is
>> missing, so add lockdep_is_cpus_held() to all three walks.
>>
>> Fixes: 9cd2b522be2c ("arm_mpam: resctrl: Implement helpers to update configuration")
>> Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
>> Fixes: 09e61daf8e96 ("arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation")
>> Cc: stable@vger.kernel.org
> 
> The patch looks good to me but the Fixes and stable Cc can be dropped. This is just providing extra

Thank you for the review.

Will delete the Fixes and stable Cc and resend.

> debug information to allow a debug feature under RCU_EXPERT to be used. The equivalent commit in

That is true.

> fs/resctrl, 11b57be8e406 ("x86,fs/resctrl: Document safe RCU list traversal"), which is needed to
> make this useful was only added after MPAM support was merged and has no Fixes tag.

Yes, the fix is wrong and not nessary.

Best regards,
Jinjie

> 
> Thanks,
> 
> Ben
> 
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 5468367776e2..d25c2bac9678 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -1516,7 +1516,7 @@ int resctrl_arch_update_domains(struct rdt_resource *r, u32 closid)
>>  	if (!mpam_is_enabled())
>>  		return -EINVAL;
>>  
>> -	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list) {
>> +	list_for_each_entry_rcu(d, &r->ctrl_domains, hdr.list, lockdep_is_cpus_held()) {
>>  		for (enum resctrl_conf_type t = 0; t < CDP_NUM_TYPES; t++) {
>>  			struct resctrl_staged_config *cfg = &d->staged_config[t];
>>  
>> @@ -1743,7 +1743,8 @@ static struct mpam_resctrl_dom *mpam_resctrl_get_mon_domain_from_cpu(int cpu)
>>  	if (cache_id < 0)
>>  		return NULL;
>>  
>> -	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list) {
>> +	list_for_each_entry_rcu(dom, &l3->resctrl_res.mon_domains, resctrl_mon_dom.hdr.list,
>> +				lockdep_is_cpus_held()) {
>>  		if (dom->resctrl_mon_dom.hdr.id == cache_id)
>>  			return dom;
>>  	}
>> @@ -1759,7 +1760,8 @@ mpam_resctrl_get_domain_from_cpu(int cpu, struct mpam_resctrl_res *res)
>>  
>>  	lockdep_assert_cpus_held();
>>  
>> -	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list) {
>> +	list_for_each_entry_rcu(dom, &r->ctrl_domains, resctrl_ctrl_dom.hdr.list,
>> +				lockdep_is_cpus_held()) {
>>  		if (cpumask_test_cpu(cpu, &dom->ctrl_comp->affinity))
>>  			return dom;
>>  	}
> 


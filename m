Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C4641F375
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243504; cv=pass; b=dx+g/N3RxwoSQtuHFdd/cnGgv4oM2hoyRA/qNTLQs7eo6JSy2Pd8MgPiTkFjLvUEk2mtfGZerj4RYjxrAGdK2dC/1MNlgz1PVskHeYSmf0IDLA8jDHjEa+tZo6N6OfMYEBXahQdmMu13QSwWDXCGTNyX7cv5JM2fXO3ikoSAFC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243504; c=relaxed/simple;
	bh=iiELtgm1yAzuWo2qXQiNnvZmI2a28WotDb7qzo11MD8=;
	h=In-Reply-To:References:Mime-Version:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u728+cI3LyjRIu2sj2aCxR+14GZFPvl4f+veSlYCJu0tUdaz/Ds6EooLR3YKlTgJPx9250UO0jkQmkZ7jcZu+NY5B9oThDbTNNWk2d8SfXrxI+lo0w1nhp9Q2I5Lp7H+PJTqaeH6XlWs0a1WbwL0gdhxzYwDfqTYu7jE/VDgwls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Gx7BbzK2; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Gx7BbzK2"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a5e548cd7dso14481981fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:51:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790243494; cv=none;
        d=google.com; s=arc-20260327;
        b=YXA50m+MRloUAlcZX0zGe9ykgX749FjpyoVN/YORyqo1Bug2gRn1u4i8wQIE3BM3tJ
         TIAmoxR58vx0b7Bf8fjNST2TQ/V8+tMCOurFEK7CTlzIo/RJJSCOAV6XJrB1/FH5flGp
         ua+zVPsK+ON18eya+e9FPlp/gX+ncgP2SIDCcY07rjw/W4VA6+xP4UJDKLCyR4QWHCeZ
         hFt4rBg8edDIJzb1AHJwIvHJRcyln0Ok9uJr+zwAQDKDvL0Yy+elDimdwKyKKnds0rNk
         wYw7rZqwRGb+ignwHTpDWrrbNrHq1rk6aGbBEwIB3v3/JxiVWGFRR5N12SdkR8uA9UbW
         GysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:user-agent:mime-version
         :references:in-reply-to:dkim-signature;
        bh=eisBXp/pRzcQ5EL8prBSUE7T1+X/ln778vZdJ9nZQMg=;
        fh=rDbxZqSwhWEdKnCTMtH0cBrAOIo1VETHYTgGCc4+GWA=;
        b=INOa2ydGWTKXquZIgtPoWgjHTo02h7VFtEQPQsa6sSCT13T0c3Yt4Ctv8pik7fBujA
         rQZ9k8eHVsISjrSMHmXDBcCnPWTEsAZCbJpipZzvnm5Ml/uI5K7l21CBCnTamid8NSe0
         uI3AgyHvGn7EedD7XbmI3ZW17AQIJ11TsgaiufNjfyWyHZwOgnZ/YGttpO9GnxrEEcCK
         z6jurANDEYKdvflGrmbjAIQoezemIRL8DePycc1rGttL8XiUd3FdQgznilywEluUQT9d
         HcVF7D06F6rnGo3hzCQEB5whEPbNx3CVzYFWOdzpmZ/OO0FvnaSOJuXkGtnM5mcOtTnW
         xbYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790243494; x=1790848294; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:user-agent
         :mime-version:references:in-reply-to:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eisBXp/pRzcQ5EL8prBSUE7T1+X/ln778vZdJ9nZQMg=;
        b=Gx7BbzK22BLs3UMJWSaIcFZ7Ks3wgufjFyVJKyGZNXc2OJWg40udlBRWHKhwyktZWV
         akvZzp7NHHfhWSvE5LKq1Ckp44MwJgYUWLb0KwVtWC903PxLyPNkxBA8S2m/Qlxgz+ct
         mHz1WRSCd/7suGfuVfxNbY11Dg8SrWaA+xee4z1G3w3+0+vzIYMJkxD89dXV7JbnsRZZ
         nwQc3PEuaI7WHcbJUrQic3Vw++cILigkz5onKHDvgA+gbQbQcopMkw2gVz8wvOeWT0Gr
         XF+I0VE+goYMUULtEjETNaaZ0Fzr2JAaz4Ndzwp8FRbMdvQp3xzR9f2kr0NY1+gpWIXa
         IHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243494; x=1790848294;
        h=content-type:cc:to:subject:message-id:date:from:user-agent
         :mime-version:references:in-reply-to:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eisBXp/pRzcQ5EL8prBSUE7T1+X/ln778vZdJ9nZQMg=;
        b=dBWoNz2sBlyiLBuDiQfYbSLh0rP5t8EuAoRGGvf+ciRrjAmxteN0KAOtgGzJT0Yk3W
         tY2Ae0tjqoODHqbzMVFUUToa0e7LkTpMvKfCBySHZ8oBEtuoyj0f2mWQa+LStCAYGWd5
         JnPSJ9KvIxcfYClTeZlB2s4mw9YSbBKthGWdjtEzmkOk7zRUe4EZv0Oc/HBbaFR/fjui
         Qu3Fi00gwEX326lb7VnSE9DcYliVkgflsRi+dF6gWsl928P3NwBAv/hxW0+vVADgbe5c
         xCFqSyPQJ07qu72kJUWc83HXhBQAc2UibiOOHPez/ytQO0s8yLPhiJpCb6IX0IzjI3QG
         X3NQ==
X-Forwarded-Encrypted: i=1; AKwUvBycHnJTZGy2aK2CM2vfFz1rivV4QIBHXNpAsKKHNgRZyBpM5dnMAjA16mTLXBWZV57tO1bmIKRkOCOIkBU=@vger.kernel.org
X-Gm-Message-State: AFuF++mp2hOc31hMYfQiGyuYEAAZh1J1VaNqL+J82JH2OitDzVyEQWl/
	S1Dd4fUShfQ2PVFC5IJziY/4ef1oPWffkP3Gs+oQ28mJwFL0qjhiPyccp1hf4KYpsydahI0qkFT
	JFGCWs9JTAiG1JPOVOy66/Y4t+uuAgeceobwUWDlkyg==
X-Gm-Gg: AYBFou1r9wSlrj2q6t3kphn0lfaoQpwJN/lMzUWe6G3MXoPWT+SZfnxSsUi/fwZE+Wl
	h/KCfl53Eo3jTIKXlL41ovcEc3eq9pwt/0GIR1LN0B4PBvFSB32ZM7YMW9tESSO0v5VkMzBI2Q8
	OxNonWuWPsqdeFpaA68C1UQv97XAcLaqQN0X5mSCRfMOUwyV/w/Pnen9vENx7vw8md8s4cPADcv
	MOEs9W3B8C7a1TDBSQSa+eEp+a1xb+Ud1/3u853DPKtREHUoFOT1v6OIVomEYtFUo9cYXm0BS6G
	955upGfX88r07FZJolaojScj8srKNbzri3XXRK/UXt9i1mwdUQu94uY=
X-Received: by 2002:a05:651c:b1e:b0:3a5:f041:d7c9 with SMTP id
 38308e7fff4ca-3a63c2fbe45mr4361511fa.22.1790243494487; Thu, 24 Sep 2026
 02:51:34 -0700 (PDT)
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 02:51:33 -0700
Received: from 44278815321 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 24 Sep 2026 02:51:33 -0700
In-Reply-To: <arKx__kOPe4B5gDW@agluck-desk3>
References: <arKx__kOPe4B5gDW@agluck-desk3>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
X-Original-From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Date: Thu, 24 Sep 2026 02:51:33 -0700
X-Gm-Features: AclHuK8hLnUXrqZJavVwd1RFJSGYNAQLudfmbLvNFp-j_eu9SV3bDABt6ZKV-Fg
Message-ID: <CACnXVne=bK9sESdsFS6kbtYJuirqFoqTckuSjJuk0NYyByLM7Q@mail.gmail.com>
Subject: Re: Resctrl and I/O
To: "Luck, Tony" <tony.luck@intel.com>, alex@ghiti.fr, fustini@kernel.org, 
	aou@eecs.berkeley.edu, babu.moger@amd.com, baolin.wang@linux.alibaba.com, 
	ben.horgan@arm.com, corbet@lwn.net, cuiyunhui@bytedance.com, 
	Dave.Martin@arm.com, james.morse@arm.com, jgg@ziepe.ca, joro@8bytes.org, 
	kevin.tian@intel.com, palmer@dabbelt.com, pjw@kernel.org, 
	reinette.chatre@intel.com, robin.murphy@arm.com, shuah@kernel.org, 
	tomasz.jeznach@linux.dev, wangzhou1@hisilicon.com, will@kernel.org, 
	xiaqinxin@huawei.com, yuanzhu@bytedance.com, zengheng4@huawei.com
Cc: x86@kernel.org, iommu@lists.linux.dev, linuxarm@huawei.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

On 9/23/26 12:51 AM, Luck, Tony wrote:
> Patches for ARM[1] and RISC-V[2] are both at RFC status.
>
> They appear to be based on similar h/w capabilities where architecture
> specific tags can be added to transactions from I/O devices by the IOMMU
> servicing the device. Device enumeration is handled outside of the resctrl
> file system.
>
> ARM docs say "the device name is the one listed under /sys/kernel/iommu_groups/<id>/devices/"
>
> RISC-V says architecture specific device tokens are "devices or device groups"
>
> In both cases assignments are made with:
>
> 	# echo {device} > {group}/devices
>
> So now I'm looking at the capabilities of Intel RDT hardware. I'm ignoring
> the implementation on the Granite Rapids CPU, and looking at what is described
> in the RDT Architecture Specification[3]. Here are the highlights:
>
> 1) Enumeration is split between two ACPI tables. IRDT enumerates device groups
> and provides MMIO addresses to assign CLOSID/RMID to each group. ERDT provides
> MMIO addresses to read event counts for RMIDs and to configure cache allocation
> bit masks and memory bandwidth limits.
>
> 2) All I/O monitoring and control is with respect to I/O caches, not to the L3
> caches that legacy RDT features operate on.
>
> 3) The number of RMIDs supported for I/O is lower (maybe considearbly lower)
> than the number supported for CPU monitoring.
>
> 4) Monitoring events are I/O cache occupancy, total i/o bandwidth, and i/o miss
> bandwidth.
>
> 5) Current revision (1.4) of the specification doesn't include details of
> I/O memory bandwidth control (The "IBAD" subtable of ERDT is reserved for this).
>
>
> Fitting this into resctrl
> -------------------------
>
> RISC-V description of "architecture specific device tokens" sounds great.
> I'll have to find some ares of /sys to provide the mapping of tokens to
> "device groups". There's no association with IOMMUs, so this will be some
> other path in /sys. Perhaps under /sys/firmware/acpi since the data comes
> from ACPI IRDT table.
>
> Need an info file to tell users the format and source for device tokens.
>
> I'd like to avoid limiting resctrl monitoring of CPU activity due to the small
> number of I/O RMIDs. Perhaps don't include a "devices" file or mon_data/{i/o
> events} files in resctrl group directories when rdtgroup::mon::rmid >=
> num_io_rmids? But that feels clumsy.
>
> Domains are based on I/O L3 cache instances. So a new rdt_resource with
> new line in the schemata file for IOL3 cache masks per domain. In the
> future when there are I/O MBA controls, new line(s) for those too.

Thanks for the feedback and the detailed discussion.

I have been occupied with some other work recently and have not had
enough time to follow all the replies closely. I will catch up on the
discussion and take the feedback into account before posting the next
version of the RISC-V patchset.

Thanks again for all the comments and suggestions.

>
> -Tony
>
>
> [1] https://lore.kernel.org/linux-iommu/20260901140802.1215508-1-xiaqinxin@huawei.com/
> [2] https://lore.kernel.org/lkml/20260714130657.46963-1-zhangzhanpeng.jasper@bytedance.com/
> [3] Linked from the bottom of https://www.intel.com/sdm under "Related Specifications", or
> direct link: https://cdrdv2.intel.com/v1/dl/getContent/789566?erpm_id=1158389_ts1790091453223


Best regards,
Zhanpeng

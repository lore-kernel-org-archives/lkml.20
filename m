Received: from mta1.migadu.com (out-24.mta1.migadu.com [95.215.58.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8C55947F1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788907399; cv=none; b=dzEZRS8JFTRDB2EngfxrWR9ggYFL2+KuwX2zwAL5DZ/UDo4YrMulZDCw6P5k6YFZdT6Pt+Tutkbd7JBvLmdXinDR+QmJiP0NS3j7PSjMdN4c9NszlxSpeZfRAe+2WQiAgKx6nqYLDqHph31aG4gnwjOW+q1/uuWB19bMG/dzOKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788907399; c=relaxed/simple;
	bh=1aEK9JH0KAYLycRwGTjlyXIKWppvN4MuQOuaWrOw0Fk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=mSq8WDdSziFXLhN5aqbAvEVPaWygkhDtsIvtQCVwXWXWgWMF3CTB8+6ZilIMKrtW29nEbPjl3m95qL0kR2oYW0/nkC57skZMZsz/UujbV89uCXzWTbUfEVSiqy6ooDnL1D3TVP46FY9AsPJuAPyQ/+81UQ7ScEtheKXzk+OOSDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=tsC1cYhb; arc=none smtp.client-ip=95.215.58.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="tsC1cYhb"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1aEK9JH0KAYLycRwGTjlyXIKWppvN4MuQOuaWrOw0Fk=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788907386; v=1; x=1789512186;
 b=tsC1cYhb+7HI4oLcFoAo85DjvzY0BY4yguxYrvh87H7h06ClY5TWwyiii0AoqN1NePr1WbNG
 xvdmL+Z1NgtnfaXhf1EPsPUTCbOu38t05Yz1ZIUPPd4xesQ+pCSWv4kqq/Ml9C+FCf56BFHGtZl
 mG7VEeM3Q608jxDNMfanttMwXV9iTnxtW6pM/naOljawBQiS2x1Y17M8XZ2u6aAuUXCNr+/FdYo
 tof9nnvpjtl4Rx1fUpyxFJjYW4u61ZXLAEnJTyd2syFy+d24JiShRkePTvTxUbsetIJ0UuNjR0g
 XSU6f55jmD04bllFghvw+tBjf6WJr7mZZvAXazSJWZecA==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 58c3b349da017f56;
	Tue, 08 Sep 2026 22:43:06 +0000
X-Mizu-Trace-ID: 58c3b349da017f56
X-Migadu-Flow: FLOW_OUT
Message-ID: <f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool>
Date: Tue, 8 Sep 2026 19:43:02 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
From: Val Packett <val@packett.cool>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
 <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
Content-Language: en-US
In-Reply-To: <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/8/26 7:33 PM, Val Packett wrote:
>
> On 7/23/26 7:54 AM, Krishna Kurapati wrote:
>> DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
>> If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
>> exit is done only when roothub is being destroyed. Due to this, during
>> system suspend in host mode, although phy_exit is done by DWC3 core, the
>> init_count on phy is never down to zero since HCD core also did an init.
>> consequently causing phy's exit routine to not be called. Hence, add
>> support to skip phy management by USB core.
>>
>> Some Exynos platforms still do rely on USB core for phy_calibrate calls,
>> hence disable USB core management for Qualcomm platforms only.
>>
>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>> ---
>> Link to PHY calibrate handling for Exynos platforms:
>> https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/ 
>>
>
> Hi,
>
> this was merged into -next a few days ago, and I'm seeing warnings on 
> boot now:
>
> [    0.613188] sysfs: cannot create duplicate filename 
> '/devices/platform/soc@0/a800000.usb/software_node'
> [    0.613195] CPU: 10 UID: 0 PID: 93 Comm: kworker/u49:0 Tainted: G  
>       W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
> [    0.613197] Tainted: [W]=WARN
> [    0.613198] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
> 2.13.0 09/19/2025
> [    0.613199] Workqueue: events_unbound deferred_probe_work_func
> [    0.613206] Call trace:
> [..]
> [    0.613226]  device_create_managed_software_node+0xe8/0x108
> [    0.613227]  dwc3_qcom_probe+0x5a4/0x7b0
>
> There is indeed already a software node being created in the shared 
> dwc3 core code.
>
> Could there be any other consequences than a duplicate sysfs path?
>
Answering my own question: even worse messages when the controller 
switches to gadget mode (which happens even with chargers when DRD is 
enabled)

[    5.620951] refcount_t: underflow; use-after-free.
[    5.620957] WARNING: lib/refcount.c:28 at 
refcount_warn_saturate+0xd8/0x140, CPU#2: kworker/2:1/98
[    5.621075] CPU: 2 UID: 0 PID: 98 Comm: kworker/2:1 Tainted: G       
W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
[    5.621077] Tainted: [W]=WARN
[    5.621078] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[    5.621079] Workqueue: events_freezable __dwc3_set_mode
[..]
[    5.621114] Call trace:
[    5.621115]  refcount_warn_saturate+0xd8/0x140 (P)
[    5.621117]  kobject_put+0x11c/0x230
[    5.621121]  software_node_notify_remove+0xdc/0xf8
[    5.621124]  device_del+0x1dc/0x328
[    5.621126]  usb_disconnect+0x1d8/0x348
[    5.621129]  usb_remove_hcd+0x100/0x2a8
[    5.621131]  xhci_plat_remove+0x8c/0x170
[    5.621134]  platform_remove+0x28/0x40
[    5.621135]  device_release_driver_internal+0x174/0x290
[    5.621138]  device_release_driver+0x20/0x38
[    5.621140]  bus_remove_device+0x19c/0x1f8
[    5.621142]  device_del+0x1c4/0x328
[    5.621143]  platform_device_unregister+0x34/0xc0
[    5.621145]  dwc3_host_exit+0x50/0x70
[    5.621146]  __dwc3_set_mode+0xa4/0x378


[..]


[    5.644535] Unable to handle kernel paging request at virtual address 
006563697665642f
[    5.644537] Mem abort info:
[    5.644538]   ESR = 0x0000000096000004
[    5.644539]   EC = 0x25: DABT (current EL), IL = 32 bits
[    5.644540]   SET = 0, FnV = 0
[    5.644541]   EA = 0, S1PTW = 0
[    5.644542]   FSC = 0x04: level 0 translation fault
[    5.644543] Data abort info:
[    5.644543]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
[    5.644545]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
[    5.644546]   GCS = 0, Overlay = 0, DirtyBit = 0
[    5.644546] [006563697665642f] address between user and kernel 
address ranges
[    5.644548] Internal error: Oops: 0000000096000004 [#1]  SMP
[    5.644653] CPU: 2 UID: 0 PID: 98 Comm: kworker/2:1 Tainted: G       
W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
[    5.644655] Tainted: [W]=WARN
[    5.644656] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[    5.644657] Workqueue: events_freezable __dwc3_set_mode
[    5.644664] pc : __pi_strcmp+0x9c/0x140
[    5.644668] lr : software_node_property_present+0x60/0x98
[    5.644697] Call trace:
[    5.644698]  __pi_strcmp+0x9c/0x140 (P)
[    5.644700]  device_property_present+0x9c/0xc0
[    5.644703]  dwc3_gadget_init+0x230/0x7b0
[    5.644704]  __dwc3_set_mode+0x314/0x378
[    5.644707]  process_scheduled_works+0x1b8/0x538
[    5.644710]  worker_thread+0x1fc/0x2f8
[    5.644711]  kthread+0x114/0x148
[    5.644713]  ret_from_fork+0x10/0x20


> Thanks,
> ~val
>

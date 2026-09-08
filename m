Received: from mta1.migadu.com (out-137.mta1.migadu.com [95.215.58.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6060B57F73C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 22:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788906816; cv=none; b=lounaHNs8+cWrqslhzyuIPxyhF7DNGcG8z8wzhJro98hBpa3T1UAfSA6cQ+toA+SvwMt8Qb1aB2IfC178CIvjUTLE811KKB4qSP8mP6jhU7rBE+bjZkUzNxzp6LRmgpwviY7O9sDiofq2Inci6ta8URMDMdE6liFIDfdlPgOBh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788906816; c=relaxed/simple;
	bh=ggsLFN/yxhA2E+Ba5cw6K4KPDI5QBxHyAYW1tqsbF70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gH5wWUr72TtX8FGj0fKmTlh1viRkjFFC6Eg2yOdHzVOAfYfTsp7IVwQf4BSDRkXmHlS63/adNMu4g+nfJj4i4nkE/hHCufOcj/ZiqhC6vSJPCcK/8AJ4kkZqOoyFiXgAlhLGSTMHD8V10J1ZOsC6zvG/+apeyxJUmPlKMqM/wIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=dq/qYJVy; arc=none smtp.client-ip=95.215.58.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="dq/qYJVy"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ggsLFN/yxhA2E+Ba5cw6K4KPDI5QBxHyAYW1tqsbF70=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788906810; v=1; x=1789511610;
 b=dq/qYJVyZMcfMz5tank9y2VK+cncUGgSx8IFTCZYw2oZGYoxLIwti46sG2sV2qT6zAsHQJ4q
 vR1Y+hQ1k8PCvbxXASpTenaaW5DA6a/qd6KGzv+gJzzNyXD2yx7Fjwsa6SZdAdNiUYLkn6uruG0
 6+lXJiRntiUUXJo8Xtg5iUyEcMiCNdnrMji7V48d8UNTq2nb6kgzlf/tyVsctC24/S2TqwKWBUr
 JQvG9MxjOwqyLj99XRtoOXQEgpbW9GJuEUNyN2adv2KOc1My0jAlneH+KyWlWFHI6lScHv2BTke
 P4htrHez4PZcAVYmEvMOBxN8wbGVqTa6EN6uGofGONljQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3aad00baa8fbe95f;
	Tue, 08 Sep 2026 22:33:20 +0000
X-Mizu-Trace-ID: 3aad00baa8fbe95f
X-Migadu-Flow: FLOW_OUT
Message-ID: <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
Date: Tue, 8 Sep 2026 19:33:12 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 7/23/26 7:54 AM, Krishna Kurapati wrote:
> DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
> If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
> exit is done only when roothub is being destroyed. Due to this, during
> system suspend in host mode, although phy_exit is done by DWC3 core, the
> init_count on phy is never down to zero since HCD core also did an init.
> consequently causing phy's exit routine to not be called. Hence, add
> support to skip phy management by USB core.
>
> Some Exynos platforms still do rely on USB core for phy_calibrate calls,
> hence disable USB core management for Qualcomm platforms only.
>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> Link to PHY calibrate handling for Exynos platforms:
> https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/

Hi,

this was merged into -next a few days ago, and I'm seeing warnings on 
boot now:

[    0.613188] sysfs: cannot create duplicate filename 
'/devices/platform/soc@0/a800000.usb/software_node'
[    0.613195] CPU: 10 UID: 0 PID: 93 Comm: kworker/u49:0 Tainted: G    
     W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
[    0.613197] Tainted: [W]=WARN
[    0.613198] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS 
2.13.0 09/19/2025
[    0.613199] Workqueue: events_unbound deferred_probe_work_func
[    0.613206] Call trace:
[..]
[    0.613226]  device_create_managed_software_node+0xe8/0x108
[    0.613227]  dwc3_qcom_probe+0x5a4/0x7b0

There is indeed already a software node being created in the shared dwc3 
core code.

Could there be any other consequences than a duplicate sysfs path?

Maybe the property should instead be added to all qcom device trees?

Thanks,
~val


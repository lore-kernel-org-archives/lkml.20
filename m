Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F4B4A4405
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145664; cv=none; b=ojfiM60E6/kXEfcAOy8YgathQyp7S8faPAcDy//H6PkbaBLggKg/Rww8OSH8E2+/sGfPE+LZTTjKw7rQoV797u8rc0QIhzkXJuQxNePJIp7fe1TY/cbTGtRixGnNWjbZtp6W83Jx1cZVeev4SrgoY12+q9ETTplDr6rh4ej6RcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145664; c=relaxed/simple;
	bh=Sjn02a02iqFBq9bkijegriVcJ+U11n/6MxIrk61JOPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T1fdPBSUZ3RTnH3QX8TaOwG7CkK/wiz2kXVgTKTU4YOfu0aWrOlICjU5B/tB4Mj69UvPg1ledsyw4rifWbY+Mb+Vxs05llknSI1GLebq2yYn2bkChqoitMzXW3Op3XB6TKwJWLzyPttMmwb/a8tQTpl4p5EzMrhPbGl/UObYFMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IKzqf4Zb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U9HGL3Fw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IKzqf4Zb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U9HGL3Fw"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BElxvf269253
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+OtAeaEzDJWSnxc6hOwyQ/p2ysP8I4G/KmKcn6en/a4=; b=IKzqf4Zb/6oZPw+T
	m54Ls1JJUPuVADtK0cUTo8Grv8KWIbiJgjo0caehqT1gQKoUeMYHJ+QoFtOQJzHE
	Z8u57otJnS9HUvJB6oKXAYcF5P6DJ18eZwK+b3EVMxYDRe6GnZt2GUbIN8I6r/uW
	MombnOY9eQUATUBu/0l8zdJPzgq+/RgLVxYOboVlUUuXUJGTDbX91KbQjDxrKUTt
	LTXA1fA72cFX3nSCZj/SdqFE04WKItcV9uGDjtToJ90IeOd1pv6rzraXYGBTgxLM
	/KA0cXgJTLZN7NsEdDPS/9Yk16qlxFkhfOEhgE38aJ3WDNgt6qOHk020UygFBDPX
	zpNAtw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbd52up1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 16:54:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8663802b58fso1252227b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145660; x=1789750460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+OtAeaEzDJWSnxc6hOwyQ/p2ysP8I4G/KmKcn6en/a4=;
        b=U9HGL3FwHa6r3N6F8e++WclRiimTXEgD23//KWoVuUv2HuwMw+x//0FmYCi9lYS3f0
         G/j5FBfdZu+G6gxUkgMwoUjZ8xqoRN81QiuCLwnnXTXfuGVItbxFd3CJeXMiP0fAYuDg
         ARLJv9VWVY0iO0PDvP2XqB5T/+QUUajy4/HNakyegufSrjJ/vISSvmQoreu0r4EaRlmr
         35jtTXkR3S4Yl/gbY2jkiqsiJkrORk9qcZLENfPh9XFVYeM7VBgcKTnFvHU+kVeR5ICt
         P9ZrVLC5NpuzJkkHPBWJRrs7GLSm8QNwSfPayuP6rdpUfKgseh7o/lJmw0A3z2CoIvJZ
         VKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145660; x=1789750460;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OtAeaEzDJWSnxc6hOwyQ/p2ysP8I4G/KmKcn6en/a4=;
        b=sNQlLqHnxUbeA64KiqX1nC42bwYER+/Yww+TnecmEYxEjNuWFQ9vg+eb32Ilv0AVO6
         +5TOOvEm9/ZK5yc5o2+LbmhugT0CGh6G47gcrmYl0w9HFgDzXFW/4FPsa1mOut6a3KSM
         BLBEy1qZAv28A13d5XaWg2XmbiGBTxXOVuKawBmpaxN2X4J+h9oTDE2ceaoALRliGZ96
         2hwbHQU6XtpCL7zFx1xAun+Pd/asdlSHNgVV7tUtPRS50vjeu4nbGaammX6tgrdFNGzg
         v47BmoB+k311zTWslLr+2xqHDNRD+7pDSU2962+gaxRrXsAhfuEYgKBbCnu1SIXL7qHA
         nI4A==
X-Forwarded-Encrypted: i=1; AKwUvBwccNVkl61l/npeFxU8wuCEtkVn5z5KPcQ7LmHTH+9JKSQd1uLSVPzew7Y8TK+ifWmQmwkxkcp921+UES0=@vger.kernel.org
X-Gm-Message-State: AFuF++l9njlCrBqT37C0JnR9LN+FBw2B+VdvVeonh1gWMdMrXJksSv5R
	zZCOamXL/CpIe15S2h+7j/Yinn8Fog8j0ZvLmhxTpj9fdrmwkT4BamAwB8X6FL+d1RcvVwKmpSo
	otZfLpauAlB4NewN0elStVDOSHX2Lp1CNxdSiGQ1Uj3yw9evv2rKlWI+pdANVh+Hz92o=
X-Gm-Gg: AYBFou2IscYCu14r4Qo6Lf7YXBDJZqPJmERwB2K8YmiQoK8g86O5cNz8RdHrabLD7Xv
	xPuwx19ZQG+1E+2XdFiB3xltYKvazU1iCUZVukdejmwl66FTElvORuG6jWUM7gHdA/FISNJhRSV
	5dIfXe0SucIdoFXnUG9+ibo+sFv6ZSYfEdz3pfpBFmmcEoAh5/VgNxeb6MOl2ppuFZ4iwpRIf/1
	SuLIcia8BHXxY4zhc/g0VEaN8vqbvzZO/kifC7967bWxy5C7xGHKEEk3rLbsJdcK83VatHzTIOc
	MUPLzXRlBPMjEB8l3idp7lRMH/e0hVNDIQr3cq2yvAF85VnGrsFteK1GFwlDY1tS8moTaXvmbPg
	fU3NSKdr6unQOf3ZRFd/Li6NuHTOSUlbbJ1dUvmQDuX3nyYj6Q6onkqp677Gl
X-Received: by 2002:a05:6a00:2311:b0:86a:c062:8af2 with SMTP id d2e1a72fcca58-86b2e8f969fmr6340045b3a.3.1789145659801;
        Fri, 11 Sep 2026 09:54:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:2311:b0:86a:c062:8af2 with SMTP id d2e1a72fcca58-86b2e8f969fmr6339998b3a.3.1789145659042;
        Fri, 11 Sep 2026 09:54:19 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a1b827esm1404741b3a.51.2026.09.11.09.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 09:54:18 -0700 (PDT)
Message-ID: <29439f1f-f859-4c64-b7b8-a0b880cdd654@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 09:54:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com, jjohnson@kernel.org,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de>
 <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u2-Lv1d9JYzK3IXhpWrrpsAnLFUuIvwG
X-Proofpoint-ORIG-GUID: u2-Lv1d9JYzK3IXhpWrrpsAnLFUuIvwG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNiBTYWx0ZWRfXwTxyRf9WMo9K
 /4z+PYPehl7RDIYEoD2ShKK3gPqcHDBQqne+gN82KjkXBloD3cm/jxS6/cmz+IrDPGDCGyqda0c
 9uDOXq9O0QhQ/NG52hZ+tc8cruoWs8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNiBTYWx0ZWRfX1FXJdpvM+Gt0
 Z3UWESAxygG9mR9tuxH7mr8XUEM6Q2XV/I+QdKGRjXPkVvQupy0XU2qIL83coUlQyESZT3Q7IHY
 1X9kpyYV0ikDX9S+hfONath8W4qUvv10BgZWX2nWDXJnjk42w2jeOx/sjNsCgvZJHe21AjrYYzG
 vg9PgLS6hfvwLE2W19lU4kFPX3VXqOM6mrC2rIP/cS0IFz86zSql5MHeM14wzbqFXrVYsGV676s
 LSH96UsV+sXP54ywlzr3CpFICk1137AHmCrwLb9xGNyLzCY8N4secBiD3Y2U5ovPjLdddZk7clv
 Fd9z2k8NpU0YLZdP/W23KcGWhSldXqQXy9czPhdI5LR0PzDNkq8nyqSF+RunJCh+0mkIgxi97gK
 AzEmn/Hedj2cUMTnxJnS/xqh+ndt8JlMYJEA6WlqRPjtC8eYzSK0xd5zHo5wWdZPj0sgMCmfzAF
 S3Z9V83Qi+2jacq1VxQ==
X-Authority-Analysis: v=2.4 cv=db0VTnXe c=1 sm=1 tr=0 ts=6aa4323c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=m9YswNKu3YyjH8mwH4oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110236

On 9/11/2026 12:53 AM, Marek Szyprowski wrote:
> On 27.07.2026 00:19, Julius Bairaktaris wrote:
>> On IPQ8074 a firmware assert reboots the SoC:
>>
>>   Unable to handle kernel read from unreadable memory at virtual address 0
>>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
>>   lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
>>   Call trace:
>>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
>>    ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
>>    ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
>>    ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
>>    __napi_poll+0x38/0x188
>>    net_rx_action+0x120/0x2c0
>>
>> ath11k_core_reconfigure_on_crash() tears the data path down with
>> ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
>> which memsets the ring list. The DP NAPI is still running while that
>> happens, so it services a ring whose address pointer has just been
>> cleared.
>>
>> That function used to disable the interrupts first, until
>> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
>> moved the disable into ath11k_core_reset(). reset_work is only queued
>> from mhi.c and from the debugfs hw-restart handler, so AHB parts never
>> run it on a real firmware crash. Their recovery goes QMI server exit ->
>> restart_work -> ath11k_core_reconfigure_on_crash() ->
>> ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
>> anywhere along it.
>>
>> Disable them again on the crash path. The reset path has already done
>> so by the time it gets here, hence the ab->is_reset check.
>>
>> This is also why the debugfs hw-restart trigger never showed the
>> problem: it goes through ath11k_core_reset(), the one path that still
>> had the disable.
>>
>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> 
> 
> This patch landed recently in linux-next as commit f7a74e131d3f ("wifi: ath11k:
> disable interrupts during firmware crash recovery"). In my tests I found that it
> causes a regression on QCOM RB5 board during system suspend/resume cycle
> (s2idle):
> 
> 
> # time rtcwake -s10 -mmem
> rtcwake: assuming RTC uses UTC ...
> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:05:43 1970
> PM: suspend entry (s2idle)
> Filesystems sync: 0.037 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.008 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.004 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> dwc3-qcom-legacy a6f8800.usb: port-1 HS-PHY not in L2
> qcom-pcie 1c08000.pcie: Device not found
> qcom-pcie 1c10000.pcie: Device not found
> qcom-pcie 1c00000.pcie: PCIe Gen.2 x1 link up
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x4 soc_id 0xffffffff
> ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> ath11k_pci 0000:01:00.0: failed to receive control response completion, polling..
> ath11k_pci 0000:01:00.0: Service connect timeout
> ath11k_pci 0000:01:00.0: failed to connect to HTT: -110
> ath11k_pci 0000:01:00.0: failed to start core: -110
> ath11k_pci 0000:01:00.0: failed to reconfigure driver on crash recovery
> ax88179_178a 2-1.1:1.0 eth0: ax88179 - Link status is: 1
> ath11k_pci 0000:01:00.0: timeout while waiting for restart complete
> ath11k_pci 0000:01:00.0: failed to resume core: -110
> ath11k_pci 0000:01:00.0: PM: dpm_run_callback(): pci_pm_resume returns -110
> ath11k_pci 0000:01:00.0: PM: failed to resume async: error -110
> ath11k_pci 0000:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
> ath11k_pci 0000:01:00.0: failed to enable PMF QOS: (-108
> ------------[ cut here ]------------
> Hardware became unavailable upon resume. This could be a software issue prior to suspend or a hardware issue.
> WARNING: net/mac80211/util.c:1957 at ieee80211_reconfig+0x508/0x1ed0 [mac80211], CPU#0: kworker/u32:1/61
> Modules linked in: ...
> CPU: 0 UID: 0 PID: 61 Comm: kworker/u32:1 Not tainted 7.2.0+ #13652 PREEMPT
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: async async_run_entry_fn
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : ieee80211_reconfig+0x508/0x1ed0 [mac80211]
> lr : ieee80211_reconfig+0x508/0x1ed0 [mac80211]
> ..
> Call trace:
>  ieee80211_reconfig+0x508/0x1ed0 [mac80211] (P)
>  ieee80211_resume+0x4c/0x68 [mac80211]
>  wiphy_resume+0xb0/0x28c [cfg80211]
>  dpm_run_callback+0x8c/0x158
>  device_resume+0x128/0x36c
>  async_resume+0x24/0x3c
>  async_run_entry_fn+0x34/0xe0
>  process_one_work+0x24c/0x844
>  worker_thread+0x1bc/0x368
>  kthread+0x134/0x140
>  ret_from_fork+0x10/0x20
> irq event stamp: 701092
> hardirqs last  enabled at (701091): [<ffffac645b5ec938>] vprintk_store+0x3e4/0x49c
> hardirqs last disabled at (701092): [<ffffac645c7dc11c>] el1_brk64+0x20/0x60
> softirqs last  enabled at (701078): [<ffffac640ef2c358>] ath11k_htc_send+0x264/0x2f0 [ath11k]
> softirqs last disabled at (701076): [<ffffac640ef2c344>] ath11k_htc_send+0x250/0x2f0 [ath11k]
> ---[ end trace 0000000000000000 ]---
> ------------[ cut here ]------------
> WARNING: net/mac80211/driver-ops.c:41 at drv_stop+0x24c/0x264 [mac80211], CPU#0: kworker/u32:1/61
> Modules linked in: ...
> CPU: 0 UID: 0 PID: 61 Comm: kworker/u32:1 Tainted: G        W           7.2.0+ #13652 PREEMPT
> Tainted: [W]=WARN
> Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> Workqueue: async async_run_entry_fn
> pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drv_stop+0x24c/0x264 [mac80211]
> lr : drv_stop+0x23c/0x264 [mac80211]
> ...
> Call trace:
>  drv_stop+0x24c/0x264 [mac80211] (P)
>  ieee80211_stop_device+0x80/0x90 [mac80211]
>  ieee80211_do_stop+0x614/0x960 [mac80211]
>  ieee80211_stop+0x68/0xd8 [mac80211]
>  __dev_close_many+0xe0/0x224
>  netif_close_many+0x8c/0x1c0
>  netif_close+0x70/0x84
>  dev_close+0x38/0x60
>  cfg80211_shutdown_all_interfaces+0x4c/0x138 [cfg80211]
>  wiphy_resume+0xec/0x28c [cfg80211]
>  dpm_run_callback+0x8c/0x158
>  device_resume+0x128/0x36c
>  async_resume+0x24/0x3c
>  async_run_entry_fn+0x34/0xe0
>  process_one_work+0x24c/0x844
>  worker_thread+0x1bc/0x368
>  kthread+0x134/0x140
>  ret_from_fork+0x10/0x20
> irq event stamp: 701378
> hardirqs last  enabled at (701377): [<ffffac645c7f21e4>] _raw_spin_unlock_irqrestore+0x6c/0x70
> hardirqs last disabled at (701378): [<ffffac645c7dc11c>] el1_brk64+0x20/0x60
> softirqs last  enabled at (701366): [<ffffac640ed4dedc>] ieee80211_stop_device+0x2c/0x90 [mac80211]
> softirqs last disabled at (701360): [<ffffac640ed4dec8>] ieee80211_stop_device+0x18/0x90 [mac80211]
> ---[ end trace 0000000000000000 ]---
> ieee80211 phy0: PM: dpm_run_callback(): wiphy_resume [cfg80211] returns -108
> ieee80211 phy0: PM: failed to resume async: error -108
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
> 
> 
> Before that commit it worked fine:
> 
> # time rtcwake -s10 -mmem
> rtcwake: assuming RTC uses UTC ...
> rtcwake: wakeup from "mem" using /dev/rtc0 at Thu Jan  1 00:05:42 1970
> PM: suspend entry (s2idle)
> Filesystems sync: 0.042 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.005 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.003 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> dwc3-qcom-legacy a6f8800.usb: port-1 HS-PHY not in L2
> qcom-pcie 1c08000.pcie: Device not found
> qcom-pcie 1c10000.pcie: Device not found
> qcom-pcie 1c00000.pcie: PCIe Gen.2 x1 link up
> mhi mhi0: Requested to power ON
> mhi mhi0: Power on setup success
> mhi mhi0: Wait for device to enter SBL or Mission mode
> ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x4 soc_id 0xffffffff
> ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit

Baochen, can you look into this?

Thanks!
/jeff

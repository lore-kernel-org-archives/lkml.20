Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87FD3CC7CD
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025183; cv=none; b=fJreqxJWL05seKdQ/xp8JP3pVrMolYxZMB4JrvkEkKzyVaAbamD7fsYgI1Ne6bJ1p8M0pfi74sOgbpvXbMZyFR/0TXGC1Eq1p9N84EOjm7SESO1TKIBURa8hZnRc6rcQjD74BtrgWp5LSEWRMMxY1R1v+C8iGVabw6IvHR0Oha0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025183; c=relaxed/simple;
	bh=cnSWqQcASQMLKInn2lI53+JxHJe6k/AWPc/O9s1mt7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJFNSjMk+7IMTNw8g4x91V4QPmpiDTHrhCR0diTJUwlXu1dwpnLdA2kkNdxhNJiDkrDlnVBK6LI3JnzFRwvN68dvQ9Xy4nCieqTx/HOEfKtZWJmsnYt261CeeCwMIlcwBQV2NK8VgynMLAoyBPdNbTTujkqRKJj8+idqRudyIf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ggpwfu74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IQAvvt0c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ggpwfu74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IQAvvt0c"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A71WvH754772
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2DuUysS3GqngaCVO/CWJC3HZ
	jN8ot3KwdZfBElTMIEQ=; b=ggpwfu74ffMEUwo6noqYCw+MoJyWa+Vr8ZCT65yD
	nlMBH5dtYKZjIWlvNYJjDEKxTKAm1c9mc+rj8+VQ5MmYXUfuLwn3+BPmslgIY6ML
	NMLAPnZcy9D861SWcjqIBK1hYRNV16kjrAtFsZx9y+4jZQPHRyqok6uMXrMQUq5Y
	ieX7RhmcwmEFFCaIEop+zQyVapJj7gKqC4myFaOwcyPP8yZcWwwx3vR5l1B2yAFR
	+FyHJHeBvakLSRkpOqNrL5hkt1Kte6E9ccBFdZl/LDAMCPP+d35Py1+G0COQGojz
	3EUnVIiQz+1SD8g3HvNeU8E24E88D+xHajdEpGL/+C5puw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvr3ap-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:26:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso13344769a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025176; x=1789629976; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2DuUysS3GqngaCVO/CWJC3HZjN8ot3KwdZfBElTMIEQ=;
        b=IQAvvt0cimutJmy/bpLGPhGVfAfeW//U9wvcAQ0BXmbPQT5qaudf15Mr1Vhb/Qn2Zv
         un4VcxOnyCkz1l6f3riVt6YSrt9x1dYQuvm+LZJzIEZUImtcghQg3IXAWJorxdVdIsUK
         EcgxpKbxPPxJtEJDCCBPJnUdjzlKZReVPjZ/STbXnIIp5Of0s4YVyQMFkPpU8WR6dn/F
         DHuxZ12MnT5tH0InX6stWcEqr9XU3OV4cSzlJno6qJM2SIe0csA/maVsLb0vO/lXTqjY
         198JTCdCYlJJOAuCjHWB9onyVD5gWXfg8sdmr0iLitpObnYGGAWhPwvNIpDLqK0VUg6H
         jkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025176; x=1789629976;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2DuUysS3GqngaCVO/CWJC3HZjN8ot3KwdZfBElTMIEQ=;
        b=Vze5d6mb5ofpOZnETnxv0fDdTtJe306W7DNHVqJF/U6dzyCGBf94eC2rWoTkvzDkhA
         zscBTfD3B07plQVvAxLweu8Q66mxzRrKEscejcCOzf467rmw2PvbM7GLkH+baWFW6Vna
         XNh1f1zgNe4r72mjp4xvFo94XlNSdJyEiE4UYUqITJrBVTxQt5r6REQeAaE53y/pAupD
         luP1Y7C6s6Yh1LNE3IFgvyNxzNVPFs45DaeYdP+K542dkzAzShiVgyTnYIKNOG/qK4DU
         qJisLFBEW+xay4yyisz5bDzxXLpsu1lE3cfariIrV05B5ZBsIq+MrTq/wGzUXzYZ0j9u
         pP8Q==
X-Forwarded-Encrypted: i=1; AKwUvBwl9xlgrqKzhsypjYeJyKQkrdbNaqO4bYKAUtPLHVCEBDkzoL19khedcXF9Ti8ZTnoxhFUJHhymTL5HnHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nX3t3W2njKR62QWUTSuikRMY7DlvlV/0mn7BYUr7hfVcEEnc71
	ZzP6PG4+7WFjCqQJRu/SKsOEULMaMLOeh2HThi+pROLgAMEzhkWSjkWlYZADroChblCYViPOFhB
	cUMJTEkBrh9KHuzb4cQrbZ/NKQclIwAK/gUWFRmyJi6hjrGelWnxvuoIVk0RkdVzM/GY=
X-Gm-Gg: AYBFou3JJmfoUKdFzUAacAOdC8GbIBF0yCaqktsmrw3mxxJI55FMg1M+0EEm2sTMb30
	R/94p03fyBlIXPF/8aPukemJKyNnzGSHTy6ZiSuzLBObCkoVVjtHhaDjSUvqQBI1N/1lxf+ivlM
	tWAMumzmS3mokHrzMLFanD6KQnOkLzeYXbLIUMZkn4QCUvV4QOnt3qdfS9NBFHPnJ5tjNyKOmUl
	NK/FPY0ashHiNvtf8HgQdyIuY8lbVsvgUmClxtKFtVVpce7XFnPqP5Cm1Wl2IqkoFfTIQ0N+RwJ
	acBliF2vsAjyq3+qnP2+sH9SHJ1/Yts8YzUQVbbIaOmUTJWh6jdNMTttF4aON2t8RPDXpUj/kt0
	M6Tyr5RpIeMhBw/EK/sOao+XLmv7TWlTyrLWfaPzhMHA=
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39bac3c452dmr16830068a91.18.1789025175626;
        Thu, 10 Sep 2026 00:26:15 -0700 (PDT)
X-Received: by 2002:a17:90b:520e:b0:398:9be8:ea65 with SMTP id 98e67ed59e1d1-39bac3c452dmr16830014a91.18.1789025175191;
        Thu, 10 Sep 2026 00:26:15 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm60431654c88.5.2026.09.10.00.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:26:14 -0700 (PDT)
Date: Thu, 10 Sep 2026 15:26:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Val Packett <val@packett.cool>
Subject: Re: [PATCH] Revert "usb: dwc3: qcom: Add support to skip phy
 management by USB core"
Message-ID: <aqJbktGye-8KD-KZ@QCOM-aGQu4IUr3Y>
References: <20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-xhci-fixes-revert-v1-1-7cc97fa0f307@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa25b98 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=18rzLyZ0tFcJ6Np8f_0A:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3OSBTYWx0ZWRfX+X6Hg2W7McwD
 FXc5p5lPQGXCK9NR9Pd+NxkAuO0OysTSxYa/TG/5rCCmrbHtHbe/1TOZg3GoeVOREwlrTDVSsuV
 qFpV2cdZTfmB84Xq4EwEFPDPyEEAOzFcDVmcldedM5yQoNwtWrzH+NT+69FuPlufH9WKCFfbxxn
 cCI+lTKrPfTRCmP4MkmDO7G4OL7C+jxlD+UkdbsDD68k2IWsW2O1hy6DzGxVH7JIRtkndSLalpM
 fxrg23yg2DYp3n6Q8APW2EuP2zBJbrFju2IbLSR6bQuL4qvrTyaljHr2pOhpAGbDtsI7PvQb5IK
 j6HIymmlq81yuruAL9nWQDaUD/3MvhTT0O9lD1FoYrqOJEjG9dea82k247n+aOWHXL/Yc0GZT7x
 4oIASMVNeVARfla19GbjFp5oGF76+EFgCTOyQ8H2eXPxxLTC0wqcD9wUsQ/L9gnO3DxIQXsZR01
 6cV8zxfYde6Fcw4XL+g==
X-Proofpoint-ORIG-GUID: gTjkZ5t9JDOM3vP2YzxUtO21zoI_DMAM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3OSBTYWx0ZWRfX14mhnSgJDMFn
 fQ1bNR3ZP9vWJoN3CFpuKnF2h2CF9D2PlfHCizlm838z+FjPBHMgB7hVE7xoR4mqpTNVeV2fPEB
 C8EB7uNEJ2UibH3PFGurQHIYj5Ci3EQ=
X-Proofpoint-GUID: gTjkZ5t9JDOM3vP2YzxUtO21zoI_DMAM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100079

On Wed, Sep 09, 2026 at 03:19:10PM +0530, Krishna Kurapati wrote:
> This reverts commit be7b1c68cd3e4fc0f5a4e1b85696de1052f21f2f.
> 
> Commit be7b1c68cd3e ("usb: dwc3: qcom: Add support to skip phy management by USB core")
> is causing a regression on qualcomm platforms.
> 
> During role switch it tends to cause the following crash:
> 
> [    5.620951] refcount_t: underflow; use-after-free.
> [    5.621114] Call trace:
> [    5.621115]  refcount_warn_saturate+0xd8/0x140 (P)
> [    5.621117]  kobject_put+0x11c/0x230
> [    5.621121]  software_node_notify_remove+0xdc/0xf8
> [    5.621124]  device_del+0x1dc/0x328
> [    5.621126]  usb_disconnect+0x1d8/0x348
> [    5.621129]  usb_remove_hcd+0x100/0x2a8
> [    5.621131]  xhci_plat_remove+0x8c/0x170
> [    5.621134]  platform_remove+0x28/0x40
> [    5.621135]  device_release_driver_internal+0x174/0x290
> [    5.621138]  device_release_driver+0x20/0x38
> [    5.621140]  bus_remove_device+0x19c/0x1f8
> [    5.621142]  device_del+0x1c4/0x328
> [    5.621143]  platform_device_unregister+0x34/0xc0
> [    5.621145]  dwc3_host_exit+0x50/0x70
> [    5.621146]  __dwc3_set_mode+0xa4/0x378
> 
> [    5.644535] Unable to handle kernel paging request at virtual address
> [    5.644657] Workqueue: events_freezable __dwc3_set_mode
> [    5.644664] pc : __pi_strcmp+0x9c/0x140
> [    5.644668] lr : software_node_property_present+0x60/0x98
> [    5.644697] Call trace:
> [    5.644698]  __pi_strcmp+0x9c/0x140 (P)
> [    5.644700]  device_property_present+0x9c/0xc0
> [    5.644703]  dwc3_gadget_init+0x230/0x7b0
> [    5.644704]  __dwc3_set_mode+0x314/0x378
> [    5.644707]  process_scheduled_works+0x1b8/0x538
> [    5.644710]  worker_thread+0x1fc/0x2f8
> [    5.644711]  kthread+0x114/0x148
> [    5.644713]  ret_from_fork+0x10/0x20
> 
> Revert skipping of usb core phy management for Qualcomm platforms to avoid
> the above issues.
> 
> Reported-by: Val Packett <val@packett.cool>
> Closes: https://lore.kernel.org/all/f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool/
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

I'm seeing a duplicate sysfs filename issue on Nord platform. This revert
fixes it, so:

Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

[    6.412085] sysfs: cannot create duplicate filename '/devices/platform/soc@0/a400000.usb/software_node'
[    6.412088] CPU: 3 UID: 0 PID: 128 Comm: kworker/u73:3 Not tainted 7.3.0-rc2-next-20260908-00064-gde909f9bbb2a #16 PREEMPT(full)
[    6.412090] Hardware name: Qualcomm Technologies, Inc. SA8797P Ride Embedded (DT)
[    6.412091] Workqueue: events_unbound deferred_probe_work_func
[    6.412098] Call trace:
[    6.412099]  show_stack+0x18/0x24 (C)
[    6.412103]  dump_stack_lvl+0x74/0x8c
[    6.412107]  dump_stack+0x18/0x24
[    6.412109]  sysfs_warn_dup+0x64/0x80
[    6.412112]  sysfs_do_create_link_sd+0xf0/0xf8
[    6.412114]  sysfs_create_link+0x20/0x40
[    6.412116]  software_node_notify+0xb0/0x100
[    6.412117]  device_create_managed_software_node+0xec/0x108
[    6.412119]  dwc3_qcom_set_swnode+0x5c/0x8c
[    6.412122]  dwc3_qcom_probe+0x4d4/0x9c4
[    6.412123]  platform_probe+0x5c/0x9c
[    6.412125]  really_probe+0xbc/0x29c
[    6.412127]  __driver_probe_device+0x16c/0x19c
[    6.412129]  driver_probe_device+0x3c/0x114
[    6.412131]  __device_attach_driver+0xb8/0x118
[    6.412132]  bus_for_each_drv+0x88/0xe8
[    6.412134]  __device_attach+0xa0/0x190
[    6.412136]  device_initial_probe+0x50/0x54
[    6.412137]  bus_probe_device+0x38/0xa0
[    6.412139]  deferred_probe_work_func+0x88/0xc0
[    6.412141]  process_one_work+0x180/0x2dc
[    6.412143]  worker_thread+0x188/0x300
[    6.412145]  kthread+0x118/0x124
[    6.412146]  ret_from_fork+0x10/0x20

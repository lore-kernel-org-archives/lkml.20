Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A03282F1E
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789919121; cv=none; b=ne6o9xEPWMdKREMwS6zqb3AdqueSvYFN0mAvq+idsXYRgq3yxSNU7i3QKxjF/AaEys4zWIUKRWeV3zid+vEo4080Ycum+wYXAwTQr6p0u0Nik+OaQkGWpg/1edn5Xy/Ajz+OhVnFTBHpJozmUHqluWslPBdeLDm86LLw802dfAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789919121; c=relaxed/simple;
	bh=zz1MHKTc7NsARqFJHsfrBnJ6tSh4C8aWtpgmKt3D6XE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZmwQVhxAzvkmmozajX594orRMyp6IIWJffgx5Nb8a8UlDezCqn2kxCuBNwrjKU4JQztBIkbHz5rmCrAdaRgT0aRynl98UxLs6NpbZqM+UEKgNo9dUWIwkTo8mU1HK35xh/IxoFjLSumQapm7GqJWvISJ9fgbPIga7laPwwYvHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NVxvUlHD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q9J/J5k6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NVxvUlHD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q9J/J5k6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KF9W6c1973664
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=My68clRrXx/MNmHlXVRdG0eD
	x8s4fWWzla2e8PXOKwM=; b=NVxvUlHDTAJu7s38joeJe/i6ORZRRf1yqUtduf6s
	NrayL1PKj90En56jgmziRw6EOimbzPHMTwGqmr9KTgNt+bWsZmsKpYTzK/OW1zXa
	guxKe++Yay3IKz6SQ1Lk4gdEhWHZtzKH1+ASMaE4+EdcsR2hlIwBA7+XaSYb3K7t
	oiOaqX8aZcLpzwzr9oRLexyvkmbAHKxjoCNl1DEulrQHdpzxk0U6oAb42KMf0xvm
	572aDnQgJkQ4OAl1UvVqSxO6nVMRTrLDtl+riFrs2iiyF3Caqa4YHKyQZawysFvO
	uIFbgNyjOvcNMHKqqyHEVpMR/7w2oW222OHRQf5//VTftQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9u4ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 15:45:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-912054a1c29so33378866d6.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 08:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789919119; x=1790523919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=My68clRrXx/MNmHlXVRdG0eDx8s4fWWzla2e8PXOKwM=;
        b=Q9J/J5k6Z4SCCGmrRJjjqqE/ODlJrO/lbP0Zww8uem5PLCjSJYLMEyPuu+/kMylKhy
         3Zc6BuXEOjMTipg8jx4PRrppIBPyL+jdkI6+39OsxAwly7OCJHZmvZuaj7q3asjXsbhl
         OFMTs0WJ7HzywV9/bslVSfzp+HImeIfX66ScCo4RSJwnQNW1SJplVkvCeoRb5CURUHf9
         SwsP7fS5h/7ng05X7tknaIdeAYAcZlEa8s9qjrBGMTdBcD2ngtJfheqIRmUCoO5echaG
         R+1QVOgGb0NTBOVDXANUevp5hkIAKFuwIOiYf/X84mqf7CQGF3fpZdE9XqYHCabfc4lW
         SLfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789919119; x=1790523919;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=My68clRrXx/MNmHlXVRdG0eDx8s4fWWzla2e8PXOKwM=;
        b=0/v604d5MuQG1dbwWE6Vuvnhpl2uttLczaQH0lnZKyuURa7vpyFCpvpDod247xw0Y3
         JeJr97a3ICQ/qXXCngRoOojEh8wahtvjrkyedLvafugLhXsgvqMOQNDO4oDZHs7+IXP7
         2dirgWYxpYAuzXu7mN0xyVcFssI7PUm2DMGXxzF6YEMLPgSCe6E9dm7QZEWSmDGqg7c3
         BPt6819Lh5zQxujsCe5MUHRM02GFU+vQcV6jjcl8bVhgWWvdmL4cb6j4rgYYa0dxXAF1
         AhDrTalkD8CJ3Qi2rb8Vy9tv6Tiszk4grlKvRN7zeHvST8TSrbRFrllqJ1HTdFv8MMG8
         6Odg==
X-Forwarded-Encrypted: i=1; AKwUvBy6tKVm/Ir49+J7JIXY5vAjYLb1s+pSxbh2L/gOynQoIFp/xauQnM4q+ejC8xUdNZmQUYqrzIHtpv4Q0xA=@vger.kernel.org
X-Gm-Message-State: AFuF++kroEkntNj3HVYdCLxVTGqP++wGKUq2/OdDHGrYnfKZSzKedK9M
	bkbbIpDgcOHOpAjlCmOBTES/67xJmz0uXTnSXzds9u5KZ5LgYMms6jp26OnTZbpt7N8qi/aMV4W
	X9KstD6er6IvjmMrjrcwmPbvBBOkbbHMsJw8DPcPibZg3MUHvgAvb5Xj/TgtGdkXqEzQ=
X-Gm-Gg: AYBFou0ne0bm2VFHgeSXZc2URZJraNPWaC6TmiyIriwbYQS3nG1ArDeA7nlx8fKJJYE
	Te9TejZ7olmPUBjR3O4Y2MQHCbaG+vZr/LzQW1qASdsDWv4wiIxm9nkeFu0eXmVoqRGqIuzCMeF
	V3lm1ksSpN5zAVSFw/DnzzsiUyiNvsvSY7CRzPOHAUMIvlk0cdg1Z1l2uTRojndBgEb8q9enfOx
	perex2pNspYH5Ga2O8BAiztm4Oxdl8tdnDt2hLgp1RvBfJOMCQIyE8jWw7wyGWtd7bvXywQe7bg
	JVpMxvbWEuS9Yg+X/4WaGsAeAJZv8Odkq4M4D0gb1TZltH4Mgpay+jhgjmb4kgh/AGTGohlmhX5
	awfEcvGzZLS7pU+k7ObukYhMwt9/3UYcYCNYQu+YMBD0OW9/a47qxZ0bZ/2UXCXT2WaXAtsHVeu
	j09E7DrJZJXW4E
X-Received: by 2002:a05:620a:2604:b0:93b:6113:21c with SMTP id af79cd13be357-93bf5523de4mr582300585a.10.1789919118654;
        Sun, 20 Sep 2026 08:45:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2604:b0:93b:6113:21c with SMTP id af79cd13be357-93bf5523de4mr582297185a.10.1789919118186;
        Sun, 20 Sep 2026 08:45:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8c7944a8csm1284909e87.37.2026.09.20.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:45:15 -0700 (PDT)
Date: Sun, 20 Sep 2026 18:45:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode set during bootup
Message-ID: <nafsznahnfbnyza3w2cchxmv3qf4st6pxfaompntximnacjqbh@s5f5armjuhbp>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
 <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: l73wARJrVH4GYSMDnl-KXV_Z24K4hclO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIzMCBTYWx0ZWRfX29OsVhscxHVp
 3oWpNGRbxmE3O8YvaJExoDlaJUNUSkU1MM0eDsBJG7D87soMt4rCjlDqLpS5pLDq8iGc6a23h8q
 bIWCZF/9ZHepH1CHSEQw5BAHpaQn/iYwn/ExaLHaNfJzpQFuhCtsgzXLYehfYxWguSuX+74ikV2
 EOiQFw8QWnHd6OFFRIZ8Scb2GJwTAuaUpfMNnGOJi9buLk1MgXEHn1mQZ6cN0aALeY5Ia/Z+EXJ
 /PA0XT1hlQonkd2hYwNeJl9D+z5c5XNZVjyuyDVUcHEy2cj97wb8TS5NreEMsBXT9rgYQPqt+/e
 OcZMLQsZifQBBgabDTO/B4Q9FEoGbo4Qvd3Gbqgg7T4v5Pw+5bfy1iT/9KHKTUZqV2VZEjBs04y
 nZo2LHxgszGWTMXpEOAhypfJvkpQx3Jlb4SpU/juF6zXD70S9aJTrYzHSP+7dhLjtQz6aGRiyb6
 A5GTnfBMrvV2QmNL1ag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIzMCBTYWx0ZWRfXzdXVsjtJ1vay
 C36NjqVQEBmCpanYG1zDGAkhhYifgOCpJWFtJCzDlp+LiarPmLvIDVEIeJOMoVNs19vNngq3iq1
 D8/wBfLzSq2pqBhU93RwDL3bfpZHjFw=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6aafff8f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=hjNyUS9LjWa9GQz47YsA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: l73wARJrVH4GYSMDnl-KXV_Z24K4hclO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200230

On Tue, Sep 01, 2026 at 11:49:42AM +0200, Konrad Dybcio wrote:
> On 8/1/26 10:00 AM, Kamal Wadhwa wrote:
> > Currently, during regulator registration, regulator framework sends an
> > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > happens because in current design, we do not have a way to readback the
> > voltage settings that was set during the bootloader stage.
> > 
> > Fix this by using the rpmh_read() API to read the regulator voltage
> > settings done during boot and make it available to regulator framework
> > from the very first read after the bootup.
> > 
> > Also use this API to read the mode/bypass settings as well. This will
> > provide the regulator framework a sense of the initial settings done by
> > bootloader and thus preventing any redundant writes for any setting post
> > bootup incase the same setting was already applied during bootup.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
> 
> SC8180X Primus hangs with this patch applied and so does SM8150 HDK.

[    4.015947] cpu cpu0: EM: created perf domain
[   14.216480] qcom-rpmh-regulator 18200000.rsc:regulators-1: failed to read VOLTAGE ret = -110
[   14.216731] ------------[ cut here ]------------
[   14.225298] ldo1: Setting 1800000-1800000uV
[   14.230090] WARNING: drivers/soc/qcom/rpmh.c:441 at rpmh_write_batch+0x190/0x2b0, CPU#3: sugov:0/113
[   14.230135] Modules linked in:
[   14.247173] CPU: 3 UID: 0 PID: 113 Comm: sugov:0 Not tainted 7.3.0-rc3-next-20260918-g7afa080bdfc7 #5098 PREEMPT 
[   14.257742] Hardware name: Qualcomm Technologies, Inc. SM8150 HDK (DT)
[   14.264472] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   14.271648] pc : rpmh_write_batch+0x190/0x2b0
[   14.276164] lr : rpmh_write_batch+0x188/0x2b0
[   14.280679] sp : ffff80008180b740
[...]
[   14.357986] Call trace:
[   14.360529]  rpmh_write_batch+0x190/0x2b0 (P)
[   14.365051]  qcom_icc_bcm_voter_commit+0x33c/0x500
[   14.370016]  qcom_icc_set+0x20/0x34
[   14.373642]  apply_constraints+0x78/0xbc
[   14.377710]  icc_set_bw+0x22c/0x480
[   14.381337]  _set_opp_bw+0x50/0xe0
[   14.384879]  _set_opp+0xd0/0x5fc
[   14.388244]  dev_pm_opp_set_opp+0x70/0xfc
[   14.392401]  qcom_cpufreq_hw_target_index+0x10c/0x120
[   14.397629]  __cpufreq_driver_target+0x1f0/0x388
[   14.402411]  sugov_work+0x58/0x80
[   14.405865]  kthread_worker_fn+0xd8/0x4f0
[   14.410025]  kthread+0x134/0x140
[   14.413388]  ret_from_fork+0x10/0x20
[   14.417106] irq event stamp: 40
[   14.420365] hardirqs last  enabled at (39): [<ffffbf371a8ff250>] _raw_spin_unlock_irq+0x30/0x64
[   14.429336] hardirqs last disabled at (40): [<ffffbf371a8e8a80>] el1_brk64+0x20/0x60
[   14.437324] softirqs last  enabled at (0): [<ffffbf37196e8008>] copy_process+0x8a8/0x1e64
[   14.445758] softirqs last disabled at (0): [<0000000000000000>] 0x0
[   14.452243] ---[ end trace 0000000000000000 ]---
[   14.457163] Error sending AMC RPMH requests (-110)


> 
> Interestingly, SDM845 DB845c doesn't

Neither does SDM845 HDK.

> 
> I think we may need to opt some platforms out of this..

Would you send a patch or should I?

-- 
With best wishes
Dmitry

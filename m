Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE903446C06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 11:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788433938; cv=none; b=og0X1mIv36gvmDhEwroUA99ppU32VD4x0YRQephEFSR+W9CiGbT120BqB0+QfbuaJHys0d7P4kSm4nUv5S38K8hcAAo+aJrawTn/Sa7MLoptvjKfddRMVAZroq3K71sir18JPG7t0KsyAquDWgAe5BixtHpNRU671tumdXocsLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788433938; c=relaxed/simple;
	bh=6e9pQsXZZQk4BKW/6pEfyREJ9Gd3PYVS4aqYk25zbZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JqWT9teRyQ9Q0AF/Monnt2g6AgyQKa3Ixt8gRkSITGMx4WkWZ20wMFqzBS+duzPEn+zKt0x/IihOG8f6gq+hevNhUaZQ27wbRWeQnoPeWBMk8UqATPAvC0E7hNnK68Jlk8BL3T2OcUmy66P6d0vayG7/dKkH2CfQZEQpS5NcmBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJXVP97H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYjhUylJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJXVP97H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYjhUylJ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHKYF055412
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 11:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=; b=LJXVP97HayG1Dv7C
	jQEPU0vh6xtXnb6/P1FBhjS0Fqw74DGzxDyaQ66EdZCaN9TeqcDlPaQyFyXQgqvB
	4qOi8wsjiDTEN6bemi4S8mCZ3k11WwOb+8Zq4Spg/ug9C8Gp9KZ9iK6jea2/1Cg8
	MVAx/KxFPSwWHTrnYldy7VnQq99mww3l7v4awnNm1tH3uOChwS526ZStTjg+/2dt
	k7e9DsRB8Y+3a6djKdubpGFBwbHCIwTziV6Qo3xVbBdvSwd2zzg2GyWq0b949yQf
	P7UnC038QumCkqvlm0SgELGkX/4iL5fA4THrrtQIibSNR5Vp5/mVVW49bwcUsX5U
	7yYZFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdvm45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 11:12:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso2599332a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433933; x=1789038733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=;
        b=HYjhUylJKfLv4jMco6yDIQ1iOtfdz6RRTQBreaSMDpng/SGft/cz+QL9EA7XYQ3vwN
         oHoZi/mU7JSOsOc3HrXytlrSloFQtZAEW2638fIHNX1EY5w6wkcI1KHKjfJvxNYU2wgT
         2orMOcRAJ178P+dbQotxSJWygzo2J3rpFNHbQiPbSQt1oXyJddPrwd4+E25jTXq3Gkw8
         H39y1QeavdHyIvJg53FIO8OCxFb+JuszIhuOmhZv7bjvREBAVEx4/9uIouc0Hu5+ZQ3b
         MBq1E77bgxzzrn/ExNdCMRdzpGKu/Tkc8lvfVyk9TZyH9ZU7Q4maxdRBwYd+DXTLcG5I
         olIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433933; x=1789038733;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=;
        b=lNJigmE8AJZIfZsGpPgTpWxLrGNsYd36/T6sBAjXRiUjBxZwNl7ISjFSilegcRVVk+
         S+6wp/CdXaNHcZlIaxiComY5UPC5t2VF4eEUii5YguT5ZwGrcYl8sz+l78MDDAd3Ixiy
         TsghgwpTTrJ4wepjN+g01XTtcA3cAp01gpEvhhoLxIdXcokh2B3kKTSXVYom3moo3YMu
         /Bafz1IUPBON8w0+ilTJlFG8qvvV1OBp2A2qGiaFhMjg+gHqnZ3iki44OSkVvB0RHUeS
         uwlkEBEZJCXX9bdhIMF/FHze+UBlrpGwQmfxPGCUTJTAiqTk4VMhQoxF3TmHfyiwRnm3
         rxSA==
X-Forwarded-Encrypted: i=1; AKwUvBxos83xCMle2Cm5/1ZqGFgxdGwuNAPQjtzbkqOLnIErdH+AVUra7BfKsTO9vVOO4g6dCmUVoI8gxPkIH6M=@vger.kernel.org
X-Gm-Message-State: AFuF++nO10mXYFVs6cM9AM/ia27hP4zcO9Eb24QaxPY4bYtq1nbR4XeA
	QKN/zcc9Dpc0OppGAzsoi2QTcKL8lTsxLwDMCf5CYNwW94u4EHzwbT707nxoXnExbShwOMWUXmg
	eNKOEw/b53by237LZdQpoIKBsK4KT7ax6JIjhJqAIKNimvxfcjzzrmyL43Vp/RIVM45A=
X-Gm-Gg: AYBFou0q6t7hfhSfb4y8VuKbyqfVU9OeKgIHWwwqn1XfrMZRmy38pi3I/f0KlVgfxyz
	tveHbh58AkIwEzxwYHhpTHTuZa8CXYqHRZTZuyhIzpYBF4ItjyqHPGBPcI5QvFyjV4apmIUOgyG
	TKb1wSZX30Rq3YDyFF2S2/pzNKHSu8I/3bJ/BpGE43Bvd1VLbqFmSBc6KrGtPBr6635GlThDc6p
	A8V9aeDlWtRbCHQ1DaOkU6Z6F2jzz2UguOBWiac6DtL1Lajkk0nbcVSIVwm2EnLN6R8QAlAiVnR
	byz+h7CgI5JWLPk4uZtjCaIzV/kYsatYM2sMJ2hoqXn2bCrw1DmtEYQvL41eZ5MHDNNrLILxpxj
	wM6HSc55uSdOFSBNQDJw/kP2S8O9uL72CYzA1ZULUqZe7FKgAIXHaeh9MU+Jxm5bigfd0IEfkNT
	Y=
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr19020411a91.18.1788433933520;
        Thu, 03 Sep 2026 04:12:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr19020280a91.18.1788433932942;
        Thu, 03 Sep 2026 04:12:12 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm4905284a91.13.2026.09.03.04.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:12:12 -0700 (PDT)
Message-ID: <60b12a54-e930-44d6-854c-0d76eabc50af@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 19:12:07 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM
 domains
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a99560e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QURvCu9eW4BULfhiHY0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: e9EwCgEcQyaHB_vJWvjyyknokUNdKu-Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfXxCyc/Xa9ueuP
 zgGGjUlYv8+6tKNFrydvx2C5TJlGvAUhWZHVR9F/WfMRKwn/3rYG2O1dog1cNeMnEe/1UuoeeCD
 Tl7nTHafUaqoSWNYIBwAi+f8GYDUKkOrV4Ph8q2spnfvUaDnURJjWrs9/MtNyJfxvdYkM8qSgCd
 afbrswMUXy2M81O2V/YrWhF9eWr91vr6JN8ykNMR0huzif3ys9dK3Di66t7CRCYHP1fWYTnko3L
 u5rnsOuLoS43EaXbUJWFsUQP2iLDyaOW0XQbXgPMC4MNeLBOBD7pcOU9f76ETn32d5Me/xsV+4c
 x5xYsmh4teKGJdsACp+zdMMWWHcNyxA4/ehB4GtlExVpeBhCfPTnrpO9/kvsiAK0gyN9omi8rsT
 P1Ntf9Nl61Q2Vz8iXUfl6RbOPzrJkebcUsSEZVaS6uQaYkuVYtWwdkt0KygD85IaWcMGsvTtgYp
 6E6hrUGmZodlJzJ26ng==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfX0NHRN0QX0ClT
 hGPPH1Z46ivrdfeBmUa9gMJB+hV6By3o6vcijLSDRuQNWjRCRyVz7btB/AVMP1J4LTU6C0cB1eF
 3qci1kTevNd332XcPXeyAiMKnK2ymYI=
X-Proofpoint-ORIG-GUID: e9EwCgEcQyaHB_vJWvjyyknokUNdKu-Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030097

Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

On 9/1/2026 7:14 PM, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> This series fixes a couple of different, but highly related problems, when
> dealing with CPU PM domains. More details are available in the commit messages
> for each patch.
> 
> Note that, this series is a follow up to fix problems that have been pointed
> out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
> components for the arm coresight subsystem.
> 
> Changes in v2:
> 	- Dropped the RFC.
> 	- See updates in the changelog for each patch.
> 
> Kind regards
> Uffe
> 
> [1]
> [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
> https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r
> 
> 
> Ulf Hansson (5):
>   pmdomain: core: Rename genpd_status_on()
>   pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
>     on
>   pmdomain: core: Add a genpd config to support unknown initial status
>   cpuidle: psci: Initialize the PM domains in powered off state for OSI
>   cpuidle: psci: Move initialization a bit earlier in the boot sequence
> 
>  drivers/cpuidle/cpuidle-psci-domain.c |   5 +-
>  drivers/cpuidle/cpuidle-psci.c        |   2 +-
>  drivers/pmdomain/core.c               | 111 +++++++++++++++++++++-----
>  include/linux/pm_domain.h             |   9 +++
>  4 files changed, 106 insertions(+), 21 deletions(-)
> 


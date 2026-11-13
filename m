Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592081;
	b=Y/sjWsV0XJxWZoIwDsJHvGAi3IJ5WrfY7zeDfpJh8KsMvCIw7IfgtwpVBEMzynJIXlAy
	 jFIN1gUP2FsqH0q3VQVBIw1VRh8neYgFfKIt1EVd30ixY9zCmioVZNPOls73p1lSlM523
	 vER0qs0NvdWzdRqIYtoVY39VFUR0dBKLtqggGw1F++aPXrV4VIKjjFeUY1OH0KQ/r6XP4
	 5q4QlKwR2Tuj1ioKS5tEH2JbyHKvnGkMSHnekaRrd2uLfMKKq5ql4oADXpdYvexcN1oXS
	 OIMZvJmHabvzETRA/v27Jy8yXmnHsBkh32+CpXo78np4X5hgGDaNqTiMh9AuEaMJlMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592081;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
	b=IukwP1c98YmkGH7qZbetU2wars/IFeKtAt6K3XHIBAot+hUx+xCRgczemeeO96p19Vqv
	 aOghcJw0tLrroap+30SQlB3g3ZojlwT98/f9yLpEuDdrMpZg7YsM4ekWihJHWK36o46ja
	 K3y/hpZABH5W0F1q4pK2zg64BEfea5fza3PF6Ekqj7cWwcdsd1Sojpg3LMJzFR+SYHm6v
	 Itze1Gt8JmZmvN3p41Ds/BcfpJmqMs8pbUOZSLL64bn3GsGrEjYpjEjbH7zlQQh4sejEi
	 3Vutb5k09FYhaqjn5sDtq36RtDDHAhUa0irDw+DJkXXDTENH5FUqGWLcrbEsAmgowsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ4DHfbe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0EVrriA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756F4606B216
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756F4606B216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UQ4DHfbe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M0EVrriA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFRcvk1012697
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=; b=UQ4DHfbertQuo5VT
	BxZj/K3jFfBkDAEPaBojSwCJlYcpw0G6QfBFjSlmE405V072a1GFuXhx8dps8MTB
	PbAh5uclUv2E06ayHhKY6ehgB6UBp0kwIZRflEYqwcxwiMFnSMAIIOwuCRs+3mcV
	9/R3tv6iYbO5t1kNJqzLWaCgSa3tLnlGYL5h62t3ykUdrRGrzyTHjKD+uh9r+mU/
	dG7krFlKScrfjGx6wBxff0KT4Kx/zjlWQV/hOIO5rtO5WMUk9C8QjZUzUFJHZn17
	bKQxk852B8nReDUO/HbMi2QDzzqbA2+LM6+bp+UKsj/gZbhOEDrafN70tJHAHqpo
	jfn6HA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwkfdm9sc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so1401919a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592080; cv=none;
        d=google.com; s=arc-20260327;
        b=HFfQfVD2Aw3064jTOCGxQL3HXFGMtWu3uv+x6DToCU//hLPGbRfg56yv/72VLba8dg
         xQMa6dkpCO0ZWfYPBMGHJaf17XfAknkjRDfRElWLXLn5LcbthWKvNm6ZK/ElaHUHM7e4
         zK5SpF8PK/k5Xe1fTFQejN0QQ2orH8yu5mSx/gsiZY6cxIGA3+7XM9kEzITAExaVUuHk
         F5FkZvv++Go+Q73mK2eTY8UUC764ln5B9lKRUc/b1iapqJaxOxpAGADv8pekyNqQBpIc
         JMnBo1w/op72EOaL9PiWtl3QfDTel+PpSo2zov1JL5ntcsS/f2HSy86sw7xDjKPH7p+a
         h39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
        fh=4VAYbxgtCSWhLbTJS+35IHXK6Z48j53WrShWR01HBEo=;
        b=rozEX6m8TMDKr0FUHjXbc6P8igoyfm85h50Vf0oN63IfivXidJ85VzityOpQWESgKS
         Nx5wOCDTptUmeP01x16OCEC9QaR0KFPjGKGTq96GHJaXzN9RJN4wXE/dy3Yld8hzwXr8
         nEnLglN5/vO3gF5eFARhnA5/PE6xEv2+1B6gU22YcRQrkWaOwPGsiSTtXpm7uYrGgk8k
         /loG2SCH2gpXozo+t/C0aY+5ozzl582teacIhVC+Gy3ZHotzMgnT3TeDWcJ/+KCiffZB
         lru3fWgn2W/6kB9JVgLnPLVyDHiesIrGhqh2MabvnACe2RDKvt+9i4IyA8pZVSzUUuu3
         xpoQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592080; x=1795196880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
        b=M0EVrriASVl4BEUn6glnS5ox3E0QgX6PjCKNlaqDj3ym8AQsQP/Gm8udCSFQt0kCw+
         ojh2802Sz7G7infVLgeh9vT+7+ibuFMUycMkc158kjYEM/38rIgRwjWNPnCOWnzREcWu
         4yFPtRBAfLdprTfsG4GWSeDrPqcB42qk2zsllrrMVSRCzfadNQzNm8NY6Uxo5Yx62IqQ
         rHqSkD5+fkB2G1ZAV19sTN8Rz/u3ykG1nYUDmSau4jUO9ED+xuDPOvfH3/a41UedMV0s
         HOkoS3b7Ll6B+QQaMQrM9/5ZkPpCYbAbad3hF/OLQtwMT56Fkx9KsC8XPxSznK/Pla70
         RYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592080; x=1795196880;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsbltrIyDurmJRrLTrle+sgoNwKMPVf5IZ0hW0N52qc=;
        b=BhiWoZk1k4zF/A6oODhoBB+mNseSC71NLrCSm+Mi0In/NlkHeCjYRbRppLg0Dm1ehf
         QfSnHOKpM+T03qu6g46E54qsd3WaWOdLL/3WfDuhPofsdgTEc3uc7buuqT5riLwMhPzs
         /a9h6k3NwtxeB5EiHOkrNGgSGe/ynAOg8NUbSvcAisO4tpD9fy5vKI2SNSNh1y7m2Go6
         Jl2e8kRlSiByK4DzHHkRIvD0fWyHFnnyDvEPZ4Nw24sXAkDLCIzuCUyVyDV7Okp5rEgX
         UqssYyR1aZoOGghxoIUnt/qMBtBkQeY2tUNB8ODAxVgAsoj8PTycjqoC468Dp6ExOMh6
         ZZCQ==
X-Forwarded-Encrypted: i=1; AL+hErH7n99nDgFDg9MtmSwOBhFAlBiiVL2IzJeTb3ZB9YhgaWUd2ePQDXFtujn/RgfPR9XEBwEdgV+c23F7tUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+J19ZUb9Rtkr9CeM++cDuu00yjJ3xn3+m20SDGAgEL9yp8kuGQ
	Z596bURzAmurIbmdF1wAc8vJ5Zj4xEnhfK3lSf+cysZAl2j/PsUyeRuTuNQDSKzqHz9TO7XCP2m
	iu5JgLpjqq62cYQKtdDSKzWMQ1oNqr1Wt3aXxpuFm4xVhqyaACDYunXk8I5MsN2+MqzjFX6eCL8
	iZsTT8VoJ4bT5iRE/CWa4BHFbpO/2GMP9N7ijAkjN1Ow==
X-Gm-Gg: AYBFou2fBn8lrpSmr7Czon1j6RV9AQ5x7m4Bal6EGbgqQCAtXfmJy9wajvZ9HXqJFeD
	2ibka3z3uqMGvyZ3gkO46CDeJMyBYYgXpDm/qaUwkZxtWrELHbq/+G66FnlYTQ2fmYaaK2FMEQJ
	Moml4Tp5BSZzN6gV13BTUtyIh+ctReDTJon9xm1xoIH2hx1j3luxFLlGYIrQ==
X-Received: by 2002:a17:90b:48ce:b0:3ae:5572:c4e2 with SMTP id 98e67ed59e1d1-3b1b0a4e8aemr2984897a91.57.1794592079844;
        Fri, 13 Nov 2026 09:47:59 -0800 (PST)
X-Received: by 2002:a17:90b:48ce:b0:3ae:5572:c4e2 with SMTP id
 98e67ed59e1d1-3b1b0a4e8aemr2984886a91.57.1794592079412; Fri, 13 Nov 2026
 09:47:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ivkwuomer5vsajf2lq6otpgxwqljkwooh3p7e5ne23j37pv22t@iluamo6gxmq3> <20260731131002.142671-1-linux@jaseg.de>
In-Reply-To: <20260731131002.142671-1-linux@jaseg.de>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:47:48 +0100
X-Gm-Features: AclHuK_ZuwtIA029trmw5F8DdkesfBzk2SXLciir6o9jwwGKO1CXPCiGSeJhXdk
Message-ID: <CAPx+jO8DKyuNMEKCHyKzw5DS62U2Xu6mcL3BtitRwrYP0gad0A@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: core: Wait for device link removals before
 dropping genpd->dev
To: =?UTF-8?Q?Jan_Sebastian_G=C3=B6tte?= <linux@jaseg.de>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Saravana Kannan <saravanak@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX8IrTqdKFcAR0
 /kvoVTb7AbRjdKH0PBk0KC1bI+9BBkCs2aburYO+cGpiaNbbXn5YI3plYw8RopvzYSiJqiTD48N
 xLUYfJQngKGaDMoN8nkTLj7oIecLcpk=
X-Proofpoint-ORIG-GUID: fguPGtqHu2LIxiej432mlSid5aHQrgum
X-Authority-Analysis: v=2.4 cv=DoTDa2/+ c=1 sm=1 tr=0 ts=6af74d50 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ShrK26NZXz4ow7qFTikA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfXwEYGOHnMsFlL
 T0LeKk/hgNGPcz+Th6KdX/a3LIVe13ZzO/Bek61gztTCZttuHKCa9RoJvUZrA1na6ydn5FWIV6Q
 NGI5kR5C2vP49ySZTBNwxRDFkUhRbftiySlgIn0SewHKfAPqoUoOPYyrCs+hSoxHOwYXKqsyNnK
 FLw05Zm7JrlosFfBhr0q4eT//ydRy424V6VPocQjNLTTWp69PSa9OZWZNLTEzlNqz0p4D4awgNR
 2ZpqB/s5pmFcfCpNZOdarvkGiSR+YlBxfFzcYH9t1J1NJ6QLzz/xKm0a29AtMhRtKSzCk5sgcMm
 tTnLUImN1yq19LVbr/lC2xMOyY4XkZUlPmyjbR8ysJXZ4VkxV2BvwGOXC0pFl3NFk0hK7nKkajN
 bviCk2hxCyMQ1Oa7JlAgQWyMelWTAVheaZpaAACwlLlmjYE/J6dIoigs+QEmnuJuPabPqAiFyTj
 wCAl02B9UzpgBtNhVDw==
X-Proofpoint-GUID: fguPGtqHu2LIxiej432mlSid5aHQrgum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

+ Loic

On Fri, Jul 31, 2026 at 3:10=E2=80=AFPM Jan Sebastian G=C3=B6tte <linux@jas=
eg.de> wrote:
>
> genpd->dev is embedded in struct generic_pm_domain and its release
> function is empty, so providers free the containing genpd with a plain
> kfree() once of_genpd_remove_last() returns, ignoring its refcount.
>
> Since genpd->dev is registered on the genpd provider bus, fw_devlink
> creates device links to it, and those are torn down asynchronously.
> Nothing made genpd_remove() wait for those teardowns, so the provider
> could free the memory backing genpd->dev while the queued workers still
> used it.
>
> This is reachable at boot on qrb2210, where the firmware rejects PC mode
> and psci_cpuidle_domain_probe() removes all the CPU PM domains before
> returning -EPROBE_DEFER. The bug is asymptomatic on defconfig, but shows
> up when enabling KASAN or INIT_ON_FREE_DEFAULT_ON. In some builds, it
> causes the kernel to crash a few hundred ms into the boot.
>
> Call device_link_wait_removal() before dropping the final reference. All
> link removal work is queued from device_del(), via
> device_links_driver_cleanup() and device_links_purge(), which precedes
> genpd_free_data(), and flush_workqueue() waits for it to complete.
>
> Assisted-by: Claude:claude-5-opus
> Fixes: 18a3a510ecfd ("pmdomain: core: Add the genpd->dev to the genpd pro=
vider bus")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jan Sebastian G=C3=B6tte <linux@jaseg.de>

I decided to apply this patch as is, for fixes! Apologize for the delay!

Let's try to come back to this and see if there is a better long term
solution, along the lines of what Saravana suggested.

@Loic, if you have time, can you please have a go and see if $subject
patch solves the problem you are seeing as well [1]?

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20261020-cpuidl-psci-fix-v1-1-d8ab9ac3b56d@oss.=
qualcomm.com/






> ---
> v2: remove this note from the commit text.
>
> Note: This patch was LLM-assisted. I reproduced the issue and tested
> this patch on hardware, and I did my best to verify it by hand. However,
> I'm far from an expert in pmdomain, so YMMV.
>
>  drivers/pmdomain/core.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 842c4169e290..4eeb980e5a40 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -2348,6 +2348,9 @@ static int genpd_alloc_data(struct generic_pm_domai=
n *genpd)
>
>  static void genpd_free_data(struct generic_pm_domain *genpd)
>  {
> +       /* Pending device link removals still reference genpd->dev. */
> +       device_link_wait_removal();
> +
>         put_device(&genpd->dev);
>         if (genpd->device_id !=3D -ENXIO)
>                 ida_free(&genpd_ida, genpd->device_id);
> --
> 2.53.0
>

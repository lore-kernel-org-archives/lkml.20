Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709EB399D10
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790664631; cv=none; b=qGvfN17EcPS+/sIrG1kijF3nCPOr4hCNEwhnojZNHmNQavCS1fM4QQk34BWv8K4eaIG7snT16VvonyXrZE/9ZTmIzIGTQFM8nr8hNglLkpZb10KGDnYJVxk2ZbrLrhY2Sjo/sLtCjSO5we/mlxi4CKEDoI8/0ePW651vdX1zuxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790664631; c=relaxed/simple;
	bh=Vb9KmSS46AwV1UlOKcFOXPSwnp8mz9y5P5c5U77AteE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EINXPBam/DwATzwQO0RTUHvx6sFBgSnIS7d34LG4uLuDnuuxyXMVYyr+WtI3DS1eBbUpgJjdXEsn3pl/nPn6hvSkxNqauOxF0qHun6GG98DMZmbHRESsHmZqaMp/zli7ftEgMdAWb7H88Wrkmwd3oldI+AcNdljOsGWRLqF645k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F3mLAdQd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gx4lID3y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F3mLAdQd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gx4lID3y"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Igr2775142
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYtusggm8SYDRGGRcK1InNqXS+JZ2BU5vx4LMQUuYXI=; b=F3mLAdQdKn3SK0XO
	lalzSfBuBnCC4M/hoMrPl+IlQk+6OnTlXLi2Jwo3OTcTcE/WP29oFMb4spF7v+vc
	sw8JcrMHwDKkzQurlMLRhiuqzbhpnQTlc3sUa3dJLa7lIC+fUp6IpJ8Woh5HU39B
	Lik++itjzMQdiVfcxXwNaOU/nsJ/DGOFC8xnah6rSFNaPKIG/utPx2q4aJEiDWn7
	pS5DaXIcAtxr8SgnkbVO/Zr0ZLNRg1KzZ6GOT9F/pIPtydebtszim9tzcLHXEnaF
	rV2GtQQHz8kKkr/Cg746WjKORydzAgHuuegzfzcOI4U9viz2rSZywGbzG6VAZOlp
	WHcgmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvw22n53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:50:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so674197285a.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790664628; x=1791269428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYtusggm8SYDRGGRcK1InNqXS+JZ2BU5vx4LMQUuYXI=;
        b=gx4lID3yHW5pe76cC2GFijQwlbyVubYaGpYjgNkN0augsIE9iHCxFzFaMG3YF8MsL9
         1NFFkAMo7G+7zoBi+//KEUE4wKQFBqqxQXouWl/bBVksMacGQCOEyqlj8ykYPQCq0Hrx
         YEwEFAEx0tcKKQGZj27Zj7q2Dv3ZNFezjaQGWJL2YqkccH3vvtEEQHrieg0foV9cAEN3
         yppxhGfKJtOzAGLYq+7vJznDCjQuY4UfyM8oqMsa7PnnTQQI3ObwrEIf+u5YfUpHZUSJ
         eiwY6WXKkJLJkhAc9JmW0LI2QVfCzBgtH5EbHC4dMvCSSB4IZg2DXA/Eae1t2pjWK78L
         u/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790664628; x=1791269428;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PYtusggm8SYDRGGRcK1InNqXS+JZ2BU5vx4LMQUuYXI=;
        b=sEty3yrQVebR7NJ5EOcQSnY/n+ajA/66RF3WJZVX1Ow73PJMjvGPlaXN1gPFLbdBCy
         QV1xUkPiWwkUScB/mq/IG3V17XgUaLeGU07TF8u8VitKCvhDGM9IXOy+2l76kbDgyEA+
         r3m4KFf6O4QHPXI6Z8Ad8TtIQACtFfipM6OLSyAhB6NPzFLkLgCTVQ4Mx3T+NErGqIqS
         3ULicDwurMeaVjD6EGq6Z+sEIX0vgRRRzAnmNdOSb7KSaYq39nSX1zc7bKl0awRcdVZx
         wi7ih0arP44ORyNd8Wa1MAKCu1/qjwadejB8/ixpA70xp/hyvaTCBWwhfwwpfEEpCs6Q
         Xmxw==
X-Forwarded-Encrypted: i=1; AKwUvBw061CYqs2ZoDFagmD05Uzd9DPbPNqIEHN5QqNt4YbCYF5h94cqHcAXQs7DTXmY/JDheyULINnPIf++1gs=@vger.kernel.org
X-Gm-Message-State: AFuF++kuNxbd2u6oEf4RMRim38OBZcVJMOeyHjxHNsUBVmlgr5W57X3t
	LgZXcsNJQOq9dP+7kzxH2EG5t/48NAF+BlXDXMkE07kTj5SIyDDefcoA6PtNeVUpkj9r8ugT/SH
	5nIAaAHdFoMqOTCNm5FDiIK+Qo6XBRqdY/VxaR4ciQ7LJjJwlMgvpJisBWzNHqliMlho=
X-Gm-Gg: AYBFou0VsaaxIuOC4RtLU7ExDBFJY1rIbmM9nHxRFuwRrI2hFAmXbP513jeYr8i3ULF
	ZikigqbMAsjSLY3RvGeD5IS8kh5c9P+bJbKbYnjlVbfohDZDzG0qJz5fGNhdOy0VhDHcKxgZfmA
	plzEcZi94GEaVQ2sn17yToCpLlXOZCtMWTcf9os/Mwy67yRFHyIGIvsQBXAjiveQdURGsG8uJ/g
	tMYJuRLgJusI77dWdLIFu1PQdVbJVWFn+VPBOJA/fNvxFihu7Ggo9KPcEMN+3bgiP/iaSFkjho2
	8A5n6JtiVZ2cAlGWLD8IvNaGCX79fH05f5NZalsdOkQx62hYLcp6PIbP3LQGn1NW3LQhuunQcuE
	8nfb4Jb4XJUh+fm65FYZuhcjLNTYD431tMQtktaBX3GAsCeioUtYBwH6LS/O3qQ==
X-Received: by 2002:a05:620a:6509:b0:93c:612e:9b4c with SMTP id af79cd13be357-93c612ead03mr1731290285a.58.1790664627800;
        Mon, 28 Sep 2026 23:50:27 -0700 (PDT)
X-Received: by 2002:a05:620a:6509:b0:93c:612e:9b4c with SMTP id af79cd13be357-93c612ead03mr1731288285a.58.1790664627297;
        Mon, 28 Sep 2026 23:50:27 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7? ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af5056b1bsm1589995f8f.17.2026.09.28.23.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:50:26 -0700 (PDT)
Message-ID: <99919a9b-a1ca-409d-babf-00d61177772f@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 08:50:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/qcom-spmi-temp-alarm: Fix temp_map
 indexing
To: djakov@kernel.org, amitk@kernel.org, thara.gopinath@gmail.com,
        rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com,
        lukasz.luba@arm.com, anjelique.melendez@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260928132823.1426513-1-djakov@kernel.org>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260928132823.1426513-1-djakov@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=N6i8hG9B c=1 sm=1 tr=0 ts=6abb5fb4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=kI6mkRwWFUva2zZDKx0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: diiUtT8pjIrxyiKx4lvoDH7C16YJigET
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX/S9JruHtd1Js
 DHe8+Qsy3qCTtdJWaemk2r5ApMN95QtWwhpMGWcI+Temog8I2hBjyvdGnWcw5Ki9BR1C6H5fjiO
 pijdpVTSuGgsqeZ/qztUz1P03KvIgiQT650IVM1PYfx0ntWH1DsU2xlzWI49snwjg0jEZEwuKYu
 SCwLhw1q3R4cu1iQTfbYTxyTS++uhRXMqEQ0EwK6rWnKrTbGJrkvwQ5BpmX7ZyhTwXbhdKmW0ql
 Q8jXAPmLRr9GZJhA45JZE6EJxxubVScxTF0O5vAoUaZFrcqXjQ/rVCKvQHuSVkTDssxH3IEoRoE
 WynmFqzFLHnczGc9BNWTiA//Scj0oJlL2WkJu4N6aiNLtXm1czobvXjxsc7fuDUYj0u9OfxUNWa
 OaGuRev5OiYTrgIQGTsNxpxNqt3AjFBaPEUrYL4wfx2EzJnT4MMACSlW68SMA8p9hnwvbWlaXjZ
 7xHqhn7ghntx2a4jeCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX23YmFVoNlH6X
 tmyp2p/eTs2iN0aW0Ayjxh243giPxyQOf/jKg4kaH6XdN/Hlf3/R25vDpxshGbyJ0MUQjou8YYG
 6mzmx6QrjPvClufNzcYZ0QXGJcaTBdw=
X-Proofpoint-GUID: diiUtT8pjIrxyiKx4lvoDH7C16YJigET
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027

On 9/28/26 15:28, djakov@kernel.org wrote:
> From: Georgi Djakov <djakov@kernel.org>
> 
> Fix the following issue noticed when booting on the db845c-dragonboard:
> 
> BUG: KASAN: global-out-of-bounds in qpnp_tm_sync_thresholds+0x11c/0x180 [qcom_spmi_temp_alarm]
> Read of size 24 at addr ffffdd2495f01200 by task (udev-worker)/371
> 
> CPU: 3 UID: 0 PID: 371 Comm: (udev-worker) Not tainted 7.3.0-rc3 #116 PREEMPT
> Hardware name: Thundercomm Dragonboard 845c (DT)
> Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0xa4/0xf4
>   print_report+0x1f4/0x5ac
>   kasan_report+0x84/0xcc
>   kasan_check_range+0xf0/0x1a4
>   memcpy+0x3c/0xa4
>   qpnp_tm_sync_thresholds+0x11c/0x180 [qcom_spmi_temp_alarm]
>   qpnp_tm_probe+0x3dc/0xae8 [qcom_spmi_temp_alarm]
>   platform_probe+0xc4/0x18c
>   really_probe+0x17c/0x4fc
>   ...
> 
> The buggy address belongs to the variable:
>   temp_map_gen1+0x60/0xc4 [qcom_spmi_temp_alarm]
> 
> It looks like temp_map is a pointer to the complete temperature map.
> Indexing it directly advances the entire map, rather than selecting a
> threshold row.
> 
> Fix this by dereferencing the temp_map before indexing it to select the
> requested threshold row.
> 
> Fixes: 703f13285a6c ("thermal/drivers/qcom-spmi-temp-alarm: Add temp alarm data struct based on HW subtype")
> Fixes: 1f835c6a4c84 ("thermal/drivers/qcom-spmi-temp-alarm: Prepare to support additional Temp Alarm subtypes")
> Signed-off-by: Georgi Djakov <djakov@kernel.org>
> ---
Applied, thanks

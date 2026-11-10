Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352724;
	b=i3bb5KJf+MnOmVFUEcp8BsHYpYEtwY/tNFxj8iFkuz6uix04snWedJzERJf15CQPn+nN
	 ZsMbu7DMYIlD5yzA6lEc3RlQ0/dmJ5UvjL9pC04M3bKIAEAyyyORJrKzEQxd+Gr5wjJyv
	 n9ca/nxuvuD5Q9IJCWEr2jztx/67IoGdv6ukvimGtbN5pYYgC3R2HYaN+cHk9skNw5ZC1
	 H/PsKhtrNl+r8UBjCE59QcWKHtPMVmVGA9lLo94+hofMJQ82MmIpRaFbzPo9vfbuZ/m67
	 utwJASeNWco06W0FicyccKpv8xkx/+X3Bg/em37j9GoCFJk0nsP/uVu8wlZtsey74Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
	b=UyIkqcg6RpUiUE4yqNbPapQayjFf/x2GuAv/J8IbP2D8LB17rbcgKe0ycnL+U3uidyPq
	 wNzGxnzJmgEG0ztEoBgEw8OF6PKQOjT6pu9snRW966FQmmUdIdyXvHEgmgijALmCOlVlf
	 QwLLidcW2PKIq7+OQuZRcR9gC1PXtsqK+FtoEABhYEPK/Pd9L6M5qSUaCoCPwyU+6W/d4
	 xkob+RbQZmq5zsfJ5g8AFyZhNswqPUYs4ZY71U8pb9s4V3w1whdKt3gkjok9/fz+sJMGb
	 qkrCQD6La9nYtsehwA/jpaOMPcildx6w5rjacX4qWmPqIVyG85DJ7cJvWQ/8LvWGbsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5ARn3aK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Q+iy/jSQ";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AA2606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8AA2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U5ARn3aK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Q+iy/jSQ
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AAMKV1P1448806
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:18:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=; b=U5ARn3aKRc/0s/xT
	AP3e7rZRyL9xmrEKJQDNOv5f2Dy1phwrmPipC2LpK25ZXhc+O7OiFH9cfPdcEmOg
	3oa/+DPEAHZEREiCESwy9fZmD7CMj5vQQvLXvS+xbLWfDmJ2EaCHy1c/3lbrtcno
	T+1RwunzOgV8WykCpRE8ZUVh9NXXxNIo/09UIOrLiO3B1s7qVkhG5uMjR3vYKH16
	Yl+5F4ccNw9XnJN8OJ76Ymbjcvjbge9dpZ/Mhj225hJiMOGn5B0vAtiYDQltKELU
	j/NhFqXvmRlfenWzP2BO2TmK74e0Tun9VfmOLhSOH8v/tLw284SnXYqSR4x+4Hz3
	NKb0Qw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwkb06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:18:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso3349711eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794352722; x=1794957522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=Q+iy/jSQ2VYCWRaZKX7F8nhaZoUKeyge5fDs7HyinTznOJ3dA10hNAlm6GUjty6pOf
         pSHIsV5a+yb8ncyIgoLL4gGkhYXCqmGPhbGgd7QwF35+cJOd0TFfYYXIAjtTZFH2cP59
         TYBkZbH/rNjpaheQt3ND4O6198boLziwmVQf74Ek55eZMKNuzkeae5EOwhU8dlYb/WgO
         BoOvJ3nYMdtnW2ycp7L3VYF7T3pfKx/86eVNUaiLD94FHlKStygPd78U4tHn472TwIK6
         TVAttQihXPSd5BdS8qrR9pRMST3hgOuMHVA3GnWCaEN+dOALsdLrvFPet5ugOG9vsNUv
         jnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352722; x=1794957522;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2B5465+J93nF6xCLEsT3nPxNqfsXSEGghlx5MhkIPjg=;
        b=jz626S2bRnv7/4dnMRtv3HqUOgWwUUtwyjN+IdRlH5DHJFMp9sV69qlfQa9ww6f0MV
         Wt+UWLEiTa4m/jnlVafYD5dW4hGfYSEiqhJEgb57m4bRC9jT5RXOgDH+F/hgZier7mjJ
         43uoLCt8U+/+ynh85wH9FT1aJbkenVRsOygGOpNrj1xJaQ+mYKZKfAjJ+iDO1V+jdELt
         z23jNi1PcDTh7PgLYvBuHF5QC4amMsowtuosVVvaBPEHPAWsix14XndZqlV3qzBeGzS/
         xpNoFC45cxPORX1DSgtyQmK4kJb3ceooLABcpaAzY7uRyldp50h0CLc84EYll2NTR/Fo
         bSKQ==
X-Gm-Message-State: APuU4Z8nVZ0j8ziOlji2KF9eYVuLIgkt5/9noIaJ/RaDRzC7bJ6QWbKY
	+BcY+eXj/wxKED4pJ9GlvXTQCAUAXrIrJnGcy4k3SHKGOcTmVUQ9RKH7Pxk192VLEGOhbYyFP+N
	QrU9+6CEml2EPuYxmHxRofIByYHtTzFHGmHZN2vp2DP/POg5mgd9tZNxoWj2Q6XpmWZI=
X-Gm-Gg: AYBFou3EcEhHjMnIziGfJ3AO2ScCohO2bFJYiBuy91G89c94JXgnXjSe4hKNRipirU1
	8MHrL9TNuNEgL5t4xC8c6zkje1x4uBZuaNG5ZIXAQkoB2D2ym/58c1HFTmqghdppzso1sOC5kOl
	1w3blEXAhk2w0nIt0Z53KjMrR1oboNK/Nt/xiBuvQ0sQxB4ENFxvJGf1lXYBpzso8hPqBjxcPYM
	6EVn3Xf6EFWDu/AQc8568a0XjKaN3kOjVFMYoUVgUgrSj3JR+/WR0/mTGxy/9gmVit4ybOigbah
	bASKfqsfOLoXrxzTUtYa0LcopHhCyCpGv6+tMaJXvTY7QBTkkCvSujNXIN0bni/cAyU+Q/i3IqK
	UkK/s1Foit3H46POieiDVcJIIlv2H/DZ/Ny1u5PlKz/WyeBHDopOUq+fkG0U/177XByAvCIb5TI
	IkhtfJsWwZu3PeXGFhFnYHFWY1MIY=
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283753eec.14.1794352722261;
        Tue, 10 Nov 2026 15:18:42 -0800 (PST)
X-Received: by 2002:a05:693c:80cd:b0:36f:202c:48 with SMTP id 5a478bee46e88-37685d728d6mr1283708eec.14.1794352721742;
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm9454656eec.8.2026.11.10.15.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:18:41 -0800 (PST)
Date: Tue, 10 Nov 2026 15:18:11 -0800
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, elif.topuz@arm.com, lukasz.luba@arm.com,
        philip.radford@arm.com, david@kernel.org, souvik.chakravarty@arm.com,
        leitao@kernel.org, kas@kernel.org, puranjay@kernel.org,
        usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v15 28/35] firmware: arm_scmi: Add un-managed methods to
 get/put protocols operations
Message-ID: <20261110151811.000001e1@oss.qualcomm.com>
In-Reply-To: <20261109091221.2532706-29-cristian.marussi@arm.com>
References: <20261109091221.2532706-1-cristian.marussi@arm.com>
	<20261109091221.2532706-29-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eQ4tffHNpqc7w53CcJF7MxexlnLDmlp9
X-Proofpoint-ORIG-GUID: eQ4tffHNpqc7w53CcJF7MxexlnLDmlp9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX6kY/4X9CIoL6
 tpQx3HpYsTWtWqgAj/zrYu2gjWH77nvr31SrOORmK9r4bRkYcCggqODbVpWL2WPU1oYckllUglu
 jVG3kxXk+i8SYDsUNjVNy/pWTzDK7rs=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af3a652 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=SRBWjgdl_vfv6kPYSD0A:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA5MiBTYWx0ZWRfX3iKxvqaH6dkB
 S4BgqwK8QJe2Q8crE8oWJsvQw4oujO7gY6U1UppG2NiWHRaim21S5Pd24PBWmiABP9zUbHTK7bp
 Q3LzgkowbF/N20VCyYpQ6wsoiXnGbXZ6GmFTHYhvGUW/uA+FKV2xI18iO0XARJXU+SOwRvSZ9nb
 3zHVDE0CyYXzlDhnE+GwVr/ty4QfXV3Wj9/ypp16YKNthaFMeIPioC0Q3GkyWEbUus3SL25t491
 9mTcrU4IxIeehsg35XiNRxR0i/Dk/nmRrv9hhpBiRJw25iXmmi03w4oWIIdjSozQT7dUsRHfGeA
 Te7Sw6TQX9bHLhCvnFdG4TsctwmSLOijey28597pS6dGK0VcWS745K3RfqKkcq3UlR622YBY9YN
 ml+p6cdzTm288Sq/zaFOxFA5wrO/kAlU6cZP+jMk0fZEAXpCglZ57njyrwrbTJnHzoFv+5MnbrJ
 p8qNr4ltFufkWvxZwLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100092

On Mon,  9 Nov 2026 09:12:14 +0000
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Add a couple of simple common methods to be able to manually get and put
> protocol operations to address situation in which devres managed methods
> cannot be used.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
I was kind of assuming you actually use this.  Where does that happen as
it's not in the obvious place (patch 30).

Jonathan


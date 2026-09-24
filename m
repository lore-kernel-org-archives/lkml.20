Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434543BE63F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243199; cv=none; b=n3ieMNpW7UruRclVVl2DbPNnw+RoTS0+0pen98gwFtzMKBzvS7WcBOw1ksWMBLdluu01AtcxT8Bok51EWVcTQC7cGQ/MNjjKRVMfNAbTqo6ZedCjFg36eh6FWnFdHz+wBqdHDmJ7DgNP5WkDQB5qAgiXqrpAJALv3Ub5M7HzNdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243199; c=relaxed/simple;
	bh=BKUDHptu/pTStIcuP/3NukT0Zd0pTYKYIbdx/fx4C1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lgSrKlSEoIjf1KxCdUNAqmcgwVRwlp8GPjVXu1utLwhU2TvDQgoJB9bk3QGygqbHfYX7TFNdprN0vK/xiYmtA7NdUoZ6oRGA27JFjnbYVRwuvRfkLjyia547xKm7+BskPdRIZe1s+XALIM9UC4qyU8GfDQAU3C32yWBSnzMkfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y46bAqj0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWpzU8ZO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y46bAqj0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWpzU8ZO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PMK32919251
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6m4Yo8FaInz+j4YxvNfbbwU2
	rN4O/h4O+OLLY3MVmc8=; b=Y46bAqj0B55P90xFi5jZ4tm3jCQgLYZwUIoqKhup
	/xr7OFr3LGS//QA6l6kITgOFHeAlRRHyA1+CkbCUYlH8JMMBGy21h/AWDEdF7qBx
	47QSwgZIMrq3x8TgJB/P4zNn4BioRhAEvjbIwBqdhwS8dejXAnAVXPrO2QtjUoe/
	PAaacbJdJ98DMXorL5+5HZR7Wxtzt9MD78PR5lJSsZRYVXnkYu7JZeVnugbX8zoV
	N3j7K+a3UYum28t/4yRoneoUMt/Efe7vQdNPS2C2WtOxt0UibAREbkXeq2ID0QRm
	tnRRCqgAH4jew62HUJV+8le2RjjmvKiOr14Lrb7XpbSEBw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstuhttf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:46:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32861f5448cso1734830eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790243183; x=1790847983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6m4Yo8FaInz+j4YxvNfbbwU2rN4O/h4O+OLLY3MVmc8=;
        b=JWpzU8ZOs5N3UomK188yAIrtU8gBkTYfVcuE04KaowI2XnWGgCrW925sk9Lda8zT33
         oT8Od3UP6BNs9LkXM4RhIv9+p2+0As4ddhnh/VUKmkCE9/BVeO5LYobU+EhVpE19+3K+
         L0ethqQjDF2SBz5nH/WRJXB6hSB/76vv6i3qK07EnPfE3cg0KucbHoHSgX/jqNfWl/Zg
         qdhvDnbNYLtxjq6zoOYBZtgktYDS7rMZ2wcvlI1yzgGvBDYGGckXgu0iZNdRabOfWhqv
         DsVjYQBkE9w8xq9dgGpOvEaKPwxgF0z2RP8mZoiysCOIJk8B/GJIKnJQxaepZYeWxVFf
         o+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243183; x=1790847983;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6m4Yo8FaInz+j4YxvNfbbwU2rN4O/h4O+OLLY3MVmc8=;
        b=xBs44YBZ1hYXoXn1XfTNxuEpfhNJEj/Cm+V3ec9MPOPESkRaip1FqnqIXURHjQZTrg
         YrMK1gIvDjxeDaL4wsoBrqvp/RDWftIzMOXDpdMrfOidooasFKHcE9hdPfRCz8KnGJnk
         kC+yjIrx+Cc6+OugRJGsjOV8BDHyfPZj1egF+bN+c0ADvT/z9quS8V21XvRTQDSGo2X6
         f2toh2P64KQ7J+E3qEyeLBB64YmB1JkybYtxw60lUCJxTTvTBvZt+DHjqroygkbL7pZa
         hRTILaGDw3gFEYs5J8XOC/qNMmLsZ00kPLYud+LWzxNaQCBpLnzssVZ9rCv0TLzuppzg
         NCVw==
X-Forwarded-Encrypted: i=1; AKwUvBzCkFj4YhH05k13VEzOh6WwAzktCcwtydnNDhulZ80cEN+mRoXT5tcwy/X+APXyjoU6S2H7a6YJF6SovD0=@vger.kernel.org
X-Gm-Message-State: AFuF++mZgw2RQ7aNXMnhqSpKlFKtbsmJKsKyoZ9tQ2ivsAA+9uOothex
	648BpBeJR2CtYksY7nPabxxyKlsB+VWZEllXDuBQJlx0Rc2WRcgHcbJPoq4gKrl0kJjH4G7IpKe
	dKK0VZrZp+vLHrC6bzCXvbrE134DXOqS8K1sVA+3F8GhRvZgKr6FOIyviDCdhabD5+zE=
X-Gm-Gg: AYBFou2A7+kx37KLYET6LbEBnL7OumwC/X63pclt2oAQudGU91MDZcJODNFSO5mZQcd
	wUd6EZOkyitW5wpgFsaqj/+Q0bbnMRB/uQP8fNjwjkfU/RzGQdpQUfTRU13LYWv+gvajdHdIR4f
	3ROoO7rkOdDpsjSfeb6IXM47SXeCW8iz4mqQZOcYRl63Tih8tryD2NkqA8rYqGZmG3iDwukEuqx
	JUDkvx6WIeut7ayvcWzugYp2u5XGEjZmOTAhGFqeXqVPfWaIh3JwvkwhayEUNXZh/XLZK2Jky2l
	uOmcUJF7eV16jnOOl8On1GOTxlEtYfIxD0hV/H6/aqVznvkXsbI+RnpUnGjaBLkL+yrMHOrvLqB
	MYGq9eGoOWSkUG6LAsLWcJBw3BgdvWbQIKpmtIW6b/Q==
X-Received: by 2002:a05:693c:66cf:10b0:33c:e9d:6d4b with SMTP id 5a478bee46e88-34003cac91emr1522062eec.41.1790243183426;
        Thu, 24 Sep 2026 02:46:23 -0700 (PDT)
X-Received: by 2002:a05:693c:66cf:10b0:33c:e9d:6d4b with SMTP id 5a478bee46e88-34003cac91emr1522039eec.41.1790243182838;
        Thu, 24 Sep 2026 02:46:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9bea11b8sm13829938eec.7.2026.09.24.02.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:46:22 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:46:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc: Fix GPLL enable register offset for Nord
 SoC
Message-ID: <arTxaIIDkomvxfWp@QCOM-aGQu4IUr3Y>
References: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nord_gcc_offset_fix-v1-1-230ffad2dae9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX6+Glhv0Dh7LS
 ThueSnvMcsuaVdJxiD1tCydtuCROGUR9nAISaQbMhtg0w1PxUguJituKgG0vksDrlxCXPSMasEm
 8YfQrARkfF28jzMH2NpXyrdW+3IaZu0=
X-Proofpoint-ORIG-GUID: rDnimYiAD5GjXgj8ZMgQFuVV4tNd-aeB
X-Proofpoint-GUID: rDnimYiAD5GjXgj8ZMgQFuVV4tNd-aeB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MCBTYWx0ZWRfX5/VISGI/eElq
 QFtGR9LHZSfMHWUdOYZiHOWocVkM2oOi+3zFH3b2Ke/umMa8VHV6N/H6bHFUmbYctInrusVEr0r
 jOizKi9ueOfspkd6E9CrO29DyXMTcy5Fwo5HGX+51lLR1h8mn7k4c40pNQem3vLws4LrynYwHwg
 JSGWNyERWjUq027P4MDNO69b4Fol3IykzgPzto2kUQ9v/g0sUdO8sgboV7+M+QPllBdBFNbtxhb
 u25FNcFhDV5zE7VVxFNjW5jMsST5iNLUGoZKEhPRQpyrMfMgVeOzZKuT/3p/XGsXLZFFMYpT+HN
 VptgyJooaUMguCC3A3CYso3xJO25dDceV08FGsX587hJChUEzU1xRPglGclRE0buxrUjV9LckXC
 TN1l2FoLHQAsDOtzW9HroaSdisahI4ATT0jrQSJ2RZuws6ngXLS+05AqACQSi7zMFwG7/A5fnRV
 LT3KAFBAtBz0FI3uWkg==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab4f170 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=7o7Fz_jXMTEYJjNRgMcA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240040

On Thu, Sep 24, 2026 at 03:09:56PM +0530, Taniya Das wrote:
> The GPLLs in the North-East, North-West and South-East global clock
> controllers on the Qualcomm Nord SoC were registered with a placeholder
> enable register offset of 0x0. As a result the shared PLL voting register
> was never programmed, leaving the PLLs' enable state uncontrolled.
> 
> Point each GPLL at its actual GPLL_ENABLE register (0x57010 for the
> North-East and South-East controllers, 0x76008 for the North-West
> controller). Each PLL continues to select its own vote bit through
> enable_mask.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

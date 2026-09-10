Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA2C395DAA
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022855; cv=none; b=oOmqDFIZsOaTlz4X24gCNibPaYQqKS0HpfHG9QcJpfuGFdVg6NnHZHmKliELiVrdSeVHu0L+mD+lnWQla1LNAGJtJjxe/DLyhSNYpNgn/GDEOXKNT3CSgudZyHcw0SUvF/r8lR/WQLsIzvAZcgeI7ZIb7VOaBC9HoLVUVy4vtDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022855; c=relaxed/simple;
	bh=DxoTJMN/+LqAjPVtnWiKH/bCmxKlerXb11PgAdqBhaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VJHq2Wy01VPnLgA1Op2Mtv8CkmsPmaVrvxWxgqRq4+vpr8lwJK3rmRsRJgN6zAulGGoQwpr5a8xUBaptm+mz0H4qLyarjunv74wt6mKvbq9Q64cGzDxTF/Ec972lvb5DZJDcZ71PqfAknFAP4WCiW4yoFD7pl5H3X43DsTQbfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETH+St8D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sd7FK2uR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETH+St8D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sd7FK2uR"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5GXNm4187798
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YFPGqIoHsHzOQ/AB7GpsF1lM
	lefggCSvMh3OTOdNvHE=; b=ETH+St8DBeVm5VrpEeOhD9UdiWWjSt3eN1NMZpCE
	yNowZjNgaDUR9XltGCKhPsLZhsNYSU7HYlE+Z1dRVTBp/90tBYeXGr6ZPBkZKD94
	V+QVJD3QTWoPxhdrDsSSPbf9SDdyw8QoCYZBdMM6swuVcKLJziYkzO9eW6lWJ8Gm
	hhaArxqZGQyi8MzbdC/02+oZ3q3wJ3nMoDXfcpsE0jyGPK3qj/GKUCei/tiRPQ2w
	GwX6qhSSmNM4t8f3zE1tQRKhcISaUO12rTh7UPBUQyWMzIMJVkGyHotBFqAw/KHn
	EYstR7gSaxEgQ7fqKN7GoxOQhcgscBZpSmsbQSQkrrp2jg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcygtft7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:47:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ce7dff6253so8099815ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789022852; x=1789627652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YFPGqIoHsHzOQ/AB7GpsF1lMlefggCSvMh3OTOdNvHE=;
        b=Sd7FK2uRA5lOnndneZA+n5H0eWXn5zLS9QxQmhtkLSGEaB57m/SRgBge5vsOJab6a5
         sIOkzdEM2vQSL+0wf2vv+306DTa5+wvf1MklNzunwKpqtysL57zpUvHgwrl56kucp7kZ
         /EyeqtyAV/XfvlDG5MLp1WIbUDT+NffDdkg0CWu3WEBnJLQFg7zNNlZJV5aKxgabvDQS
         7qasiR7rLDVlkFQB18voYUe+usemG1KL4MdOzdH98yWMoRWefeRBYNnbG6hgM+FRLdpM
         3oQFohgiGjOfreBAoRbil4F1sJK7BnpyiKY9/Q2cEZ7D7o3vUKT4EsTBrvOhD3qBZmSF
         ZOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022852; x=1789627652;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YFPGqIoHsHzOQ/AB7GpsF1lMlefggCSvMh3OTOdNvHE=;
        b=dBRzHAWJ/D7SAC/FK41j7q2UXXI/GwPy8dC7xldAH8F9WO4ZOfoestnoKxSZoxFCWe
         /UZ+bYtYsOkBh7ayLmy40VxXN3sFR10Gtk6NzCajEmLgFcYVkEzWzJ1FdD1LpRDpiMPj
         u3rRtUgIbCilqg9BK5xiNsM8Ki7g/zPmDy4ktBDwOJk5dY58Xk7nXaKyrdBtoTLt2sFW
         ui3EFGCrUkGVyMC+h4NdfovIaGMhjXrvoexI26S13UkA8UpedCr04LXdQrkoBbGjxfhB
         pm4p9RfeO3e4SgmsHapiXKsda+ngpvPddKXnB/hecc+wICWXl9HNlZUKxolBxqpwZjjm
         mywg==
X-Forwarded-Encrypted: i=1; AKwUvBwels3kCBZW4SsNfYePCaER9hpl74SlN5ksPKKoPUR+YnpqO9pxki7BW3rFIS7L1fzytpwPT/bQOT0pz9s=@vger.kernel.org
X-Gm-Message-State: AFuF++me+s/wqyl/CbCUQ0in/Xzf32LCoc7733a+YPorlKFKVoF+nlX4
	garly0AU3SUOfkVfoGa2me82HuoXvrzt2p9AT0aQ+xIqvkzqPqtZ5Z66qR6HW0NMVJYqST34e/w
	yO4t1wCKjbWZhH2wy4IowUqPh5hBoPAd6rQuIpGTqMTqYZ/oQJMI8kfoz+Vh/1m/29Uo=
X-Gm-Gg: AYBFou0pJaIoa7q58WKiO2lZyMJ8jac+ORF4rcXzBEe7N3lORGGbm3olIL5Wm69SfzD
	GVlTO/vm0+fWdJXLRLzWdBkTk25dEanWeeyOe5Ip14JIJHoOdyKwOEK6Y8UA902vLSGLQJFMrW3
	52nvXQL0pS8otBosMLlBgenJGl/umeRkoc6BTkU9JMJdNdv4LmiW/ymrIZ6qnLdfe/nCfcQxLdo
	IzPx92Chouxy1ys15CeGNoMmFLt1lXzkmt5IC2zcjPu0o6E7yClJUQvEldnkBYj/4XFgdCtEpyr
	q1eWd0hsnfadJ7kzOHai3+m2jDshpxz0/F3wswnEgDu/rsbP791azbBrnvxUgOOXkjPhXcN6QiF
	bW7LxMO7r9uX9O0b8fxNqCQlGfnxn4rxFrwceO70iDDg=
X-Received: by 2002:a17:90b:4fc5:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39d77962e6fmr4114538a91.11.1789022852305;
        Wed, 09 Sep 2026 23:47:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:398:ceed:b903 with SMTP id 98e67ed59e1d1-39d77962e6fmr4114497a91.11.1789022851799;
        Wed, 09 Sep 2026 23:47:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm42950318eec.11.2026.09.09.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:47:31 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:47:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/5] PCI: qcom: Add CGC disable workaround for Nord
 PCIe
Message-ID: <aqJSfG1Mj314rbEU@QCOM-aGQu4IUr3Y>
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-nord-v3-3-b0a82721c547@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfXyhubzeThCYyv
 wILzSoXfTjWCKwjrGULN57HK5EOQAaa5zqZcAr0LbR+wWJpx/DHIEIZW/am1M3OSdgYlssHuXv0
 n2YYHsH2PhPMFUN5AuLGBHEdFFhWYqualqYcBB9Q2sKzedc/xBNDrv1amEWvmBcV0fMPx7h9yyW
 yZ74EyLKMjscqDvL+Jd3uASV0QsBzTPq1/lqwBfMOaMKLqO06wQqHS9kcSWx5Qn8m3ZgeKqW/0/
 EKxQwLm64PqUWPTujZa5L2X+6JUh8XIRY/m6KtjhtCCI+cc0Z3IQG3yqd6vcnfBq2TO3ITEdd+F
 MgYMu93g8LP8Yj0ZJx0XvHzljAKjh+whIW7xDSwA3pIkkFkh9hEcPvxulZ9kP5RLEkaB/7Jq8uj
 l8xrY4iceARcDVM0jmltZeKKTpQGJ/EwDXDu6W8iyqRkiaAT7W3JkrllsyQ6Ba55eNJJiUapa8I
 dnI91dryXyzJ3ByLExQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA3MSBTYWx0ZWRfX9bWYt1nrB+7+
 wvjfQ0VHoeMkxIio1WRKxIRUsV9mVpUANEt2BLZRBnLYDEeeOSKm9hOgI1fRDoiipVUGyF9Uh3H
 MXwHN7QKxAAFhkgJKAbN6iXhWELu88U=
X-Proofpoint-ORIG-GUID: DqkEK7k4BuQTeYSzYZIrxW1MVoesUZOa
X-Authority-Analysis: v=2.4 cv=VONIDNPX c=1 sm=1 tr=0 ts=6aa25285 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Y4sVft1UDeOkrP7wHAgA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: DqkEK7k4BuQTeYSzYZIrxW1MVoesUZOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100071

On Wed, Sep 09, 2026 at 05:18:18PM +0530, Krishna Chaitanya Chundru wrote:
> Nord requires a workaround to address a timing convergence issue in the
> PCIe power domain. To avoid the issue, set the CORE_CLK_CGC_DIS and
> AUX_PWR_DET bits in PARF_SYS_CTRL after controller initialization.
> 
> The SLV_ACLK_CGC_DIS bit is already configured by hardware reset. This
> change adds the remaining required settings as documented in
> QCTDD11972446.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

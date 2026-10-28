Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170687;
	b=OzR/zH6jG86eDxlQAOOisjKKcmwey0Gej9jAx7bLE63hbtR1kJiccDe+Zda4cpWE6C4G
	 /DL0792s/BzGJacsxTC/OGU7zzjG+it3+RyCiXe2znl+FXt30tUL3XUt3TU+TDndMvKmb
	 lRZgvnDbZ1hfYCaqi3XYCNqahdg9S//JOe5HxUCqOc2ULxpr51dR2gelhAZyAjwWtFb5p
	 Lelknv7lZDyzXqBpiFOr5cZfZLMXQpIERBMaA2bWdNjfHGKiFn8z1QAA4//TN2BVy8/6H
	 Fa1jNviwyzk0ZC5Ie63LE7FM7z12V9cXT5i+LLPtPMgUjrnEG9owDy14WC+jFHcRUyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170687;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
	b=hk7jR4xYEmZ7x46K6ru7gpXqlYJ+pdjKYIRRToLlh2AFT595cGlqgC8b7PP8j+twRjis
	 My19PbZEgQ1UmTMabg/Jewf+TcB8SfXjGuenk2zVJsYlynZ5wnI5z2EdYRtB9hoJyzkHY
	 XJa0do2XxbwxAC5Nnp8xAPUNjQGQl4iEshpkjIGsa5veJxfFZu68Hcm3Xc78FMFQPjvd+
	 sNcwJhaH1FGNmz51qzqNdhFV+3FzqAd7UiLmU+fMqjHczhK/ai2pr3t27QkkxWTnET7LX
	 IHC6QuHFJ9Gcs8EPJuCJW3xIaWiVxFDwV/ihsv3mz4FxpH1iVATmdTToZn/wf8/rEpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MXaB/cCe";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF0w4NsU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835F0606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:58:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 835F0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXaB/cCe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AF0w4NsU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PUsU1155714
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:58:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VS4ShSLAanyAlY38ZoVAMSYp
	mnLuMlS7SrKkEO8Ofbc=; b=MXaB/cCeoa8z7lcXWEwFcT54n4jHwDc2FfCH/jPu
	OiVrTiiaaZ+kN2LfxvVlH+19lnuvPWtuIO2Gylt8CCbu0xc9v9LSgZ2jccGzgN84
	egRnqwvdcMX6WcpSrHIraLbXMt1RzWEPjlQUq3gl0V0lEvP6MksuPrQtxhNUp/wv
	A4ooLS+/BBXIZLQhNpifBQ4szM10JsmzM29F7rEOqm0+AcwY1mZm9hOLcjQCN/e8
	KOupPxqwEc82iuXm0zvxStbn8sxmhtGos6S3GyswTnBCsD2SZnbRERsz4xwVisFP
	rkFQTseKu3MaoPN/03+88nbF7Msbxqa8T8jicchrxJxtrg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptba1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:58:05 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso897586eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793170685; x=1793775485; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
        b=AF0w4NsUBWpIfF8a+5amDpzeJIDDVdHmu7TpxmBQRP6KLrL50Fe5PPsq0+JliFx02F
         IEELY5N/Z7dPTsyCKlc3XqBSaE0CEBZyzKZ31OlpxrZJjVolRCbYxKMieVvZQDDMCqCU
         Zulkw6HcUEpnBmZwTTuXSbPKOE8WAWYLd0z4tmwjmwU1fwHGuGTFgWaIxmX/ziDWqsom
         QF3HceD6hJkHBU6I5+jz8QObcIyfI8YwYS3WoO/6O+TO1qfO4tmeRED6N16arf6oaGl7
         BFnYOYF1rQv0sagAjf98hJls5iPKyPc88duJJLoc7qrbOQCVS42ZQyW5zv4a3Z97IT9F
         Ul3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793170685; x=1793775485;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VS4ShSLAanyAlY38ZoVAMSYpmnLuMlS7SrKkEO8Ofbc=;
        b=t7Jx7APLg+rcVAhMgEaaYpGFOl0bV26Xi/HF+BbzACS8P7g3wUV1rzJIJcmtSw48fK
         4U/JLtiqYjR56zoRL6uikv7xJNBxnEPYPsw7gluPBgNvesiXDeMz8Sou8P0/303bSiRv
         xUEgPseiI46y8ukwrgmIWPa7ee2rJ3pv2JSxaWe8O1W+y/WAa8b9JJbrmRPTJY+aks2d
         r5No3HZqBpSaMP4ibNMbuGAeAXhn+uYWy3F56V7uqraC7SJ7r08OKRL/n05UTxHnwzDd
         tF6XZGBauO4tfdq5214Xnx80uKkyRsUQzRpNqY3EMvL7HIAY9Jyfc5yJvn2i95K73Ivt
         IlGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqD/XQlhL2EyCu2fDw/4VnBep9ufuFM72ut4hJVpD7SfwiapzKi0qbTYDvKKhA8IXqYDan84gP1SuHWlc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKc8Q82Bj1QYm5tZ0oU+Kqf8FZ4UIx9vf5kShP67q7IPfJVGZmz
	hSV0WZ3I0uutIH3zVleQ0h1lyXdN7LOJwgZf+sqqbL1OvApm4K+mY3/zG3UXNwhmRNeszT1yvQU
	ebZBaPOdmS64QWRSJrb2e6sQx6NLIMkJW0ajJkcbc9QPvRvNP6d0EABISyu8ZGzc4Y2k=
X-Gm-Gg: AYBFou1ktfz0QGI5subUCxkMGz79glMoEHyp3HQK4QtnKmWYxMtAFLOzmpBxaFUzilQ
	Ku6fkrgFojG5YwPQLsBxavZWHdo8+2ioJWm051behsI1SboKvwsd0iDtrquSX98esloSZW3Qrnf
	+uN9/gbIRxVZbg9rRMTyTV2OGecYghaDvvNwN7Ko0BXrvzyKr1lOHC+QJMJeRG1NB8tAjZlBwc5
	HBe9mHW9b4xvZIixgvaDuC/YyAf6CFceIo96+rC3dM7xr9kUax/ZkfjiiOSG3ZoAvgSSGgI79e2
	n8P/I4zZnRMCQAwO7a6SK+rxv0oGAVXUVssvlMzgAHZbchyMS+oEMrjfzbtht9A2lE/qO2vOgM1
	lpzYQGOpNzOjOEiXWK5G5Vgy+tMqnHSb2Hqx5xXTp05NrCRViLAMBimxJWWhiErUYm2ln/66Rqp
	vIPw/R4dbfjApdIwY=
X-Received: by 2002:a05:701b:2302:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a6cf447ae3mr1772962c88.30.1793170684868;
        Tue, 27 Oct 2026 23:58:04 -0700 (PDT)
X-Received: by 2002:a05:701b:2302:b0:1a1:8974:593f with SMTP id a92af1059eb24-1a6cf447ae3mr1772941c88.30.1793170684236;
        Tue, 27 Oct 2026 23:58:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75f143cacsm2786314c88.16.2026.10.27.23.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:58:03 -0700 (PDT)
Date: Wed, 28 Oct 2026 14:57:59 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v4 1/4] gpio: shared-proxy: Fix race between concurrent
 first users
Message-ID: <auGc974DsKIskR_6@QCOM-aGQu4IUr3Y>
References: <20261017043605.1503563-1-shengchao.guo@oss.qualcomm.com>
 <20261017043605.1503563-2-shengchao.guo@oss.qualcomm.com>
 <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeiENro-ivDkve5Y8C8aVKsPyR8x+Nd6gC5h_fn4ZKoPg@mail.gmail.com>
X-Proofpoint-ORIG-GUID: DhBOo_UTCKdbKcMJ94EwIw4H1VSbUglS
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae19cfd cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=wNbXBFNNolHxpcFWyUcA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfXwkDKzv2WR7B1
 xixJo3gVsfa8sGAPVn1awKpGrb9HQhzA7rZIV8CWrRkSRFdWMk83IXelsawkpxsL0DuCgGrucFs
 uUjjzMG+mOxfNPTetsVa7Khe6E/FbW4px5FTj1FaA1gdnGnTFYqcrvHQbKZ0dTmLYR2j30fsNSq
 rF8TCYJVDIskmtLpiAMmYLwTficBtomKT0tcVEONzYuZsgefJdA+GAuJxE9LnkQj3H5YloGmBOG
 f0vlSVMp2CLNTebZiZHFv8VU3dGO/ErFLqwdLpV6ve2Eb0cmWHKX3mKT16nFCKzr0cXp2077jnk
 V9e8z8uemfrvDMV9OyNcWtpUD5zspZF6AWrKQoFwWDl22XMXv3FlssK0r0s9MFH3V+VQIMHhGjy
 BnDYD7KGpIVKV/YYASTKA3O1IJFe2C24g3UF8JjsEKLfyv5DsPQLZRTJ6DgF+OeUaQnenhJwIKD
 MmZk+ivpDMRVL2rWazw==
X-Proofpoint-GUID: DhBOo_UTCKdbKcMJ94EwIw4H1VSbUglS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNyBTYWx0ZWRfX/RaDxspCf9Ic
 OqyrUXXdiqZvZdYoUnv7Y/oXfPoBwS9NYmp6zHhIndlvHMvW2PGQTPiaWkPX64qL/cZYZY7aMqL
 6hky+MT+n2RsFFFsSO9yN179igSCtnU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280027

On Tue, Oct 20, 2026 at 11:06:23AM +0100, Bartosz Golaszewski wrote:
> On Sat, 17 Oct 2026 06:36:02 +0200, Shawn Guo
> <shengchao.guo@oss.qualcomm.com> said:
> > The proxy lets a consumer set the line direction and reset the
> > default value and vote tally only when usecnt == 1, i.e. when it is
> > the sole requester. But request() and direction_output() take the
> > descriptor mutex separately. When two consumers probe concurrently,
> > both request the line before either configures it, both see
> > usecnt == 2, both fall into the shared path, read back the still
> > unconfigured direction (input) and fail with -EPERM.
> >
> > On Nord RRD the two DAC supplies are reg-fixed-voltage regulators
> > sharing tlmm GPIO 41. They probe asynchronously and intermittently
> > both fail, leaving the codecs without supplies:
> >
> >   reg-fixed-voltage regulator-3p3-dac: setup of GPIO (default) failed: -1
> >   reg-fixed-voltage regulator-5p0-dac: setup of GPIO (default) failed: -1
> >
> > Requesting the line is not evidence that a consumer has claimed it.
> > Instead, count proxies that have actually configured the line (set its
> > direction or voted for a value) in a new cfgcnt, with a per-proxy
> > configured flag, and allow (re)initialization only while no other
> > proxy has done so. A consumer obtained with GPIOD_ASIS that votes via
> > gpiod_set_value() without ever setting the direction counts as
> > configured, so a later user can never reset def_val/votecnt behind its
> > vote. The count is dropped when the proxy frees the line.
> >
> > Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/gpio/gpio-shared-proxy.c | 74 ++++++++++++++++++++++++++++----
> >  drivers/gpio/gpiolib-shared.h    |  1 +
> >  2 files changed, 66 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
> > index bc69b8729d19..0d1d724a6a37 100644
> > --- a/drivers/gpio/gpio-shared-proxy.c
> > +++ b/drivers/gpio/gpio-shared-proxy.c
> > @@ -21,9 +21,33 @@ struct gpio_shared_proxy_data {
> >  	struct gpio_chip gc;
> >  	struct gpio_shared_desc *shared_desc;
> >  	struct device *dev;
> > +	bool configured;
> >  	bool voted_change;
> >  };
> >
> > +/*
> > + * A proxy may (re)initialize the line - set its direction and reset the
> > + * default value and the vote tally - only while no other proxy has set the
> > + * direction or voted for a value. Requesting the line is not enough: consumers
> > + * may request concurrently, so counting requests lets every one of them
> > + * conclude that it is not first.
> > + */
> > +static bool gpio_shared_proxy_may_init(struct gpio_shared_proxy_data *proxy)
> > +{
> > +	unsigned int cfgcnt = proxy->shared_desc->cfgcnt;
> > +
> 
> We expect the shared lock to be taken, so can you add lockdep assert here ...
> 
> > +	return !cfgcnt || (cfgcnt == 1 && proxy->configured);
> > +}
> > +
> > +static void gpio_shared_proxy_mark_configured(struct gpio_shared_proxy_data *proxy)
> > +{
> > +	if (proxy->configured)
> > +		return;
> 
> ... and here?

Sure, will add lockdep_assert_held() to both in v5.

Shawn

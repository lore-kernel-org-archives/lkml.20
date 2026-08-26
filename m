Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC36A1B4223
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756903; cv=none; b=KybPjq6jb9UlYSKR+4oyeAjhUIphU8ce3azMUZexr10883e5vGvXTeKTKD0GWhjh/kFSiFjIP+xVfLK9enaFgkZ5jZYE9Sz/AU32xE/0U3sg9A2RB0b+2+lgqTHtSrluGeftxShg+B6WHLHDX2c1LdTytnsQGqPWuW0EOmQz5Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756903; c=relaxed/simple;
	bh=N6I90kN/Fmy8BFCiSIxA6q+4AIoQ7HSeUK28ri2VfQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TvR8IWRy9nv6Q7CAZhjKEiWR/AdF2xD+rFtX2RQSwoMXYaNUigsgFSXo06mWUP/l1Mm48cspibSX6gGb0JS5ZldVNA3RrpIMw9IwLMtw3Ce7wFPk7LdzURQNHuBxG+o9hcdwe1tnRltz3p+6FEjskkN8dQU9sGhWJxL6WrR3Gb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gnutpfU4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nst+xyks; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gnutpfU4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nst+xyks"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QDun9n1008394
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:08:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zatTIADygmZix3Ntq3kFeNaKKjEl3aaah3Zl1EcWMw=; b=gnutpfU4yp+SAlMt
	lpqpLqnRARudo8U909j7PYNPBJ3JkDwGjB8C37BoOsP3IT5x4DutfNy/Ha1avOte
	jDxyS0LW/sPruyrsg3h6opk5vbafH9zJw6zgkqrB4Jt5zG8Whc8wnoZSuK6bfN3y
	aNzwg+HptZ6j187yCWZBvnupXN601dQ2vYhnI+dSW7e5xqppASGnkE3TuhYRgxF5
	c3zd7ERDokcGqGLsAEIOfbu0xcPm7llTQ/Z03aIajkmPoJ1OiNnLRVwMBkQfVICZ
	MkklTnF/hsTc2SL9Oxo4cj5cyqdMScZ251U/tbckMK2KDkzAIIbH5zzCjg6XZgdT
	QoDjjA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9x2n16wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:08:20 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-739a588fadcso65395137.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787756900; x=1788361700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6zatTIADygmZix3Ntq3kFeNaKKjEl3aaah3Zl1EcWMw=;
        b=Nst+xyksWMvoWaBvCfKolebnfI8nvkhpXS23sLSHCBVFJzlC0DdRBxWvhZWidCjJwC
         AGve/A6GUXs1jRKwvLp8qvUPT2fSiIxHsJujwJ4F5ikOpXVWobWLP00mDJudvgEmiCOn
         tLf8cVGl7BWPWF/LQRfJdq8HAqPfKICcBabxDFexd5vX7FaF/WI848mqYuTo5zbZo0b1
         tpvZuVSMmSlo0UU+Ta8kzrrC7o0BpYAi8ape5Q6h/hBi8vHzUn6C0GLKEhbgA89XEVtg
         jYCovZG8BEK9kUFZ1OuZTebDpKpjw2D4NgT3HFO2pQmSWwk+LpF0YdpBYhyi9Nlf7XD9
         gOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756900; x=1788361700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zatTIADygmZix3Ntq3kFeNaKKjEl3aaah3Zl1EcWMw=;
        b=jLkkKFWUBaILQ3gNLbAB6k217PPen0bI+nFU0qXOSGTzj4+0Ey44QPVVHPlmUR9ufG
         xqLScqdEZr19n6yeUJGW2iff4AItGwnAvxQt5Yit9Od3NfdppsslAthMqfOAcBODc93t
         lmXYSg0xW2BDW7u01HzcpwJ4yEkd72rDaeO8lb0ZlAAUApHhub4/TcjM92/blFm/Jiu9
         Ojy56RyCVBp51m0R534fbZKXLno08By8E2OxWpo+crrx89K9mOMfw5X5GDs+anCg/Gbp
         yLAfz/3zy2v0cIowISTlVEHfmoZwdzeLZ1wPJprWX38Uke8fd9E077rGHb2+P+9B9vrE
         +3Ag==
X-Forwarded-Encrypted: i=1; AHgh+RoyvaMrPpDF6JiW6qAjmCUGHcSftxubQqnmY26UPonF1DriUYAUGcXmG41YpdU/S8C7iTTazQzfxgo/iNs=@vger.kernel.org
X-Gm-Message-State: AFuF++ktG9WkPbe7NiqQZlwVnGtPrMO5KF2wRiwXxe6LhljH0CN3Padl
	kCcUYh1y3JO30eePP5g+FYrg/ZlYAbHBSRZFT7Vix8r6e7LC4LMAJGhIAYqVYEG8fy1UzrtpW2V
	ujgyzd9gpXt34z0m3GHfpaVinNAKK4QKFhOo8DMeUzJh2AaAsq6eVORlAKPbAJa/Rjob0DDqwjp
	k=
X-Gm-Gg: AR+sD12jOQaTZ6+in2GWyJiTpTcaSbbH6RkCd/Y9TzERceAbpDjWMO/35KXJlEsWtJ4
	xud4muehQNKgKJ17ZoqtGYZ9wLT6rGzqwfzeO0XrtJE10LivtXwN6pvdJ6CQ5xroIJVU56wgLhc
	0Or4guWtF7G4h3xjyHhH2ij7IIGgxSm69cClzVN9ogB99Bz1+wODXBSGOYYhNz6SRMSimACc7zt
	JuvjjDALJZGtlNTHOoP7fQFxi+H5GGd5h/FjRA69cLhnQx/UKCfSq7W4vyTLfg/ZpXF2kCb/jQ0
	xRz1VTkh6JxrV/V+xI4vout5f+9xlLPQQH1v2bqxc527SnzUP+MeiNf6MpLypF++x2mgO5HP7LR
	k6PUW+0jxyCw9ldd64nfAkJn0ZJ+x
X-Received: by 2002:a05:6102:15c8:b0:782:df51:aaa8 with SMTP id ada2fe7eead31-782df51ae40mr1657320137.6.1787756899895;
        Wed, 26 Aug 2026 08:08:19 -0700 (PDT)
X-Received: by 2002:a05:6102:15c8:b0:782:df51:aaa8 with SMTP id ada2fe7eead31-782df51ae40mr1657275137.6.1787756898803;
        Wed, 26 Aug 2026 08:08:18 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dca8a986sm29340315e9.3.2026.08.26.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 08:08:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Cengiz Can <cengiz.can@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] gpio: sloppy-logic-analyzer: fix debugfs UAF on unbind
Date: Wed, 26 Aug 2026 17:08:09 +0200
Message-ID: <178775688406.67048.16792981234236598785.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260730220258.358169-1-cengiz.can@canonical.com>
References: <20260730220258.358169-1-cengiz.can@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TKZbXF4gw5T4UZ-F1KtvvT8n61WJvt2H
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfX474MzN6zq/vP
 T6SiYiG3yPPZlMXN0f5vgrwqxujSIhydVI3RMmCUqH7UVpz8WJRv9EGJ28iq2NBTETK7lp6NR/+
 Rk3g4VZkscV26VRFkcWWf/qohAd1cSs=
X-Proofpoint-GUID: TKZbXF4gw5T4UZ-F1KtvvT8n61WJvt2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNiBTYWx0ZWRfX2CsibZVJ+M1l
 Vk1JIWAAB02Zz3WttT2inxO0kjWVO7w/pKdZArQrALiy0RPSSi9WL1iGpPULJNZLAqsFph5vdDS
 UnB+W+79y2biJNM3MOx4cplT2XKVmoc90aMwGxv/NeU5SFvvq1LlJIHdw3ndPtEjsk+WhJijMKT
 /k7pvFPVFidenOLDkVLaWKMltlTHbAWtmCnuCNL7bGgTxoyFc+CJshhuvCdnCPyCBgK+M3zBswt
 D+W1VkeNcJj1thWrZHmAgxGsOTiWeUBIIDtn3Zc8H5wh9mTgh4EQ7DM1yhvN4wIKi+ErXhYgOXv
 G4nVsKOar6YWRl3RRVKjL+uu/btx0xXWTFLu7imUBdwvEtLOp6tS2lQChtZUNIQgugxZR6BrrZQ
 dn6f7By5KcQBrH8f3JmWnGPkTUMQQsFRHjOQsCI97LMFEQ81farWfiiufGG3x9CUGWg2EvdyzRa
 Jag4XgcoWqkvSq1GgIQ==
X-Authority-Analysis: v=2.4 cv=PPQ/P/qC c=1 sm=1 tr=0 ts=6a8f0164 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=nnonr4IxuVDrNdUmIcwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260126


On Fri, 31 Jul 2026 01:02:56 +0300, Cengiz Can wrote:
> Patch 1 fixes a use-after-free. The "trigger" debugfs file uses
> debugfs_create_file_unsafe() with a hand-rolled ->write that dereferences
> the devres-freed gpio_la_poll_priv without holding a debugfs reference, so
> an unbind racing a write frees the object under the handler. Switching to
> debugfs_create_file() makes debugfs_remove_recursive() drain the handler
> first.
> 
> [...]

Applied, thanks!

[2/2] gpio: sloppy-logic-analyzer: use debugfs_create_file() for buf_size and capture
      https://git.kernel.org/brgl/c/beb0556bccecfea7cfe54d7263dad95950b577ed

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

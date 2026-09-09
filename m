Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4991489897
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954303; cv=none; b=rVDeoHm6SBaz88ukh6iEDa+s8Ad9bgPtnIkBnNvsk43wozuRUrorDnHV6WyWK8iEc5t2zmo6J8pzcYvKcDPPR7QSa7mKonLMjq7JZdEV0rNcewo3+DvaXeyOC+RHVM0vCfFEa90/eX8mSo5jHb+Bm7L/qc5XixWueCr362mtR1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954303; c=relaxed/simple;
	bh=A8fbtECilXcXT05bGS4gADzn1R0DQYSuDpwR36o1s6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6WiLebRN0vUCGucT+vrh1sKyRpOFzOXnRKfHK3HQj77bsau7Y5INzy0w2wvmOYY1OCpO9XjBxpBKsZZjJMM+dgPbZuUGAw1H/9I0zCweI6PGCP+I+tIjotK8XPgNMdQT2XwKEYoHeqRX9grcVun/Q2FWwop6pAQwwP98TurrdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UbEM89a+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XNo3TXQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UbEM89a+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XNo3TXQN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUDPN1307951
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:45:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/BIAcKnu4PYwR1yQKunqDZK6
	VZ2d055y4cTbs1O813g=; b=UbEM89a+IyCMUH8fbe/ZDcIHuOWqydmjtSVvoiPm
	Nl96voSomED5T7SASKY78Nu7lWVixAZfc5oOlFGGD1QVPNGU05kouUJmmwAk0DzI
	ATho82FJYipFdvlWvMX2yLKHcxHUQtmrRHfZCBGvpQouyFO0fdQXS1drVJ/Vfz6n
	m2w9swZscbvwaOUSZN7xC6Vg2wzGqV8EU0rrova5mF3hFwE3ei29i59Hk+IKYwKH
	LXcoQWt6bVQtuWNMf7LBf62Ppbk/1OEqmVOXPVKhxct1LZjbwg39uJnblC+7/oTy
	Rs23nM1smCaSB/QgBsIxnxKjYSZ+EqnmMgeV42j7QCvMpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstub1et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:45:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9375d92d8cdso1076251585a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954300; x=1789559100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=XNo3TXQNdsfvmbJ2lt1B7KJb1Iup+6EHNk3v9thbIHlCMWq0PzGaS7ONZUjHoiLczH
         C3G8ek9argm22aaihCgpCQNCjud8TePXXfN6yR4ccPGWxMgaY1k3i8GiQevNH3MeUOIJ
         Dxx5jpHpZm6vQ5XBs9q+PoK9wdB1aH/k7nZsCFbtgYa87645eLcsiQYpmMJwu4toYMyT
         52T/UnNnJC0KBGzQtFJBvO79dlIYzsdMkGc6ZtXuI6Puil2iS/fzXRyRcBeyDbVWw2LJ
         uo4HLMb3TWs1h5e8+2/8GwW/UwG4MrMqOYLTObiL+qpJyfN+wZCvVCdkxSWMVScLn8DH
         8eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954300; x=1789559100;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BIAcKnu4PYwR1yQKunqDZK6VZ2d055y4cTbs1O813g=;
        b=Xha264MBj1Ea5+eAWUurbL7YBe6Vp5UNuyo4pvJu7Mdw4gg62/JsErlmLAe295khWn
         N4OxpuFPebDsNIxUy+igBoPu1vYmxjAqO+C7K63oI7jR2sf8RrPORUrlma5PqQAR94i9
         CLhymZf8WzOlwl+d00ytuI26bMEFgRRgupLJwfa4oB76mKJsUA539ooVFwDjhNUL4aoJ
         myvn3hUbIOj3B4e47YRWFJgUYNHkNXXpkzsCKBU0qxj5KVwJPso3lk96XGDX5xaGYrpL
         XAfRTpTDOKacyBRv/6IHCWZlpIpYW9gC2xDKN0sIV5zFhaHhZpNTJFVniv+GHv0V2/M8
         PgJg==
X-Forwarded-Encrypted: i=1; AKwUvBwGrsrycJloBX1UmVS2Cx8BOBDA0YccdhleJcn0kIaOh9BcPtFw9nyboxephWPdEqX7hSpJuLRkaRUy4fc=@vger.kernel.org
X-Gm-Message-State: AFuF++maJETI2p7Dal3iNTWwqL/P2T5MrNzN79ZpYNbijZF/VJ8yrA4O
	HBMaupZAi5frOKlax0vtFPC4BW5uoPiiIipgUmfuWxp8pNtElcRP7jtEvULdpMgCQ5bwsvFMe65
	H9W+tL3EG5g1R3SbRRS8QPB+MadTTtS9zWmLAThZPauNPYPgxmTgle9csua1Eh0kyrGo=
X-Gm-Gg: AYBFou18Cd4clmDqtoccz+d9GIYxS7mgT8UGelZ8a/tKMG3jy8a8DPuZJbxbmd49v9u
	x48OeJphtq8JhSaZJOWgSkwEp5to3Z+ckXn5F90SWGMe/JE9qdECpd4i+I+8T/4YRACcVvb+F6Y
	OiSSgA232bAp2r6c8qFMMjmO6WNwxd79MAIm/SXrt65z6oO+oL9M0WG0ghpPmk8qA2BB15eyD8Y
	PA/4CTZKPy5p/3+NCiuGWKRtqifxqqKVLCVKjH6ImDnBEgJojR2SukkRNv4CdezioIvX2qye86s
	uzQj1JBei+XFSJidExNgfOrjvkQdHgWyNIvsjzMIOKgY2wOrCSF3/M3VR5+pd37C7iO5zwfRK2Z
	Yarnc05INNnc=
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934359585a.52.1788954300108;
        Wed, 09 Sep 2026 04:45:00 -0700 (PDT)
X-Received: by 2002:a05:620a:a402:20b0:939:989f:3371 with SMTP id af79cd13be357-939989f4ac2mr1934353985a.52.1788954299549;
        Wed, 09 Sep 2026 04:44:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1fb02bffsm40029685e9.0.2026.09.09.04.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:58 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Message-ID: <eu2j6ohmt7yrhkvfcwiwfdcsebezdi3rr6vokc3t44ynfucuew@633443hrwqwf>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa146bd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=7ud9App8h0w1rxOIwrsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX3SG7j96j1AJe
 +5wBS3nCRwtzE8M4QcM5qyx5nLkWnn17oOlvK/4BjlAp39R6p6xYzP1bQh7IW2bRYLMUS91/b2W
 6qbLETD0uz+86L17o27Dt10plGlBWts=
X-Proofpoint-ORIG-GUID: xOE1Rl3YLjGoupVa0M_gRgY0ePs0fnRO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX0U++tXFLbkvq
 OE5Qwr6HLqilQEtpLux2xJdKti/t5Upp39VV3kB6sE8PV0fxjq0VXe3cANdAUo/P05ZDZIvbrmM
 kyUdQK7ZBo8O2qCBX/Qb7kgZXIj74MBQHCRg7PgcV5wpsiLotBYbC+RcunHbcnfkoCT1/YHr4VX
 8OhOMGZLHo9Zgl37JBe4kN9Q84X+mq5mRtaV3w7svNNvbKK/JiMnR9AuxV5t6DcMbzvPdFgJhVJ
 OGmXJycRaUe2AaeubQUj1nUePP1QIMAihH1EQRikS0SL0rn84ZlV6vLW9o6RkE4GE9wRABJ+RK+
 QpBMBDEkYR7ExJLOamzbuk2Bxd7ZFE1aWLbM4IOdVeGsDpvoAFLyRF5d+sV3wv+wgkaAqbosYSI
 Xdh8kTliwxO0Ilyv20dgNFazwniG+jtcHzne61PxYkgsKqrdhSHd/TMthPL08j+0KSJA532x1h7
 REdZyECBIIIrO/H0eZw==
X-Proofpoint-GUID: xOE1Rl3YLjGoupVa0M_gRgY0ePs0fnRO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:19, Brian Masney wrote:
> Add a new macro subsys_platform_driver() to eliminate some boilerplate
> code in drivers that need to register earlier in the boot at the
> subsys_initcall level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793166735;
	b=HJBwGHF9CDEE6CGrea9pTXYCg46QUnOoKa5JfxPYkEV+KpdECBQ6fFX9T0CKt/sUkpUJ
	 ThGc0/nQCK2ToJYf9MDOm3/KaatREifhz1AESkEScb28tOREdhHXJoSwWgaYZD0LghE/w
	 lQrPtCy/Zjz+ajTKbZg/YRDLAb4IOyJ4tucSv2siLoXGG7mk3NIE6ysv2kACwLNRqjYQZ
	 I8Qwxb6PjGXevxCJ7Pg5KIe59omokP95rVll/QCQdUD0eCWkBnmeNeYM+j4yyZ9QXeR0g
	 McAgnSm9uw8TzfDuEZhBV/dY8xdnP9CJb2xX0oPuJrcJY+p2GTS2MXZh+NaxbqTR2Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793166735;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
	b=xu4NlUe7lcK0Bmn1MoGBKPL0AL6hPZgz0kFuY2LEd1azvJqyLNKZZPzf2+TSyAxvRBc/
	 y9N0gGHZAExfdgBZ2qUvw7cV9EgWkeZGeUdmKfWKJAqPv9eqY9619bJs9lKlPCedkXIZL
	 eURivz0tx4vodxeKgd2t81GLlvYrNx+/41999gCO4YBx1bMA98SEonNWe/NY5pIz0HTY7
	 KhTdLnAxgZruuJbW7t6qaEyHRjYUgEN9ylPAQ9CU327WwZ8JoiUg1WgMIDEKVaOJ1xyUa
	 E9o5h2tNOUooLMIWiCNQMcYyL1InpiZS5YnioAbrG9gYreYLpsfM5H6wfANnziaP1qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxrq5ZP2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvKlUgUO;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17076606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17076606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mxrq5ZP2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YvKlUgUO
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PaTf101047
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:52:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IYwAwKNsQ3Zd8ZLk9m7XPS8i
	lKZ84ltU/SVOXi75RGc=; b=mxrq5ZP2SPnzmMiC/Qy696KseD1ZZy1gapprx1mU
	zN/p4ufefQGsT1/fkhjgx7wuSqBcuyBDgjt2fZZ8OSt76nRpeUI1/HLQcfGdDUCo
	RWw2f+u39CrgcOIkt/stfVvRTBVpBWhm8+32a1mecHUZxxO1gr1+ntETzfdc4Fwf
	yBNmLmFK9hpll2pnVKxQbl2SnIfatRZEVDfG90CBE9hPvYS9SvjW8859JIPOT0oB
	jDeGM8Zx9CGD9dGsLi3t8Ch/vh7NTrLgxTcoSUso2ZJsLi8VhZZWMleX8/2e6pys
	jYDviIBiopLaauIsC+viTaxu9+3ZICjOI5HHNbWCc3TvGw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1m7bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:52:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso822424eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793166733; x=1793771533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
        b=YvKlUgUOCFN0Um6M7SsoFnS46nPqCpb8MD6PN/fnH3Fb88HIAv9OL2D08m92eMlJNP
         NC6kHKlMsafI/UtBrX860eNv46hLHKUUOiDtC0XdjmTLU5lN0i+cl9Hiib9HZY22KjDQ
         7irI9xIJ3ry2DC3r89g48EzLpWIC++D9dQ6sqjbxbPCa41liMi6sG27kh6tvsWqN2AOe
         tDmzTIR5n5UPViAUMBNPGePx3tfs+C3L0R3aRYPxdLoboSY051iVdGx6krOtDw+vuy1K
         +vq46tPcCj31/p/RhUYxqcqr00/E8FPEHoc+0tjKUi6O4W1m9ibGrOj1lqxZErcV8UVS
         9PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793166733; x=1793771533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IYwAwKNsQ3Zd8ZLk9m7XPS8ilKZ84ltU/SVOXi75RGc=;
        b=avaLR5A+4XVOm/aDaaYUamrZvEfrmAwmnwQAROm1gCksXC22YQICUenM3UjOsenHt0
         8+fUTY68dCKwh/0bpbnZyUpv8CokWqrRg2KOdki1bUGQwh2tjT41QIIXKbCzTeLDi9zr
         q6db0vWlms9KhzU+pPjJSWR8Q07trsd52MS8hAZq9cQfq09QXgvnl9viB3VrJSwkJg2E
         tR2EbPEwKcNz5JTy52hbCubaNQM1K/U/sEFRIR4RhXLw08CZSe/JqeFJy7/xD0uCGtYQ
         7VuqxC+fA6AbqGxE4nP4K0W/6N3EceIW9FWi+aZDw2vslA2+RKFbZSp1bkOKHbg5tv3w
         pyFA==
X-Forwarded-Encrypted: i=1; AKwUvBwc6MexwvCLiJRXibfO2O4DdK0tz/04/mGO+0zgMn8qwGH6hGm4NtLZt8LuxH6Pe1q8l8QmWCPLoVur21M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIm6/UZIaF3ARrJzUPqs5doAdIcw8y/bl5OwaONWeJJFxGYyTi0
	EgUNUhkNyIzJLuFrJDghi1B4ou/i27W973v5Owsp5jU4vJLqdwxIl/n/Rbk8Lh4mdfew+NN+P/n
	xDypCDWiMeUbhnapL6oe+NF3qmUXUDLifYPXyZyNLvwOkaCZMw/+DQUB0Ttf9GuOVOxc=
X-Gm-Gg: AYBFou2SkOeayp2+I1B+QF6aSrCF4vAjUn9KWFK9BMku0DP5ptoDbwVyNoqiVyJ/U/I
	nv2NXMrqrVQCywB+g3qRn7Pc25LSsBHPqGEEPFOTQpILg1s7Loskd16YGAeTrUWHkUSIy3YFNGK
	XI/fmA3uvlsoLDSWToXWqbBpOg2ZRWydOsP+Ydd4CmsZFpwjpNuHIJyWu5NAOIGIXIZ0TrR2NZB
	SEbC6gTu6aHOSeEKzBMgooINTmaE1ohLkv6uzR3BiBFuM7/vB6Q/7og17QSxkbz44n32PnVgFS4
	++5CHRYPGgnxjDsbDZRtz3LJAKqT4TdWQQVF6WNixMqiL2EakuB47RIMvXxd3U6IDJlIrc7q1Rc
	jUVlZ9LRIbRkI161/QGEGDiigao6i3kXHvmAVUsav4U4WBOJtLpLNnHi5UTKyjvEz0PvfFKTokA
	4NewPG1nQUUliZDhjp+DPSei8t8h3M8M28qkbWqJAnHZWLf6n9N0s6UNq/6ZKSROjru2zxgKA6y
	2FM2w==
X-Received: by 2002:a05:7022:5f1c:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1a6cd77f303mr1693488c88.14.1793166733304;
        Tue, 27 Oct 2026 22:52:13 -0700 (PDT)
X-Received: by 2002:a05:7022:5f1c:b0:14c:efa5:ee7 with SMTP id a92af1059eb24-1a6cd77f303mr1693465c88.14.1793166732662;
        Tue, 27 Oct 2026 22:52:12 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm2295526c88.10.2026.10.27.22.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:52:12 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:22:05 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <auGNhbKwIMGsOsbK@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
 <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
 <cfc75bf5-eb1c-4433-a4d0-770c56778392@kernel.org>
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
In-Reply-To: <cfc75bf5-eb1c-4433-a4d0-770c56778392@kernel.org>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae18d8e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=g1hkF5I6mjiIX44rm_4A:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: tJPapYtYlVUkhL5_VpR0hBW0U4mUZKlF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfX8nkBkBxIyqYy
 E4EiaSlyR1BZ6+wuOD8qsAKrRTsXiBSm1hGHuGJQ4uEXlkXqOXsNuGlofrMck0LfbEgwa+s5OyG
 2dtIcYjdkhWWM9hJmNy7CmYJ6rBJh34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMyBTYWx0ZWRfX2l+jvioMbMGm
 eKGwo/31C7BREwgeuoaqpKHmHSOrfgFoUrvt3W/MYBgTLaStdEZdB7Ibgg7ifrlqn72LTzWZbBT
 98zSmgdKUnm+0uU0418fGL1+/bArtZWTqhYMPxR9Iik7WVoca4zfb5KKE4mLb4uY34qBSQqld8s
 81DUhPTJU+oOA2Ons7nD6eNhdR5MLCaDdIq8eIgdisJwE/jK3oxBrtbSutgvM/IWZfr1Jh3OB0B
 AbA+Z/8rjsD0jqbpX+vQQqJOaJEg4YkwP5b8VwqH3O5MLE4Leu2bH1ETbOdgNTVoVNVkQSYuW8V
 JOfAPjYQyAb3mMfbdDdNso0PVjne1sGNbsaqV53RTxxirdAyhKcYCcz/uhwyz90tR3M2flFjhRH
 mmzwUGyz7LaczUCegV+O/ODWeskCpVtTW1OtUUhsMBrzaNtvLmz4pY91wHYsZWK3+Ouyqs2NGql
 NsN+4tAf3TG4w9jx5fA==
X-Proofpoint-GUID: tJPapYtYlVUkhL5_VpR0hBW0U4mUZKlF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280023

On Tue, Oct 27, 2026 at 04:50:56PM +0100, Krzysztof Kozlowski wrote:
> On 21/10/2026 07:38, Varadarajan Narayanan wrote:
> > On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> >>> The OPP table node-name pattern also matches peripheral OPP tables on
> >>> supported SoCs. However, it only handles Qualcomm CPU and level OPP
> >>> compatibles, causing unevaluatedProperties errors for generic
> >>> operating-points-v2 tables.
> >>
> >> But the select should not select them. How can I reproduce the issue?
> >
> > Sorry for the delay, it was a long weekend here.
> >
> > With the attached patch, I get the following error.
> >
> > $ make LLVM=-18 ARCH=arm64 CHECK_DTBS=1 qcom/ipq5210-rdp504.dtb
>
> OK, I can reproduce. I wonder why do we need qcom-cpufreq-nvmem.yaml in
> the first place. It duplicates top level compatibles and opp
> compatibles. For qcom,qcs404 it does something useful - enforces cpu
> power supplies. But for others?

CPR capable SoCs are added to this bindings file. Not sure if all of the
SoCs present here are CPR capable. Will have to check. However, CPR
capable SoC like IPQ9650 might need this and will face the same issue when
I2C or SPI opp tables are added.

Kindly advice how to proceed.

Thanks
Varada

Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D2499F3D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549331; cv=none; b=WvrahpvYaxeRySCf2V1LhsWg0DAiKiQ0s+jxm8F8TrVQwKmpKfNj+vnh6ffCjk7YSlKZntY3Xd2p3+hpUkYBs7521usFGFxFriy04TGRiRCHYp6qxZWMx+wDGEbQbR21kbBtpyKtzzyWDoP52HxiKkZGablUqovWKUOk68cDqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549331; c=relaxed/simple;
	bh=r9Q8CXvGxe0d1gFFAq8dmgIyqj34U9uBRqhGzo7Tk38=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZNA6b+S2ztflDZgjw+QFev1xyoKl4KyoWIPl7w2UNeJRCL6EWJTtVYx9pC21163C++vzwBZoPKqyFuLRaAPwrgJpvMPX865JWwDD9wD4xHA/nsGyWZyLKpUSi5NiY7cANp7XdlhsYiNHktSFQc4rI2UFbS3AiAHvxg2PjgUc6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O2ezgGsW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwAcTCbX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O2ezgGsW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwAcTCbX"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68mqs2986928
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:01:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=; b=O2ezgGsWYxJS6Y+K
	A+2pH5fxgPofFY70ilnqTCBYJrx/0TE3+ybKzgV85qRKN0ycYgCuM5GFCDcux82E
	6ZJ6grPzj3iC4oqsBBg/AiE7QusQjb84yMZijpRuuS6D+oXMltMdx96JF1tu5Pdi
	SxNyEWAwaqCvXDdZNiEcsd4qY/N+VgP52cCiAJ6OFXlwfBWqgNhwTsNOXHZEZ6Sp
	KqNeTv45Pe1fI4drfUHsPv2HE6X5KtUOUQb5h9Izk64C0kJb4uPZJl8eP4VfJ+rg
	1HVFbNnXrKOsd+1GQPittF+4euE7VPMTu5lC6gfqLe+/4o3iK7dDqrW47HF6ksAb
	cEucRA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpa9cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:01:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso825142485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549305; x=1790154105; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=;
        b=DwAcTCbXk8hCf+uCc5iOeR4lXiJ1eD9xm3XWw2qEN4W/ksEi5P/Hze6ZIrGuti+Red
         CgV74xxcdNBq797nrDfD5/arPQMd6KiwRoKNlLHqVO3bThp5epevfCQqIE/uD6ZH0cTO
         JB5ktHZyTryLX+ZH8OmfOqYGJkHo6rNSyldzo0515g40PvHcQp5QNEkfN06lrXr6AKPO
         +c33HJtgWhzDfqP7Ore/Yc4MduaxLSa3PT8J/YnngUrpd+56hPDfmUVRo97eQ8Lbik1I
         QZbdwO3YntepWDZ2ewmr2Bvec2GXFrhzshyVNLF8EO+W5ixRVdC5CQpuQApvsPmQUQQh
         GajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549305; x=1790154105;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzt0WFn+hreY1nek99/9HyLvSQmxWneI+I0Nq2EeaWg=;
        b=drwbsHvGVsznUeSXhriadt1Af9t3ruewM5NGh4yOgyJQBoJqyBYcyrZm7UuS7MToPd
         uXXKh+ch6eaTYKiJ8SKCseEeZkLDQamguDHXjCtls9DEshNkpJvkuDjSiD7qIquRQCFr
         uQHNFc1VYbJUjPo5O7XbcdRSz93S7T2wSC1cmSJdJIEshgGBYR3Kvt916iYcXBXDX5Xx
         QcRRIMGSUsp6z7K4+U7c7HybvldzGRB8JO5+ZSwe/y80ZSwZpoDrgK+ca8yzduz4Z9tN
         S3s8aw6NvImdIN5b0yf7j1nDiWmaLhoYehhorPKRQ8GzDfxOSMgzWCfHRI6IBf4geRjT
         0CAw==
X-Forwarded-Encrypted: i=1; AKwUvBw5dGw2I3CaBEy5Fhy39tE/DrMe/vTwc2kJcmaJsEZPc0YGkpBocfhZVeeUll5OUs9/69oxRS4mZs7Ywu4=@vger.kernel.org
X-Gm-Message-State: AFuF++kEinpVr4r8RSjMORNJrwJC0G+b1TIZM0pYXNOOGrk0oDRiJG51
	LueoWbab06VUiYcMNTz5t2+oUTwaFUWNbSQu3uB5fMNS6XI9O4OsSd65+m/7AZsnz7DXs7242t4
	atLSPAuM0NpLImTHkCUppajIDSU5oDDUG587ZCbkBUOSN6H7+T8oUiFPuY/2rd/mqhYE=
X-Gm-Gg: AYBFou1dhTwZne/+bh31T27C7equijfFr6hEGWzGUKheHNAb/tvJFJveiaZS/yqxbRG
	Cz3MqH8eIqWUUFIhFwEWe05mJubSg4EYCYIJfiwFRr8m8OvFh1pOTsNNsR4AZqxulqogRJF6pp7
	et8QJYfgqumSHTisFQOsJhELjk9f29cQZzeIlWes1iGbQvyq9zxYf5oz6DUrc8/lSeVv3Ab0Upx
	Go81mKAOGbXfW5AGcakVi8WCc5AbcrcbrAgLqa8guUb4EvcyQ2J1TUp7gkaAkQpRO+NOQsMMbS+
	udMmB2bxibMktSpo3E/QYTzcZt8x3DICeDGXXfgBJRnamDpBsDXj0bIqi4t2lnMGMjfHP/98GBB
	cl+gOwYGBa04JF9qR+Eg1ku+8bwo=
X-Received: by 2002:a05:620a:288b:b0:939:6de6:5487 with SMTP id af79cd13be357-93bb794cca1mr249161885a.44.1789549305054;
        Wed, 16 Sep 2026 02:01:45 -0700 (PDT)
X-Received: by 2002:a05:620a:288b:b0:939:6de6:5487 with SMTP id af79cd13be357-93bb794cca1mr249153885a.44.1789549304517;
        Wed, 16 Sep 2026 02:01:44 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm6473464f8f.2.2026.09.16.02.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:01:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: lpass-lpi: Include value in debugfs output
Date: Wed, 16 Sep 2026 11:01:40 +0200
Message-ID: <178954925614.6008.15490710195931026839.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
References: <20260915-pinctrl-lpass-debug-v1-1-bc49766c9f6f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX/wrZKGowaEUd
 wRwd9PA4v/ju8NogVmmwAHwpY6vEUDc72G0po5Y/BqvqKR7LyuxtHykjAHtwkW6OV64qy/dR103
 E7vTPQ8A9FNA+RtTc7QTjwDui2Fv+GE=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa5afa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xM0vMNglaa6g24SigUgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 2WpWEyok8B3p_ZuDaOZVyf6llfso_CgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExNiBTYWx0ZWRfX4Kuxwzp64uXC
 McVVG2Th8F6CnDPzstSB8L3Pv7JlvlFBKj9ZiWs3zwe9GjJgWm3kWVD5rMEbn016eKR7HdwFEBt
 B6Stw8nMKVwhmBjM1AUcKEowTzV3PVQv6/sd7kj3UTDhjUJ1Av60rcxDYpHFaQ2oXc2MmTRuMpU
 VqPf9jU++rQJakYaUaf/3+1rCan9515lMaAXh1N9+VH6FRLmDZT7KrcDcZG9K6pncVUEVeMrh09
 rzqVXCGavKkidgLShc/X+tgL6WCaOLZbFy10nC/L1DjPotaPv5YUBQPtCzNK8eVgZl+SL9kmXD/
 6pjkgoCM4/Mk1B0dCaomGVefOoX+r+dfp29sNUuDJtze2hmZPN/yRhblXsbbdtywTlT+55r8Gi+
 0PFv2O7CvzVv9UIDhT6F7imoyqXvkM10jzApusdm+uyfZbZEeJODxmgWW6/VYI3BN+GQA3qKcBp
 N9Px1/VGRA5sWegVXrQ==
X-Proofpoint-GUID: 2WpWEyok8B3p_ZuDaOZVyf6llfso_CgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160116


On Tue, 15 Sep 2026 19:00:15 -0500, Bjorn Andersson wrote:
> As with other pinctrl providers, it's useful to be able to inspect the
> current GPIO state of the LPASS LPI pins during system integration and
> debugging.
> 
> Extend the driver's debugfs logic to read the current value and include
> this in the printout.
> 
> [...]

Sashiko's probably right about the return value check but it's debugfs so I
won't worry too much.

[1/1] pinctrl: qcom: lpass-lpi: Include value in debugfs output
      https://git.kernel.org/brgl/c/d29bfb93a19771b822dab6d7adbbbaf188cb1db5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

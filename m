Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468B13F4DD0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476380; cv=none; b=DjZOxUJJugfkYx7tXgMBaV3qDGoQ/n25Fur7dlHuKsZ894TJ1TJZaeW89dEH3gZ7Jzv6h4kqyMNR+mnWWkqlIVp9gQO3dJ7faVSEOV7NKOgT3ARfc4KyENaCLNPF+dyHAAXmPh7ngZ7VsRXVn0BDOtoMg4ddrztCkAZvgCvoXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476380; c=relaxed/simple;
	bh=MFvrABvZfyoApq71yJbOooDIx6a0otlO9jt2EdnP3HY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P14ni4r6lthNKmg8UxyqjixRoCHFBRYg47oBvKWzC0Kwk1+OMGWTCupnXbLHiCHY+A2X2/fBFaSx5cyPKTdCULiITECWixMB4vXbwH6J6Awiejn0RphwOdoLv9UDPlW344tJp6MVw0qgFgk4OeIJRSKOozxykUfg3SKyOYq0lfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VJ8uhZ4V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTZoTu/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VJ8uhZ4V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTZoTu/6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h3Se3415738
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w9qFLTvgJUSRq4Cj2Lly0+SK
	Yzt9MO14DnLjeqUt63c=; b=VJ8uhZ4VK5CqTV/9wDmgaAd1dfmS157o9prMfpTU
	gCBQh70HIm8LpBfWSYGmPfr6OWcIYS8kgqe1iNQS8h765EVRAAp7e2340EcnhwFP
	Bxqf93SPqZRC67MkUWj7Ve3B/txnbBVimzQ9JH7ZfWfhMXn88B+PrW+A1+JuTguE
	+8HnP8R526UC1dEfybqYaLxHDwxTNJoboNtH4snUilNxLPFpUtu+QGWP3y0JCIMK
	R57X+Ybnw0aWU5MY5AUDTvbKrZJtsZodn2U+4j2i3XUaDmVhqw9Qq/fmy8uk9icg
	Y7plGtMbsTzKNiUPv+HHqEZAWvjDB8dXr20wVjL48CvAog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc0xks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:46:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934963b2bc0so919973485a.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476377; x=1790081177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w9qFLTvgJUSRq4Cj2Lly0+SKYzt9MO14DnLjeqUt63c=;
        b=jTZoTu/6cIrkWGPYHHpWjZeG5CARDVujQ7eDyBWWfbIPGVBXClzUHxPp5oocupS7gW
         ufAz/ikaRHMMJ2J8IlJ4GbXZmmHjOXZEPTaFxwzB+GL2e1DwC9ApKs3n89E9+mOwdy4L
         6MqbOZ5G/oX7eO/K01nU/mkTSUKhO0T8hxIZi7qhEcxi4SU0i+bXBdsFuaQmpNE7B3fb
         6s5NmEpqrK4f76rysTRmE2JmxF7XRLclRvPuSl6rB5BaitGW+lj+E1Jmu554hXzQajUS
         LDRw+ccdh0mGuT34PK3D3FXv3ewzTj62pXushg93T8Im7rqGcQdOEyv5EcNyIC/F8MWX
         +pEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476377; x=1790081177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w9qFLTvgJUSRq4Cj2Lly0+SKYzt9MO14DnLjeqUt63c=;
        b=e9K99XbS377w9Yzz7dWlbi0VGWdrAEhVYBvytgdu6GoBEUiomo+Un/w8amacc9pBbb
         u5sBWSLxhDWTBoUGfHrzoj2jR2TgeeX/Err/rj6jAHnmBQwIk2IIDXPwqVVHuhjEYZo4
         SqumvWSGZ9rCh7KI1kmmpBIxGKXhZQpiT+/cgdI8aLmDzsh6PQkFKiBU9fUGU6ZBIc/U
         E8iYpTqvBG34/VvGQQdQMvsCZARXmEuPpptE9yBGeoTzi7arkIMAWNa1/8bNW9NPTZ45
         LeebAMZmPKsRg71Y4TKmkEPvljwx9ZeJZiyQv3X856OQSE1zfv1yGETalWlD6p8H+Eq9
         tFug==
X-Forwarded-Encrypted: i=1; AKwUvBwtzyxIwe1eoSIcA50+G9KyDSkX7heebQOYUkN4D4ftZqGA0AIz0Sk5th/t6kLVp8W5gw/0+jzx569NYtE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQxxalluJGedyCrh5kH4P98GDJEhp/5t6GL8RscaBNu29oDmMH
	wR9ZGEmTm5QP+s4edNLW0IruEiEgHtuT/XQvyJpzLd6H8eDwFaE/nfpvbe/Qrpwr1YjZOJNelNE
	FExMhwbl9ioj84BVLv1OnP4Eko2hvgmwjqIY/GfUq5Mzql6LZc6hzCSqncjZg291PinE=
X-Gm-Gg: AYBFou1xgLoc6TDNMLZQSkGQ3xt0uLqmoOKhnClcJs+i/YVVyxF/8d1qo825uJVGndZ
	Ad2BU/Ju+HYoV9gMafUrb/jJ31AWiW15QsCrIZ0kr6drRkCLi7S2CT1K21HJonzobNq75T19Fwr
	zcsWKxIcUiHODRmmVAgSBWSqIWQix17vuXCyQOZ2Wyx9djQ1/kZaZnHjitc/e6zjCGEQb8TiUWl
	NmDaqedwqlD3R/6EIFQk4UY3IPR75MxGmsPO/dgVTTolV37KY07NQDruvqPmx9tH50o7ZqaOyu+
	Fp2MehMz6vcmqYP3DZfbg+l+nBw+WdlywpdAwLCG7NVqfIf0IOcTxQNPROM/DYN3KEKZi+GbO4k
	/6Tm8VysQraxyJQ==
X-Received: by 2002:a05:620a:4542:b0:938:39e7:725 with SMTP id af79cd13be357-93a299a0369mr962788085a.32.1789476377205;
        Tue, 15 Sep 2026 05:46:17 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:938:39e7:725 with SMTP id af79cd13be357-93a299a0369mr962783085a.32.1789476376693;
        Tue, 15 Sep 2026 05:46:16 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f301121asm28920000f8f.0.2026.09.15.05.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:46:15 -0700 (PDT)
Date: Tue, 15 Sep 2026 15:46:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>,
        Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
Message-ID: <454ljf5swr6fqigv43pv467liciyzaez5f5mys4366qywqqoco@rdtfoinr4wsy>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
 <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
 <867bkw3zic.wl-maz@kernel.org>
 <e84587e5-904a-4cd1-bbc1-408a674ec1d2@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e84587e5-904a-4cd1-bbc1-408a674ec1d2@leemhuis.info>
X-Proofpoint-ORIG-GUID: IKKV9VXd6pZCGgiSOB7b-KLrZwwFvAfr
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfXz0e2OCWs4vQ6
 UQoqCyNu3T62hw0JPc02w0u5ZhQYzrWgYeH0TbVUzqdpG9Yy68dc1ItP16DZwl1L7BlpysR0mI2
 ZLHtNw3TIdwi+Kih51yC7qTtXh4Rw8Y=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa93e1a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lmjIgOJzRCt-5ZhLMtQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NSBTYWx0ZWRfX9cZoTp+ChI1M
 tAbNJntr/yG3Qqw/XqBSCIjPAzuBSj2BSMf4zuE3gXP1uGDC9aYobSFcUh/CItDbgjSasTGCTZU
 7An1wOV+nxzhlCNa9o2pt0hwbqs4Gd7MPJEppJ1HlIDh5oXWv30YZ6/435TszyozIZQl5RxpZuD
 KCZ9SQT07wcl6ueQSpYImzriKTZWRrGhrgY3SVLpZLBIIlKNUerC72iYvwPYdyb0cCSbmPcgCuY
 dcSOf+bOBLvGNDh4k+Dpl76GvOM6qUgOIWGV71syh2pShGBRenASW8D8QzOgsTatvk+HiS5/cJj
 DcsO+FSInSzqacGeRBee+Hj1lLaJU3lRP62fPjZ84jb7jV0KkX5m1LumpCpTHXI5nIfZlPAdcHt
 GGbrJR8csY9f4a4bOamWvIwAZh9IbBGcNF1vBeNQ1taXk36jVAqEIpBO5mGsFejOlA8mAggiOjF
 h9XDkkeJjCiiOVfvgDg==
X-Proofpoint-GUID: IKKV9VXd6pZCGgiSOB7b-KLrZwwFvAfr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150185

On 26-09-15 14:12:30, Thorsten Leemhuis wrote:
> On 9/8/26 10:42, Marc Zyngier wrote:
> > On Tue, 08 Sep 2026 08:34:18 +0100,
> > Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >> On 26-09-07 22:15:09, Marc Zyngier wrote:
> >>> On Mon, 07 Sep 2026 21:21:44 +0100,
> >>> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >>>> On 26-09-07 18:17:29, Marc Zyngier wrote:
> >>>>> Recent addition of QoS configuration to the X1 variants resulted in
> >>>>> systems that spontaneously reset at boot time or under load.
> >>>>>
> >>>>> Given that this is both very unpleasant and hard to debug, give the
> >>>>> affected user the option to survive such event with a module parameter.
> >>>>>
> >>>>> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
> >>>>> offending QoS setup.
> >>>>
> >>>> Lets not start doing this, please.
> >>>>
> >>>> Can we figure out which platform deosn't work and then maybe we can 
> >>>> add a quirk in DT per platform?
> >>>
> >>> We have at least 3 machines that are dysfunctional since [1] was
> >>> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
> >>> going to be the one doing a survey.
> >>>
> >>> What really should happen is [1] to be reversed until QC figures out a
> >>> set of parameters that actually works, instead of making this platform
> >>> even more unreliable than it already is.
> >>
> >> I'd rather have the patch reverted than adding a module parameter which
> >> users might not know about and distros will probably never addopt.
> >>>
> >>> Just like [2] should have been reverted.
> >>>
> >>> Until then, we'll have to paper over this stuff.
> >>
> >> But a module parameter complicates things rather than just papering over.
> >>
> >> I suggest we get both reverted if they break existing platforms.
> > 
> > We're in violent agreement.
> Did anyone submit those reverts? Doesn't look like it from what I see.
> Do we maybe need to poke the subsystem maintainers?

Sent the revert for the interconnect driver commit only.

https://lore.kernel.org/all/20260915-icc-qcom-x1e80100-revert-qos-enabling-v1-1-cc4ba943bd9d@oss.qualcomm.com/

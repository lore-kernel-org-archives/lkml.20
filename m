Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794146457;
	b=CotoJs5OGbwfdCpiqKWKZplIZ9RWjkyurQFO9bfnFQskK2vLhtkh4VSsp9v84CnLXQ3m
	 9p/4cX3cdE4RpzYzPmviuDFdj6w4fJf+Rpoa1r1fRp6NjG7hP1J1E8yb4fpTpl2Ywloqd
	 0ScmZR6Z5rklZKaP3k7an7kLTr1IHPZ9kFXjscfgWIYwXEScDGN4SsNlwvDDYy+jeOqIf
	 wmw5mZDX0mKeb7mBL9VY5rY35zj91GGtGqXYfCY1g17+WT6WZlbua8ZsVyJgeie9HYVbZ
	 YPN+O7R+TDUfJiOOIDGpGA8Vm5IXvfzsRS3fBQbcl+uCU/cjJQxMrVgCHK5by9Jjj2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794146457;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:
	 Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=6Sgr5rHph08uEngdMFMF5fT9z2OZmFyn/q+QRl/2PfM=;
	b=iqUGOLvy5omTfBrybsy0bsjqRw1z+h3A80t1gf8aWy+1Q8lsC+AUnHSHDPINgEkaiYuU
	 +j+Z+ONESFgoLPiW5x/mbqtF1tw1umAk7s8m45UrlBBD/17cT+WaRtlG2CNVHdMWXBfwx
	 1bcrYVr5gi+VBQNXJs6Y1lzt+YUua7+iu4U2s6eckE1Hx4dSSEXijZbKwMVEoC6NsWha6
	 RLRSfsS5RkjTHB/z1p9cXgvCiymFqmNZAlJbHBiAdmA0W8KM8C6jnyDVoDNLFZhacJ0HI
	 yz8ZJvdG1ToBdFSF+5Uoz0bJe9HNz4wBAjuxy/QdidMOmKr8TM9fhTtIBUiIhcZGAeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpVNazB0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kV9KleXn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9904F606A333
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 14:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9904F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IpVNazB0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kV9KleXn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A8E08Bc1299797
	for <linux-kernel@vger.kernel.org>; Sun, 8 Nov 2026 14:00:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6Sgr5rHph08uEngdMFMF5fT9z2OZmFyn/q+QRl/2PfM=; b=IpVNazB0Yd23lsVb
	nbDKCCa29nEK45E5TJxpyar35VoEq2cuUMztLUTvtfIPSCtibDCkVm4wt3mgcIvt
	TU6tAlWabIo3+dH0tm5DX6QH0OaPklwmBlYQT/eoxqLbHQzu6r6eiWNv7fi8j4PX
	wKK2vRwKCz+Rn6v+KW0j772ELd64eN5mokPCPxF9yQI9bTxzkwN030vSC3m5/uQb
	e+BHDqdBZx462JOFDw0r79tIhcfPzigSyVBzOZSmePa6nN19S6BwDjaws9fOZlYX
	V89ee1aIXbXsxKLoVj71HRv1zC6dbpqZV3NJhjdBMytQDT45Su53KkFS3fY42Mof
	CFqIAQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsuagu3yy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:00:54 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-67bec5d62ebso224744d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 06:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794146454; x=1794751254; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6Sgr5rHph08uEngdMFMF5fT9z2OZmFyn/q+QRl/2PfM=;
        b=kV9KleXnMktppRapNvrqO5g4P3ssM/S45+nfIDWnAeH3MItvWBdDwuUa6kPIbHlaHc
         HRYg30IhdjpoAoshqu1KyQL486EdlLiCaTDkS//CEOluuCH7Uty0Rz/I+/zOFfTwziwz
         UROruU9/4KSbuyaNF06tJUyffWRA1ci//j4iGe/TOEXpGlC0MSgpSy1EzdeTsdaeJcmd
         Nvk9ME6PnXxKT+3pvvdUA/I1MFpT+5EiT4ZU1UoWlr9vdXzLto8fvdcnMdgkTxlixIxg
         MutH55k5QtKeUBOtWEo5+/u7aUytsFdVsfUjE+Ty3Y5MPqsrrpGzv73+mzgKs5GgsPmu
         86zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794146454; x=1794751254;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Sgr5rHph08uEngdMFMF5fT9z2OZmFyn/q+QRl/2PfM=;
        b=cNAOLLwq9Ka34ZG528STOIrPSnNJnfKtyV4oPIJWXkVKubi+QIqK+i5gSXlpHeARq+
         klVWcxaK01NYU/Q+Fdaz9C9x0bSyfJ3YkesplGesUApitb8Fb3/W8lqIGHSKE+CzeZhb
         RWWqotJkoaskec9ouEEQXjf68/xXzBZ/J5gISf1MLIZOFIVI+SyU2t05kCrDL59cf6n3
         rzEy0gCUgRWAZ+SKGDpBPtlSutAN6LhKBAvtBtZuTxgUzUxa+pfEUao4K7J5L05+E6gw
         5WYSJdyq9RSnC2ZaHdOCJS34g+G/YQxq+lWnN+kj/SubWUMnfC9GIX8hFsXSUiLRYYfL
         VVcw==
X-Forwarded-Encrypted: i=1; AL+hErFjn1BECDf3tNYs5/sp+J/9MEdSACEOh8txAnRIvP9vf2FW+jOErGmUntEa1zBVt16AJkh3w/duOJuKBsM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L4BwkhlYQZDnMTkWpNzMt/kIwo6BPSto7dbZFpp+r3SJjcv8X
	IcjEPEEwgm7geJT630OAGUIQEtqEc3uLtc1jCoOCn+HZ5DjQ5WYxNj/6Mi+So0idMIUWAAKeDkM
	mg0UkLCr/a9QITBqDlWMq7akzE4ifeDrat8kY/padxtyjIdwrOiYDF/IyPYuYdAGxcwk=
X-Gm-Gg: AYBFou3cTnHuvXbErg8jx5zl+Au3yvd2NHtGy/D6kMXWop4UecOuLe9XdagCxnRHjke
	yjZX+tw5XMe+F2rZWpLlaNdaL8eEiugQuAtbwSs28ltJ+ejjtiiTmAwxd5ADvh1jfTB8rfC+lBJ
	cHHAGCz7/tKx2pPKzqUJT6RxUoLG+oyEhtGictBeXvJX651QEQ6ekVAEqQ1hY0VZoiDYRqiF/R5
	f9npCYeTf15RdlwU1ON+3oTQoZ78apvTJCEZCyZZPjM/JILjxnaH6esnbfUPslvwo50HsfEgyC6
	AqnKry4JI5ivn4dodYZxMZ1FjHLTYYPbx5cjjhVaOPJQHK2tObDR70+OkqLd88fXPR144LBAplP
	8B2CJxDUZwjbLaHi6U6UbRo6yckg9VItrbtE8osLZXAHxcVziYKtW1lXe/4VHQIX00BEf9P7tCd
	yzvQP8z/2vsQ==
X-Received: by 2002:a05:690c:660e:b0:8b3:b01:74b3 with SMTP id 00721157ae682-8b36cad8c4fmr9814057b3.58.1794146454193;
        Sun, 08 Nov 2026 06:00:54 -0800 (PST)
X-Received: by 2002:a05:690c:660e:b0:8b3:b01:74b3 with SMTP id 00721157ae682-8b36cad8c4fmr9813917b3.58.1794146453529;
        Sun, 08 Nov 2026 06:00:53 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbffb49sm14438547b3.28.2026.11.08.06.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 06:00:52 -0800 (PST)
Date: Sun, 08 Nov 2026 09:00:46 -0500
Message-ID: <c1a723190b71b663d73be7cb9f5141d5.guodong.xu@oss.qualcomm.com>
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Radim =?utf-8?b?S3LEjW3DocWZ?= <radim.krcmar@oss.qualcomm.com>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Samuel Holland <samuel.holland@sifive.com>,
        Andy Chiu <andybnac@gmail.com>, Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH 5/6] riscv: hwprobe: Report XTheadVector only when available
In-Reply-To: <asX9uMyiJMAzjIFF@blinky>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com> <20261006075303.205216-6-radim.krcmar@oss.qualcomm.com> <179133089395.137225.16486951642128892687.b4-review@b4> <DLYG41IFMP2J.12CCFGMZGC4ZQ@oss.qualcomm.com> <asX9uMyiJMAzjIFF@blinky>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDA1NSBTYWx0ZWRfX8MHLJAyYi2KJ
 +iXmpaT8HjwMCZXMpfIfk7I8XkQXJA16STSTezLCdwikpMzMhCL5KhiUEIF138eiYok93xRQu82
 sjiv7DxLpN2gDVQTv44/1RQgO0Pt2f5C/Whnx6/AfMaym8jozdxu0U60BCHeW1lpUlIoPB7+c4A
 xd2skIBnvW8L/Ib+tERn7vpYFPCaTxVWf+o1Lq/gOw70BlK1XZuous6p0DZOyMrhyeFfhWdEvC1
 zjlp5IGN7RMZCKKN3wBY6j0TEu1Ec+0X1NOfgx5+8y32Z+g2dWaH26d8JfK8YXbUrKRpqfKiyh9
 FqxkGrSuAddMNKBmtw3AN+y1QjTbEVboJCyoCheBf6OaUliMF7w6OTEzdWznLIOycpMAZ/yQLZr
 UU/P0u3tDBjDUNipHetT9iIVQbbfFH05NqqNOuCVqHDBGiNrUbKK1xkPYhg84p3GIjx+/gzheHf
 8XDHVW06X/nA2+6s4Iw==
X-Proofpoint-ORIG-GUID: DMJo9NY0Wy21pdY21yhAd7tDg2D4P6KY
X-Proofpoint-GUID: DMJo9NY0Wy21pdY21yhAd7tDg2D4P6KY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDA1NSBTYWx0ZWRfX3ZJKFJ8Tm1Ht
 lO40szc2T9HdHPUrENt+rr41y7L/rhHM9PXIS9IecsW4zB+IBiMXxFUzonluOXsU5gDxbvYr7St
 msgmw99m+ygZilt7o7/OjRKCa1x7K8I=
X-Authority-Analysis: v=2.4 cv=V8LoQuni c=1 sm=1 tr=0 ts=6af08096 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=6dy-whiJEFYAl8_pB5EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080055

Hi Charlie, Radim,

On Wed, 7 Oct 2026 01:07:20 -0700, Charlie Jenkins wrote:
> On Wed, Oct 07, 2026 at 09:59:30AM +0200, Radim Krčmář wrote:
> > 2026-10-06T16:54:53-07:00, Charlie Jenkins <thecharlesjenkins@gmail.com>:
> [...]
> > >                                                                      Is
> > > it worthwhile to make this change?
> >
> > I think that it's sensible to mimic the validation we do for the
> > non-vendor extension, but users of vendor extensions likely already have
> > to go out of their way to utilize them, so they can do the sanity checks
> > too... I can drop the last two patches in v2.
>
> I don't know, it seems better to keep standardization if possible and
> leave the check in here to mimic the standard extensions?

+1 to keeping patches 5 and 6 in v2.

Having the vendor keys follow the same rule as the standard ones keeps
the meaning of every hwprobe bit uniform, which I think is a must.

Guodong

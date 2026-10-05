Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D0B360EF7
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 07:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791183655; cv=none; b=DjnciufELXAHa9yiFqmby9OWqUrZoG0snxdGLtJD4f9koGyxpNlKJjflA28l7G2qJCZVicA3it/BCJXTdPHHu3ibuMpufKlcjz/ettppbBMn6jdzKPMgy7QlxrTxjepbBuFtvFM3/QujkeiiJIqmK4+EEUZALMJ4dVKZmbGn4dg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791183655; c=relaxed/simple;
	bh=hIL3L/HH1tlkPJXoLUtfGubULcEn3sMJ9QTXWNymtkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qIvbH+KH1W7kG6l/HLvuEAw/lixAPz4YRNDjm3GJ0fvAox7/grM6fJvaO0TGu/hfoUCu+DHdV772ENMneQHHcvCrf6vwJgJPCsvUPhS6ubM9NnIImSxb2+ctYDzW9qoqI1wCFdxXV7FtBQtNNHCHkbKXZ7qqW/8tBStsVJpiHJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO9qK2Yv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jm934QOR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TO9qK2Yv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jm934QOR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695107tH4061107
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 07:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sh7R+NUGgsXzLSIuUgY/DFj6UIp4Kh2aWWltC6nO4e0=; b=TO9qK2YvAJizDVKg
	mQz4xkmd4zuusiXCw2TsJ3i8hshS/poy6j4mT9Hmm3sJT5e9PcvY+6gLppIzptM+
	wcLzK6ePu1cFZ2VCpWwQDXOcfG6UQEZ80B0O/0r2hnThyRA02zZMjT8ehDX03juO
	xhdNkiHDd9TgxTuGrhvM+Bkg4Y5eb9SRrVwLniN7jy35f6vV2eh9ngado8lfLjUF
	dpQ8Y7yfHX0iZM98ckM+b/Fq7D3ZHAxVNlJdtIwwaUI4+uxtaJM9Q0BNUN5iq5/s
	AIpIxvIM7hxmRUhOGN53rgGdgUTSGFbthNFN7H2jYwtKGj5uGXW6J/HFRx7oBwtq
	nq2esg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn8rvk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 07:00:53 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98c73709b84so505370241.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 00:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791183652; x=1791788452; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sh7R+NUGgsXzLSIuUgY/DFj6UIp4Kh2aWWltC6nO4e0=;
        b=jm934QORdtI4iGTsrtKDtvIH4nWTRxpitUbQgj1F27aoFkawr6A4NYDawzkvmx+ELx
         38rglaazhLjXpbzhBIeyv+ejVkHiL5lp1gf68YOTJsczkpFTKTf/GMjyI47zyxJbSfKO
         18OS7ravyu08A8YcEuZVppnbFLjoa7I/GmkjT4HlyNEebxXC8uBmDAskSxMotUoxnWMm
         +11ELP1hqi7vNG72KaLZgUlPZyWAOu+eq8icIFszHeF8bjyQWRp26QdMKFQa0GuTfrNN
         BkELJH5XIXPtqdcmsPMwck1jF6HCIJWjOH17jEiegQTRDmG5/4E5aH/yPZWehvkVEGZx
         5d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791183652; x=1791788452;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sh7R+NUGgsXzLSIuUgY/DFj6UIp4Kh2aWWltC6nO4e0=;
        b=HV+mukGe0Zf4M9qVCwNHysPcll22YrfH4il//lKkJnSXLhQ9VXrsaGICIP9TubCYIJ
         BvVRKL1zFC+qXo5y+3MOOTbPM3ZnRxspNu4AIz4sGxOvh9ND4QvxKGIprEIrtrPJCC+1
         79MfmCjYZGdzUXszMcASt9+VjJliT88BkWzYzlzeQu6pQO3TtDzaV6M8qghH0nSlrKpp
         6/QeSau5yAGhwuAxC8NcsswCC1tkCVYEL2hCUCfq72XKgLUu5kc3YzbY4sKIHbCsL1Q7
         6gboLBXGb8CQiJdnfpLFWmNuYi5T3v0lQFDMRGAv9v0kJTftESdt6z/nmHmPEmJerLYM
         gA+w==
X-Forwarded-Encrypted: i=1; AKwUvBy30hA50j0C5K8+AH5TuASuHoF1VFS+Z33xw8x3MtDS2HyHI4oMaCZkrXrcIUWaaVXJ3+ieqgS/wz2snrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuHlnK5HDCFLbdD2S1/bEFTkmfWVnzjTgPAdSjrclujzr3McOp
	8aUFnSiQD714GSwG639rHuhaA/z6+nK0k21yHUWsu+EPZe6nCnIS+sLsw3aoxnBKlSo9fSSBTg8
	Sy2jI1pOhwQx4eWHd6JnP5MKPet7hSESi7I6NpG5KXzkdKDGQN8eWf3oe32z/zB9vyI8=
X-Gm-Gg: AYBFou1uWvECnlTlUvScdR8VixlNQM41uujEf4gSLxdl7Qzo0MBtQgCJWvM0iWHhKno
	r6s1cDR6M2dcp12IVBosvFqM3x/DzGeAhcnC38FZ0FWtyPcTo53CRLvlsVqdKfhTpyvSBpbBRqI
	++LJQGEg1gVHtIdRP4wxMwjQ5FadrPzPGQFs0Zzol/9IKUhD2djHTlWXrEkbKN273GOFSXBa8G/
	LWCWgCDmtIkYje9PpwLam/mTfMSMV3NeRr2AA4/ODQsHf1seMadvr7bUwXfwVyXEZ8zVqZrWOUD
	7eiYVHOtKLq87tfZCX8JpIEm3rUYjFVnmtQH+eTPThXEtA5Tc0c7o487bM3yIaumqdnzCaOWxBp
	t715kCNXUJXZ7Q4Yi2MzAXmmgHzS18Qz3HNocj4tNdql/ilO8Z3tZR0QhYlpKaZj6HARgJO6LNG
	61nzl1EzrPzW6N
X-Received: by 2002:a05:6102:41a5:b0:7c3:7286:c28a with SMTP id ada2fe7eead31-7c37286ca05mr1191227137.19.1791183651950;
        Mon, 05 Oct 2026 00:00:51 -0700 (PDT)
X-Received: by 2002:a05:6102:41a5:b0:7c3:7286:c28a with SMTP id ada2fe7eead31-7c37286ca05mr1191209137.19.1791183651392;
        Mon, 05 Oct 2026 00:00:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e2f7fcesm36896791fa.13.2026.10.05.00.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 00:00:50 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:00:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>, Ulf Hansson <ulfh@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v3 1/7] dt-bindings: power: qcom-rpmpd: define RPMPD_VDDMD
Message-ID: <qwedh6ykmzp6hs6n3pcjtsvptuh3oisj5xumi6idqlc2hems5r@i2vtyrwuheg7>
References: <20261002-sdm632-rpmpd-v3-0-95c47d0f26cf@mainlining.org>
 <20261002-sdm632-rpmpd-v3-1-95c47d0f26cf@mainlining.org>
 <20261002-devious-mauve-wrasse-66bbeb@quoll>
 <d5e9ecd991990098a4f1724750ed47f8@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5e9ecd991990098a4f1724750ed47f8@mainlining.org>
X-Proofpoint-ORIG-GUID: 0UWKU6uDyD7XKFW3ZbTEx3g7tZe_wK3T
X-Proofpoint-GUID: 0UWKU6uDyD7XKFW3ZbTEx3g7tZe_wK3T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX+SqBw31kFHGY
 47aKbSQrmKa3VjflIoZfFmTDf1GdLzRg2GXjRw/aKN/CLj1F4ne9XfcKjjlcJIV+VLLk0ztWb/E
 AXRuH7wyp5LoNZHGGjBGHije4P0Rgc747/bl2bvcjFvCxtGpiAqMWdNWy5FfCUb9AJMqeI8tvhJ
 pugcb7N2Er2pc+TaOsOjL7rCr0phXjMJCwGkWOj9cSyC6HHDn6T/ignOsAexiFf1en+n6kKcvrM
 zCmW/tewToBa5rUJhQWS0pzX6UuUpEaOm6iXvEVeshplaTlDyng7xkDdfBUDEVGdfgWtcEHg5kA
 Dlwcu/K8EMb04TZX3341/+4lmTORsNgboMWi9AUmjm3YgqibmWCywS0bMSFuID7qxzvSVib3bnV
 plyvzYMrvzEXKPVt9tGkEEyPkAUl5XWt2r/Iyn/uDQ4ZM2rM6NqQctgt/TFQN19qns9ypoizPQN
 wfuMBdYzxLfivSrMlaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNyBTYWx0ZWRfX1C/8G6a4kSs5
 SiLTZH42HF9pGnyQQ7FDPCPRHuNWNxRUtJdqwUb54REtgK57HcCFLpWVNQK9M8RMTY9qq3zEqkT
 L4AZCDWHZXk7CoAcu1WKEA87CHwshUo=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac34b25 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=OuZLqq7tAAAA:8
 a=1Us7COI9vatZr-rxjUwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050027

On Fri, Oct 02, 2026 at 04:04:50PM +0200, Barnabás Czémán wrote:
> On 2026-10-02 11:57, Krzysztof Kozlowski wrote:
> > On Fri, Oct 02, 2026 at 12:38:29AM +0200, Barnabás Czémán wrote:
> > > Define RPMPD_VDDMD can be used for SDM439 and SDM632 MSS.
> > 
> > There is no sdm439 RPMPD... The SDM632 is added later and bindings
> There will be.
> > header come with the compatible patch. Squash these.
> You have previously commented how that is connected to the indices.
> > 
> > > 
> > > Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> > > ---
> > >  include/dt-bindings/power/qcom-rpmpd.h | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/include/dt-bindings/power/qcom-rpmpd.h
> > > b/include/dt-bindings/power/qcom-rpmpd.h
> > > index 4371ac941f29..beb066b3aa8c 100644
> > > --- a/include/dt-bindings/power/qcom-rpmpd.h
> > > +++ b/include/dt-bindings/power/qcom-rpmpd.h
> > > @@ -15,6 +15,7 @@
> > >  #define RPMPD_VDDMX		3
> > >  #define RPMPD_VDDMX_AO		4
> > >  #define RPMPD_VDDMX_VFL		5
> > > +#define RPMPD_VDDMD		5
> > 
> > Problem is that it is platform specific and comment in that file says
> > "don't do it" yet you do it.
> It is not completely platform specific and if you have check the previous
> reviews Dmitry was asking me to define it. If i set it 10 what will be
> very safe for every platform i will get warning messages.
> By the way 5 is fine for SDM429, SDM439 and SDM632.

It's not fine, if we once get a platform which has both VDDMX_VFL and
VDDMD. THe whole point of having this generic RPMPD_ list is to have a
set of indices which can be used by any new platform being supported.
So, indeed, 10 is a correct value here.

> > 
> > So the device has nbo MX? Why commit msg is silent on this? Explains
> > not much except repeating the diff and referencing users which are
> > almost obvious if this is properly squashed.

-- 
With best wishes
Dmitry

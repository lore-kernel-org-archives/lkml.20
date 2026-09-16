Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B84A8FE5
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565906; cv=none; b=khzF2igwtZzUI/zMJSo+bk0Us/9M6nphSGUhCXITNoFY2DjqLlPC8xaPhFcQaAxC2kkzsefNXsRUDG2fakOk2XvyrAFnT4HMCmYWya1ZYdsRYiZ7eZ/+wr5Gc3Uv3ivdz3pKdm2FSYmGk2GAqkrQkOEsEwWSNH7KsAhWVAdClAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565906; c=relaxed/simple;
	bh=gr8uD9XWy7EPGvPIwLrmL5ImB5sWtzac4sXA0IvvQd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGWeaJzeAmOZAxzhGBAZhZjyOSiq5QZ888AkIhmjH0oYYLzXDFSpK3v7s9SBJ8ZVQBH0P7crjQ65n0flHefgBkhrq2+XMY0cBebMVLJm1tpvNnFyvjMfFH8gYu2dPNsVxEwCOzdzs397dzkTLObkZNiy+f6wl/08ckoZMn28HFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8kSfjgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY6GmmXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8kSfjgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY6GmmXl"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYZRS3291278
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LlhMlNHGEpK0T30X/QJXpo30
	EE7ZsUpq2JBHpDtamuk=; b=F8kSfjgkXsDY12jEah2EiaQ98LB4kaRz6Sw5gUOD
	dS3eDgCRFh2ZAlTRJWcgy48XpX9PzIAhjSO7vthSxzPJPWWNFJpzhJp8tEPrxA4h
	u873Ci8ACv7nlOsU/Dxof+ezLjEs6cWrJdbScBHKoIJkOJCit5ih2E1IKCc9RsrW
	8tqiyc37ynjhH2V2nkDN0x8QKoLp16aB5CpbzEz3vMKQcbtKTOSim68smku3mpnf
	Jr2fiDpHVMAZpKyHzvxkPJJzWnXzIRWTLBjtOnE1HQSOL0ConSZU6fnNXNekqQie
	DQXtDrzY/AfZkQ3j7P/oIsPs9mGOpByYOlSBYjOiyMn6sw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfk2wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:38:12 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8076c66efc6so5767640a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565892; x=1790170692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlhMlNHGEpK0T30X/QJXpo30EE7ZsUpq2JBHpDtamuk=;
        b=TY6GmmXl6/ib8uv3Ot3V+A7hpe1nV7WaAjtJh2DTJgi+RvnaWH0WhXbxGQs2/W25tl
         JzL5jE66B1YNrLST1a6g6M7+xRV/1yeZlrRAViRCGHhqlFNsvy7kqRvcPvBNkb6o+BWi
         3HFnmhYSDZuHra6x94y3aeuI9B7Xwq6SSeOXIR7ijIfJ6yKSEKTcgGvyFUG+w3Yp+i0L
         ymn3xLJ74biNk9FMxfqL3BchmeYt88DEEtNospknxEGb2o/3H80/5Nqyb8OlivHhGT6e
         aMn7GmH71Lp04Ya8zDGlEipejxR453DfOAR2COsqbEbNI6r6Yd+87NUzBnlULQs/yRnV
         UAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565892; x=1790170692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlhMlNHGEpK0T30X/QJXpo30EE7ZsUpq2JBHpDtamuk=;
        b=veKCQ/DvKGpmgne89hTTNZnKINhMwR9utJDgLe3btg1BEXsGmXccCoxguEJpM386EW
         t3904oxQDdyMvgSOZAz36i2KJp73mwB9mtGjAvY6zM+HiufEie5Ag+NJlRC3kPl63EFR
         rMvaw7xx3PXyN5mzcVpBXGieaz10m0DDRVYtkMxGMtazuG56iTynXtavOcc7vNpCGIw4
         pk+qXtKBocZ0HenAoMhPoV7FlBErx7+HwO97amUYq4cEhahUiP4KUdevSh9bfmnczfo2
         F18pwNVqSOCq3wZr6kdVOL3zgIqvinDBsDR5z6/6D3LmNhLmSJMCCRnW9tCc+A+sV8iZ
         VvfA==
X-Forwarded-Encrypted: i=1; AKwUvBydGABIEdyjLUF4fyMsIAsGyjblAeBjJ5fDkdg+ELFYsV7pbdX9nILG+/tKw/xW3jekf4QpBdJ/93a6hPY=@vger.kernel.org
X-Gm-Message-State: AFuF++meTQV0XPgK35w3SAL/eHFV5lg05ShaPHFGF1E0yJ3yvsGYI8bh
	exD6qVMdX6c7IlY1TIef5JT725Vs4s6E9oaV32kcBt082L9Ob14ei1gmvW5lq3kMZhVEvxSICeU
	Oz5WpU6N6Ha+W+XAmKNHT/P0bkIQfz+nhZ9Z1+iKt0MwMMTg6wTHp3Fq6wusZ+IyHlwI=
X-Gm-Gg: AYBFou16a26UuVwEN1+rQBqXQJoRkTHWSKIQKoJoNq8rczBeJ9BqhyiF+hEzEMj59gf
	G/395HbJLufiqOg2rTAtGWhpjGkjm6NTeD4WzpsjiH8a2lr7BflKxcu9OLJbkR8Wz+BEs2okrqy
	RwG8cdYZLcFn0WUZ5+IZCuxjIBNNBLuEm6b7LQnyBJJcHlLxM/y0A/+5QSehY0fZckhvzGt8Ncw
	eEHVsD7wSuCvLbuLAVxlQWcPgHMU/hiQaLgUJXobgNclY026UBI4y4qhRd50wFFgKNkCpVlCfnn
	CklSWMveqX8fVZCzsBuyQQn7iXA8IVGrLXwyQkNA7hyxauBVPc5ax57e3WKJnCDhQB7XsZ+LyC2
	8J1DeSN9Q2Q6lmcz1j5lNF23EYIQj1EH/2Lz9guuZXqg=
X-Received: by 2002:a05:6830:410c:b0:7f4:effa:a5ad with SMTP id 46e09a7af769-80b2ec5aac4mr4800099a34.10.1789565891855;
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
X-Received: by 2002:a05:6830:410c:b0:7f4:effa:a5ad with SMTP id 46e09a7af769-80b2ec5aac4mr4800069a34.10.1789565891485;
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0302sm2541841a34.25.2026.09.16.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:38:04 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 RESEND 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <aqqbvEH0U6LYR8UR@QCOM-aGQu4IUr3Y>
References: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
 <20260911073414.16711-3-shengchao.guo@oss.qualcomm.com>
 <aqfyPQ8bxxvBEB_3@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqfyPQ8bxxvBEB_3@black.igk.intel.com>
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa9bc4 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=8alAasM9Vt_m-_31djgA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfX8KbUVOVUOHDh
 8qZ/IjN5kb+R6hMvOJj+hg4lU3GFx/dLf1/E4u+pnNUcx/iFKvNAtaoVDa6kYZgCjTBa6K0KiNF
 GBPdjwoecA6bzjCqUWQL8uljuiaiqYehfaeLxJ12T2kdrjd9Rdp27UK7plYBa3EKuTHS0HvxQV6
 VpgaVAtpAEh/ZIxrj6CQ/c1tJ4/rCyDWLSCCk4P/CyGQEbOIfErqahvpoJ7btJiUQbr1RoEjjAK
 6ZJbMDHy+IvIcsSbwJ3OpMx5HnTM7Yo7nUba0ajZaVJsy4hkEF4U1riIXh6z9aOtYQo9nBxVA1x
 rSoGklSiT6giBTZIs9TivZWsoHK50OmaWsrWMx2RaM15yGCJqt+uXfqnJrTQ3ZC2bf2woqPkzKh
 YSNSz3dtfxC6bEmofqRI95T7qQ/d7qw/qHPUiMjrSojuUQoFrfvT36Iv1LzTTPILb+QDb43Qxe+
 wmBD1OxOD8mnxvofCjQ==
X-Proofpoint-GUID: hI-E7us5cyfj9qI01oJdgeeuwIsYXlHu
X-Proofpoint-ORIG-GUID: hI-E7us5cyfj9qI01oJdgeeuwIsYXlHu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfX3tmpgESgR/7E
 YsKalbf2Mt+tQzqNay1p3KdtOb1nejubZGtOp0QK6pkpiMG3bauYK2RLgG0iii4ILZFsJY9cFL/
 /SmWsttUwazzf237duQSutWAi4XNeTE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160182

On Mon, Sep 14, 2026 at 03:10:21PM +0200, Heikki Krogerus wrote:
> On Fri, Sep 11, 2026 at 03:34:14PM +0800, Shawn Guo wrote:
> > The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
> > which runs the Type-C state machine and the PD policy engine on an
> > integrated microcontroller. The host only observes the resulting state
> > and may ask for role swaps, so this is a plain Type-C class driver
> > rather than a TCPC driven by the Type-C Port Manager.
> > 
> > Register a Type-C port for each connector described in firmware, report
> > attach and detach, orientation, power and data roles and the PD
> > capability of the partner, and drive the USB role switch of the attached
> > USB controller so that OTG role switching works. Data and power role
> > swaps requested through sysfs are forwarded to the controller, which
> > performs them asynchronously and reports the outcome as a port status
> > interrupt.
> > 
> > The controller exposes a per-port VBUS ADC reading, but the Type-C class
> > has no VBUS attribute and nothing needs the value, so it is not read.
> > PD messages, PDOs and alternate modes are not exposed by the hardware at
> > all. The chip-wide MASTER_RESET command would drop both ports at once
> > and has no caller, so it is left alone as well.
> > 
> > Assisted-by: LLM
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> You changed the commit message, and that counts too. This is v3.

The resend only removes a Link tag. I did not know that removal/addition
of tags in commit log counts too.

> A
> few nitpicks below.

I will change those as suggested.

Thanks for reviewing, Heikki!

Shawn

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF0D330B09
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789550151; cv=pass; b=Z7MIaCtRocdd2Sosjfcto/QJgOYXhd/NxkfZFZlr15RuQxlL13EqaFFfoVOdp/NPv9OyL/LRytOReW6/1K0Q5pm3ygVABosuyCSgGInWKMgFdwSTdNAM0yohWCEwidGCzbnJrrzUI+iY6KVXJkHd8wZFcyEFkiHUcdywUMtp7/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789550151; c=relaxed/simple;
	bh=eUKhNcWpU2ARzdkZDtwBSmH3wpzbtiCR0j9k5GGyr8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/wMp7WWVTVv6HWI66I0/gedlXzH/utfXgrkJcYIccbmX8RJPIQdsX7vSByr7QTTMP9nzgdgUTMjWYBOVgX0nPg8L8NI2m4/ON1hUrSat8aW22YlVLudkqGQpVIO3AYWAMaamoTy9AUx/YxBHAtAKK2VbBMnLMeIJDfKufv2sbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zvc8Bs5i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GP9Hg8Tn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zvc8Bs5i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GP9Hg8Tn"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92oUF2122499
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=; b=Zvc8Bs5ipRjbNbxZ
	GXqUEMb4SfYTUx56DvNHUA2kzqVDMtdmZ0CrBI0Rz1gYI4yKPPDv+77dYySl4Svb
	LipDZpsaI4jTBVMdF/j+M4R/USG8O0yvN6/nIhUjJeabRdeMtPO5F0IKUc4Lv4lm
	QJ2q2uGXOiY/e08ax/VH/cc4+b3Fwmqj7+f/dNuVYIQm2ewF2zS9UGN+S+ZsQTZP
	7xPa7wuEyEXY6cRGnvfFY2bji9Ct3b/qv+S9kUIV/fkymi8sGjVaJ3VGocZ5UesJ
	8KydK1JPZNM7FV8+8GnIJHh4jTUit1CWkqFRuG2UN/9hsqhqfoGAExitP44mIVj3
	486qLQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7h73b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:15:35 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8848dc67d24so61888157b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:15:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789550135; cv=none;
        d=google.com; s=arc-20260327;
        b=pnriqTpEeQm0+kRwcip9BiOTCPaz8L0sESirmM/9z5EOSmUHgl+nHbV/shU954FV0A
         ssbXBacQTsdzIgAj8aikmomAymkkRNJhL4Dz701ypWR/hSHCZufPnier+S+mTxFfubsv
         CSZd+6sd6SrNxW02Xn8TdYyjNiQW6yVoFfvYNStJluW2y/3HHf3Kn5Ei6E3VQLJkEt5C
         ftt/kxLxJQmA7mlXKClq8rtJuIIcw85X73ahCIjZXeSZygL1L2YSlXWkEiQGJb0t/tUy
         eWH+xlFbLJRlxttkRoD63+kis8qbNizVoIJojzZcdsqNov2joN9xyCKwtbekIKI9ZHL6
         RCUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=;
        fh=M94MP/DsMAZMJoKdEXZitujUWbTWywIP6Y+OmauVBbY=;
        b=kHXUFYL0HUzzuCUipeFFLixYhwuVZO9At9iJzgy7TGmE4k/xxoBI1qGdKm/xBiJsVz
         /3yasCKbnQ6rZUDzDX9xJunCYJjnlJzPGCZ3E3lyun0EReDO9Q3/Lk/ZEree/+14ZHuS
         UIm/gKHIXkHLguc7vf2xK3z5M2UVDokMw+KbwdNMMh2geOeNHQoVBcDkzu6jzIuxbs6K
         ZAGUH4wxH2HDaxaUEzopPaiL7mQiDNaUbh7/WKbvXkJcFsLGxtp5H/srL/wTXQGPHxdk
         lcljx05Vir7uSh70py8XyLTU6TEXegTyqBVKWUvOzloMSn8apd0Ftp4VmVCF1uAf4z92
         rR/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789550135; x=1790154935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=;
        b=GP9Hg8TnCWqXcDzkdRS2o1tEs/HcqghREiQCAzF3S+vgrkAPfOABtFpSk9WqZVw2or
         /nyX2gTcjmR6ZCdDEQ9b24YcZeDRt6qFj1SRXUaJwSMWYE82BRviOW0RCtQ3y7L98be3
         uirh4zrUWhlYccoK3o5mYvUpsNqkv50pTHPw7EN1Zcs+jXl6MqaPGyq3l97/aX5h4/Cm
         R1wJF71gcc1jyQnQBHKcVjLqvbnjWanjdFFnPSuQYvH6wkWtF+kjHxF47r9IrF/Qlm2b
         NQF+j0IkxH4rymGJXXK/PHLL05fWhtwfQnblF+1b17O8HInaKZxQ62LPxh0F6uDTuBEY
         YQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789550135; x=1790154935;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=USktFg+8SniSggZb7tvnYYwJ4/8bjyzpvcoyUOBNeTY=;
        b=hA/hPpC7pVeWZg6prBLvoiBfdPc4btiXmpQCEw7bNGyM+6NkLhJBy2Pt6JS4g7FbeL
         TjuOnEfhS3Jq01+B7rbl4tnypAbDF8PyLMDmW3sfBv6EohLYCZZu+AkA8t0JN8LbBSXB
         H+gIyrFccFAPF2IRm+sqm3VoIv/uSjB9Sv0tzLWD9UWIuA2mNimyvs4WAkfAKoSVzMqc
         Ucs3ZBTueg5t5sWhH9ew9BMR3MA1kJevLv7gV/5+c+HASGN7HHl4PVRyj8TKW4HO0//O
         nR2dgyA75sBIW7SCf3010tqXp/S4PTVRuZJUxqLJlYD2oYzrnIfQoje1VTYms8zcjZ2e
         k42A==
X-Forwarded-Encrypted: i=1; AKwUvBz7j3jbuSLj7KbF3E8e1AhsqJ5x0gXgqq6085S7LD7B5CaJhhPtE6K8jBtbTW6OhzF0GBJm2HeUfvMgmG8=@vger.kernel.org
X-Gm-Message-State: AFuF++lZYCrdo/d9/Ty8+td+BUNfp38VzpnQdH84FyMAASNq4NeBAkIG
	9uOwROGuMWIgJP4rnfMTAkQJ1BlfEyh6AfEYmb1kl6KJMc2E6k1rdahiaIC5AruvdW6dPVAMtBS
	jtX5SeDGg2S+4d2GhPAR1nLCdYfh14Z0v3gOZqTiW+6mRi4OZJ/CugE5g2JkuOtL9ordajNup5Z
	AAe7G4OrrZkG0wfrh3i7RK82+BQBo8MTQczfRMwCOxSA==
X-Gm-Gg: AYBFou3uhuJrlZZGZmaIygyBrEGiUqElem1k7mpszuMmiIIWzy6n3xnTUpykbIJlQnr
	s9ligbmgHSNZd6p88lB3r/H/GTDol6ej0UfOeyrY4Ib5QOcti4YsFEh7PLq+UHA8tbOrMUgQ85b
	LBeRTUhZAtL83E/yhKkhWQ4fIlCZsobOl3j30e/6mwBfL7JYeH1QaCmII=
X-Received: by 2002:a05:690c:385:b0:873:5bb2:6c1a with SMTP id 00721157ae682-89226db1a37mr4902837b3.68.1789550135175;
        Wed, 16 Sep 2026 02:15:35 -0700 (PDT)
X-Received: by 2002:a05:690c:385:b0:873:5bb2:6c1a with SMTP id
 00721157ae682-89226db1a37mr4902807b3.68.1789550134775; Wed, 16 Sep 2026
 02:15:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <c21803b3f2ea1522bb930dc1dcab79c2627f2234.1781620559.git.u.kleine-koenig@baylibre.com>
 <6971c4b5-d091-4fe2-b843-60da8b32d48b@oss.qualcomm.com>
In-Reply-To: <6971c4b5-d091-4fe2-b843-60da8b32d48b@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 11:15:24 +0200
X-Gm-Features: AcwNN1V0NqIJsL73RdN3OTwvvhD8xwl5xJI8ynUXzUOj0tI1Mn5j1g_pzOzGjfw
Message-ID: <CAGgiveVKnWZCGMy4WrHn3szmC5HuYzf6kSb5-0wvOdVntBPJGw@mail.gmail.com>
Subject: Re: [PATCH v1] tee: qcomtee: Drop unused assignment of
 platform_device_id driver data
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: d-D7kNeAAQabQIfGUan6mVsl0l_Z0JyZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOSBTYWx0ZWRfX8J7vQTcEgD1R
 cE4gDSKJ7L6J7oVeTjz7ojVNeqp+IfK9YqiQtqs0pm0KRXIIZf8aDqnBCh7oXHR7Zc/ACqzM/zR
 yfHkBs85XETOFzhksAmr0mCgoZRRtZRgHS/DOrAtD3j0K5GRthTSpCUJfPEvoVhzjzuuBn4v06g
 iz9B4cJHsYXZHlyFqp78lfzNq8kMkzb2smNBCu7ARRIv9U5FIefEQpI1TR9809xMUSt4bf9itpM
 ewSKbhwTrQkrDXcq4eBm1HDeFxSRZvEg5lfTw2UD4VfZFWP+Jfsg9/g5gln+g22IE3IEXJ+83if
 Q+0rY6Nx8l9GNvPpmvOZfXge9i0M8M9VKy5obvaJ1QMoZeqb2+ah5nxq6dqw9v7kc/g9QL2oZU1
 ryNb7AH7YInBSXobGUiJ1KQDn7pV5sE2Ov1bvi9xiys0XlV8dMtY2MxfggwVYkE9pCkLL9Ok6a0
 guGb0RcrVXR0D2fe6jg==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa5e37 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=IpJZQVW2AAAA:8
 a=FvL8mTaZ2_32tAcSk_IA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOSBTYWx0ZWRfX51J13I3cG0lS
 oaXu9TMvSbO0uId89/HrqSDV0ffufzSd+5B0g0lvVX4FVNbQXAuJWdFLTaTV4vTIFVgISNBpA7E
 KMPOSCF9N3u2VebhW14xdfoGwBm1fm8=
X-Proofpoint-GUID: d-D7kNeAAQabQIfGUan6mVsl0l_Z0JyZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160119

Hi,

On Fri, Sep 11, 2026 at 9:36=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi,
>
> On 6/17/2026 12:38 AM, Uwe Kleine-K=C3=B6nig (The Capable Hub) wrote:
> > The driver explicitly sets the .driver_data member of struct
> > platform_device_id to zero without relying on that value. Drop this
> > unused assignment.
> >
> > While touching this array unify spacing and usage of commas and use
> > a named initializer for .name for improved readability.
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig=
@baylibre.com>
> > ---
> > Hello,
> >
> > while this is a cleanup that can stand on its own, it is also a
> > preparation for a change to struct platform_device_id that requires tha=
t
> > .driver_data isn't assigned by a list initializer.
> >
> > Best regards
> > Uwe
> >
> >  drivers/tee/qcomtee/call.c | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
> > index 0efc5646242a..4a597eeaf174 100644
> > --- a/drivers/tee/qcomtee/call.c
> > +++ b/drivers/tee/qcomtee/call.c
> > @@ -798,7 +798,12 @@ static void qcomtee_remove(struct platform_device =
*pdev)
> >       kfree(qcomtee);
> >  }
> >
> > -static const struct platform_device_id qcomtee_ids[] =3D { { "qcomtee"=
, 0 }, {} };
> > +static const struct platform_device_id qcomtee_ids[] =3D {
> > +     {
> > +             .name =3D "qcomtee",
> > +     },
> > +     { }
> > +};
> >  MODULE_DEVICE_TABLE(platform, qcomtee_ids);
> >
>
> Looks good to me, thanks.
>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>

I'm picking this up.

Thanks,
Jens

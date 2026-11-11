Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794383834;
	b=eVSK62m4cZjS1HVztjJZ7hvMA2bf+7/rrBCk203EnQco+RquyfK4fM97IAJOAzv6MD12
	 kl90boxLb/Izw3mgwtvRIo8icl0uphEvk2yJV6q5fExdiJlS+4BBi5aSbRBxA3P4osB47
	 ipJ17ACJaNZgbHMRYfnG63JiNMa1WQm1kxc6UOSgv59caJlghqP6jc4rF+d0qzxCuflql
	 rLFUg9Mas+/4HsK+dw8cGsuGh5+yBpNyPPg4DBkHNDGXuLzZNtmYWQiP8xeKRKXlQPTYW
	 lSIdh3O/V0kFMM/De16uIff/5JLPU0CVxm8uPf9ZT9whzd/jkc5Cj8wp1J6F2+strOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uVN9ehbX+juUaswgjcc1y08qWf1uQq1soRn9jz/Nxc0=;
	b=QNqgOBYjkqaHriR63pj6iMoSkNkKQlpgyhgeK3hcxYAYNOarQD3qmv88HJuvcsZ49HU2
	 u6DH/bgXjGNunSVYK6CSiXxzf5k8J48kcpqQZujBCW7Drky4oULry8idBOs5lFQsVRGAT
	 zoXgSGSpoo2QB892TpMq4xMldd6CbZlMFwsU/E75ZCgAFgG8x3eLgqVX/73/RJ4EQ1/oy
	 xbiZOCcOEF1g5OJIB9AqNYqoXW7JlU4vy0DamLQMcPFWi5LHXHe3S8m48E+BGs/c56vfm
	 qwQrOsEgyCx/kyTloTaULL0jBed1Z1p0tYVpcqUYpbOdxnk2fham6zj6nglZdcKt3nA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TDgAr5EX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gx0HwD7e;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F493606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F493606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TDgAr5EX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gx0HwD7e
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB7DOWM1590038
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVN9ehbX+juUaswgjcc1y08qWf1uQq1soRn9jz/Nxc0=; b=TDgAr5EXV8YAyPJG
	mjLztF++mlItCs1VnDCYxToS3W9CnRSNp5oWmXyYbfwtkVHc5js3TNTO+AFZ8Hfm
	V+CratE73GzWQd6KYxiMt17CpEJZQfd22Q/LBTlXbInKcRLai894drA8c7kxuKne
	ss7nZ47XbZ0tQUGCS7Vfd/Pzsku5P81XNwkWxdzx2GVwFX0c4MRRW+iCF+wBwFbe
	9G7W1j/Z+4kc1aCuKuQxkUZoGDDELeRP7sHjdQWt04va7BaRVMWu8PbX5PAO/iaR
	emUTPHVR1Z5hPrdDyz+aQaZDoNfUFkh2jl6lBev0T47gjasScrkPzQy2B99r281Z
	a3IoYA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvksm85c0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:57:13 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-836c416b236so53266867b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:57:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794383832; cv=none;
        d=google.com; s=arc-20260327;
        b=AwggDjHT1STaSh55wVaCE154boFRtdkzW0jN+BfF/Nhlwhqd+8X1uVdKOrViTrkKOB
         90Pj5weEU+jrJgOesUFu35dddxWdCIpBQKJqpswYLvppKnyqFKXVtrn7yt+Z+u+curUh
         UFIvU8SIU9XulI6NU1Idba5DedCT+AxG0zUx55vktxJUjxNQaDhvksgvDtgJr8ONQLXu
         oIlP8m8ZpqkH7ih81kp2DypQiyDRUZqD6bPY2zBVjEdEYgC/hDwYsLlFLt+86saNdlH3
         vp0uIRI+wfXUYj50w1ia6m3yUDQrx/sIjDyWvZNyXVruVd/03zcZA7taC2JaXfIRKWv3
         9VbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uVN9ehbX+juUaswgjcc1y08qWf1uQq1soRn9jz/Nxc0=;
        fh=tTEPP25iBHrINBLv+6rmokhmQKeXX1vSrhELpSUEz20=;
        b=j4JKrCIuYzs/+/0415B+h5yxnGIcU9vAaL2NT9Elmvf8QSBYjAvRXtY8KEijhb83WV
         SDJQT3NCsHHSzNSq0h3j4cVFgIdMItq3LNXccHTRTHWOsyqtC1XJXy3UjRUA/t9pIuye
         haY/Vi3DOE7kf2ITCEsop1ovdQQUJoCEoplL5ZBg6kiLYDiqCCj1G3pe8LwlGl4LsOSw
         qyr2VO29s9E13gdmBtNy0TQOtee8YgUgG8/Y7D3+RReDskLtfXkZQ2zmiBPfZNbrVAVF
         YVM34RlZDIaMbqHhjVmIG2L2jQynuP88EhQEqp6SfurQ1/vsbcHlui79xkicPuLvh/sX
         Iq2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794383832; x=1794988632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uVN9ehbX+juUaswgjcc1y08qWf1uQq1soRn9jz/Nxc0=;
        b=Gx0HwD7enfFCtD84H+Rh7n2/WpYPnJoAigpzuCYojKmAVi9R9O5YO3wf3bZ9Jm52di
         TVqchRww/m63R8Byo/z9/Hpw3qvnuVqxPurOeG5MMrvdRMgnrwdGf9ATVFZMYW6/TJ5/
         NNnulih2B4zP5V75Jgcn3etYSwiP91ZYC5IgDmp6zGK11qh0PJzRx39EuLLelMXyM2YD
         KSNWh6UwPqTZ+r73lUpoUURGWoUVMSCeHczUPF/HKpmvh4tjVG3gcigf5xf3GDJm/6Vr
         GPpDT+1+H/emf8Ze9w/KkHa+J/jeY01aBx/8dSM0f557lrt+AL7b9vb932L4NxZhEH2e
         DAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383832; x=1794988632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVN9ehbX+juUaswgjcc1y08qWf1uQq1soRn9jz/Nxc0=;
        b=sEfLQX75Fvdvkw3q+3iRUxxpY9w/knQcbyAD6iqdb114C5XcklJBIIvDPj2JxoVl82
         /dMx9f1qVOUPUxLCYmfWF47KFTLwmjnEmdIsm3S+7cI0mbX3dgTEerOgiPRoNzanp1is
         mAnuD0UBRrWYbtF6AFp/48+57JQKPL0OVXCn7PzyI7BnPQwpg04ri880bmrEzAmIeNT+
         K7u9a8CCL8ugLKGCf6g0pWBx/s+UGBtblZVPfPblsu6AGDKdhKmC+DQ7fUfIOFuGDB/w
         fignycesEZDuh11gRI+vuxAKpGCUnhZTKXKj0I+Odp3NxUI8m2UfjmMf2swlK6Uogiq7
         CVvA==
X-Forwarded-Encrypted: i=1; AL+hErFW43JlDl5mtsZ8Lu2InH8bctfgfmgfizAoT6hrOa1WhBPOtFMK+lsKlyc3LhkD5YTpiWmCUEvoGVFc0ec=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vmHSmAtYx9l3w1/KKZEDiakeWSiyymm/NKrm93dghIaAhZgRg
	BAAuWAa5yWfeP8wZJInigXGv4gdksd38B7DraVboby1b/8ADy5KyrLBmH4zeTWDJFZ8eaGxFlpp
	H8PAX9Bg+e9San1PV8+JEoptmEfcvDGaYfbdRF+rEzAQOjxLzFZSEkcu7ndmrcShpx89Lcgglkh
	5KFhmddnUzzmuNZPXK9nM+P73zyh70hHtmkAqUZQpxGEibVm+gtC6L
X-Gm-Gg: AYBFou3BYa92i6UXZ0l17Wk3U+RL3AZJWR8YWel2OM0mm7yA4oWsi3D16ANYyytXOAr
	vqly/Fi4rO/TyO9G9T1UENUESD/uUGqE4p4ODLn0bLqjGunepiWxEoAlgNmHsx0syLqlO8YMOwi
	3g+4OZ/H0Ms9JocSpVCxO7qiTEeSvneeERE+5P1ynEI64oB06xzNy/cAa9Mg==
X-Received: by 2002:a05:690c:d94:b0:8b3:b31a:1dfc with SMTP id 00721157ae682-8b3b31a2a20mr1165207b3.57.1794383832487;
        Tue, 10 Nov 2026 23:57:12 -0800 (PST)
X-Received: by 2002:a05:690c:d94:b0:8b3:b31a:1dfc with SMTP id
 00721157ae682-8b3b31a2a20mr1165107b3.57.1794383832045; Tue, 10 Nov 2026
 23:57:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-aquantia-poll-global-status-register-v1-1-808089824a3d@oss.qualcomm.com>
 <12b07a59-c087-4ba2-8d5e-40b2a6d6a72a@lunn.ch> <CAPTcHHRv959iu-4V6dAWwfH+gRy4nt0M0MGZYL3CCiuD+Gc0jQ@mail.gmail.com>
 <d6bfe1cc-f925-42c2-8628-1fc5978904ec@lunn.ch>
In-Reply-To: <d6bfe1cc-f925-42c2-8628-1fc5978904ec@lunn.ch>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 15:57:00 +0800
X-Gm-Features: AclHuK-hytLQX62FzXkKSkwIVZ2K94dtdhWY134T40oWN677gCjiWZm_sI3HmSU
Message-ID: <CAPTcHHRmee+eRYLG30Xu0gTkhVXwSzGeKG-gixduUvKsyVWbFw@mail.gmail.com>
Subject: Re: [PATCH net-next] net: phy: aquantia: Poll global status register
 for provision ID
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: kQ3g2Pkwfir_Tbj8pPj__q32IvNk9Hc7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX9J9hdVwkGHZj
 wzsfB/Kj00JJB1PPykyvjYqxjdGSv+u4q4xyKhczugDhIHUftCoTDoFtNUVo2qv9pmAWBb+8Hhk
 WDSWQPpmrE0oU2a7BAdrplESzVX8KEUHXUp6R2g4KirMdfAULsbUuQJSvl+iqioloUdKUg41rKk
 wzgGhVoCUD61kxAAxbIG1+m04ByTB5DPovfFUzmhlvoPAi5/oxa/xeobOkJa6UCO9mBCGbALDMX
 SldwNrdX6iDvXqSj/T1vqVllBMa3XQJwaoOhloP+GOSP2EtQYDZo/hjMF3bPs6xG4iauc4G4GW1
 4TVVlohnnR9dIN2iDJuUmiwxAcrLjLqyidOLTjJ3Yq1j5wZwgRrGSLWEOmC2KVlIXwtMf96D31A
 MZoSiprAvM2liP9tkC9OZz6CTTERfT7pTF2euqmYM7mXhAtqH8F4J4Ui+fi6svfq2R14fHALbiJ
 /nyhcu/w1Ac/jV3x1qA==
X-Proofpoint-ORIG-GUID: kQ3g2Pkwfir_Tbj8pPj__q32IvNk9Hc7
X-Authority-Analysis: v=2.4 cv=O9isLx9W c=1 sm=1 tr=0 ts=6af41fd9 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KVbMDv13y-5b161CbQoA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzMSBTYWx0ZWRfX7Th1UQhx0Thr
 c7OGjr7MGnzWkGTcQR+lEE9RfcTaAQXZy2uSseGG4LkbNZsUN4rprhqeB320Zus3zfnmVVzYBR4
 JfqHrqbXNiKbFjO3NThVq6s5P6bW0ow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110031

On Tue, Nov 10, 2026 at 10:41=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> > > It looks like USXGMII and 10G-QXGMII might be mixed up? Is such a mix
> > > up not fatal?
> > >
> > >         Andrew
> > Is this comment mis-posted? No USXGMII and 10G-QXGMII related inforamti=
on
> > in this patch, isn't it? Please help to confirm if I have any
> > misunsterdaning here?
>
> The provisioning ID is used to determine USXGMII vs 10G-QXGMII. If you
> don't have the ID, they get mixed up.
Totally got your point now.
The chain is:
aqr_wait_reset_complete() returns 0 on timeout =E2=86=92
aqr_build_fingerprint() still runs but reads a stale/zero prov_id =E2=86=92
aqr_translate_interface() fingerprint won't match
AQR_G3_V4_3_C_AQR_NXP_SPF_30841_MUSX_ID40019_VER1198 =E2=86=92 USXGMII stay=
s
as-is instead of being translated to 10G-QXGMII for AQR412C/MUSX.
So for AQR412C with MUSX firmware, a timeout is genuinely fatal
because the interface mode ends up wrong.
Will change the commit message to describe this consequence, and add a
phydev_warn on timeout so users have a visible log hint that interface
mode detection may be incorrect. I'll still not fail the probe since
the existing caller already ignores the timeout =E2=80=94 but the warning
makes the failure visible.

Regards,
Hongmei Xu

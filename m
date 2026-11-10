Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794283660;
	b=UpQJog7AYZMT5a3Ke9bDZq35+XPjw2kG78v6/OHOBdYcDVUhmYxjHsBHomROcsDy4CFL
	 I/CLy3HttvSjAuW+l3cKFkZC+McLtyKaxOKoLicDmAIovn6b1SlcX1mr1j8vIuq4rVtLN
	 HaahgS155NlolJdEiTVogxonivtiMlNnrrHiUB7AVdpI4EBVHJj1uYRpmOx8FyMhUqcbS
	 EJKUntDo+R9UFK0QdK5Lr3OMOQttjk+uASFQAo+2+MlWYWckAxtA6OPDfF9WNl6ESVsei
	 ToQ21jHSBJpyjgDPrDJfz9SMWimbWNfGGvDmZQ/ZAQYfWTOa+7+pLM9DUqcxb4RUn2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794283660;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kSIDJ9xADSgbR8w3jhiqKFrL226TZqy9jddz1ef76QY=;
	b=1uzKN8IcDVqaMcbiCTdDMtushKAdkaOW/1M63KrXMknnd/P9p5v10OBVtTxTqrvhZFOf
	 tgzFSz6Z4NkrmjgHzKE0YFs3SM5Rpcewck9jRpccDYeSQ4/Pud/ZVa67ovuwsh5GP/Y4l
	 nWPrTd7gvjXvWFqQoOpHcp9Bt2xMU3HgdyMgO1XYdyti+gxbeZL0XBykYwDWBiGQPLcD1
	 YqwJCSqLFZehTP3aposulNFCWuCoXA603LVrpAvjdOBIAjxGnBNYbhD6v8emup5Diz/+W
	 6u2ftAtOTtdC4AdcHadkRegf0hWNWSXRE7LiFnUYJ8egp84B2xp6rBc87L+NEjmhi6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGOKsDS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EW4ji56U;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50653606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:07:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50653606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGOKsDS3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EW4ji56U
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA0jKI61514170
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:07:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kSIDJ9xADSgbR8w3jhiqKFrL226TZqy9jddz1ef76QY=; b=MGOKsDS33AD0AnTy
	fzttIr+/DiatPZLguT12Co3gWSeAiF0AtXlDZCeIuA4Pyzwps9Sb+3/jqA4jnGCJ
	JX9N9FlcNy6I9/29RVgwba/xPrhN8QoxEAEruCjWA8F2ft5xvRj7cwejSvQ/tOPJ
	ONnMZd/ZI8E6sZmsU5UeMD7cNEJG8CgZpV90MSgDyp9cbfOdaEy0Xf88VAbBl5gu
	nuViKURSJMTbpCHX4vcPoC4zQEZ0lflBTmQi12/2ykxErRXsHEYyYurGmHTZhM/g
	TICLBc4cd7OlC8HRtjrXnxUd/RyPGMtLn7+rBwdstMFqVjAM0bCVl7u8Lzbavynj
	t7IN8w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydkgqd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:07:38 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-67bee42cc71so3990758d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 20:07:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794283658; cv=none;
        d=google.com; s=arc-20260327;
        b=KTBfFs7VsgQuLeIP9WuIek4T023TTVO8X0B8zq9NoHaIE1FzwUxeEa0JJh7qNxlskJ
         c0NPT5UkubiDRxCGGcOuvW7ceUU/SMrf7Ue2SLzJdiH57U+wQCIQK2bMgX2QZReoxyDT
         yYvjgLXNYPCfVSJUIhFwVIKzOlgm5qdti6K5CCaEIJZJB//vV4B9UyAcdo4fRKfmbaIF
         gA7GuGnDAc1LN+Pv25IkdTkEQYXSzKg1NYh3ffIEMapapUjo8XcC/1VJ+sYON8PtFbFn
         uAgrXIT0qHPvqqFl3bgDul86IYOHCUBxr0xrjmGyXibfl8z4IayzeWSjC/4dcOwrY5ZC
         Tjgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kSIDJ9xADSgbR8w3jhiqKFrL226TZqy9jddz1ef76QY=;
        fh=MLiEhx8TVNJ4GK7+BD+ByAwD2nQEMUHmvzGZN9c+OuY=;
        b=ST9r8gnp65MKxOIf4GMEmfUNY3wpWs1RDPxIKAicbHC+hPnvOJ2sXU/6gPAIYbVIIH
         /PJXgWxO3LAlp8SeqxLOGF1t1QSGvwQaOG5ZxZuKQp+7MzOSxN39E7or8U9F0ms748Xd
         XK/k43NoQDImBHSJZqSTcIVKZjQBgVUxHPMckMjrmKEl/T0VGfJMMZJ6hXdgQ0dQGZe6
         CE49Gd4Zw7U0ofuzhBSjhOT7gXdVrHP6qHZYfADdFwXGQcsdbJ39O1ZjQ0U1GX/7aN6+
         kpZAxZf5ezP9nYQxddctNdfElOKQ+ylZ1Bb4lwicQn+WtKjg9nIwyR2qe1k74IMYHc4X
         +8KQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794283658; x=1794888458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kSIDJ9xADSgbR8w3jhiqKFrL226TZqy9jddz1ef76QY=;
        b=EW4ji56UqTTY5m8+Wcv8W/0K7eRAd4p9yumrh1ZKmX6SuUXyknyE0znPjjC7gl1Uy1
         6PN2Qb0g0zs6z56d2QBM42EPOJFmsbhqlFRQb29eInaECsMc6Tuuvvwbeh+SplTYmUs9
         xTzRvLJH/EGlRFqu1ei3LiXeMxArDPY8w1pclQVnO7wacrJRh4NypPvEelJp50IONnnA
         DuHyGCnCjeyB5lKFUQ/LsZdMmVebMJfuDHhuJlIEcJD/mcKoeO+nYX6yyMPGuJSd/Isy
         WhdcoRnxslyd8smMGDgoTXA2x6oXQzmidf1rLRVs5IJzFuTYi4McUKBHwTszCMnwppvT
         0HdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794283658; x=1794888458;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kSIDJ9xADSgbR8w3jhiqKFrL226TZqy9jddz1ef76QY=;
        b=s46QESoZJ+HN3CseLhvQOKHTt5xNWApH5PFhxMPUuqpdzTDxvBd/Ln/hvDxmNorYTX
         pWvjbhq8kL10iToxTuZ4y2WrxpA4/wKBX3AmbX6nesHfGTc+LrUjoSAX7vGzZT2y9TRl
         XK3Me8M3GytKwGPx6v2oaKleQSivznyHKj+g8MDB8NaLibfJ5ROZjqtUwhghr8tF7YxM
         5nmBdi843IUWauk1q7XJgQJC51/BbAQ4Z2I0IOlJqPo+Zsx/qZnkLqY6xajCojbGU3Cb
         g6h3GfOkujwrYul6IFhtbc0Ng1GvkpzObE+2yHYmWl+j8axvEI+syp/ypxJ4ny3jE1VO
         Kkrw==
X-Forwarded-Encrypted: i=1; AL+hErH9De6Yh0ka4kud6bpUba5nsB+1/6rGVXl4xw4h+gWY4biiWCc0kVUGMmYc6G/sKiehVeeahFZXm940J7s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mQuMoPHpjTZcIfx9wvkEjQC5uC39JfqP3/t3X320Yeph3UFar
	UJiTKNPTsFvgIh4aQI0UPovBuNyEYX9Xg0DsFQBVzzW4s7iIMdG1CWuWBFv88DnUhpThBv1dBdW
	EcAVs4Crhc2w8E7HArqc7THO6Y7NwXswdyxG6hHQG5KXFZAzZgiiM1mtSB09616Ocem3F1PrlnN
	h7hddID78OV4KgXhTIDNZrg4JBfly0s1lr/IQ88C4PBA==
X-Gm-Gg: AYBFou2wXZDx1TPtWM6qGh3El+DQbt6L/+GwZaOyAt8G9f4qRCd2imOoxsydqbe2mV2
	CuWEAsU8q9cKOWgIyXZWA1tOcMuWVz5egXzMS0XooBXtUplzC7dHhnG0aOJRset0oKDYKOYKt6g
	HKgv59BNqI1clrmCQgM47YCm2iI/TiiKMzeV0zQgWqdnCwBojaqz9jvlHthQ==
X-Received: by 2002:a53:daca:0:b0:67b:f72f:c385 with SMTP id 956f58d0204a3-67c5690bf9fmr802109d50.107.1794283658022;
        Mon, 09 Nov 2026 20:07:38 -0800 (PST)
X-Received: by 2002:a53:daca:0:b0:67b:f72f:c385 with SMTP id
 956f58d0204a3-67c5690bf9fmr802098d50.107.1794283657477; Mon, 09 Nov 2026
 20:07:37 -0800 (PST)
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
 <12b07a59-c087-4ba2-8d5e-40b2a6d6a72a@lunn.ch>
In-Reply-To: <12b07a59-c087-4ba2-8d5e-40b2a6d6a72a@lunn.ch>
From: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 12:07:26 +0800
X-Gm-Features: AclHuK-hodaACp_rHdXRjEOvx5V_o0KFQRlsldfxlLzRS8sIuAIOx5XG_q9mC_U
Message-ID: <CAPTcHHRv959iu-4V6dAWwfH+gRy4nt0M0MGZYL3CCiuD+Gc0jQ@mail.gmail.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX3DkQr34DRsia
 oL8H9hMfgDPl92rYZh4Gnzq2YP9cBSRxvJaa9TPK/E+BIqCeijaMzG+EFbdzqtbbqujv9cOFcZ3
 ACw8abfLJQnkFUJ9Jwi4LEJLTvwm2G4=
X-Proofpoint-GUID: MBRdVkch7699mHXfN93UwmTS_QGcSuWu
X-Proofpoint-ORIG-GUID: MBRdVkch7699mHXfN93UwmTS_QGcSuWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAxNiBTYWx0ZWRfX8oPSYCUMOSEe
 YsdOTdELft4WRMeK4E9WX3mNyw4AquxPDjqdZguPb5yeJh2KaKr4w8/cnylQahQbekY9YUIfQaZ
 lHMyFjmRh0BpgCyvRUKRBa1kWZqcoQ2mLsmTTcofg0u5Tx0x3HqB628FUn1Uw2AlMGQ48PI3l2N
 bBpEsgVOHgKjxZNAzC+4ZVXWvhiNxyeuY6VI1jRFks1lg5gjzgUhgC+U9xEJNwl6h2/64RQs8v9
 iJVhoXKKKheRJ5mgjEhcVLC6Z84LQaR09yQv7qxa5Ejry4r69hO6HNKyYKE06XYdZbGnrnZOUWJ
 gfjbekMrPPqdKQY4wdH5B5BHuuDRzDidSV84iWy6UsA77Cg4v6V++Fknvtd9u1nc6Vd7YTuhmQZ
 sB/mOYuQEnJoMDxZa2in7gHX9nJlFwmUOKngHfWfpCWA889TuHZh6q24WpcwEE9+MqsYTnqJrNS
 sCqMAtZ/ejuKoICLz6A==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af2988a cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=_r89ylQa7G5OkESiVDMA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100016

On Thu, Oct 29, 2026 at 9:35=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Thu, Oct 29, 2026 at 05:28:10PM +0800, Hongmei Xu wrote:
> > After the firmware reset sequence completes, the global reserved status
> > register (VEND1_GLOBAL_RSVD_STAT1) may not yet contain a valid provisio=
n
> > ID. This can cause subsequent firmware operations to proceed with stale
> > state.
> >
> > Poll VEND1_GLOBAL_RSVD_STAT1 until the provision ID field is non-zero
> > before returning from aqr_wait_reset_complete(). A timeout is treated a=
s
> > a non-fatal warning since the PHY can still function without a valid
> > provision ID.
>
> If it can still work without the provisioning ID, why bother reading
> it?
This is real issue we observed when working on AQR113 bring up.
Below is the basis why this change is needed.
In a word, it is required accorfing to the AQR113 vendor phy databook.
The reset sequence is describled in the databook:
1.When all of the conditions for release from Reset are true, a 20 ms
timer engages, the purpose
of which is to allow the supplies to settle prior to allowing the PHY to bo=
ot.
2.After the 20 ms timer has completed, hardware state machines
designed to guarantee PLL and
band-gap stability engage.
3. After the PLLs and band-gap are locked and functioning properly,
the processor and digital
circuitry are released from reset.
4. The PHY image is then loaded through MDIO boot-load and the processor bo=
ots.
5. After the processor boots, any provisioned register values are set,
and the PHY enters the
provisioned operating state.

And the definition for Provisiong id in the phy databook is:
Customers may receive multiple ROM images that differ only in their
provisioning.
This field is used to differentiate those images. This field is used
in conjunction
with the firmware major and minor revision numbers to uniquely
identify ROM images.

Since we flash our own FW images on the AQR113 . Prov id cannot be 0x0 .
What we observed is if we didn't wait for Prov id, the id would coming as 0=
x0.
That was causing link issues. After this change is applied, link never
fails then.

>
> Maybe extend the commit message saying what features will be missing
> if there is no ID.
>
Sure, will add more detail information in the commit message.

> It looks like USXGMII and 10G-QXGMII might be mixed up? Is such a mix
> up not fatal?
>
>         Andrew
Is this comment mis-posted? No USXGMII and 10G-QXGMII related inforamtion
in this patch, isn't it? Please help to confirm if I have any
misunsterdaning here?

Regards,
Hongmei Xu

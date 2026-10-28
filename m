Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177496;
	b=rJ2SMbPzATH8AtLoFkqbsItbeBT9qffvN7MeXFqhsJrzPx63BvMeWWR/dt9vmf9qx3A9
	 JfXO9xEe4n2U/kT9DDspVr+6kWXUQdZnVA2G4nFm1Wxe3PnkWAP0MXVo0v4kmu+XSUxDM
	 WHywr1K9hr4B4+hfMZOcXZ7qrmO1YNUi6Yvd5w+jpj7KU45CRpswi41Jm5k0gGSQlHANm
	 azMCYfo9sLk3l2je31OI0UbizEpZG03ynvQVfS6wkrtOtFXx6O0w8zS7CXwyZTWE/xUvh
	 3ePhE4X58kXjUyHPumw7EwmDN2hMHr29GC0UUA7U4DedrbPCaWTUzDHrzADrvQ+aOvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177496;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dtaLCG5DfHiNQ60mEm2A+W71f2WlufqY+/mbeyVW/yk=;
	b=gBJy+1W2RbgHk04JrIVOeClJAlaLwdW7VWorTIkUcCldtKUPgcWYEX105ywlphmNLj8J
	 7u01wIrsCbGByV3MTbC3nq3GYoFmIqcjL5Co861pS/zKBwShQa71rpXG+R749gCE3+acG
	 XbViMAok//aWi39g+QxQcDjMtpjvE103vjfcuwpR/n66qUAqHijC7c7tmkcHxTHNX5WBj
	 aGV4lGUPRde2PTW9QTd280ztBFRwwFzu7CHcCbH5AbGr+ChP17vHjCtG5eZlmVTfBQ+PB
	 CJx3JAnqCsQGHbV6n1aW1TfAy9CqNhzKY24yDHcH+CyBWF0+giHpXfjrHZ521SnN/6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQ0SBYvN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGGA5y1W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E7A606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQ0SBYvN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IGGA5y1W
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KnJo1101710
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dtaLCG5DfHiNQ60mEm2A+W71f2WlufqY+/mbeyVW/yk=; b=DQ0SBYvNc/aXtTL5
	TSUsoM0rjgb0k4pGqQql6KcsnnkVgAi9bbYntJp7F14v7JAFIArMfr22V8XBt7wc
	P9JPKEXKaWmGV6bf1cmpQFe8vhsNhJidk3xwr3Q+HGAqGU4HEO2Z7ZUZ8MEGtVjl
	IdfkGoDW95nYuDT1xjQZiEFTkuO+LFMR23Dqf7Do/d0cLtz2ecuz86U2/mUJRrNo
	ZpKMcL14UjgJtGRuxDhadN0Ro/vpYdpfgvfgKToel+2bBCm+ZyJFt7N3eQYAeMFC
	QwFBUNdJlflvTsIISrxVY6GoMJ4jLGK74LO0X5FeaqArHdo/J03KZ3zFMgD/rjo5
	ANAXgQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7r3er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:51:34 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5352436cd78so8704981cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:51:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177493; cv=none;
        d=google.com; s=arc-20260327;
        b=cvPx6yhP6UsiL7qAr9j79BKe8mHQMOJBB2cdlhQa0lZZFSPE7lPndM6CzmvbX2Zl30
         Ct+C+9qkEHPD3/jj15csnFIGSbsYvRtigSxMKFEoeFEGA1PG3cqpyPYyJJxIGIG81x7n
         CRB2TKmYUMQ3HjpO4xdAlTHyWxkBEuPNbGQT3T1QcEFMkcA2h0/kNU6euZ8otA7ZBDkW
         FQN1A8QItbqhYTEWAbORBnWJnOtZdR+Pk8jUmyuzctK+DvYtKhLVStCgnkvIvvGmyjGT
         pmg5ljL68He8Dh6Q/5U0Rw8zIsMsltAM1+TQr6dA6B4QPdWIibvVDcNk7PrUKaANyL2l
         cl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dtaLCG5DfHiNQ60mEm2A+W71f2WlufqY+/mbeyVW/yk=;
        fh=5vOTmVGPYukYjRjF8J+mJYuNMplXrELPktYyp0addik=;
        b=nh17uo9AeSxI44j3iQFD+TGmf6R1Wafj8+G8EHH7KPH0imZyfzIwQVx3wcyKWNxXxK
         +GaU5/n71sk5w4VyNFWQLq6h1fNu+5dE0zQj6dLJJ2zmnz4jyA2EMLtSoTu/9qRq5xi+
         eP0y6d/Q9KWPDtd4gcd4v87yylrMKFLiswKn2J8AvsuO5WFp5Q+mtjFDaa6OwLzvqI47
         CsTYO+9Y8j1IWwbZTkwN0gpg61Uu0cGY5EWe3r/GUit1FbCionWswn0Uy8t71hfr3LIi
         nOkfsF9Sw1rNb9ciVCWhzCJxAxrQiTjkCfV2occGjg2kjtpexcuyjSPGkIMG8LX6pMas
         1Ysw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793177493; x=1793782293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtaLCG5DfHiNQ60mEm2A+W71f2WlufqY+/mbeyVW/yk=;
        b=IGGA5y1WWStMTA//0BJ7KBsYvaAyHOdJthFY3eAJj05vH9P67RLvlO9sVnIFAqU0Kx
         6X/GjBMNnRENZP5taihp00zfQUUXpaisXfFJa9PrC3o2/Vv2oxKwUCKhLZZMMk/eSldr
         YzXct9ufFFuDXhBCPtywXVM13b4yxPt76pIKHsUKk4lD+o1yLvWSYdh0XOlYZlWBUycW
         KIifbpbZIcU5Jnfwf4vadZ68XSsJUIpnCaFiJSKsKeTFB2+Daw7fXG3TcX3IYfFO1dxx
         qr4uF1CD/aMt+lOnStwNuY7qKQVEl6pn/AjS/o4qzrXgR/TsGzM2bA86Ii94cYguxWNO
         hmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177493; x=1793782293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtaLCG5DfHiNQ60mEm2A+W71f2WlufqY+/mbeyVW/yk=;
        b=NnDo3RWeRgfzB/Tr3zT7LG3T9f/q0/aQdQvuWAtDj0DGGLxucfvAR0WpQCzVpwiXW8
         QGeuA1mOoaPB2Iv6TpF5rwRZPIFNHw+h1kviIKT8E+0RCuwbxvlbjsxTA8zLdp0sDU7z
         oZ/PmTGl8I7fkK69UGUs3ZJqZqNdv0sYa/ZnzoNkgrCVsppluqSV4C4lnvLcm7CtjyAZ
         zA0DWnvksqkAqfpyZbvVDgalFfBUzEbIWnbE1VOkES2AoD/zgMqwR3F/N5ywC/Itn+ul
         FWjW9/FuPf95YCKnc5Hb0DHwrunnHwtiK5O71wkMlj1Rk3/n9Y64mo9gfL+ydWAU/29W
         LXEw==
X-Forwarded-Encrypted: i=1; AKwUvBzIrV9bjIGVMm1gX2mDxqKgAbdfhpQg/cxeTW5+f1FCMROo8/MdTVbvJqwUhgYpxykOGgXyvrBCLw4DBpw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsKYGxBs+cX6usir30vQqkjYaRMojb6cQTgI5no8BQHSHTNLDV
	UhXhoZyV0zF+vtnGpHc9NA2OYaOiOm18vNiVo8nIwGhmwQFAR7r3MW0AMEAnVj+X49Z8Eu/7/sT
	0BwtgYZy6voj1S0RGXIcaTevcOPEQ6UwqGkjvv0kWUQHgWw39rte3eQGrl7AhqiAz+TouE8rfNx
	lE1p5Zcx9bYKEmsihBr7YXYZpmflpgpQnG5luxU2dNfg==
X-Gm-Gg: AYBFou2mXZ2kJQUabApKgnrf8E/7gtwdPz2UuXBLi8kzzjQRaTMtezkIqOxSh/TmirT
	tuLXbOA+uZAmUloV5X/ivAL/koiMEJ2Q1X5emKPmZuzln1YDRNDnyb1hg/QREPaV4ZhmM7SGfE2
	jM13gFAEBBTTGi4HHC1I+FUVqiwbVOXFEwUFLXbqhJ4N86/Mh+yBVVdGmFvUqHVURLXfKz7Bgrm
	Lf4Z5nWbaJuLHh39S9iYa+uBuIo+bUWX8sH40eVwFWzLEZ1xFUG+WH4+msK/gfdYitACgNDo1Q=
X-Received: by 2002:a05:622a:489:b0:535:c88:8f1 with SMTP id d75a77b69052e-53fcbce2f2amr29596421cf.41.1793177493426;
        Wed, 28 Oct 2026 01:51:33 -0700 (PDT)
X-Received: by 2002:a05:622a:489:b0:535:c88:8f1 with SMTP id
 d75a77b69052e-53fcbce2f2amr29596061cf.41.1793177492903; Wed, 28 Oct 2026
 01:51:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027171055.1796482-1-peter.hunt@opengear.com>
In-Reply-To: <20261027171055.1796482-1-peter.hunt@opengear.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 09:51:22 +0100
X-Gm-Features: AclHuK_7Qt0TADKGY1nMybB1djOqh4oQ5S7n5wDRc9mHEYJzanegY_rRJPAb_Us
Message-ID: <CAFEp6-2GiTaDb3GVE8BCSmQuONOVmiTvY=tv+Ji_keXcFZWPhA@mail.gmail.com>
Subject: Re: [PATCH net v2] net: wwan: mhi_wwan_ctrl: send a DTR drop before
 it can be coalesced
To: Peter Hunt <peter.hunt@opengear.com>
Cc: netdev@vger.kernel.org, Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Daniele Palmas <dnlplm@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1b796 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6MsIef5sYUtYhJpA:21 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=t2vznHeBAAAA:8 a=EUspDBNiAAAA:8 a=ziOM4HdDeOLMJrtgq5cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=V_BghkRpYkFyHJIZkSH6:22
X-Proofpoint-GUID: 1t3ULiGX4ilmP257X8s32prmWGjVktc0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzNSBTYWx0ZWRfX2eICNvv1wQFr
 QC/KcEuPjusuGswLET38nCE5FdBki/9LvK15XBc66eZVbnga7xDdH39IahZVSZTjveOxC2dtf1C
 pEepSNzyHdFNEXw+EHYMru1xiaCeN1c=
X-Proofpoint-ORIG-GUID: 1t3ULiGX4ilmP257X8s32prmWGjVktc0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzNSBTYWx0ZWRfX9tOBzt6SYrXj
 AAmuPQzv7QDsqmgZDcOU0vwngLH3anY5jAOMOjFHWmvZvv6dN46KL50ybyBnAeChZz5GoEcx+ky
 ofx+gtKBg+PDKZ40nBfDmM3zNvRWSo5KZgvMqPLe0xu8h617PFhJSBx1KSzImqLcFab7P6HY9Io
 sWMOotc2K9eCm/3JjPRSxoAswAt/ncNr/pXk8TJp9ZdZx8DmvWjZTpAoCNQe7I37m+UEoyfCowK
 nkRv7chKsz9KwJu7rCsPisD7tc7bMob6NLEZ+MvDM3OyHc88cmxSLn+0y+dij5eokK8iqhtnPSp
 2ITkKiOH6kpiGqBg0fd4yA+1UZdzhCwwJcPPbaLI4vFriroae1JSvKU6quItkQbpGGeNJd8sQTM
 IyrHAattbtlzsh6fUq6CkI1A8lDbPRfDf27hVKYE1/occrBh9e5GOE76NUVnFikKYDQYx1590k0
 yYnZngU5Q2JfyCXddtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280035

On Tue, Oct 27, 2026 at 6:11=E2=80=AFPM Peter Hunt <peter.hunt@opengear.com=
> wrote:
>
> DTR/RTS changes are sent from a work item that only sends the latest
> state, so a drop followed quickly by a raise, for example TIOCMBIC then
> TIOCMBIS or a quick close and reopen, can reach the modem as just the
> raise. A drop matters on its own, a modem set to AT&D2 hangs up on it.
>
> Flush the work when DTR goes low so the drop is sent before ->dtr_rts()
> returns, and flush it in stop() so any pending state is sent before the
> channel is stopped. A drop that hits a full UL ring is still retried
> with whatever state is latest by then.
>
> Fixes: d509edf90bc6 ("net: wwan: mhi_wwan_ctrl: drive DTR/RTS via the IP_=
CTRL channel")
> Suggested-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Peter Hunt <peter.hunt@opengear.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> v2: Only handle the DTR drop, by flushing the work when DTR goes low,
>     and flush it in stop() as well (Loic Poulain). Drop the port list
>     and resend on a late IP_CTRL bind, which is only reachable by
>     unbinding and rebinding mhi_wwan_dtr through sysfs.
> v1: https://lore.kernel.org/all/20261023174113.2388353-1-peter.hunt@openg=
ear.com/
>
> Tested on a Sierra EM9291 (CM8100): back-to-back DTR drop+raise and
> close+reopen now always send the drop, bursts of 10,000 DTR changes,
> HUPCL, teardown and lock stress tests.
>
>  drivers/net/wwan/mhi_wwan_ctrl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/net/wwan/mhi_wwan_ctrl.c b/drivers/net/wwan/mhi_wwan=
_ctrl.c
> index e3c207588956..772319927867 100644
> --- a/drivers/net/wwan/mhi_wwan_ctrl.c
> +++ b/drivers/net/wwan/mhi_wwan_ctrl.c
> @@ -209,9 +209,17 @@ static void mhi_wwan_ctrl_dtr_work(struct work_struc=
t *work)
>  static void mhi_wwan_ctrl_dtr_rts(struct wwan_port *port, unsigned int m=
dmbits)
>  {
>         struct mhi_wwan_dev *mhiwwan =3D wwan_port_get_drvdata(port);
> +       bool drop =3D (READ_ONCE(mhiwwan->dtr_mdmbits) & TIOCM_DTR) &&
> +                   !(mdmbits & TIOCM_DTR);
>
>         WRITE_ONCE(mhiwwan->dtr_mdmbits, mdmbits);
>         schedule_delayed_work(&mhiwwan->dtr_work, 0);
> +
> +       /* A DTR drop matters on its own, e.g. to hang up a modem set to =
AT&D2,
> +        * so send it now rather than let a following raise coalesce it a=
way
> +        */
> +       if (drop)
> +               flush_delayed_work(&mhiwwan->dtr_work);
>  }
>
>  static int mhi_wwan_ctrl_start(struct wwan_port *port)
> @@ -246,6 +254,9 @@ static void mhi_wwan_ctrl_stop(struct wwan_port *port=
)
>
>         cancel_work_sync(&mhiwwan->rx_refill);
>
> +       /* Send any pending DTR/RTS state before the channel stops */
> +       flush_delayed_work(&mhiwwan->dtr_work);
> +
>         mhi_unprepare_from_transfer(mhiwwan->mhi_dev);
>  }
>
> --
> 2.43.0
>

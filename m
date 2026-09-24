Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7F4472783
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248382; cv=pass; b=Q+1dBH40NzltoQm0LxqSVec2NPLTCCEjPJRpIsZkkSIPxc7XJf7oSyXTMptV5b86KpN7uanJXSADL6PQ9zf3E8SoGT7CTxYW1Ed25gBqqRCbBWdrGUGXGgCcHEU+IufcfquU1teCHYK2LJG2MZt+tAIRIgIW6g2Sv+XiqGRkW64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248382; c=relaxed/simple;
	bh=U7K/8GIisOHzCRms+OKCv5d2y4oxaKVysMdgc5MbHqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsRBL40TManXIv4XXrp1KtkehEBmCYqR28y99xB0q5x/MBZMTLu2atnr8g5ZY1SzllkHAYY4Hwlmtaf0QjnC+HJMq9dhxzBwRX0wDFXuDXVxMGXwA3lpTB1H/5TAXuF0En07wcOg40PsF5ru6xG3uZeW5b2WlRytxUbRZJr0Fbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJt9BdBB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqnlimnE; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJt9BdBB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqnlimnE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PEkW2025649
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=; b=FJt9BdBBPANqD09t
	Arva/bOhhI8YKPNoC3dT8lyPPLQWPFtCkEMrTT9P5TbeT9Bd5OfaXtdFdMUNxteW
	OBNxC41ZioyCWD1j+IXkrJIa/ZAWEgqnTqOVpALi32BWAmlMQsEsGsP5W1+iLKZB
	fCiIWq+aIGAqQr64amrtXf7rKBGSkNzVEpgVxNZhobTHWRS85XFFZ3e7o1tQJF91
	HQZuk1CG8tO+YGTx5q78IxkF0TrPzlp2cefhTU7Dlt+Ch5FUGR2choeOKiCqOZGi
	9FkOSKWDC1DgMSM2aJKj4H6PZaehuIs/Aj19TyCnypn+LKDycYNp+WbDMYotaOnD
	V6WyYg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgt6ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:12:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so3619094a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790248377; cv=none;
        d=google.com; s=arc-20260327;
        b=GHRx2IclFGmW4EU/V1rXV0U5+WfscbG4u9iQ9ToI+jU54vJ+VDVxng9VtMZeunSoIU
         3TvcWqwmUnT+Rt9OofCzmamsSmHuW1BCmoqdvOjU8yI1lEovWaX7xN3N5u6bdXIE3tqV
         4YRtGuAwuIQCPTw9jDX/rBNcH5EVdxt2T4ta/42ONdQyvbbyKxyvzE4cjvJuWy054e0f
         i78w9itieqxQWfHuKcdBXSm1+a0qGdbEVBvfNm7bP20PPG36D07O9Er4Q2WtpmM73tjA
         wnqh2YyjIMRxa+ums4qFebbaOplWzmmgG4KK1OzL5kmsMJk35bqk/tbSClpAiC7yjc9h
         JCdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=;
        fh=FrBZsDKY2k1suwgw2rAFa/XPnPpNP89hMmLZhm5eD0Y=;
        b=AJCa5LcWgvnBw/K7XFzl+uyAXouREKsQHluXeTXWvW2KoQa2bDWdETm2vhHmut186S
         pZNqQOWeliOAI8AgHGKpyEoOKTeDCYW3wOBjIOB99w/nM9Xzr/6J4JmXvgVmsQJrJkf5
         b7GS+V7s4Y7ydmoMEDkTojmIfItofa+0V23FF7tUbbQss4uy9ZpTsEthUKQsv1Z4M4XY
         ncb1AfizZXZOSb0QpzXsm/0cI78hKd3iO3EBgBI2kb1Np+jRVnSWRMSLjT/RgByOHtB9
         dpeHQiEP+XGzveYS1Aw1GdAFI2LWuyydyH4Nwzxt7ftYgDGFHftqijFgVbNNQ0m5n5lm
         rlDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790248377; x=1790853177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=;
        b=PqnlimnEuHIHXjGxBdIDkWGXKkQ/4yHX+0g8osvt+RF/dYd8frI0kHUtqX9m0erW5c
         wupyULw3mmR4qq6NT/02D6358gEJyQmrWjqamng31wANWN8v2wMXYV76FPCGLQOos7nq
         3Au8NJvkL+s9A2mB0DGJk+Zy4p+lRlu+4ne5cqpIC3RZNSA+cBT06fFJMEyU662Mya4E
         VK1dTXVR79emSKxzku3cibRCJvLwF3CWWk2CGEbSFihMb5Bnb5t7XI1q2gSFzzJuaONQ
         I2jw2+ME+D6nG/GLqdj5WP1wyL4e5O6GFXKBqtDw6VImh5UUV/2+OO6LMRodjw9Fr5kk
         9ARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248377; x=1790853177;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k1V1OZLd8PuPRGQwN97+EBOj831I6h3gVcxIujOMO+c=;
        b=rz9IV+rOaeuvB1H1fEV2RqEqkAy4sqqjssoFSbGfsUbH81kT6aQYz1o8UNUjZcn5gj
         qzUKv4DAJZol/4KSAPYvCj+tFIkX+ETJ3YThPWbalc/k5sERaVkIYwtguz1QvSDZbaiF
         pESCpL3LJsi96I83+doYdI0ecDyK2aAkdRCY9fbxKAF/15eqRonCQTH1MP8cflJR6HOX
         cQfnLQk7AIkXDsYWLl9eSJIba10dWPa3RCAiKXu3OJbJw7l0ii9c0TQGWbw7TtKpfK9E
         3vI/L5eCV/xY74OPen23STegv9wdNev4oerjl187S5VprhefiVFUgA5MmjNEbApaduHM
         FZMA==
X-Forwarded-Encrypted: i=1; AKwUvBwKIu1BcuZyU7vl0wafu14HfeW/up9YLsAzniLfBgUdiachEgziudlFiSKtqadO5eCAMhVyow3h8OhF08E=@vger.kernel.org
X-Gm-Message-State: AFuF++kIaBKTzf0E1hcrmogIP/0g4aJqLZ2+Nlko/L+d33l/jDl3JvE+
	74ubvmPvdhUxp0g/nEjtVLpIlGw4sWeUT7ByHgEoqEF/4Sb3LpV5jEBPXWq6h9Eq9K1mL5+rNwC
	2t9Hh6iGsSJ2umTWBXjAXfdLl7oE/CU3CYsr5NFODMAFsxaMuuS3hr5V7v1IMTsMQGYSa18rPFZ
	tVTPP3Hjh/Fg5rWd4AYcZQaBmtKmy+bkO4iqZsCDAAgw==
X-Gm-Gg: AYBFou3iElFHWVbnpglweKS6jR++eGRQQ8IywUgS/dW9LCKM+BzGJNdJCttNQr/f0ky
	L038xcwhIfnNr/9oLIVDcBypcU4mNi63Izkj3AgVZG4nXPBGt27B+8CQrGw8z781aOzd/aAaMqi
	W0J3jHSeQehXZ9SVDEu+mr+he+t/7lJr3GAwYi2nGgRgEMvP0u4+pg/wMbxQ==
X-Received: by 2002:a17:90b:4a08:b0:39e:6c6a:6572 with SMTP id 98e67ed59e1d1-3a09896f00dmr1967118a91.53.1790248371993;
        Thu, 24 Sep 2026 04:12:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4a08:b0:39e:6c6a:6572 with SMTP id
 98e67ed59e1d1-3a09896f00dmr1967095a91.53.1790248371549; Thu, 24 Sep 2026
 04:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com> <20260923084921.3942100-2-zhangfei.gao@oss.qualcomm.com>
 <e05baad3-49ec-4db0-ac70-ffd8e0f52b10@lunn.ch>
In-Reply-To: <e05baad3-49ec-4db0-ac70-ffd8e0f52b10@lunn.ch>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 19:12:40 +0800
X-Gm-Features: AclHuK8TGQHMGqvYSLBah1tI2wfOeuTGvUtjSV6O-ttPpvUSi2Ylv2WtiPcL46s
Message-ID: <CAFkd8htkQnq-KVKMc-qTOFvbgi9BRdnewzmyu4c5B2hULDKPdQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] net: stmmac: support low-speed USXGMII validation
To: Andrew Lunn <andrew@lunn.ch>
Cc: shengchao.guo@oss.qualcomm.com, bartosz.golaszewski@oss.qualcomm.com,
        mohd.anwar@oss.qualcomm.com, maxime.chevallier@bootlin.com,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab505b9 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=oAscVk_Hh32IO0NGH0cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 0Yytb3oBIFEcZISkD4xBFpkfFHEa7aHy
X-Proofpoint-GUID: 0Yytb3oBIFEcZISkD4xBFpkfFHEa7aHy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfX8YeGOZ6gCE7S
 h6MPiC986ugRuznI5Gl35tTq3q2CFWtFRwxDToaB22nt1EvBxe6G6GNjWBybniV3tcPsu6ex7dp
 WrYCooatHUcHEtF35qMHnr9SmNU9U5w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0NiBTYWx0ZWRfXwjgiXNNyOwx9
 HEovKnjaghWtplutTUYNqfQLebZo1udjaJROGQ1GSwM4NT2SBfWc4smJA2ZAUzrugLCai5XhJUD
 I1xm3ntPYz/nwao7jK2duPqFtn4StwhLc1B5W+3URQIwb4OLF5GLuoAcybuol+YtizPrLE+qwkN
 C0Q4N15//ndB/88IGia27wPCrYiPXU628wujqHAVg9eOxZVeNq8UseYjNTrERcHUZwFW+5plgFV
 eYUKDrNaRPTm82k4pZnEAIJGWNV8+o5gFh6RDgEwBm/chx3EBTJadEWVb7+jRhP+vYzcoEnC9jx
 azPZeo+6X3aGOGs/M5SuN3AAdu5Plylwn6hiGcYlO8T+IAQK5TVtGfaCAbcE9BnYW6CNi134Ao7
 ai5vODxv2AHn7r45KqU9hPdLT8De+1DG6Q1Y04ie2oNjslrODiYbwTK24PxXSyfN90e4Res6IGM
 479w4WVc6JsShwx07oA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240046

On Wed, Sep 23, 2026 at 9:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > The XPCS also consumes the PHY-generated Clause 37 in-band link and
> > speed status, so USXGMII must use in-band signalling.
>
> Is this a qualcomm specific feature, or defined in the databook of the
> licensed IP.

This is defined by the Synopsys DWC XPCS databook, rather than being
  Qualcomm-specific. The Clause 37 USXGMII implementation added by this
  series uses PHY-generated in-band status containing link, speed and
  duplex information.

>
> >       case DW_AN_C37_USXGMII:
> > -             return LINK_INBAND_DISABLE;
> > +             /* The PCS consumes the PHY's CL37 in-band link and speed=
 status. */
> > +             return LINK_INBAND_ENABLE;
>
> I ask, because when i look at this, i immediately think is this a
> behaviour change? Is it going to break existing systems? Or was the
> old code broken?

 DW_AN_C37_USXGMII is newly introduced by this series. This change adds
  a separate case for that new mode and leaves the existing DW_10GBASER
  and DW_2500BASEX cases returning LINK_INBAND_DISABLE. Therefore, it
  does not change the behaviour of any existing XPCS mode or system. It
  also matches the implementation added by this series, which enables
  Clause 37 AN and reads the received USXGMII status in
  xpcs_get_state_c37_usxgmii().

        case DW_10GBASER:
        case DW_2500BASEX:
                return LINK_INBAND_DISABLE;

+       case DW_AN_C37_USXGMII:
+               /* The PCS consumes the PHY's CL37 in-band link and
speed status. */
+               return LINK_INBAND_ENABLE;
+

>
> The commit message is where you try to guess what reviewers are going
> to ask, and answer the question before they ask. Seeing such answers
> in the commit message gives me a good idea you have done your due
> diligence, and the patch is probably O.K. Without such comments, i
> have to assume this is poor quality code and really exam it in detail.

Thanks for the guidance.

Thanks

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413BA22D785
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791602467; cv=pass; b=JGzRuWrZkB849JHs20huTiZw9kqkUzXos75Esql+gWjOyTBbbhpTVLE/6AxgXebQcdaBUBGZn5Mf1ybnzZaRf9QYirRF7XTFXvOtRHZF1bGiNzTa53fQPbbD9zoEiv5s01wWXcLFXRJ1q/jCS8WU13XfPQu4G5QggH3rS3T4JnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791602467; c=relaxed/simple;
	bh=cdvvrG7WPkbcrZGPB7ALjUAe17n+SbUghC1wB+UaIFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mv+HF5ZVbvSVGyMrl3AOyATzx1FtYkYP7qJlS3u8dzt3sK9143d5Pp2Q1fFGbitbYnPbDWeZ0CJXZrJt0Uy7z6HHFlpgpxWLgeetB2XMtQsKYOrGP5toKONWbe65mi3uByg5mMHoL2vK0R5neyyBIVof1edBV7w5uk4T723W3yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2DttC4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jyt73DkL; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2DttC4+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jyt73DkL"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2phYT4150800
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=; b=W2DttC4+Bg/B+3ws
	bSXUDzF6IG5mn9xU5D6JiM7lZw3pUWzTMJL1e/ExEgPQoXH5O8xy5Z/6MAlhQY77
	VlOQUJG4NT2GfODiAHiTZZxrNjPI6WXgLhWaO2lUsjaQcYlTSKIY6xKybzBWjfTy
	HgWWh+E9E6YxKxW0WvBoapNv5ZeI7VSwPQ31kjh1faetbS7ZBhqjyvYPVzf7YDBC
	ogYA36T8Bm5eLxDYCSSw44cMmzsFpwWxc0Slc48GXkscp/JK/Y/wFsVDDXxl2FCp
	+VHbzZQ2lbLTaxlT6N/y19/pPAukUr08miotAn8OGlJgQzu5I0zu5XFR+JFHyi99
	M/eBxg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxg26k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 03:21:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dbf293831so546973a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 20:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791602464; cv=none;
        d=google.com; s=arc-20260327;
        b=Rqw2XCgp6yYGAgkw7LjCL6arur0sa7sbPE8UbI9cfFj8iAA91yZu25KTS6Sa7MvLWM
         sbX1NmHV1q4RJZEOQcGLHEHlGKeIOlvItvawfrUpbgw96nOMqRybi5HyF2RMegMhsuIq
         +PlG9UrQqPODdTD561jbu8PeO2dpnpfbDLoVfutZ5MjydqQwb1wW7s9aJQx0PfpQATtt
         ENIAYTYTBhdUnGQA5XLaumZ4twmOEcwy7AQ5Wb0h1tt31RZexb9cdhKtOKcImmQfu1aX
         jzFEULMth/TEf8beYjEPcTDQ2SSgNqwFHUHWIkw0byw/Mz75tASubU8voOkjGHvRfSbb
         1ZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=;
        fh=QjpRctvl4XLxvZifYW7I7MtTzjV4+Nr3dXuMDcFFb78=;
        b=hlS5TIfJpyBBbv367scsL85jyKDK8stWghnrp3o6z7IMFgEYjaw9OWFXWHVd/QA0Wr
         N7ksTNycXTSfYtBtUnD+AWkgAw6OeJOImLsPgbn1xsGbiwxh36gS4PdXB7kg8TNmRCmX
         BeZwWBjtm4WuK7BvAzqCunwt+wIFrxfO+uKtPH7y7jWD4F4ba1Bm8861JEvGUKmiKQSk
         qzh/ebp8ThEVmd1bB0WXNyR5Q3Iob6vTAQ/Z0kexCaaj7ZJncByNQhr7EfNlkd2jOJRw
         n+wWN2WGLie9CySxcIOowALO7l8+SvR8eQXm93zq9fzlL8MLnGjQCh4+OoPsXo49qEpQ
         nVWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791602464; x=1792207264; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=;
        b=Jyt73DkLTatuTsVIVLD2LQQFfe3oBS+Tz8jj3DZvXt1Oc+MP+YXKcgZqwZrdPbv/91
         8MWfMDlGdI7YGi7+F9+UNX6TU+O41E0GbO2U2t4k0UdsZxts5m+UD/Gbv1dsJKhzpKmM
         boUnqHlYmdhxPeZ572I/NPC0F2l6whiw4TXFa4paOqxowSHqDXlnegurkVteFhZxL7qR
         rm9ida8lIK/7nq/m0eZqR7FipQzIQg8c41RYlGUp14VILh500hULPS9II4yTwca4o22H
         BDSKiLOlYTj/jUZVC9O66wcb9UR2TYZd20V9GIQUKNGGTnDVw6oemhRFl917bHA0q3pH
         a76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791602464; x=1792207264;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVFIzf6qKFdgBMbvBDNXwTubrxO8VTgmNkIEL5po9tQ=;
        b=0jFxMmJT3Dk3914fVysjeDI3zGfty2Xbrtr993hclbnQmCtwuav8mRJJ1p+4m3GDIh
         oodSyxMXMt8eG7ZWjNCSibygH1xAKGunIDZCzCyVoqFxe8KwLqULQ7FGlf8lL3+O3AgP
         e3NzSTofL6vZEQkw/nTFQsoegO9L6QvOcYXi3l/T3g5LLx+2GQ9DF8Ivt4+Pffmqvk9v
         L7GyCFBi41QFi4nPD4aOJ1TpFkMkkbB6GQ0eakF+mBdyx6VA9H4xQqbgCfxFsMo8mSbg
         E22t5uscJwqEdJ4Sbjl8/nxtyscdyr6umuAX0FUdX7tfNbMFhPgS1OKJLdVXYCsPDfCt
         VhIA==
X-Forwarded-Encrypted: i=1; AKwUvBwuivFtGRd4zQoczL77OqM0Po2gSKkKK9TOCTccOGzxmrGhKNk+Hfz0g1NAAg/J7WlCP/edpSTn9wrrzMI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQp5CnQt4S2ejVxI0sWb8Ghva1Mh/oOLP4R7xmZ6XQKAGmJZJk
	f7w7OacDMXTtl86sWE+MILX8Z3ctxaVFawcOPBLMj6UuH1HnyxC8+HkeZJ/iHwffhupDqCZ/+4i
	+RQCHU6MFNWG6+MJrM5wBpjpL6aMmVt3ZnfOABZO/X+2lKXcRsFHF4ZjKkl0b/FAEEV2ZezXrYY
	Y20WThwUO9BkcD3Hjftdtk26YHr2IdpcqjD6ZauQrMmg==
X-Gm-Gg: AYBFou0D5wNsNsrp4gCq4nfPnvGOQul9mHbHAfi8Gh34h/RdJM5NEqeOFaJR6I43qMJ
	HeAum8G0nYvyVgEPdH69GBN5b+8YMHBagKqXBNiZcvn8o/ZfoR/74IWnauR7Ch8fy0/SGM43Utg
	GQKh/g8o5BwmgUENT4dJKbyG7nI1mU8gq2nZbiPSiNKONLuFTMGGgO3UMY4w==
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id 98e67ed59e1d1-3ab3a9f7f28mr3326744a91.29.1791602463996;
        Fri, 09 Oct 2026 20:21:03 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:3a8:6571:b43f with SMTP id
 98e67ed59e1d1-3ab3a9f7f28mr3326738a91.29.1791602463627; Fri, 09 Oct 2026
 20:21:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <20260923084921.3942100-1-zhangfei.gao@oss.qualcomm.com> <asmbVX7U4cgm7XNB@QCOM-aGQu4IUr3Y>
In-Reply-To: <asmbVX7U4cgm7XNB@QCOM-aGQu4IUr3Y>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 11:20:52 +0800
X-Gm-Features: AclHuK8rsVvfZj_k56Q5QKzcsjlIbLPicr-jBYfM5wSUQDytqGrRVpofZv9SSgg
Message-ID: <CAFkd8huTuFii5PPYrZ85LKkoECbb8JD7eX=jWC+G4ac6QOBr6w@mail.gmail.com>
Subject: Re: [PATCH 0/3] Nord ethernet followup
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: bartosz.golaszewski@oss.qualcomm.com, mohd.anwar@oss.qualcomm.com,
        maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 1hiVbUatEtIDZXNuZLt75xXoeEefwb0R
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX1TSSwIkSzvPj
 jgsgdPz+xc6pwH+NfD4OyhYl7cDbygvmGYYBurFmdb+mRQ4CrL1zuu7PD4ugUIfrhntLQ+cUYqJ
 ppsLqw7Pc2flCPYWpeHKYWmIWcqkJSI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAxMiBTYWx0ZWRfX35CpgDHrG2xp
 Nd41FOLopYbb8lEFBJpnxQA7wRK01jjEUv7wzOyfzmAw5DKRWJWLgZkLMVuOVO5cXpuiAYTPPGv
 VrAQXhim7VrKdbF7tV3/XPqTsQdpgvRo2hnO+OVYBH4s6P1UQEFlYpD0hwTtpF19KEw0dfemuur
 llE3XM35DwAyCpSgaXovE+3EK4id8ZLEl04l2D/1zQXQnoGXtGqar7+h344xuVeStMP4y21CF0f
 BX23EcYGCgyLnbVgyQxb4GdpMhOJ34sJv5kxizJfoaAmYe1dMsYJZnecPgut+/RAh1ndoHMd4pk
 CfuL2KBCyyEU/XlhNaKk4hblr0tNAGqG8l5lul2F3bg4FpBNLq8XggxzQwqA+EJ3KuSdOp4o2OE
 /h0M/4yruzyZQlk2VW8aFmP2qR0LxcpEi/tcsCCV7Y16ZD5p3/jwpqQCKHAZcpHYgLLS402Bf/I
 HWOdz0Kv8SJANrmnTtg==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6ac9af21 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=YagQt7tFpqKSyC3IlFAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 1hiVbUatEtIDZXNuZLt75xXoeEefwb0R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100012

On Sat, Oct 10, 2026 at 9:56=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:
>
> On Wed, Sep 23, 2026 at 04:49:18PM +0800, Zhangfei Gao wrote:
> > This series verifies Mohd Ayaan Anwar's patch set:
> >
> >   net: introduce Qualcomm XPCS support and add Nord Ethernet plumbing [=
1]
> >
> > Tested on both IQ10 RRD and Ride
> >
> > The full test branch is available at:
> >
> >   https://github.com/zhangfei-gao/kernel-topics/tree/next-9.23
> >
> >
> > [1] https://lore.kernel.org/linux-arm-msm/?q=3Dqcom_xpcs_nord_emac
>
> Please do not post a patch series in reply to another. It makes life
> harder for thread viewer and b4 tool.

OK, got it, my bad.

Thanks

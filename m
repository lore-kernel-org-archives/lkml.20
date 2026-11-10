Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794301001;
	b=ZSNqy8mHyVeWLdPG37OOzRmVgCahXdR/eT9xzMiit2ZTk/HQrCG4O4DJ10V4o1WONMIF
	 L7P4oubt1c9JKBYTbkBQx10jhXzK6uiDyppp/wLhaOpYP4/BdNVUEZnLyEUk4XD+DT1hy
	 0OzkvoVpKTaM9fOnkJIOGMRaueRcdGa7sCdTVedF6Pxt9klE9zLGdvz8OFqH37qL/r4iC
	 2WnLZjMHO1f8QCXDiXRHsx33ixEFoOWx1ciNqHERQumvbn2t/RDIVKIy1fWzaJexn8mkN
	 9g3OblSeBQR0Ym9hgghAW3z1/N05eaFL0394GScUEV6iCi06Vep60TGallX6WEaHSZg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794301001;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bfYkXKftGpF5yfABS1UtuwUuTJGO6Y1zVSNuiv9+v4E=;
	b=h1mp8kHRUcYS3qM8ymi4egZxvNyliLbsLmUd0U7kBuInMtYenrEX02v88cvbCz99sqli
	 d33dWuG2e1NZkLnYkWsXgrwsGA7r8EKPgUZu+GprG4mce+JI2K3wxhsjoikEK/W5KpZBG
	 sqXFNjUJ5LlDxhAwWrxTAnPjHzWPlY3pE5qNAfEW4rpdUpL27F9miZDa1+5NcC1AcH+F8
	 Jfl6tBpc9euGmkhB+ajnPHRT7fFHT0fpEqokoIpYsh6Y4+MiUzxje47YiLmR/nwkRtCn8
	 M8dXizx//8cqs4XVYfHcQEpEjrbzbHTfqTN2ETerszwJrlEPlOphx0RHXLudtN2bj9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NcVYKVcT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYXWldO0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFE9606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:56:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BFE9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NcVYKVcT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LYXWldO0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lDWM2240799
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bfYkXKftGpF5yfABS1UtuwUuTJGO6Y1zVSNuiv9+v4E=; b=NcVYKVcTuU177hG+
	ArpYA8LSEzGHsMJugRQmXh9xVaC8dkypRx3jlMrTLrRq6LmqEHY7wpxzkbleek4s
	MWaNTGJ5EVtdAUUqCP6H5DR8KZ4v7gWwExqvulvvHJ7MImIn72VKOem0Nk73T77X
	GdbNFZF796f/ch+x4kkp4MwCgFlsrnXMj/+55NgW0/hljc/dwn8ss0fFK300J+G3
	ud6i+QU5vkz6MoI42APFOr2z29ekPSG2/m5cEOroWx+WVJM6pJ8dO1V1ZD6tSK1P
	Q9F9GTTN3PMh07zaFDGmlOhqIHrmw2fEPTXCcA4N9mPMyEircZl4ERqxK7jYreyo
	6ultrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp16b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:56:40 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so335777585a.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:56:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794300999; cv=none;
        d=google.com; s=arc-20260327;
        b=c1AwxWEPJm/2zmmqJ5SbOGYcSd/a/5LN5V5mTBmkR0s0KmG49fvJQB6PWr4zCdgLzC
         0qrUaz1Q7l9pG33XPQIm3J0ciYL+isxpE2QiRvFlrnymWW8HHFXPRjDmGR/82BSRGdNb
         xZGi/kzQo2zb4v6CDLuKOjDpI8mF81KNkb+YKV2gpfxV+iHr5nfIJDlka7OuwrkOgI5E
         6ILNHLgpzUo6WLcTCitb2ltg4BGIojPAyJW/N3BozeOAJkJKaL+B9gRq0gpGDajnpdg5
         z3q1pyK9UFZfzUWCvpyLNGrzjDWm8BRE79oW0wAUwEnr3BvFI6VZbaRAx5VauZ/ely56
         FfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfYkXKftGpF5yfABS1UtuwUuTJGO6Y1zVSNuiv9+v4E=;
        fh=ixt0ueqlLYPm/VhCZcvkbJ+iS3E47noSGWD9GHn2w8w=;
        b=np223ono9USBLPeT58rPrFgkSeIIaZrT5hN0jXwZ5XvfO+Yo3coPcAYLMUPtbLijef
         waEUHnpc1rvxXiTjWGf6TkiiVFl+V3rDd3MjT4inDpNemCIFms29ZrcdoxHBmRyxEZJl
         suaf7lnRk4f8BJMU3IIE1W3Zn84BB+CAD1bjmiBHpV+QeNgEbu9JKX0QV9qDm0+yR8Vq
         mP4aItShhkYsAbu/dLiRGIqbr2tiWIG0c6uGGRqwhm14htrdlGrhuEEwTaBUmW9+NzYd
         UXkEB/q4U8qaaGmx0tm7NMdwjWMA9cmjHLlm103q2udmslGVN81fpdMb+4QqrAnCiB3/
         LMPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794300999; x=1794905799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfYkXKftGpF5yfABS1UtuwUuTJGO6Y1zVSNuiv9+v4E=;
        b=LYXWldO0c0vma7FyZr15NbRiXa35ihkswPHRtXQQ1W5Ze9bs35doGfEBxaer1nfpzC
         bD/UTK49HmANCUZfCbW/I82oMeFRSge9KfDedtqZvpgX6K66QktnPDnrIYzCGiaQoDOr
         7NSusd0d5U33/V+CdkT+NbdpHD3LxUtI4lXJtSYVcCO6x/AdW8cao+3AqGNxrBpQwsEu
         3BTwUO6iDAdCMb3XP7Y5YmUubPe0NwRdlyufzK+uHkNOuqKWjSekbqnx/RL41xWLjwM9
         d4ssCS1MYf/GdizKd2yaoQzL6+/ItVe+qPVngUL8ls6i4GCFsA9L1EdPkbMatCowYHCJ
         2r3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300999; x=1794905799;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfYkXKftGpF5yfABS1UtuwUuTJGO6Y1zVSNuiv9+v4E=;
        b=kBMbeYzAzlexn2c5ExhSOVJQwspqBpXOJnC12W+YY+2otOeHF8jgqei9lXdd2B6gu3
         S8gQXmg4+hTcOeQFCmRPWBxm72rCS6JVtb8sQ21oFPlgSjKChgnAxXFmUQEmdmMPPKrP
         BDmiPJA4Kv410QCcWiznMTmTSChX7z/cyp+sXEkbnaZbbZStXl75Pp0D3bJxVg+AkOHr
         4hunBU1ijxS1Ifu3WoU1qrwItYCtur6osDPNjxNvy7W7wlqhBeIVGdDN073DXKZy4Mzt
         38jQRf36WqZXmitGEOvsWEkYTK0Fb0XWKuAaKSSeHfYFlxHtSjvjQTXRt3sU44c3Fd/g
         fFFw==
X-Forwarded-Encrypted: i=1; AL+hErGWFYpnewgxuihU5xA9kVMa3dEKPTaUA43K9+3/kS+OAEl3cGeDa3kkHWmzQxP9pUluPbsCCuFqHzE8oww=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vmwF6iulQ6TVF49YqGfU8HZHGE4YelV38hnb1NlM9gBJRCDB8
	8GQHjUhI1B21JZQ6jXCqQI5yK+6rhxxL53OoWDSW7iGIeiCC+0V/X6Kq7dR8iAx/+T6kOVzb1dd
	XOrLnAn1GUPwkDc0p9Y6xkbD8RsnGjz/W/SqqxzOpRPEzeX3m6EF0yFq4BvOsHqdVl9xASdVaVR
	1eukglP5+tbZmDFqjvGjZrM/yhLx3aRMRr6t3GOaEhPA==
X-Gm-Gg: AYBFou3Hm9ZbGwsr70Z64tJpfTW4n6Mm1bCTgoCQfUH1bckFsmf8EAR0xaoi+zNZBvK
	8LU2Ib96y+vZdw/+x35rwSpxFbaJIX9BFKmxnV1pZxF7XW1jdSg8ZwD52L5FiYzH+nyHIGJxnnG
	QfXQKd9OqjUWGVT3sO5nSQJ+T1GvipDYoJVC0Jm+9895kaPQKaBXhEIvYCmugCFVOoqP0N3JQEi
	jR/RA0Py3ZzZ7Q+ADmwbwALu/MTmXifV/3Akn8mUncPsQ15u+JkFrvRGUE59zlrM2MIHvTbuuU=
X-Received: by 2002:a05:620a:1b99:b0:947:1d0a:c8b5 with SMTP id af79cd13be357-9479f376a32mr281794085a.54.1794300999457;
        Tue, 10 Nov 2026 00:56:39 -0800 (PST)
X-Received: by 2002:a05:620a:1b99:b0:947:1d0a:c8b5 with SMTP id
 af79cd13be357-9479f376a32mr281790885a.54.1794300998919; Tue, 10 Nov 2026
 00:56:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110043006.56681-1-mhun512@gmail.com>
In-Reply-To: <20261110043006.56681-1-mhun512@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 09:56:26 +0100
X-Gm-Features: AclHuK-N0de4R4VH80DI2aBSXz1-I_SLqkM14uwyZxhv9nGfyqNbeQpXZOsGSKI
Message-ID: <CAFEp6-034hcHagE08zVahE4xPDxUcTbFNYR11N5N-mf2ojG4WA@mail.gmail.com>
Subject: Re: [PATCH net] net: wwan: mhi_wwan_mbim: disable rx_refill work on removal
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Johannes Berg <johannes@sipsolutions.net>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: LHEdywEyg8jFBCvaoBfQMUeQ9ZV1pPRq
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2dc48 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=V0Bt14TRAW-i4m3jyEMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNSBTYWx0ZWRfX95+yfOhpoNM7
 Etlmz86kLM66lYwLFJILqfHUcAD1dhhuldqR2iy93eH6QySCHzRjWDFfGDEOsrOJjZSpfcNGbyS
 F5kqeygvYowl2eTXn5AYMpsL+buz5akaAFn5RwKR8s0TVcS8O3WJVDY8VFctUdOLyay0RvwV1Ob
 ILAvLTh2sU+0feIWEMW3f7c16GpCJ/Bxuf9+JZdY8kqQQdKTYARUyQU/tO1GAGmPGokKzx/LUiK
 vmIjxzQf3POy37MaRSlbsngs9ihSvakYgayJ/qTgXKJ6wnuJyf6M1+4rT6MkzlreoerqeLC76+Q
 PGJBmITr+XWSsiScnxQOtUJpb4s/1cVmYYfKbvi55t4hL2/Xgjo4A8x6Rf4XRztFoP7S3XZBxRH
 qOwkmJSNfRQMAd5ajvkUIrMk0pYHBCmwEFj+rAZv0gMJnx93p7wBIACBUJxeSG0AfvWIL/HvyK3
 qM58wdYlpiKtXX3uieg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNSBTYWx0ZWRfX7Qo4tXDd5o1Q
 t3v/SYK15Vkr8ECZOp8kNj3LRJtfldgJ/2JGLyhLASOCeoBgBB4qDdFNU2sh5VCMKVd+gD2r7GX
 TlgqME8J9Mzc4PPE3rtNyQQOxdf8xAk=
X-Proofpoint-GUID: LHEdywEyg8jFBCvaoBfQMUeQ9ZV1pPRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100035

On Tue, Nov 10, 2026 at 5:30=E2=80=AFAM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> mhi_mbim_remove() cancels rx_refill before wwan_unregister_ops()
> removes the links. Bringing a link up in between calls mhi_mbim_ndo_open(=
)
> and queues the work again. With the MHI channels already reset, the
> work cannot refill RX buffers and keeps re-arming itself, eventually
> running after devres frees the context.
>
> Use disable_delayed_work_sync() to drain the work and reject later
> queueing. Probe initializes fresh work on rebind.
>
> Found by a static analysis tool under development.
>
> Fixes: aa730a9905b7 ("net: wwan: Add MHI MBIM network driver")
> Cc: stable@vger.kernel.org # v6.10+
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

>
> ---
>
> diff --git a/drivers/net/wwan/mhi_wwan_mbim.c b/drivers/net/wwan/mhi_wwan=
_mbim.c
> index 336f89756f10..3b6b0066f673 100644
> --- a/drivers/net/wwan/mhi_wwan_mbim.c
> +++ b/drivers/net/wwan/mhi_wwan_mbim.c
> @@ -650,7 +650,7 @@ static void mhi_mbim_remove(struct mhi_device *mhi_de=
v)
>         struct mhi_controller *cntrl =3D mhi_dev->mhi_cntrl;
>
>         mhi_unprepare_from_transfer(mhi_dev);
> -       cancel_delayed_work_sync(&mbim->rx_refill);
> +       disable_delayed_work_sync(&mbim->rx_refill);
>         wwan_unregister_ops(&cntrl->mhi_dev->dev);
>         kfree_skb(mbim->skbagg_head);
>         dev_set_drvdata(&mhi_dev->dev, NULL);
>
> base-commit: 0edbc945eb9edd0086f25b151a79cfe4adc0dfa8
> --
> 2.43.0
>

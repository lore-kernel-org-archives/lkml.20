Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794592094;
	b=JqzfL/uRhygMrY/6/Vgh9cP+NMsOjitzSsedfknPeK/4DA2+Q8l6dglW90v/5RmU751m
	 6WR/kAVHgTNriKoabHeKpychCsB0ZCBlXJ7p9icMARuse3zD4H76kjXeUqvp7GZUV+QXb
	 L8hIxYfvKpGI8YmBZKxUl0lmU0Sl9hjpHYS6r1v2hOYlLomQudvrye8yGNqtC2Z88/wsX
	 iFi7NtPXTbzOLr3isDrvZ6EzRTBX1fHLZrgIEnyrRGxCTIvI2u3WwCSFLRhpCQ09rf16Y
	 IFxuKmEUpKNikA/EL2rqi9TSyho5hUMTWXgJDdsvTZeLnClrpFWKajlDNhLZr7W9rzA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=;
	b=LBjaeKIcVo274B/S4s2n8i7r0nfaiCQzyCsynJwo05I818aKVvPHlj2NL8Z9Mpyd9Qki
	 QUWUaRuLYx/N0KsNy19RYwFg8vLzyIUj6rkYmU+Lj7rhiCApb7m9LEg8kAI3fjTr8qg84
	 Z8GvZ+TmJavGOhe/UiNSQnvR3SJ2waVsc+tNcQseOZEBVY5NmzPhjbHZIUP/KcPGX7eOD
	 VlJmSgTf2UfBRxU1LUnTfBNt4DhdDka4C92tXMXbUMBxW6ebY15c4fQ90qX8Jw8jcZ+Ah
	 yl8lOCVRqj6wlgfYndEz365lg2gUPGsLVg7wE7nphioyXzlHcmDIVS0yb+wTzRV2GuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZQAGIDG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3jJCMa2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED7660776E4
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DED7660776E4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pZQAGIDG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T3jJCMa2
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR7cK1189988
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=; b=pZQAGIDGVwHJfm1U
	MPRN2QTFFZq/UoCWG9MIk42a8lV72+KURht33BDF/LLzZ8RbDEeCnHpX4mImRXw5
	7hiSMXWxX/ZkPLBH8jsisruy99Ohe8KaSz2EPlMvq0kS/clp0za10LhijLWRMbT7
	m2c+utU3ETt3e9v1otJKOBd5k+4PugjibRXwOW6HHHGBx+QszUay/gdkK7FukSgl
	anZLrFIlWejdBF3A3LG1wuoJVOR+8eGwYnumX69NNWASjv48oUqBX7HQnQohgniu
	hR2Eo1AVbhxYPLaK3x2vb7gRxffvUsNn7KdszpR+hlyzoOrN4zzeISkrhOhrD6E5
	z/FtkA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufkfuu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:48:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd66551e02cso1544104a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:48:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794592092; cv=none;
        d=google.com; s=arc-20260327;
        b=isH3ClYgLcc5DOi42CuURdMCNJI2QxnJaqNMIjh3ZKzX0aHzRt86QAxJ9ul7/de8kI
         wvdDM26u8KJp/wq59C+gbEdSY47TGe+qmi7/Iidlw/6o28DZFCtKCzPLaur4pM2DQcfE
         L47d+SQEbBdcX7baa20BeuZdosnPUgCPgeUrRwIw3q7jzwAi1hTMJraS1Fb0cPBcbt1N
         tubisk1mNfFP6lafE0f+4puxEDGBN/Q/cGDRWeycqybMxL0Rv9gDTBv2RvDCY/8XRTCr
         clhJcPrHyflJgTXbWtGW+19kDyN5hgphMyUyT1O6YPirZm+YUzxC1Zg6g/v+ikFdqnJn
         ko2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=;
        fh=4Kmf+/eQAw4TymwmxuyxySOQYY7JNLCnj196LCDV8lY=;
        b=DLwIIWtO7HT12ryPHPKVi5Cr1qPKoBcgtXmjwfoplsqV6eGbqsYzSNQUQULd+upI7+
         EHW/V7Ph5YA3nSeLynKRJNsjobl0kKmvVEMfM1gBEmcCyNfw4WlEuILoxpM4/JBw2vrC
         b4rmeSHcr/XfR28Zzd4GR0cLEcl9Ucdfgkycqb1sH2E2keAz8Dw/nJmeh6TAMYO9kQst
         Jx2sgdxgy8/fG62Uq7RPNk/LHfs1H6enDpAm5kVhR6kNUS+f/YE7R7u9rJ0fMGEKoNL8
         AskUOFvBrF5E0yB+xKxDahSP01WmGUYFb9jTBWhWEBBcwu438hcs3LL+u+Rrf2SHHe+j
         4hTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794592092; x=1795196892; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=;
        b=T3jJCMa24yL7aMNIwVFsMGJuKbULHk8gKwibx3bcn0aVJJdadDfGE2uTK9mJGz1Gd9
         4F3IrfOGU+xy11/t689E734Y57GM7Bm/VNF3yEiM2mhvckAKeiAlezIW1+CMo4Zel5V+
         LsY1tZxiXcKlkNT5dw4EHJiYDysx0R49fJuhGk1rW06x0f91SqSZ6klZsqXlo2n3OBhK
         lp+akPmQlXehlLdNeGZ5roVI2CALrVu+GpqvQ0P4bVig3ZQRmU9r5IzPkbXgmAnn/YSM
         Qe4mIEnSUZvxi5Bem39wdiOW9e1TXSrnCxqKhovVgwY4EoHhzLmbd+32rCfZ5gI12PL5
         5mAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794592092; x=1795196892;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tYWjPq7IqlSKgbNTpcHLqc47/rglK9xx20CYVlKikS8=;
        b=1m9jac0zwlkucNRC+qkATLWV6+5m8HmKjeoe9/baNfzVomkNKS1SqG8zaMeabgTe1U
         8eI1mmaneQH/xoqvveQo/sF5YqHABo3LHVF8qZVyPMxb7WU8SVcCJveFyv68XJqY81QZ
         5VAXM0LPkLhWFoD4RIRE/lZyGdkqcQlYW1auG2T0EZBNScXmWHFcDVU/rqGC1zC1OZH1
         Vy46rRsbITuSacAyZygAJH7HTBfM8ko8kJhTn6XuihRbvOhbZtKbslkG1Z+Dl5bbgNCN
         BivfWQ23XLjqlmim5wmw5A0C4v04WoszkagoyE8HqnWuxI9WYDixy5gdMoh4TIKPmsVJ
         8++A==
X-Forwarded-Encrypted: i=1; AL+hErHoC6pAqk9YEb45o4GyaFU5Wm7+jxWYxpy8XaBnq+RuYARmizFEtkkCrj9kQ1GhT6jkEOE4ZF25jEy7i4w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8DdytaTownnUh6F+dO8FR2vVMUktc9Gdi/hq+uV/o9uPDbhrWq
	/ffN3CJE0Y6usXun/Yl29p9AOi63w4hOwVtUGmkgMA1kiUXZJ2AVwE+yEHJByd20E+KB5ZltknA
	JFINhrcFeHz+eMv+Yrj8kx2eRuCzTBMiByfhCQTEKHd/ncgHTqw4UpWXsTKTJOKwL4IcmjcYxJo
	zeCQLCWaEgb53WFEiuoxhpgk8RY/f0rGgyCPvJzP3kRQ==
X-Gm-Gg: AYBFou2qyZa4usu8MO0qOEDck1ycej77KhMky2KheA6woxIb+xZTc4hc+0asWuL1fQC
	ps7ZxWFDegRNUUXf9R8hSqCp3af5oQP6A6msIjAJBaarZLZBZimnm6JRyFiSwwfulWzvrYU8DOu
	D1GuNClsGrGPwfoWoDV63FRQTyMJNssyW1USIzZS9G0SP14tdCCzLOePxeFg==
X-Received: by 2002:a17:90b:48ce:b0:3ab:188b:c5b1 with SMTP id 98e67ed59e1d1-3b1b0a4e7f7mr3137268a91.56.1794592092369;
        Fri, 13 Nov 2026 09:48:12 -0800 (PST)
X-Received: by 2002:a17:90b:48ce:b0:3ab:188b:c5b1 with SMTP id
 98e67ed59e1d1-3b1b0a4e7f7mr3137245a91.56.1794592091922; Fri, 13 Nov 2026
 09:48:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260925041751.495818-1-coiaprant@gmail.com> <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
 <CALj3r0jMLFbz+oa_z6kySDg-3aLaFWtFoKv9VB_qHhQZDpemfw@mail.gmail.com>
In-Reply-To: <CALj3r0jMLFbz+oa_z6kySDg-3aLaFWtFoKv9VB_qHhQZDpemfw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 18:48:00 +0100
X-Gm-Features: AclHuK8g7tQW9S4ZM83ovlzdx6LVKg4onvs4sx_JqFXCpOEKhsosFCl6JEvlGa4
Message-ID: <CAPx+jO-+uwxMN3-LZn4nH4HSXu6GCnvdrUb9ff79W5EeCU4SZA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: rockchip: mark PD_PIPE as active wakeup on RK3568
To: Coia Prant <coiaprant@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Ss0O2tXMf-M7WZV-KEiuN_nD5VQ_sA0d
X-Proofpoint-ORIG-GUID: Ss0O2tXMf-M7WZV-KEiuN_nD5VQ_sA0d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX1prKhxBiHUVC
 82BC2EAfTejt/YHLGHdPwDlXcyRk6BMHSZYBN7/qt1oH+yK2tGYm+/zjkeynOlHvUdI7q1Ei8oh
 OWaZ97lhHxLiKTK9EsPmkxAb2pCcsHDpbKWWbL0afJKe8GepU3uimXLC3OmP++noL2f9SzFpVoI
 6tmZ638Doz2sDeyoUQV4/NvY/YbQKG+L/viZA/4UzpK37SudVBLpoRy7pouuGxAOIlcl1gLeh+g
 Gggpp11T/eX3JAQrGbH0UbTqyDAPnErP07YMcD8HezILJatVBE2i5M5UdAtFbYu4y8B5zjuDNzv
 6YAz09DFWifPyS9gDye6MYeDDuRzLhjeS2dQwiUp6S3NnfXjqsEriICL5uE61KpfPMrelIW/+1/
 4lJuvIlQNlOlFx69EB4ZZhBBs4gmZ9pgL1SP4othJZ/tOkk4RtxV7bh5Z1jZblORDLC9i+5fNhZ
 +cXXNbc/dKmXd4ZTQsA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af74d5d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=qR-pa9LE6TqeafLzNesA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3MCBTYWx0ZWRfX0sm98m2w0TED
 KL7scu2JYB8LffzGX+Xt/mrKA8C4i2YYxfZKdFo4rlMkRm2vN/Zoj3w0RFSubJi67DT3ygYusBc
 ovNqN8Ns7fc0oWH8kfaD4kjf74zw4+4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130070

On Thu, Oct 22, 2026 at 5:04=E2=80=AFAM Coia Prant <coiaprant@gmail.com> wr=
ote:
>
> Coia Prant <coiaprant@gmail.com> =E4=BA=8E2026=E5=B9=B410=E6=9C=886=E6=97=
=A5=E5=91=A8=E4=BA=8C 07:27=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On September 25, 2026 12:17:51 PM GMT+08:00, Coia Prant <coiaprant@gmai=
l.com> wrote:
> > >The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
> > >controllers and the SATA controllers.  All of them can act as
> > >wakeup sources for the system:
> > >
> > >  - the XPCS for MAC WoL, through the SGMII link
> > >  - the PCIe controllers for PME#
> > >  - the SATA controllers for hotplug wake
> > >
> > >The domain is registered with active_wakeup =3D false, so genpd powers
> > >it down during system suspend even when a consumer is on the wakeup
> > >path.  That kills the XPCS and the SerDes, which breaks MAC WoL on
> > >RK3568 SGMII boards, and it also powers down the PCIe and SATA
> > >controllers while their drivers still expect the link to be alive.
> > >
> > >Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
> > >of its consumers.  Consumers that call device_set_wakeup_path() keep
> > >the domain powered; consumers that do not mark themselves as wakeup
> > >sources are unaffected and the domain is still powered down when
> > >nothing needs it.
> > >
> > >Several other Rockchip SoCs already mark their PCIe and USB power
> > >domains as active wakeup, for example RK3588's pcie and usb domains
> > >and RK3576's usb domain.  PD_PIPE hosts the same kind of
> > >wakeup-capable controllers on RK3568, so this follows the same
> > >pattern.
> > >
> > >Signed-off-by: Coia Prant <coiaprant@gmail.com>
>
> Hi Ulf,
>
> Gentle ping on this patch. It was sent on Sep 25 and Patchwork shows it
> as "Handled Elsewhere", but I can't find it merged in linux-pm,
> linux-rockchip, linux-next or mainline, and I haven't received any
> review feedback.
>
> Since then, the XPCS driver and DTS that depend on PD_PIPE staying
> powered across suspend have been merged and sent upstream:
>
> - XPCS driver in net-next: https://git.kernel.org/netdev/net-next/c/5e91e=
dfb0e45
>
> Could you let me know which tree this should go through, or whether it
> was already picked somewhere? If it needs to be routed differently, I'm
> happy to resend it.
>
> Thanks,
> Coia

Apologize for the huge delay. I was waiting for an ack from some of
the rockchip maintainers.

Anyway, this looks fine to me so, applied for next, thanks!

Kind regards
Uffe

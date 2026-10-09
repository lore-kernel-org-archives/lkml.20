Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17714D9554
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554076; cv=pass; b=esoj7Sh+TzeD6hMNLLvhLKJMKqZRDUxOHSt0HYC1xkSygHDy6jk6rVQrIYJsZZV2IF46mJnokqYePTR8Af91bgxeUrAMmy2BuVuBcyL6pQb5+XhQe2LQBFrgQ6JWhpltVX9ft289J2dYojNe3tlCbE9ikQ2ezPFtKJoO8b1u5QI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554076; c=relaxed/simple;
	bh=xdUlWmFUprIdsNTdyfPx4FHMo9eSBbvRA+21qOUbaak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B/ldpcG7+DYVMrdB+KCzdP7wjVucumN61fdA9lTILRje/ttuOCLuvGSb89CL9obv+L03nXzGsmShgea1qChhyQMbWHzDrizTn3/Z95Hks/bObw2ldPdPAO5lA7qZrl+RrTw5YHaKR/NNbleLdfWhUT1Bik0aATvne98S+3mQVhY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfhVLPxM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UTjdpQ1F; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfhVLPxM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UTjdpQ1F"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Dksng511797
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 13:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=; b=KfhVLPxMrDc8IQnM
	lJMZGedco6PE8Is3R6J6SkEi3i0jX5WdJ0HpR3pYqvWdlIcFbvM7juTvpxIq+JRh
	87sdx6mj5f9ZwyzEdYyRbyaAq284RJBP9xxhv/xpqFjk0s7b8CcrW2Exkrm/c2hD
	19KmizLvsnSRIYIrW5GJiKGyuQRnKKVzCRjZaA9+xEyAZMsUGN8p7VHXnauI0TTy
	4XsvKZ4rq8Vep1rNHj/a/oF4s8iZWRsPejgnhpjuwK2E/l/C28bX/hHQ/T8dJFMh
	c6GtM0QUf0tkpdAPBDtjEx46kMB8bSJuxNKFzfQmFypfjZiXpGgXF42Z/6XWme8A
	WnEahA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h71f281vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 13:54:32 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8ab43f7f5faso94514907b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791554072; cv=none;
        d=google.com; s=arc-20260327;
        b=hzaItLy4+eZnCecXYwkUSyK/kNRBV8EnlVkfu66F+2Ls0xFD6R5gKRuCVMXCIT/4Eg
         rdHelLy/V4jfKzV6RTV5H+P0VGRyI6yABvNCD5T+qV0iIeqbUBOcs0+EneNHP0/PVkY5
         JbttdQkjpufsGFvfmVv0r1GjrtqmY/asNRr4nbbcuEFhQMqfLLO5Y/wDP1PaSZWkNLAw
         2CMXLrotKaJw8QAK2g2KjofiOyCYsGX8fExBA9QwiS6NVNh6ehiSSlcngpgtv+VNAn65
         y4iTjevTZtu9m90QaQTEcLhJAXjShrF8tjD+IkpsbOjWJgR3f7LIBRTe9ynjPB1AuuXO
         ympg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=;
        fh=KctbAN8hqaJgF9QbFgS/wzQ26P3Qv52nq5kZc/9ZdM4=;
        b=b95EtzoeR0pdtrITqwvBQp0W1IYknqHHDqZu8hY0Snh3g2/RwRAnpsBl+r/M8qhVBf
         BrYm0BV9f7HsGCJ1eu9e5d7pp0D0NjcDlA1c+TNw5jt6NocGVhQbOdPzJs0g/WHfchmO
         iGi9n97uy6kioC74BgYjtRkNuKLKdP9Sta2Jeq5xJviWn6WHJ/LcEmd08pt9JITMY2B7
         yhXVyOZbHeuPA4LvAIV073uJYpkujHaaeqrvIUQ8QM56Tw8G1HiABorMxqJNeN7AjM5p
         VBwS+Mzpg4MV+/theFzGjbVnR/Oi9EwW8GEu/LUjiFdhPbgo/SOJMn/87H8vHErfXf+H
         upsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791554072; x=1792158872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=;
        b=UTjdpQ1FE9NxaVC8otN5JDhKN3YYX4yEf+8DFTZoeFzY3bk0b3I/3gdVLOnSHu0MBs
         ORTifl8N+d4rVkuRPhhcwiSUvmWMO8TDtHX6k+PrnGd2rHftfQ7P8iHxna18FiexnRBg
         E9yGHEV9uRxCWc2StQzT5IZJnmTJiVB9tdV/n2HPRn2n96gWoTwslIxjlI8DPjX+EAkb
         c2nnngR6wX1aErUaLiPj88/GiVQO+6V2SrMXP1m7i3i3ssE7DIC3G4nwUvyflqSCFKZD
         s0ikjTMkyWGhlDevrpo6cusMaMJcZT5SGFuSiO9Vd90UyAFyKCuCMr7e07aUgD2anDIJ
         7otA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554072; x=1792158872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KvpmX/1Q3IU4m40umxn2XOTD9p41yiv+dwDT4rC7IA4=;
        b=kg/G8bcpNF3Ook8A/jc8ocEjlW2vmD5MFLgNiFsrXiHz4+nylxFJvax/5RlOZcMVx4
         EYQnurmBclhQjteYWfGa19UleasjGX8Us7ivPl/uW9RoPsHOirEmbtTNxT9t7MQtqPWn
         WHC9smacEx53/oO9aNTUzB50Z7Q1N55uLzCu0DGFP9wGkPoJhMI6VmlopJo4mgZWmBgp
         ej4+Q2AaWD27Srdy/fblNB3YYZJDdGmTGgI/3Cn1xbthP/OdajYOaqgQxa7Jkf+95+Vg
         sW89nkxEy1hfhDiGVsCoXbkS5gI9ZeLkZ9nucCt4PAhId1F4lpVEGUvOVFEwc/Ww1PJ/
         u4TA==
X-Forwarded-Encrypted: i=1; AKwUvBxvig9e1G55wwJUK/U3d3EEk16u8uIPgmUXymklFwlXkflrhr9aPHgA2qIEYwjh6WNbGMUtVi9fLBTMt1g=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7rfWsK0EjvzEV7CytqxPIP3Hh1MsDL1pfz+wpH/IBBR8lOc7z
	o7k9/p+kra7587Xtf44qIFpSUPH8UDRScJB2CACdpnFeyYVsYVYaq0wPOGbVFrb1gDGB4F3Rbe9
	b9LFvnrAf3jhoDI26Rev+TlPFicMiZRNuGfz7Mw0dnJVw2vCP06E5R+BhQiKBnh6QWoUuLzpxN+
	L+uoivRYw+Zzv2RDH8LUtGFXPOkxyPHCYhqstbgOLsQg==
X-Gm-Gg: AYBFou23GisWg6V55mK6lc61QvtqmScpZDNBXkfu8q4uGfDokodxgJnTlSc3qsFUTTN
	EZ3AR0B93elHqO2sk6I6NfZMyYLvoh4DiPoMSUxmZrT6RM5X9xsZSm6IABqE3aDPOaS/0dfOh/I
	CzlJA0eijW7t+r7dYPYoTffGxpo+Brp06d6kO5c9NLSux6gbKaMUGZ6aI=
X-Received: by 2002:a53:d015:0:b0:677:b9d8:a475 with SMTP id 956f58d0204a3-6793633bd6emr535583d50.147.1791554071682;
        Fri, 09 Oct 2026 06:54:31 -0700 (PDT)
X-Received: by 2002:a53:d015:0:b0:677:b9d8:a475 with SMTP id
 956f58d0204a3-6793633bd6emr535575d50.147.1791554071017; Fri, 09 Oct 2026
 06:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
 <20261005-rpmi-tee-service-grp-dev-v2-2-72f222e23ec1@oss.qualcomm.com>
 <CAGgiveUB4ETEbcfCvagfj6q__jsfPmJoeT_w0xA-9NOZpGNwfQ@mail.gmail.com> <630aac65-bf8a-4334-8187-0e7eb0e25217@oss.qualcomm.com>
In-Reply-To: <630aac65-bf8a-4334-8187-0e7eb0e25217@oss.qualcomm.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:54:20 +0200
X-Gm-Features: AclHuK9fYnXbSdIG_QneNDrOHxWZzqswhBgQC4kZW9p0xYrZTiG8kyqxYxfRAtY
Message-ID: <CAGgiveXzQKdLKX3W3N5PDV+t8FW6yMvDTK1rN=rn59zQ0TgC+w@mail.gmail.com>
Subject: Re: [PATCH RFC v2 2/8] tee: optee: define the RPMI control and
 parcel-reference ABI
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: W9Mb1uH6QhmUV2JVpMzNe_AFgMTaUWjC
X-Authority-Analysis: v=2.4 cv=Nf5zRGD4 c=1 sm=1 tr=0 ts=6ac8f219 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=wjuEhBAy9pTyS6C4czwA:9
 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfXzLGprBHUgpCk
 0+QlUWeQK82dw8LpgT6f0au/nBkzcLdJ1PKKw+cW3omwKxeRemh6jg1Tb9lkSk7ovSo97Ug6gV5
 vk8ac9i+9CpAl+LW+enLjfkk1zSrZUo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA1NSBTYWx0ZWRfX7TTiUR1i5BSN
 elPkeCcP+YJYFND0F2fLlrrRIb8aPlrgoZzPsyVw2gAvcNoINQRMaTkpEykK5PHFA7e5ZEECd79
 Ku+oeV2mQK6lpN8M7Qq5lCIsY13GfubwhNRExZCUIGOcI0RqQCBnh9EwtL4omgwEayxdsS6fzdZ
 z3zA41feT/KnNKXhKN3k3BCXc3n021gKkr1mQ6H7NRfJ0+Si+Bzcqwp4w5vw3cASM7T5aH3q9oa
 BGH2gJN2eTkU8kkDCS72fwZAGCDHUxfyuOxgReV3Pck31+jwDBqaKhI5C+urAkDv3AET/HwZUaM
 rDBipH+b8wd8b+OAPCSXqmd9EPX5HWtt0HKWgjKAYbdcp8GXPuRRgRX6UxknF0e/vHkHTRIJCnj
 Uim2978JfrCzdd+c46/Ec64wHRf1opHLosKAtX3k3Wg1LKVBBcmOZCFzIEEve/CDklMoDKWJXbz
 ojUJfqQ6kdJG9dDfqQw==
X-Proofpoint-GUID: W9Mb1uH6QhmUV2JVpMzNe_AFgMTaUWjC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090055

Hi Amir,

On Fri, Oct 9, 2026 at 12:03=E2=80=AFAM Amirreza Zarrabi
<amirreza.zarrabi@oss.qualcomm.com> wrote:
>
> Hi Jens,
>
> On 10/8/2026 5:51 PM, Jens Wiklander wrote:
> > Hi Amir,
> >
> > On Tue, Oct 6, 2026 at 2:40=E2=80=AFAM Amirreza Zarrabi
> > <amirreza.zarrabi@oss.qualcomm.com> wrote:
> >>
> >> Define the OP-TEE service protocol carried by RPMI TEE_CALL payloads.
> >> Add operations for version and capability queries, shared-memory
> >> unregistration, asynchronous notification enablement, and yielding-cal=
l
> >> start and resume. Use fixed-width little-endian control fields and RPM=
I
> >> error codes for control responses.
> >>
> >> Add a parcel memory-reference layout to the common message parameter
> >> union. Identify shared memory by its parcel ID and nonce, with a 64-bi=
t
> >> byte offset and size, without changing the message parameter size.
> >> Encode NULL references with a zero parcel ID and nonce, leaving parcel
> >> ID zero usable with a nonzero nonce.
> >>
> >> Document the wire layouts and ownership rules for matching Linux and
> >> OP-TEE implementations.
> >>
> >> Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> >> ---
> >>  drivers/tee/optee/optee_msg.h  |  38 +++++--
> >>  drivers/tee/optee/optee_rpmi.h | 234 ++++++++++++++++++++++++++++++++=
+++++++++
> >>  2 files changed, 264 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_m=
sg.h
> >> index 6c3043f8da33..028f8cd95fdd 100644
> >> --- a/drivers/tee/optee/optee_msg.h
> >> +++ b/drivers/tee/optee/optee_msg.h
> >> @@ -31,6 +31,9 @@
> >>  #define OPTEE_MSG_ATTR_TYPE_FMEM_INPUT         OPTEE_MSG_ATTR_TYPE_RM=
EM_INPUT
> >>  #define OPTEE_MSG_ATTR_TYPE_FMEM_OUTPUT                OPTEE_MSG_ATTR=
_TYPE_RMEM_OUTPUT
> >>  #define OPTEE_MSG_ATTR_TYPE_FMEM_INOUT         OPTEE_MSG_ATTR_TYPE_RM=
EM_INOUT
> >> +#define OPTEE_MSG_ATTR_TYPE_PMEM_INPUT         OPTEE_MSG_ATTR_TYPE_RM=
EM_INPUT
> >> +#define OPTEE_MSG_ATTR_TYPE_PMEM_OUTPUT                OPTEE_MSG_ATTR=
_TYPE_RMEM_OUTPUT
> >> +#define OPTEE_MSG_ATTR_TYPE_PMEM_INOUT         OPTEE_MSG_ATTR_TYPE_RM=
EM_INOUT
> >>  #define OPTEE_MSG_ATTR_TYPE_TMEM_INPUT         0x9
> >>  #define OPTEE_MSG_ATTR_TYPE_TMEM_OUTPUT                0xa
> >>  #define OPTEE_MSG_ATTR_TYPE_TMEM_INOUT         0xb
> >> @@ -149,6 +152,23 @@ struct optee_msg_param_fmem {
> >>         u64 global_id;
> >>  };
> >>
> >> +/**
> >> + * struct optee_msg_param_pmem - RPMI parcel memory reference
> >> + * @offs: full-width byte offset from the parcel's first byte
> >> + * @size: logical reference size, or required size for a short-buffer=
 response
> >> + * @parcel_id: firmware-assigned parcel identifier
> >> + * @nonce: nonzero REE nonce supplied when sharing the parcel
> >> + *
> >> + * A zero parcel ID and nonce encode a NULL reference. Its offset mus=
t be zero;
> >> + * its size is preserved. Parcel ID zero remains valid with a nonzero=
 nonce.
> >> + */
> >> +struct optee_msg_param_pmem {
> >
> > Without an internal offset like in struct optee_msg_param_fmem, an
> > explicit register SHM call into OP-TEE is needed before it can be
> > used. You'd still need the TEE_MEMORY_PARCEL_CREATE, but we can save
> > one round-trip into the secure world.
> >
>
> The original intenation was to use parcel-relative offsets, with the
> secure-side memory object covers the entire parcel. OP-TEE can retrieve i=
t
> lazily and apply the supplied offset directly, so this design does not re=
quire
> an explicit SHM registration call or an additional round trip.
>
> Since we are implementing the RPMI parcel memory-object cache independent=
ly of
> FF-A's cache in OP-TEE, this seems simpler: it avoids a separate
> initial-offset property, preserves a full-width offset reference, while
> keeping OP-TEE ignorant from the SHM concept which is a Linux side concep=
t.
>
> That said, I can separate the offsets to matching FF-A's memory-object
> model. But I am not sure what we achive?

I think it's needed, but I don't mind being proven wrong. :-)

IIRC, this stems from TEE_IOC_SHM_REGISTER. In hindsight, I regret
that offset. We should have kept it in userspace, but that's too late
now.

>
> >> +       u64 offs;
> >> +       u64 size;
> >> +       u32 parcel_id;
> >> +       u32 nonce;
> >
> > I wonder if parcel_id and nonce wouldn't be better combined into a
> > single field. They need to be separate when preparing arguments for
> > the TEE_MEMORY_* calls. Everywhere else, it's only an opaque memory
> > handle, and one handle is easier to keep track of than two.
>
> I thought about that before. This would push the conversion to the
> firmware boundary. I was not sure if it is acceptable. I'll do that :).

Sounds good to me.

>
> >
> >> +};
> >> +
> >>  /**
> >>   * struct optee_msg_param_value - opaque value parameter
> >>   * @a: first opaque value
> >> @@ -166,18 +186,19 @@ struct optee_msg_param_value {
> >>  /**
> >>   * struct optee_msg_param - parameter used together with struct optee=
_msg_arg
> >>   * @attr:      attributes
> >> - * @tmem:      parameter by temporary memory reference
> >> - * @rmem:      parameter by registered memory reference
> >> - * @fmem:      parameter by FF-A registered memory reference
> >> - * @value:     parameter by opaque value
> >> - * @octets:    parameter by octet string
> >> + * @u.tmem:    parameter by temporary memory reference
> >> + * @u.rmem:    parameter by registered memory reference
> >> + * @u.fmem:    parameter by FF-A registered memory reference
> >> + * @u.pmem:    parameter by RPMI parcel memory reference
> >> + * @u.value:   parameter by opaque value
> >> + * @u.octets:  parameter by octet string
> >>   * @u:         union holding OP-TEE msg parameter
> >>   *
> >>   * @attr & OPTEE_MSG_ATTR_TYPE_MASK indicates if tmem, rmem or value =
is used in
> >>   * the union. OPTEE_MSG_ATTR_TYPE_VALUE_* indicates value or octets,
> >> - * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @tmem and
> >> - * OPTEE_MSG_ATTR_TYPE_RMEM_* or the alias PTEE_MSG_ATTR_TYPE_FMEM_* =
indicates
> >> - * @rmem or @fmem depending on the conduit.
> >> + * OPTEE_MSG_ATTR_TYPE_TMEM_* indicates @u.tmem. OPTEE_MSG_ATTR_TYPE_=
RMEM_*
> >> + * and its FMEM/PMEM aliases indicate @u.rmem, @u.fmem or @u.pmem dep=
ending
> >> + * on the conduit.
> >>   * OPTEE_MSG_ATTR_TYPE_NONE indicates that none of the members are us=
ed.
> >>   */
> >>  struct optee_msg_param {
> >> @@ -186,6 +207,7 @@ struct optee_msg_param {
> >>                 struct optee_msg_param_tmem tmem;
> >>                 struct optee_msg_param_rmem rmem;
> >>                 struct optee_msg_param_fmem fmem;
> >> +               struct optee_msg_param_pmem pmem;
> >>                 struct optee_msg_param_value value;
> >>                 u8 octets[24];
> >>         } u;
> >> diff --git a/drivers/tee/optee/optee_rpmi.h b/drivers/tee/optee/optee_=
rpmi.h
> >> new file mode 100644
> >> index 000000000000..252216aad09b
> >> --- /dev/null
> >> +++ b/drivers/tee/optee/optee_rpmi.h
> >> @@ -0,0 +1,234 @@
> >> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
> >> +/*
> >> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> >> + */
> >> +#ifndef OPTEE_RPMI_H
> >> +#define OPTEE_RPMI_H
> >> +
> >> +#include <linux/bitops.h>
> >> +#include <linux/types.h>
> >> +#include <linux/uuid.h>
> >> +
> >> +/*
> >> + * OP-TEE service ABI over RPMI TEE_CALL.
> >> + *
> >> + * Requests and responses are carried in the TEE_CALL service payload=
.
> >> + * Control fields are little-endian. Response status fields contain s=
igned
> >> + * RPMI error codes, distinct from the outer TEE_CALL status and the =
GP
> >> + * command result in optee_msg_arg.ret.
> >> + */
> >> +#define OPTEE_RPMI_SERVICE_UUID \
> >> +       UUID_INIT(0x486178e0, 0xe7f8, 0x11e3, \
> >> +                 0xbc, 0x5e, 0x00, 0x02, 0xa5, 0xd5, 0xc5, 0x1b)
> >> +
> >> +#define OPTEE_RPMI_VERSION_MAJOR               1
> >> +#define OPTEE_RPMI_VERSION_MINOR               0
> >> +
> >> +/**
> >> + * struct optee_rpmi_probe_req - request without operation-specific a=
rguments
> >> + * @op: GET_API_VERSION, GET_OS_VERSION or EXCHANGE_CAPABILITIES
> >> + */
> >> +struct optee_rpmi_probe_req {
> >> +       __le32 op;
> >> +} __packed;
> >> +
> >> +/**
> >> + * struct optee_rpmi_status_resp - response carrying only an RPMI sta=
tus
> >> + * @status: signed RPMI error code
> >> + */
> >> +struct optee_rpmi_status_resp {
> >> +       __le32 status;
> >> +} __packed;
> >> +
> >> +/*
> >> + * Return the service API version.
> >> + *
> >> + * Request:  struct optee_rpmi_probe_req
> >> + * Response: struct optee_rpmi_api_resp
> >> + */
> >> +#define OPTEE_RPMI_GET_API_VERSION     0
> >> +
> >> +/**
> >> + * struct optee_rpmi_api_resp - GET_API_VERSION response
> >> + * @status: signed RPMI error code
> >> + * @major: incompatible protocol revision
> >> + * @minor: compatible protocol revision
> >> + */
> >> +struct optee_rpmi_api_resp {
> >> +       __le32 status;
> >> +       __le32 major;
> >> +       __le32 minor;
> >> +} __packed;
> >
> > Why do these communication structs have to be packed? With careful
> > design of the layout, padding, alignment, etc, it shouldn't be an
> > issue.
>
> Agreed. The structures already have naturally aligned fields and
> explicit reserved fields where needed, so `__packed` is unnecessary for
> their current layouts. I'll remove it and keep the wire layout explicitly
> defined, retaining unaligned access helpers where transport-buffer alignm=
ent
> is not guaranteed.

Good.

Cheers,
Jens

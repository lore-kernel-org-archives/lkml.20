Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793202405;
	b=WBl0mdtxOU46o0v9gNznYJLOtrKM766rPX5boG6Dn14CIUkjHIa+KaWbOs7ec3BBIlad
	 GyjoRMcooYoz04XSD2Y0lV5qn99osn20tj7e4lPbFJ8xP95zXEn1l6WRS3sYdbbn7gdFD
	 YzrUkFIkfjiFXn0z3gd1yU5gCxX8fK9iwd053nRHWvUkELflFIQy+ofnBiooyTNFuYBxF
	 fYrWXbQ3Ss2vGMXa7MAi8XH4EUlEbrYTT1zsj3G69gG3w6G4IHqVQNmA+oqBHNoSC/o0C
	 cWGeFxIJ6ldsqAGPO9ICuCvlT1HWFC1HIOs6uEMGRROIplcRpBcV8fY+qrLXB7yQ16A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202405;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fwiuAlOdFTGp/YuVBPPn/7K+Qfc1vHtLmay4GmxRG0s=;
	b=fA8K05YYfVaaBpplF4ijuPMCEbVX0F5hPruZkv1LJ0+0xifG3WT82Mu6rQynJSnPvCgE
	 av9/FYR/bA7grJ4nGUPPwYEYRKF1cIDT8LxFYUwJ5MdGT959qyhLbwubHW/BZ8aKhovDr
	 HBIq2fJZGgEGzulmYlpajrnjBRDnq032TlBxIEk7J+pTRisBjlpdGRb69dB8gb8OqtUoh
	 wfobX5bpufXgH+0r6I/b4qR72dp9IYoszR6ctUBWJIVpq9pbhAAzoVpU01qq8MEkfUtI2
	 4Tmy1OahOjuops4FZMPTN/h9exXAzy4G/lV0NzYxMq3/7pKWM/zkK54Ac+6DfuFdMhg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="CzHN/9NY";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CutEjGEq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F8A606A330
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71F8A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CzHN/9NY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CutEjGEq
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA4m0600090
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwiuAlOdFTGp/YuVBPPn/7K+Qfc1vHtLmay4GmxRG0s=; b=CzHN/9NYubbu4SRm
	sg12XjF91bR3Kypm5P/Xx4aA7eiqYE/n1TgN3/1+WTVYOzRs6TfyD+UApV+p4oWk
	ZXIcziOnfTEyoTUSdHcNkDL951Z3rl8yfPRLeKmLfVI2Kb5KmCXSlKBJibXegdR2
	F3SKi/GNJUO+3G+A8Lr3hFgpIbAASRmTx7mR7XU9FB+UypZJmY5vgsPRLN3tDXI+
	jdqY54Fnlz35kcg+brkp6BMB3xG+Qqp9B6IbR+S0w5ejCFO9JzheTYt5wpnLYjrY
	CfQl+KE4kZiciMnPpvQyUzwkjFzUfO1E/Ak6WGcjCoKQGP+M1GptySatT8MGqPfa
	/rElhg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f939qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:46:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc7361c62b9so687843a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:46:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793202403; cv=none;
        d=google.com; s=arc-20260327;
        b=GAPyt+UdpCz/FP8+KBP30prPSfupfwDtMbPvltg5TJK2RRUMYXA5DmyEMBMXlsUKeQ
         UxuYQZpz1R3cQsNYZtaMfoCIgeDOgSx0c+FLfHzRyzMXCf/t41JOd0r2k3ajDfxB+Saf
         c0851aTthVlauL4uzGpJLnXRFoO+Vl+vdK1Np5OkSDEOGInZJQN+KtKgaSaFWQab6daE
         ViUj1KD+/Zi5fhAekQm2m+9D1CnRSPblcLstO1nKnyShuxydNJSkd2EZWNIEaoqhykKB
         v9xPEi011lKoW/3eMIhGXMLLLgR/gbUHM/EY/LgEtV7eL9XvRqSslgTPdNM+Qbdzkv1x
         5wQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fwiuAlOdFTGp/YuVBPPn/7K+Qfc1vHtLmay4GmxRG0s=;
        fh=uxEd9NWfvY73NSEczzs/Ad0WZ6r4bZfooaCCEyaAi50=;
        b=CcS1ll/92/NnTAsTsfPG9REsuKv5x1dCVlPr4bKJ5BFo7CD37D1PCDDJU3UABiExql
         /+Z/amDeE0fYoBkk7XdhFgRiPuQJdnNI0OUO1Bcr9tHwD3b5OWu3573pPJwiU/GemH7G
         sLvw8GnkhpcBbe4nOxsVxbP5qhFRFzrPLVF12jeuXAmpedf2Rty7n59QT1q2iVLgwCWv
         X4XcuUWbriSOsMRZ1ByRn8Uxvg9pojo5PutgKOsZfH512zBDFTQFVOzpmRilAC0mVWGQ
         4aRZVbbsxSEneYcwngPqE58gBR7FOktq7yeOO2L4J+Uq7rOfWZgyNbX8YchmlCM4pOcU
         bNCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793202403; x=1793807203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fwiuAlOdFTGp/YuVBPPn/7K+Qfc1vHtLmay4GmxRG0s=;
        b=CutEjGEqdC0k96wPLTxqNCK/UrVb7RRy0E9O9NRcD88WvtDMYLej7qRvcFFa7EtQf0
         +v6bPzZdwxYPbsZuzA+4PsuDiUp9QdWccH2z9oHPlbJtR2ixUHMYJ+1QOfam25rgcWRm
         hWgY3UHunGRfuWUxknOiiOkyfYFRxujq6Y/Ukl1W1NTaiCOFIbafD7p5Lcp8SGL515Bd
         8LyoAxmRkFUPSEmDGUoXVUW6zhuWunOvriZEjx+yiK6MQT5wbde0VMgNNAAoXbOieM+S
         95X3OQwQUsYcvGrhlrSEhb4LNRNFB3zbKlKeV3PAftJ6IFUC/TghhgBk8ad5LBFETDW9
         qm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202403; x=1793807203;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwiuAlOdFTGp/YuVBPPn/7K+Qfc1vHtLmay4GmxRG0s=;
        b=J5jAiI3stw8dCvqzqf7eW6Cak7c7ltZdqqfsdz0YVapGKoNkjstB1yRBHMQbqAW20j
         XNZReX9uO3MoUc+QhFYPMqEjJU6yWzkLnzPNyssF60akSXzEyLiFSZ6gaDlZ6c9eRwW2
         bGixSFCXFPNJsSh/lGqWzX0MdqNTjwotNET1UyzhEfSFKF5S+ja9ZGDn8iNq1HNEPy+a
         PJdOlcr5WbtZFQ4ZrtigCAD4W4o1BNTd0ZBFSQPKaUJ4nfrrdoE3MYAi6hKDdt475rrT
         k792KEVTW8gNeC+1kenIiLWuqvxvjmDFFkFo/dfS25kCxYJvLL8bkMOk72XwWLpX1jnz
         1pBg==
X-Forwarded-Encrypted: i=1; AKwUvBzZOyMxgBRFDhhsfdAP5tfUKF3xISivH+l5PjQgKbl8+KkEq2Iu3pXYRTCYFAoDqeQmTfU4WzbIomu943I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwgUUw2ojVg6JpIUWKmb7WSCHO0wvhWQ2tIHngyVj0qDlvdxYu
	9o5qaCxFI4CvoK4hJv+E6+Sly7bi4RzIB26OjnNX+1k+XImvv5I6rHIwq7cmT0uo58FY+JGObdb
	NTtD9eTJ9DGneVflq9OC/WJt0cYy5QBUKwrfjsp0vNJFeXeieUJA2fS3PoR1BzPeXSyYCI4husg
	wxaUebB9jDaY7Vum4+xe+BHgHopoSEAOMBj0XDygECvg==
X-Gm-Gg: AYBFou25gH5ZIepwj3ZLzaCcFCyI9zEYFooP1DA9+v57bRWyz+VY5MABhOb0z1wrjKB
	0T8QPaP35JRqedi8B65FihnM9o72E1860GmDDxbGdW00/AkWE6ADQocpJ38Kgmky8NF/rYFs4iW
	OVFNPWzGhpCtPbyH0LhgXjv3scnJPibhsY8sQ7uOwwRZLn0yAzKP1aibt13A==
X-Received: by 2002:a05:6300:68c3:20b0:3e2:ae03:b296 with SMTP id adf61e73a8af0-3e902356ac4mr1512112637.37.1793202402947;
        Wed, 28 Oct 2026 08:46:42 -0700 (PDT)
X-Received: by 2002:a05:6300:68c3:20b0:3e2:ae03:b296 with SMTP id
 adf61e73a8af0-3e902356ac4mr1512102637.37.1793202402494; Wed, 28 Oct 2026
 08:46:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com> <00b63b4f-053c-40cf-82db-21a86fc485c6@kernel.org>
 <CAPx+jO821-wULVT_KbZB4oaPSYAHi3PEpM0VzvSL_7NBns1t_g@mail.gmail.com> <CAKekbesRt5qDOf76MBG_8hROMa6Z=UCNdXHKoE=5u3xFcznhhw@mail.gmail.com>
In-Reply-To: <CAKekbesRt5qDOf76MBG_8hROMa6Z=UCNdXHKoE=5u3xFcznhhw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:46:30 +0100
X-Gm-Features: AclHuK-2LlWhfF6mpZVFoUdjCSzptmHG7wqFx-5auuefVL0ilircgV-PNrHI89U
Message-ID: <CAPx+jO8F8fxPGgCX-HVQT0D1irZprUgcfVtm_ABS1M+7s3LE6g@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: mmc: Extend keep-power-in-suspend
 beyond SDIO
To: Kamal Dasu <kamal.dasu@broadcom.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-mmc@vger.kernel.org,
        Ulf Hansson <ulfh@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae218e3 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=VJCnStefonsj0tF54p0A:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX0jHAY0dfvvz3
 ZsMXEpd6mLBipSGDuUCj55D07XRt0ZoNiYhSrpMlUioFm8VrNKEP8RfsPUzvIJ+l8jeJo3dHACx
 HxEPUbNd4gv6aUzfykY3S50Vrshq048=
X-Proofpoint-GUID: ZZSyOhxtz4M8eF-c2f6xRphgx6y6KowF
X-Proofpoint-ORIG-GUID: ZZSyOhxtz4M8eF-c2f6xRphgx6y6KowF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX3gZ2oatIeqVL
 sFPVyme6k3PLt17IV0eufh6n/TE8Fpjq/f7KbPMiXoMjwPmtrjd+ZEB+fU+RbsIR025e8z4Icyg
 JC7EMFoAUVh2O9LbywKUQT+jKJBZpWJJrvgBn8NOohbb5eS0eqEJGwhkcZ6wdo6tjGY105oN0WL
 hnozciDOFefYjPjc5c644FQHEPfa3K0FPxhSFPLU1xlZLhZqjRNe0ouyuy9EXFzINb2qAvYtOaO
 QzQkXzpbP4OHd2tfIoJwkpr6Bvh0qxi9G6Y6d34jT3kuLC57wOnAvFuBRHH7RoAc4JFcSYeXcCd
 +jX/CJNlBHxze20AFs2OoJXauOf+5b+culucBbgxiGELzXbDQiPlqTV1CWu8oNjkatDUjW0KFcs
 vutFUzf2O+de09/Ptg1qaqVxVUWh/Ayd8dMYO+gXpbqL0VwcxxZebRV0p0rUPxilnZONDr9/1lH
 U0gKPI9jHfuSE42tWVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On Tue, Oct 27, 2026 at 9:31=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.com=
> wrote:
>
> On Tue, Oct 27, 2026 at 3:48=E2=80=AFPM Ulf Hansson
> <ulf.hansson@oss.qualcomm.com> wrote:
> >
> > On Tue, Oct 27, 2026 at 4:33=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> > >
> > > On 27/10/2026 15:40, Ulf Hansson wrote:
> > > > From: Kamal Dasu <kamal.dasu@broadcom.com>
> > > >
> > > > keep-power-in-suspend is currently documented as SDIO-only, but the
> > > > requirement it describes -- preserving card power across a
> > > > suspend/resume cycle -- applies just as well to any card type. Drop
> > > > the SDIO-only restriction so eMMC and SD platforms can use it too.
> > > >
> > > > Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
> > > > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.=
com>
> > >
> > > Incomplete DCO.
> >
> > Sorry, I should have explicitly stated that I will leave that to Kamal
> > to contribute on top.
> >
> > Kind regards
> > Uffe
>
> Hi Uffe,
>
> No problem. I'll resend the two dt-bindings patches myself with the DCO
> fixed and the DT list on Cc. Do you want them as a separate two-patch
> series on top of your patches 3-6, or should I post the whole series
> as v11?

Okay, I leave this to be managed by you. Please re-spin the whole
series, to address the minor comments/fixes so we can get this queued
for v7.5.

>
> On the SD wording, since you plan to add SD support too, I'll keep the
> description as it is, unless Shawn or Krzysztof object.
>
> > That said, I was also thinking that maybe it would make sense to add a
> > sysfs node to allow the behavior to be controlled by userspace.
> > Thoughts?
>
> For this board the requirement is fixed hardware behaviour. Firmware
> reads the card at every S3 resume, so the card has to stay powered and
> be reset each time. Without both DT properties the board enters suspend
> and then resets at resume, so I think the DT properties are the right
> way to describe it.
>
> A sysfs knob could make sense where it is a policy choice, for example
> on SD. If it is added, I think it should not be possible to turn it off
> when reset-card-at-resume is set in DT, since that would bring the
> board back to the failing case. I would prefer to keep it out of this
> series and add it separately when SD support is added.

Ack, let's have a look at the changes for SD later on, on top.

Kind regards
Uffe

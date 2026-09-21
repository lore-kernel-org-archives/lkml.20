Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B055158B9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027928; cv=none; b=HoFzZYl2HtncYubOv5AaA38x6JHLG/Hyvw1ivXs3x6J3iQMfId6PXd4akhvM/+hpkiZFz0OAuSMGCoo99tLWXacuyL9sdq0G+JODXG7UdBHxqrtkstGvmyrz/3sAVORrn6R8VoKy6h2n7YTamI+XPIii/n2cJBV2zOhogV4MnOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027928; c=relaxed/simple;
	bh=oQnCHtOLAC2VK421zR3NYbi26SLJxa0u/brSYBeX6uo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OrlSdgxRuHUyz7hhYPnSh7+1DZGy0fAki5tXZUuACKTHCEfL/jHNhZ/0xDDSIpnGoP3cE++KyWxV6PMCkbu18xzBbexNgqAI8qhXZR1mF/PLqGkZa1rO7cO/bqF2URUhcjR+y7YO35FBOz8t/LbEch/QiI8IXOLMp1dT20GQyCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLmyTnAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHipJNoT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLmyTnAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHipJNoT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKf2Z12546661
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=; b=ZLmyTnAZCsDJbxf9
	oqVbVpjtTsP7rUB66vDktHclSGqyjK9Pz/QB59+mKZ354Rn0zo5yxCjo+UawpXMo
	UUimFTofLn+raC8bHrpZunkJOyFlF8d9QTRy7ypZ6i25gigEbbhtMk6vtw/2nCRe
	VXc4f7d/2cbHyzchfeEn6IsybHVLAHIHZH4mF565ma6n5M7aQoRQAn/Gm8plOfN2
	cdCW0+pgNkqJyqt1EuDSixZud/wGP3TrUS8La5r+Qa/+Ar/dL17IwSZIO3hO41ww
	R1YD7d5+xjxwi2iyd3E5/WD2EeAr0ukcw7ds6+eqVan7S2Da9cdW5vN+8OZi2vaK
	gO2b0w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu011bjea-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:58:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so26276955ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790027924; x=1790632724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=;
        b=aHipJNoTzEZ0kLKfgtsnMUGg0LA+7DgxRU3o8RJVZpD/lFd/VGBSUFeVj9Y2Zk6IWb
         z7dWHnqKG8C2uCnGGonE7+C+Q94Lag6BWiQDxpNMpTJgGaQv1svdlOWHOUKt8jDIgT2D
         mgLzKR0InoJg1/gXFSMDtvQAQTUjGUGR1EcR8Ij1H9YAz1Nr5JHvjHV5qp9ew+wFQuul
         9cC7lBLxuHMmk9owrVy89+BtgPPiThU5wyQUkBhk743OYgaLv3aflM1jO7vKB7P6+AGY
         NVFC3Wszdz3WtaD7iPISUd7sAoVPYTHiQLMobdEfk3Up9K4acfhvFQHWd4CUGYx/BI+T
         dfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027924; x=1790632724;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G4FuUHpGIZcp5Oatw0o6fh2s3f4mtV+T4R77+69YOVc=;
        b=PCgr5d6dw/jYaH13NwK7rnDf0/YLoD1RCXw5intbntpyHLHFO7iIavySE4oa4GYhhD
         LCh/ZC1ZHCfgVpWrikRwNwenMeSXZT6u7NIj/FGmAOIyC8bABwdVv0aVAWtaWFjcv4Fv
         0VBkfucuCHjhsmVLZQXlLjrvxTG7THv4huygmZbdY0SvT9TAVdBOW9uG2RoDXt36Vhpq
         ASt9snssisnhOAh4RV+hV+3ebGzJepfFdkbFodCcFdhxD3EaD45Uv0VeiC1fwZ+Ay57L
         ZGLWuz/mqrvs0ATFPmIbdmvdnp5WihDR7zJIOEstcLKBfDU7yJKgIU2V0AtsOGcJxnMi
         JBEg==
X-Forwarded-Encrypted: i=1; AKwUvBxByY1XM1pbIEfLDlISV957DRlThg7xI1XaIYFfkE16syiVLhGToPh0e56fVrGnbcb5M4wxovxF2zjCUgU=@vger.kernel.org
X-Gm-Message-State: AFuF++l4AXSHDzWPR1Vl5HbzKWNbCmaXwR7M/agsDJpEOQltkZ+7+mVR
	EqaP23n15D1RBMgeiaKoD9C0fZYWI/dV7LdZi5F+JqhdTtSkjhuKbVet9421QzKi9NZRDllP3+w
	1odUa3sUs0sdiUuuwu8WtGtIq9VTXrH9effivkPvLzjLENrESjoa51VJkYkmf0CDIpOg=
X-Gm-Gg: AYBFou1hz/mkF+VMBZUL+wPSQnZ980DvDM1ZK1Gfq2qsnmvUn48ncGKHb1OUp7qZ/y2
	76N7h9WMJUgl3dZymnn2ydUw5e11/DnUSWfFysrBddkEUpWdKT78Nte+gHPydVINCvP01SfKPY9
	q2gmynO8phnjq5llU0xS7eVunpM/iEWALCoqI5g7BTit2SVOXGgmPW646W+XmN/6fQV8DZlNgd2
	SRUgNt58xcv9LRtZxCK5JyL+VIg93jRiIi1KjCpRsdjN6Lsbz3AH+lrAEy0m3Ovx8h0qqfQocPJ
	LHKYety7nMfGxqL45jvBZKQBDv1k4lCAvfErqQdW/6nrgD31UOLB2kGyw5KB0dkia571q+zC3q3
	aMTFivPrcMTV32xNqyrZ734ug2Q==
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr166867155ad.18.1790027923999;
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr166866905ad.18.1790027923453;
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e5ebc658esm835412eec.12.2026.09.21.14.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:58:43 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:58:38 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
        will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
        aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
        joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
        linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
        sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
        WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 6/7] firmware: arm_rmm: Ensure the RMM has GPT
 entries for memory
Message-ID: <20260921145838.00003b04@oss.qualcomm.com>
In-Reply-To: <93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
	<20260912083611.2513845-7-suzuki.poulose@arm.com>
	<178978126543.2352296.12214136703168879825.b4-review@b4>
	<65b0c03b-36b9-4e60-aa55-c3b4b85e21ee@arm.com>
	<93aea89c-0a05-4b5a-905d-2e8c14a9e894@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: K3j6VXAsmtd_vqd_sULjfhSRvfoC3e-v
X-Authority-Analysis: v=2.4 cv=dPczC+Zb c=1 sm=1 tr=0 ts=6ab1a895 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=8nJEP1OIZ-IA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=L8e4LJ7mbMe5yfr_-rMA:9 a=wPNLvfGTeEIA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyMCBTYWx0ZWRfX2pXbradLI1np
 wLanLuXdmThMwbRn3Ayb6pruJPARcBm1K0PS6jjFo1ryPfMqHBHJR59Bxeo3+V5Y+HO38R4adPL
 Y+kcau8ASLjArUYHHyHCkhgwgWLl/LCtSi3THZAksyfFA1lkUv4+IgAXd+KN8cMY3ICra/S4wlr
 NiKJioQU67glifKkw1UgrBKJCDUcer88CcKblNk8xGQuPDBSPbhWAAPOB1ietyE9YEr4P+bdqud
 l9QALVTJ37aSgDM5ZyBeVPJFiakOfv6IV7Gr4yuOOFCQwlAp7wNQZ2tgod1LbAdA9Dt5edv2qVR
 ONOk8NwnqYi+JnbMeUogBCsdKFKt7/53682xD4eecEKvVPcb2GeOHSdgh/zvVkkywuV2mxGaE7n
 sldHI3ppiwgR15/pJE8K5pxdsNnJJMgbLsHMXr2ESEOo3ADGFqp+El8avb1VheXjBEGdKeiIhvk
 GwZNCM9K3k+SYPb8ZSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyMCBTYWx0ZWRfXynvyy1/ZX2tn
 DyOUfFcxLjZb63zVpxZ05OfSmS9hHdnb4DU+on72Wx2/Qsj2aJeOfVQPjwMjVApZyWZr8IIzwSg
 NJHgez2EHsVlgdMCvS6bXyzTpspMmCA=
X-Proofpoint-ORIG-GUID: K3j6VXAsmtd_vqd_sULjfhSRvfoC3e-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210320


> >>> =A0 static int __init arm64_init_rmi(void)
> >>> =A0 {
> >>> =A0=A0=A0=A0=A0 int ret;
> >>> @@ -786,8 +970,24 @@ static int __init arm64_init_rmi(void)
> >>> =A0=A0=A0=A0=A0 if (ret) {
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 pr_err("RMM activate failed\n");
> >>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 ret =3D ret < 0 ? ret : -ENXIO;
> >>> +=A0=A0=A0=A0=A0=A0=A0 return ret; =20
> >>
> >> Why did this change? =20
> >=20
> > Rebase messed up. I will restore it. =20
>=20
> Actually this is not. We dont have to check the metadata if
> we couldn't activate the RMM. Also, the failure path at the
> bottom has "deactivate", which again is not needed. So
> it is the right thing to do.

Only after this patch? Not from the previous patch?

>=20
> >  =20
> >> =20
> >>> =A0=A0=A0=A0=A0 }
> >>> +=A0=A0=A0 ret =3D rmi_init_metadata();
> >>> +=A0=A0=A0 if (ret) =20
> >>
> >> And this is hitting another bit of guidance in cleanup.h.
> >> Functions shouldn't be mixing __free and friends with
> >> gotos.=A0 Again, not a bug here but there are large ugly
> >> monsters around this stuff, hence the blanket guidance.
> >> I haven't thought that hard on how you avoid it here, but
> >> usually it's a combination of suitable helpers and wrappers
> >> and resulting code is often more readable as a result. =20
>=20
> I could change the hunk to something like, but that looks ugly.
>=20
> @@ -1010,20 +1010,12 @@ static int __init arm64_init_rmi(void)
>                  return ret;
>          }
>=20
> -       ret =3D rmi_init_metadata();
> -       if (ret)
> -               goto out_deactivate;
> +       if (!rmi_init_metadata() &&=20
> !register_memory_notifier(&rmi_memory_nb)) {
> +               arm64_rmi_is_available =3D true;
> +               pr_info("RMI configured\n");
> +               return 0;
> +       }
>=20
> -       ret =3D register_memory_notifier(&rmi_memory_nb);
> -       if (ret)
> -               goto out_deactivate;
> -
> -       arm64_rmi_is_available =3D true;
> -       pr_info("RMI configured\n");
> -
> -       return 0;
> -
> -out_deactivate:
>          WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL,=20
> SMC_RMI_RMM_DEACTIVATE));
>          return ret;
>   }
>=20
>=20
> Either ways, we have to cleanup the object on return, no matter
> the route we take. So the original form is much more readable
> for me.

Agree to more readable, but that fragility of mixing __free() and
goto is a real problem that has tripped many folk up - hence
the perhaps overly strict guidance.  Rather than avoiding the goto, I'd just
not use __free()  - go old school and have two labels for errors
and an extra manual free in the good path.

	pr_info("RMI configured\n:);
	kfree(sro);

	return 0;

out_deactivate:
	WARN_ON(rmi_sro_memxfer_cmd(sro, GFP_KERNEL, SMC_RMI_RMM_DEACTIVATE));
out_free_sro:
	kfree(sro);
	return ret;
}

Sometime the new toys aren't the right answer.

Jonathan




>=20
> Cheers
> Suzuki
>=20
> >> =20
> >=20
> > I will see if I can improve it.
> >=20
> > Cheers
> > Suzuki
> >  =20
>=20


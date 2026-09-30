Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB3D4FDA5A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784974; cv=pass; b=jtVFgqCgYfLIKxkvef37yGC1AW5HvhAVNWrchH8wHf8/OgA1gJKWDiPc0eKf9qkEUDFsmLGyqrqOaGdsWwo4HyQ04egivltSL95z809BxgGx/LXgIMtWJDb77bzFVI23BT50uuBImVg21PUNifoiRjJYLEtati8frrsnMXQRGeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784974; c=relaxed/simple;
	bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b0nF49Inx5WMM0cM5xxb3+QDz9Fn9XE91rIYNs/7nCgBDN5WXbGBGR4m5zsH+h5eLk25PUWgjwhIlL4Avaw1GW9JvmDTIDHAaN+Q5vIn1p3RRoXCIrNdubgJ78LktpQqg8Rg/jwq1sFbXAsnPr0xz6jzCA8RjlXT+wS7m18Zj6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lp3EDzfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAKSCLqZ; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lp3EDzfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAKSCLqZ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UEvGJD273573
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=; b=Lp3EDzfmeHS8hX6t
	GNf6b1v3nhcN287t091qE6K9bjMVmKlepLB4LFKiT3yi6Og1majvzxOvHBh4uOtn
	tna3Y86n3MmjRD+fdqPQ3Xck1tpo2x6/9KCm9XzbZRo4KEz5bF9ux3ebPQhD1nE/
	iEIG2a1asVlBz6SpFz3qr+DVhxe5Q2pzRtas0HgwCVWt5wVXI20NfvvpsVik0rvE
	HDZTbF7UHahM2r3XQoLB6xFI10QdtgpslIbq76JB+uxXaOOWVmNH7V+PrigG6B0S
	Bjd4KQEuRTWcTuJnK29KdZcKilTa6UgEqHZYdWGdsKq1EQ9DMDFAtf0fEdOqPv1T
	PVmFlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n20ck6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:16:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cee1ec30f2so53099955ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:16:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784968; cv=none;
        d=google.com; s=arc-20260327;
        b=me91KQ/Y93q+nMhJrl5D2ec6Tp56VtO5o87dCRsPPGG5uq3ISBGLfhe77pmc84FPAU
         RQ28Pdn+1C1HgB7n1ZnHBUIRPvDI4RJ2Yi/XMBs6TjcyUwEzIAI7YBXp8vt0HvnUapGv
         1/DmYjxhm/O63QdrkcQbYb+QLiNEyGlENRuZ9ZhMRcZFZXyvhMyJfVR/zvAU9zKQAEQ4
         xkI88fkZ+MfQGfoy0y/cF9dV0L4ifIEkn+ZpMG/NbsqOa/eSOIXft6ICrzYTQ7HrbiaE
         v0kgAbt/5Jfe331V5vnVRqIHSVoimh/GpxzBm9Eo1uRaW1wmewi3+KXTcEBSxQCGNcKm
         sXSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        fh=3eWGshja5hGXgBDHz+sxwDJtyo/a7BT9ckBiA2h6kqw=;
        b=SVe4nHF3+Vi3xLS++ey2QGIs9hSeRs6RU5O1WsijVENTHjDNgpbRCe6eAsd+hAGOBj
         /4of4FViY2N5lQxyr70f2mgdBUfTQgu1eTNNs6p8qMDoJOtsDGl69aT8ZyC5NoKKppjJ
         90gY1XY8lHNhj/BAmpwPkQHbdZgD+WckSlI0nRQz0BOqew5bBOQ2tbEcSUQWckORTsiM
         +G/936UA5MOyIbxq6vEj5Ol55T/dYoLb3xlNdxPA7abmyn1V7DicHA2cN5oolwwEUxXP
         jIMiEuqG2Ed1Jvm4s5q51y6cANmhEP4zb0hfO3uQpkmiDkpOw5s6OSCrkKZy81z4ElXL
         aJvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784968; x=1791389768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        b=TAKSCLqZCGhZ2dX6cz6mHL+6Q/tN7PfXGZSSxYy3Yp/wYRW6JIgILbBz+1PdvR254b
         zDjmcbV6LUBq8RdUv+ok+iuuOCun9HnA7Uj58ePl/8ajv+zwxdGOtbl9CQh+QDbBImiB
         94uSIkq5W9ojLwADCWcLO3BR2W2RLO5q4y3HXOGeH6zmZbhgyZ23mApYGUWGOrv6hza8
         j47mNpGuj/eWTCNGEQoLT4OCB+RwYabSPHLc4liFx4tvA/MeEZ8KcIhqm4s8GuCyHd1V
         zwjXy3wrELLMuGJRzuhmd2ev989zwjwj4ckkokSH5ExFLV/kSfJbMh/Vj0AHS2kAgqPe
         Fj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784968; x=1791389768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jHSXjClGImaLnUASuR+8jTdYaDGN5yp4X04WFyLMPRo=;
        b=HffFhEwBa5kOv8ZD6RLfINGh9URsoRhkLIXdi1j+5t6miYqjYllYZn6CBh3t52Qs1T
         nZ3HQGjhn2cscIDjr5Wu3jXRYyXm6Wx+FkJdVPRplVdkJ7NnsSSdUhnXsYmR8ey2vH5w
         1yRiIh29DjPzdI9/S/0/RWtkH6vo4323nOnuA1H8UK5q8r9PeDLGo8JPTtd8bT9pJZuI
         yUMV87CBoz4iJkhmD7HeS1CIETKG/oxnH9EBznYVUNoSs27sB+nAZGYVm+6WWJY3Urhi
         PizvAjrnn6zp/Ve23THfk4+H2as4i5CXvbpDTfX8TkwCPcNUDXi4cg64KZwuOe870ffm
         pFXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHlMJ/ShCu+0FbxFSktJa4zX7mdWoaDnNdLPN3GrCa5qUuWfLerogi6c2haz3+xfxMGcYzrXJzND6iXMg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu860X2+MOU5iTCbOSm4WyPpsTn/KztZSjxvHUBhzftcb9wd3L
	BNf5mESq08j+zDOZdlFB6h3wmT8m08gr6U/UqkrVouFudzHfLRVpD0s2s3+qdLxlqn3etIEZ6vt
	f2dwnrowXvGyxHcJJkGkaQPWbJc8M1NhBWEBn/n5zOlDvckZ9nIicT0Y/ehE3m9T54fMZ1v3FhO
	GNG0GKtyojqbB0wfaOLyaZPR0vSD5Z15MEUWOfrvQGxA==
X-Gm-Gg: AYBFou0ihpzQ5/QSu8ciuYoBLA5KllTkBMOWVnGfmdXYKuP6OCIoRB6MCEs/bVO49J1
	UNPoejXxZWi+cO6j8YoOSEJFlwP2rrUO7NA/SS1C7n4G4qe5xV7T/68anD6gcwqU3nw0xa18/dH
	x0Q+jpr8WXnVF3ZRIVtLPV0Pehn2Km5GQjb7frl4fK70tw0sKLGccPyIj21CmPBB9cxKV13d9cl
	ZHujX2JSw20+WP9eQ==
X-Received: by 2002:a17:903:2f90:b0:2dd:c100:4253 with SMTP id d9443c01a7336-2e2e4bba080mr12556015ad.55.1790784967932;
        Wed, 30 Sep 2026 09:16:07 -0700 (PDT)
X-Received: by 2002:a17:903:2f90:b0:2dd:c100:4253 with SMTP id
 d9443c01a7336-2e2e4bba080mr12555795ad.55.1790784967454; Wed, 30 Sep 2026
 09:16:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-6-mayuresh.chitale@oss.qualcomm.com> <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
In-Reply-To: <0710BFDE1F0C1A44+904c9e59-a255-4207-8f39-d465c6d7c273@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 21:45:55 +0530
X-Gm-Features: AclHuK_5_kyqVL5WkfqdmvErnuGjAMAb_FhsM3KGsPnLyHRAuY03VjFVEgGyo2g
Message-ID: <CAHuiULCAAz=HUR6Wog8Avrpd_nikMme+dRgoMWCgZGYCkx31Wg@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] gtrace: Add functions to start/stop tracing on a
 component path
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: adrian.hunter@intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com,
        andrew.jones@oss.qualcomm.com, anup.patel@oss.qualcomm.com,
        anup@brainfault.org, atish.patra@linux.dev, conor+dt@kernel.org,
        devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
        irogers@google.com, jolsa@kernel.org, krzk+dt@kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        mark.rutland@arm.com, mchitale@gmail.com, mingo@redhat.com,
        namhyung@kernel.org, palmer@dabbelt.com, peterz@infradead.org,
        pjw@kernel.org, robh@kernel.org, sunilvl@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abd35c9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=lv0vYI88AAAA:8 a=510OZKsArkfa_Uw3Rd8A:9
 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX6DsnNy7ZOgWW
 rMS/j1htrjW3COW7EvpxxUTPZomHJ2bX/Mwo0X+3/oeAM1jijnYd24kip+qCzJgfmBzFgomGGs9
 FoDHgJuATf+tfLYqW2TzgEDWBd67x0U=
X-Proofpoint-GUID: 6bVNZ_II_eSjC2oYKVxYPZbyie-8EBSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXwmWx7ZPyIXM8
 xhZYsQR0GJMhUpBS50KG2Pdqr/Gn502TF17ZqE3q51Lv54XuW7t2If0/7gp6FK9Uq0KlwivmRel
 PgQt4VXc2OSCKP6q6stV3AqRxb7Ov0XOUM0pxF6phWZLVw0Nwae0q+cCe4wlMtK0fS9dTVUjTfg
 33xZsy9cP7XYbcAGtH0wa9wwfD+tuKT1TgnjxDcPz+cyxYBirk1BAZnhzZRlgNEiDA3XW0A9e34
 awIFMOPldwxgHJhuwxXG3g5krhsxeW2jNF9QV0A6H4SWMFMOvXjyqg5urMfha6aeQiqPBVDLpY3
 eTTMHi+5Ij/xKrF5lUTE0PB1FHd4xC73B+UPinCrfy4vTHOEVKmzAT/zsLC/CGXNRZ9y0yHoF6J
 i0+QQGZ8Yh3JYfu7XBBQXzp/fnPwCtixxkpH7dgCygeXL/2PLFQyxdrFO2TOg3iTrgPrr+FDq0Z
 zXGw/GI6iQq0tM2EyJA==
X-Proofpoint-ORIG-GUID: 6bVNZ_II_eSjC2oYKVxYPZbyie-8EBSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

Hi Zane,

On Thu, Sep 10, 2026 at 2:47=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
> Hi,
>
> It seems that the scenario where multiple paths currently using the same =
component
>
> has not been taken into account here.
>
This will be addressed in v6.
> Regards,
>
> Zane
>
>

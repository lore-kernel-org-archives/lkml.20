Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343414DAF8F
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546815; cv=none; b=Y3853fs4HL149rFqiTOyCeOnXVHR4LRd2YI9ewDWwlrpkmbq24x2GR5v9HW4iNwIABgZIFdQEEeN4Z+VIUFfkm+1Mx/joxvcVnmINVZbv9JX66b0oDhHvpMbzWwqxM2x+I6aFXQJtbaI2BhdobbFt0s0u9AvFdTH8DKb0ImRrqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546815; c=relaxed/simple;
	bh=Bjyl2X+mH6fIScoNVkJMiXDTc0kRmUoqxKGF9RTavgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YWTCvj+uQfBWuAYxt1cB1v6pqYPknCoV5+NAx/tTHgUFEqgRKxjlLL4mPqcy/PldII7RqXi+JOLVayOGhXAhg3+we9Bu1vQo350myGRmOU7pEykllaU8ndhDeVrah9M0+P7jC8dd1sv4sIsTeCOycVFxNt/04964ssdHWQFBi9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NF/0yA8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L4eEWKem; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NF/0yA8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L4eEWKem"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699BdDJp1687125
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 11:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=reZfXbmp6yLaHEWG8SUuHXTDZSJLk3XotPV
	TKdZ5Mp0=; b=NF/0yA8y72lafuLfRe+aIJVxJwV4iHDwA6XshihHLm0Gfa7fda2
	gHhAthPpb2hG0jsu5b8t7N17UAD79tgft/5qU5A7//1cNGEpXF1syQeQfxk2Bk7i
	G5yoRU53qSynPSQ1aIy8LhNCOjBq7HWgmtNrQRkQtOSZebd9qGkqmaXrYmShCZM6
	KFXofxPNzKHLM8HXneo6uSCg5wFkiTR4/Jb5Rac+DVxyssj/40rJASnA8no/tRyi
	wa5bENRBdOclPa1lTBVbJS6bRIEYb22lHkdM9N4h4jDS4Vpi+JxN+kZDt+3Pmxds
	ZPGw6ElMx5sjYbrMagkuklfo+WeTizRfEFw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6yk7g1ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:53:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a3c27c9bso106219736d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 04:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791546803; x=1792151603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=reZfXbmp6yLaHEWG8SUuHXTDZSJLk3XotPVTKdZ5Mp0=;
        b=L4eEWKemhXqR0wrMG6UI41/DcxSJGVZ2uXRY2VqR6Om17ssW0ArEiq6WeKxJcR/++u
         4olJ+XezjNP/yndTExb5wHmyJv25mWix2uJRFLbxHZ81IQB0DP9uvBo+M24QbPG1+PWO
         dCkjHN/tJoMqKT2B063XAL1AfIs9lv8fSCUWo//GQIFxK2kwHDqfPQeSNuv5Q35bNAMq
         Sig2aP00g1XDpfwSAZV4X3xwUI75xZzozxWcVS5MYZPt4+xlOf3or3mALiDhBa7NOudo
         weSA9+Zpe5wzb6FmSDOkkRbkjU0liuc08cC96hu4lqIl0DP1mBJbewR3GtWyDRlSNCUg
         q9RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791546803; x=1792151603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=reZfXbmp6yLaHEWG8SUuHXTDZSJLk3XotPVTKdZ5Mp0=;
        b=BXVgZkDMTIfKuP9GQFLAyxSDKB9sbHkEk2weqZbZxOPIZ2FzzBveeEwqP0UN4KQR3K
         ix4ZS7cbiz6LVJSnsSKDWfvLEK0//JVCThS3DI8AEahA/aldFXdAwSa8wMF8vDGSxBwU
         jOGtJCLgQm2oyF8EWz/O5Eo4OkoPlwXPKlE4I3Xl+c3yqhRj+lIHE90ocbEXnJkvFvJa
         8GrFo9HflJpwJi7J58EqssuTSZ6QwCuFtmO/I8k52rceiL44ChdG4r5DS/RwF0iy4oE9
         Es+bt0XuPfRkZCZZm3jDPP9j7QPcsLQmXGTF1BZUG2Ts3yqHRIBfy+W9gt+pa19iV4Sc
         NsEA==
X-Forwarded-Encrypted: i=1; AKwUvByBIlnn5M7i9ZpTAerUn+wy635MdZSJApLwDHCBd2VqAmtehvDvWuUKbAant2VPaLC4wT0Ea2u0n9+sie4=@vger.kernel.org
X-Gm-Message-State: AFuF++lAwG4oLNWybt3fZS5iSjqvrFUiEafv9YN4GhOR0OREMkGNxjVX
	RdWdxDcEZYawT/jrLhQsBaC6+juDCi7C/haR1JYtjA7vWii4LVqvRClE5S2j71m+Y2K2py21hRP
	F/f9qbP9MUD9K9xqx3kDBOn1wYnVW3GuKUeFgjVcoAm2MAgPsyVhPCOKXhQ7DCW6tuNg=
X-Gm-Gg: AYBFou28Dpz5OMTRjdFNXZWD03RJQCfaTchR4WcBK63zV3NTVixypeQPtbudMswQSpO
	mluH8kH3orFAILoaN1UA5v829RFXNjF0xB+wXHCaeqIK7MVXGz6beJpuH41efkPBdIYleCN9gVU
	P/Z+1juPpxX36mVkIyFqiV6vfdycH8AIUr4Y+cNh9OYW/BDReat83hwxPQ13zI1zSYQmQt4+f0J
	UFotB0VlfZm8VTLa0+RAq+LLk6gt2cGvc6PruVJ4gEgBp2i3aX0NTCtPnk5wehXnFguomfr3jfp
	//5q3l+F4QxXkVCBqsCSjwRBlDjgya18Nah9/NeXyiVAIBbCGV7qCY1A1c33q+8E37F0dS6bffm
	2/ij0Refa/uEtsiT4TqcvyLoX10GrikvHLIvVPtyOW2Q0PgAmhR0ZymwdUg==
X-Received: by 2002:a05:620a:3711:b0:93e:9292:1bb0 with SMTP id af79cd13be357-93ebd0c08e9mr211379185a.3.1791546803129;
        Fri, 09 Oct 2026 04:53:23 -0700 (PDT)
X-Received: by 2002:a05:620a:3711:b0:93e:9292:1bb0 with SMTP id af79cd13be357-93ebd0c08e9mr211376785a.3.1791546802609;
        Fri, 09 Oct 2026 04:53:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a7cfd8sm83244166b.44.2026.10.09.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:53:21 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: Linus <torvalds@linux-foundation.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v7.3-rc7
Date: Fri,  9 Oct 2026 13:53:17 +0200
Message-ID: <20261009115317.14472-1-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D63SufRj c=1 sm=1 tr=0 ts=6ac8d5b4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=0s-mVxdY99Q0NorlSv0A:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: O8uPkaDysA5Aw57ckxyh4PaOv23dyHpK
X-Proofpoint-ORIG-GUID: O8uPkaDysA5Aw57ckxyh4PaOv23dyHpK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfXx1kwl9CmiI1/
 GrfkJeLEl6EMghCKtRCOdJV+Nzrk5Ee1m7Juj5F7N71CGMTqqeNacjABeB9ylEF2uvroxTj8rKm
 WuypuLj5wdtbMP7JlZ4Y2sZuIfyPVBATXrCsQLZOdzBARW6f4b2ZQrT/OtQFj5BfjEGLH/iRck1
 Yj2g875bwlvIby9Rfikt8uzOH2PgmOxT6cxs8vgEYRU9tOZ4jHt0mG2hky720LNrfQ8Rue3fzxF
 Xg+6mNRTY4FeD6ZEeMcVQ0vjuXYofC9W18+vhkXbtvGYEgAX53FIiL06qq5BE43FL9wgzuozMsJ
 FNU7fxF2X4W5KROJ1pdRgXk/JXr80zQU+VKCW+Lw4wWAbqHL/+mxjMbekIaCNH3lXm1YV+CX/by
 U2sj54nny54pOVBxPPFAnhJ2+nBFFKaKXBX2XBaCzChPQaaVjQbnel+GkKIRzVJcYhmhK7saZtO
 XSnLmJcS3bkoZBUz8PA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfXwXy8PfpVU/Fz
 CHwOMWWpElC1cbd5zzReJ0xcTjnKjPPFIr6lAYgm5smXJTnXWtOxdNvst25sOtVcV/muJv4YiqN
 vPqmykDHRqaJUYKuibV5rbvqHZ+Yo+E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090047

Hi Linus,

Here's a pull-request with a couple of pmdomain fixes intended for v7.3-rc7.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit df2908090cda368b01ff43709f51890076c56157:

  Linux 7.3-rc2 (2026-09-06 15:07:20 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v7.3-rc2

for you to fetch changes up to 4c66c423593e26273ea0d644906ed007630c6f6d:

  pmdomain: rockchip: don't ignore clock lookup errors on attach (2026-09-28 15:36:50 +0200)

----------------------------------------------------------------
pmdomain providers:
 - imx: Serialize power on/off across sibling domains for imx8m-blk-ctrl
 - rockchip: Fix a couple of errors during probe

----------------------------------------------------------------
Ming Qian (1):
      pmdomain: imx8m-blk-ctrl: Serialize power on/off across sibling domains

Shawn Lin (3):
      pmdomain: rockchip: propagate subdomain add errors
      pmdomain: rockchip: fix clock leak on domain probe failure
      pmdomain: rockchip: don't ignore clock lookup errors on attach

 drivers/pmdomain/imx/imx8m-blk-ctrl.c  | 15 +++++++++++++++
 drivers/pmdomain/rockchip/pm-domains.c | 20 +++++++++++++++++---
 2 files changed, 32 insertions(+), 3 deletions(-)

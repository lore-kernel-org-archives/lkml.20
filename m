Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DF54EA38C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611606; cv=pass; b=UAse+w7vAhLSEM6MJXXpYLcUa9TA3/bgZqLDwLsCtGmAbpy66npmzRgqrB9LY68CrTYDs6E8ewdqf2nZosueS6GdgwNRt7lpOU3xDpU5EoM572oiMn+w+L+hylZFA/P2HEayuFwLtSI6taoSBRCDdJ7YkCAZfhQerUNAmWz6MfE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611606; c=relaxed/simple;
	bh=AxwspMKsVZK1XQ0X1dJ8SvYhPShfagggpXNX3D7+lkw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p8sqrY5lvcDicHNZMtoEGAPDBGd7sYt99JS8S+b/RHcmFlk0h2MqaiV4Gu3WXyl2pW1hgs74z5/HclvBGgkFI6NB10jeHWDrsQD+6T2DDnYLHl6KO4MoZEMxd4wl/6O6lAPIfg4NHhmJHQgitWzcNrv28brRDmXQczh9WlaQM/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M5E5ZulZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YRlnwJPM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M5E5ZulZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YRlnwJPM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdsD6378842
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bsxl3A6ArhrDNBtoIVBz3Hxm6FeKIX0tXSSS585UBX0=; b=M5E5ZulZAP4oNlP6
	EtiXRsQkimO0coeymPP9xnQgROgpGWaYQowXn9Oadi0rj38qsAVXzTjuOFgau5pm
	t93DeZOdyYrvHi58xTkHBABjEamUNnpeHNTG62CPil7fTTStxpz0aDkLtbfecKAM
	3UDlSEwTMGkE3mLZTGc1BZkZfF0mp1WVOsHGgmTrn+ot9MemCFI66nWn0IbUtIJg
	tZSy4RWIadrmToiStbs6FgIYzIWihhWfRSyoa3dQcWqb+0jbF4m6bO4IVqODp/cZ
	dGMq3zCAjRCswtd5kC+07wD+V9nISDhwP24lU0jQGVt/ixvOQbDN2l/VVF9eLsst
	LVSpjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx390qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:06:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so3776961a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790611593; cv=none;
        d=google.com; s=arc-20260327;
        b=XkVXCrGilQ2Mf+CJA2ZbBQ5YSUhfFCLFeAUlUQza/jFbLZu58JBdJ3tzQlPcJP04Bm
         9yC18cdEEDz5yDxVmxHS/9WRQ368O9OfDkJcgIEpZIE2Z1pfw5ZR1TQAxSr/RJQMW7X0
         GjIhoD4Nz5NUVRWDHjRCceu1pESOX94b1hNvhcCvuM/BfTlBtqhm6VpmTmACrA84yhEX
         fUAX5AUCZuhA9y/92zFV7ygjMDx/wWQa9sSoMUwIiX+GaTe1PVYM3B/zPxUSQQgHyu2x
         f26ENI4/SwOEwvjzdxGIpTC+PSmmC4pK/XS6SIsTP7huZqSAYI9URTPmYxEA8kx3ZVmS
         qpUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bsxl3A6ArhrDNBtoIVBz3Hxm6FeKIX0tXSSS585UBX0=;
        fh=A4/RBjtB6EOqxsJcbTZAkmTjc5Zq4RLfPlGNRJ4Yqbo=;
        b=bdsluCZnql9ohOCxgCFgK/JxXZx9vDZUzi6B8cGB4TrpKFHC870CsKS2jaSA6/dBj8
         DQF94nPtmGMN11yT0L5zPJOJYalkjIHSMMIuvofxhAL5YeRgUJdHHk8BJ5ZMHzBW5uV7
         KfEMmiRm14ijEKk6e8zDyJdcdD0N4AbhJgSZnJdqBKz18YfCA4BxTsAz8R4vpODtPRZG
         NcHvgNEVUP4KpVc6q7NYW5qJUxzhpNX5We8/7gupFN0d1WpOWhMnPonSJKfSRyVaq2Wh
         sRHH08jqSBGn01uOwH3caEfsxy4cK76YXAhUJ+HieYsEbwRMt2PA+5jCcPNDZp8FvAq1
         H5rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790611593; x=1791216393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bsxl3A6ArhrDNBtoIVBz3Hxm6FeKIX0tXSSS585UBX0=;
        b=YRlnwJPM843OPEp7IQ/+gvYPbTFbRHkvhu67xcpzhdr1cNWWejIrmpqdHYJmFvk4Ib
         /Q4R0TUKCeWsxx/VHY8y7vLwWh76tywzmxNgW2iWIJ/dfuqHVBFA4GiuFfBu8dd/2Uyf
         VEmCy8I1sV4UmzxuuZQYpCDldO6uLUWfdH+UX1S9JHzc+tq8899biEt0JK1jiAZI5Ibx
         5NVSYwyp0wq1J5SBJpSa02M68shY71PDdzUBABqewepYr5Pacmb8WuTIVL8BAtxdD6TD
         MeGNUZix6pEc3RA7vbxXIvb2hgSe/PINEtdcQntsHTx7VBg+XlKA7jwoa5B79T4MZ/Ml
         GRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611593; x=1791216393;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bsxl3A6ArhrDNBtoIVBz3Hxm6FeKIX0tXSSS585UBX0=;
        b=gJKTu/M7UVDlPaNjaQNb1f5SW8CMIJtZ1tG0qcMagzeC0hIK6ivVlGPIJpTS6vt3a3
         usnzVMoO75LbF7HLNqQhHl0HMgk/zEwXUuZb9ad41ZDWtoHncFaj+624nHV1ZxUGaOzV
         AmVngH/PinJLqWRHdAnLJ3t6r9VlhvtCCu4xyWTZbTmQVP4Hh4Prh4JUf2yN0UcnNhyZ
         ii8XRV7ob3+nYJTXL5sEApAxvmHqAJI5G6i9+svhxEm5+8Icozreo8Ylumw+hOvrjxQS
         BRVXUE8NGIKY5MWza1WictvMgVl2tlQxiAkyG23WhAWjKqE/d40NqWDh2ioBcepK0e9I
         ymCA==
X-Forwarded-Encrypted: i=1; AKwUvBxO4Klv3hKbyr0X8tG5M5dtetWcuCGW4dkcf+fO+KB3C9qvGombUIlG0aFcwMADJCWATZ0dkf3oLZJ72Zs=@vger.kernel.org
X-Gm-Message-State: AFq9FYIaggsZfGLxiyRYSauRb8XpVrN7mS6iGfKzvc6Cpae1jp1YX1Wd
	wCpqz+7P8ew1JTeEzJtfgUJ2xyVza/ObhGkWfg9J+BNHTfg0qwZzt4jFMv7DhoeEwL+u9H+SeFl
	PBTiVQbjjcJ4w6HW3ZrOnxHeYL/hpkXYgQh0olOwV9KyadBW0qNskiQDa53JKsY0kNiQhF9wfFE
	UzgSEC0X8Y6UwNV1C0Y5rOhI5f2SeB+HESANY8dwnTYg==
X-Gm-Gg: AYBFou3qyGS5oIzgaFgSAC9dPmjx+qQ3vzuA63BK2j5Wy+A3NKaPj8hSiN/bLF7o+r1
	Xd4inFAjQMNcDPX3kX5XHC5zBHC5u4VwQAzPybpLJYwhoQLgtFdOFRq/0/Jf6J7fy6yuy+kGzKf
	Yz2S6IiS/OsEnMtqg4Tv6C7Fplq2hLPCKYYlHgdQ5HPhk=
X-Received: by 2002:a17:90b:3e44:b0:3a0:e247:3ad3 with SMTP id 98e67ed59e1d1-3a0e2474be8mr3602118a91.40.1790611592592;
        Mon, 28 Sep 2026 09:06:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3e44:b0:3a0:e247:3ad3 with SMTP id
 98e67ed59e1d1-3a0e2474be8mr3602106a91.40.1790611592087; Mon, 28 Sep 2026
 09:06:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917101750.2146473-1-vulab@iscas.ac.cn>
In-Reply-To: <20260917101750.2146473-1-vulab@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:06:20 +0200
X-Gm-Features: AclHuK82ucEdSmeT-bQHmbw_Uh16I1-7A4GMKqZ9onj_bi2194OPKgUaCmdLCEY
Message-ID: <CAPx+jO8Jef67qM2nvZKO77=H7P5EAAQQq-LfpFxCuUmhi+xiUg@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Fix OF node leak in mmc_add_card()
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: hansg@kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        s.hauer@pengutronix.de, ulfh@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfX8+fqRc+9RHS5
 fE9cn6hK9CB5Qeky6pyz07o76RvjB4iunCZyGKjDuNt2eEHj2+monSTIuEjg9abM4MhUHpx/bC1
 qSUucYjihzn8wxLinKyxCvaIFAGPRpjScOV8qNsd8lEwTrDC6uoURkyGKe9NjdycZRgizlMt2ge
 sG63iQ592eqMegZQmw+JnCYPTwwdfCiGTDSyGxO5D6JL/5oQ+iAtjX8XemtWzLuZ0YF5K45WL9i
 NCAH9yWknxC9F8V1cfBGusb/8VwhGKJj8uvIzOVrxGaPHq6Mh0l2Rt4ciTo1Dsl1tcFNGMx9QVB
 cUWgK23NqJPEgZ4rmWEQqBlt/6CB9/WCT8rmIB4lk3jY8m/L8yYTsPis2qIaonkVKufpn0N2r1S
 QC1k4yHFyxjqr8ACH6ftRgC8Tht8TTaFxMAPHr1/Mkv/3+C61TqHhxXUNZgzoX7X0xXAHWFaDlp
 9eMA8/jg0Iqi7MqvsXg==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba9089 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=PUCtf4xQaR7MHDhmUGEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: qF-cH7CYkohpFuqodMLJQM0O6n8-pAhP
X-Proofpoint-GUID: qF-cH7CYkohpFuqodMLJQM0O6n8-pAhP
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NCBTYWx0ZWRfXwugVxE1ZDhWc
 zwZZR+FUUKZWpmp1WMkHo+0EcrDjBKZ+tSsulhy4u7Ctwj8/VNbA9kb0ON0zz/GAZ/b2aOajlYv
 ICxVNBiCGXKHOZpiFcQfxrjvp5ZQqYo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280064

On Thu, Sep 17, 2026 at 12:18=E2=80=AFPM Wentao Liang <vulab@iscas.ac.cn> w=
rote:
>
> mmc_add_card() stores the OF node returned by
> mmc_of_find_child_device() in card->dev.of_node before calling
> device_add().  That node carries a reference which is normally
> released in mmc_remove_card(), but only when the card has been
> marked present.  If device_add() fails, mmc_card_set_present() is
> never reached and the cleanup of the failed attach cannot release
> the node, so the reference is leaked.
>
> Release the reference on the device_add() failure path.
>
> Fixes: 25185f3f31c9 ("mmc: Add SDIO function devicetree subnode parsing")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

We have already a commit that takes care of this ("08b54e16d547 mmc:
core: Fix OF node reference leak on card add failure")

Kind regards
Uffe

> ---
>  drivers/mmc/core/bus.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
> index be5cf338bdeb..4d862d9bab23 100644
> --- a/drivers/mmc/core/bus.c
> +++ b/drivers/mmc/core/bus.c
> @@ -379,8 +379,11 @@ int mmc_add_card(struct mmc_card *card)
>         device_enable_async_suspend(&card->dev);
>
>         ret =3D device_add(&card->dev);
> -       if (ret)
> +       if (ret) {
> +               of_node_put(card->dev.of_node);
> +               card->dev.of_node =3D NULL;
>                 return ret;
> +       }
>
>         mmc_card_set_present(card);
>
> --
> 2.34.1
>

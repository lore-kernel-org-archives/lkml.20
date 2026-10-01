Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC2D46EF6B
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 07:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790840967; cv=none; b=tmI75w0FCiKWksllN2NN9ghQhC3xrND9XK3XEWc0xjbzk2zIFDv9gLBdHHLUoMVRk3Z0SB0zAOJRywvqAAC5e+61zhtO/Z7TJU+o+fk+NEwgnxldcim2lep8DnKbv1S/BtWNQw4I4a7ODO29j+AsuFP7feGJFANPJFh3ut8WI8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790840967; c=relaxed/simple;
	bh=7nC6VU1e+EkD71INuWX4LMYsCXiWV7QzlelrKPrgVfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R9mqxJ/JaUwImViIPe2+C6JioKFS4GG0Jx/V9U9FvonwrJahubqDAU8vQ1u7VR2xBTAGQV8srvjEJEbbMp3Vap7tBAb2XAVaGuOs9IFCnQ6fpF2kBa3/m0m/RnGKwZGGUA9QiDp8C0iLjlf5HpcneyIu2OxXs8AecG5jZKhuW8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K5C3bsDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ys9ak0ot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K5C3bsDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ys9ak0ot"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xN9n1062181
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 07:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fcJEazZnT8uURAanK1Vp1Zd7
	zXkiTHBM91KnjXvtuLI=; b=K5C3bsDlHExr54kPSs+k42C1Le03azP4hHEclWjd
	oPVQ8l4jJl0G4i05tME0aYbORdAoY/Zdz3X7IFOJ3gkymDNrQcgkzGTVKhUPKGkQ
	RIzSjZrPQGcu7xwV42gRDcB2eltkNnnD6zCd6s8etYHjo+EV07hwVzaZqVRp5xY5
	qKOmhaOT8zapXKDkYn4Or+VadKDFuqtebUsLwVqeKwgyplsi3AedJMToxoROlnHc
	DW9t9YdZTZlE22m6jiuNzjtZY+SeP6ctXmJppbhA/sZi3HnKFwkRbb06pWEHLGE1
	ySBXtUaKRge/6R13V2oQgIIALQp27IZDO9AMPfJKN9V6cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17mvtjtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:49:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so1106469385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790840963; x=1791445763; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcJEazZnT8uURAanK1Vp1Zd7zXkiTHBM91KnjXvtuLI=;
        b=Ys9ak0otBk9M+WgdSXAjwwOAyzfUd7Dmq8L7JOi5Svn6CbjQ7V+byMaZRo/J5abIph
         IxEH13eFsZuuNMfYIGAmlSKxe4NnyD0DdrNdSh1zlTAHkC68bFvehQYnHRHuoIswX/ab
         M17ctVClfxnJdoNEpYZlcJ1O98A4RtemKz+9wUPichs5ks7fA420wQbnFuAtF/OWjdmg
         oJYZ71u++T4wl2yj7kRBxB5alkhJLvwph8mhkRroOGxVoC3pEUifu7uHlCfLwyfXeJuC
         P+isZrS812qQ9CLIckQAAm3gvlCkc3m6Ij1cuTUD5jofKetm9EhduFPSUg1jOxK78q2O
         vrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840963; x=1791445763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcJEazZnT8uURAanK1Vp1Zd7zXkiTHBM91KnjXvtuLI=;
        b=hCu88KCy1yVfGELEY94Q+JB23+LCtz24k5U0ZqCQyla/BzAx9vyZN7EuB+OdLgniTY
         CaWss6+jHF7NceZn1YsEUQt0fQXb/GnZeKlBnBrgEFs+58EvcexXzSQt6DKoDxcSgZCG
         L3gISPpzT6NF417+ty9YPRgP8+yIDKvrc/t8KdMaEiDnsTk9gN4rUCeXKbMKqqZ/r6Qv
         +lULNxoBgLA7VwAxLVxvcMTFakeynWvA1LZOIgykibvKFdafJ5i8FiqhKbPwu/fqdoV1
         Fy7LgCWRG81p5FNs5Voe2gACrx9TvEtk0ameEewvdhrhzX+KviC/iNbnWvMUm/B6T79z
         qgdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGq8xeyQQ2mk1JJvE/pFsdC77lDqS2o3W5Sm9FFDFN9mf8zT9ihYwdKsPI15ITJoC3WRwCmHjOMQ2zZb8=@vger.kernel.org
X-Gm-Message-State: AFuF++k3jP9I2qXCZQwSZCX7iSS9iJaobV51KDz+j+7vxaltyJRJfAyq
	jLHznjYb2DGEQqrwu6DPHb/uH+2yvQtlmq5ObDxgTf2N/yhHyb8G9riTwdHlN7zLywRzuWscDZC
	C73jxd73rLdm46aE5vrxT0Kte7U6WFjg6RKdQqmKpUOptG19dCkd5P/xNIDiLSgUcXgI=
X-Gm-Gg: AYBFou0jwBFOxw9GMYkE4ZV0NkQfB3oe5Je4ZDieiIbjGhkCQD0A2R645AGtntMMTNu
	ZIk+18ifNciZRNiASwdVh8OJ+aphxg8wkniZJ5mshDUkNW6vYVG1TGXlsKbjNzT1HWdYTZMVFYa
	TCgLpoEG3pLc8Ao2f0uVh6dYWXXTg5PZ6humXW8mdhQ7FPnNqXGK/0lbpfr+AZJbagT/QQokdOQ
	AI/qyEJTXQnyjHSGaMMnyOJWD/Zve1w0s7CVAS/5cMBkHnNRoc7pmuhNqt6/DBaNZh5p3PCuxM3
	IoSv0WgqOsJqmMziOfiPoVsqm0KqHRhclXaozZT0cg4Q9CzZd2dLwvQnj2N1KkomeZjKrrhAHq7
	ABykxI1NwwjMLQQ==
X-Received: by 2002:a05:620a:6602:b0:939:ede4:a499 with SMTP id af79cd13be357-93ca94f6634mr719057885a.5.1790840962802;
        Thu, 01 Oct 2026 00:49:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:ede4:a499 with SMTP id af79cd13be357-93ca94f6634mr719054085a.5.1790840962161;
        Thu, 01 Oct 2026 00:49:22 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff95esm4416843f8f.12.2026.10.01.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:49:20 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:49:20 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Serge Semin <fancer.lancer@gmail.com>, Simon Horman <horms@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, Rayagond Kokatanur <rayagond@vayavyalabs.com>
Subject: Re: [PATCH net-next v4 0/4] net: stmmac: preserve and restore the
 installed EST schedule
Message-ID: <ar4QgHsclh1vWVHk@lore-desk>
References: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5O14Dw0334SoMGBW"
Content-Disposition: inline
In-Reply-To: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
X-Proofpoint-ORIG-GUID: vc5vxvSaDSx5Q8wOJW4u-ihW1hWB732w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfXxfk8xQxKdmH6
 SpsTSsNsLf8VQDgvyYZGEqR+Y0+yzPUeDindgNEVRWXYgwqsOp3rLSJgIfDAriFrcV6YgI2uttt
 xEnpoJNELVHdB6V7z50Bvj+0NwT0uQ32en0M4uqCEjFPi2JcNb5PcZMAC2F2YYxSl97IX11VOSU
 z0dHowRC+jL1uj25/unpw9CoePG/JDgI8CGyWdxrFNmtrDapOilC26GDylk9ZzdOs7lL5RgylO7
 ABsOBz042lwzhit88nFc4xDERDADagE093F16vABVfrM2moCJ1lLTZZOgd065Sm2Wn1NfnYbZ0Q
 cyveFbE8xHv/nPWvOX78bVlAmZBa2tmZSxKxmqvuo3Wf6DCH5Wv+JaCluhKPW1GuYINs1QFYwzU
 Gkn1Dai+Ujp3Oz4u5MbwfRu2M8eBx5HziWSpevR/jsX+1/X3upXZyuL41vg73xpvKQEm59++1pk
 Nw/wBKlJ2s0oB02c5Tg==
X-Proofpoint-GUID: vc5vxvSaDSx5Q8wOJW4u-ihW1hWB732w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfXzvyc9deHZ25i
 8qFxWQI2Ix6PI2TAGNuep6FGnSKnUL45c2vo/wUU9Bjt4eIka4aRwmJFdqEBb+LawXt6VPTTAjs
 NoO9cMAwhAzJppDDvWHbbkjsCnCP1Ic=
X-Authority-Analysis: v=2.4 cv=KuvYSmWN c=1 sm=1 tr=0 ts=6abe1084 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=vIXCTXOdsuUdJ7saXm0A:9
 a=CjuIK1q_8ugA:10 a=6N3VuSNxPG3FNRDMqtEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010031

--5O14Dw0334SoMGBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Continue Lorenzo Bianconi's EST replay series with v4 of the unmerged wor=
k:
> https://lore.kernel.org/r/20260902-stmmac-est-reapply-after-open-v3-0-e72=
a6df5a7ef@oss.qualcomm.com

Hi James,

My plan is to continue working on this series (the code is available in [0]=
),
I am just waiting other patches to be merged upstream before reposting in o=
rder
to avoid any conflict. I guess it is correct to publicly ask before posting
other people patches.
Moreover, this is thecnically a fix so this seires should targed net tree.

Regards,
Lorenzo

[0] https://github.com/LorenzoBianconi/net-next/tree/b4/stmmac-est-reapply-=
after-open

>=20
> The PTP initialization fix from that series is already in the base.
> Carry the remaining embedded-state and explicit-enable preparations,
> and restore the installed schedule after open and resume reset.
>=20
> Build TAPRIO replacements separately so rejected updates cannot
> corrupt the installed schedule. Rebase the previous schedule against
> the current PHC when rolling back a failed hardware update, and keep
> DMA stopped until replay succeeds. These changes do not depend on
> the later datapath recovery series.
>=20
> Changes in v4:
> - Omit the merged PTP initialization patch and adapt the remaining
>   changes to probe-time PTP locking and current TAPRIO error handling.
> - Separate schedule validation/rollback from open and resume replay.
> - Reuse the base-time helper for replacement, PHC adjustment and
>   rollback; propagate errors while preserving the installed cache.
> - Start DMA only after the installed schedule has been restored.
> - Link to v3: https://lore.kernel.org/r/20260902-stmmac-est-reapply-after=
-open-v3-0-e72a6df5a7ef@oss.qualcomm.com
>=20
> Changes in v3:
> - Guard priv->est.enable update using est_lock mutex.
> - Embed stmmac_est in stmmac_priv struct.
> - Rework locking in tc_taprio_configure().
> - Fix possible divided by zero crash in tc_taprio_configure().
> - Add missing reconfiguration during stmmac_resume().
> - Honor ptp error code in __stmmac_open() and stmmac_resume().
> - Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-after=
-open-v2-1-5e5ccb185e92@oss.qualcomm.com
>=20
> Changes in v2:
> - Rename stmmac_est_reconfigure() in stmmac_setup_est().
> - Rely on stmmac_setup_est() in tc_taprio_configure().
> - Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after=
-open-v1-1-dfa80735e0a1@oss.qualcomm.com
>=20
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>=20
> ---
> James Hilliard (1):
>       net: stmmac: preserve the installed EST schedule on errors
>=20
> Lorenzo Bianconi (3):
>       net: stmmac: embed struct stmmac_est in stmmac_priv struct
>       net: stmmac: pass the desired EST enable state to est_configure()
>       net: stmmac: restore EST before starting DMA on open and resume
>=20
>  drivers/net/ethernet/stmicro/stmmac/hwif.h        |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  47 ++++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  38 ++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  59 ++++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 142 +++++++++++-----=
------
>  7 files changed, 176 insertions(+), 127 deletions(-)
> ---
> base-commit: 1631d79ae57dce2c5f88ad278307028638a8b4d9
> change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
>=20
> Best regards,
> -- =20
> James Hilliard <james.hilliard1@gmail.com>
>=20

--5O14Dw0334SoMGBW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar4QgAAKCRA6cBh0uS2t
rHudAQDRHrkhhNLiQEOGozztlHRmh86K2cUt6Z+4yLFiMw0PWwEA8XYf7p64JJYb
H5S88bWzi8YBwiXw36fKmolphF5lWAk=
=R8Ou
-----END PGP SIGNATURE-----

--5O14Dw0334SoMGBW--

Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB74C41D208
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318603; cv=pass; b=PnxUdu9xeTB/CpIZgf1DyGC2oKD9M1vxSEcQHQPnpz2bjLpQbHreCEFH9V+NMwLpMbRoKwAbj4DVCPi+WmhbgIXFg5KdkVKkMmW5DDwQKLH/z84XXbkY+2VG+H0Cm/sC2GtaEOsPqVjkuWC1A7okBBo7uK6upPs4g0GNnlpD0Ew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318603; c=relaxed/simple;
	bh=qT0MFd176BYrXuQDaeaSPtSk6fF2oBF9InGKPMdZ6cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbbDCDIW2P39NVxbSplqC1vJ1ogy2dQDZRL/Tz6MwTNUzccLdh59w4ZaZsqnj8Q9ZGgbgI+HILgHBV+v6gvC7VNs+xtLGsejzJIPkt3NIK6vNrGrqSfcgwfPKNoNluzDE4sYHByhf8SKMXs9Jbvpenb5oYmsTO+G1A0CDPIwiwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f21oXaGA; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f21oXaGA"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a6502b74abso1472411fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:43:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790318599; cv=none;
        d=google.com; s=arc-20260327;
        b=n88XvICEAJkwzc89rhgvxqvMMT5YF9SLV1Tz1imc7s71IRQtEAucuQHn6eAHTkBL9M
         RekpsO9KzTHHy15l6Z5lDYxsFPGZlM3dWk6tittj2VkjI/tocOPcI0djo2YL2VerDQGz
         rpiOQtLd0aNznNmVqHlsjYDInMOnn3mkn5qilxBpfMxEwlza1h2FslY48WJinDLnLzBt
         WS1BwYYImXgE9hrYuNW7JQRgZFhInO2EApMeEzSThOiJTmnLtry53TdehhrEY6m8NA44
         2RZaH6NwTd/iyPncJniLI1Ox0g5v742FSw+bAlzmK5lBKfQ8OHwrZk2bfmG3G9sUKTOi
         /mTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=73oLTu7jCnqlLzTg5ExaWSXRUj31YyCrfn3RnTCN//A=;
        fh=OgehRZ5QPVV5q3GGMa48/e4SnnnGQ7hzw4ApzaM2yJM=;
        b=CadHxj4SkMI7CeW86UA9xQta2LzNAEpA3/+LVDML7zPfaxbrvLEMcADghhBThtN2q2
         6BusIgwZTOeFMyyXWniL7gRyw79Sr6lKDFBVRerNqKMJhxrebe7sJGu5BF0BkoqcgTjR
         T25lL3MryIY9iNxCz2Ob0/GsjvWDuB4NiceJN3H2pduZX/R1DimHmNwy+nB7Vg2edLZ4
         6hr4fOaQ3fdL2Ef+3a9jYRLMdlaDkhqQ7xyHFe/CO7PoK9/xR0jT1oM9aEbGVB5zzY6Y
         Iszpvw7Qz2r/lircDHyW1xutA1+mR917aTX5aDNTzTJuV7uwHFP0fn2eWrZn41SbpF7X
         IHDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790318599; x=1790923399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73oLTu7jCnqlLzTg5ExaWSXRUj31YyCrfn3RnTCN//A=;
        b=f21oXaGAmwkdA1ElT5Ql0b82KFg4o2oMHEBraDYAEpvFDOefls3aJHTVsKmYiI08ph
         cYlvsNVcWVkz6Bvp340Zt3bfeK7kDYEFI9RisqfuKA+E7+GCyZY/r9qpqZ6PXxp/74If
         76C2E0qdkwIXbw72Syp4D7Rkcofu6/uYBJKPMDhRu4BqEtCw/smfaIklQB+ox0j7g43T
         tB6kYaqaS5TmxJQLCI1UN6LPilS1pdo0ceP8WT+zd+E3ki5Y0r9pteCQCa/fE+AoDjkH
         OiBitWpjaANZYVBtTBvo3VTuXQwxXoTWtm54wOkQ0gI3SFj1YSC53EeOwxiW4dktnAht
         8QXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790318599; x=1790923399;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73oLTu7jCnqlLzTg5ExaWSXRUj31YyCrfn3RnTCN//A=;
        b=LsmQITuXafQNLHbhW2056QtL6OWcCg6lh3YfB1I/g9XCrQL6q8CjPKXb+XaFGjkfbR
         4yV7xKso9kcW7RGUcRTDRlhC32vs1J/4w/ZdiRZqEGxjb3pbj/asdmwOaQUt4T1yKv8c
         ekXJNc6Mu7VAATmVIMjWPpx8dBNzmObTmIJgcp4OQ7hf1AQL5sM3ihCByFiEdNDc2Ium
         oZ/ovwiE4bv2CDayGwCOZLgLE8pltm4vTKugqmiG+5gYkoUPtoz3jWGNzJhvnIzWA3hm
         h8S9a12jM4zVxpR+ZCPCUKb4sF9VgsbWHekrwT9sx3OovNRRswZ+B9R6IbXutI1oHdba
         gxSQ==
X-Forwarded-Encrypted: i=1; AKwUvByyV+DwKE6b6BMoeCKUgT36xA3FFIMlTkKqpmTp8bq97K/4CifDQuRqH8Xih+8rEP2+4xdlwDJPkodq4zY=@vger.kernel.org
X-Gm-Message-State: AFuF++n91cD5iMfpL9uxuh7MbeHYc1jkA5SUke1LztcNuw+j0pBA9MRA
	CblF8KP2WkMeVLqhuK+7MA/BNmYMN2vF4G1UEtB5WTuMET+HQ1sSozkjYlpnKG70Ph981HoaPrI
	AfUAZdzyIfny6HF1k4uFDWypHAO1Kyjpscak0
X-Gm-Gg: AYBFou0KfvPzZxKgICB98efT21rjj0nVnXlJzGaQGCsHVmuJbr7potTQghtvODJLVUJ
	I/Rm7h2xFmaVLJ4S/jW8SAFjltyqOe3jaH96C0RbkIm/ga1oW8HKDprl3hC8myB5dULHl+nnXgQ
	VDATgF6tvM3Q/zrBD6q3nmDhX1oOegRiKiYqkCMn2kdH5wkVtjImn5967uNlKyecMPCG7+esdX9
	XojPqaP/R0vRGm7sYIiit5qvDCz3fQsjF7Q+IlehBxseqPwFUY/aT2sai4K27bbdRz6tcnKCLVF
	U9gghetQ2aKbG/4Lky92o1X4dmp/wA/Z1EpLtp3yDK/A25pmDW/fdgu8//aJRC7L8RsWNYLDT5r
	IRORMK26Ws8+7KfHZj0HoxRb0tr3u/sXuwHcytkBlftJg5KZn7o49ew==
X-Received: by 2002:a2e:b893:0:b0:3a5:f044:fcba with SMTP id
 38308e7fff4ca-3a63c0f6f99mr11331361fa.20.1790318599360; Thu, 24 Sep 2026
 23:43:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-sm8750-ddr-bw-scaling-v1-1-f39f918c95a7@gmail.com>
 <eddd77cc-fabc-4a2e-aff9-602895495ad1@oss.qualcomm.com> <CALHNRZ-J6DH1ebhUcRqbVRmStO_MGBJr63TEQg5vxNO_UpF-vQ@mail.gmail.com>
 <36dce215-8266-434b-968c-b68d7ac1ff2f@oss.qualcomm.com> <CALHNRZ8UGRzr48RaTufn_CXq0si1_uwYQSnbX+8YAtf3=d04YA@mail.gmail.com>
In-Reply-To: <CALHNRZ8UGRzr48RaTufn_CXq0si1_uwYQSnbX+8YAtf3=d04YA@mail.gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Fri, 25 Sep 2026 01:43:07 -0500
X-Gm-Features: AclHuK8hFndtmQNtvynjaSVQTF7UEYz0rQLDWaAywywoMi1VKc4BOSKxgrXEbsM
Message-ID: <CALHNRZ-JtxOft6GVvb=fgZf7YVLTx2n5wf9t=BJ4KdoeCefX2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: add cpu OPP table with DDR and
 LLCC bandwidths
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 3:32=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:
>
> On Thu, Jun 25, 2026 at 7:23=E2=80=AFAM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
> >
> >
> >
> > On 18-Jun-26 06:37, Aaron Kling wrote:
> > > On Wed, Jun 17, 2026 at 5:41=E2=80=AFAM Konrad Dybcio
> > > <konrad.dybcio@oss.qualcomm.com> wrote:
> > >>
> > >> On 6/6/26 12:36 AM, Aaron Kling via B4 Relay wrote:
> > >>> From: Aaron Kling <webgeek1234@gmail.com>
> > >>>
> > >>> Add the OPP tables for each CPU cluster (cpu0-1-2-3-4-5 & cpu6-7) t=
o
> > >>> permit scaling the Last Level Cache Controller (LLCC) and DDR frequ=
ency
> > >>> by aggregating bandwidth requests of all CPU core with reference to=
 the
> > >>> current OPP they are configured in by the hardware.
> > >>>
> > >>> The effect is proper caches & DDR frequency scaling when CPU cores
> > >>> change frequency.
> > >>>
> > >>> The OPP tables were built using the downstream memlat ddr & llcc ta=
bles
> > >>> for each cluster types with the actual cpufreq LUT tables from runn=
ing a
> > >>> CQ8725S device.
> > >>>
> > >>> Also add the interconnect entry for each cpu, with 2 different path=
s:
> > >>> - CPU to Last Level Cache Controller (LLCC)
> > >>> - Last Level Cache Controller (LLCC) to DDR
> > >>>
> > >>> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > >>> ---
> > >>> arm64: dts: qcom: sm8750: add cpu OPP table with DDR and LLCC bandw=
idths
> > >>> ---
> > >>
> > >> [...]
> > >>
> > >>> +     cpu6_opp_table: opp-table-cpu6 {
> > >>> +             compatible =3D "operating-points-v2";
> > >>> +             opp-shared;
> > >>> +
> > >>> +             opp-1017600000 {
> > >>> +                     opp-hz =3D /bits/ 64 <1017600000>;
> > >>> +                     opp-peak-kBps =3D <(1353000 * 16) (350000 * 4=
)>;
> > >>
> > >> I think this should be * 4 in both cases since the interconnect driv=
er
> > >> ignores the channel count for a node in peak voting. We may have a b=
ug
> > >> in all other DTs here.
> > >
> > > If this is confirmed, I can update this patch. I based the
> > > calculations on my sm8550 copy of this change, which in turn was base=
d
> > > on the sm8650 change. If this is wrong, that means one piece is
> > > scaling 4x too quickly? Making it a power consumption issue, not a
> > > performance issue.
> > >
> > >> BTW, are there no lower OPPs for the fast cores?
> > >
> > > Not on cq8725s at least. These lists came from an AYN Odin 3 with tha=
t
> > > soc. I don't have any sm8750 proper devices to see if that's any
> > > different.
> >
> > Mobile SM8750:
> >
> > root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu6/cpufreq/scaling_avail=
able_frequencies
> > 1017600 1209600 1401600 1689600 1958400 2246400 2438400 2649600 2841600=
 3072000 3283200 3513600 3840000 4089600
> >
> > root@qcom-armv8a:~# cat /sys/bus/cpu/devices/cpu0/cpufreq/scaling_avail=
able_frequencies
> > 384000 556800 748800 960000 1152000 1363200 1555200 1785600 1996800 222=
7200 2400000 2745600 2918400 3072000 3321600 3532800
> >
> > root@qcom-armv8a:~# grep ^ /sys/bus/soc/devices/soc0/*
> > /sys/bus/soc/devices/soc0/family:Snapdragon
> > /sys/bus/soc/devices/soc0/machine:SM8750
> > /sys/bus/soc/devices/soc0/revision:2.0
> > /sys/bus/soc/devices/soc0/serial_number:<snip>
> > /sys/bus/soc/devices/soc0/soc_id:618
>
> This list matches cq8725s and what I put in the commit. Is there
> anything I need to change for this patch to move forward?

This patch has been sitting for quite a while with no negative
feedback. Could it please get picked up?

Aaron

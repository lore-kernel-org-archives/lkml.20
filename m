Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008222;
	b=jWKPfFIZjHyViWz8EGo83H/NTUs+/1gw9mdzSyenKqyPT1eT25Ynku0SbsC4COXjWLpO
	 dcsm4LBOWC9sVf5coe2Ovzl/fMayVi2L2sKlxlxWH+qeZ+8HoIRIyTC0i7M9uR6MT+mpk
	 kiQcndDpP3fHT0m9CLIZFIv3/H7XC7hZwt5aBAEJOsC/yt9cT7SFi13x/UVetDUnsqFXb
	 DRz8oX7ygaKIxTLZGHo6dAk3dhy8yNUzpBWocwpSLJArkBnscQaG9y0f1F9VqCLe5h9ou
	 namhmqf89BVvg6gIFzAV0HKzsoNZzui5f6fxfluEjkJ4uAdPxsuQJ7lOvRIwnHzZKeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70oSnHfUUaU=;
	b=0RqMiuLfusSiMBHhK7ChAElYC9SUqelKgA2BNd6VO7RiVJmHHE1rEsXw1uimHolPduAL
	 QP70lOReSwsU1VRCURYIumpnTsxXJdBBuwFrpow7h2l9jXz+xV1SGLDU2bGzYeeprvQgC
	 eF/akKZFu4jpOq5xGb9rOknODo3Wgv9DhN0Cmn6fVcy47pwyHjRDENe6u9wgsCGnJBMc7
	 wPIsr9BlZ5lDbANSCqSCSEd8VqwkVJFxT35UzoFPmpsh3D9/lNmwLuIhcA1fHrP6sdGkQ
	 DWvUgSeS7RcJLx/gDWpyB0pgbufYYKoTRToROTjOUwb5ZqkDNY9XEPY0BMvHkJMQQuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRVXsrOk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiX0fFzg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D53606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D53606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XRVXsrOk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JiX0fFzg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4avtZ2727085
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:50:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70o
	SnHfUUaU=; b=XRVXsrOkESbp/cCSaWJSpjFpCVV2NlaUh7gPe17KKmW3HKIpf0k
	B68B2bms9+r2ilQzj1RjSNqPy87FrPtWESIpo43Xuyk7kZIxtrlgcllaxUQwEICh
	yre5PFns5T/ny2mwDdCSbyFTr7b0hyX9/WtUdNsU4xpjDDQLclxAf9SNvgv3X5sS
	7VaGsajlciZGW96Kgb+kMje1hkiqp6VclViG4zGGy9vf4t5rLFVOPsvOICioGx6/
	8MUqCBcKLF/Hqe/pOg20CXjJhST6FuwVtjZWH/2Lv/LFACiyMM77idnqB2RBFXNM
	Fnd1d9AoUqvydsk7QzBYav8NCmkEvYNdxhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgkp6nwk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:50:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ecdc701a2so358017385a.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793008220; x=1793613020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70oSnHfUUaU=;
        b=JiX0fFzgcgd7yk06M+3KTwENidi6pxln+1J8unjOw9BYLvBD+Ab6iuRQO0n87fV5Lu
         P3HY0mkE2oxievv1ZRqfK+3wJDtY8Gt2a6qMeEyDrGg9Ivjn7gWEqKfhRXDQoflRs0wN
         2P6c5+uhyjYdbp5soqad+SRRZpGvi6j1QkZNWLUcLBrik7J9xrY07u1ZW1LmD8j+oXbh
         AhI/TLEAKdJY/FbEL13X8LvS66bUzJ3LSs3OFLIzhHdmTSBBeOt32FX+7IiIsroj5xWv
         xhoRXPGZg2inW67tu3G5/1ouhUW1syGzSAzJcsaZ4Fmp99ffPc6gT6hxZeY2Xt0xJQ4a
         JIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008220; x=1793613020;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zKX1jeaJXKjVB7lhiiifJDbywGu1ddtc70oSnHfUUaU=;
        b=vyV6sYO2NCTIBVaSMIs/lMsQNdRw+WNUCUHT8/OO5SRSqQ8rQIenbpa5APmndzhJeQ
         cAp3T1pAV1DiiyTJJnNnnnhFg4L9a585kl+rxSmEwfi3ImQ5CTeyNymOfR0cvzwqia55
         +OfoGKrXzpRJHM6EY0JIf0OHOvMbZFaNLsYNfwTVrU7ZL0oIiaGakDf3itE0Tc/wFEo1
         LImN67Zndu0FeIwTMw1lGP8D8976TeVIkt6KNph6L7O8gVPZMSlrHcJJNycjW9LGMwEa
         Sl9BDyVX8ZbxT7/kXrP4TmkF6Hu57R9e51/5phhWWUFMYErSOefSVUlss7GBZmufNHWL
         e7uw==
X-Forwarded-Encrypted: i=1; AKwUvBwciMdaLLpDmomiecgK1Xaoy58Wg0sYdbp/OUiXcrEeF/Mv1Ink287t7JgGMEB7ImGv88nk7FHcIZGQz7U=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCfkUk69KOEUSjMJ3aRsVoCmrgsY/tV4Bd+SmQmWxPwRdx4fr7
	02zKolhZw9HUuDh4zEmNs8PJza3unfoQf5+ZHtoMIJjhvLDH41wEelH3fgJicilZbFqeidMp8Fa
	FcSHfzEDTW4b5Q3OVm2SlZyseDJFiBDXI7Iksabi3Y/hKJ1f7E27+aok+kQYQX9Ja12A=
X-Gm-Gg: AYBFou1F7cDHeK41iBqjnBoYQRdOuZH4O9eYHQL+TXJ140DWyvR4jW19M9VhkVDNE4R
	oyOd246lNJIHcIH0hI3sRy5IXufuUO8qcYs3I1UHiVNXd+0s8caqOFPIm9rUmOYMPR9aCP7EluX
	Eu+46n5fHYTrrB+VRGmrsHEM/N23GkZpghUMoTIFrDTO3zLBMwWqt/ceAoBMGTLCSU0/N/OC2nX
	DkMNu5vLp/vUmNWtoQCmLqMfc+J3ww1pMzTs/zfOyANturV/5IcZki8Moy30ZrSIVMJR0GrhONR
	gO1sGr8/1ZWvMOfNP22flVrX5SgxVT2TY3ESojKpGflOIGalZLxoTyvoaW7BlpKSWosj+aMhiQ0
	uDRPDdyaFg7pEwbRlVXvVg6U1Ogk=
X-Received: by 2002:a05:620a:4509:b0:93e:bbda:dd06 with SMTP id af79cd13be357-940ef682ec2mr945163185a.0.1793008220219;
        Mon, 26 Oct 2026 02:50:20 -0700 (PDT)
X-Received: by 2002:a05:620a:4509:b0:93e:bbda:dd06 with SMTP id af79cd13be357-940ef682ec2mr945159985a.0.1793008219740;
        Mon, 26 Oct 2026 02:50:19 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:7d20:e20f:a77f:4ef7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3dcbsm15405472f8f.14.2026.10.26.02.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:19 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: daniel.lezcano@oss.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org
Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-pm@vger.kernel.org (open list:THERMAL),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dt-bindings: thermal: Drop thermal zone node name length limit
Date: Mon, 26 Oct 2026 10:49:56 +0100
Message-ID: <20261026094956.2323036-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nfG8houwRHproSR11ns0ImIrV5NDxWEK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfXxvn+9XEZXkd4
 Sm/9J4gPfSJr9ONNYNC282pA8a7VRfoTn//0SDCb9+ccCMhSN/bqv9DLZOJvX8toQCQvQUfZdeS
 qp4EcH/BGmR2SOWIpFoQXh41/Z72w0s=
X-Proofpoint-GUID: nfG8houwRHproSR11ns0ImIrV5NDxWEK
X-Authority-Analysis: v=2.4 cv=bq/Zl0ai c=1 sm=1 tr=0 ts=6adf225c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=F35qRUJZQmyXIphswqcA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzOSBTYWx0ZWRfX1U2wc+7BwI80
 KMaJpg/9H3zcAKG2BhrZVaYoudr7D/RwALPyi+hJ6uJF/0xoKRVKwk6ZfdKdfeF2Zg6GRjd+2dB
 IP3jEFf+DuIqb1PaB+ZTj1cypaWqfZgNVENGSdPYImsKRhrpRYfoTeDvpXbCQ9bjEs2uIFjoUJS
 m9UEweTi1A1w4an8cGc2GRGZewCTLQUfOhLkQ083FPSPudvXZJy03l5aVYCrwBs0LFlS7661GLA
 8EXqchVwdAEJcffViRTScIi23GwdgknjSJfb6JaJbsjZNNgu1tN4r4Alh+btnifZLP2yqt8h0tc
 q/UrCBCSkmTRhzGREZTIQEbrminweRpte/U3nu9P90ShJ3Ak2nMy5oJcACeMzK9zl57DLyoCRd7
 AWQvAA1wkLJNUypRuegWrWyOmVjfU4QqQvZcilgiBaNC3lb7cjCofBstQ68JBbjsUjo6CsoZmpC
 88Tyl9pmoVBd55j5eDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260039

Device Tree bindings describe hardware and must remain OS-agnostic.
The thermal zone node name length limit is derived from Linux's
THERMAL_NAME_LENGTH macro, which is an implementation detail rather
than a hardware requirement.

Remove the length restriction and its accompanying comment while
preserving the thermal zone naming convention. Any OS-specific limits
should be handled by the implementation rather than encoded in the
Device Tree ABI.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/thermal-zones.yaml | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
index 999ad40a20d5..6091e886829d 100644
--- a/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
+++ b/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
@@ -49,10 +49,7 @@ properties:
       to take when the temperature crosses those thresholds.
 
 patternProperties:
-  # Node name is limited in size due to Linux kernel requirements - 19
-  # characters in total (see THERMAL_NAME_LENGTH, including terminating NUL
-  # byte):
-  "^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$":
+  "^[a-zA-Z][a-zA-Z0-9\\-]*-thermal$":
     type: object
     description:
       Each thermal zone node contains information about how frequently it
-- 
2.43.0


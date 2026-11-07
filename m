Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794013692;
	b=GxH67fIJHgdGq8aYu9nrwjoyRzgyTgCfgPD1hLIPPgJcCeaQKWSBN5mucGtxDKdIT3M7
	 TU6YLUuo7fs7qIS1rSco4rWDND1jkh06vbaimj3oQxTyxY1AO4XONccbZ5z/d1rGODzKo
	 HBIZFOkVGQkcJLk72l4udwYVGeiOGMrZLq3Ife9JqagYhVOgKqM/aYg6Ijg47PKuRLNrE
	 LwugA7sxltIu8en3oHSN0oZspmDluGAeuWWNusKxI52LlplDAyUvvQSyZd3AQS+ilSXVO
	 l0WdaW3Fwujk9/3y9xpwR6EHZqv0GsUBrFQMwlajIrbnzY0tPzllEdDtS0gdznvJoAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794013692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2LT9f4/r07lEFqji6lCYM9PWfKdD623UUCASE9CcMk0=;
	b=kpn5Z+6UvK+9SBVzY7ECe5U1OJde7ul1WPkKgkB68YrT/qMku7UdtbOiiOVgvDYaotNC
	 ALMKF1RfE2hN5TG0JLfUnfCKUzfB25gHU6qR1msii66mbuFk+Z4MHXYAxAKH9IsJjf4+2
	 DkAC+ZfgubOqPlz5HF8nj+QlvaouwK138AbJKRJq3s5N221ysdMxGDT1z0XsCJKBOykVk
	 YTcbtF0Xe7shyGtdGbe6Uge1aaBs5+0Cd7NQLoWWKPqVrF3NMmZA7gF5UCB32xyqaMMNq
	 cf5kvZXbzC1Xoge9hyAAtbNhRd5abCpPv6AQeWQxrehKRL//jeoHGtjwSHdxz3qI7bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R1G1GkqS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2N4brTY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D135F606D81F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 01:08:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D135F606D81F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R1G1GkqS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e2N4brTY
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MnojR148662
	for <linux-kernel@vger.kernel.org>; Sat, 7 Nov 2026 01:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2LT9f4/r07l
	EFqji6lCYM9PWfKdD623UUCASE9CcMk0=; b=R1G1GkqST3Ka3ccrGX+wXtlKxYX
	SQTS7LRp5zNjKl1excZLOxD/eOaOlRiWe9xqIHPoyNXsu+mZpXbIKWkfxO6giJj9
	FCgHKhjWndS1kuNKyRTbv/BPlClf6VlrNZpQozDPCr4gutQnn0GRWgzFGZpq5KWq
	DZby+zgHicIVQuuLXeXTIH7mo6Tg5/r/G1rGJob9QNFd6GGZ5fRgUCzyJLbgilZO
	GOP3EYrwgxgD9twElnSp4M8CZd1CSUffbZIULhYA+AcryN+YuyJs2To8iAElxSt4
	UeYktTVFt3Wqe99TpCkYwQcTgiDlDcTEKcpgxZ+V3Lc7h83vbG9b65wJQzg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyk10rj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 01:08:10 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67bda487981so1910075d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794013689; x=1794618489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LT9f4/r07lEFqji6lCYM9PWfKdD623UUCASE9CcMk0=;
        b=e2N4brTY12xSceHyVj4rtHTKr+Aaqr1TlG+MCaKXnpMF6YdwXOre26DOpJ5OhGHwjj
         rTsid7ZdARdzCP2G4H2romqPCmpau0CY6+DR9243mM3kqfIBKdUy7TEZeEfLBDSEElO8
         kIWFmLU88zANMbXU/XRN4oHuASqz8n4SkNEMen19ssDwbftDFu02miC/VPbi5/CiUzKA
         e7S7vawDUyAkp3E33jTakoItA6D06eRaMU3jLdpsfhF2paEmAbUV0SGzSkmL5BUvkulf
         BR0Sc/7DaMHFfMIBwd16cJqz13FXZz/c+WB5Nx+m8+Uoa21egRgDjXQe/PJOP8fOkjYW
         zLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794013689; x=1794618489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2LT9f4/r07lEFqji6lCYM9PWfKdD623UUCASE9CcMk0=;
        b=zL/TpLmrbuupTlat9qWCY1FyetR4dPT0ksPbi19mbEImvAiGs5ghwlwYnBSah6Yx2H
         9Z6l4PA6y1veJFVAkb06AM0DIIBOS9wDvT2BgOFwWFEEu+j3Enx0sI3nX+/e9qZb8/V1
         ajyRiZ+03diV6GrYBnpRN7JmmRaHvuoEYAcSFYcxKniM4Bq6D3AkgcTP3mu1K4PsCRJc
         wJa419XzcUKVi6nRvRTol2yLMMxQ9QvDHso7aeUcfEfyc83tZmtiFEtDqUvfO1BQILC4
         CLdpD4Ivn6asiELaNBDGrfzvAgX3Wm1z77yT6jmQWLtTrlkiz6zsyNmDmK9JjfYfDtFl
         1zfg==
X-Forwarded-Encrypted: i=1; AL+hErESU4EWOxf+wG2c/exKu7zBLgrE2lkiIiTry5lOmIbklXGIgrzuxqxARtk97nqXJA9qFaB7Az6JiXZEXZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z93mfeTcIpwL1wzZR2Voufk+n97IiU+BtX+8BLOkFCJQ6gO2Tff
	sfbKSISS0zol03afQBWSNB1OVukKEfjG8EyOFfgyxAQoKnawij8Cycgu2BKuKyjQJ4hvuNAsKaz
	CbWfwn61B4dzdljiIYsJsmt0pCVGy7cAdElcdP0nuLcpuHJGkXWL33ubq6Zd+8Kgfg1k=
X-Gm-Gg: AYBFou1UmqzPZbXwDlGMDmw2Zc8BPj9eQIkcoE6LoRON0hFM0RjOLZ2nVno5mimOpj5
	XqYkudXqZZiiZ2/MmSsrLhJID7T+H/LlXCdPAFJMMUg+/8XxTllIEETSnn42t9TahukIk6kRQcW
	9B4xyo2p0fZC9sNGdJRaFX5ePtWGDoZMk33Ymd3XLjsZNR0pMyMHWbyk49NrUetxyNF3+UQx/+1
	7JWoq8kE1rE1fmOvE1YFcqmIrUsjdLxz3uuN1Ti2Y5GcbsbIKuMiyxoE2D4uGV+yj1FQu3AU/xI
	Wl7529jwhVjQtxU6Vv7IbGGw9kyiZ3aM8ghHddssrI8WlJ27r/DZfrwNUjryiKup0McfoVD700e
	GevW8+JRzcwCBr+v8BaLS+1bsT/czFzmmQ9sk8G5rrz/TuFplMxperXJnkwe5nG7+zutyVG369C
	fmxj0AwEqLlOgZW6xZUzC5Uig1ScXUXjJqdQ==
X-Received: by 2002:a05:690e:438c:b0:67b:dc56:caa5 with SMTP id 956f58d0204a3-67c145cb402mr1178075d50.114.1794013689161;
        Fri, 06 Nov 2026 17:08:09 -0800 (PST)
X-Received: by 2002:a05:690e:438c:b0:67b:dc56:caa5 with SMTP id 956f58d0204a3-67c145cb402mr1178062d50.114.1794013688417;
        Fri, 06 Nov 2026 17:08:08 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c134f0b5csm3091934d50.7.2026.11.06.17.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:08:07 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com, amahesh@qti.qualcomm.com
Subject: Re: [PATCH v3] misc: fastrpc: map ADSP remote heap into remoteproc IOMMU domain
Date: Fri,  6 Nov 2026 20:08:00 -0500
Message-ID: <20261107010801.3451213-2-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-fastrpc-kvm-iommu-v3-v3-1-f3cd5c030c78@oss.qualcomm.com>
References: <20261027-fastrpc-kvm-iommu-v3-v3-1-f3cd5c030c78@oss.qualcomm.com>
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
X-Proofpoint-GUID: ToZVeBxfnybT-qBzOP3TFk8N_OlET23O
X-Proofpoint-ORIG-GUID: ToZVeBxfnybT-qBzOP3TFk8N_OlET23O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfXyk9oogl0Q2ty
 r+F2curxko/qztSojiD6d/Aodb5mDH38Cfw1IT5XRCZVg5nsjNwMwM+6t1u57qn9E3tNwiz0MMx
 MJHT10jkb9gAM8SKBQa9AYA5F1RFhUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNCBTYWx0ZWRfX3b5W+tUeILYt
 wP20INBLzqOr8tBHuvXkD3r+8K133Jje05PRu2DnwrewwIzUSRJSrNnHym6z0/xxwIZiP0ynd9L
 MTnTIYYWjDscyuqAxkkPakE0TorEOiqBNwkbwquLsIgfiFsSzBUCHU3CqSSXt23rjkqaGawdpm3
 9brAK24L22RGN8QJuuE5U0oXwaSEY+h4j3ky217EQDq9DLTRD8rmS2NGU2rvHJWPTt59nmJTtxK
 uJSVtX/FgXKJ5Yd9eBqyi0YovzpFxHWSeKsduAf8k/C/GCdlIWOG6R4kHQICLGsr1u+yKDioOX4
 lnFUUczJ1c0ppFpslwT/jNZRcPb4V4AY7RGv8lE6dRth6V+O5E7/oQ2rO8RyWmRFdAGXC1t74tj
 6mByFrRGBJhcdZo1Zb7cGrhnHMEmKaaCqjtgdPW2XFKozZ+VARi/1b3VlZyT+0oImdjL38Y4xL6
 vZUrhkdE8a0/qFrIDug==
X-Authority-Analysis: v=2.4 cv=I5Tw19gg c=1 sm=1 tr=0 ts=6aee79fa cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=WGrctX7s3ODQAISolrcA:9 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070004

Fixes the ADSP SMMU fault on Eliza at EL2.

Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2

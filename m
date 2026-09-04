Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CDE3AAF78
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511758; cv=pass; b=aku495TWAmLZaZIHptGYPd3eRAeK/qFzAG5TPfz5TdBV0+9Cud1wGGMyudUYIZAfpudphaLNT0OJTfkYgL3v7bzKMx7wn9Sn2lrTVq5e74un0c4ZnjjIJgbXdwEivX3c8gWa1R/AhlXdP8zkpXiRbmzK2bzicR78DCAMj0o/GVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511758; c=relaxed/simple;
	bh=3ydj7XBZQ9qjFikBAdVfbnM6S28yhAGg+f/PA2X9pwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AeHGZR+8Eyxt5vrnWZWm1oCk02pA186a1Ba2Ak/luNz5ycW95jkT/Acl9zHIiEv7aZHD10CX2CezMqvXEIwt9Lxdns+5frRuwNxis5OFXbxRK2mJi47pAnbqYSv8DrqDSwIFpae9Hcth6ptDrH2ng4jUIvNfnNFwB5uo4x3s1Yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LLLWgy7x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bm6lNLaE; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LLLWgy7x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bm6lNLaE"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mpxN1770479
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 08:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=; b=LLLWgy7x5kHSkJEf
	cKUpXSkYGkLubmh33Qp1ekl3zR4KPpk8MrHnMN0GSSstVS5gLOMsisTCzd/08KgB
	+w7EE0lYZBQID94Ka80EKQSn4C7KMZH6iivHtoVjKTxEXgTZNCHq6lKuQfvI5rSB
	Mkqip1Hfrq2rKNSkjV19duUZkHXbKiqub50XxgcfzoUdl4JuPBK5cZUx8mCpyjQp
	HG+SQAgl/fdh/g/H9Eo/baAdCSHZ8jekrCA31dMZb4RwFkLik1E793hGiuMwCZd3
	e/TR77OzaVLgdZhwzy6ouWFeVJanyqRop2MboGj2L9Fit1v6dapoEftLimQsn5Q1
	3HNWVA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfpmqrvrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:49:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94f086fedso12189825ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:49:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788511755; cv=none;
        d=google.com; s=arc-20260327;
        b=CCWMdNOE13mpkxi9kUGofUB3QtUkVod9nsPvp+LH47JwvGE1KaRCRvaYjQo+LCDsZg
         wCZnPVEI2wfG1m5D4/AaPMK4OBxpLj++8skT1s3sQngLS4oW6CdKR1nGP23/6Cuiflgk
         69zLkeoufX07BHbFyFfxKWsbM4/zGNaU5i5DizaGnDAQ7H3c/ri/iF4xpYapnm9K6FY7
         RQeiH0Xz7c3tcINWh9HnvEjgNmXAzCHR2ki3GkqCOVk3as0icXIpW3Neay2EAbUYgW9i
         9ZsUDX61pTXZPNU6opQg5iTuYc6Asi2ILSWT+VIYx7bkpTEMeqb1IKpYqfmUSUScAs8a
         oOWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        fh=ecdYrfRBZAlJa+iRLKx1nftYw6ZSd1Rxj1zSKNcF3Ks=;
        b=sejH4auuAReyz/2udWKLLv7zJc2sQ2huLCjMvmuJBCVuy2fysMVWJNeg9gyjfIiseU
         CO3m0zSZTw8zygp2ajSWA+7Wo9FelR4akSscwcDz0uH7BmpGU5v7+SfbB5SlxPFw2ttS
         Aq3OqVXxicIZtnAME2819eSDvTWejXWZJ1KqgL8lIPSzeUQibTnheod4INUXAZuv4Lx1
         l2b369BMCUf8HnbcJvRLbLO3oRkZfMAMxmfDqMx58ub8GafGShfGRFOUALo/2FUhiEC1
         +G0oCnUQc8Q2ptdvZJG2MZA9HYFQ0nu7EnK9yh/Ck9zhvSeNKRPj8tigFsyWnrmu6sF2
         4SJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788511755; x=1789116555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        b=Bm6lNLaEOHBb6++r0ROIaBiXekj729F7RN56Y0HPc1gUxtjYYN3hGGekogNz7hcmXI
         uLFFhjpFZ0Gl676dKMRJcC1y2FIpYryKB2nO4xe/PEf/CXXxMLMX7+TYzm/UxE3bFra6
         ukVKxg9MVrWZoCn+0xUEM2eAcJrhvuoM+sEklZ+I7wcLQ/w/cxeQ+w+bwjCWZzPvaxxu
         G+aB8D/mR32+yBiTseOMSoutHkGWGoQFvWYuMg2sgEwiSF2f8bksK4medlDGjkfiq2At
         2jtCqO/2vAU5oBZboaTsEId1+fc/J3HybhqCVaehq4sKT2ldRb9zd1qjWQVOTpOiONSq
         xaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511755; x=1789116555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrXIcuGfiLa9DF8zcyadO4YQ6mRqklnE1QeIxy+wnqc=;
        b=ZDBTvjs1nEVqL6+kxVaADIo14d9JROYPw08EkIQe2qe+v9FDq6kwhAXwn/W6xF0mcZ
         T19csXSKeKgG/83kCK4wsYKE6aU0hY1zloSE6XkiqMk8aZMF0d5YxYiP6m3O7iVwRH/x
         ZBOrqECXv7jtpHyepnG0zp96NDWhm4m6o4PsMHXw1iPK350fTuztWhvLYnmifCblTWyD
         Kz9JNYZ+sj4KDNco+1DjtpjCzWmB8xFMV8zxoEKjg/eHw3OUWdpn/1Du3/pwhiidhK1v
         3Yy97ZRJUt2an7RV3ME2ap1fv0sgLM3MzIawDEjevhABWvVny8R3LCk93hhvwKs3/6VF
         tbVQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNvLVHbjlb67pGJ3quJ1Ef7k6XDNICyRfwft6AoVs/Ou8KwVu+dhJHQKiyEteKRIaOm37YQg6+oHwDSco=@vger.kernel.org
X-Gm-Message-State: AFuF++n2Y5rlFLbuv3KvwCWAa7YsBFBY+87Zs5qSSNlCwIx/VgDi0RDr
	HTfBXhdV6XKI+R/uDLBEEtif68/NlySrUTq5ByQGdrE7ZPfAWMqRdQAcMdRw1qM4ptVOSBOAt1h
	R1Hh66tfD3GubRegCbX8YWDpz2QEInuJ88YS8R+zneHYpf9KtvAF/zXh4ZvZIIuuPfqK4jcugvk
	8juPbAu37tDoghsJLFOUt2TgUmQdBIQSw1zxvFMvG2+w==
X-Gm-Gg: AYBFou3A0hS+W7M9VInO9v/lXiu003DJfDuMCDUYNQsPWR08efBQsxcKI3cLo8h8tgM
	wgC/BriwZ8qBoBwdXt/XyJrnz4+Ufn7/6LkNX4VG+xQOQW1CaSmVUH43UuZeGpF0bYItOnaZpR1
	LeKCQL0Iz54uRaSGA7Mt3QUh69C6xtx5k5vWfJryEn/eNxqB8WLrCQyp2oFg==
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id adf61e73a8af0-3da3a066ef5mr7202876637.19.1788511753922;
        Fri, 04 Sep 2026 01:49:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:b418:b0:3d3:adbf:7777 with SMTP id
 adf61e73a8af0-3da3a066ef5mr7202771637.19.1788511753245; Fri, 04 Sep 2026
 01:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com> <20260806-block-as-nvmem-v10-1-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-1-be598b2a5606@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 10:49:01 +0200
X-Gm-Features: AcwNN1Uv_B6HKhzdhsS9aNd75U_pKuJYfQt9a9aPW0x1SCz-kw1mAB0yNJHs0Mo
Message-ID: <CAPx+jO90ut8ZPh51BPyJLpTT5u1i9HTWKyNUWRsFdH+mD1uqgQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] dt-bindings: mmc: Document fixed-layout NVMEM
 provider support
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-bluetooth@vger.kernel.org, netdev@vger.kernel.org,
        daniel@makrotopia.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfX2iYqzLgANdR0
 VlKYfEeLT0Ru4gxAfxgKAjchtAEC0GngpLtnT09IAI2lc1LNAgsRzbF4sZ0D7y93SxfiuGCpacR
 nXX4ARv1R30d9yHal9m1H6ILA9jo3M4=
X-Authority-Analysis: v=2.4 cv=eovvCIpX c=1 sm=1 tr=0 ts=6a9a860b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=_Mn6x9y97Zr2TNExHCMA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MCBTYWx0ZWRfXz/GUHw6bv3lw
 INl+kUbWN13I5Ep4h8C8EdhIR5bvW8K3YtkKfb6qS+wYZHJfq+AjKCiZQvCOnksVitrlkgi7u9Y
 CdG4yYr1FrIB2OgApBl2hp8/50tq+6n3sJRIietY3nPehDKW+5FqQHqxFXwiKS2flS+/tMpKT1+
 N9rDmpBWUwvNx4T1xRS3i8WogVdad+upbomHk5fuiHIgZIk64dAunbBLQSMizOjJZSOf2j0gjck
 L8Osgi3JroMMMZ4SHAL3gjHl9YaYL+cMA7A/+plaA+QNTGDULgARHvjDyRrGp7m47xJXWi4O5GU
 o0WR5pKdpZF7FqaFW0z9V7kVZ+/BFf0pD/gbxfjiXgupa7gxQX07lZn2E44tIPPfGGPN8q/GOOr
 k9mEgKbZ7d3gsBCECQiHZklSKdi2Lhi3yupSVZ3kiwo2eZ/o++x//+cz9qVUspZyRpcluX64M4X
 69m1nATkJzEdoJHEsfA==
X-Proofpoint-ORIG-GUID: QWM8U6NbDqcxrBgBTw4zIiRu497q3x6U
X-Proofpoint-GUID: QWM8U6NbDqcxrBgBTw4zIiRu497q3x6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040080

On Thu, Aug 6, 2026 at 4:38=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> Allow an eMMC hardware partition node to describe an NVMEM layout so the
> partition can be exposed as an NVMEM provider. This lets a partition
> (e.g. an eMMC boot partition) store device-specific information such as a
> WiFi MAC address or a Bluetooth BD address and reference it through NVMEM
> cells.
>
> Accept "fixed-layout" as the partition node compatible, in addition to
> "fixed-partitions", so the layout can be described directly on the
> partition node.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

FYI, this one is already in v7.3-rc1.

Kind regards
Uffe

> ---
>  .../devicetree/bindings/mmc/mmc-card.yaml          | 23 ++++++++++++++++=
+++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mmc-card.yaml b/Docume=
ntation/devicetree/bindings/mmc/mmc-card.yaml
> index a61d6c96df759102f9c1fbfd548b026a77921cae..0422894508478c8d0ca68292b=
58a5fdbee218358 100644
> --- a/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mmc-card.yaml
> @@ -38,7 +38,9 @@ patternProperties:
>      properties:
>        compatible:
>          contains:
> -          const: fixed-partitions
> +          enum:
> +            - fixed-partitions
> +            - fixed-layout
>
>  required:
>    - compatible
> @@ -86,6 +88,25 @@ examples:
>                      read-only;
>                  };
>              };
> +
> +            partitions-boot2 {
> +                compatible =3D "fixed-layout";
> +
> +                #address-cells =3D <1>;
> +                #size-cells =3D <1>;
> +
> +                mac-addr@4400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x4400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +
> +                bd-addr@5400 {
> +                    compatible =3D "mac-base";
> +                    reg =3D <0x5400 0x6>;
> +                    #nvmem-cell-cells =3D <1>;
> +                };
> +            };
>          };
>      };
>
>
> --
> 2.34.1
>

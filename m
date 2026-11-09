Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794237207;
	b=tqcPvJs8J/wohQV9gAzCWH/cIjgVnVE4xgxDEzlK5Z0iF0SwzyAKpdTZPTG1I9Zz6PfI
	 9OSM1AbhU7QXx8nyrtDexgFePEsA8DPt2aGi3oyBwZJDNI5mkifHylUpAccX0L+iTLW8E
	 Kh9UKysjgFWkx2/sHsTkDjA8jCXLG8KHTTcJnUF87yDuNJ7FjqBCQ/EXXTKjwZoncwCtY
	 4QGOzKQ9JFaOsU40PN6jBOvLuhs81+2U2O+yqGGOilBL83P43SG0zUS5JNkYDWtLYZJFp
	 zLldgPY0jlzwD5SxHVMyI9QUserQ3mtYas8opIoZKSe6PBluN/kW8CVLyI+VCt5MUtA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794237207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
	b=ykgbUs2WUpOtYI90xuCAWFCIVpc5zd4O+Jm65Op376USQ+2HpgiwzlwLQ1Dk9nOptjvf
	 qQImVtD7Yw65wPTidgoLSqvZyyEgZNnoReROAuRhw2tX+vvhxhUtAgV6IG89rcTRWfrFU
	 bp5TlBjwLyQp5DWTt6L2UHA0krp+NIY+XDrU+0uMZXdtok7M6B9NuGabkXAmWeElJ9qdg
	 3jQqvGfCvPLnr4kBB1uEcxQhJuj6rbmZfq+fwkTWtBF5jWJUqRQR9mQidlhGRmUvzPbB/
	 0TonKpN1h0GJeau6TG5IfE+zmO5LsHVMLAvl9u2C9pcC7VGblfNV714KzeKWzib8eLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALf1fyLf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F71Q4QMP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DAD606A32A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90DAD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ALf1fyLf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F71Q4QMP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFYZW335804
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=; b=ALf1fyLf2FjXdUoU
	6oeeOPdFeB1HyHQDhDkeN8ThA5C1tMT2b6TzcY6eT8wxJD4QoVVhh/M5IZBWRQmm
	ivVbAHAZv0MpvVkNN9khzL2abl1xU3wpzbKGwZQ7+lEtc3vVJyDz/UZ+Sq8AVATI
	o6qeLi08z5O5iqpANWASXnXDpBM11cuZ53nWnxtmoo3JlNYd7t8ViLyDskJgzeWD
	NpihyKfmsSKPJ4E8MZGT4ptrRGxSkVpR93BJlGB7ApdqQBkqpgw/TaRi3yd8Qr4I
	h+gORQZLHTZtFOMn2tTvBg1OvzpMh1QhBWznrWjEnt23FMlDI4lx6Q86OrXaoa9o
	ooxlQg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58rr8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:13:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0afbf532eso849884a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:13:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794237204; cv=none;
        d=google.com; s=arc-20260327;
        b=KKESjo1CCTsn3mQvND4sDs+scdMkVqry3RYRT7QMrYRkZsYqr6UYtkfyTmxOWNtvMZ
         Ln7KuZq4FkhTQ5bQ9Q0uTaIQuq7bvz3APMFYCYfZmKKWm5RsLPWYq9pxVyP4z+1hlCQn
         Kg2FzvG/xo4ZlBRBmjDpqswll7QrfuBlKU2t9eT98QFQKUyDirKgR1PqBh+IPRPQJdk4
         STvf8Qi3wIpO6m33u89svKijAhmOGnm0uBrg45kLQCRI4gbRIAEokGKF+Mkta2cVqicd
         4biiu8PPQThN0GiMiJlD+KrczuYAu0xW18HZz+VeENqEeWNXE9fMmsOCqYn/lSKomTbG
         B8+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        fh=fJU86SAGs7BlfsTlcHxjvBEYQ3PDIDdaBztYXM6C94U=;
        b=oG/zcsM0cH7gHDydusFzpwIw0/Y62HSxBEHyWBr2fD0YZFColFeKj/wS5zXh/nlo85
         gmwB4j2/fUE+OR9lmDn/dI8G9Y0eT93iavo8ZAqOdf+4KWb1K2cDVOKEagSlzW5N2GbT
         wZ9jvUEJVUqQWg5OMHQ06nYxW1hdninMNSEKNX/mYC+z0x4afDZ4LXAXqhWHttj1TwdU
         a2AJOic4tw24f8mzj/JgU5K65+xuzhgvq1iefzQ8FDxMlqsrUsY84DbclbeowKzxgQtw
         oM5L1j3eyPMm/sDikSd2B3SVMA81jLIGAX9PD7KlFaeh4kHxlkb0lhu1zcjtVuuEDPQK
         0XiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794237204; x=1794842004; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        b=F71Q4QMPl2i6nrVcmYPZGFCmL0uUxDpjvOy2QDSsPwmHOVRCzUwBNPyhKb1BNoLW19
         CPF0o/r2CFDEbnaEbKK19NTFGlqqDZp20v9LEPeeX18ET0nBC4NCSsIPVpvPkLgN6jwN
         VBg+gjmmEPxRUpjco6aylVUn7dBp3mh5GPMUiorNrrJsWcrnN0wofwbEyN7yxzfVohRq
         tUMtTvacGzfVKuy8yiG2m5H6XPMCqZeRG3akSlki6KIbJXo2RydsyhGaKiSOAj3CuQvf
         vjwF4uXyQbt4CFmOWG/CN11uweG0BgW5FIGa1QoMQT8jcV/dNaakUPUA6WdwipiaIEeQ
         V9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794237204; x=1794842004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f2bVAvGRQ8KmIiccMBatK2dy09lwBqE7j5syb8pUU3E=;
        b=lL6/BUdZsqM9cmXtlNcCwTgFT2odi/0s26vX1VeWvXW5OtmrNa5tbv4cvp8KTx7rGy
         QsnAm8gdzGTRMyf/nyRvrNE0m8s5Z4LWmEiNlTlnQKPYedckGsVUQ4hdn1XKIbXx3jm8
         Gn9Y965OscGUSGHAuabWtEXt/1TiN4RYqO1f2DpSvyVMjCFw8gmvbtxzldvfSsvuA3ym
         tY2pznGdPLY+UPQ+rEprhh4LJKjFUmyQFhQr2kA2wP2fZLU7wQLRXrTe3sn3HT/HPLPn
         2fafxj/OfsfvKWZCbxtSzcvHIYjMTtE8uqqwA//xpuMW7Bp28VwjGjUjI+jsjHn5Gavh
         QO9w==
X-Forwarded-Encrypted: i=1; AL+hErG0KS4V7qaCj6K4C3z3YMqT+UQZa+i9nNiNLGFsJUZL55QCC1wkY8lUHAXTTFAhOSOG50e+ZFbXcxxjYB0=@vger.kernel.org
X-Gm-Message-State: APuU4Z98p2D5zPp6uXRC0K7VazHq7auwkCYtA4yLh/RE6rb2MHNmRi0B
	wIrhQHPmc3GGwYVFwF6zJ3EPybYwZxU7Q1rHCTc8Y72wUxdI2QGw5FF8psiETivpqB9rtzaVDI7
	IGYWmsQzyJrMH0HbHyiMsMgVxxZJlG1SAvC70pun0KLQ1ygS0mfFEeY4t72MqkiUjM+3MGgvIed
	7qZJTDrPYutoDsOq9oub6yI0Z20mmGHE0sr90r3MOxbQ==
X-Gm-Gg: AYBFou0y1Lz9Tgwx6Xo8kgjkc83imS9kQTa4FdS/Ul3FitrHI0sUIwx1JJdtWS7Lakg
	8p97skDeVcM+aM0g/SwdzIBlZCxwuN/IW1igct2DE0SRAPYgrP8STJrHrOLqzfe+AQHU3dsi/9I
	24VkMLsk5x8yu34+7CSefzTnXnlOa4mPTKFXgAt8Hln4od0YpWXL8PIs2/HA==
X-Received: by 2002:a17:90b:4cca:b0:3ab:5832:72af with SMTP id 98e67ed59e1d1-3b12d33ca53mr3640816a91.32.1794237204183;
        Mon, 09 Nov 2026 07:13:24 -0800 (PST)
X-Received: by 2002:a17:90b:4cca:b0:3ab:5832:72af with SMTP id
 98e67ed59e1d1-3b12d33ca53mr3640777a91.32.1794237203488; Mon, 09 Nov 2026
 07:13:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261008091032.2832333-1-joshua.yeong@starfivetech.com> <20261008091032.2832333-3-joshua.yeong@starfivetech.com>
In-Reply-To: <20261008091032.2832333-3-joshua.yeong@starfivetech.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:13:09 +0100
X-Gm-Features: AclHuK-qxobxprSMzZBUYKJj_uyReksqIyxGSuqu40gW9TvUywVmIwdWYsE9eVQ
Message-ID: <CAPx+jO9-fANS=WN74rFz=dFZqE5PQo9gDcqb1A33W5ohEsbevA@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] dt-bindings: dvfs: Add RPMI performance service bindings
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, rafael@kernel.org,
        viresh.kumar@linaro.org, ulfh@kernel.org, rahul@summations.net,
        anup@brainfault.org, lftan.linux@gmail.com, alex@ghiti.fr,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 47At7NrrhNyjv7SqXQ0I8dYIljLiyUAY
X-Proofpoint-GUID: 47At7NrrhNyjv7SqXQ0I8dYIljLiyUAY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX0Sg0rZTAePP+
 a40op4EYwf8Iel/kvzIHspEoBjW9uzmPeaRpExEvWUvBE9n9vEqF75usJNz+sf7fEtnrihuN7E/
 FjJS/ryVWiZNJvg+vlk66dYZvxPoNeU=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1e315 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8 a=V1jnuoLLAAAA:20 a=Bq6zwJu1AAAA:8
 a=TxQ1F8pul8oCGEKA_3AA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=KQ6X2bKhxX7Fj2iT9C4S:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MCBTYWx0ZWRfX7tysw+f4Ghht
 714pFCXbziEuI0STkc1L+GTZ6rKhp8cLfEIiRnPIj6dtAkgZnziz4kM0MI1XygUcKOc3OwUQ/y+
 wKTrTaEXD+HBlehFajN2Pub2oq6wgcurlyW0mRZkubIbpzAspyeB5G1MWudMLlz/Immf0nPKKZK
 tbZ7gQmys1maz8MIUQDJLNzE8ly+HLRbKGTqwLabboRYPJAQjgK0p6HKUVYQ/zzUj7YLXMSaAZT
 1STf/GZmvSeoqW4YwKstDjXfDV4eka+NImx2F38foHhYbEWiPhxiiYd8EOZWKViWn0t8Peo+Dt8
 iVng2iYLaX9cIICat6Tl/LgAFRQDUYop8ab0LjpaSWsyiPk4iT+kGn8wV5SWyNm+X/Q7U80Uk3z
 MYuPiMyfklV52Rtsgyz/NCHQIPyuOtuuyLWTJ9+x3UO9DcOoqJzk69LKiTQdBNw3/iCXyW7qcwQ
 y0RDoyXE8rKPEHPCp0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090060

On Thu, Oct 8, 2026 at 11:12=E2=80=AFAM Joshua Yeong
<joshua.yeong@starfivetech.com> wrote:
>
> Add device tree bindings for the RPMI performance service group based
> controller for the supervisor software.
>
> A CPU names its performance domain through "performance-domains". Any
> other device names it through "power-domains": the controller is also a
> power domain provider, with one power domain per performance domain and
> the levels the domain advertises as the performance states of that
> power domain.
>
> The RPMI performance service group is defined by the RISC-V Platform
> Management Interface (RPMI) specification.
>
> Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
> ---
>  .../bindings/dvfs/riscv,rpmi-performance.yaml | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dvfs/riscv,rpmi-per=
formance.yaml
>
> diff --git a/Documentation/devicetree/bindings/dvfs/riscv,rpmi-performanc=
e.yaml b/Documentation/devicetree/bindings/dvfs/riscv,rpmi-performance.yaml
> new file mode 100644
> index 000000000000..ec7856cb7257
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dvfs/riscv,rpmi-performance.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dvfs/riscv,rpmi-performance.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V RPMI performance service group
> +
> +maintainers:
> +  - Joshua Yeong <joshua.yeong@starfivetech.com>
> +
> +description: |
> +  The RISC-V Platform Management Interface (RPMI) [1] defines a modular =
and
> +  extensible messaging protocol for platform management functions. The s=
upervisor
> +  software can send and receive RPMI messages via SBI MPXY extension [2]
> +  or via a dedicated supervisor-mode RPMI transport.
> +
> +  The RPMI specification [1] defines performance service group (performa=
nce
> +  domain) for accessing and controlling platform-managed performance-rel=
ated
> +  resources, as implemented by a platform microcontroller. Supervisor so=
ftware
> +  can interact with the RPMI performance service group through an SBI MP=
XY
> +  channel or through a dedicated supervisor-mode RPMI transport.
> +
> +  The node is a performance domain provider. A CPU references its domain
> +  through the generic "performance-domains" property described in
> +  dvfs/performance-domain.yaml.
> +
> +  The node can also be a power domain provider, with one power domain fo=
r each
> +  performance domain. Any other device that runs in one of the domains
> +  references it through "power-domains", and each level the domain adver=
tises
> +  is a performance state of that power domain.

It should be sufficient to use the power-domain DT binding to describe
a performance domain. See
Documentation/devicetree/bindings/power/power-domain.yaml for more
details.

For example, a power-domain provider node may have an
operating-points-v2 node, indicating that it can scale performance.

Kind regards
Uffe

> +
> +  For example, with the provider labelled "performance", a CPU that runs=
 in
> +  domain 0 and a device that runs in domain 1 reference their domains as=
:
> +
> +    cpu@0 {
> +        ...
> +        performance-domains =3D <&performance 0>;
> +    };
> +
> +    gpu@40000000 {
> +        ...
> +        power-domains =3D <&performance 1>;
> +    };
> +
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +  References
> +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +  [1] RISC-V Platform Management Interface (RPMI) v1.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> +
> +  [2] RISC-V Supervisor Binary Interface (SBI) v3.0 (or higher)
> +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> +
> +properties:
> +  compatible:
> +    description:
> +      Intended for use by the supervisor software.
> +    const: riscv,rpmi-performance
> +
> +  mboxes:
> +    maxItems: 1
> +    description:
> +      Mailbox channel of the underlying RPMI transport or SBI message pr=
oxy channel.
> +
> +  "#performance-domain-cells":
> +    const: 1
> +
> +  "#power-domain-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - mboxes
> +  - "#performance-domain-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rpmi-performance {
> +        compatible =3D "riscv,rpmi-performance";
> +        mboxes =3D <&mpxy_mbox 0x1003 0x0>;
> +        #performance-domain-cells =3D <0x01>;
> +        #power-domain-cells =3D <0x01>;
> +    };
> +...
> --
> 2.43.0
>

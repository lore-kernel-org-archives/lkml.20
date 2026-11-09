Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794239264;
	b=sQD0FNw4byMA+a1pwdK3QbjioK/JwPh0PHgbwsLDmupKzUkVgAgInXYnVrK8rkcEQ/Vo
	 z2v3GezUbXp1C5M8BUUKxRSJpI/AQz+LLwLKmaApz/R0ZuopBX7+AhQweZJEz2JZYkwz4
	 20YvwndLqi8hthyihY+q9CenYucgGNtrlFsTUZsPeaqlrbZto9oCG/aHsOtazdZu9glJb
	 5j0JbPc1uYNnwSYHxTp1NZ6BMmGbyT4CBlh1ognv22/THBqFfcz+whf0wiGMebZMW7qYB
	 qGvI/79+k7hrlxa7H2/VYAkrncWsQjipxX+6AkEwVd3CSjhxQ17TvwH9rI/obU5CQ4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794239264;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
	b=1RLd2PIBpj25/P2ef8fSmvPSfZGCoLmiQNnYP6diirTYvq+SiV39khwRSmOMxNbmVDBf
	 3PhOZAAuo8JSl1ebTSAA8qb5Dl+RyKITAoeYOxzZLoaXh8ujQB1f2UsKLT++hNmsc0pMe
	 vno/mtAgVXohKWZbKvIP4cZdeciqmEbCHmBYlBvSHaqc/Z9JW6Sq+u/uHO2rjj8x/SSon
	 Pgr+NsalxNb74t8qE208zztWgMa+B3mrv50ZjiXrdKTs6VW0NJACXOzju0KipEAivhYeM
	 F8vQSqirM/ZfdWI1Cxq73w1ENUHbxHpSC53XRf35yvEU5QOR0s0OMY4bIeUVVeddo2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9cOGYDw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kzv6+DSY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA220606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA220606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i9cOGYDw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kzv6+DSY
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFGxd335087
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 15:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=; b=i9cOGYDwelk3Coqs
	Lnm8maHufdSmKU9agpzwAvGEnrGe1g5maoL0oTeVD2vMKitnjvDHsdPqVeSvVaeI
	8nr0owWuRV8qvu3XZ25Qbi3V4RogyWXbuzeeqyOrkViAgfS2pQJe96Hj74eVjOQX
	bq0SN1Pt8Z+6XxT+aLfgNFz5p+vlBgxOf19lybW5u333SlW1ZvHV3+qO3TrqqIbZ
	ocpDF5hn9FSnNyM7KsdzYX85ruuSxU7+zvrLBl3AGbGSpypeBdxqmoJvhts8qywP
	8glHvw+f0GasDtS1A9Ktp7VJF8hXE38GZ/yPi1Zg9j7yntBx/XJjX75vgZG6qtgV
	nJ9Cpw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hudf58vkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:47:42 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so287326e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239262; cv=none;
        d=google.com; s=arc-20260327;
        b=TwlPmSCvvTgNbCKHu2oeWJgvX49zBEZ3w3oNXM2XHgaFNx/T/k5sGn29NJHAUeiR8q
         owdBYAinuwhxuW9XpYn8kmz7wRiZpxqw9/g1Diyw/wK+3Pq6vh8vwlmfaNUsUYjoeLMk
         F6MIjvUvybYjCDbJOKz/uvNvSyaFPldF1Q8Zx2h8cCpDieEjgTayO40Ih7KTN/+rZ1iV
         Pur5EXsU1+7MaKOcK+A3Av+1M1YMDPEH+LO4pk5ZuIMKSWKmzDIIUjaN+3vidQ+I9Wii
         Z+P4meuTh4yrumLWHWoEue33CYXRDos23dZnzmzaif4WGEk35OJzDggBMEaBazHsQTYD
         YOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        fh=C2Ht5Tc7EbNTMly/5Tx8K/FD+RVEuR6BiWkPLT7tle8=;
        b=eoNrPeKSqks8qHQctFY650EO94iSKDo24BaEi/5XbH/oHrq5JFqS4z5wIpo11eg9aY
         JTi3pMmqRBURjjN2h3pMpGrgtuTbqvIDhhxYG3uBPZCh010Fuu6gNUGQyrw1uMTVQTXO
         CXu/AyKl8yagEAZwf2ZLrHfNNjrzG5uoChNnUzDofw1UQOuOtzcjTZ15+gn9qpog3hL8
         cbX1fp98CFVfVtvcbEq3jKpv2mA/PAju6+qZYdM2V0hRv585VVnsbgPimjnRZddMHIEg
         WGH1m1tt+rj9Nbs28H4zWtKXWXLr/PAVHZ0oDRpD6LXZLBtsmh3KVABx8BdFbQ+65o+n
         s0ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794239262; x=1794844062; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=Kzv6+DSYorJUfmW3b/1Nd5IkiAlsIGtF7TF05V0gXbGaSirHRr2N4ZksG+s2hpxScY
         YEX/AzYU+99UGqwoo/DhDRyn8wQHXOWrBjLTXdXAruUGdR2esmZBU22e7mvrRRJnGqcT
         GAHT5inkSAWezPVFdAxpzcODRaAOeT18XKi7Sp8r9WJ+xPJpJBXFxsKFLRPO59659iAD
         tSMIOp+mwJl6EsoXixAxik53nCzleje645Rk6MfGaCxoI1BocsbYtIBeInifRU6+558x
         1gSYtIjsjlV6NmrQUkzc7pKEcJPoLbD3qkXmHMaB5p2kFRmhFaVvhAjqAlDWKXlGVdNP
         lH4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239262; x=1794844062;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBoR5s6oMFRgFxiQj9Lay5NRlrAbxIjp94cmKVZAPUs=;
        b=rKUZgIzRMoTKp/B7ExVgOOUmKYCE334i8olfKObYAo6u6ImaQeFG/TpLqBsITJKUHT
         AkOch/bU+00dpOFqDjjX2PTMDKHkawV9CAOmfSb1j0u3Jl4vQF/FAwgaB4BAM7LPtkwq
         62AaWZCtUZSLmbRGri7jJ0a1ufVCA/iMr1EW4zFraobeSWetzT9iTlhDB5nePSfQJ+5i
         yS4zjpUyFyVD2A0TGGjasuf6r6KCM7F1iNgKZw0y9SKclJd7Xu/vOr4BCRqSeZN8u6BN
         QSNI82gO2mZyzr1plWqRt+5taNyTuTyZzIFBFiFBBJB7gCLtFTOz1BkXkPZE2uzZf4rk
         AmSw==
X-Forwarded-Encrypted: i=1; AL+hErFRHIvW/IfovOLKh/Pvy6f29qAL1vHbqnHuE3wq929C3MvzLx2lb0loHXcHqm3JvnRn94dWgGCGqQmyO/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+HeDcueUJg2l7E0PZchp7SL7JsDkt6O3NnNwvVOnRikH1cDRSa
	sKSkySr2fW4hvA0itAwhUaRBX/DVoyhoPciAd+lmZi0QXDqcU8CUUEEK7nhMOMdzuIQLx31MO9l
	SMch8BKG6XGzpdoZxpQzilLQhbG9RXKxOkMyoLyueGs9tFJvWepyhNgZTghTDKPPOmhAmbPzGDo
	tEELTgsJoLSwAsJ7U9m+WrawHB/gZDtWo6m0R3qWOxXg==
X-Gm-Gg: AYBFou3wsc8/FbWTz23hk2UKI74QMaMcLhSvasCt0Lhl6xm+YpTAFTii2sHrlOZzWOZ
	tmukJxHtHl31u+JxAoCsA7Wt9ENVvDJFadOcDcsWjl4weMp+QDj7mQBwPNQ/p0F5gfDKrZ7lRIH
	dwEXkO5WKprxTPoEtoRCgd2M7dULuMV2sR9vZx/ylCCsGOZxQRSif1x9wTpA==
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id 71dfb90a1353d-5ece7143d92mr1480905e0c.2.1794239262178;
        Mon, 09 Nov 2026 07:47:42 -0800 (PST)
X-Received: by 2002:a05:6122:32d5:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ece7143d92mr1480860e0c.2.1794239261690; Mon, 09 Nov 2026
 07:47:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
In-Reply-To: <20261029-arm-psci-system_reset2-vendor-reboots-v27-0-fa4b3ff1359b@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 16:47:29 +0100
X-Gm-Features: AclHuK-Kr7TGoM1o4LoUqHv6QGn1qOkyGnkGREVNczQg09-nH_zkvO-sNuQEANo
Message-ID: <CAPx+jO-WLCnVecquKbVaCcErbhuFt6OHFUmzbgNHjixx0r-wMw@mail.gmail.com>
Subject: Re: [PATCH v27 00/10] Implement PSCI reboot mode driver for PSCI resets
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: OK65pVPANZ2Kb-syVdNWUNynjjXQZxG8
X-Proofpoint-GUID: OK65pVPANZ2Kb-syVdNWUNynjjXQZxG8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfXwCnkoHXCcPfg
 GmPmPlvB9C5pZCvruSf4gAskyQBloOiRCAzuLLW/2r2IpGM6JWbcSa+S1NYk2VdJTvDGFeYhan1
 HCGpc5j8oIfW3E17qY7gA749+btQddc=
X-Authority-Analysis: v=2.4 cv=bar+w+PB c=1 sm=1 tr=0 ts=6af1eb1e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7LcMNQwP9uozhxO2aV0A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA2MiBTYWx0ZWRfX1U9U44W36zUw
 zhxsUmzze74RgdaixwDAlXi+ixwA8Ww5rAjonOyOOAprRCo6q/CHvapLzdvfM4Ta4f+jnPUJIuu
 Hx+FcBHr9vWzzZZ7NWMraC0mLex1gX2vfjgqE98Y8QZkvW5W8W/UcBq11bLCKZ98yzmBswzJ55A
 6LFB8uZ9sUQAJGcAXvVbgZCbUD9BrHm/U3iZjCdbmC2Npghz/bBEqMiOpaPTQkT/qTE2JEcaUO5
 wW6RxpGd0PRJBM9PNZQq2KsFYP+/dGFffpY5nYX1+uDq30Iy8tKnzXEnJ4/qGOkFmTgMLAhVIJp
 fKExS/L6o+iVoDbys0fgfVaTfP1vWYinzbn396+t0dvXxTOmpwYWn52sqD7mbUh5aOJfeuPOXBz
 FmAHsLtF7QNdpmFfWUnQ2w2ubWLxxD3XPN+V2zEa8Le/IPnNywFTxP81lv38NvJXZ4tBBoW30Uq
 ihmIlBuo3tDtFrPY+rw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090062

On Thu, Oct 29, 2026 at 10:01=E2=80=AFAM Shivendra Pratap
<shivendra.pratap@oss.qualcomm.com> wrote:
>
> Userspace should be able to initiate device reboots using the various
> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
> patch series introduces psci-reboot-mode driver that will induce
> command-based resets to psci driver for executing the device reset.
>
> The PSCI system reset calls takes two arguments: reset_type and cookie.
> It defines predefined reset types, such as warm and cold reset, and
> vendor-specific reset types which are SoC vendor specific. To support
> these requirements, the reboot-mode framework is enhanced in two key
> ways:
> 1. Support upto three 32 bit magic values as arguments. This enables to
> support for a 32 bit reset_type and a 64 bit cookie).
> 2. Predefined modes: Add support for predefined reboot modes in the
> framework.
>
> With these enhancements, the patch series enables:
>  - Arch Warm reset and system reset cold as predefined reboot modes.
>  - Vendor-specific resets, configurable via the SoC-specific device tree.
>
> Together, these changes allow userspace to trigger all above PSCI resets
> from userspace.
>
> Note on introducing psci aux devices:
> Based on feedback from Bart, Lee and Ufee, PSCI child functionality now
> uses aux devices instead of an MFD driver, with psci-cpuidle-domain and
> psci-reboot-mode probed through a common PSCI aux device enumerator.
> Reference discussions on this:
> https://lore.kernel.org/all/CAPx+jO9Hi2R_UnCEhsXLwf74c3RTb+RodaJ6SOVXbQX_=
eHt++A@mail.gmail.com/
>
> ---
> The patch is tested on rb3Gen2, lemans-ride, lemans-evk, monaco-ride,
> qcs615-ride.
>
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>
> Changes in v27:
> - Removed unnecessary headers from psci-reboot-mode - By Bart
> - Rebased onto current linux-next.
> - Link to v26: https://patch.msgid.link/20260928-arm-psci-system_reset2-v=
endor-reboots-v26-0-b24e2348e8e1@oss.qualcomm.com

Overall this looks reasonable to me, but I will take a closer look in
the next few days.

When it comes to the merging strategy, it seems like the best way
would be to funnel this via my pmdomain tree. But I need an ack from
the relevant maintainers to make sure there are no issues with that.

[...]

Kind regards
Uffe

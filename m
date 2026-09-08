Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26849369D60
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883831; cv=pass; b=tXjSn+tE+qQVB0Lazr7gqUP6Wm8Wz8eK3TVIR6nmMRsP2m2Gwz/1SGWXzSKT02LMGhSIK979kZkdMW0gyntNcXdAykQ5iedkmSgkQEnYbne4oS+DtJdWTfrBddnJAi7037nv0Z4B66cpEnQutFKnKf2guD7a7fq8TjUWsuyEsIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883831; c=relaxed/simple;
	bh=6aGgyaVNV+tz9lQO4iNPAUjI6AhvmkuMr+8cf09tqq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tGiYuB7RefDXHXkEzbthKgz6HHDGigmKk95I9ybtoS7Bs/WUrudzEZbtQPyPVywwKnnre0AgnU2H26RYg/ZB07cplIXXht1nFLQkrDVBR1brs23pq2WU+PelgHJbRv5gsaZX7VHx6rwrBDAG0YsEsL0J44WiEGFtJxk83SJbfvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wym9qvhx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NB4YpsS8; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wym9qvhx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NB4YpsS8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fduff2770709
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 16:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=; b=Wym9qvhx0i9s34Ns
	deiPdGODZSfOch2qfXuQPcigTEkHSNjVMjrz1XahSpCoPP7TTnOysq3lkFQZz4GX
	Hp9N7y0MK9ixz6QUc80mkw+By6sNWwBgt3b54br5DlyM1yUwYYc0o6eWVWPtECbQ
	cVIOxRYoEwPDUDPvkpg2wDO8qYya5Y0hdpuP/KwhB+a3vcHJHE7kJuipfrkr+dt5
	D12/EUqtXotLT2f6sGepK8dMurVGmHP9u5mv1168UdJjBeMicmj6uf8EH4EBrKf+
	6H/U1Wi7OcoMHItVWa6OC62O87oRkRcY48JqzeaJmpT/mDS/Z1wL38k9QYVpdp7g
	WpJBnw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvugx9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 16:10:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6df0a1e18so94086315ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 09:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788883822; cv=none;
        d=google.com; s=arc-20260327;
        b=jEKGGosL8ZKfDBMcg5d1bDFABC1KBXZfcgt7oYfcobViyhLTLZoGDrfTjk7IgzsRbU
         TrSr1SJpYwGXrRDprNa34tBQemVKoNRb9Hblj1JgZVzPxaaCSJ4yhv17Suno5/R5gheM
         J/kHtgj4ePlakvLmV+vhGbwetecWCvzwwSWlN3tQ4eNoGgQ17oBEm+5u8r4bGOsIhg/+
         nJbVFIXdF7ztgNwdG+1QZtx1mATiDIimSQ1pfxyBPcYYN5CGhHFQfUgL4KcxfW5kxc9c
         /LVY6iA+LWsIVoEQTBwPXuZjh6nfDHKqZGB2KdV7KejSMutqUO+mEC52GGxSWNWHCN3L
         JtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        fh=SK4PB8lbQFFj5uC57ikxadp2cNpURl4IUTlrlCxgnh0=;
        b=rh67uNLXHE1Wze7/oQzilbsm5jHbewIM0RbcWgvqvTupyP1Deobdntx12daiN/OKiw
         qPR3FAs12t8pDwbIAKmM2xIpC9ll1wr63dmEpQPyWefZBV61ThP8BNyrW0G50GKHR9pa
         K8Z6wi00NqCSg5D58fxA8atghxKkTSGMNL9mr+vQ+FahdVHQsYS0hYfH6Cz0xfhadRRc
         4M8DClcYy7Kccx1mlFbEmQ1j5fXzQGcefrcjDsvAXjBtDgDLrI2CbRZSj8M7x/+Tv01v
         ruuEa1yCBssNkpwsvGoQRqq3awXHP+9QK7KzjANu+kD2FFdnrZ5znHaMIbFmKBufdaCw
         u23g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788883822; x=1789488622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        b=NB4YpsS8y5SGnhc0y6rwhT3cyYEaYr1mJ4xVuoeuKrnlSVYqdMQL7yGKraC93Y7hdV
         4ftZJwhGO0T1YivXfn27av7CqK0pnvmagVnwUcBxvXge9TRdZ4Mlby1hYGzA7Ar8i7qy
         O+Y75KxGtPAOqaPw4KL5UVIzFHyRV4QqKUEQp4iFZxxLw+BaHsryGC9JUk51jFttvzFa
         qyoDr8wCpY2KYf/fLdTX14fyJY3pN2D9WDhTM4y2Y++94AFyns42cJKmvX6NoDY2PxRW
         D5heljV164dRfsVrhJcgLkbNGQIrKa4vO0NXCqkJBhy6ouj6dzv+Hu5hXIPzYivFw2b2
         CBfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883822; x=1789488622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/jmstT2Zeq9ftDIOt+LP0+nqq62lgJGu5YFnVkMj8I8=;
        b=rQzy/1YNYzQN9aUXrEktgORlJO9ndLZ/ABcMbDTyg7xIaLoGSBDU+fjsVuHA4B4ASs
         JIHQUqztyrdNM+S37xUZKcLCoznPLoz6/JEsWhWaMO0kPal9COWOPARAYYiXeK7tmb+s
         Gsn2C+neTK/dAtzUrtSIvqEMyP5aYPc5LXsNtaV3kamWhsMRxDmxOJ9suZ8JgBKKs0d9
         vCnYXBpN/EPrEm+mErEv3ofOk222g5yyrSIhY1Id6+9WC4hlr+gPOZEPfF6CIqUj6hSL
         3kLRu/1fj42MlZExdZU72LaVwCwfau6hSsBXswcTRKmyFqopfk1LXZ6lFfPI497x4wgd
         Ir6Q==
X-Forwarded-Encrypted: i=1; AKwUvBxI+yaIPkGQhtb5yQVTkT3NZ7uWbFvsApVgoG9B4FdxIANcNU3rxmxb3BfaSZ9GbdZu7bBZR/h0YKPLQYA=@vger.kernel.org
X-Gm-Message-State: AFuF++nRMhhMsucc7Nu9mDXNWedO+cWWXcRAYsJO9twHvlnZ9suo2x3K
	G46hB1TAtl+vT4iR9GAMV59y21rjyQy63oMXgaW3UwXxMYAsPy2iJmVUGR8KlKRLr0Q82vnqZbL
	CX2dXe2g8RKuYxr/xxML7qgFCGLM/ZGEvdjGMzh4gf7PmedrsaTLJIwq5L87/hX3ilKRhke/Lh6
	4g7Kr4UkD6VPswlvzZRMPng4HrYi2h9ZMv++hPJGeoTA==
X-Gm-Gg: AYBFou3s/6bcDrOSf/wOEta+Z9YGlPeARjmVLiQ/uck8oncRkHt2tIHgW3Jbnh1INW7
	+mvfDsE3H5ZGMYbmEMlaeDfnxo2EJPfQu3lmLm5Tf15kq2I5ROpvZy2GOXT4FuyIjjXADhGSRqO
	FC0pkmQL01bCYPd1nDIqkGBAVkpIa8d2z7bTH+9UKjZeGbKwZ3NQlssXFyWg==
X-Received: by 2002:a17:903:1b65:b0:2d3:716e:e2ae with SMTP id d9443c01a7336-2db8d928e3emr2837875ad.6.1788883821960;
        Tue, 08 Sep 2026 09:10:21 -0700 (PDT)
X-Received: by 2002:a17:903:1b65:b0:2d3:716e:e2ae with SMTP id
 d9443c01a7336-2db8d928e3emr2837105ad.6.1788883821531; Tue, 08 Sep 2026
 09:10:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 18:10:09 +0200
X-Gm-Features: AcwNN1UW4IZJxDfsw72uzKL4GFJXZL8rZaPaQEJwZlE7EQT6AUnNa1eW5qYq8ig
Message-ID: <CAPx+jO9=Jvi0BqzSUSfnY5LXbt8g-00h5pvznL76gOiNzi72JQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mmc: Handle errors from optional IRQ lookup
To: phucduc.bui@gmail.com
Cc: Ulf Hansson <ulfh@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Stepan Ionichev <sozdayvek@gmail.com>,
        Colin Ian King <colin.i.king@gmail.com>,
        Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
        Osama Abdelkader <osama.abdelkader@gmail.com>,
        linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: E8haEZpS755YDg6yT9sUzfiAS7kzD6Q3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfXxTMSCbzcpFhm
 oedfyo5FQYMXymEW3v1AecaVDujnTnT+akE1EhrZL4pYnTRnoywJbecBHMS6iUcNB6QKAMkb3TG
 Bh65Y/1i+8PN2R7abrZx1NMhvMZKy33SNM8HkFoNg1fG/zSPh42dZmux65ne5BF8dTgodSuU9Rv
 MeZYcohpnZdKky0YZI5LhPYPYckmFeF0hoj2DeWUFOZ84KmecdvAjENnv8gDAHi9WEdX/DxUBY8
 h5i5JMPsR3VPRAjQ6Q/ww6LA3MVSCK+N+VLtHcu6drFiWF2912Sv3uzbPEdLS9OmNZfmJwLJcS1
 farc9Jc3HLWIoVyWcRwTxLKb5ULyhR3Z8pbE0awV9/9w2j6Y38EiBtctAzEtVLcQxIm7jt74hAu
 ryA7qFsOwVLmhywESp8yT4IiLySFGTrpAlj+BOj7SwQQFiTKi/+EjXAg2VUyku6vK6elbI6fKGe
 iz5OxBLUgRQHL+Ek+gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NCBTYWx0ZWRfX1fR9k7GkG7YO
 joOOWgWylJ/l2LfWOdz+/M627COoEcalSB/Vw+dC0++vHDLSedfQyXsFPZS/SATpa2o561sdOAc
 e7kiPX8BBK1vllqUnjNVaDsPVEtWoHs=
X-Proofpoint-ORIG-GUID: E8haEZpS755YDg6yT9sUzfiAS7kzD6Q3
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa03373 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8 a=tukmojBuO8YyzP4fvAEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080174

On Thu, Aug 13, 2026 at 7:34=E2=80=AFAM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> Hi all,
>
> This series improves error handling for optional IRQ lookups in several
> MMC drivers.
>
> I noticed that mmc: litex_mmc handles the return value from
> platform_get_irq_optional() correctly, distinguishing the case where an
> optional IRQ is not available from other errors. This series follows the
> same approach in the affected drivers.

The series looks correct to me, but someone should really look into
improving/replacing the platform_get_irq_optional() API. Callers
should not have to check for specific error codes as that is just
prone to problems.

>
> Changes in v2:
>  - Use parse_fail for proper cleanup on IRQ lookup errors.
>  - Initialize cd_irq to -ENXIO.
>
> Best regards,
> Phuc
>
> bui duc phuc (3):
>   mmc: meson-gx: Handle errors from optional IRQ lookup
>   mmc: davinci: Handle errors from optional IRQ lookup
>   mmc: davinci: Handle optional IRQ return value correctly
>
>  drivers/mmc/host/davinci_mmc.c  | 6 +++++-
>  drivers/mmc/host/meson-gx-mmc.c | 9 +++++++--
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> --
> 2.43.0
>

Applied for next, thanks!

Kind regards
Uffe

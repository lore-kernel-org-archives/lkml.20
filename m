Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A54CDA37
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789501864; cv=pass; b=HGva2N6JFKO09rv1kSz4n4KmZnQVtZenA24OxV5FQo7Ei/Eaz4/8pa2x6wGQxN4iDVA0mxQmZQQjP9GQycj8djgMvQr09L6OGwomOphzM0/gEbkjshsF8aE/sA2TMevtriTra8AAjCThS/ZYdIwKhLWEVDtBuG+n/GG/Cx3QPl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789501864; c=relaxed/simple;
	bh=FUwg6XjajQjGsmrre6VttvQlp5+n4TZ827GwU4bfF+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gXWIpxQZY/ArTy0gDyzDVNKtRS7EzB7JrpELC2HxlOCUrfsUJxAkWQUCeUSwygFOa8FqOtQwnRhXjp6pblxGPkDlsGOwZCPRBuWnvriTv/J3zqw99A9p7rXMa3Md21VZZDFKD961ks64J8miaFZYnPyD5XJkxDJXmg8LxbBq7yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=plMI7lkF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e1ZEId63; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="plMI7lkF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e1ZEId63"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FItepp377363
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JhFL92UINu3XNQxTrWe0TihoQ2eCwHv0PR3Nl3Ejo/Y=; b=plMI7lkFLVw7Ykwx
	zHY5al8PNAL3rlNvnMWzIvXaKNxX0xIQbwQqiHddAvM1qf2BaiZ8hvNJ87XH1eQW
	hdNje+6vG3FOlAwZqDBX254QW1jZIMLUWdanBUPQRTc7qcarUIAofO4QjeelxxD2
	F12dL1xM+x5IJ1hW8hEsmtUDdu8m0V4sAGot2rcXBZS8hM3XS7bEi8ofqbWKnI4y
	5A8vGikIHq25Dh5Hc6iVrBZ+PkTG7vgULfvaNkdSubrnKz5madnQA/GHKMjLDrLM
	70dlWbMR3eAMdPd8TxlDpa2wa4rZPrO1uXME915AYvG7+tswcW5KoST3aRAKKp0K
	lCuxbA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9rma0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:51:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e87478402so123630806d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:51:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789501860; cv=none;
        d=google.com; s=arc-20260327;
        b=GRK7e6gC+D1Xdg3nAfTmDmV5bCex7FvwVU4KxrnuvIIAnraASpu64+4ghkPP7ZM9cA
         CmdvoH0Unh/Yz5vpJIHObqeIQtQiLa5EIviJ97VDJ+uJX55ERXKAS8uDj+7mdumYBVib
         cH6r7LqH6NuuywyUTx+Y26ZEvbaOfwbMesk4kcV/huSco3yrwba+sB+QkZXXTpSuk234
         +DU3k9+5Ssy9zaSgpzMtTNFG7vNiIY8gmyM4dgkimoXg6EOauSJPrAa11/lhAmICaL9A
         0ly9zYKRnkJZZKjgmemrTIiiXijEpo79Jl9/U8BIynuVzn0xXi6mboQrMFM87vvYAu0u
         d9BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JhFL92UINu3XNQxTrWe0TihoQ2eCwHv0PR3Nl3Ejo/Y=;
        fh=Oed/forcyKJZYc31DpQouZikxiSU9DC+tlYF2izWhv0=;
        b=MNyJR45P/3mRIidEdxfUY4yTm7bvq5I+Ba0mJ4XB8ENEH6IiXlYuyvM2SmgL/gzfY6
         fGpx8Zv4YxJUxvLbYj/RrNLqovCtbkKlAzt7tM37neYAJEw07MRjhG/xp4EutC1f46YC
         A3NYv2vKMW60npmvx9gwyAcGnSygyQE6C3rdpgJqNdAWGbFxpI/66yxsRbF5Uw5D+FfP
         VYNKwidPbZNRlfiL6ij2KauTiVcOomfuPDm7CizmrrjpN5VbiHCFvR2/4u4k1006UPoW
         f+QycZm3fIxi/uAP0uUzxe7hq2Q+g6ZTtzQj8z7jhe+UG/WGMK5ndKJOs8Y2+q7RqRXo
         4xKQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789501860; x=1790106660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JhFL92UINu3XNQxTrWe0TihoQ2eCwHv0PR3Nl3Ejo/Y=;
        b=e1ZEId63ymbGsmrelR+hKwBJ3Ra2XCbZF11rVebufnGApu/5BGWUKfr2y3K/X+rdsq
         0n9So9ywK6lGdcy6tJoqv/VxnMJnKEERfDMyxXc9rae9BLGHbYLD5zDFfMxBrJB0eDye
         NmHYF0jGsYgusLNNPoyFVBa6fAAepAFHqobgKy1O/T7BOJWyiZyE1smEmZspFTElUDdG
         t+R6YOTVdBCn+QLqGFzI3ykWuZFGYjmgaNdnTZUVkmDLrAVhIwSRSMxpcvl+tj/UNRYq
         RFNjkH8dwa5G/n5jg69FicdT/vphvy5RqHkZSjO1Dlc0l2bkdv4g+aK55xD8Ujm4VF4o
         X/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789501860; x=1790106660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhFL92UINu3XNQxTrWe0TihoQ2eCwHv0PR3Nl3Ejo/Y=;
        b=ADrGHbrXWqsq59OYH+EkMCzqEnunWD+KeRAqSOW5o3Z62C6KpRg1e0TV8kWouvNne5
         hfoG9mv86HnGucC0CpPGjO2Tj1HPngtiskFiGJVFeB0LX7MCV1E9r71j7Y6BStr4Oxc6
         W0h1n4J7m/fliOtopsZH5F5EIPAkgjWCFlUD6jAYITw0A348JyO3GcGsAoxzPQSHIjqs
         DVZjT3B084yEywDgrXIe0LTcL0/FYJDLallW3OgBQ+whrtpIZAczZ98KP9i5tNwl2K3y
         k9S+GYxzd2AAZyJ5EexMM9X5ZUs34MCS62vKHteIId27wvGIPJWcg+KXJd/UE7oTxa8f
         nqQw==
X-Forwarded-Encrypted: i=1; AKwUvBzYfkydSqqc5bp8Aq/hoFDfFnKLWoGamWYk/Y+uqZie053xHx7sfJVYRUuTXvZ057yPQnlfSrt6C5tAD3A=@vger.kernel.org
X-Gm-Message-State: AFuF++kcNtyS7FiVCLGjfMoUOBzjZwNGlO6E14/wNzm7xnVIfByuf0r7
	6EDg+1bdujrMnsxgyNHvjuIE/MO1UF5rcdVdwl8Prb9aNy7GMc3VH9XPKkSv1SUKPmtcP0/wJgC
	i01oCK7zZVoiPtFJ5p78+TwGh7MBkhI7iJj98lqBRMlXdVcmG1olDjClhHTO5uwXi/qNvJjEmfs
	hxdcup+kdKdE50KR4BU6dwXcZewtxCfhNMruCXOxf5PQ==
X-Gm-Gg: AYBFou2xg+PiAr74Ytjx+/2nVf4vqtKccvTI4vuNyiO4FcgojTzRem+kMVempnX/63W
	/jU/wqnDVTfMaNgYjlFbflxVGnUBrtJhfp600SEyJJzTN4jrt/RkUiCrNVQgp3UlIRc8eRquh+R
	u5kV14E+YR9mI2gVTBo/0PeVJUT+MJLLBHONO5Rg3DwXJ04SeWmDDO2DYK8mXpu+/1HsoWjz8dJ
	k6tlWPlFxQFKdq/XGiko+FXKF9RVKgClKGvWKlbkPqQEE/wl30i2ckFZjM/nfZbIpPowb0bLi34
X-Received: by 2002:a05:620a:684a:b0:939:de48:e41f with SMTP id af79cd13be357-93a299fbf36mr230179885a.31.1789501855324;
        Tue, 15 Sep 2026 12:50:55 -0700 (PDT)
X-Received: by 2002:a05:620a:684a:b0:939:de48:e41f with SMTP id
 af79cd13be357-93a299fbf36mr230174385a.31.1789501854864; Tue, 15 Sep 2026
 12:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-wireless-wiki-v1-1-21dc76684b44@oss.qualcomm.com>
In-Reply-To: <20260915-wireless-wiki-v1-1-21dc76684b44@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:50:43 +0200
X-Gm-Features: AcwNN1UG4aLAs-6JwmXreveEl5E9RX4FKTRV7xm_yKBtahSU9d4fR51NVVjV104
Message-ID: <CAFEp6-3zTF8QAUybP-V3XdwrTmygHz2u=ATYfW4Bwm=gmF6mnA@mail.gmail.com>
Subject: Re: [PATCH wireless-next] MAINTAINERS: Replace wireless.wiki.kernel.org
 links
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9a1a5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=VwQbUJbxAAAA:8 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=stkexhm8AAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=mK_AVkanAAAA:8
 a=QyXUC8HyAAAA:8 a=1fjn8X1m2MaB8J-YM3YA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=pIW3pCRaVxJDc-hWtpF8:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-ORIG-GUID: 0Ma6jHm9NxndLfcRdzUFK4W5u6If7D6A
X-Proofpoint-GUID: 0Ma6jHm9NxndLfcRdzUFK4W5u6If7D6A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI4OCBTYWx0ZWRfXyc90VwvGrBN2
 jf4dqZ3/kGa5UN9URylbrnWRmRCyP60ujreMDdbmkVpjslbPcCT5o8B1vy/zReMxdwUmw7AAi22
 k5/CGogew16d0z22mhY3hkzPuTYhafzK5pOjnGnHmPUHOS99oUJkYx1J+RamVV4XYjxkD275m8k
 bUdh9yn1g6V7kLn9FHnToC2DnQ4Q4UK6rfMOjCqk9fYjlBr5R4m4oTX4UMPS13Ir5/RwnmkMQbg
 bmC+wVD45fxRhhi4pgyeoRlhrq25vp4t8/BKxY0zXH5EiaOB2SMLm8GrnLw9LC9r1EhN3KNeG6y
 UcLP3hBzXI9dD+zvyMEoNaf8NDddr2/IZq5eFoEXi4nUOpNqTPLK6pNHVniQpOw5WDznFcaESMv
 BhupPZjTWwB2d6hn8AOkvAF3gCdsCzKuC7Zn6jDPZnPkOiH1eDKv7KrpJtttFTdB2VSuyKbt9xs
 GWhvQpBkceUXUBGH0ZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI4OCBTYWx0ZWRfX/xw3m3XlPmqk
 A93dob62GqdedT+voju/++1jeKsl9aoyMA+FlvpioY2buVto7riN1SUIncTzfFHhQDRj3fanAzb
 UfWII3jSU6spDQVykFQ44gOgWb3leLc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150288

On Tue, Sep 15, 2026 at 6:57=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> wireless.wiki.kernel.org has not existed for a while. Update all links to
> point to the current rendered pages at wireless.docs.kernel.org.
>
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Checked the updated links on wireless.docs.kernel.org and they all
resolve correctly.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  MAINTAINERS | 40 ++++++++++++++++++++--------------------
>  1 file changed, 20 insertions(+), 20 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b23fb6f2f4ef..f6ead73ab92d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -113,7 +113,7 @@ F:  net/6lowpan/
>  M:     Johannes Berg <johannes@sipsolutions.net>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/
> +W:     https://wireless.docs.kernel.org/en/latest/
>  Q:     https://patchwork.kernel.org/project/linux-wireless/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss.git
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss-next.git
> @@ -4260,13 +4260,13 @@ M:      Nick Kossifidis <mickflemm@gmail.com>
>  M:     Luis Chamberlain <mcgrof@kernel.org>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/ath5k
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath5k=
.html
>  F:     drivers/net/wireless/ath/ath5k/
>
>  ATHEROS ATH6KL WIRELESS DRIVER
>  L:     linux-wireless@vger.kernel.org
>  S:     Orphan
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/ath6kl
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath6k=
l.html
>  F:     drivers/net/wireless/ath/ath6kl/
>
>  ATI_REMOTE2 DRIVER
> @@ -4535,14 +4535,14 @@ B43 WIRELESS DRIVER
>  L:     linux-wireless@vger.kernel.org
>  L:     b43-dev@lists.infradead.org
>  S:     Orphan
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/b43
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/b43.h=
tml
>  F:     drivers/net/wireless/broadcom/b43/
>
>  B43LEGACY WIRELESS DRIVER
>  L:     linux-wireless@vger.kernel.org
>  L:     b43-dev@lists.infradead.org
>  S:     Orphan
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/b43
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/b43.h=
tml
>  F:     drivers/net/wireless/broadcom/b43legacy/
>
>  BACKLIGHT CLASS/SUBSYSTEM
> @@ -5919,7 +5919,7 @@ CARL9170 LINUX COMMUNITY WIRELESS DRIVER
>  M:     Christian Lamparter <chunkeey@googlemail.com>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/carl9170
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/carl9=
170.html
>  F:     drivers/net/wireless/ath/carl9170/
>
>  CAVIUM I2C DRIVER
> @@ -13560,7 +13560,7 @@ INTEL WIRELESS WIFI LINK (iwlwifi)
>  M:     Miri Korenblit <miriam.rachel.korenblit@intel.com>
>  L:     linux-wireless@vger.kernel.org
>  S:     Supported
> -W:     https://wireless.wiki.kernel.org/en/users/drivers/iwlwifi
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/iwlwi=
fi.html
>  T:     git https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwi=
fi-next.git/
>  F:     drivers/net/wireless/intel/iwlwifi/
>
> @@ -15661,7 +15661,7 @@ MAC80211
>  M:     Johannes Berg <johannes@sipsolutions.net>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/
> +W:     https://wireless.docs.kernel.org/en/latest/
>  Q:     https://patchwork.kernel.org/project/linux-wireless/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss.git
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss-next.git
> @@ -18920,7 +18920,7 @@ NETWORKING DRIVERS (WIRELESS)
>  M:     Johannes Berg <johannes@sipsolutions.net>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/
> +W:     https://wireless.docs.kernel.org/en/latest/
>  Q:     https://patchwork.kernel.org/project/linux-wireless/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss.git
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss-next.git
> @@ -20592,7 +20592,7 @@ P54 WIRELESS DRIVER
>  M:     Christian Lamparter <chunkeey@googlemail.com>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/p54
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/p54.h=
tml
>  F:     Documentation/devicetree/bindings/net/wireless/st,stlc4560.yaml
>  F:     drivers/net/wireless/intersil/
>
> @@ -22282,7 +22282,7 @@ M:      Jeff Johnson <jjohnson@kernel.org>
>  L:     linux-wireless@vger.kernel.org
>  L:     ath12k@lists.infradead.org
>  S:     Supported
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/ath12k
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12=
k.html
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
>  F:     drivers/net/wireless/ath/ath12k/
>  N:     ath12k
> @@ -22292,7 +22292,7 @@ M:      Jeff Johnson <jjohnson@kernel.org>
>  L:     linux-wireless@vger.kernel.org
>  L:     ath10k@lists.infradead.org
>  S:     Supported
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/ath10k
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10=
k.html
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
>  F:     drivers/net/wireless/ath/ath10k/
>  N:     ath10k
> @@ -22302,8 +22302,8 @@ M:      Jeff Johnson <jjohnson@kernel.org>
>  L:     linux-wireless@vger.kernel.org
>  L:     ath11k@lists.infradead.org
>  S:     Supported
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/ath11k
> -B:     https://wireless.wiki.kernel.org/en/users/Drivers/ath11k/bugrepor=
t
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11=
k.html
> +B:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11=
k/bugreport.html
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
>  F:     drivers/net/wireless/ath/ath11k/
>  N:     ath11k
> @@ -22312,7 +22312,7 @@ QUALCOMM ATHEROS ATH9K WIRELESS DRIVER
>  M:     Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/ath9k
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath9k=
.html
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
>  F:     Documentation/devicetree/bindings/net/wireless/qca,ath9k.yaml
>  F:     drivers/net/wireless/ath/ath9k/
> @@ -22654,7 +22654,7 @@ M:      Loic Poulain <loic.poulain@oss.qualcomm.c=
om>
>  L:     wcn36xx@lists.infradead.org
>  L:     linux-wireless@vger.kernel.org
>  S:     Supported
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/wcn36xx
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/wcn36=
xx.html
>  F:     drivers/net/wireless/ath/wcn36xx/
>
>  QUANTENNA QTNFMAC WIRELESS DRIVER
> @@ -23413,7 +23413,7 @@ RFKILL
>  M:     Johannes Berg <johannes@sipsolutions.net>
>  L:     linux-wireless@vger.kernel.org
>  S:     Maintained
> -W:     https://wireless.wiki.kernel.org/
> +W:     https://wireless.docs.kernel.org/en/latest/
>  Q:     https://patchwork.kernel.org/project/linux-wireless/list/
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss.git
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss-next.git
> @@ -27508,8 +27508,8 @@ F:      drivers/media/platform/ti/vpe/
>  TI WILINK WIRELESS DRIVERS
>  L:     linux-wireless@vger.kernel.org
>  S:     Orphan
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/wl12xx
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/wl1251
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/wl12x=
x.html
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/wl125=
1.html
>  F:     drivers/net/wireless/ti/
>
>  TIMEKEEPING, CLOCKSOURCE CORE, NTP, ALARMTIMER
> @@ -29386,7 +29386,7 @@ F:      drivers/hid/hid-wiimote*
>  WILOCITY WIL6210 WIRELESS DRIVER
>  L:     linux-wireless@vger.kernel.org
>  S:     Orphan
> -W:     https://wireless.wiki.kernel.org/en/users/Drivers/wil6210
> +W:     https://wireless.docs.kernel.org/en/latest/en/users/drivers/wil62=
10.html
>  F:     drivers/net/wireless/ath/wil6210/
>
>  WINBOND CIR DRIVER
>
> ---
> base-commit: 85437f88642d72cb82e5707918dc4da95c2653de
> change-id: 20260915-wireless-wiki-aaa49b49372b
>
>

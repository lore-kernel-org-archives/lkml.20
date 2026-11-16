Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847291;
	b=SzX3bZY+hY1d/uGo1jyELaJw2LwyBbj+rduXiFJdJ3yn9Y3rUJpY3i6dDa4FMJqPFu0L
	 3oSWtrSml5Fflkan/OzsfyYqQ5RaQngbPZHwyh1/ogoWUjgVAwURPx8h2DHAe+uKlDxzU
	 GBXG1liP5sO6MoFx7RJbjSXkrDQxD8BAEqvpot5w4r0t3zEJVbN8mfjx5t/ypshArMjal
	 qBL6OlP6fFdpjB2xBBt7Shj9u7HWYSt8V27aE7YQfQmv3zOEQu5/KbaxvioOawifmljbu
	 ZC8mc+WhRLMURpdpehTvAzwn460/xrgFsdComh7cQD+BCAvng9hkCnIID/UBOKn6F1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847291;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4qZkLMxYkgUaxwhWD/DbkSL4PS0JBXcFsajsekbEWek=;
	b=0JNNP26CIOx5nJQ/81APRmi4dz3QFBU6+0w+ZFt4ieLK6DR/9PWban6JN1BD7Whz8cr8
	 lCHD5xCQHEwwp8FfqX4QXP9woouSVpAYuZO3yYJSfrbAMGkTaP0tVVv3ee0seVyQeJLS/
	 peGezCSGND+erTu6dMHAd7GBFOJ3NYFlAs7Vuc45aUwiCld/xbNUvMTqsKw53MIor04Me
	 6U6RMUS9wM1MnYRyZkSkwG54Yhtntadmag/2SHzyh5WnEIc5VHnKzbv5TBDvUJHIisZSo
	 SjQE0TflI6yS/L3yHUaGHfwdBBJ29IPdYHq4L7P6GVhmFgAuJNF48IAMWtiXamlGRKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hdgMF+NQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQT91hEi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EA5606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2EA5606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hdgMF+NQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQT91hEi
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGK5ie3692944
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4qZkLMxYkgUaxwhWD/DbkSL4PS0JBXcFsajsekbEWek=; b=hdgMF+NQZkdok22p
	J6V91c1iTQKYBMuU583CO+qwTF8p14sGxX5UZJYMWPNi1XnOVTbLw2NlK9XlG+Wh
	NlyPiwjXl2Yt8P8wJB+hyk6ilZbCqvvNpOWU4GTPBqCLgwQXWx/jbFZAZsuXwcl7
	OaOvE2zUeNQXnu68HUNqHUpzEYJ8UZQU+u9Ngbt8AjRITg865x7+oavU5TTTERpT
	q+DY9gM3S+pvafoPt/yYyclOaf9RlLsfh2vyyB3mYoJ5fWg79EY/t/wqtSWneoJv
	y8gKOYcBex9EOudDoz/cfhSiHvMjVDYAss1R9Ul8sDM86oL+lsA5I2gxCpwGGMP1
	P+ZmPA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f812tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:41:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so717130785a.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:41:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847289; cv=none;
        d=google.com; s=arc-20260327;
        b=CRLQvGjzVEkqTnevqlUJzG7aSGG0HzPIINMFQ3a1RbLpdONz43po/D9mNC8Iz3z9uh
         coVxLJfmoWpSXXXt2zQ72CAXkmIzRpi4W6aG0lqfQCbfm/RtrSB7gI/BndnInim+5/PT
         GCs6SDXxgbQrJ6mCuF5ooiYrI3aSPLfvjsvxaZVqzrpam/KFYHxE4Blws7A7FHdFQ16K
         y3KJTz2EwsSJ5L3BPmCtiDxW+sR7Fu6ek2P4NOQQzJQQxfVdJLkA7cR0X4ttOvMA/oYE
         dqhBeoUp61helFJ/M5Z9Ic+C/Lj4ECBfCHbl5wFebcC6rwLuMJPGvAwN2u3ojmM0Ln4o
         OdSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4qZkLMxYkgUaxwhWD/DbkSL4PS0JBXcFsajsekbEWek=;
        fh=Pn7lvUTeWPzM5u1u/gBSxUbLAgRFXxNBs71CUggh2g4=;
        b=f/++Hp2oyfvWqD95FN7waQjtRKZFo9udvtLf+wpiZtZ/9wh5y7IiGpN2zPdw4iqlO5
         oehXHCh+32iUBNwTuHP0ahK7C9jOgT7Q5caKYhjhF9rEzxqeYrrjayfxthtWjLynLHBe
         MYlLtSMBWvWbfpmjBiLN/oCtkYhvkrGsfJ5YY7uCspyNkFcP11qOJNEr8S2ZnD+H2O5W
         VRonBGNL7u1QCfVwQFL3Q/x45yXjClpGvaODDlQcQ4W4eA+EQi70RIvZHOp2H+MKc0Bn
         yGxiyPFaqtymtZZxYEEiZIgBwrRxCQ1dCgm5blIR84gfLWqMSC2bFuIbbKahjgJ5v/RU
         L8WQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794847289; x=1795452089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4qZkLMxYkgUaxwhWD/DbkSL4PS0JBXcFsajsekbEWek=;
        b=YQT91hEi1mgvC7LHU9A5iqE/RkiCDzcB8l5VCZPHtE2UAutrA2LWHKYjH23ni4LkYa
         f8oMN+MNHf3SeV+ZbuHBf3bqpZZKsKBWbDzy9hrA+yaegimxMZRQxUjmVQJ2MZwPPRaF
         tzuyR6vwMy1y+GUVm9mn8LiaGLjGQ4RiLBlqYk/c/m8Wg0r705o5bps2u70dsvf9fbZ1
         bKG49NF5/6vKOHN7AhoUfgP97rUHjhWa8bMl/wEnBqcTPVs6zD5ELmBcWlUWGBUG7A43
         K1hxi5dggQhVrc0uo9MFeeon6BqGyKmAmeXjCiJM/VAGYi/mpzQL1wFCRmxev3H+1lAr
         SU+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847289; x=1795452089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4qZkLMxYkgUaxwhWD/DbkSL4PS0JBXcFsajsekbEWek=;
        b=249W+udqlE1K3Yrr+qJoAkxieeo8wk672061wHkWKnhS/AKf7pgFVCpnG5CEBC+QkP
         lLsndcuIbD8doMfBpY/QCU4Yj0Hft4OJOb15FfYcQkWXmWSRhmciXQyXth2HGA/7U+1M
         ngzSJUFydFjj/l5Wb41lqi4XW+CSSMTEGEU+qbN79KeSz1rdww3ev1eob3NziOpvMY2U
         tlwfxeDTiX3i3ZtDv2hgmT3Pi26dWaXc0jvEVzgj3dKCGh52pqFRO9SIX1DbHAZitUf6
         PDZQkOkGI58Xd4Zcd0hREFHxKlEdyPeLF+m6BCh4MCG5DlTwOhefkUJYCzPPbm3ZQLgB
         VngQ==
X-Forwarded-Encrypted: i=1; AL+hErF4Mjnrgx+vFRz/qOVnQ1qPW1zM8P1uLBECpdG1Yn9j9xxGMa6KWY7kAEJCUx+jLovKBSnQA+1vA8KAE4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BTKbpuATOc9j515xMdCWR1JOFb5b6EGUkyi7iZV00v6CsYYIN
	ixaUwxArqDj1lsKMj6edU734ClVOX9PQP3MC984YW/r1hzohaFCQH4dMumoqw7QKtsuLNHkBNUz
	/V89lMS1utMy5VCOhl4Q1s73NKlDj0IWuPUPrxVqX0+H6pliXQFKIrdnY5AkWkrL7tkgOi8TheS
	rxZ+zrVTD2yt+5LlyzjTQoImCvWu/UkiRWKyDJgpY5WMISs/aMudmV
X-Gm-Gg: AYBFou1opBNXO3huKXPYUJmZqdlSUw9p1wBtDoPfEn2waUKv1ZX2gXvrLPtYtCZk5y4
	o4XrU3VR2bnWfHL2qKK1EnoI9sqL8mNa6QJZj8hwLqPx3a5PLOzJRM28rOhTZJvGc90nPivB9W0
	euPHumgjXEyrfyY89qAv9mn/69Gw2MsLkqHxp821nE9w7CFvL9F6XIT1c6unoZ6BPp6uPsq1NFC
	yFDY90HltISjQ9UYYKLvK/61j39gwrPPr2Ge2gq/+aSyZpl9zsIFWneL7KBIWmYbsC2lJHNusN3
X-Received: by 2002:a05:620a:4012:b0:93e:6f43:b2c1 with SMTP id af79cd13be357-9494bb85888mr1819995285a.16.1794847288713;
        Mon, 16 Nov 2026 08:41:28 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93e:6f43:b2c1 with SMTP id
 af79cd13be357-9494bb85888mr1819990385a.16.1794847288180; Mon, 16 Nov 2026
 08:41:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179467295518.97469.12346516231160594592.marvell-serdev-v1-0@michaelmcallister.org>
 <179467295519.97469.5747232754111917783.marvell-serdev-v1-1@michaelmcallister.org>
 <179484691454.54083.14464729860702732145.marvell-serdev-v2@michaelmcallister.org>
In-Reply-To: <179484691454.54083.14464729860702732145.marvell-serdev-v2@michaelmcallister.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:41:17 +0100
X-Gm-Features: AclHuK-gWxq45ZclJ4O6NsxbJ6zdZFq59VI-w6TmYe42xNuv57HyC9kyCgswmyU
Message-ID: <CAFEp6-1CG9Hah3uobRG1ZHQsmuN0JGhmVg4cXgbrDgz0DWBVgw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: hci_mrvl: Leave the serdev port lifetime to hci_serdev
To: Michael McAllister <me@michaelmcallister.org>
Cc: markus.probst@posteo.de, luiz.dentz@gmail.com, marcel@holtmann.org,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX2qkAANNU+sbi
 fyJvct0o5zxIuMy3jxJTWbPcCLrNeSXs1S7IOTbV98dp2csD6GaqkkLWte37UmllwSz0Tur8qjf
 5vkesOwapgHhOambm/pEUuejk18pSQjSfjAkrbFlWFdYsKhW8xOkgF4qxiZQMNqgmGwragrjBpD
 dIy11THtgcuMrE2m4sXCyu76TBG+v1ZLBXzOR+Vzg/lC0XMXZibrfZDG1rCV8uVwDJhpIxA/nDg
 DZIQfsZKHV7c4IIwz4D74IaSOmYLPiw1Dmrb59zmhLpVme4nRujgca6i2hIM0X2ZKXOEtL/Z8Ip
 bCv+lCHWGtOlvEJKd1n86aQEDpWrWLkci0IKYxdOjquRaSqbX/8zBXUGI63IH3AHgNxW0sIbSnk
 RqTuBgOhKj6YRAHPUaHMGpyxbtHS3yWnLitdhAQM3CNGK1yfTb5dmysUI6LGuZIcuHOlxT1Qhxl
 3j3oN6NPyzwkw/xP8zA==
X-Proofpoint-GUID: emvhdFiSuAQYM17CD_qCvsKk8cohxVnD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NiBTYWx0ZWRfX5UJbaKqmQSA1
 qRznwdYzXgquO5oTBHI/0wv96ZnHLdpeC+KvRRlbAGZupq10oy0u1cjfn2Y5RLLn0q+n9eRHaUT
 C9hllcS6aTmje+zdt4OAyaz65bMVIzA=
X-Proofpoint-ORIG-GUID: emvhdFiSuAQYM17CD_qCvsKk8cohxVnD
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb3239 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8
 a=r5qjpY2wa2NEgfoDGsAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160066

On Mon, Nov 16, 2026 at 5:36=E2=80=AFPM Michael McAllister
<me@michaelmcallister.org> wrote:
>
> hci_uart_register_device_priv() opens the port before calling mrvl_open()=
,
> so Marvell opens it twice. Likewise, mrvl_close() closes it before the
> transport closes it again during unregister or registration error cleanup=
.
>
> Remove the extra calls and let hci_serdev own the port lifetime. This als=
o
> avoids failing probe when serdev rejects a second open with -EALREADY.
>
> Fixes: be70e5e774a6 ("Bluetooth: hci_mrvl: Add serdev support")
> Reported-by: Markus Probst <markus.probst@posteo.de>
> Closes: https://lore.kernel.org/341e56b1ff7d8a5b109e26e30dfed61faa54d603.=
camel@posteo.de/
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Hi Markus,
>
> This just drops the non-standard trailer that checkpatch flagged. No
> code changes from v1; still looking for a test on Marvell hardware.
>
> Thanks,
> Michael
>
> Changes in v2:
> - Drop the Assisted-by trailer. AI assistance was used for v1.
>
>  drivers/bluetooth/hci_mrvl.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/bluetooth/hci_mrvl.c b/drivers/bluetooth/hci_mrvl.c
> index 5798a8db0..def19907c 100644
> --- a/drivers/bluetooth/hci_mrvl.c
> +++ b/drivers/bluetooth/hci_mrvl.c
> @@ -57,7 +57,6 @@ struct hci_mrvl_pkt {
>  static int mrvl_open(struct hci_uart *hu)
>  {
>         struct mrvl_data *mrvl;
> -       int ret;
>
>         BT_DBG("hu %p", hu);
>
> @@ -75,17 +74,7 @@ static int mrvl_open(struct hci_uart *hu)
>
>         hu->priv =3D mrvl;
>
> -       if (hu->serdev) {
> -               ret =3D serdev_device_open(hu->serdev);
> -               if (ret)
> -                       goto err;
> -       }
> -
>         return 0;
> -err:
> -       kfree(mrvl);
> -
> -       return ret;
>  }
>
>  static int mrvl_close(struct hci_uart *hu)
> @@ -94,9 +83,6 @@ static int mrvl_close(struct hci_uart *hu)
>
>         BT_DBG("hu %p", hu);
>
> -       if (hu->serdev)
> -               serdev_device_close(hu->serdev);
> -
>         skb_queue_purge(&mrvl->txq);
>         skb_queue_purge(&mrvl->rawq);
>         kfree_skb(mrvl->rx_skb);
> --
> 2.39.5
>
>

Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0A4B486B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789056343; cv=pass; b=OVp2Co3R6EcPNX9QbVNCoyP5IazxR7gYr6rd0jrJI4kAO3O63q/Tj6ZgaRJlh36LEn3yx0UleLDNecdiNejq93EVC5OCWk+Nx0dOkwLzef1W9EPbIsY33H4FlAtAcxuJs9ksd1SR3bjK6HXDZiPc3CIrhoWXnJXaF/OnIFSl/JM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789056343; c=relaxed/simple;
	bh=3oay50WY7oA0cOuOst6u1rwKL1yGnwSpPSeA2dNG1Fk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JEA6qWVqX2l2rJoDhbo6o5qTdVsDulVJOg8H1qv5d8HrLEUm9qeC9eGuAiMI2i9Vx/+x6R1gDdpVv5yDz5pRWyu6spCOyLXvC3IOLC4S5k0+uJeEROlsd/96YGiEAO9OMO+WBiWc/7FPLw3YPvBLl0ejDMTP7rNZWroXsfWN27M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDMfWZSg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZ2xIQpU; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDMfWZSg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZ2xIQpU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4YkY1186643
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x22SVoUj0EMbaUzbs6EY9GWgQ3tV9w77TMiRTqsjhJk=; b=cDMfWZSgrgV39F7+
	pYOCoFZekczxkQzOAk7trY9ys3i0kyXPkz/DUY0YhltgFwxCz2cLgMn++aAJ9GCJ
	9Yt5zGiYC7IPyvHSHmrYqJEWasgmCM9AnX4bgBUiIGv0JiDJVOHbm+ePE2V1BlmL
	lEWQuTtk3gH7ovFYF1+Hb05/GbgQjFCBx9Z3AAbQ+owCS4asHUEKuor335KGv1b3
	zTLrVmrs3DlkYrQ5g0xtbXifMxhefMyIUkWmY1ZjF4SA/JeEZ4V59DUrZJIeBsZF
	j+y9peptrpesJNbru361cEx55VcxkXH98YRuAdPyl74nY5Gear2EcYHCaMmMzRlp
	wWOUsw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkraka9dk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:05:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a63cca6ffso831973b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:05:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789056340; cv=none;
        d=google.com; s=arc-20260327;
        b=ixDDBZ51IESsa1UREXBobD0AQ7GIwoCntwMLo40ka8sYuEiA8Msj0A2cyhCW7i0wj7
         EBP4HDhYcdRHvmDEdWH/40deZM9lLHn8UqY63y0pHrRObCyn9tzc8Jbv53iaMvnHHd+r
         8PyArh4mXGWmQVYJxU+MPEOMZkYSaZK/goZDyOwYn3VQkpA28j6WJsY0vzjSEi7gkxcG
         zCJj9CVIDTas7xGZt4mKPQ+H45LoWqD+IMYS/u2VkYjyUXZG8FpWq+eC9cMFFv5NDRBa
         4wZ/iEctzKhVcehk9VCfiaRj6Jq4sgrKeH9BWb+YFfVVyBE24L+E/LrYeKNHQg8HL2KN
         HLWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x22SVoUj0EMbaUzbs6EY9GWgQ3tV9w77TMiRTqsjhJk=;
        fh=fms+ZlEU0Pw15vK9kKAWm0kfZnmqPit2CG9NE9XeZkE=;
        b=oJfN+ToM4rwPgbnAI3RDKP/HIq9Ce05tr4Ygvk4oEuMLEukC6sUntRTld3vodT/mpM
         QjanZmiOVHzmQ8JIXcL5mfbluP1/4A/Orutzi20xo1SbUNP+60seuCHFUSTM8JyNgD5k
         9etT8wUYnVmfhhcHDkxsW+B+ePgOTeVgv/vMTQTqAkFnysmzy0CZNJhc6DjARMNQ3Dej
         Gffc4CIdV59pjySroNo2XVRkjJ/qNsuSVFb1B7xG/fqyQiRSZ9neGJNTgK0uIp3YFi1a
         dTQlT8KJJ4w+AOsMv265/VW+JVOSHj0V16gAk4Kzkwf1Le19s3RujIFJJ+RLb+7uRcwO
         qHcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789056340; x=1789661140; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x22SVoUj0EMbaUzbs6EY9GWgQ3tV9w77TMiRTqsjhJk=;
        b=BZ2xIQpUizPlLuDqad+vn5TdgnBFJ+T4R00V6+umWf8x1oUZmnJN9DTU8pwOA+jCY4
         QancG6aHfGgUFIbe1ymABriXUBbl8/s14Q6nULRauUSGUP6CUHBjMF49LnP5Oegn6akr
         qnSY/ak8jPWTV7RbZkq8SCm83l7NQh51CmCWjlIExixInCqML4ao8Di+fsvuYy6SbNka
         gPc2tMqCOXPNHj1n/4vB9sn3FFhO3TdUp0FVQz2HYguorbEJpG1F327T35AT+n+8EzlJ
         Ju6JHGikygM2hYXxKAJNqb/C4W2RTf/a6HJrwipqY6R8eZOq2Wvgl5entn/coZkhTLQI
         P/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789056340; x=1789661140;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x22SVoUj0EMbaUzbs6EY9GWgQ3tV9w77TMiRTqsjhJk=;
        b=FbXeNg8x7wR0xJj8gFw4MYm89ZvtY2/iMDi06UpCW3BAxE+CobqDOlffGOR2j5jtzv
         gRuNC30pxekxo4gFgsDGRbG1i/feN2QxiIf82BBIIeRwlm30LcK29AMF07RR5aQkRhHW
         8WUy3uEHLNdsxMVyq2xAGwVTWE/DTZmapZibiNBq9Y7x+bbWrFUVmrxaMQE1ry1cBYdA
         VKzWqPtup+PE6S3NRngOyTd2yDAaQz58EOc6uIepspHtH3agRTHyHhJi16rgn8LoGEK6
         O97WKci/6ZcMuybvc2ZKcS7RfqpyOifnan1o0b8fr9b0yJbfgTYQoP41nXYWMgQrTkRC
         Tdnw==
X-Forwarded-Encrypted: i=1; AKwUvBxrKfmDlW0nG793+E/Y4b8EzWXsBu7fcSvZMEBMXqrJ0smd/P5qBEcOCRloPNwMl0hWqqqinha2QASgueA=@vger.kernel.org
X-Gm-Message-State: AFuF++mPnmv5qZHMWirBSXVW5y2nEdtKN/OVKuBMHFbi/F0veyuNqzXB
	sGdiOMGrj0UU3KiYOZv2FtghdXwxGjapRQvJXCufJLcyKDWxePB8lVe4MXjv05W1ZcDPi71duIQ
	aZsO49z55e/N4r4JNu/SSIyYkfEWki9pQPDUUJVw2JiPxqlavQjQCX8npg0BTxnpMLM0kJhk8P4
	RZcO9tDW4HkRTSlPSxl7jj+obFzRjGuFpTMMPPIKSEdA==
X-Gm-Gg: AYBFou3X6MndCjXCrvduyx6zfqzSTuDYcb4lPi9QQdpZueZn4HtADTNtfQAa93lt5Au
	4IFWZGcrFgPe+Tp5BnWOCyYPdkCgGUWm5AGAttsoncGgPPEuPjkfYmOrD0vNgcZtBQDAsQcbpTH
	Ba4XIhrUoJ7W/Jjb5auYRC0BtkqVHnTCR72sp7eAhE2D0fZ7hC47huoP/SKg==
X-Received: by 2002:a05:6a00:1584:b0:86a:881e:ea38 with SMTP id d2e1a72fcca58-86a881eed92mr4853515b3a.12.1789056339261;
        Thu, 10 Sep 2026 09:05:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:1584:b0:86a:881e:ea38 with SMTP id
 d2e1a72fcca58-86a881eed92mr4853349b3a.12.1789056338517; Thu, 10 Sep 2026
 09:05:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <50fc5e8a29e3a5e9a64c64c5f775d758dce39b71.1787603965.git.sean@starlabs.systems>
In-Reply-To: <50fc5e8a29e3a5e9a64c64c5f775d758dce39b71.1787603965.git.sean@starlabs.systems>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:05:26 +0200
X-Gm-Features: AcwNN1XxhyWT_Qk5KNRESJlzw706VHXCD-vgMwiHAKKnrAT2fNk77opUBhvOjaI
Message-ID: <CAPx+jO-TodBfjkJ6SV39LHWyTKDRj=P-Fq-VnfT=kin4VBKkvw@mail.gmail.com>
Subject: Re: [PATCH] mmc: rtsx_usb_sdmmc: start card power-up at 3.3V
To: Sean Rhodes <sean@starlabs.systems>
Cc: Ulf Hansson <ulfh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfX+u/9Wo9Nko+n
 dsnegUitWeBry7pKR0aD2yHKxKZes149gR/hkeKX1eOEOoBsfJPVWQYuxOhFFJaP8mMLWebykPY
 whnycY7/B7qt6rhj+WWlbW0bKHYwErU=
X-Proofpoint-GUID: oM7IyNS067AuNSAxAEdV8VV3imGk5nZQ
X-Proofpoint-ORIG-GUID: oM7IyNS067AuNSAxAEdV8VV3imGk5nZQ
X-Authority-Analysis: v=2.4 cv=EspHPicA c=1 sm=1 tr=0 ts=6aa2d554 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=P4VcW8-MZ4Ji1alh_TMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE5NSBTYWx0ZWRfXxufEN8eLnycv
 YMftcf3zutRyY9KbREystfAtTX9jWQej7BOs3cWXg+XfJZOCG9Nw/3KH5rl6ikwQm4AveEC8V4L
 l+7MHyKDQTRRbc5YowJadM/6i8yPMi3Ln+GOJSyeSZw5y/YY+XE/iXa6o/V9B2v3AUWfoarWyyG
 YO9DN64Wh8YetjRTN40A1W22d4jV7srcuhm7mw4zMR6WTcfpgiiwdHkEBU6fUSBEobuwq8ONbFt
 zZ8QQBoexAxQQGIjJ0VFvW0qrT1+YpPX7MIdfI/7WCK4XLvRPakjJCy/jM/lCfj5zVhhsVBfGhP
 HzMuQXazXgyo8heCf3mhYZBEymLJZ5uu7GkKoSEF3S13uOblU9OeTc6iRYyobaXxhDETdUQuGHr
 /iiTUKWri/2B+m/x5KsD7xMP0WYOkn24N+H/wmwxwyikM8BQbFAHymRC/h1a0KYZ6+T0flC65DD
 5/3jjMEeAuKscn0hZEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100195

On Mon, Aug 24, 2026 at 10:39=E2=80=AFPM Sean Rhodes <sean@starlabs.systems=
> wrote:
>
> A UHS session can leave the SD pads and SD18 regulator configured for
> 1.8V. The power-off path disables card power and suspends the regulator,
> but does not restore their voltage selection.
>
> On the next power-up, this stale state remains until after the MMC core
> requests its initial signal voltage. Restore the SD pads and SD18 regulat=
or
> to 3.3V before enabling card power, as the old rts5139 driver did.
>
> Tested: StarLite ADL with an RTS5129 tray reader; repeated 1.8V UHS
>         sessions, power cycles, and tray removal/reinsertion.
> Tested: StarFighter MTL with an RTS5129 trayless reader; repeated 1.8V
>         UHS sessions, power cycles, and card removal/reinsertion.
> Tested: Both systems re-enumerated the card after every cycle.
>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

Applied for next (or should this be a fix and tagged for stable?), thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/rtsx_usb_sdmmc.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mmc/host/rtsx_usb_sdmmc.c b/drivers/mmc/host/rtsx_us=
b_sdmmc.c
> index bf37fab233cf..d9b33aa79165 100644
> --- a/drivers/mmc/host/rtsx_usb_sdmmc.c
> +++ b/drivers/mmc/host/rtsx_usb_sdmmc.c
> @@ -980,6 +980,11 @@ static int sd_power_on(struct rtsx_usb_sdmmc *host)
>         }
>         dev_dbg(sdmmc_dev(host), "%s\n", __func__);
>         rtsx_usb_init_cmd(ucr);
> +       /* Start SD init at 3.3V, like the old rts5139 driver. */
> +       rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, SD_PAD_CTL,
> +                        SD_IO_USING_1V8, SD_IO_USING_3V3);
> +       rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, LDO_POWER_CFG,
> +                        TUNE_SD18_MASK, TUNE_SD18_3V3);
>         rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SELECT, 0x07, SD_MOD_SE=
L);
>         rtsx_usb_add_cmd(ucr, WRITE_REG_CMD, CARD_SHARE_MODE,
>                         CARD_SHARE_MASK, CARD_SHARE_SD);

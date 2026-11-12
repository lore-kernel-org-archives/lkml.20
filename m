Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794491185;
	b=SIWLYsw3ksCWAI7gm81/JJzPA9Br9Vim3xAGVz4NFRc1pD14CopeAMiVxyhVeycgU9Mr
	 dfb8Bo0OY/1QBFDd3v9hlB80i0BIRHJ9JjREpqYPhmYQUBevOV7nCGwAs0ODVhpmKYh7q
	 lcRCeGIg/SwaS5Ejgq9ETw8pUB6vKyUmipmPi8RflzNwv37VES1X3XSSCwwpUbhME8oDr
	 +27SuiKhq2WNyDPPKau64hSaIefiVuw4ZMWelmY0Soq/EHaNYDOliXu5pSv5bDMkpxRei
	 bp0Ed13BMuEtNeXNFKn634/gr3tn3NRESZuoiKaDwmgniVLJQDwf+S5Hir/9Hp6WCPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491185;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
	b=1VBWM5sknduAXgUInmkY8kCVxEkUIqgKyGPs7CuvYODsrFMbPth4Cr50HGBvwaXn7eLk
	 rJKCWpkBIalWvqmmEzvQQP1IipfyXXQQ1DFfrojE88s77F32aFNnbbpA6495dPAlqav5N
	 2sE0F5z/JtWIpzq1HGZDX7x4dV8ozh5AoMkc3rnrZty5cwIlBxT5CWW1AbxcZojuwU6KD
	 Ru6kCU9c3/EBPjl+L87lwkBYyE0n55Kmj3u3x2DM/r16zt8vcWU7ZSyj5MaMi60BL5i9u
	 1lDGx6Lvyrn+kkq0Zw5rYDYWLhnR9cdIhJ69T4TG3JTau+wbQX4bHHCK1yseyWdhPMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUZDZq4w;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3tcEsC1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16B7606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:46:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16B7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUZDZq4w;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R3tcEsC1
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC92TO64149276
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=; b=JUZDZq4wPcio41pj
	obsZMATGPBHIGIxAcBSBTuoDE3rWxdJrFgbAcAzhzCpDMh3jZGuHuCejqa4ThX8E
	cj5K6qWRjCI4Cog5b5V/Le6R10fPfr567mKKjiFzeog3vimflcYAtpkUOKvvyWTD
	klGjqKEFCDVF9iBy0Op5OfF8yQlK3q3fqf6rHYMDE24K+lB8d8xXdNgzaIKLkHba
	4UeQLqhMY7oIdL4YgOJ+7xmWccDDZNaiWz/OMyypmcl8Gyryts43GMC80jgsB6Ea
	pr9IXzoX2obW5P5OYooD5od0wGd/lXod2fHnX8pnxVJakB7c2A74B5kNOGuSQpn7
	qvm23A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc63n2y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:46:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso1608553241.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:46:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794491182; cv=none;
        d=google.com; s=arc-20260327;
        b=ahWxsoOGz3kvSCeyo/QuKDkdsuervL0ZkvzeAETeXyEVkEnv8WqOIb4kYvVX5iS1VZ
         LyDlQGfEjNaRvgdo7o/bjqAEYv2ETzrnY3OCepcpi04Pb0bjWSJPpn8q1sszyfcCWaP2
         wboBV3TXPTYcb4s0H0H/STKsuPbOS9ZHyMQB8fzEXcA+p6XSR1pMWj8emZugrxH0RZha
         CyNglI15I/2abBvqwn89YYVTFCXAfVhaxlFctMI+eowllbW2jcGxu0d3YIfXh4yZK5e9
         oBRWQgt1WEUbBlFeTjRUoNKdDMb42Ey9vh/Geyfy3yZbfOH8yq33ONSN52aBcN2b49XX
         uMtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
        fh=9itHHHdXPcOfy2VdEx+cb/ZcnU3YcvnDHnOASUegL2M=;
        b=sLne0TG641fzkFsoph740TowWKeWxRd0RGG343TzOXfGMa8uDpZuQmrEMe6q53Ss5r
         6ZCGLGVv4F12xDQfKL/60monJMGE7jRnf50VE4y1ze41cVPoIYJZrIRm+/asSty1W+ur
         pX4sHuARYwl5QgnGUUeMzUsYkeCrPuZBYw1C28bEwLG/ts2qAlZ9Q07+V48zA+s8/tYY
         Ol3MTzH5QEMyPcPzZRf6T8Xn64XD+zDMh/ln6eTNbRJuEYYSNvEyUiLJYLx7qmm03FjO
         HzkhECN41mTm4DJ8lQVD2JgyYj+1wVkCc15GxUI8myHruMO5zw1bUP5w+NIlBB3iV8WM
         vceQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491182; x=1795095982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
        b=R3tcEsC19ckKK/0WzEy8xQUINyh4DiLRUQHXDLB4CJCFKbpb684zARzPnVI3/LAwCm
         PmKGuK1cWyoTTUvnv8tEEJO0SHFWAhX+8kZDhjfK5c1yUyCCR8DtXHvMmQxdpG/7twUd
         EsO3NHMr1zX5EksxSPeHImMWwrOPSwHChwkRnujtjYgIs9HwgpgTr3Dtte8NbIPpX+Et
         DJicJj46yC98Wfz45ickDK1xkULZEClwi+UZ7CVjzjCNFGGvlbE0hTkCya3K4qlhqKJu
         sOuDA515B7+XTKx+ceFLA7jCO6vS+XDylkkrbgofHk0x9UXriIBClx477ektJJX/+CKq
         0/aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491182; x=1795095982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzlbTcwQcAVau9OZ04IBsPLcMmJU10jDn+7fgZ31ZUs=;
        b=jIjqlnn3EkVOCFoh60uJv8Gas8pkHLrwHhBRV+kNcuf68t1scxjtiPSlKCuNh160iH
         OG+CwGT9hLVXD18Qv9eGcVuUPKJFlbeK7gumNvaizSVOz0niFu7EJLbsEp05M+YLto1N
         nD6tvSMV2lkz1UPfh+92d+Djsxy0UWZ6/BSlgC63bq0DzVwYcrc5jM1q7OnR8oBn1gIg
         QLdeb+TqQAXrTrn6FS/z36nQmv9CdUPVoNijyb7yM30M6gm60ldGpJd70b33GqAFW/yE
         +xU+xbfqczM1P24hVJ62prW4beaDza7sqdp0829PpT6SOzEJGfuS1yXdYoeHznPQwRBE
         8/4w==
X-Forwarded-Encrypted: i=1; AL+hErF1ipYI4U9uge2YcAns8dgzi4fLyDgAnksDqqMdCz2yd5scduhpZk0uSQcgPoxttDw3sEd44te5MBLNBG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fQS/bgnZ/TzhnOzM4nemuH0KXhyDxcX7nEUi7gxMKzq8QLcUU
	i5kgmpCfSLjdqsjSvajmO8Yhq638FsZNxjNJ0OfU9F4isoDYN858uRb7fsrzalHy9E/ThEyzH18
	5oGer30rjlnA0M522Ian2X2GHbKOSKSucgfSn99rR18nTuF1nFgnLgHJZytNxAp7sHTvx/L6MCx
	piO3ehpuIcHHHECztGG678RCObBpa0qrnrqHQ6iBu1DA==
X-Gm-Gg: AYBFou0JElOB+1EMQ53Vc0sixuYO8Od6XHFhzvo8VwoTsW1KNLLb3+jjGxY7W+3HF5p
	OS5PZUhB8VP2hKDHYksPR/VmFgHDlyc21ffG+wvH48fop6fHvty1T0Cz0zk+AQmaPybO9oPvjCk
	8iuPZUBzd/ISxc0Qg+8xNgtspiErpqd7l4lDj2vXf4fmwNOZYL5tkxpRq+QA==
X-Received: by 2002:a05:6102:5125:b0:7cc:b246:31e2 with SMTP id ada2fe7eead31-7d4fb2c9173mr1852000137.22.1794491181820;
        Thu, 12 Nov 2026 05:46:21 -0800 (PST)
X-Received: by 2002:a05:6102:5125:b0:7cc:b246:31e2 with SMTP id
 ada2fe7eead31-7d4fb2c9173mr1851995137.22.1794491181313; Thu, 12 Nov 2026
 05:46:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
 <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com>
In-Reply-To: <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:46:09 +0100
X-Gm-Features: AclHuK9v-Z2mRtAMjRJcbnHzQlkhFHOVGuw0nJq8MItVFsL3rwXN4A5fUjGnABI
Message-ID: <CAPx+jO86pgUXuHMPKAMKN6Tq9unxnpd9kB8eE9byZw_B=0xxyw@mail.gmail.com>
Subject: Re: [PATCH 2/2] PM: sleep: Do not arm wakeup IRQs for hibernation
 freeze and quiesce
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: Ji_pYaSCpY6fe03dAcTYgc0FEl3CTTc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXwL1AwtwgWFaM
 d9tFhE37eySD6K/zBRiwEE4LDz5wUav18Z/wK4YZeUL+LmtQt2gn9fbpO8HcaQ9V7tJC0XuJWJg
 hpl5eXfli4aYIjeFLfTQJrBm3HPOgqD16dszdJVDpJh/OJW2vaM7HEhv3wNg70d/Yxuto8qCjjG
 LLtWoLaDS2KoHhHsA5E+S3qi7y39AeIdiZ7b5idciQ2QW0MrNEHNKS2orbILULZLoNXh1j/mieb
 qMVnVH50T6jo/NbYhyBILNHngyYdZyoW2TYRRDLmz10XJ31GrOkWCUJ6fpAn412+W2i6OgkYa8G
 AfkOeVzioClb01GE33Kld8RG6b1+BafYJwFsriaqPv7uqtGJe2JAp2FCBHKlcIyYAPSRuLVzh0g
 f7v/zHM4U8enUIe5JRuGvDJ8zRqgJi+7ZFIZ6K1mq3OdXPQr/M1/du9FWd72XqrfALcf33RpxWN
 CV1NKgsTOGTNTY/vDGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXxg2zBEiI8GWh
 9w9DuKMxVkH9rDWrJ/Sxkx9ka9eKE3CIHhRaMtz5bW5qoLVRyYssU9yKG/AsjNOCMh9XZ4lr8kZ
 grjsQKwt+MI9OJidwrR9uNLIcKlp7t0=
X-Proofpoint-GUID: Ji_pYaSCpY6fe03dAcTYgc0FEl3CTTc6
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5c32e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=khUPejFFGLYla_ha6IwA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054

On Mon, Nov 2, 2026 at 3:47=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:
>
> Freezing devices to take a hibernation image and quiescing them before
> jumping into one go through the regular noirq suspend path, which arms
> the wakeup IRQs of all devices that may wake up the system. A wakeup
> IRQ firing then aborts the hibernation or the restore:
>
>   PM: Triggering wakeup from IRQ 180
>   Wakeup pending. Abort CPU freeze
>   PM: hibernation: Failed to load image, recovering.
>
> On a Qualcomm Glymur CRD this happens on every hibernation and every
> restore. The WWAN modem keeps asserting WAKE# once its root port goes
> down, after its driver has shut it down for the freeze, and the WAKE#
> GPIO of a PCIe port is a dedicated wakeup IRQ with wakeup enabled by
> default.
>
> Neither transition is one the system can be woken up from, as nothing
> goes to sleep, and Documentation/driver-api/pm/devices.rst already says
> that in the freeze_late and freeze_noirq phases a device "should not be
> allowed to generate wakeup events". Do not arm the wakeup IRQs for
> them, and only disarm them in the noirq resume path if they have been
> armed. Wakeup IRQs are still armed for the final transition to sleep,
> PM_EVENT_HIBERNATE, and for suspend.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

This seems reasonable to me, but I can't judge from a reasonably brief
review if this is the proper place to fix this. Rafael, what do you
think?

Nevertheless, please add:

Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/base/power/main.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> index 16a1f017051e..34ba0e5941a3 100644
> --- a/drivers/base/power/main.c
> +++ b/drivers/base/power/main.c
> @@ -949,6 +949,9 @@ static void dpm_noirq_resume_devices(pm_message_t sta=
te)
>         trace_suspend_resume(TPS("dpm_resume_noirq"), state.event, false)=
;
>  }
>
> +/* Whether dpm_suspend_noirq() has armed the wakeup IRQs of devices */
> +static bool dpm_wake_irqs_armed;
> +
>  /**
>   * dpm_resume_noirq - Execute "noirq resume" callbacks for all devices.
>   * @state: PM transition of the system being carried out.
> @@ -961,7 +964,11 @@ void dpm_resume_noirq(pm_message_t state)
>         dpm_noirq_resume_devices(state);
>
>         resume_device_irqs();
> -       device_wakeup_disarm_wake_irqs();
> +
> +       if (dpm_wake_irqs_armed) {
> +               device_wakeup_disarm_wake_irqs();
> +               dpm_wake_irqs_armed =3D false;
> +       }
>  }
>
>  static void async_resume_early(void *data, async_cookie_t cookie);
> @@ -1685,7 +1692,17 @@ int dpm_suspend_noirq(pm_message_t state)
>  {
>         int ret;
>
> -       device_wakeup_arm_wake_irqs();
> +       /*
> +        * Freezing devices to take a hibernation image, and quiescing th=
em
> +        * before jumping into one, are not transitions the system can be=
 woken
> +        * up from, as nothing goes to sleep. A wakeup IRQ of a device th=
at
> +        * signals for attention once its link goes down, like a PCIe end=
point
> +        * asserting WAKE#, would only abort the hibernation or the resto=
re.
> +        */
> +       if (state.event !=3D PM_EVENT_FREEZE && state.event !=3D PM_EVENT=
_QUIESCE) {
> +               device_wakeup_arm_wake_irqs();
> +               dpm_wake_irqs_armed =3D true;
> +       }
>         suspend_device_irqs();
>
>         ret =3D dpm_noirq_suspend_devices(state);
>
> --
> 2.54.0
>

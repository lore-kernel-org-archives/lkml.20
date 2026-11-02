Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793621651;
	b=nL7rE1x8Q5Ndk3M70XiuMU4AnLwOB0xmdJc3FHRdFs/DxG9DMtnQWC/T2VcSUJU5MyXe
	 i3Z0fY+ODRQ3a0ErqHtf9rNBNczMjpotWB7xzGUMA2zaXCSlClqOzipBsxkCsEWzAKeyw
	 tmDGNiubW068UyBCY90FlpZ2jA3WE1UgK+jWOpKREjhzBFdO5sGvfOniyQAtWcWsfHgIK
	 +w1FrfiqwsDaK3q9ONH2UqH9BSV7hyCfjvUTyGvnMVvC/DU+ZRzIMMgk8boWPldcDADkt
	 ZyhuCbloqE5JF25R838y7PypnWktgdo/bhBtw1BjTHWa5hd2ouAGev3doJZi3dyOYgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=;
	b=RzjGcD64jQIBqxtDlVeirvmIkR2FsGyFAsi73Sxwmk7c5iXhVjoPOrGF1CiDJ8CcPo85
	 zM+d/0xAhdtu0tmRi6acpXoTxa8y5AMdUa2vVvxt5rrYxFa4IZLG3oFP5WYGz5coOWRWh
	 vQ/vxF2CuLW8FrbEYizSBaqjQ5limyIY4Yqu73mru9tOLlmPi5ekaeGiGEPf2S0WNDO9f
	 zOL5tJh3HZe/udZHZIvWY3EDSoFnzG5WdR4U+4nTN3g4EXIn9eBDvKQkKcbmeBFzxwVZf
	 5F5AzNMlh8BmGkA6DQYqjSoeE3ZWQ4tvdntAqO6qIulfOjvFgnv0uSmW4MbT8EEGDzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuL85fN7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSZCYPFz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E169606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:14:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E169606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AuL85fN7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VSZCYPFz
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3Cf3402983
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 12:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=; b=AuL85fN7LCS4BdlZ
	bNwaPpw3VJWzjsI7E2FfuzsmKmcdWbWF0LT1GP+M5e/z3pw6Gp+W/S8ASjymPQXa
	grIMglL+rdT/FYgmOWDNCYXds/zBQohJvGzE9eRdyo5tumQttuyKbmRCPQNzMt86
	W0l+i84Bfon6Mc9jC72zEsqOBTZ73EyloEEF1qMMxyZUI71Ywu7jHsk9QX7IwQKV
	HHrD3yZmeCiJoxDnJJ/gOmPtlRfDhqhcvQQcsQ3tw4qgrCFuLcqYQIG/c0pZp4VR
	WNDkqtRDkM4Ilq5EPVl3JyhaPdunf7qsEGdnftYeY5rxBmEqoKs5W3nAWpwDWEOF
	3TSiJg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe91em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:14:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so524645185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:14:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793621649; cv=none;
        d=google.com; s=arc-20260327;
        b=ATgpTqLxU3TAscYwS7tq6seuAA5cYVclYv255blnNkicJQr9OHyA4fjftPC/4MNQKq
         XDh7HHflGM/umCcYbghKs5Zk8rJJF3kYBWIDZkMzJfgyKRJiURd9fBZAEU1s1ULPt5QC
         O4ZYyfstmmykZtjj5+YzdYsW0aG9v9xXmI104W5pyA8la130+9niJT0AIYkA9VXAOryl
         XTE836LWJrYSC5vFmeA1iYD9OEy9THs3vVC8KzPRglp7z8m40ZBqedByjXpn74iddLsY
         aVHTpVdX62h08Jv+XU5xTB7PndcWmP3NmWPvMJNPbVIWsZ+Wtylj+poWDJz8pxR21uph
         HB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=;
        fh=dCbQ5ml0mFwk0O4aSHDgDIEEr6/Jg0I0bFuU7bZRgCw=;
        b=AYytUY6TTNwZOklZLRAJThdmrYYSQFUNFsAaC6kMzunfH0dMfZ45Jo7N6TuZoGCxDk
         oQxQ1+ASKSIPjgjLO/Y4qwp5HCd5KJjj/CyNVRN/6sxiaKMsCA0RtXvnmv2G9d+fhSU5
         GtfacOHDwk7i+cJrBd33QacERxKbRcNFJYrKsn4noDxyBDA7i6fKhu9xXSOhVGJqNBKi
         e8u+xPyAvB90VfD4Dlyen7qzptPuZWWwxRnPAYbhXrvtodqOLlH2h9aJggDyLoKWQrQg
         C9SjtKnJKjYtlplHJwOkwBHHdxYj66ClMY1UE0nckP9StVu82wco5pPnharOtpnezDtl
         tbAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621649; x=1794226449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=;
        b=VSZCYPFzWGbimrnjRT0u+pzeYVIcv6WobNkBPSm49nkN4mGeVNjWCPqs3uMCAN2TXO
         40A5q7fqnbgSPIBPsNf2kvoreamJHMkmOS7oDzHmrKrkW1inblVoMb2bDdS9+66Ot97n
         8aGi7H91YRHkVC/XT6vOWJ06VFmDm+ilzO0euaUOjOsRTZZ4qnYhndWio1MgRjB00sFT
         4rZknMl8TiPrcaSNcFtp158PgQmXHrKXbECSdO1uwcdxXuOCwgz46QWEz0mAYcQran1S
         71a0ZVS/IQndWcpS6t06iyYySJ5HQP7l1RRSg3dok0W7Q7Mv+ODDB4SvYwUMuAjq9ppU
         eRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621649; x=1794226449;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4mgNax65RQ1A5TymodSxjwmvCQM0HUk79b2XvQLf43Y=;
        b=YEkF0PhSj/fL/lvLet8av9K7k3nm4EybxltBEHPpvGU8ic3zA7WVgqdKKSqY57V9/m
         6bukpLVx3n8j4pSiNIciBQ4Jj4PXC+e8y/4HvJFd1p49XyxRKu2lBLrzu/ENifBY6ASp
         oJKdmWYyDEacuonHq1sfhsNKnIl4UHNRzeLJCTM+oW4a7rktIGfNTTfRahKF4rI+Qepi
         5u4hDIuOBKv4aazsjWZ68SF9W2C8JvHyg/WSY+j9NzaHyO7YH3rPs49UG1FxZbP0SCQW
         RAQ/v4P9FspR3kFqYuk/e6xI2x1PsY+UAYXmIDD2ZSt4GV5TGQ+yLTCXQBzLj0iNoQh/
         gxnw==
X-Forwarded-Encrypted: i=1; AKwUvBy5Py2lNfRhP/qbVEQrx0frSt2y3kgpbkTAL2TbEZJWq766J7SLE0UrGkv9R+9VpdKUO5Ft0L48ZFoHACU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs0eF4SKBAOi00Q5BBxh0OJ2dnivaTyyE/SSgYBbw9hT8A9j3m
	YlSiL/wEZZmZmBIvZ+VzKVkDp40JmqoeBiZMyQXszKIBX/TiZo3WME8RJ3pCDWLmzzMLZ2SzjOY
	7HSas0+ZrjqSDTwOwyki3oEIkox6pzKXDRgRnklzkvmDH9i3A6EjII3eRgyIewW1jKoofnPFECf
	JpnDWJVkIDGIAU0pLM/Zjxc2mRlkmcrHzeRWH/U4PXmg==
X-Gm-Gg: AYBFou2pz0yxx4lEugj7ls5ukHPdDX4dZjHlJQa/z4rEUFnGVsDupLBrzDsH6a6wcru
	YwMO40413cvyc9+zexE/pwFDxXoorPCkvaNGZZS93iQAIYG/CEraAs70Lk7B6yxRGwa+dqkhNrz
	wFFdhyu4sFNLf1Za66hCB0ShnEispH/B1OCx8DEKEOAWQBpZMmDEhaUiovtUaq9YekTUN10K1jL
	YXdP67ClZ4GPGlYary7x0nQYTy/22t3Fn81wjLIFL1ZYi7P+r5cQgkRPkElNw3rEeSiLNIoDc4=
X-Received: by 2002:a05:620a:a999:10b0:945:b1a7:fe4f with SMTP id af79cd13be357-945b1a81c6bmr414534585a.41.1793621648980;
        Mon, 02 Nov 2026 04:14:08 -0800 (PST)
X-Received: by 2002:a05:620a:a999:10b0:945:b1a7:fe4f with SMTP id
 af79cd13be357-945b1a81c6bmr414531685a.41.1793621648418; Mon, 02 Nov 2026
 04:14:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101164247.258200-1-julius@bairaktaris.de>
In-Reply-To: <20261101164247.258200-1-julius@bairaktaris.de>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:13:57 +0100
X-Gm-Features: AclHuK-mJLI3vhrxkV6Cb90_ogt0oCov9vd_N4l2QccyJhxGU5TxIqOa6IopJaY
Message-ID: <CAFEp6-3iq_Pc0UgeCi7x16w6J-VwgGQ37QaP=dXp_OaTEi+esg@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: spread the PCI copy engine
 interrupts over the CPUs
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath10k@lists.infradead.org,
        linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae87e92 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=-bX5D0ki1FL7K08LthAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX676ENMMlycWV
 soIuTufitbfwJDMuJao+jgKrynnAqQIwuDRejirZsyWyhxwwkWfRSLhJGQV1JUDlNmymh6V4kM3
 Blmpzeseep7H2t5LtL7uqvfnvyBOO2QlbbP13Zy8DIiVnGLV49raQpxQzWIFcBNd3/GmBYlyh+w
 UNB1c9hSoRZSIdFp1K1Om4oYCBRYtrMoT70mU/HflmzgNr6901YqHvmoChCOMpfVtinwHk99hS2
 Ak6hTHLdTJUox9mds13Q21VIEujSAN0B2efE4lm1ir1AvNeQl/S5zp38G1DbgbkxhkMvfbXGiFL
 sx6/h/eGG2esH2hanf5a2Wq8WID4pPAM9zQZwQbKqvAoCBa4f1bpRptwM/TdfCmSjZ1k8ZZNT0+
 k1qnt5Bc/U0O7URfqVA6mniFQiM5gIcvXJKZK9ZAXBz3kvoboYABef947GfqWBLwVat7IOJ051z
 Sm/KIMpZGNK0lhubJoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX1FIO2itcnqAU
 9GJ5frgOaGMrpsX9qJnUxPvqtD80BNLE7yUy3GBqk6x3bSPLEgU2A46bxate6ZNMuZaUvBpfEFU
 dkHsE2yvH9A1sJdNX0Qc+f0I7We2+wk=
X-Proofpoint-ORIG-GUID: pBZJ_zpY6nG-NaSNa85HzgJwIq1eymUT
X-Proofpoint-GUID: pBZJ_zpY6nG-NaSNa85HzgJwIq1eymUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

Hi Julius,

On Sun, Nov 1, 2026 at 5:43=E2=80=AFPM Julius Bairaktaris <julius@bairaktar=
is.de> wrote:
>
> The PCI ath10k devices are capable of multiple MSI. The QCA9889 of a
> Xiaomi AX3600 advertises 8 vectors in its MSI capability (Multiple
> Message Capable 3) and, when granted all of them, raises the firmware
> interrupt and each copy engine on its own vector, the layout ath10k
> used until commit cfe9011a05a8 ("ath10k: remove MSI range support").
> Since then ath10k asks for one vector, so all its copy engine
> interrupts and the NAPI they schedule run on one CPU.
>
> Ask for as many MSI vectors as the device offers and spread them over
> the CPUs, starting each further device on the next CPU. Every vector
> keeps the shared handler, which schedules the NAPI that services all
> copy engines, so the copy engine to vector mapping does not matter for
> correctness. With one vector nothing changes.
>
> On the AX3600, with a station uploading 87-88 Mbit/s over the QCA9889,
> the HTT copy engine raised 36891-37590 interrupts in 14 s on vector 6
> and the WMI and HTC ones 165-313 each on vectors 2-4. The receive
> softirq moved from CPU0 (21-25%) to CPU2 (21-35%), with CPU0 at 1-3%.
> Measured with idle-priority spinners, the CPU time of the whole system
> stayed within the run-to-run spread: 25-42% of four CPUs against 22-34%
> uploading, 14-35% against 10-37% downloading (3 runs each). A firmware
> crash forced through debugfs recovered as without the change.
>
> Tested-on: QCA9887 hw1.0 PCI 10.2.4-1.0-00047
>
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> Tested on OpenWrt's ath10k (Linux 6.18 with backports 7.2) and on
> ath10k-ct with the same change, where the DesignWare PCIe MSI of the
> IPQ8074 lets each vector run on its own CPU since commit eaf290c404f7c
> ("PCI: dwc: Enable MSI affinity support").
>
> I used Claude (Anthropic) to help write this patch.
>
>  drivers/net/wireless/ath/ath10k/pci.c | 64 +++++++++++++++++++++------
>  drivers/net/wireless/ath/ath10k/pci.h |  3 ++
>  2 files changed, 54 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless=
/ath/ath10k/pci.c
> index 335bc7c488..4de789cd06 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.c
> +++ b/drivers/net/wireless/ath/ath10k/pci.c
> @@ -38,6 +38,9 @@ MODULE_PARM_DESC(irq_mode, "0: auto, 1: legacy, 2: msi =
(default: 0)");
>  module_param_named(reset_mode, ath10k_pci_reset_mode, uint, 0644);
>  MODULE_PARM_DESC(reset_mode, "0: auto, 1: warm only (default: 0)");
>
> +/* Spreads the interrupts of each further device from the next CPU on */
> +static atomic_t ath10k_pci_num_devs =3D ATOMIC_INIT(0);
> +
>  /* how long wait to wait for target to initialise, in ms */
>  #define ATH10K_PCI_TARGET_WAIT 3000
>  #define ATH10K_PCI_NUM_WARM_RESET_ATTEMPTS 3
> @@ -1943,8 +1946,10 @@ static void ath10k_pci_irq_disable(struct ath10k *=
ar)
>  static void ath10k_pci_irq_sync(struct ath10k *ar)
>  {
>         struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
> +       int i;
>
> -       synchronize_irq(ar_pci->pdev->irq);
> +       for (i =3D 0; i < ar_pci->num_irqs; i++)
> +               synchronize_irq(pci_irq_vector(ar_pci->pdev, i));
>  }
>
>  static void ath10k_pci_irq_enable(struct ath10k *ar)
> @@ -3164,18 +3169,42 @@ static int ath10k_pci_napi_poll(struct napi_struc=
t *ctx, int budget)
>  static int ath10k_pci_request_irq_msi(struct ath10k *ar)
>  {
>         struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
> -       int ret;
> +       int cpu_offset, cpu, irq, ret, i;
>
> -       ret =3D request_irq(ar_pci->pdev->irq,
> -                         ath10k_pci_interrupt_handler,
> -                         IRQF_SHARED, "ath10k_pci", ar);
> -       if (ret) {
> -               ath10k_warn(ar, "failed to request MSI irq %d: %d\n",
> -                           ar_pci->pdev->irq, ret);
> -               return ret;
> +       /* With several vectors the device raises the firmware interrupt =
and
> +        * each copy engine on its own one. Each vector schedules the sam=
e
> +        * NAPI, so they only differ in where it runs: spread them over t=
he
> +        * CPUs, from a different CPU for each device.
> +        */
> +       cpu_offset =3D atomic_fetch_inc(&ath10k_pci_num_devs);
> +
> +       for (i =3D 0; i < ar_pci->num_irqs; i++) {
> +               irq =3D pci_irq_vector(ar_pci->pdev, i);
> +               ret =3D request_irq(irq, ath10k_pci_interrupt_handler,
> +                                 IRQF_SHARED, "ath10k_pci", ar);
> +               if (ret) {
> +                       ath10k_warn(ar, "failed to request MSI irq %d: %d=
\n",
> +                                   irq, ret);
> +                       goto err_free;
> +               }
> +
> +               if (ar_pci->num_irqs > 1) {
> +                       cpu =3D cpumask_local_spread(i + cpu_offset,
> +                                                  dev_to_node(ar_pci->de=
v));
> +                       irq_set_affinity_and_hint(irq, cpumask_of(cpu));
> +               }
>         }
>
>         return 0;
> +
> +err_free:
> +       while (--i >=3D 0) {
> +               irq =3D pci_irq_vector(ar_pci->pdev, i);
> +               irq_update_affinity_hint(irq, NULL);
> +               free_irq(irq, ar);
> +       }
> +
> +       return ret;
>  }
>
>  static int ath10k_pci_request_irq_intx(struct ath10k *ar)
> @@ -3212,8 +3241,13 @@ static int ath10k_pci_request_irq(struct ath10k *a=
r)
>  static void ath10k_pci_free_irq(struct ath10k *ar)
>  {
>         struct ath10k_pci *ar_pci =3D ath10k_pci_priv(ar);
> +       int irq, i;
>
> -       free_irq(ar_pci->pdev->irq, ar);
> +       for (i =3D 0; i < ar_pci->num_irqs; i++) {
> +               irq =3D pci_irq_vector(ar_pci->pdev, i);
> +               irq_update_affinity_hint(irq, NULL);
> +               free_irq(irq, ar);
> +       }
>  }
>
>  void ath10k_pci_init_napi(struct ath10k *ar)
> @@ -3235,9 +3269,12 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
>         /* Try MSI */
>         if (ath10k_pci_irq_mode !=3D ATH10K_PCI_IRQ_INTX) {
>                 ar_pci->oper_irq_mode =3D ATH10K_PCI_IRQ_MSI;
> -               ret =3D pci_enable_msi(ar_pci->pdev);
> -               if (ret =3D=3D 0)
> +               ret =3D pci_alloc_irq_vectors(ar_pci->pdev, 1, CE_COUNT_M=
AX + 1,
> +                                           PCI_IRQ_MSI);

Why not simply using pci_alloc_irq_vectors_affinity()?

> +               if (ret > 0) {
> +                       ar_pci->num_irqs =3D ret;
>                         return 0;
> +               }
>
>                 /* MHI failed, try legacy irq next */
>         }
> @@ -3252,6 +3289,7 @@ static int ath10k_pci_init_irq(struct ath10k *ar)
>          * synchronization checking.
>          */
>         ar_pci->oper_irq_mode =3D ATH10K_PCI_IRQ_INTX;
> +       ar_pci->num_irqs =3D 1;
>
>         ath10k_pci_write32(ar, SOC_CORE_BASE_ADDRESS + PCIE_INTR_ENABLE_A=
DDRESS,
>                            PCIE_INTR_FIRMWARE_MASK | PCIE_INTR_CE_MASK_AL=
L);
> @@ -3274,7 +3312,7 @@ static int ath10k_pci_deinit_irq(struct ath10k *ar)
>                 ath10k_pci_deinit_irq_intx(ar);
>                 break;
>         default:
> -               pci_disable_msi(ar_pci->pdev);
> +               pci_free_irq_vectors(ar_pci->pdev);
>                 break;
>         }
>
> diff --git a/drivers/net/wireless/ath/ath10k/pci.h b/drivers/net/wireless=
/ath/ath10k/pci.h
> index d114778edb..252044dd63 100644
> --- a/drivers/net/wireless/ath/ath10k/pci.h
> +++ b/drivers/net/wireless/ath/ath10k/pci.h
> @@ -115,6 +115,9 @@ struct ath10k_pci {
>         /* Operating interrupt mode */
>         enum ath10k_pci_irq_mode oper_irq_mode;
>
> +       /* Number of MSI vectors, or 1 for INTx */
> +       int num_irqs;
> +
>         struct ath10k_pci_pipe pipe_info[CE_COUNT_MAX];
>
>         /* Copy Engine used for Diagnostic Accesses */
> --
> 2.53.0
>
>

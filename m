Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794861196;
	b=fjGENEbumARXzcoPwunJTpDA00S8qam+s1ufHwWMZJzv9OMDlWGq1TQxhWolgxRrH8VO
	 EFvWztRXVbeH+aboLHiVMgnEbH6G7nHMaH7tp3vqiwx8VBSCNpRrErXh94t7bNxee3aw7
	 8y8ZqtdK4gkToDya8DaqCWUdJmdIZMR3i90ORl/BzWpvTjmU1ilzhdAVjHSD0CfHYRhXO
	 FpVdv7ZujzfINk9bntezquWWdx8F4i8sZi8yYEk5WyLpEpsvqHdPPVWVAhqtbLxH5tolH
	 442FNFMUwivBPiW5pjszZjh9UW8+Td/cpZcRnjAckJHbSEfCSJnFcGHWl8g2KptoZlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
	b=azcUFDVo0PqgYEQ8Y5AIet+Sno4SZA38ElO+aI3rEjMwOpo9e+kPZ+B8nyF8swGz5Gxe
	 FliqkXnZcOamRiLhXTkftk6WInto+i3v23lm9N8k0fqwHzAcdB+J+1HkNtbEPuHC11w8O
	 86gVtYo70AzleOHKbfXMDdVXvtTlUDkO2IjgT29F+DQ+crQzalmH15a//rqKhSr5qVKXG
	 r9DTv5LsmBFJoh0TJf2sbLShIC7U2fpoqBJniODbTKvqoehQ04OqjgIWiT2xJWwkWxljw
	 HIKaPe0hxV3+1136xx8wckLQATJOzpE6Z+1pktSboODusMerl+36RICYYCMj2boiXAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SkSD/q+f";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ozdro5XA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AA51606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AA51606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SkSD/q+f;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ozdro5XA
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfUEl3505592
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=; b=SkSD/q+fupfJ4Ppw
	YRw6HQraaNMZjkAZ69W1OtzvlaXezRYxYZsCDMuPfUDIbsRytrO3YGWkenWQ03aM
	fatWX2ccU5R4eimHEDCSv8hpj65njnQibChz2M7ANvLJlzsg9kYwVRzSnux7aNUB
	mOpokAedWv3Wa8LGpSJQS2jsuulxjqvG9+pryw8BsUa4552n3H6b9NF9gZ6yfSDq
	/6rmJdHMe2nkstOw1XBn0AdRPPBDhiwPGEFcs+JeHLo142u0901OazFwERSaih6p
	iBwK5ixLc8x++NETpfUa3Tcdai2TKHssIZ5xYG657BomyQNT+sunB+0rZcAVJvo7
	5UFX0A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j038m9kfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:33:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so367380185a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:33:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794861193; cv=none;
        d=google.com; s=arc-20260327;
        b=S4BSTeV2FNdXe81BK6Z5z4hYpsjBnSccS+oQIrbRE/muSKzUHrBY1k77rzKPVjZe+T
         qzOKhj2L4BMQBLhdqUgYTZAfpLzAC/a+2VGaKYobObi8erA6Xhan2TeX3NL0AX4byUom
         9hVYLE77ZUYF4LVOZk82Ir7GPLL8ClIeCOTaCv7c6XmCk9gy8tCgkWLpWinwuF40zAi/
         XmZ4ds2nILbByRYC6VHEnafa+4Fw0e2VDPOG8YBg57Ka91nwxQ6+ImlvINmRyF+EYtiX
         yCrOon8JARF3jeGrnDCx6pDJeSDt096IvOk1rDq2CY9GJVVg/gj+ttoyk6IYX38Z+D5V
         1sfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
        fh=bKfWPrrIdvLR/bQZf3SlJtmPNAIDRVJeUyNJs5JRVwc=;
        b=q03cqJNnDzKum6upn+GvHnI4mMqppvdP3OWtivgSje8NmhrTpndEtr23D0Y+7LUzKW
         PRgcLnIB4FLimk25ndUiCz0331X6Csx0ZgomZJfcK2xkwN8YPtraIQFoAtbpq3STRJYK
         Igp8I0O00k6wz2HwXWDwlymeQPjnS+zzBYXsK//SiGBDNOsyAmrS3fD9dd+L336dA19O
         dPmhsg7L22Y0dC6PUeJ5856+Ek3uslkXmdYastrgccuswt13hzo2rUpR2NGc/gxbLDen
         FBVdJJXRv5f3fHfE5DyYK6wIpgfod+weDevUvXWp3XmLb57eW6gwBCNDvKHn8bBV9BN3
         pgbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794861193; x=1795465993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
        b=Ozdro5XAR0xy+MdNdyCYVAIStBsCE6zBC+OaH2PMmtyoMhGRzmj1qLcpkor0xM3hbL
         RicGMb/Ht62mhJ89pUquVvnR3HJER9l0XT1fPXCCiTfVzH+sFbh8D4mz7bJiEKjC1u3v
         nlH1oBJOvuSZFX2ptfFtXPEYp/b2MaFM3KKeMhlSNUNKr06A6im5vF64ZKorM8rwU14R
         3t/EqotDGwwQ6XSc447aE3HW4hBuQt+Vq2Ayy6rSViC7MmXmK1eLMvaoOZRM4Xi3Wbo4
         WVvWsvisgCt521EoYlHMS1DH0Huzm4NHk74MY3yfJjxPJAvRrdpYrV9GfclX8kXhUpmc
         vYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861193; x=1795465993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y+SUElrzxvUX/tlMt9vFq6/5XavJz4wfY7YhEZN5OZE=;
        b=KAzFhfvB2BGX58nnkfWeQWdlJ8jYSoKBbaDSpmYFtZnnES4f4Z95s8Welk4z4hUaIZ
         m5FnMqy4VB5gFcBYVg+VZIUGbZZIulx5ftA45NlxyDgkBsUtRZx7LNdc4ZIeAFll7VY3
         bfAWEUk4LD2MfXOnJDwTj/fu/yAQ05YeeKSRZFT2NT9l9Qus4FXQCrP6HIiXEuAF/tc0
         HMhfxIt0frps398xOeJ7gEacv9A8hMnUyAfMpbwWilM0lDJUdyH0D8Vom0lmCJ5n87r6
         0cEcfVOdSaonDennrSsNgPDXU1261auKsUbjujZYJk51K9pa8H/VUFlgHGR1F7dF2atQ
         S+pQ==
X-Forwarded-Encrypted: i=1; AL+hErHb/sAWRB/WRg1wAEqKrT1oOt6oPuHZdXdq0lBOTbsrXEU/J+GTjgKuqRqbglj/jwAzMI0KMf3/5VZ1H4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/DTNeklQbJK6nSevsp/UpUR3MP11pVDhycvgfY7ocRWS1ndVKl
	Y/uqWlv4mGt6OrTDP1eZgxDUjw2RRH3g8KD/ZbSqvcHJxeTYusb8zeefeU1kSzQA2PjQUmsndr1
	ndWCEc1zn3oWiCvA96ge4eo4TbGHxs+jVmnlNYGsmjQjxLcrAlA1d5did/yNC2L76L/NX+mshv6
	1OxfFLMQWemZpySMMFXWCrjKlF0o03I8wqZt2cnIQItg==
X-Gm-Gg: AYBFou17Ol2J6azcNBjwtjHueEWJ5W1fEnBnjC3rfmuECM94n40OhO84vy1acrkfg8g
	nMN3tcw2FdmQW9Ih5bxGgW+KKwV2ElWLmap/Gd/Exr0ETPGKp7ZfseytNtH27o5V8rGVaSmOp1t
	Fn7veDd1wzr82fJXtyN0kk5uFzNRGNVL9H9ihgB8SyaUfYhtMrB8HbiB0cXL1/zSiJwEL8B2y+R
	i4zCqQRxOF+Bge8ZqhSdF1deB91L0Y4Hk3sYxaVGu1XrbN9nJ1DZdn/tRlGFyJ0/cup0WraJFm7
X-Received: by 2002:a05:620a:2a06:b0:93e:b0c3:388d with SMTP id af79cd13be357-9494b9432demr1970461685a.11.1794861193313;
        Mon, 16 Nov 2026 12:33:13 -0800 (PST)
X-Received: by 2002:a05:620a:2a06:b0:93e:b0c3:388d with SMTP id
 af79cd13be357-9494b9432demr1970455785a.11.1794861192628; Mon, 16 Nov 2026
 12:33:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109051007.371843-1-daniel@quora.org>
In-Reply-To: <20261109051007.371843-1-daniel@quora.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 21:33:01 +0100
X-Gm-Features: AclHuK8LqAoYko6jfkEOWyP90pkG5Tye_Ye7sfmCxHmUMdYEwzinH0ptz0c_bbg
Message-ID: <CAFEp6-1zzzaHUL45qr-M+JdjL9rh2Bq5Nb3-GrHhv6kHrk2m2w@mail.gmail.com>
Subject: Re: [PATCH] PM: clk: Fix false-positive recursive PM clock mutex locking
To: Daniel J Blueman <daniel@quora.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA4MSBTYWx0ZWRfXwjW1AAne2e74
 sHfWqqeEcOALzBSTm68YffgjmtLgEbUhyTIF4gfbGZXkqbIN8ew7p3e1FWsedidWFIiWIGBw5ao
 3UWhyiR/G/kQASJi66ErtEnwX1zh0WNuxk6CPbvDbg4hKw6jp/FE72EmmbDssgkufMHoxtQnC/K
 vTt1kjLw9graYggirFBN9cFPzfB8Bfj70FjD4V2QX1obqPfrv7D1qs1pF3QRltoEhmJcN3ztsaG
 cIpTudNyKC5MklSEUn5QHaQ7pksaLfjBLEmCqs/ho5QFJJiiGafDfdSM5p/yTPF9kmMXo4c5hTX
 pTaPJm4iOHB6uvlyYexv7cBkwZ/Ac73FeuGylI+eF7yj7dprUVk4I09MZPXxXeYZEEb+4aSpVdl
 iSi0TPlK90ia066ff5l0OQG7KDFyPrdD1pA0OveNsakAwb8P3Hjsn64UTKQHP6q3VtMQIfRxTDa
 nKZ4k1+z044HnPAsMrQ==
X-Authority-Analysis: v=2.4 cv=TckDJhQh c=1 sm=1 tr=0 ts=6afb688a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=t9ty7G3lAAAA:8 a=oDK9j7WA2MVx4Ty_S2oA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: Y7PEgHub1cY4x2yFUIDdo0m_H8MBRJDO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA4MSBTYWx0ZWRfX49f/s1zleoZs
 XFSavybfZqg5GI/w3mBpBU2rLA2+56jsWEFvgrlTqlE4RQnsXIzFTrnXA8wuoq4KN5UtdAij86u
 5k72HJVnEA9036wBJzTPPdgwQbTARzc=
X-Proofpoint-GUID: Y7PEgHub1cY4x2yFUIDdo0m_H8MBRJDO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160081

On Mon, Nov 9, 2026 at 6:41=E2=80=AFAM Daniel J Blueman <daniel@quora.org> =
wrote:
>
> pm_clk_suspend() and pm_clk_resume() hold psd->clock_mutex across
> clk_prepare() and clk_unprepare() for sleeping clocks, with every instanc=
e
> sharing one lockdep class. If a PM clock is provided by a device that als=
o
> uses PM clocks, clk_prepare() resumes the provider, which takes its own
> clock mutex, triggering a lockdep report.
>
> This shows up on the Qualcomm X1 with the LPASS WSA/RX/TX macros and the
> varargs macro providing the "fsgen" clock:
>
>   WARNING: possible recursive locking detected
>   ...
>    pm_clk_resume
>    va_macro_runtime_resume [snd_soc_lpass_va_macro]
>    ...
>    clk_prepare
>    pm_clk_resume
>    wsa_macro_runtime_resume [snd_soc_lpass_wsa_macro]
>
> Lock ordering is always consumer -> provider, so this is false-positive,
> resulting in lockdep being turned off.
>
> Fix this by giving each pm_clk_create()/devm_pm_clk_create() call site it=
s
> own lock class.
>
> Scenario analysis and patch development was assisted by Claude Opus 5.5
> under my instruction; detection and validation was performed on my Lenovo
> Slim 7x with a X1E80100.
>
> Fixes: eb667d0fbdd3 ("ASoC: codecs: lpass-va-macro: Switch to PM clock fr=
amework for runtime PM")
> Signed-off-by: Daniel J Blueman <daniel@quora.org>

Assuming we agree that using separate lock classes is the right
approach here, and that using nested locking is not practical in this
case, then the overall solution looks reasonable to me. I only have a
few suggestions below:

> ---
>  drivers/base/power/clock_ops.c | 23 ++++++++++++++++-------
>  include/linux/pm_clock.h       | 19 +++++++++++++++++--
>  2 files changed, 33 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_op=
s.c
> index 3b8ba27802a8..94f2aa090ce1 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c
> @@ -398,17 +398,26 @@ void pm_clk_init(struct device *dev)
>  EXPORT_SYMBOL_GPL(pm_clk_init);
>
>  /**
> - * pm_clk_create - Create and initialize a device's list of PM clocks.
> + * __pm_clk_create - Create and initialize a device's list of PM clocks.
>   * @dev: Device to create and initialize the list of PM clocks for.
> + * @key: Lockdep class key for the clock mutex.
>   *
>   * Allocate a struct pm_subsys_data object, initialize its lock and cloc=
k_list
>   * members and make the @dev's power.subsys_data field point to it.
>   */
> -int pm_clk_create(struct device *dev)
> +int __pm_clk_create(struct device *dev, struct lock_class_key *key)
>  {
> -       return dev_pm_get_subsys_data(dev);
> +       int ret;
> +
> +       ret =3D dev_pm_get_subsys_data(dev);
> +       if (ret)
> +               return ret;
> +
> +       lockdep_set_class_and_name(&dev_to_psd(dev)->clock_mutex, key,
> +                                  "&psd->clock_mutex");

You could simply use lockdep_set_class() and avoid introducing the
somewhat unusual &psd->clock_mutex name. If a custom name is desired,
something like "pm_clock_mutex" would be more descriptive.

It would also be helpful to add an inline comment explaining why a
per-call-site lock class is required here, and why the
consumer->provider locking order is guaranteed, since the whole
approach relies on that assumption to justify splitting the lock
classes.


> +       return 0;
>  }
> -EXPORT_SYMBOL_GPL(pm_clk_create);
> +EXPORT_SYMBOL_GPL(__pm_clk_create);
>
>  /**
>   * pm_clk_destroy - Destroy a device's list of power management clocks.
> @@ -451,17 +460,17 @@ static void pm_clk_destroy_action(void *data)
>         pm_clk_destroy(data);
>  }
>
> -int devm_pm_clk_create(struct device *dev)
> +int __devm_pm_clk_create(struct device *dev, struct lock_class_key *key)
>  {
>         int ret;
>
> -       ret =3D pm_clk_create(dev);
> +       ret =3D __pm_clk_create(dev, key);
>         if (ret)
>                 return ret;
>
>         return devm_add_action_or_reset(dev, pm_clk_destroy_action, dev);
>  }
> -EXPORT_SYMBOL_GPL(devm_pm_clk_create);
> +EXPORT_SYMBOL_GPL(__devm_pm_clk_create);
>
>  /**
>   * pm_clk_suspend - Disable clocks in a device's PM clock list.
> diff --git a/include/linux/pm_clock.h b/include/linux/pm_clock.h
> index c3b46fa358d3..d54681547f58 100644
> --- a/include/linux/pm_clock.h
> +++ b/include/linux/pm_clock.h
> @@ -37,7 +37,7 @@ static inline bool pm_clk_no_clocks(struct device *dev)
>  }
>
>  extern void pm_clk_init(struct device *dev);
> -extern int pm_clk_create(struct device *dev);
> +extern int __pm_clk_create(struct device *dev, struct lock_class_key *ke=
y);
>  extern void pm_clk_destroy(struct device *dev);
>  extern int pm_clk_add(struct device *dev, const char *con_id);
>  extern int pm_clk_add_clk(struct device *dev, struct clk *clk);
> @@ -45,7 +45,22 @@ extern int of_pm_clk_add_clks(struct device *dev);
>  extern void pm_clk_remove_clk(struct device *dev, struct clk *clk);
>  extern int pm_clk_suspend(struct device *dev);
>  extern int pm_clk_resume(struct device *dev);
> -extern int devm_pm_clk_create(struct device *dev);
> +extern int __devm_pm_clk_create(struct device *dev, struct lock_class_ke=
y *key);
> +
> +/* Per-call-site lockdep class, as clock mutexes of different devices ne=
st */
> +#define pm_clk_create(dev)                                             \
> +({                                                                     \
> +       static struct lock_class_key __key;                             \
> +                                                                       \
> +       __pm_clk_create(dev, &__key);                                   \
> +})
> +
> +#define devm_pm_clk_create(dev)                                         =
       \
> +({                                                                     \
> +       static struct lock_class_key __key;                             \
> +                                                                       \
> +       __devm_pm_clk_create(dev, &__key);                              \
> +})
>  #else
>  static inline bool pm_clk_no_clocks(struct device *dev)
>  {
> --
> 2.55.0
>
>

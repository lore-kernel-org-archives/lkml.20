Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794854267;
	b=tzAE+psQ3z6f2NE94hr05US1X42gVIhO8MtIXzJNDuL9dZftijTHDgy9hbHd+5udpf6s
	 amF/pBn0iU2TiLu3TL0VW88DUMBclXWWiTQMDImeX9KZaEOu7ZmwJmgauSBtvIq8DLzGG
	 LidX30Kf+hskuyfjMdJC2o8J3idfz8tcMDD85xa80Bh/kuApRljXBrkGr54k3sa8x51qr
	 GRrc2yXgsOInLj3PVzoAvUeC3XYrkuKyVlyn5JYfbFeJgd9BEQwyveIs0W4W8wb2RxZeQ
	 eWevbXVf0/Sxz7pGh0nV2D5KICTjf+ZEn+HTviJWSI18zWV+dyrifytPUwB+jdmlzZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854267;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
	b=sJpoGlvwpCK1h22YadtWKZ+aTL+bOedYwHI1alKOvqY6ZOU1DoMeWStaWBjI6tvcL+W5
	 fRzldWYlsh02b63tr0z2ubxeDSMYyrC5/hRPQrLh2z6jDsoZzebiOPb8MePafvbTtp+Ph
	 aDXuDq7kmkYDGoXtuUoOJLwWptD8qa7ctdE21tk+RX9hmVXGmH0GYjpXfFks80vEwl/AJ
	 wUV69ru7eEdIE0i0Mtql8RjYrtAQ3kmd+Z7saFn5WqP4Tco7mjl9YyN/DqEHTIkP4QRDR
	 AthgGsZH76t7ud6SxSjXSj2YCl15Z4l/9N7r9BKM/TImPO4b1RC2vx1rfzgyaGW6lQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqT3NYpP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FGHtMx61;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEED606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AEED606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OqT3NYpP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FGHtMx61
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIE3j2264244
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=; b=OqT3NYpPMSWyNkoC
	T0jU1MWCwoayrXSsHrUPBONXfgqAYtHpimmXXc8u1ZVZdF548egHztbTNmT85olL
	2T/sThe5L7xH4V5dFkizBXkH0f32jZ1egUeaMGiHqXqS2zfgpiCopGrOmPm5Bz7r
	tlIWpaai/x4fvD0utZIEYuJVungkk8BPlrSPvchKJrplzwjYFkeoGUieZRQIBI9Q
	40KsMkT4PGroZwzOQZlbI58vK2HMhcQojkLzDr40iZ+GEP0h7oD6rmwAC2mfpGUq
	rtTuPNtRLW6i9e+1QoEzwxHF+XadsCGLPTluN0ttmkZGKyM/Oh1ZJvOKzvbEztlg
	l5hrWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc3kkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:37:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso292382485a.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794854265; cv=none;
        d=google.com; s=arc-20260327;
        b=QEadcgdkpWU/ICGPmpqvGJpQnlMt7Jnhlxufv30pHVMPcr6Hgn3Do/c9YJuReV2vzU
         aaBRi2nv8NyP2sBLt24sVeD4LNpNn00kUsLGgFSCSY9JoNQDxsxDihfdKHJTEgNy3gl3
         f6mB3O/WiUC1iPo52oScEZqRHYbqWydSg3uC4XpkJ3QXidX6cbmRayeXSl1YJ5LHmm7l
         XpgAB5qoAA3liBHNtjq89X4izz/LtASzLhijxxodRr5lTDF07hfGqpmF69B2i54gkIE2
         Cd2Bju4d8dsaJBmc2Fs9jbjcxs/FBQz+nxWKT4LwLPbfXvjoK3c8SZe2r1GCsPjez02j
         ipTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
        fh=aEC+kMBSP9dKfE5X1xx6XIL9JBEob+nbr8oUc8eouWg=;
        b=B5OnUpusElOWBUyCjoaUYTSc88tCcfPIh+ZeSr2ax/1uu6tugoBgE8j7EmALkcSH+x
         rILE23bp1sbuBWwbhl5t2Q1AMO2YsmpCQBCyFM18OxYYHv2CdSyYpz8ny2ntF2QXlMIl
         Sl0lRV/gPTaf7xsdRXzC8O1hGxJ5sSqmNWI9Yd0kQ8iF6Ru16t+p3pKW3zjsc4Fvaua0
         TaIUCKqLqY7etTUvHdljl1KuFkEawrJCCgxkdv2clUEOQDio8GwJYXbvLqiYTcttbaYh
         B1kfGdnbPG70FGynin6XCtY3Sj6ar+yqWK1gCTjNs7o9+hNEoFPWVvhq02Tb4tUOjOvp
         1/0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794854265; x=1795459065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
        b=FGHtMx615S6WKXiU0sxjpk3GpFHkE+SxjYQmKQRpwu0wiYtIPHAVWaTcmTWnNoS9nk
         4AF+fCD5GubW4ayYURUBZGVXNAzjAOMlSK3odHhsjfUb4XyjsGKHlWHMRHMvYyLquGSg
         P617WGvbukts6GcMuFR1ZRZM3fbSipeM8MKlPRy/mXFfxUhWqBZpt1oeqrZPwsG7o6+i
         Tvp01JTRjjRtdJmvMp0O4w+3NAaBIL6uSGyvDCSo0p4/c3b8lFz9mUwXyZo6SJm/iTx8
         zmMrInOQXr9toZhPav/kUAw+BlVe307j64uVR6RlqVnnGc/wYyF2C3iTGNiZRQB8jLg3
         4LdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854265; x=1795459065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ly0wSpOqETq67pj9QgQqaNP7QubSpXxkzzUxAFz3ui8=;
        b=rgXAEkKUJE3Q91285rE+OzdJ+iyN5aQF7NsJRfT3EZV1cRkauTdeOBORk9AtTTB9Fr
         ESFtATPErKcmpEnwNlfX0Qy0KTBl6ZsJtjw1cb2kzbl5qsH/ujfctP7wlJcqM2NJT42G
         61bDNcV/hlxdShe8ekdPankm66Ls6k+NgDtiZASpJTDi46VLT05/bEZvvUn4f9AAJSDC
         i0qPrBxlL8JilxrTGxUoH7D5bcUYe444BS4nK3kzES/iRrruxN0EsjgnMc+LUX/IASan
         zRabh2fGScV+7Dldq7RNdzJvOPmenXRxg73ZunvIHKaTBOBupXjBGM5OfBuQmPm+GwhV
         jkZg==
X-Forwarded-Encrypted: i=1; AL+hErGmeOppfOPTV9+6wYbvOU+xSDqmsWT0kijjK8Ey33JOPm9z6e71lqhfpiJNWXye3foSy6XYjrmomGLb7WU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9YbzFbgo+ij/KNdWX8B5feQiCRM6dMhMUHPk1gvzzhJL1YBcSS
	PMwGMD0eHAUmoFv6XNydQciOvimT2onX0plKxZg9KzS/WJHKi3u2SIsccNlzSzirqdHD5MpHe/N
	g3hMfR0xWJBDn8QLvFbC/mM8Z62+rjYGmf8CN+M7XkEobLDL8Jv55BGgTrwrFygXPTWsj+yAHtG
	XxpoOxZW8HtmFitslYf/JFnmtTnr/4Sj3TME66abdEiQ==
X-Gm-Gg: AYBFou0l7HQ2F8mveibIG1aSoGheKot9R+vNI/d0QfWPhPLGEm6/NUsHIco1J5g+xJK
	qDCZZRnIJ0VRmdmsLM3U+HcXB4SUXYMR2hGJ12awyav20jmIBUOMPe6/ZmbkGTmb0W5IVOnQqsk
	b2phpp4P3pGtnpScJQgp6mx6iOZx13ItoxdEGa7iJE+GlkL3pmKO26XOVho7kuoev1llU6ukxdw
	9OXxGNQDs8cF4z9tEzTifkIdhnB903eTRIpYo5zcriKvdjjT2MpDW9u10Z7L6F6K590/hGzS9yc
X-Received: by 2002:a05:620a:6910:b0:949:6476:91df with SMTP id af79cd13be357-94964769908mr1306134785a.27.1794854265156;
        Mon, 16 Nov 2026 10:37:45 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:949:6476:91df with SMTP id
 af79cd13be357-94964769908mr1306128585a.27.1794854264515; Mon, 16 Nov 2026
 10:37:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-pm-clk-resume-report-errors-v1-1-ba6e1dddd522@oss.qualcomm.com>
In-Reply-To: <20261102-pm-clk-resume-report-errors-v1-1-ba6e1dddd522@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 19:37:33 +0100
X-Gm-Features: AclHuK-5A642jlfrsRiFikZwKptRymZe-s-kt3fOZysrAU132IAw9jKbio5jyXg
Message-ID: <CAFEp6-3GKHmc4y_mTTVMO6iPdnpmxEmRokpki4uVGoBuXTj6Hg@mail.gmail.com>
Subject: Re: [PATCH] PM: clk: Report clock enable failures from pm_clk_resume()
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX5Tyue0GXePDt
 uL0aAgAOImfZdO3IUngJcKE5fT9NNDmckWNHhQcphjD3LMGnMwtnCS8KfKwgojuq66nsxf+tRxb
 Dhz6tOBhdVzCtXVwXjuPCxFaSy5auvw=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb4d7a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=-LQT69PtjwrO-PJxn2MA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: YYf8IicSwc3CcBrJBDgPyPi2n0bAyE-b
X-Proofpoint-GUID: YYf8IicSwc3CcBrJBDgPyPi2n0bAyE-b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA3NCBTYWx0ZWRfX3wtjieu77zeI
 VLueUjEjQZzjF7u0z6C4dXrcn2+ZYbOZiosXFSwf46jQcK3IAN+L/5kc7+Iq/j0Z2wZb5mL2bOY
 h7SjletfLdQsxKaXHZsGsdW0ipXBI73HmirWhY//a7wNbFa3zC53zAhz4V2MbUvyIpnt9bOgoOv
 aenbpBoQTtI7z5NzSyCctAtzo6MgrfKQPYV+l8rsh4vfUySleoi7POkw9xK4q2Gq62cfUx1hSif
 Y7v2au14Yu4wKjnS4VnmS2DKJCftiz/Wm2OWMmN+vIMqLWDFY9ycCKWaXkKs8oMTsy4IL0E7sJL
 iKw3haWhvphaKk2JYllBIF9TaP0xuDMME6NfTcpcRGqxWFCjsFkdzze+Jf7vQDosuksoOxmXvfg
 tZgX+4qZ2/Nnkgah38W68iecMFNZ8bxYqACI+oMkcYCaMv/P+tF30LBnCBaAMUI96RKBvEGqTR/
 6K2HJLtriC/WP/3g1yw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160074

On Mon, Nov 2, 2026 at 11:23=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> pm_clk_resume() logs a clock that fails to start but always returns
> success, so the runtime resume of a device using the PM clock helpers
> succeeds without its clocks, and its driver goes on and accesses the
> hardware.
>
> This happens to the devices in the Qualcomm LPASS, whose clocks are
> provided by the ADSP: after the ADSP is gone, like right after a
> hibernation image is restored, a sound card opened by user space
> resumes the LPASS LPI pin controller without clocks, and the access to
> its registers then brings the whole machine down:
>
>   qcom-prm gprsvc:service:2:2: CMD timeout for [100100f] opcode
>   qcom-sm8550-lpass-lpi-pinctrl 6e80000.pinctrl: __pm_clk_enable: failed =
to enable clk 00000000b90a5151, error -110
>
> Stop at the first clock that fails to start, stop the ones started
> before it, and return the error, so that the resume fails and the
> device stays suspended with its clocks off.
>
> The callers of pm_clk_resume() check what it returns, including genpd
> and pm_clk_runtime_resume(), except the MMP2 audio clock controller,
> which keeps ignoring it. A device with a clock that fails to start no
> longer resumes though, even if it used to work without that clock.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> pm_clk_resume() always returns success, even when a clock fails to
> start, so a device using the PM clock helpers resumes without its clocks
> and its driver goes on accessing the hardware.
>
> I hit this on the Qualcomm Hamoa CRD while working on hibernation: the LP=
ASS
> devices get their clocks from the ADSP, and when the ADSP is gone, like
> right after a hibernation image is restored, a sound card opened by user
> space resumes the LPASS LPI pin controller without clocks and the whole
> machine resets on the first register access. With this patch, the
> resume fails, the open fails, and the machine stays up until the ADSP is
> restarted.
>
> The LPASS macro drivers already check what pm_clk_resume() returns, but
> never saw an error so far.
>
> Prepared with help from an LLM-based assistant.
> ---
>  drivers/base/power/clock_ops.c | 56 ++++++++++++++++++++++++++++++------=
------
>  1 file changed, 40 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_op=
s.c
> index 3b8ba27802a8..a978eb3d5479 100644
> --- a/drivers/base/power/clock_ops.c
> +++ b/drivers/base/power/clock_ops.c
> @@ -143,8 +143,10 @@ static void pm_clk_op_unlock(struct pm_subsys_data *=
psd, unsigned long *flags)
>   * __pm_clk_enable - Enable a clock, reporting any errors
>   * @dev: The device for the given clock
>   * @ce: PM clock entry corresponding to the clock.
> + *
> + * Return: 0 on success or the error from enabling the clock.
>   */
> -static inline void __pm_clk_enable(struct device *dev, struct pm_clock_e=
ntry *ce)
> +static inline int __pm_clk_enable(struct device *dev, struct pm_clock_en=
try *ce)
>  {
>         int ret;
>
> @@ -156,13 +158,29 @@ static inline void __pm_clk_enable(struct device *d=
ev, struct pm_clock_entry *ce
>                 ret =3D clk_enable(ce->clk);
>                 break;
>         default:
> -               return;
> +               return 0;
>         }
>         if (!ret)
>                 ce->status =3D PCE_STATUS_ENABLED;
>         else
>                 dev_err(dev, "%s: failed to enable clk %p, error %d\n",
>                         __func__, ce->clk, ret);
> +
> +       return ret;
> +}
> +
> +static inline void __pm_clk_disable(struct pm_clock_entry *ce)
> +{
> +       if (ce->status !=3D PCE_STATUS_ENABLED)
> +               return;
> +
> +       if (ce->enabled_when_prepared) {
> +               clk_disable_unprepare(ce->clk);
> +               ce->status =3D PCE_STATUS_ACQUIRED;
> +       } else {
> +               clk_disable(ce->clk);
> +               ce->status =3D PCE_STATUS_PREPARED;
> +       }
>  }
>
>  /**
> @@ -483,17 +501,8 @@ int pm_clk_suspend(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       list_for_each_entry_reverse(ce, &psd->clock_list, node) {
> -               if (ce->status =3D=3D PCE_STATUS_ENABLED) {
> -                       if (ce->enabled_when_prepared) {
> -                               clk_disable_unprepare(ce->clk);
> -                               ce->status =3D PCE_STATUS_ACQUIRED;
> -                       } else {
> -                               clk_disable(ce->clk);
> -                               ce->status =3D PCE_STATUS_PREPARED;
> -                       }
> -               }
> -       }
> +       list_for_each_entry_reverse(ce, &psd->clock_list, node)
> +               __pm_clk_disable(ce);
>
>         pm_clk_op_unlock(psd, &flags);
>
> @@ -504,6 +513,9 @@ EXPORT_SYMBOL_GPL(pm_clk_suspend);
>  /**
>   * pm_clk_resume - Enable clocks in a device's PM clock list.
>   * @dev: Device to enable the clocks for.
> + *
> + * Return: 0 on success or a negative error code. If a clock fails to st=
art,
> + * the clocks started before it are stopped again.
>   */
>  int pm_clk_resume(struct device *dev)
>  {
> @@ -521,12 +533,24 @@ int pm_clk_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       list_for_each_entry(ce, &psd->clock_list, node)
> -               __pm_clk_enable(dev, ce);
> +       list_for_each_entry(ce, &psd->clock_list, node) {
> +               ret =3D __pm_clk_enable(dev, ce);
> +               if (ret)
> +                       break;
> +       }
> +
> +       /*
> +        * A device whose clocks are not running cannot be accessed. Do n=
ot
> +        * pretend it resumed, and leave its clocks off as it stays suspe=
nded.
> +        */
> +       if (ret) {
> +               list_for_each_entry_continue_reverse(ce, &psd->clock_list=
, node)
> +                       __pm_clk_disable(ce);
> +       }
>
>         pm_clk_op_unlock(psd, &flags);
>
> -       return 0;
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(pm_clk_resume);
>
>
> ---
> base-commit: 7649ba73f9e7e1e04d0b46213e39c79ae09dd55c
> change-id: 20261029-pm-clk-resume-report-errors-b5d538eb27de
>
> Best regards,
> --
>
> Abel
>
>

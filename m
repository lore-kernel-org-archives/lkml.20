Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794576043;
	b=zR0FcFShdPMYnEGwh+tcjK8wWFIHrM6OtTeT+lub2zNJsIZGJlozF6hald4rbpHvohGN
	 Qmla8F0isNfmfodPpKRkMG/BH70lYAMgl6fJsQgCN5/73UPl4vnsg7M2CCT3W6NS6evup
	 0w2IrZVVBogOKiA6cLa+bKs6qVhDdyBBNHbEbIFQIDoC0SwBfLBxJyp/268uL9ZMkL3BU
	 KCZEy8ByXsRJfe1kcu7F17G0rstSMrzP6tlOVS44IqSc2qQ0CgCJkfUu5gi0B+RIKtWZy
	 CTP+JLIntfv+voCi50nxPL+OSDZBjW1w+/g2yE9VZ86RIIuRQ65NrOAOkKBWDPZEOEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794576043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
	b=Cb1e/tj/PJrDjWhqiCs0xJWgyHJTxwaR6T291bBow3AXoUBFhY+fSog8InjYAX1SWT6G
	 zSV1lfmgc9yQys1k/95EYs1KmuBk7XzpITke0e/Fi4aJk3ZTOO0qFNF/4kCzZTRXlLMSL
	 lKXSJ+qhPSUqAeSyZ9RuYSV+2xNOVae8xA0ZvVtbhYLQFOR1b2Kj5M6QsCKqHudNpnH7w
	 bFS3IAs+odMU+ya6Mw4gNXs3kbRy6yc09HaQ0UYP7TDpwdYipsdxUKNKAndigMNSnLiDU
	 dkCYh8O3lmalCrwyKZN4A2yBf63Kx6XCmDzFy+p6ha/0vXEMD8W7PjhR4eKrtHWr0gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bsw5e1hi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZlUAlTd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368C260A2616
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:20:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 368C260A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Bsw5e1hi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MZlUAlTd
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJbPS688730
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=; b=Bsw5e1hirQIXko1V
	P/A3PCvUyTKZmfoS9gy5RgDa/dv85s3HuArahYIeIgFWuRgyN8aV2PmZZwTCkxDD
	y8N+PDV6Z+HV0a2usDHnZrVOn+14Y76HpxIKK2OVIFGQCqLPqLstGD1ImLW5fs60
	UfP9cNwJ0w2B/2Zzltv6H9Dv/MNJ/8UHouJQC0L/gCk3vWl3kZ+6BiGXVtGcsm2e
	KmrfMtMpG0fzfh1IIqAqYTBtBJRumGmVmAAIXfwiFGbYoJYziQ7OlEtJ0tD+HMvW
	jpsPW88hVEk8TBMhGU/OxTvcNdSvvX+/zNk6nF27/N5YNBkWIA8MjaWcvki3EppX
	0IFABA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjgdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:20:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so233617385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:20:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794576041; cv=none;
        d=google.com; s=arc-20260327;
        b=GeArjahYYF7LsLyOUaCUVI07hH1J/CV7nVfEq1mwwMzWe5lMDQnQmqr2ykSI0ydDrd
         qak15X5vUpGwB6L/iWlpcyITSJVAVGl86WF1ThK+koa1nNGC90XFfSfQtBnLO5i/LElL
         CnAURtmU4Gja3JMhO8FZld3TBrLtJYEfPkeHaZBt2+L7uWmsgruFeaBcEj4rxmTAHeKA
         u2lEW8YAvbjfB3dkmmVU+q3cKhIJeJqbbtweAN++AoXCWASfud/Vq4IfOZZSjrofxJUx
         QDw+hOwBuI1WaNfMln9Hs4KJcwg/fSlpchDUe5gzR9iQm6lk4QyTwnqVxkoJEqXHJfL6
         7rDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
        fh=9fodxCLX6WYsa6RkMuYal2yndOP1BX5llhH9ydVE5lY=;
        b=AbwY1zzjUXc6o8B27iA2SK4ji2mXE+WaH7HWX4tM/O+qjc/NGVBxOtqdeYhq9si+TD
         R1GnXGd4EYU4EGBXhDbcR81OzIdampPQFQosze4QUeiTCNPRCqzIRFtAfVvFrbHccr6F
         ZsxP1aIn8L0qLvGqVlmnou4JTMQ4U6r9dDsGd343Kf91ZQuomMW5GglQoA5Z2DsdnMtH
         7qUm89X5ruMDIJg0M8Ab/on4dkyz1yCrHprmCwW6HY/OxkJO3ThuSqtor7Qw5mEMl4fB
         xemgVGY1RrfCkkA4Qzd4+WneSe+yWexDR7JBuGMDwJdW0jxCASZ1HDxuRmVHa5+5J/lk
         aeeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794576041; x=1795180841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
        b=MZlUAlTdN8gaUxf5+AjVtGxwjyZK+q8x2fUNFheL3zpxD/OwxFlpdpVZJlPObR8YE9
         PU8pA1FkQWhKQUxvZ/Wiwmg9MDjcKVaVBCB6coxkkp4I6JHYWuU28DNrGgr/fbqArSnT
         nd2onHV+AwubBNnQoRzUy9P9Xu8HSBNi40KRO8oc/3mOz4m1RDjiqradF2NbqtO+fzeO
         i6LzUgk3kqlhwZN1saPwpVj1F8WBB2BUkeRriLjpmfm2udjqfNH8Wdm1uhKQAC5OKzPM
         JV5k7CVt/J1Hq7XV8X9318c/aG7e8aPvsruaFloF+aU6qLL90YjN3u0Ffq+denGUqoro
         TtAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794576041; x=1795180841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qWc4esvf8arA4ZupyLrig+Ez+fiYLvfvybCsV+67o4=;
        b=yyopbyrFwT1B/Pn013lKqF8bvMRKDsVUKK7TbFN4r6YpHQBdqpSX24nWzmkN8BksQ6
         ywQYptuwOC9+8aRrx77I3DKnGxTq4Yn+2U86IH0yH3Ch+IBOnNvVLMXMqfbL2QC/0+dY
         IpXyceWY605kX74CM3yEM25SCqrU9mkXcLbAzfqp0kEmMRZcTWNvMTjuHa6MoA0QDwFt
         e6tgpCAGWr6/82bZ83i2p38L1ajzmzjhbGm+l8Gg3E3Nf17hEUgSP7Cnb4bbuPewLhGj
         wI34IYajihQJ7tBIdfo7oS00BvdiQvN9r3RMLE2qDSTKx9BrxYI6jYxnoolNiHYv/ylq
         7QPg==
X-Forwarded-Encrypted: i=1; AL+hErHXGmfXeR4cjuruLkhxtBsbRd4DE+gIRYE3tDfq3owInBjemY1q7unDMgGst8tEvO9mmKglbnn+YL095hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8r1+bjrrKnKzQIS7XuQ8AVWc6mzwXz52YhhPYxLXUHuPR+VLrH
	xQfOJAc2Z8Sx8EXdoMFDjkNxubOZ4oyoTiRSCyB1rZ1XVXzM4xAWpFCfN/MPU2DV1SqvC4U1X/i
	LmQr+5FyXNhZYL1BIowmHz0FwdD2Vmg4av/HfGwsmgUKUtNNSD37cRi+tzGvFikI5RCmqE+nIpf
	hJflEEEkreU2sd7xLbxHe9xdz6+e+AHkdT3m9X4leD2g==
X-Gm-Gg: AYBFou1oMsRx1FQcF+Q+okmLzVMrOejx6MxRK3536Ktj1A0YDqauDkbDpuO2E7YBvNK
	m/2paj41k0UnuT96ohW0CZv67YWWnU8vVfCDOmxoCSTY4O/GhHLScbHJa/3+6b1q6fF++1xx5T5
	DEBkcl6D4XWjwgNvT2WTjNORCrv/pHoNjgJNjvaRkbnIsFj6JmZ32VX+Qwxv3GlEQ3/d5/Xd0BV
	SPe8A/zgd92FXexSys82eFX8++HHhPEL+9VATtWrnV1oZ4HMGMd7co9aZC4IKY1P6PNek4DAXkD
X-Received: by 2002:a05:620a:1b94:b0:93f:6fd6:fbf9 with SMTP id af79cd13be357-9494bb73895mr395776385a.66.1794576041162;
        Fri, 13 Nov 2026 05:20:41 -0800 (PST)
X-Received: by 2002:a05:620a:1b94:b0:93f:6fd6:fbf9 with SMTP id
 af79cd13be357-9494bb73895mr395772685a.66.1794576040564; Fri, 13 Nov 2026
 05:20:40 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <b47282f1514a9012ac51d0915afb83782c3c0050.1794417398.git.len.brown@intel.com>
 <CAFEp6-0yj-+7uYnj5PCvaP39ruQ=xduBbQgJc7MyakuPLJhmvw@mail.gmail.com> <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
In-Reply-To: <CAJvTdKnnqZJrZ6bgaxsyy6QttGwgh5RL=De9ggV3KhMPDau_BQ@mail.gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:20:28 +0100
X-Gm-Features: AclHuK9JvzPh-gUt_-PJY2SOU0LfVCGU1Ko4D84s0fgkAlJoejMKa24l7xCqmo8
Message-ID: <CAFEp6-2sLZkNQqDg7seE0ipZbuve_TZMjgNHV4ubW0Qs80Pyhg@mail.gmail.com>
Subject: Re: [PATCH] bus: mhi: pci_generic: Fix erroneous system suspend abort
To: Len Brown <lenb@kernel.org>
Cc: rafael@kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        linux-pm@vger.kernel.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: aJatGEfkB0SDje9wXtDNsnlRi7Xp37RS
X-Proofpoint-ORIG-GUID: aJatGEfkB0SDje9wXtDNsnlRi7Xp37RS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfX45VhbXomX7lz
 wGtvi5c26NhyKzxpqR+H/mcpaAJcaI8qYXh+DI7a7jhPwVl6gorOMjiA+kfZfORweN/SnTwVrBl
 PzdNjwdF5CYD4fBfBW+6K5KU+ae8dhtqxxWMZF5mvrEfpfAzKu2742Pg4LtInUewMNVcR/xKzeh
 7oOodqbQ870uuz0sVNogrHMgIfrjnpL/8wVrmWijBsHr315OS7GZsqgahUmgbwuy9MEYnkZJN24
 7RsUcnT4MR3NfXw+z3FcKpJ83nc2FDGIk8fd54WYwuzYX/MpV60mL72W3oAGrpCiHzosLcW4iaf
 QgKrpASp2wwDYOGb2E9h/F/5d85MAUQ6okJ9I9LR2smkmnz/N8zmD0E6wnwP3US3TrfN2CcVNBh
 lSsDIvYI1KPc31/y6u66m1tAPxgKXN94wU/o3fyAMUjRNROVEfYuTyK1TKybvlO6knuYI9cGe4n
 3GHKtUALFsBKAc2Q57w==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af70eaa cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8
 a=BYJHoP1oeDQRUb2UbM4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1MyBTYWx0ZWRfXzgLGfpYuNsiW
 IC/HT8YAa/A6BBQLR+4n2rW9hN2Lb3/wKuhF2QQY23NljmGYZ4VnKpaceF8ZjVVA5ZxuYLh60Gq
 nd4DyIaep7vlHAYVuvRX0TCk5Bp4jDU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130053

On Fri, Nov 13, 2026 at 1:43=E2=80=AFPM Len Brown <lenb@kernel.org> wrote:
>
> Hello Loic,
>
> I agree that the device and the driver should be debugged, and perhaps
> re-implemented.
>
> Indeed, I'm happy to share the dmesg from 28,000 suspend/resume cycles
> on this machine
> over the last few months to support that effort, should somebody else
> undertake it.
>
> But today, this device is allowing its internal contagion to spread
> into Linux and interfere with
> system wide suspend due to an obvious 1-line programming error.
>
> This 1-line fix should be applied NOW, without waiting for internal
> mhi internal or development.

Fair enough, but would only ignoring error on -EBUSY would work for
you? as this is clearly something which is not relevant for system
wide suspend cases.

Also would it be possible to add a small inline comment saying we
purposely ignore this because of buggy mhi suspend handling.

With your patch what happens on the system resume path? is the MHI
device recovered?

Regards,
Loic

> thanks,
> -Len
>
> ps.  I filed this over a year ago:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D220020
>
> On Thu, Nov 12, 2026 at 5:23=E2=80=AFAM Loic Poulain
> <loic.poulain@oss.qualcomm.com> wrote:
> >
> > Hi Len,
> >
> > On Wed, Nov 11, 2026 at 6:23=E2=80=AFPM Len Brown <lenb@kernel.org> wro=
te:
> > >
> > > From: Len Brown <len.brown@intel.com>
> > >
> > > mhi sometimes aborts system suspend on the thinkpad T16 gen3:
> > >
> > > mhi-pci-generic 0000:08:00.0: failed to suspend device: -16
> > > mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend(): mhi_pci_suspend [=
mhi_pci_generic] returns -16
> > > mhi-pci-generic 0000:08:00.0: PM: dpm_run_callback(): pci_pm_suspend =
returns -16
> > > mhi-pci-generic 0000:08:00.0: PM: pci_pm_suspend returned -16 after 1=
5145 usecs
> > > mhi-pci-generic 0000:08:00.0: PM: failed to suspend async: error -16
> > >
> > > When a driver returns -EBUSY for its runtime suspend method,
> > > that means "try again later".
> > >
> > > But when a driver returns anything but 0 from its system-suspend
> > > method, that means "abort system suspend".
> > >
> > > Always return 0 from mhi_pci_suspend().
> >
> > Two things:
> > - I think we should simply use pm_runtime_force_suspend() /
> > pm_runtime_force_resume() for the system sleep callbacks instead of
> > implementing separate suspend/resume handling.
> > - Rather than silently ignoring the error, I think it would be worth
> > looking at the mhi_pm_suspend() implementation to understand what can
> > be returned here and under which conditions the MHI device fails to
> > suspend.
> >
> > Regards,
> > Loic
> >
> > >
> > > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime =
PM")
> > > Signed-off-by: Len Brown <len.brown@intel.com>
> > > ---
> > >  drivers/bus/mhi/host/pci_generic.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/hos=
t/pci_generic.c
> > > index 7193a384cca4..b036fa6e06c4 100644
> > > --- a/drivers/bus/mhi/host/pci_generic.c
> > > +++ b/drivers/bus/mhi/host/pci_generic.c
> > > @@ -1727,7 +1727,8 @@ static int __maybe_unused mhi_pci_runtime_resum=
e(struct device *dev)
> > >  static int  __maybe_unused mhi_pci_suspend(struct device *dev)
> > >  {
> > >         pm_runtime_disable(dev);
> > > -       return mhi_pci_runtime_suspend(dev);
> > > +       mhi_pci_runtime_suspend(dev);
> > > +       return 0;
> > >  }
> > >
> > >  static int __maybe_unused mhi_pci_resume(struct device *dev)
> > > --
> > > 2.45.2
> > >
>
>
>
> --
> Len Brown, Intel Open Source Technology Center

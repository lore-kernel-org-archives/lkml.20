Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ECC4848AC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742653; cv=pass; b=Ac0fYeFLxpxtzPWqAWVZB6GhETYlEZni84rTKEUhj2L6aKiiu4TQLqnGnCRTIeDRSvlG7WeBtDOKckUvctgyLGjw9XNoT1A04k3U4ELufLf7Rz6LnsSBPQjkES3euKp738aK3Ka2SiaSYQZ/SmaGTMzD/xUEtmgje4/ppz6kpfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742653; c=relaxed/simple;
	bh=AcIVnsv8+2abkkPu8NU5Qxz7g11MxL22mpLiDkD0gKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QJH8O8dztU0yn8us3mt8k4GUPe/oT35ped4etY18llcnY2clHXzxrnhpE8ilj77wAystDAxVa7O6aV2yFzODM2JAVgUu4is4u0AX4iTuDLAX946k0Yf+obOB2YCO1NBFLmgITrc8o4jZLit924X80YiQVR5YKrnLBrlATtvm8h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ev7OIqCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RHy/C4DA; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ev7OIqCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RHy/C4DA"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IDOw0X046047
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:44:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=; b=Ev
	7OIqCyObUjNIYqgsGclT+aFxz83DUJ5JXZT1YC6XQjxLTh3EEaGOdepPGd12JWPt
	sZhx4jpPGdr+yz3nJlvsx6/AXs0kGN8dhvgOuJnVPciG6jzrsoJWgWWnPhPsIxf6
	3GiYTYXTEMqGC4s8SoIIlq2bZTOOD8HFMPeqkNED+u/EX62sCxUgBWabe5hWda6H
	D5yQZU2fp7T/7D8zGS2ZTco/Dqz5b6+B/Nn00miVFLDHq46FqHcbpzmLl2uA82CZ
	m68Mrfof4f/gOFIrxUyH/q02GBWfffLXvKzCw+6k1RwHJBACJHECKXRIR8CaSl8z
	3WGR4a2+Km/YB2IyJF7Q==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grmv5mngh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:44:00 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28deb7ee3so1374496b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:44:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789742640; cv=none;
        d=google.com; s=arc-20260327;
        b=ARpemLhJUwxNLiGiHKNVMKAiicutWX6RYasYOB4Jb4sYoSzQQuZ9Vx5wBQVg34atHi
         b7rxO+rNhya3Rg0gHsqnXbWkpE9FcDJHa7ceQ9PllJnYJvmxVSHArgZMWKyvXO+9/bSD
         WvjsXb5jh3f6wndJISA12B9RAL/NHKb+xRI7unCORP5SPYjG/GdI6q4RvVXm3lawZsH5
         p6cNnwrkad2cFnnPSKJJ1vBbDrNuNErxFkMHj+1vIaSwKKx89nO4LiSX1PPzXLLA1tB0
         8b9hXPS8UfnMG45/eCcgp/0BFk/2/5BF4poWHf8tgADmF+k0REMCUhqcWg+GN7hJphhe
         4//w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        fh=gGzxfHUOyNxLYZFGb6qazzlp1FGF7N7XufabhdeIPkM=;
        b=CenLY3bbJHq9Tk9e5hb7ekwxxjtMy59zDMzLMx9p6uU98q/0redNFKcOufMYNCTVCM
         7pVFMpTDFz1PvdDqSO2cejAwXz40UXBJSTZISGNsWb4AitNvCnC1abgRblup7860mL8W
         jCfcHIXuAqlj8O6xkhTT97IFIQWYHwMcIZZAPGlKE1mivgX+nQeT7SgKyA5+PvR8Kl8o
         itsD9jO5nVWt7m17mgvKBL/u3BycqdygIhSTwvL122ikGG5l+6aGaQeZCM6IrPTZKEHD
         /PIVRVnu/ZugWrgFmh3vuIuPEOvE31zysRSJb+PQhNrvVMu7LqSUhDWcbAaQuhwYtGxa
         29ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789742640; x=1790347440; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=RHy/C4DAuXxWZLN9KmFfG1qic0RcRsh7bEtRbfxNPCkgEjtHUsRI6BaXAweNOAqyAo
         4aFCylBGOe2UVPK19w+Sf4MxXBXRyrjLOlzGy5roqTv8D+ZdkzEGlS1W6wHa0n8IomtJ
         y7j8Fo4/UdNQ33XdgEtj3vG9+7SJeKBVzildLanG3TuuA8yPKhv3VBlY9tmbz1kVu1FM
         V7Vn5sAuErRDuh9evlVbOHRaZEYzK1w1N+rZmInk12Y2Tnpy7UfnXCml6ui8Mz7mqoSC
         HDeu5QFOub2wCspalht0GradjJ32Pq1M5/ZrqYVFK8R8A6Rrrv9WumO9eMx3Fa4AotCf
         AAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742640; x=1790347440;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6tY/LrwQ6+wUFwfZF6CF5RRZwGXtm3/veslsZpmF+Q=;
        b=eUiWodlvnMYGal8e28YnRWHnWGQLPaUs8Mk6u5RRUmNV56I7bivJhHwqVuuxsEt8sa
         bSwc6TYdX/YOuBEPJq9OI5uO/s3l/+dmUUyyOgF/GvXYl5MTQVLDamdRQmj62N+ECaO2
         GLX+x0RA4M6YbQDUfpjtY/fv19Bg4SlaiA+jes4eOlDNpQ0WF25wR0bH6orowxbxTGH6
         yGxLNkt++C60j4mJqm569PnugUqGMsdDWF/CKyKGwVKuOZL+tieUhBr/7eRMEmQTUnDy
         2/4wHpIByy27j96OxQdO92U02swKe9O10XUHzOYxyp9DxKa777V5x9rdD85keVbl0A1t
         7QcA==
X-Forwarded-Encrypted: i=1; AKwUvBy7A4CKh0c/PZqiSZ8n+HgcUlyBOURzWP1hiAriWrwW67J1SxV7d3JxiCZoYpPpXcoaMtrXie0bnPnVT+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++k9NZnXlEt3oz6DKFZ4+XIe3Il5acDtDKCzJRH22RIHmEhpgxbZ
	O6xY1XI2rL0PXTSuuFpAKjwi794OY7zOMuG3HRzJ2GKw3pDKrxNoeRAJKnlLiPQlVJl+WxvAIuc
	uaqOR14bTN/hr20BvwxqBsxv2y5aC44HcFpeL3INmFj7wS1AMRdfFvyJ4MRsQCaYLmw7kFX2Mml
	8GzW96Bf2r28sUxPnL0abv0bF9DeLmzXVWXLfJl0zofA==
X-Gm-Gg: AYBFou0ZhuRkSU937IPDxQ0+fGcDEzk9pXvRJ/85BAWN/swAVsMZEkU+mOQiq6JvR+X
	C/BsaKu+otBVnTSP4AxkRKNYigCQmhtDFGjh8QNtjYhEol0mBYZMVU9SrOi19ODaLuJohi69h0f
	9dDh9XjA+2zAPsharJW02Ma8O5Q+ZlhZ2EVQOJeedN2HmVWGvmy1oIK5g5
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id 006d021491bc7-6ca9a74fec8mr2397338eaf.23.1789742639890;
        Fri, 18 Sep 2026 07:43:59 -0700 (PDT)
X-Received: by 2002:a4a:e908:0:b0:6c3:42eb:ec22 with SMTP id
 006d021491bc7-6ca9a74fec8mr2397308eaf.23.1789742639405; Fri, 18 Sep 2026
 07:43:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918092951.5656-1-johannes.goede@oss.qualcomm.com>
 <20260918092951.5656-2-johannes.goede@oss.qualcomm.com> <2104f437-e960-4e55-b0e1-2b37126e8c2f@oss.qualcomm.com>
 <82a72918-7bc7-4e2c-892c-0dcdd6dd5548@oss.qualcomm.com> <3f51bf6c-5318-4e32-a1ca-3ce8cf8c4ceb@oss.qualcomm.com>
 <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
In-Reply-To: <20260918-roaring-bee-of-acceptance-50a8a9@sudeepholla>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 07:43:47 -0700
X-Gm-Features: AcwNN1XOxS8g7aUV7HRRWF2PBl79h7D0NcKpS9p8imqdtEwjj4hgkc90NvRmmmI
Message-ID: <CACSVV01N8v4kfC0S8YZVUmyOvWcSKX0jFax4_S6vTpbB11X4HA@mail.gmail.com>
Subject: Re: [PATCH v7 1/2] module: add SCMI device table alias support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Frank.Li@kernel.org, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX4PGcHLZS/W1m
 B5VhRw9/hmXhm1HlpaHmGJYpzKa7s4adXIcR2yZ0nC/nJ6xEXdOyIBUyStCZsMhIWY8vIouLLQf
 xoXqcvVlWvJVTdCGGgZYxaLsqI8WJOPseIHt9eAZ984STPfWwqN9kXU7uSxUSn0vV+awo7WjiqT
 2Me1zLt1liHu5J2plY97OXbhmTYukPo7tvYNe68tFg1hZnXaMe8ALguTOcPQmDVHxtHpavJ49cS
 n/k++5+C8KUqvv/TRpaScetNLY3FManRWB+KDCRvaMEFYZbwIwK3YECFxzTdB75xpaqF4zX021s
 Dt1sSjXdbGF9UzmOy3a0LDZh5kN8+j8B/6qcvfRKm0gApNpNeAjt2sTaLt861E4lvRgaO9PZUhE
 +d0K5zd6KFD74rT87o/QkrQkwtwExAcGCiXH5UZPjGf+SxsIfmukJyJgs62cUaUSRyjXPC+wdgA
 FbXwTXE+wYp1WIONZjA==
X-Authority-Analysis: v=2.4 cv=E+5YNqdl c=1 sm=1 tr=0 ts=6aad4e30 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=CY0cOUppvrph7IambT4A:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-ORIG-GUID: Ge9PS6N2L-vChJix_3qWGvHl1rhwjMER
X-Proofpoint-GUID: Ge9PS6N2L-vChJix_3qWGvHl1rhwjMER
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwOSBTYWx0ZWRfX83NX6KgubJ0v
 s/GZaEZASFDreBJd7kdvwIAKCO730gayOtu+JtUhwp9P1/5DjYcUGYiT7+01pFt2jrTupssS4TA
 R8j9IptD8mjD9y0X//qMZiWAW5ezXVU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180209

On Fri, Sep 18, 2026 at 7:10=E2=80=AFAM Sudeep Holla <sudeep.holla@kernel.o=
rg> wrote:
>
> On Fri, Sep 18, 2026 at 12:13:10PM +0200, Daniel Lezcano wrote:
> > On 9/18/26 12:02, Hans de Goede wrote:
> > > Hi Daniel,
> > >
> > > On 18-Sep-26 11:53, Daniel Lezcano wrote:
> > > >
> > > > Hi Hans,
> > > >
> > > > thanks for taking care of that
> > > >
> > > >
> > > > On 9/18/26 11:29, Hans de Goede wrote:
> > > > > From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > >
> > > > > SCMI client drivers already describe their bus match data with
> > > > > MODULE_DEVICE_TABLE(scmi, ...), but modpost does not know how to =
consume
> > > > > SCMI device tables. As a result, SCMI modules do not get generate=
d module
> > > > > aliases from their id tables.
> > > > >
> > > > > Move struct scmi_device_id to mod_devicetable.h so it has a fixed=
 layout
> > > > > visible to modpost, add the corresponding generated offsets and t=
each
> > > > > file2alias to emit scmi:<protocol>:<name> aliases.
> > > > >
> > > > > Use the same stable alias format for SCMI device uevents and sysf=
s
> > > > > modaliases. The previous string included the instance-specific de=
vice
> > > > > name, which is not useful for matching modules.
> > > > >
> > > > > Assisted-by: Codex:GPT-5.5
> > > > > Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > > Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> > > > > ---
> > > >
> >
> > [ ... ]
> >
> > > > >    #include <linux/bitfield.h>
> > > > > +#include <linux/device-id/scmi.h>
> > > > >    #include <linux/device.h>
> > > > >    #include <linux/notifier.h>
> > > > >    #include <linux/types.h>
> > > > > @@ -951,11 +952,6 @@ struct scmi_device {
> > > > >      #define to_scmi_dev(d) container_of_const(d, struct scmi_dev=
ice, dev)
> > > > >    -struct scmi_device_id {
> > > > > -    u8 protocol_id;
> > > > > -    const char *name;
> > > > > -};
> > > > > -
> > > >
> > > > What is the reason of converting the char * to a fixed array? That =
limits the name and may result in truncation and potentially name collision=
, no ?
> > >
> > > Because of how modpost works to generate modaliases inside the .ko
> > > any string buffers in device_id structs need to have a fixed length.
> > >
> > > So the truncation / name collision issue pretty much applies to all
> > > foo_device_id structs in the kernel. People should now to make sure
> > > that any strings used will fit inside the fixed string. And I would
> > > expect the compiler to warn for overly long strings.
> > Ok, thanks for the clarification
>
> Not related to above topic, but just wanted to check with Daniel if this
> solves module auto-loading for you. Was there someone else who was testin=
g
> this series and was having issue with earlier versions or its you only
> Hans de Goede and it was with v1/v2 when Bjorn posted them. I remember
> something vaguely and couldn't trace back all the versions easily.

I'm using v7 on glymur slim7x, and it solves the scmi-cpufreq autoloading

Tested-by: Rob Clark <rob.clark@oss.qualcomm.com>

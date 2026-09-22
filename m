Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD526345CDD
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044257; cv=pass; b=fPgmEN6GsRyYVKwQSfS2B6Kbv54AW6+o+xsi6GODrWkuPN54rFYSrhdTKYHt5MUGl8iYmUq2W+ey8dilzZcjnC68eYSyyA54Mnuyjj9zYZXsOr7IY6EAIjAKJs78I2ueGKzBKHsr6mMJZ/S2P21pjP/kTVgdU2R1KFXwovnlPOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044257; c=relaxed/simple;
	bh=AW06IYGBZCMrnj6vF3EjvS2PfT8TCt5zGPrwG5ZFPyQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oe0iATGBOE8H9Taua/UpsSIzVtxx3dKybd6vlSjLYUdFy6Mgs+aVOLZ63MiwPxZWcVP57rM1MRMpCa9DnW5PWTNU0d1IEPrBJPgDOAhx2USgzjL5PyYAzIDhSJjPPDA+HqQQvkAfzyXHUUh1t6wfk/FXDsSw6ezQb7u4bfz1mEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OmgSqfXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GUbOVOaL; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OmgSqfXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GUbOVOaL"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00FJD2824285
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:30:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=; b=OmgSqfXtSo9MtmfT
	2zAqToT9hUME0YZ7jll34Ab7i20/Q5mET2GUbb0pqMcDLIvmuxTCoc27nVu2XzII
	yOnX7o+VcZs4tO6G5VCQTW1LuMkflRW2QgYgZanKQD5rNLIyfvsjuKZiMcOudEh+
	WOWou7Pq9+0F/ODvw6S0c0kfwfOcyk8qDfKDIml2lKOf5zTJt8ZEk86hWotjCvqR
	3pT8drqXqcEP/YlWhem/BKG9yIOCfOfvuOaBnfG3GYlhOlWAGiVOGfU3EfH9RGAy
	ybcScBRc0z1DooHEHxr4aplAqN4VYvOHrMX8pUN9P9NGP9kutHQTpbXpKibI+xDd
	EmsLwA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3cskd3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:30:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8632fdf67dfso552668b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044254; cv=none;
        d=google.com; s=arc-20260327;
        b=Phf0brE6RRE5in1oj08OO75KL7RAh0nyR7hAnJANnRS6Yzlv4+/bYcpOyimZOQ4ur7
         us0YUmMvHfLZjXDgLlWXhQOXgrzRgG9zpuxtmnvoNUdS9EI8mckjORpcMYXs2NYNOqsj
         R0e6600irwY3SzU+cWJsHrJzoqY88oaj070tqN0QFC3G+Jtdnb+Ezpa8KZOO/SUoZ7gn
         VTiI32rtam6CVO+zDyuZEu2mY1GU2gigvQWRkBUzNfUQe+sCD2RHZKCUrzB9p+v3VM7q
         plNR5p4mNvb0Zwd02+cShOHPj7rDxhdab7kcB/AV+4suZB9xnhhsQt9dMmj6A2VA169v
         0C5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        fh=8icHkFicDZz0mK8CEsojKw+viqnCqyl2JodVtwlDJnk=;
        b=nXSfacXA+jr993Xrw5JaHwrfDuQtLUOutPyg8pGL4jJqwVExUPjgAJ057fp4CnXiQa
         VGMF8McIe28ftg5mav9NZUusXw44xL74hDaebx2+RUwZGLERt6HiKfUMsz+rm9wX6LRt
         pVI+HhQTYuakvHrhphgc7vfuUuy/ChdYFJxoTYaHiLYlfIq92wQM0ZpEf93H6nhkvVhz
         ybXDno1bd6ABSpfa+kJTl8L3bocQ4TYItMliKwoKxAC5eImdfCozYtefA8iYE6wf6qKv
         H10RFHqDXS97CZfbPljtANOXt4RtpJuJ6pC6M8xbhA6vuDR65v5YEOCPc2Q/TV+zBetv
         EMwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790044254; x=1790649054; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        b=GUbOVOaL8HZJmUrwA19ddVNAwKo1JcdYyyDTWc33q2JDXdgQCbka0R1nteBWiF81SB
         wlo+edgq6mwUG26wB5GB3EpMopDTZ0cvWbLcUjTdS9uE2TRR4nplBHYpvZafmQOGeAXV
         0xpgaP5jZrWSE6LyaPI71foRIPTKy+MJSCwVPxb6Hw2qM484cUr4UbmS3XQ7LU7n9AY0
         UsxMCyPQtOU03A4Q66wRQkKH/pPBTBbSccHi5ggJS3ZWP4SVdm7EkThY6wic80idm/P8
         Y+FjcEMfQZt48K2VUPG55ag1wpcsLBYFStAYdia4/Z44L/nAItiz7z5c8rM3q8SI1VUs
         VAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044254; x=1790649054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A7JiqZAdlBgbBa5ulhMzb67AxAAG/vlMp5Utn+aZ8no=;
        b=wCcOlB4qQ9ieV1GkEDF/h44CxR3QMcZpsOY+G06yoDnVp6kQaAh4K4+1eLRvMoE8HK
         3n00uGQzRsMsnJvRl9qif2agKiY7vv3rI6fQhSHv12vczATfDbMgZlkzb84ejMEWQjhD
         DBVGyAJK4HXo+3/A7byv+dQy83tuan0ZSZ0qiuvjfJgCFSa1UItIh8ZDBzLhKpm0C7aX
         r3jypqceCG8j41P0LuT3yN71LZRi7AlNEARTOq/3p84eOTGk5uFNiCSt2TcTTs2JSOLq
         BnyGeHiMpI2M5xC9VKmTDYlFmeYVSooUQjMxbjg9c2VPOGoDPCow8c62cvJQ0VuSi6sB
         iLyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzaQ9ei/Wy/Zbbh3KTqk8kbt++AKnKUNbSY0jbjcgtoNZUZcjed5548yBdV7wJMjg4BMZYY8QxIK5TYz1I=@vger.kernel.org
X-Gm-Message-State: AFuF++mgWlFvov31a0/nwbQpNDVn4bb+lTu+VdkAHhhen4xaGx+jzvzq
	M+b+ow4QgoPFGqB9r3kZXkwFAoxhNn3TD6Xnf6wvb8gZQfboqHNAJiqcuuE8HEnEcgV9mhyZyPL
	3eZ6Rd4Q99W5YrZTgNmYu09Yp5Tl1OmQkvUuroPl3izD4rtmatJbt2mRP4ZFd+RAwtYze0oqo7F
	IP/4W/PjAgOApNaZbAX8FFD67iQQMPSRJvPU5S4Wx1tw==
X-Gm-Gg: AYBFou1QovK7ss99iYymT6WGh21wlFjef3zWrKGedI2RbfO7vIopdRsw6EELJ+gsQ37
	cZiayww/ltae83LfgPnqHlqdVQk3V7YCK4EwnIDWD2ysL1kVIMsJESxuyhenylDhhF/ISMh1IeI
	/y92lWBVr9wLsdfLgbpgOGCVWuu9ZASb0lF51pHMoEImC548FJ51oRCpXvlw==
X-Received: by 2002:a05:6a00:aa05:b0:854:b3d3:8631 with SMTP id d2e1a72fcca58-87bbf47c483mr1080932b3a.12.1790044254188;
        Mon, 21 Sep 2026 19:30:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:aa05:b0:854:b3d3:8631 with SMTP id
 d2e1a72fcca58-87bbf47c483mr1080908b3a.12.1790044253705; Mon, 21 Sep 2026
 19:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com> <BA4ECE62CC750889+2da1a0db-8500-4332-8954-e9f126604258@linux.spacemit.com>
In-Reply-To: <BA4ECE62CC750889+2da1a0db-8500-4332-8954-e9f126604258@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 08:00:42 +0530
X-Gm-Features: AcwNN1UY8XV7_aUB93jIu3Bz-IyBK8F8R8tUINGupIRIRT0pG87pNdVga_QmFwY
Message-ID: <CAHuiULDiFB234ev1R8bJKVppj+odtupmr=ic01S3a_HCXnHQeA@mail.gmail.com>
Subject: Re: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX buffer
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzMyBTYWx0ZWRfX2/M9WQS5+isc
 wDAT5ZwZFcStqSBjj+sBl7WOyibg9l0M6Uc2SFkMP63IRcX9hacmK38hdv43zienDYl3POi2rfI
 OmGD81EKfgHtb+P2L8fJdweuQ9Uh1tY=
X-Proofpoint-GUID: OliNIsf06U5mlGCWD_1GYpf-Y3fKlMY4
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1e85e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=G_Gx11oXSWwxtuNH6PoA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzMyBTYWx0ZWRfX5+75KEM9PVB/
 YTZ08tVrrnBDEQzahEWHxdBsynYseOr24C2WNiX3GY2hlAlu05Vy9fOnlve1tlnpQSE0BwbP6S1
 l8bVgQepVFiam6dBE4VrddYF+18hHVWKTC+IkDbtcbVtW7kXIg7jDZ6qtr20vHjvzauC9B2ss3Q
 16EoeFfL0L+acsdSm45kzPJb2n6WzW0Y2PVn4x2wnL2YsONzEis+DldUO4nMnwoCumhL9fW2xzV
 ApJ1WJUEIMC40H6WahLmEAPaM4mEgv3PxXzX1ZFcQEpWl58yvs86+H+ER79oNsUJOeIt0YIKbSr
 RTVA95SomCBY8CLdb66AKGst/Wyyn3GnCX3hPosDTuuzGcz1IWzJwDeUgCtmPnv+30Vz7kfQC1m
 m8NWermWaJ8L0tH36FsZCArViY8cr2Xa/ruB8fzTUS9MnLQwolK0AQW7JhfxuLd2A/qCW/JGT8a
 Ex/gNPviOimMm1pDaaA==
X-Proofpoint-ORIG-GUID: OliNIsf06U5mlGCWD_1GYpf-Y3fKlMY4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220033

Hi Zane,

On Thu, Sep 17, 2026 at 3:00=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
>
> > From: Anup Patel <anup.patel@oss.qualcomm.com>
> >
> > The RISC-V trace ramsink will need a mechanism to copy trace data
> > into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
> > and corresponding trace driver callback copyto_auxbuf() for this
> > purpose.
> >
> > Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/gtrace/gtrace-core.c | 22 ++++++++++++++++++++++
> >  include/linux/gtrace.h                 | 24 ++++++++++++++++++++++++
> >  2 files changed, 46 insertions(+)
> >
> > diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing=
/gtrace/gtrace-core.c
> > index 6ff1b3087947..53a3679ba69f 100644
> > --- a/drivers/hwtracing/gtrace/gtrace-core.c
> > +++ b/drivers/hwtracing/gtrace/gtrace-core.c
> > @@ -626,6 +626,28 @@ int gtrace_path_stop(struct gtrace_path *path)
> >  }
> >  EXPORT_SYMBOL_GPL(gtrace_path_stop);
> >
> > +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> > +                           struct gtrace_perf_auxbuf *buf,
> > +                           size_t *bytes_copied, u64 *format)
> > +{
> > +     const struct gtrace_driver *gtdrv;
> > +     struct gtrace_component *comp;
> > +     struct gtrace_path_node *node;
> > +
> > +     list_for_each_entry(node, &path->comp_list, head) {
> > +             comp =3D node->comp;
> > +             gtdrv =3D to_gtrace_driver(comp->dev.driver);
> > +             if (!gtdrv->copyto_auxbuf)
> > +                     continue;
> > +
> > +             *bytes_copied =3D gtdrv->copyto_auxbuf(comp, buf, format)=
;
> > +             return 0;
> > +     }
> > +
> > +     return -EOPNOTSUPP;
> > +}
> > +EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
>
> Is it really necessary to introduce `gtrace_path_copyto_auxbuf`? The buff=
er copy logic should be
> exclusive to the sink component.
> A cleaner approach would be to delegate this directly to the sink instanc=
e:
> ```
> struct gtrace_component *sink =3D gtrace_path_sink(path);
> size =3D sink->copyto_auxbuf(sink, &event_data->buf, &format);
> ```
>
This looks better.
> > +
> >  struct gtrace_path *gtrace_create_path(struct gtrace_component *source=
,
> >                                      struct gtrace_component *sink,
> >                                      enum gtrace_component_mode mode)
> > diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
> > index 78e2ead3db8e..bc82814e2738 100644
> > --- a/include/linux/gtrace.h
> > +++ b/include/linux/gtrace.h
> > @@ -257,9 +257,30 @@ void gtrace_destroy_path(struct gtrace_path *path)=
;
> >  int gtrace_path_start(struct gtrace_path *path);
> >  int gtrace_path_stop(struct gtrace_path *path);
> >
> > +/**
> > + * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
> > + * @length:   Size of the AUX buffer.
> > + * @nr_pages: Number of pages of the AUX buffer.
> > + * @base:     Start address of AUX buffer.
> > + * @pos:      Position in the AUX buffer to commit traced data.
> > + */
> > +struct gtrace_perf_auxbuf {
> > +     size_t length;
> > +     int nr_pages;
> > +     void *base;
> > +     long pos;
> > +};
> > +
> > +int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
> > +                           struct gtrace_perf_auxbuf *buf,
> > +                           size_t *bytes_copied, u64 *format);
> > +
> >  /**
> >   * struct gtrace_driver - Representation of a trace driver.
> >   * @id_table:      Table to match components handled by the driver.
> > + * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The dri=
ver
> > + *                 reports the PMU specific trace format of the copied=
 data
> > + *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK=
).
> >   * @start:         Callback to start tracing.
> >   * @stop:          Callback to stop tracing.
> >   * @probe:         Driver probe() function.
> > @@ -270,6 +291,9 @@ int gtrace_path_stop(struct gtrace_path *path);
> >   */
> >  struct gtrace_driver {
> >       const struct gtrace_component_id *id_table;
> > +     size_t                  (*copyto_auxbuf)(struct gtrace_component =
*comp,
> > +                                              struct gtrace_perf_auxbu=
f *buf,
> > +                                              u64 *format);
> >       int                     (*start)(struct gtrace_component *comp);
> >       int                     (*stop)(struct gtrace_component *comp);
> >       int                     (*probe)(struct gtrace_component *comp);

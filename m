Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3277031A065
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044073; cv=pass; b=nu7eyxRvhn5WmGnFjWHe9i6lnd+egh4l3IJsmIyOUIuzxcX22+eZNAUFFDF9AGunTh+J1v1OFYJch5MVrIKJoGQXz9vPRdsBvB6Ur/zmmXibtYQWps/no+qcFL21G8ehIrm9Bg35ulKL4YaE5NquuKPhBmfEpstsPkg5S3rVtAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044073; c=relaxed/simple;
	bh=PBXbfQahzQHF90/SugUjFRpwndefBW+lA8M3ETO3A+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+FfDZ7knceg51YNZpbe5GDJ2i0fiCaEilRXjGUwhY7Y3EzLACWsY0h1G444qhmbC9ENUM+t484rO5IoEnLplgAQZxAtpm1NXRDRlxfSFavsCsv7SIdo65h0BaPFRaWxEsp+acVLYoa29jVvRZo09i6Ihi9QOLSfnMyzXyO/HNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TLfrX6bo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flz4C5ZH; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TLfrX6bo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flz4C5ZH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00IAv2165590
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=; b=TLfrX6bofUWwDPly
	gZXGINGGVO5AQJ68dW/yRmImdb2CAIVPmjQGJ23vtv0HhPL9+RIUmB1Q9jBvA3x8
	JYTfKbItiwZMrcdFD7CEftispj+Mq+rXkfdhiXlwovLmOzK2mCGA8zHwCyEznck1
	4Dibg/4szhdrOg4SHitqYf41JCpMATjNewOwL6AX5LqJSnQSpqkM8aTbXIAdSSOK
	3fuy6FR0zZvvmdZgzuLtjcu+YrrHHU9BcmVdZfyl7ptvVfEwj+xGbTT+aw7N1Jet
	OFD2mH5R+D8zmfSJfO9MTmzaAs1MHHJukNGDn4frOpsAHh4bdde9FpkbuBHbJiq8
	ATgMiQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu8xess2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:27:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-855f662439aso7485794b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:27:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790044064; cv=none;
        d=google.com; s=arc-20260327;
        b=n0M7tBa3kxYU+onvYhTYyW00NL8g8jZpROYKC50kUTH3J3kFpuja8vyKkArScjyyqN
         3m6QzT5n9+NpO8EQRvEGcGKrp0u+CwTkGOIOaXMvIt1ApjTRcRj+e+esPCnhSJVc1TQa
         6EFG4cL+GBCwE0CbczrRQgxVC6VgBqpmJTZ+MoIBL4+CgidtWs7T9hz+4jpbUc4zhcaD
         7Z8Qrmt4vrTtKRA0GMEnUrz0MuO+VsgtiXyFoxRxuVdX/34acnd7IU1Qk5Zjy15/EZM0
         uIm5NoC6lR6khHrUTkV30e5g3AfQdUNLa1oMfVV8oV7+B+tpGTKZu9CkUDlXL0eilUwa
         Ju+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=;
        fh=bY5wAlNGLfY3bLLnleg+0yhN4CWYYPYruF6MfIL8sVM=;
        b=Ud2KwzdZvH47LsCzAdlPQogEpwnZYq7sxyr/tx9tm0b/SEEWpfArY54JeM+hxJRh8K
         q2k8kuu+5j15ABA6KKcYUONu3aLK950IpuarB4k2owmI9nuvL7gCPT00i8rp9iM+ojoG
         hgbClB48v1ZzgD1REUOammGwZqKDlAXYFopcj7ni3Mht/iT1mPbtyxZb+vxvXEpG/uC3
         UMfsgVXRlXj4ibOCbemcqObpCfNYBOxAZcyqU4LdV/WC3X8y93OA3r9dVkLwBQY1hpAV
         rGR3SXiT4ZG8Qp5+efqe07GK2+t2Cre/cZzY7cX8YsR+YNX8ENITUNVz9DCY3fDzbWv7
         qyCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790044064; x=1790648864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=;
        b=flz4C5ZHif8HCDvSXcd2+QSWkBhykx+r+It8xSxiWu6oXJ+ZtfoLhjUb9mcaARhDTL
         PJdziTLe3hReuH1nchhiFYFbPwv2zYRz35383kU0D1SK3eFyAJQT0c7eS6xMuZES1wMn
         h8KVUhLbCI+ETqjWPYL+P/75yjM5GUgep4D3Wcs6FevBVeH9+feEvrDbs2JkVgAxOytZ
         N6xs4RMccMjppdIuyN2kQTI4EMapEnSbxFmSYFh//PW/YXOb3nYs/KTCUqioyPZ9SjQ8
         8cDvzhEu/mxP/zbEoxy9A4X2VPNnT0hydL4phKWAgA8HW3D3RbvIHW/cJFUWK8oAt1P0
         caMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790044064; x=1790648864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efkaFbs0svZ56TfPgzDT0gUFWLrdLk7ZpYECRLU4pQY=;
        b=d9ZWIMsyZJk4e4odTirKO4Zm8ykn2dkzqqvh23hGRJQGA8iy5bB3z7EPUSO0p1LJvx
         he82VGVYKmgGnD0RaozVBxvbeAHeD7EXzFbnXHK5RhIE0hkg1HqG/VdaQBWIZ7xI0ZhN
         6WLXhkVvAQHHtoCecoU2zDatTMEIf/XnfraMn0fZX4DwCVGV2Ncr9ts/RAO3h2e3nRBa
         XgL825AN9o1UMhkvRV5Txgn98Eg5cti1jfkvBesXgZ8oSeAA3t4o9cJDJy/xOUq+uSqa
         oGHLKgLZ0OsAyzbNruMuvyfA8SUwTcwJ6wYij9rGLbohA1U166u0S6I+1g4Yxrw5B9j0
         J0Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzxbplMjD23L5HvKXTO4zz/srApjoHkiIFwKtVgLcGEfT6Zw/oh7DBsWOOEnVmHRGgn5vsxFT8ejUaeSMA=@vger.kernel.org
X-Gm-Message-State: AFuF++no0M9ox5BVEHys169V9OoDLckEEPsCBKHNF8bZIfWFNkn5+Wbz
	GBXXsBuHK77QggcN/4zeOeMEDg0eQ0aL9a6vXAAxsljEfmRZTk/J3P7u7ALDjJoMEsGEBIFg6eO
	wAtyWio4RgXOCzCxPDda2K64iTbj5G5EPKapxeUjEDOhu6ajilmJ8AeRoAtfop0/qiS1IGbtJBE
	Dh3OqxzGEmC33cqvE2Z2TOE2M0T0LZEGfF8tkH8nBITA==
X-Gm-Gg: AYBFou0ygDDfKTABPi/gGrcmXt3BCKlos03AnhvDGQS0ot1U4w4aOl6IW201W1vjFsZ
	SIvHmRaEpunxFKx7TFVFYaXXLCcKFhTUIl2xum4NMFV+SUDc10PhCY4w9Jejrh/XAQKjgFq6LOU
	PUZLYcZDMNPWtFsITXupzgMbYtElFO53TJa1ETa8f8bKhLobJancm2k2QMDw==
X-Received: by 2002:a05:6a00:44cc:b0:874:708d:b63d with SMTP id d2e1a72fcca58-874defffedemr19574175b3a.30.1790044064184;
        Mon, 21 Sep 2026 19:27:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:44cc:b0:874:708d:b63d with SMTP id
 d2e1a72fcca58-874defffedemr19574137b3a.30.1790044063638; Mon, 21 Sep 2026
 19:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com> <B7328085242CCEBC+79e771a5-04e6-4265-ab84-6c2848c0aa3c@linux.spacemit.com>
In-Reply-To: <B7328085242CCEBC+79e771a5-04e6-4265-ab84-6c2848c0aa3c@linux.spacemit.com>
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 07:57:30 +0530
X-Gm-Features: AcwNN1WQVh60GhXWjN0tWHimbpuIGnpll_is9o_jRl113Lwwea-Ls66qRT80Qqo
Message-ID: <CAHuiULD2JtbzB_XzatuqbJ3WKKaXcCccvVLuyuXbQHpZfpL9_g@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Zane Leung <liangzhen@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: E6apEQD0wNF7HV5FnUK20ant002p1_3I
X-Authority-Analysis: v=2.4 cv=PZhqFShd c=1 sm=1 tr=0 ts=6ab1e7a6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=lv0vYI88AAAA:8 a=EUspDBNiAAAA:8
 a=u5_W_ptwCWc4fyQ0cBgA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=9qqun4PRrEabIEPCFt1_:22
X-Proofpoint-GUID: E6apEQD0wNF7HV5FnUK20ant002p1_3I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzMiBTYWx0ZWRfXwvI0C1MJn+7d
 UJzppbrkormKG0Qd8DdkcHNNQHRC2WJzE3UkkyU22PBEFRVFmWEMgVw3iPxb/zfPuMYr21vEKAk
 92SwkZF072Aq7Zx6OV16Lb+NbKAJ3FGHzQFgjyLyPrZ814LAoMk63I3RQG1GME5bL2bQJOCvwXP
 4EEe2pLCvPQRb6I6sjLROj8MSA8kqQWtcpZvrWIvitlwde4IxZzMqs2uqXs7qxtTbGMvfXKpnHa
 T80DDkvN1xEc9Eg3/edTuPwpom7lyvdldt7Na6tJ8DTy9MtPXSN32vAT+yhISdC6YYEhClqAQt+
 z1bqT6Sokx/xJnWEO5DbCD2Q5rPegfTvPakcStW6SqaaRa38BtRyN5qntJrmfAiW8gn2etsp/oc
 lX6uYS+pRxHougqyKQhJWfzK28adkIpFYORHoKqy3guv7nSFiRp1VGkz+dT9/E6ZSYgaId1Qy2F
 DmT8sjv5IzlfXLEQMqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzMiBTYWx0ZWRfXx7V/zbB1GHMw
 usAJ0pyhAYxoPZRISjedXgPZbcyj0MInZti89hFncYFIsYkMrlrSZFQbARS7C4lSxh/tti6oSrX
 +UH8GJYhp5tijDLhAkvTgjpp3H5KKKo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220032

Hi Zane,
On Sun, Sep 20, 2026 at 4:28=E2=80=AFPM Zane Leung <liangzhen@linux.spacemi=
t.com> wrote:
>
>
> On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> > Add initial implementation of RISC-V E-Trace ramsink driver. The ramsin=
k
> > is defined in the RISC-V Trace Control Interface specification.
> >
> > Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> > Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> > ---
> >  drivers/hwtracing/gtrace/Kconfig           |  15 +
> >  drivers/hwtracing/gtrace/Makefile          |   1 +
> >  drivers/hwtracing/gtrace/rvtrace-ramsink.c | 320 +++++++++++++++++++++
> >  3 files changed, 336 insertions(+)
> >  create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
> >
> > diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrac=
e/Kconfig
> > index e3a621b59913..de4a3b533591 100644
> > --- a/drivers/hwtracing/gtrace/Kconfig
> > +++ b/drivers/hwtracing/gtrace/Kconfig
> > @@ -41,3 +41,18 @@ config RVTRACE_ENCODER
> >
> >         To compile this driver as a module, choose M here: the module
> >         will be called rvtrace-encoder.
> > +
> > +config RVTRACE_RAMSINK
> > +     tristate "RISC-V Trace Ramsink driver"
> > +     depends on RVTRACE
> > +     select DMA_SHARED_BUFFER
> > +     default y
> > +     help
> > +       This driver provides support for the RISC-V trace ramsink compo=
nent
> > +       which is defined by the RISC-V Trace Control Interface specific=
ation.
> > +       The ramsink is a trace sink which stores the trace data generat=
ed by
> > +       the upstream components into a system memory buffer. The buffer=
 is
> > +       then copied to the perf AUX buffer when tracing using the perf =
tool.
> > +
> > +       To compile this driver as a module, choose M here: the module
> > +       will be called rvtrace-ramsink.
> > diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtra=
ce/Makefile
> > index 10a74f852115..3e0c68d1b632 100644
> > --- a/drivers/hwtracing/gtrace/Makefile
> > +++ b/drivers/hwtracing/gtrace/Makefile
> > @@ -5,3 +5,4 @@ gtrace-y :=3D gtrace-core.o
> >
> >  obj-$(CONFIG_RVTRACE) +=3D rvtrace-platform.o
> >  obj-$(CONFIG_RVTRACE_ENCODER) +=3D rvtrace-encoder.o
> > +obj-$(CONFIG_RVTRACE_RAMSINK) +=3D rvtrace-ramsink.o
> > diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtra=
cing/gtrace/rvtrace-ramsink.c
> > new file mode 100644
> > index 000000000000..7ed25cf364a7
> > --- /dev/null
> > +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> > @@ -0,0 +1,320 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> > + */
> > +
> > +#include <linux/device.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/gtrace.h>
> > +#include <linux/types.h>
> > +#include <linux/sizes.h>
> > +#include <uapi/linux/perf_event.h>
> > +#include "rvtrace.h"
> > +
> > +#define RVTRACE_RAMSINK_STARTLOW_OFF         0x010
> > +#define RVTRACE_RAMSINK_STARTHIGH_OFF                0x014
> > +#define RVTRACE_RAMSINK_LIMITLOW_OFF         0x018
> > +#define RVTRACE_RAMSINK_LIMITHIGH_OFF                0x01c
> > +#define RVTRACE_RAMSINK_WPLOW_OFF            0x020
> > +#define RVTRACE_RAMSINK_WPHIGH_OFF           0x024
> > +#define RVTRACE_RAMSINK_WPLOW_WRAP           0x1
> > +#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT              0x4
> > +#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT  0x8
> > +
> > +enum rvtrace_ramsink_mode {
> > +     MODE_SRAM,
> > +     MODE_SMEM
> > +};
> > +
> > +struct rvtrace_ramsink_priv {
> > +     size_t size;
> > +     void *va;
> > +     dma_addr_t start;
> > +     dma_addr_t end;
> > +     enum rvtrace_ramsink_mode mode;
> > +     bool stop_on_wrap;
> > +     int mem_acc_width;
> > +     u64 prev_wp;
> > +};
> > +
> > +struct trace_buf {
> > +     void *base;
> > +     size_t cur;
> > +     size_t len;
> > +};
> > +
> > +static int rvtrace_ramsink_start(struct gtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D gtrace_enable_component(comp);
> > +     if (ret)
> > +             dev_err(&comp->dev, "failed to start ramsink.\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int rvtrace_ramsink_stop(struct gtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D gtrace_disable_component(comp);
> > +     if (ret) {
> > +             dev_err(&comp->dev, "failed to stop ramsink.\n");
> > +             return ret;
> > +     }
> > +
> > +     return rvtrace_comp_poll_empty(comp);
> > +}
> > +
> > +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf =
*dst, size_t size)
> > +{
> > +     int bytes_dst, bytes_src, bytes;
> > +     void *dst_addr, *src_addr;
> > +
> > +     /* If destination cannot hold entire source buffer then write onl=
y the latest data. */
> > +     if (dst->len < size) {
> > +             src->cur =3D (src->cur + size - dst->len) % src->len;
> > +             size =3D dst->len;
> > +     }
> > +
> > +     while (size) {
> > +             src_addr =3D src->base + src->cur;
> > +             dst_addr =3D dst->base + dst->cur;
> > +
> > +             /* Ensure that there are no OOB memory accesses */
> > +             if (dst->len - dst->cur < size)
> > +                     bytes_dst =3D dst->len - dst->cur;
> > +             else
> > +                     bytes_dst =3D size;
> > +
> > +             if (src->len - src->cur < size)
> > +                     bytes_src =3D src->len - src->cur;
> > +             else
> > +                     bytes_src =3D size;
> > +             bytes =3D bytes_dst < bytes_src ? bytes_dst : bytes_src;
> > +             memcpy(dst_addr, src_addr, bytes);
> > +             dst->cur =3D (dst->cur + bytes) % dst->len;
> > +             src->cur =3D (src->cur + bytes) % src->len;
> > +             size -=3D bytes;
> > +     }
> > +}
> > +
> > +static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *c=
omp,
> > +                                         struct gtrace_perf_auxbuf *bu=
f,
> > +                                         u64 *format)
> > +{
> > +     struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev)=
;
> > +     struct trace_buf src, dst;
> > +     u32 wp_low, wp_high;
> > +     size_t bytes =3D 0;
> > +     bool wrap;
> > +     u64 wp;
> > +
> > +     dst.base =3D buf->base;
> > +     dst.len =3D buf->length;
> > +     dst.cur =3D buf->pos;
> > +     src.base =3D priv->va;
> > +     src.len =3D priv->size;
> > +     wp_low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> > +     wp_high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF=
);
> > +     wp =3D (u64)(wp_high) << 32 | wp_low;
> > +     wrap =3D wp & RVTRACE_RAMSINK_WPLOW_WRAP;
> > +     wp &=3D ~RVTRACE_RAMSINK_WPLOW_WRAP;
> > +     if (wrap) {
> > +             gtrace_write32(comp->pdata, lower_32_bits(priv->start),
> > +                             RVTRACE_RAMSINK_WPLOW_OFF);
> > +             gtrace_write32(comp->pdata, upper_32_bits(priv->start),
> > +                             RVTRACE_RAMSINK_WPHIGH_OFF);
> > +             src.cur =3D wp - priv->start;
> > +             priv->prev_wp =3D priv->start;
> > +             /*
> > +              * There is no way to tell if trRamWp wrapped around more=
 than once. As a
> > +              * result priv->prev_wp can't be used and the entire buff=
er must be copied
> > +              * even though some data might be duplicated.
> > +              */
> > +             bytes =3D priv->size;
> > +     } else {
> > +             src.cur =3D  priv->prev_wp - priv->start;
> > +             bytes =3D wp - priv->prev_wp;
> > +             priv->prev_wp =3D wp;
> > +     }
> > +
> > +     tbuf_to_pbuf_copy(&src, &dst, bytes);
> > +     dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
> > +     *format =3D PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
> > +     return bytes;
> > +}
> > +
> > +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> > +                                  struct rvtrace_ramsink_priv *priv)
> > +{
> > +     struct device *pdev =3D comp->pdata->dev;
> > +     u64 start_min, limit_max, end;
> > +     u32 low, high;
> > +     int ret;
> > +
> > +     /* Probe min and max values for start and limit registers */
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF=
);
> > +     start_min =3D (u64)(high) << 32 | low;
> > +
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_=
OFF);
> > +     gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH=
_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     limit_max =3D (u64)(high) << 32 | low;
> > +
> > +     /* Set DMA mask based on the maximum allowed limit address */
> > +     ret =3D dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_=
max)));
> > +     if (ret)
> > +             return ret;
> > +
> > +     priv->va =3D dma_alloc_coherent(pdev, priv->size, &priv->start, G=
FP_KERNEL);
> > +     if (!priv->va)
> > +             return -ENOMEM;
> > +
> > +     priv->end =3D priv->start + priv->size;
> > +     priv->prev_wp =3D priv->start;
> > +     if (priv->end <=3D start_min || priv->start >=3D limit_max) {
> > +             dma_free_coherent(pdev, priv->size, priv->va, priv->start=
);
> > +             dev_err(&comp->dev, "DMA memory not addressable by device=
\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Setup ram sink start addresses */
> > +     if (priv->start < start_min) {
> > +             dev_warn(&comp->dev, "Ramsink start address updated from =
%pad to %pad\n",
> > +                      &priv->start, &start_min);
> > +             priv->va +=3D start_min - priv->start;
> > +             priv->start =3D start_min;
> > +     }
> > +
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_STARTHIGH_OFF);
> > +     gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_R=
AMSINK_WPLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_R=
AMSINK_WPHIGH_OFF);
> > +     /* Setup ram sink limit addresses */
> > +     if (priv->end > limit_max) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &limit_max);
> > +             priv->end =3D limit_max;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     /* Limit address needs to be set to end - mem_access_width to avo=
id overflow */
> > +     end =3D priv->end - priv->mem_acc_width;
> > +     gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_L=
IMITLOW_OFF);
> > +     gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_L=
IMITHIGH_OFF);
> > +     low =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> > +     high =3D gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF=
);
> > +     end =3D (u64)(high) << 32 | low;
> > +     if (end !=3D (priv->end - 4)) {
> > +             dev_warn(&comp->dev, "Ramsink limit address updated from =
%pad to %pad\n",
> > +                      &priv->end, &end);
> > +             priv->end =3D end;
> > +             priv->size =3D priv->end - priv->start;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int rvtrace_ramsink_setup(struct gtrace_component *comp)
> > +{
> > +     struct rvtrace_ramsink_priv *priv;
> > +     u32 trram_ctrl;
> > +     int ret;
> > +
> > +     priv =3D devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     /* Derive RAM sink memory size based on component implementation =
ID */
> > +     switch (comp->pdata->impid) {
> > +     default:
> > +             priv->size =3D SZ_1M;
> > +             priv->mode =3D MODE_SMEM;
> > +             priv->stop_on_wrap =3D false;
> > +             priv->mem_acc_width =3D 4;
> > +             break;
> > +     }
> > +
>
> I think `trram_ctrl` should not be written during the `probe`. We may mod=
ify `rvtrace_ramsink_priv`
>
> through sysfs or perf events.
I think we can set stop_on_wrap later but mode must be set during prob.e
>
> > +     trram_ctrl =3D gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_=
OFFSET);
> > +     trram_ctrl |=3D priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> > +     gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OF=
FSET);
> > +     trram_ctrl =3D gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_=
OFFSET);
> > +     dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_=
CTRL_MODE_SHIFT) & 0x1 ?
> > +              "SMEM" : "SRAM");
> > +
> > +     trram_ctrl |=3D priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WR=
AP_SHIFT;
> > +     gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OF=
FSET);
> > +
> > +     ret =3D rvtrace_ramsink_setup_buf(comp, priv);
> > +     if (!ret)
> > +             dev_set_drvdata(&comp->dev, priv);
> > +
> > +     return ret;
> > +}
> > +
> > +static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
> > +{
> > +     struct rvtrace_ramsink_priv *priv =3D dev_get_drvdata(&comp->dev)=
;
> > +
> > +     dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->s=
tart);
> > +}
> > +
> > +static int rvtrace_ramsink_probe(struct gtrace_component *comp)
> > +{
> > +     int ret;
> > +
> > +     ret =3D rvtrace_ramsink_setup(comp);
> > +     if (ret)
> > +             return dev_err_probe(&comp->dev, ret, "failed to setup ra=
msink.\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static void rvtrace_ramsink_remove(struct gtrace_component *comp)
> > +{
> > +     rvtrace_ramsink_cleanup(comp);
> > +}
> > +
> > +static const struct gtrace_component_id rvtrace_ramsink_ids[] =3D {
> > +     { .type =3D GTRACE_RVTRACE_RAMSINK,
> > +       .version =3D rvtrace_component_mkversion(1, 0), },
> > +     {},
> > +};
> > +
> > +static struct gtrace_driver rvtrace_ramsink_driver =3D {
> > +     .id_table =3D rvtrace_ramsink_ids,
> > +     .copyto_auxbuf =3D rvtrace_ramsink_copyto_auxbuf,
> > +     .stop =3D rvtrace_ramsink_stop,
> > +     .start =3D rvtrace_ramsink_start,
> > +     .probe =3D rvtrace_ramsink_probe,
> > +     .remove =3D rvtrace_ramsink_remove,
> > +     .driver =3D {
> > +             .name =3D "rvtrace-ramsink",
> > +     },
> > +};
> > +
> > +static int __init rvtrace_ramsink_init(void)
> > +{
> > +     return gtrace_register_driver(&rvtrace_ramsink_driver);
> > +}
> > +
> > +static void __exit rvtrace_ramsink_exit(void)
> > +{
> > +     gtrace_unregister_driver(&rvtrace_ramsink_driver);
> > +}
> > +
> > +module_init(rvtrace_ramsink_init);
> > +module_exit(rvtrace_ramsink_exit);
> > +
> > +/* Module information */
> > +MODULE_AUTHOR("Mayuresh Chitale");
> > +MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
> > +MODULE_LICENSE("GPL");

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794679659;
	b=NR8P145kydMSZiIla553sOpOke9OaWq1qeimkYTr7IAtMJUivyVqhqXk6GWLe6l0nmAS
	 RBxNDuswTmF4/UMuIXSSdr0Vr3SXEAzO1gyJXHdYBkEx6CRnjnPzcNjB9b8b6gHX0byP5
	 EgE3SN2eVxKQr21NjEaJsI0iUKaeAlPE+x/LLrve7PDjQwVbnEdxNh6mmQk0cJaodVOhq
	 1vCoXOdRe17MGR0dU+rG1QZ9Zyf2C8j4wCxTyPcf47vhpLqmGbw2rKCqvX1xxEiN5KDmd
	 OAg/AHOqKLpQlOWG5o8B0BqeRFMwmuVHVK6OivM1Y8t6VATqiagqhrZnzEDasDOtM7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794679659;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qh8D85+/rqFc7JFnsbFf89BdzJYpnPx85C+buDkj5XY=;
	b=tWREYz5YuzfiuCIEZJ4U+VYpmj3dwRWTc9iy+XDtRcQ5pyY9hU4FqczuWFRhMlcFoIo/
	 U3Q1JIXpVaB8qdO5vIMoXCbR46f2OeXJIfbB5H3+NH/5ekAP8udGpW5JSX52ZU8xwOS1H
	 FnrGGA6jcHrd0XqPGx7+60iaBQ9Eb7WVtPzcjxKFfkP5Z0lm1rqnF0TO3P3Ys6sXHytBn
	 yibh1khHtaVmv3c0UTtUKxunSqwQ+JxXBG8jEaH8lHAN3kQQ5zkjZAZynSWa58xJ+vKK9
	 NJwXNanTwRONmp11obZ9Nem0bARxC/+9OpRAUTpXuczoOwvdAUX4TWiAHLuAohjPc2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nFscZflr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0+yUzZe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23843606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:07:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23843606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nFscZflr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0+yUzZe
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEHq6XG3679481
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qh8D85+/rqFc7JFnsbFf89BdzJYpnPx85C+buDkj5XY=; b=nFscZflrGPMCkiYW
	Lh+FAKQWMtpwvD4f0ymyjp5MatH6wZhJzl9zC0VfBlb4CLznKNOXqhGTp0cMkBxN
	Yqs2/ulE399Oy3nXDjqwMT5axIBzjHs1bR9RAL+R3TQxkxmzK0dXVlhP5d5t9lUe
	/5HVl+RYXsgMtNjSWPnDnk1yXl/L4TTyA89eKTO7oaMtBO1MEWsiyM5tmFtflv0E
	/yauIV2jWtd/8/QUtFfolRf3+rsRbvl0V8t5j+blh3K6DujjXv9jH4JbFZa3pk7V
	tiK328guRyflMlP4eUaNCaivD8RpE2DnUAtSIN8wyG4zOA1ZJ4EmNBaob9gjGvHZ
	Wv+A2A==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhhcgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:07:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1aa0fb7f157so2500084c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794679657; x=1795284457; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qh8D85+/rqFc7JFnsbFf89BdzJYpnPx85C+buDkj5XY=;
        b=D0+yUzZeG/f5jEhdqvrUrR7Ne+T/odC5RYT6YcpF99TRF3h44bSp2ICjKwg7T8gKIZ
         J1NUkrqnUMLZj8f7YjewEBnRfEzu6DwnFYepfW2gJECWpSzyrXpMud1uJxUw7liyYcRp
         Wn9yNzC68VjcQwEqq0R0+cVVH252VxOmsT++HCf9nvK/Z0GgNDEHztHzxNwnbrkLfdtS
         ifW8e0HkF9GdP7LMc3LrIQtV9XEzZnh2bqMRCLKbHvG46A89PTDtiElmt/TfNfDxj3sK
         ySDHlm0lS4cBy7do1uHjC3ZSOsPLIsrrUQJ2zaAbWRhVgp3nH2cEs5+dL/n8/s8AFwfw
         z2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794679657; x=1795284457;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qh8D85+/rqFc7JFnsbFf89BdzJYpnPx85C+buDkj5XY=;
        b=YfgtJXs1O33EgTFM1Shj0kMKnGzsF6nNz4wrxrKRYlxpjeS6wPWNX72sm1af/IbjAm
         nioJavQ2b0pQkhUCoFB7UQxWJttg6xqQG4HNHjO1Fr4TvpQAoHlGQS9ksAvn5b/5TxGQ
         49p2rPLkwGkCX48fXoq5yIERjM08JUFoX9DP5tbqFNwekpwyPuFSSGO4YzRmePP01b+G
         YqAD/D093LavDRO2Cg3jae8uSC46SJh+jAl7GuTlyonTRn2K2wV1k1yjt1yuWB/xuZXX
         t6zAla5NQPigF5rx4OlQ0YZ7ObMtoP/gg3gTB3EN7PrfglvsvQsPUAgA2lhieT0MZ5IY
         eWcA==
X-Forwarded-Encrypted: i=1; AL+hErHf5qW5DLyoAT6CWwCfTTt/MYoofbqjwhbCDR+6hM9z7WDVcxR8NDqf/Qf/9YuoXjJshuTzrLTzwAWTVQU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JnoPssNn+nU0qMO52pXgqUWj7h4OF2u+HriTfckgof8bMdLgS
	mjdDTa/y1x1GR+ABzIzooUj7c4AjdTX+6Tj1AtuLNcfU1++VeAAvZQHeLqX15qcl9mJ/1v+ieNT
	SCQ6LUsAoa8ZJ2PHQpTBcfKn6L/ze4cFTBRPRouts+CxuEgB8XJ9oft13g6eIhLmjEdc=
X-Gm-Gg: AYBFou1PiAsZ3PZrWHQEFSGMD9S8Kj5QP/UbVHIb7x+iYqdAM7stdp9m2JZ+Nh1qiy1
	2HUyzglhipWZmfFIZQpLU11sduHAA11jt5o6A1kG4B2E2GJgmWHyxPX8Q3MKFsNC75AHUN04zmd
	k9SaeN6GxEn3Vy1ztdxW6mAFqWhtPReVJ7ou5XjWD81urVzM3J2bZCf+qfN7fhyPUJRGqouuTFg
	Fqknr+FEQr4Gl6NLGDfhkpAJvJvQddirqR2byzytyjJ48GXDA0MtMm8FgXJO53wGv5jhs2KUr4K
	fHXmh0+W5eMeaVwm1U6f3Nbdj69dYZ5jtoygZqvUVWFdAW3L+0Dcm54IwTk5zd8/6MnOXgeUgGv
	lYUfTpw3IgSVuGZH7DqvULkv+D8bDgIIkp4ZU8OZ9k3BVdiGqFP6M9A==
X-Received: by 2002:a05:701b:4354:b0:195:76af:b810 with SMTP id a92af1059eb24-1b5030bb5a3mr5117167c88.25.1794679656887;
        Sat, 14 Nov 2026 10:07:36 -0800 (PST)
X-Received: by 2002:a05:701b:4354:b0:195:76af:b810 with SMTP id a92af1059eb24-1b5030bb5a3mr5117132c88.25.1794679656105;
        Sat, 14 Nov 2026 10:07:36 -0800 (PST)
Received: from localhost ([188.253.117.185])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031918c7sm24690685c88.9.2026.11.14.10.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:07:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 02:07:27 +0800
Message-Id: <DMV4U82NLDBL.2LTGJAM719DGM@oss.qualcomm.com>
Cc: "Song Shuai" <songshuaishuai@tinylab.org>,
        =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>,
        "Han Gao"
 <gaohan@iscas.ac.cn>, "Jinjie Ruan" <ruanjinjie@huawei.com>,
        "Mike
 Rapoport" <rppt@kernel.org>,
        "Baoquan He" <baoquan.he@linux.dev>, "Guo Ren"
 <guoren@kernel.org>,
        <kexec@lists.infradead.org>, "Cong Wang"
 <cwang@multikernel.io>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: kexec_file: Keep segments out of the new
 kernel's PMD padding
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
To: "Cong Wang" <xiyou.wangcong@gmail.com>, <linux-kernel@vger.kernel.org>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.22.0.r39.g5d778487
References: <20261114034901.107028-1-xiyou.wangcong@gmail.com>
In-Reply-To: <20261114034901.107028-1-xiyou.wangcong@gmail.com>
X-Proofpoint-GUID: 5UlsK8AQnXBlj-cLaDj793TJp0t-TeG6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA3MiBTYWx0ZWRfX2UwJVR0qyksi
 2Hh5kDs/TNuU1geKod6L6k9+gcTHqF1cQWiayoRx4VCAeHnZI/Cwl7R8u7YeYQkgPjj8IOlW5R1
 mIqaKL6SXDrH4yFFPmDF4HmgjJ7pv8M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA3MiBTYWx0ZWRfXzR4kALQ+Ud51
 9cBk+YlxxO43WA9dRTh3PZLe3VRlrat3zH7LlKW9D7EmrRdRAAneOhoyEjQY+PeeGvRZt8JBKWY
 5GOTkWIaktXFV/be0W2IG3sdV8InRLSDfM7FiXOe477giCVp50lLeK+CDTan8QQHlIC75WnOFkK
 hFYUCs+1m/21D4zzH86Vo5HCeAs7Z5rhvBuNEEdPck7P4rIyOuJKapyhb/MBMPSXN47iO0kqV/G
 Hv5b3d4BfhMtolCoyhNGm/gBaeiljdq/CMCip6EPJF/BN1Pq4SjKXUE7MlrXLUAIpalbVVYtI0X
 DdxhlhtC1G5TBBRWKsvBd35ccbMQqSR0dtYwdVc/B/uowVOQkXAjoXcrlCtc9S+dR3wLpvaFVKL
 wGOc9bjXSEww0BCJrEIboKnbHqYL9Ks+aOQ5kh4ofj6U0HJfqb+UkM1JctC4husmbLmGvTHGvHj
 K2p8lKL7r3cTNbizFVg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af8a369 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=RQ3dwY0XcLBFaqRX7rIGyg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IMt4O7P0LTl0bQ2OADMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 5UlsK8AQnXBlj-cLaDj793TJp0t-TeG6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140072

On Sat Nov 14, 2026 at 11:49 AM CST, Cong Wang wrote:
> From: Cong Wang <cwang@multikernel.io>
>
> A 64-bit kernel with STRICT_KERNEL_RWX reserves itself up to the next
> PMD boundary past _end in setup_bootmem(). load_extra_segments() only
> keeps the other segments above kernel_start + kernel_len, which is the
> unaligned _end of the new kernel, so they may be placed in that padding.
>
> The segments are placed top-down, which normally keeps them far from
> the kernel. A kdump kernel's segments are confined to the crashkernel
> region though, and when it has little room to spare, the lowest of
> them, the initrd and the device tree, end up in the padding. The kdump
> kernel then finds its initrd in memory it reserved for itself, drops
> it, and panics without a root file system:
>
>   crashkernel reserved: 0x000000017be00000 - 0x000000017fe00000 (64 MB)
>   Loaded kernel at 0x17be00000 bufsz=3D0x1c40600 memsz=3D0x1cb1000
>   Loaded initrd at 0x17db58000
>   ...
>   Starting crashdump kernel...
>   INITRD: 0x17db58000+0x022a4000 overlaps in-use memory region
>   ...
>   Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-blo=
ck(0,0)
>
> The load itself succeeds, so this only shows once the system crashes.
>
> The kernel being loaded may be any version or configuration that
> reserves the padding, so the loader has to keep clear of it. Start the
> other segments at the next PMD boundary. A crashkernel region too small
> for them now fails the load with -EADDRNOTAVAIL, and one with enough
> room boots the kdump kernel with its initrd.
>
> This was found while testing multikernel, which loads a kernel with
> kexec_file and hits the same overlap.

This catches insufficient space at load time rather than accepting a
layout that overlaps the target kernel's PMD padding and fails at boot.

Tested on an OrangePi RV2 (SpacemiT K1), using zero-padded initrds to
exercise the following cases:

1. With sufficient space, the patched loader boots the capture kernel
   and runs its initramfs /init.
2. Without the patch, a tight crash reservation accepts an unsafe
   layout; the capture kernel reports the initrd overlap and panics.
3. With the patch, the same tight configuration fails at load time
   with EADDRNOTAVAIL.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>
Reviewed-by: Ze Huang <ze.huang@oss.qualcomm.com>

>
> Fixes: 809a11eea8e8 ("riscv: kexec_file: Support loading Image binary fil=
e")
> Signed-off-by: Cong Wang <cwang@multikernel.io>
> ---
>  arch/riscv/kernel/machine_kexec_file.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/m=
achine_kexec_file.c
> index 26cd2a8bd0cd..0d2d43a7dbfa 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -251,7 +251,8 @@ int load_extra_segments(struct kimage *image, unsigne=
d long kernel_start,
>  	char *modified_cmdline =3D NULL;
> =20
>  	kbuf.image =3D image;
> -	kbuf.buf_min =3D kernel_start + kernel_len;
> +	/* The new kernel reserves itself up to the next PMD boundary */
> +	kbuf.buf_min =3D ALIGN(kernel_start + kernel_len, PMD_SIZE);
>  	kbuf.buf_max =3D PFN_PHYS(max_low_pfn);
> =20
>  #ifdef CONFIG_CRASH_DUMP



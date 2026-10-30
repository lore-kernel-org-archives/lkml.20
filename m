Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793378705;
	b=OYTMb9ip+xjzZlq52BPUTVzcRBzzU+JU9RC2HCP9LFlNEIVlGRtUAzEkz197AJxbIVnW
	 1/86WiBDJ49yZt7Y8eU7vNpxGRtBYKda1EymdtI/6wxaNMpRqR7UrD4tR03GFJVH9Jb5W
	 d1biww893U/EFZY3c1gaMlB3RUQgFCkMSfxeWzKvrZDILijKDpwVBcoBMe2H9dFzh6Q0B
	 4W6ARtAkzFN01QhwOj5CY1/JzQaTElq9l6sKySvrGr6ugfW75NMfjeH4keQzzjV1t2070
	 4E2OBWq2YfiYH6pVTMWwjf5uve5ietSAjEqFxBqqISOQ9aGYCeQRRIhmj39sQ/gLsNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793378705;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X4gXfFWzrAAB1pE8vWDPZE5eBfxI/HQXrT2ipqRLOnc=;
	b=326kjNhrXqe9OlolUUHKNcXuM54BGhRCnLXvVGn+u98I9C2IJw1xLkhAgsHlCj6EcOk2
	 6QfcmPrVOZQKXQlxHspLmXQ/N439QY/CQCzjR67qhOqeSRjej2kdo1TaGqoaQhzHW+ykN
	 hwHnGzz8iZfLzrMyPnkepl6b4PqawEbWJhcbmRxGslwUIYejqbX5VENKo2kSvlU+PymuF
	 Ponjwhx+rAUSuXX5fUNLNUgQjRdfb7rVaWzjwotm8oBa8LKl20WrJo4SBoywOBjKEG3mG
	 ND3wfJjd3uaWm7QVuu6LYda3eI1Bwu+5X2qmVbvvXArVL7wl5YLcGc4a0GG7f2v03dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=htdes4AO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V0go8NWe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B0E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B0E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=htdes4AO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V0go8NWe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERAJF4102831
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=X4gXfFWzrAAB1pE8vWDPZE5e
	BfxI/HQXrT2ipqRLOnc=; b=htdes4AO+n9iZt0DXneitdkwV+Ykb2/Aw/TRDXjd
	F9tFP8lKWNIV+hes2tjpSndXa/UeTaNzAKu+wcZa3tOi3dGj6Vnh/LzHGxBl92MV
	zyQ8C6zsFnkUZzaEHEk5hNmL+pnf/lkOuQK5GZhWNeoQDbQFbJIrACb0OTgtMUZR
	0DxJxwbhHM9BqHDDsbHkHW+R+nLkjzj6P6WoJPSGyVz07E1ro3Bh6SalnBR/IGVv
	ayoYxo/J+uqA+2kaB14OLprs/3gfPepSzHQaTIGDMmiUqv6nvUhnp5ntNGTUZH5Y
	xYIv+qXuiVvVGHLF1sBNMhbd1QjxKATaVM7cZiAqbyekeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm2e3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:45:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so181087185a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793378703; x=1793983503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X4gXfFWzrAAB1pE8vWDPZE5eBfxI/HQXrT2ipqRLOnc=;
        b=V0go8NWePapyoLjAaYkny1/j2KrvrfYEVJpD8eMbhL9CnnqNyC0Q64NWxw7Z1+/w8r
         pH7voZIFwLm9Vxegl2EftovT5mp8nRHsMNP0K6/xekgcTfOv3LUpGjcEE5WEx2N8ilLJ
         9uzFRZeD1gpayJ0WCpkhWzX/DD06L+d7PQcVWErtQbWAMwMp7reWCBHmrEL4DlILHc9v
         9mPyH80lr87EEdDY78v20p1+12VEPcbtK9gBHroT4A9pGJL1x0ITzH9FuofsGSMMliOq
         DIRrjRI2W6hDJfKESo1eQL8IDrcd+MtSAt47rr40edukoX+x2ia0P0jzyaMFEG8MkrT6
         93lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793378703; x=1793983503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X4gXfFWzrAAB1pE8vWDPZE5eBfxI/HQXrT2ipqRLOnc=;
        b=cs52IckiPw9OnF3EYNMaVJ/UsXclaEhVMh7SUN9o2Nzlt2V1O+uVP73lM4/sGBdaVe
         2KQNZS/31CnF5PqYj5m6ZQfcmA/5gWZ6HrAp6bcEx196b7Pja2LexLUK3jzGKY82IE0N
         NZ4eXCuypPgeO/ELGyESQiSXMo+TGk8tJs5XZMt31z8TA31ad5qbaZSnxxYg127POCXh
         S+KC6fcVMnN3+qQ1nFKIGp0JJVNzjeQ7P8QVQUwYVnM56otdfyDmuRLDVEzjKaT7dGLA
         KicA6sTTNDaX/V2OcZcQZcyrN6hL6LTAK+OhGKeH24Tz0jkuPSOLWDd1E0bPIm0upQh5
         ZJOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPxaIj9fFr0TAckMMSeenRpFuEEyC6Sbrjik738HSqyAothRId4FQ2Y0x66Oo4uON63qUOUtOat3PFhKU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiqSa5bTQk40w08zyp/a4dRCdel2dpsQzQmaVeWMP7sqA8YErh
	KomshDbcT11R1WpbIim0uRRbyoBCmqI/0vYRC61OrogmSvFn3DBjYieYUkSQrDBlnxFeEjwHKgL
	TB23g2sa8vqgIK5/OowvsFnrJ/WI7jgAqvZ7JiTHT3Lz2JCAptT1txBWnAPIWeIz++ovORGOGw8
	iZsQ==
X-Gm-Gg: AYBFou1Ws0LtGXTF1YAUxHAH87oXz7/OFFpvPBSVx5tceVU75zLwhzbWHPo+LNzx3kk
	0F+zlC2cGulcy4dNJqnpUkpQLKA5NM2SNsqSJWZ/DsK0jldtN1fHiUmKjVVeEAh99Q0ic7q3D/D
	B8j+y8JUp4lnRI8433EtDzQ5vHoPSL4ZJN+HUvf65zAnqeHglF0WDz4FJdwS9+sCt5VtEONfeka
	dBiYDs1o/jYb3HL7CeMyPn4hVYCQ8FJ7GLvo7Alm6iJPYkKKR5dv5lAbpqwvoKJnFWkPn48Qxxj
	M+2GpaHVdyQWEwGfEoxA4/YcyL8DVOqjIWjGumamW/F5qA/X+L64NvtEMZafZ3afE1j9XM4EII2
	TV1SMXnGpBz8Vc3B/ykVbyX7zX64sn5mc3n98KYm8htCwcUuFssFFl4ScNc/9qC0L
X-Received: by 2002:a05:620a:2910:b0:942:a409:35be with SMTP id af79cd13be357-94413382e84mr975379685a.19.1793378703198;
        Fri, 30 Oct 2026 09:45:03 -0700 (PDT)
X-Received: by 2002:a05:620a:2910:b0:942:a409:35be with SMTP id af79cd13be357-94413382e84mr975374585a.19.1793378702585;
        Fri, 30 Oct 2026 09:45:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm64496065e9.0.2026.10.30.09.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:45:01 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:45:00 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: vamshi gajjela <vamshigajjela@google.com>
Cc: sboyd@kernel.org, abelvesa@kernel.org, jwylder@google.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] spmi: core: Add generic DebugFS interface for bus
 inspection
Message-ID: <efzpzsnelpwa6s4c2r7ytq3ftnlm6ljhlsnxknyrkot66co7dw@3uixpuu5deos>
References: <20261030045947.3049598-1-vamshigajjela@google.com>
 <20261030045947.3049598-3-vamshigajjela@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030045947.3049598-3-vamshigajjela@google.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfXyTSRqgqgqpde
 b+lXuF3uZqotxKMipLkMBZwpH2Iv8Eg0REBpY1JO4lbGJa9MtlXwKqVMQ8C9ojQCwG4vyrM6eka
 vvnDs0FQUL63ILTIH/9uS0ANO9k+VUzWiQmSKKqPRYpi2jQE5em68oU63rjJohXz4RecPgtaDau
 0gqARUcdfwZ9neEV7dUeMRjMN4uD+EJ+S+YCgyfjeViIKuK6JV8XkPTcW5u/4n/PuR7lv9NwGEd
 f0/Y0CazwVnuvvWXyzJmiyjnF2ynVE7T/pNBeTtIOVY2hqlJOfugEx5nw/ap6KUcx7Rb/ph3/To
 Hov79O5IUS1ZWST6wrDf2toIK/IAHM2ZjBZqkWdT/xsdq50Eby0FQEhUJVnoyPjo7fS1OdCAkmT
 Wmvq/nMzLO7Tb9UzJcmDSaZMurQYSV62Anm9iQtowFpCxMpBHJKC8xNyCoV6dMADq5e0G0QMvC0
 SufuYl8doljK01VQmGA==
X-Proofpoint-ORIG-GUID: IzUvz7b2CiIaM3EOzTEKyCQ8fPzLjJ1L
X-Authority-Analysis: v=2.4 cv=IeoSymqa c=1 sm=1 tr=0 ts=6ae4c990 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=1XWaLZrsAAAA:8 a=v628xRtoYfD-_M25fesA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NiBTYWx0ZWRfX2AWMrXL2iWKj
 AeLHMIVTH/2hdwDinpHJh7gemsD+RE6ehmyvHODu61Usrdj2cUw7GBBjZJeqnkJoyR33J9CqfI9
 FzraI788IqQKL5Hq/ACigER6b9r6BBc=
X-Proofpoint-GUID: IzUvz7b2CiIaM3EOzTEKyCQ8fPzLjJ1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300066

On 26-10-30 10:29:47, vamshi gajjela wrote:
> From: Vamshi Gajjela <vamshigajjela@google.com>
> 
> Introduce a generic, controller-agnostic DebugFS interface in the SPMI
> core under /sys/kernel/debug/spmi/spmi-<nr>/:
> - name: Displays the controller parent device name and OF node.
> - xfer: Transactional interface supporting register reads, writes,
>   and directed command opcodes with automatic opcode selection.
> 
> Because raw writes and commands to PMICs can damage hardware and bypass
> client drivers and their regmap caches, write ('w') and command ('c')
> operations are disabled by default behind SPMI_ALLOW_WRITE_DEBUGFS. When
> enabled, they restrict access to root (mode 0600) and mark the kernel
> tainted with TAINT_USER.
> 
> Detailed interface syntax and parameters are documented in
> Documentation/ABI/testing/debugfs-spmi.
> 
> Co-developed-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: Jim Wylder <jwylder@google.com>
> Signed-off-by: Vamshi Gajjela <vamshigajjela@google.com>
> ---
>  Documentation/ABI/testing/debugfs-spmi |  68 +++++
>  MAINTAINERS                            |   1 +
>  drivers/spmi/Makefile                  |   1 +
>  drivers/spmi/spmi-core.c               |  20 +-
>  drivers/spmi/spmi-debugfs.c            | 341 +++++++++++++++++++++++++
>  drivers/spmi/spmi-internal.h           |  28 ++
>  include/linux/spmi.h                   |   6 +
>  7 files changed, 459 insertions(+), 6 deletions(-)
>  create mode 100644 Documentation/ABI/testing/debugfs-spmi
>  create mode 100644 drivers/spmi/spmi-debugfs.c
>  create mode 100644 drivers/spmi/spmi-internal.h
> 
> diff --git a/Documentation/ABI/testing/debugfs-spmi b/Documentation/ABI/testing/debugfs-spmi
> new file mode 100644
> index 000000000000..6a0bff9027a4
> --- /dev/null
> +++ b/Documentation/ABI/testing/debugfs-spmi
> @@ -0,0 +1,68 @@
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/name
> +Date:		October 2026
> +KernelVersion:	7.4
> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Displays the SPMI controller parent device name and
> +		associated Device Tree node.
> +Users:		Debugging, hardware diagnostics
> +
> +What:		/sys/kernel/debug/spmi/spmi-<nr>/xfer
> +Date:		October 2026
> +KernelVersion:	7.4

This patch won't make it into 7.4, so you can say 7.5 here.

> +Contact:	vamshi gajjela <vamshigajjela@google.com>
> +Description:
> +		Transactional interface for raw SPMI bus operations:
> +
> +		- Register Read:
> +		    exec 3<> xfer && echo "r <sid> <addr> [len]" >&3 && cat <&3
> +		  Reads 1 to 16 bytes starting at <addr> from slave <sid>.
> +		  The optional [len] parameter defaults to 1 byte.
> +		  Output is formatted as:
> +		    0x<addr>: <byte0> <byte1> ...
> +		  Each open file descriptor maintains an independent response
> +		  buffer. Reading from the same open file descriptor consumes
> +		  the response; subsequent reads return EOF (0 bytes) until a
> +		  new read command is written.
> +

[...]

> +
> +void spmi_controller_debugfs_init(struct spmi_controller *ctrl)
> +{
> +	struct dentry *dentry;
> +	char name[32];
> +
> +	if (IS_ERR_OR_NULL(spmi_debugfs_root))
> +		return;
> +
> +	snprintf(name, sizeof(name), "spmi-%u", ctrl->nr);
> +	dentry = debugfs_create_dir(name, spmi_debugfs_root);
> +	if (IS_ERR_OR_NULL(dentry))
> +		return;

No need to check debugfs return values, please drop these.

Also, the dir name is the same as dev_name(&ctrl->dev), so please use that.

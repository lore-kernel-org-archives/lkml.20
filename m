Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260457;
	b=2QIpeVwW3wIiWO6+8B2dyG2j1uz7Yj13ZCSifoxhBc4eT1ViREKwbm5FBbNtbLKo3tKG
	 +eMtf+4Kgvs6wtnJLJFqREUN8uhGGVEvSHqkt8LswLpe7igmtrJ4D5TCqELGz92m79KWB
	 k6Dx/1R8z/y+Mij2K2xUkANG/2W4Z13oNGdp9Cj/pZECOSRNabKKcmuxArljIMUTu7AT5
	 tXZm/ug4JOKBHUyuIdCmUuL+eeiIzj2NAwOWuMyRabHLTP8PUJkyaIETDSsjq9E66iVjs
	 8jBuDWwKoXnLLDWwjcXSwXcsqAN2nemgsKatR3Y/5ki90pn6bcy8jx5nWWkbQsq0OAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260457;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=LrVJrASEPDAnWNObrp4qXrz8WW/eaSb8dl6O3NDVmxg=;
	b=fCJ1YMUXb3GulejkHb1aKEIg+QHx02SbaWUv70hpDP+r4ii0ylfQLTqRsjDzEUji7ZRg
	 B5qGEes3mhSpsh5MpnynpEt2GxukW5V3pw1301LzZOjyK5Ra6Kvqi5ywn2eCn78zP7uEF
	 SCG70R0Ldu0AcVaka8qS99iEV6k/roHiAzXh8r01Oxw8fuI0vfKVqN2jGxOaJf6SKpFR6
	 GLtyxgcN3TIM0jWeaneuyjWNiZUgnZYJYC4tkV5C7e6tIVaby1kmS5/h5ZdMPtbzTz/KF
	 rw5n5pqEEQ0dFhrWF8Nyjv/9sJdBsdaSD5ZJNbYRQq2Au8uC+fRDwxOQwVWolVaQG4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=W3Z6vY6T;
	arc=none smtp.remote-ip=203.205.221.209
Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3030860A5BCC;
	Thu, 29 Oct 2026 07:54:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3030860A5BCC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=W3Z6vY6T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1793260448; bh=LrVJrASEPDAnWNObrp4qXrz8WW/eaSb8dl6O3NDVmxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W3Z6vY6TZfHAy4Y+vPcSyooBMikEHi52D0m+7YuCYNRgfX6FlWK6muPjrXxx64N+U
	 A6sc6wJoYN7Q4nUK+ZH10BMkTh7q/UoanX50F6UcqH73jn21/8QlTAeabUpo+4pAio
	 RkeGaSWY1zAt5bG6AfXcVywiHcGkgREymcxSbXAU=
Received: from shuai-VMware-Virtual-Platform.. ([171.8.225.58])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id D859381F; Thu, 29 Oct 2026 15:54:05 +0800
X-QQ-mid: xmsmtpt1793260445teksvypk4
Message-ID: <tencent_3B08CBAEFC7B931B6E90D8D8C4BF3BB1B406@qq.com>
X-QQ-XMAILINFO: Nm45YswcjhU8BGGHyu3meqLQYIY8JWZJk2uFMM7hVoKjeFDhPGQ5iaBRydXQlX
	 6ysxzfp8GF9U0uLGslMwuDHRF8YCzqmyEX6yRa098A90l59tqR69MUJmgLNU2l3HRSFBT4fOLBTV
	 kL5M8C6qLfPVUwCayo3/PXhtatIymY/WMLyQRHjQBMucJO5A3SoV6RGPcgpYGAIb/37AR95sXZ7R
	 +fgERJ6QDkMBqBSBbvBawh4aX4JPNC8ovL13Nri6vcDkTwijbDLPYmKoNPHa+1GMceo9bD+lCB/t
	 99cJP4dItZKTLUOMa3r1D/JbGorFwpe6668ty3iA2jJEYG45ED+ys9/hrzzfsFu28nxZLj0FuKGb
	 MAEfcIAqG6LBSyaEKsgYV7pmcq2dbaeNDTZJPepVRLcls8FHDQv0p8kb0PvssRJPhS7mD1q2+W9v
	 8tCuVNkEfuIWMQMr7FUg/hmxQ6vFToQeHMzl59eaLcc3fl6uonguJlDTQOYuMW3jDXCeuPzDPGyE
	 DhetIZeLXUBDK8OVvTWg5hZoL7IF48UnzcHrTId32ELzKy3EO/bVHyhb3HkNuWCRMYctxyWrJAQx
	 Z47oP6my2qKajZbGXgePtnctxBeJ+C00h3jhTMlyU/HBMaHTRj/JmTMyvXG/MbNyhYlXV2n74IMx
	 luI5FcueViqws2SQXx7OgwiViqz/j+n2GaIt2Zp8pN7InI3FP54mmJB9FyASV4INW+ox6K+WMbTF
	 mkTd+SO27OAjNdrNTgJzZTkkNxKlw7wELSRWSANSDYd6OYy0w2vSHdmUtEmFr/0Lyza2W/8xouaY
	 p8wjruLLucmoAD1pP4A4PT5N+7dFHz3e9DJcyRjMb9qdM6Gl+JTcAKemc6rUPPCUUknvtA98k8Yv
	 LpXlD1dhmRwkYSGFu99gwNvIuunT4W7+5RJJfg+8Hb5cN576dtFGY08tUDycD9ov1146p3LcvPyT
	 kEtHK2S9yOE3qYmVRjpbuXBcImtcRgqi+GXRupr84rKVnYzxm9fDN3F2gkT7J6Tph4aOFo1Z7gOK
	 p/JNEYxhvBK6e1E0ZyBR1F0EUeF0GRmem5uQOk2KQIAc8kqE9WK69bM4Cxc3GcNQXZ2FmEJGIKai
	 h6BIb3SVOI5MZjwBcPvze8a4RC8xb5u2fc0RIFbWntUuExUxQ=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shuai Liu <847807867@qq.com>
To: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Shuai Liu <847807867@qq.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] media: camss: vfe: add the gen4 block and SM8750 camera subsystem
Date: Thu, 29 Oct 2026 15:54:05 +0800
X-OQ-MSGID: <20261029075405.2907239-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028034105.326535-9-xiaqinghuan@mail.ustc.edu.cn>
References: <20261028034105.326535-1-xiaqinghuan@mail.ustc.edu.cn> <20261028034105.326535-9-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi Qianhui,

The gen4 write master programming itself matches the gen3 conventions
(the FRAME_INCR >> 8 formula, the 256-byte unit addressing, RDI_WM()
offsets), so only three things stand out:

1. The interconnect table does not match the binding

The binding in patch 1 and the DT in patch 9 declare four interconnect
paths for sm8750-camss:

  ahb, hf_mnoc, sf_mnoc, sf_icp_mnoc

but icc_res_sm8750[] only contains two entries (ahb, hf_mnoc), and
camss requests paths by the names in this table, so the sf_mnoc and
sf_icp_mnoc paths never receive any bandwidth vote.  For reference,
sm8650 keeps the binding and the driver in sync: both declare exactly
ahb and hf_mnoc.

Please either add the missing entries with real bandwidth numbers, or
reduce the binding and DTS to the two paths the driver actually votes
on.  As posted, the extra DT paths are dead weight and the bandwidth
they are supposed to guarantee is never requested.

2. The commit message miscounts the instances

The message says "two full and two lite CSIDs" and "two full and one
lite VFEs", but the binding, the DTS and this patch's own resource
tables all describe three full CSIDs (csid0/1/2) plus two lite
(csid_lite0/1), and three full VFEs (vfe0/1/2) plus two lite
(vfe_lite0/1).  Patch 1/9's message has the same numbers.  Please fix
the commit messages.

3. vfe_prepare_buffer() rejects formats at buffer-queue time

The 256-byte alignment of pix->plane_fmt[0].bytesperline * pix->height
is a property of the negotiated format, not of a particular buffer.
Format negotiation does not guarantee it: camss_format aligns
bytesperline per format (5 bytes for RAW10) and height is not aligned
at all, so plenty of resolutions pass try_fmt/s_fmt and then fail every
QBUF with -EINVAL and no explanation.

Suggest enforcing the constraint where the format is chosen: either
round bytesperline up to a 256-byte alignment for gen4 (which makes the
payload 256-aligned for any height), or reject unaligned formats in
try_fmt/s_fmt with a clear message, and keep only the per-buffer
address alignment check in prepare_buffer().

Thanks,
Shuai Liu

(This review was prepared with the assistance of an AI coding tool;
all findings were verified against the patched source.)


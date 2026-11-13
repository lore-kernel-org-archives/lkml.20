Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557363;
	b=JE5oAPPZOTb8oiY7utFcpNqQ0MlTaUo9av8mKFW7k1ND3BeTE9I/33KcKVTYZ2EFdz9h
	 0n/77RvKTiZ1TWQrWe/NTRwHD4V0iLWKwVI6+xhsM+j1gNepOlNXtO2bY+fVK2E6mS0IY
	 wTWPjCoFdV31a9NIiw2QfnElVJWSHcUFgnQN9wuPjuW5FOggzfFm8dc/UUEVUrZYK2+Ai
	 PHPYbMHorHlhKUw8QJUm79JJgX+Dj01LJhyQjAIFkHISxA5ZQvY6CQwmHrusWhYQjfQ3z
	 wLnLW13bBmGGqBkLOiPCSL6wDkg48832S1hh9gtgK+ZG2A+8K8ya4+DZCtgL1Uk0/kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557363;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=sk0AB92kLnOwj/CgVb2bep7o5pcDe4uBG2/l0BJ8l8c=;
	b=Pe3TpimZivyztpVA3CbHBZKUwWithVO02MXHZ7qJmYhbu5Y/ifwAwowwUYAjXCmHePa9
	 pELwAaVPIKgCnUYKG6uFmVAAyuVOEVCUSJv/QzL2XEs2JqTHSEsC7XOKiRGS7nVqujCx4
	 7PW2hvKdGryciIb99T3/k1mJgsYnTSLnNO6zjpLH4inzWrfTawD3hupxrB8iPunlE/t4t
	 WKDqYacqeUYrmSCbkiThKmFNk0yXghCJBd66/c+5i58AbDafU0aNsTp9JhqEp1ssa9H71
	 d2mtk9tr5Hqnk+a99GbjE77D3VwH6drIo/oQF5/bPqMfo9buvncNaQnRPkgglRlTWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rESt4kKT;
	arc=none smtp.remote-ip=91.218.175.26
Received: from mta0.migadu.com (out-26.mta0.migadu.com [91.218.175.26])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED71606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED71606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rESt4kKT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rH/6D6pRH+0kDCz6LBDjjoYzLFCi2gVjnzEh7bny4EE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557360; v=1; x=1795162160;
 b=rESt4kKTurc6gxqWlRGLU/eRDPHpt+ndYt5Bxw6R901SbCbshusxuYMAUowqU9eIWIl1jkAy
 1SEbHw+OlREYiQudg4rO7z+YyF+/Rgm+7reV/9yUgoMRVpRzvqESU459hZ9f4fPL3NAndTnpV37
 rwGJp/ZyfnlcMOVD4fjDVIRQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c189b413d531ac45;
	Fri, 13 Nov 2026 08:09:20 +0000
X-Mizu-Trace-ID: c189b413d531ac45
X-Migadu-Flow: FLOW_OUT
Date: Fri, 13 Nov 2026 09:09:19 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ho Jie Feng <hjf3108@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v3_2/5=5D_wifi=3A_rtw88=3A_88?=
 =?US-ASCII?Q?xxa=3A_receive_VHT_SU_beamformed_transmissions?=
In-Reply-To: <20261112173246.3201729-3-hjf3108@gmail.com>
References: <20261112173246.3201729-1-hjf3108@gmail.com> <20261112173246.3201729-3-hjf3108@gmail.com>
Message-ID: <19FBDC54-7E87-4A8C-BDD3-E16351EE3CEC@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Jie Feng,

Two more small comments that I missed in my first reply.

On November 12, 2026 6:32:41 PM GMT+01:00, Ho Jie Feng <hjf3108@gmail.com>
wrote:

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.c b/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> index e35c57c9d1..c2a18f6be8 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8814a.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.c

[ ... ]

> +     rtw_bf_enable_bfee_su(rtwdev, vif, bfee);
> +
> +     rtw_write32_mask(rtwdev, REG_SND_PTCL_CTRL, MASKBYTE1 | MASKBYTE2,
> +                      0x0202);

The other values in this function have defines, but 0x0202 is bare. The
vendor code doesn't name it either, so maybe just a short comment on
what these two bytes do, if you know it.

[ ... ]

> diff --git a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> index 5ffa29d181..128a18ee33 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw88xxa.c
> +++ b/drivers/net/wireless/realtek/rtw88/rtw88xxa.c

[ ... ]

> +     if (rtwdev->efuse.hw_cap.nss == 2) {
> +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0);
> +             csi_param = 0x01090109;
> +     } else {
> +             rtw_write32(rtwdev, REG_CSI_CONTENT_VALUE, 0x01081008);
> +             csi_param = 0x01080108;
> +     }

[ ... ]

> +     for (i = 0; i < ARRAY_SIZE(csi_rpt_regs); i++)
> +             rtw_write32(rtwdev, csi_rpt_regs[i], csi_param);

These numbers are hard to follow. As far as I can see csi_param is the
same 16 bit value twice, BFMER0 in the low half and BFMER1 in the high
half, with the layout rtw_bf_enable_bfee_su() builds from named fields:

        csi_param = (u16)((coefficientsize << 10) |
                          (codebookinfo << 8) |
                          (grouping << 6) |
                          (nr_index << 3) |
                          nc_index);

So here codebookinfo and nr_index are 1, and nc_index is nss minus 1.
Maybe build it the same way, or add a comment. For REG_CSI_CONTENT_VALUE
the vendor code has "nc = 2" and "nc = 1" comments next to the two
values, which would already help.

Best regards,
Luka Gejak

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492476;
	b=wl6ZNfbw6ve9MM8s0+z4ZxI3eFGZwGYz14t2h61upFhb0EtWRfjRJqPcq6rV8Nymhu9S
	 I55He+Njruc5hbyaat0UUmAoSRGaNgHuminDQ+PRnCshFExjGmHWYQe9ZoedDP9MV8MsH
	 X0hfoqxuzVCpuEeXrf2W5Ux0QbxriWCnsygh/KnlOGbx5gERIeEfTFfMbpXEynOTReQEe
	 raN3aFvj6RKS20C5erT8GrrzU/SFty2QiIhMK5Xf+q6V+3RMCvfKxpY7FWrejx8oRCU/x
	 o3fBIAegJAXzF47x8E5kitAC6FFEWfbqVqQYewQwqCFbDI5B2dBBe9VwF1x5QPrDNqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492476;
	h=DMARC-Filter:DKIM-Signature:Received:From:Subject:Date:Message-ID:
	 In-Reply-To:References:To:Cc:Content-Type:Content-Transfer-Encoding:
	 MIME-Version:X-Debian-User;
	bh=O1wOFcRJ3hIXdERyUkMm64zL7bpMn661NvAFyLUUNM8=;
	b=W/5CGuSFdrZMovs6+CHSdukJTyVMt10Ieb0p6QvywGUy98xc64ib7fBMarnFmYG1GKeU
	 dT3l+gzNScggTeN86/U/i6nshFgUbMiGLqQ2BBZZibMyEWHPn/wM2OV4TaDr55aQ/vyDg
	 kgmgUzFS/fCOEF9HwmZcdroyAVhfG75GDr2nypAHCRzmC44evudDE+ro/Au06yQY0bNPZ
	 IEucgXEjezscVNQ2XMiY1bHJ1sMdf8doC4K24xDUiziv/BT0y+obJSeH/NOWZepE7z4rd
	 S3sR++oFkrl9bGfhCI2haENRbMIl+jjotl8kQtoXECdX+DCdgMcZyb2Tok397m7UeWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=iyl3uyGf;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EE4606A8BD;
	Thu, 12 Nov 2026 14:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00EE4606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=iyl3uyGf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:MIME-Version:Content-Transfer-Encoding
	:Content-Type:Cc:To:References:In-Reply-To:Message-ID:Date:Subject:From:
	Reply-To:Content-ID:Content-Description;
	bh=O1wOFcRJ3hIXdERyUkMm64zL7bpMn661NvAFyLUUNM8=; b=iyl3uyGfKS3yVx3sdLRDFnhZ0c
	nQc7Tuo5srLnjH1c1t4KGPUH0QdWh2MuKbz631tmKq5CB8SjzDQ4UdHVob8qB/9u5m5FLNTvjWBj/
	irl523qKFJ4xvoP9pcv62WMhvDr+P6ny1JEGoHfBKJN7JLCRg/mmNfMvMbemZSHvcbfCFq1gW+gmq
	qrou/5+kmSvcYtuwQ0ru9aqk3nTC84CldkAGUi4HY0cxC09XoQJyXQPcF6JIyxNRO72+JploGRJ4k
	1HndD/bgAYbYUZPcp3RUQ5+vwhsdb39n2ySHV7wdD1mySjC+D9pKzB8xxEMS3OokqdQn9SMoUPOuM
	ZoXSp/TA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <emfox@debian.org>)
	id 1xRVSs-00E1Y4-0u;
	Thu, 12 Nov 2026 14:07:46 +0000
From: Emfox Zhou <emfox@debian.org>
Subject: Re: [PATCH v2] media: i2c: ov13858: cap analogue gain at 15.5x
Date: Thu, 12 Nov 2026 22:07:35 +0800
Message-ID: <179449245510.342962.8870341202699077471@debian.org>
In-Reply-To: <20261002093507.43584-1-lsa.uz@pm.me>
References: <20261002093507.43584-1-lsa.uz@pm.me>
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Debian-User: emfox

Hi Sergey,

Tested-by: Emfox Zhou <emfox@debian.org>

Same conclusion here, from a Surface Pro 8 (Tiger Lake, IPU6) on 7.4-rc2 with
libcamera 0.8 and its software ISP.

I did not measure raw Bayer the way you did, so I cannot add points to your
table, but a manual gain sweep at a fixed exposure shows the same ceiling.
Requesting 4x, 8x, 16x, 32x and 64x and taking the mean of the centre crop
after the ISP:

	4x	35
	8x	53
	16x	77
	32x	77
	64x	77

Above about 0x7c0 nothing more comes back, which is consistent with your 0x800
and up entries.

What I can add is the loop's side of it. With the control left at 0x1fff the
auto exposure parks at 63.99 and stays there; with v2 applied it settles at
15.5 instead, and the picture settles to about 101 (8-bit luma) over the tail
of a twelve frame capture.

One thing I noticed and did not chase: with ANA_GAIN_MIN left at 0 the first
frames of a stream request gain 0, i.e. 0x0000 in 0x3508. It recovers within
four frames so I am not asking for a change, but ov13b10 and ov08x40 both use
0x80 as their minimum, and 0x80 is also this driver's default.

Thanks,
Emfox

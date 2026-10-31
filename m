Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.74.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406286;
	b=vVM8DLZ85aV/6BNoEqTIpWC7AriHI1vhTAKf+PFpo4c/mgh8bRQNpbKIXHqqoVUKMw3R
	 eMz1fQkjkhqprJUU302xFhYxUgWbMrF/V+62h77aSKyfqHU2PeIs9PQi+cBQY5UZBE+Hy
	 lTt0oSMIHdZ/IDhezqMs404bp7KeqlSSTRQHKrXa0moVjbnyZSiqyfL4ZSlUUW3WHdPC8
	 PwGetvfN9KCnQg9CCsBRnbRH0grvgd16tvjMjFde6dEkVyIURLY4qykloXnv5wzCXb4Gs
	 GxLBwf5kzfXrqQ5y9n2anM6IZj6Xoi7rbUFWxvSDIzAroL5eFnDw4WDHyBpN1n39SCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406286;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Info-Out:X-JNJ;
	bh=4A9Qd+GvOo6shQWv531IdBUtwUe/CubZ+vWEzbUoAwI=;
	b=qcMruJD8J/vnSSyIs45miKKkNaStNoQLJckI1mGTGMq3rhdlZGZPZaTjv1ocOVOUPjkb
	 m7xVfyWRwGT7MpAWDbQ3i3zODjhxInGylTuzPwnxroj3EU1m2q6KHES03efhDgrrFcqpV
	 9Fqv5VMHrIaN1fN01moRD0rzgYe5/PTY6nPu/+Qsr5PRcOfakx65oyIgDF1OsNTtaMRtn
	 QiV3FbAoZ2KojlBgtaN1kL0BHTMZ2/771ANy6MMP25qUSe5ychcUjhTX9jvwQE2iOlEKI
	 K8eqS3A4K7KrZI4x4WLR4bjpkIjwvRlLBYj+9lAW8IKJ54CS1IHnzE68/n/g81/jtNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b="EgOb/mWX";
	arc=none smtp.remote-ip=57.103.74.202
Received: from outbound.ms.icloud.com (ms-2004f-snip4-1.eps.apple.com [57.103.74.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4DE606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E4DE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=EgOb/mWX
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPS id 0FDCC18002BF;
	Sat, 31 Oct 2026 00:24:42 +0000 (UTC)
X-ICL-RepId: 01a18f58-2ca8-75c8-95d2-ba75f3e3f9fc
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhPHVwGRQBFDFYEWRcOVk1TF1ZDUxFTFFY4Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgRQUR1fAgoERwRbF0YDU0VfAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YOMXxLBVVxXApdfz1wXBpfAEYPVQpVAVwfRAxLcF9xWwMyCT0CLV4IXh9MHB0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793406285; x=1824942285; bh=4A9Qd+GvOo6shQWv531IdBUtwUe/CubZ+vWEzbUoAwI=; h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To:x-icloud-hme; b=EgOb/mWXdLWMlMChCEA+YETy0ykmFUs+VPmYod4N8G0u8RidGaW1zWmEaL67RTX3x6pambdf2BHzjKEKiv50ci+3ziYXEmsK2hiMLX7YxYyn3pjWLAXLrBql2yZlrGMPFBjpzDWQIdfgQFNxMh0k0Mc6d99Tx38goi2Ht8XYdPZwpz+xBtmZ1jnXyK9nD4ck/bE0vHC4tpaLKNl40WuowCArVfzOKf9pWmqVXjFvGJ1m2vt9wjw/lQP50gYwjuAe7tsigB2B3HxD02YFhdjtH5YUBGr+2uAfuLyjHU3tDl/zaebNMnw9YxwFKJrw+MwNR8UHOqvMKnN79RxsbzRw0g==
Received: from smtpclient.apple (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-7 (Postfix) with ESMTPSA id CEFBF180011D;
	Sat, 31 Oct 2026 00:24:41 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH 0/3] media: ipu3-cio2: support concurrent CSI-2 streams
From: joe.dzado@icloud.com
In-Reply-To: <20261031002332.33609-1-joe.dzado@icloud.com>
Date: Fri, 30 Oct 2026 18:24:30 -0600
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE368F78-FEC1-4266-9867-453C2F01B0E1@icloud.com>
References: <20261031002332.33609-1-joe.dzado@icloud.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Dan Scally <dan.scally@ideasonboard.com>,
 Yong Zhi <yong.zhi@intel.com>
X-Mailer: Apple Mail (2.3901.200.71.1.16)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwMSBTYWx0ZWRfX7S1xqmOQjfDo
 aJrqzVPOvoO38LrVqK+/iootKpHbiAHrmhDIpWLe1tP4ARnvJv92UD8Q2OWhnNy2+rJkLu5zsT6
 VhQLYW4/1RVC20Boy1QRB7qXe8uc+Gitza2vAYpr/CJggzKmy2whp/DZKXqT8Orbt1PJ8z5IWtL
 INcJOrh1PHFmRFCNfhPSqXzzBChdl7O81Y0m8Ftycnv9b0wV+V9KfH6pb8BbJa7wrjx+4AMMFwb
 +aaMHDI6426DC7u9CKpLceu8/isl8EOjnR2LEcV40N8BV9on2LCZU3p21X2xZURqZInc6whOmJQ
 AldYhlcKB3NR75sMFrp/DVyEzFdrUVEdA80nToKK0n0yDeOFmq82/kiZ6vsycc=
X-Proofpoint-ORIG-GUID: zbeLFbX5RzHAgfW9nXOsv7-oLS8vQcIz
X-Proofpoint-GUID: zbeLFbX5RzHAgfW9nXOsv7-oLS8vQcIz
X-Authority-Info-Out: v=2.4 cv=V7JwEOni c=1 sm=1 tr=0 ts=6ae5354b
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=x7bEGLp0ZPQA:10 a=VxgYvlp6VsgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=v3ZZPjhaAAAA:8 a=k0MeWpvmtCr9dytLNMYA:9 a=QEXdDO2ut3YA:10
X-JNJ: AAAAAAABJgXtUt2eUwWsCj8WTPMUzlTRQDiVBicdYKduY5E6EBZPkXqqgK3UIMrFeVkLae
 IaLlX6nYmOksO9rcRSM4W7mxPnNOIfvAZfzRmAoKGhIz0iIhNJCLDzBkKagEcZwF9LhQO2
 8YghkqapOxIRtngWnLclkaJNvb0izMoaHY4gasrSh5BmDN13kCPOtfuWqBqfxxUd/Z7WVA
 336kp447jSC5xOCRhwQJA4nr8uxuIP61OzCWpObKJsfrFygm603ilQ/trR4FZIcVCnXJlx
 qZmpD43eRGBRFcd98cEWNZx7B5MYBfAG/sly2whArrN5qDAATHUDVH42YcA6XJJ8I5gkKG
 27FwU8DJ3Rc6fk5HlGW9C2OTfj5xQlTzQX31/6+QOZZx5XPijTMdnLE2aqnBM7ayUepPj9
 EQsfKnp1gA9VoIhZHJnoAi2fhzRyIymp4qr+3XpQrbcSVZ8UXd/0DGEpeOSPeArJ8yoMxL
 HRa8C3CwHUnGcp9Y/v/CI6z7rHxh5lZoBfAFAF3o8KvqGN/WQijycF5L2Hue6dbNF61MRK
 UA2TG3MAt5vNcOIqmIk9azcPjQTRBWlzxcEOff+cXkR4+xY6HuTNtAYoWE/1OLMICSRv5B
 YZzprEtuitzejcJrJY464aN7BKYdVoVyfxBq10QNMg3ugi2Q7g1MLWeeak+ZNs8bMbR3RB
 i8I3b15Mhy79ZpCudgJMmiUPfGN632xNWofFVtXrq6Znx1r9JEu89lIxn/vRqklRxzZ73V
 JXSrktQhKD+x9S9yb7/w0b7/449LPIyy6FmVGmtWX8etfXQQlSF2Lt5pW7i4L8aeRazoo/
 CKKHVFRlFF5LhCZfyvdeEXtFhod9YlQhCn0JQU9Hpt/NEe/O+JphgDEWButsvCCTUMRWa2
 0U0xoj+1STJHtZMfkD6ej1UJLqNhRsRkEcjj6Xwj/6N66cI0gn+gBNp95vtJP5P+uTq7qa
 FLB7eC3qnvEJqZMsCqIudPQUTqcdYBAABoaaZ/G5zA03gQW9Gf92146/YGMgIKjLNabzRQ
 mJdeG/FG4CmBAMwBzo1NIzp0UwvkpCNNW4gE1UfLEEFBuFFyhzMTmPwHr5JoV11FG+nz+P
 7QUnWkj6efOT3dwEOMdK1dx+al923us7zaUEdagTmcqDWnoeZC+mZuy7NNo+6fiIrbLYDH
 i3EdJQZAvKdNvJuIa6hX5U996wN23kCZ5GZN/8QdXomKEQRuChptXuLR8wogb2K70QYjbD
 e/rsuZQJLOllsu7Z0riKBgzNhZCWfUmJ/XqKCd5pdm26FEkAu9IbaYTSj02z0TYNIBc6ug
 6ZzmcI7yXyLvVfVK3B567CEqK11AQ=

I=E2=80=99ve never submitted a patch before, so I=E2=80=99m not sure if =
I=E2=80=99m following the right process, but I found something while I =
was creating a person/gesture detection pipeline on my Surface Laptop =
(1st generation, 2017) =E2=80=94 DMI product_name=3DSurface Laptop (no =
"2"+), i5-7200U.

I wanted to use the RGB and IR cameras at the same time and found I =
could not. So, I got a patch working.=20

=E2=80=94 Joe


> On Oct 30, 2026, at 6:23=E2=80=AFPM, Joe Dzado <joe.dzado@icloud.com> =
wrote:
>=20
> The ipu3-cio2 driver currently assumes a single active capture: every
> stream is pinned to DMA channel 0 (CIO2_DMA_CHAN) and tracked through =
a
> single cur_queue pointer, with the IRQ handler assuming all completion
> and start-of-frame events belong to that one queue. On platforms with
> more than one sensor wired to separate CSI-2 ports (e.g. the Microsoft
> Surface RGB + IR cameras), starting a second stream reprograms channel =
0
> and cur_queue out from under the first, so only one sensor can capture
> at a time.
>=20
> This series lets the driver use the DMA channels the hardware actually
> has, so multiple sensors can stream concurrently:
>=20
>  1/3 dispatches interrupts by DMA channel instead of a single =
cur_queue
>      and converts the streaming state to a per-queue count (no
>      functional change);
>  2/3 serialises concurrent hw_init()/hw_exit() with a new lock and
>      guards the block-shared setup so bringing up a second stream does
>      not tear down the first (still single-channel, no functional
>      change);
>  3/3 maps each CSI-2 port to its own DMA channel (2*port), with a
>      dma_per_port module parameter to restore the old behaviour.
>=20
> Each patch builds on its own and is bisectable. Tested on a Microsoft
> Surface Laptop (i5-7200U, Kaby Lake) with the OV9734 (colour) and =
OV7251
> (IR) sensors streaming concurrently on CIO2 ports 1 and 2 for several
> days without errors.
>=20
> Joe Dzado (3):
>  media: ipu3-cio2: track the streaming queue by DMA channel
>  media: ipu3-cio2: serialise concurrent stream start and stop
>  media: ipu3-cio2: give each CSI-2 port its own DMA channel
>=20
> drivers/media/pci/intel/ipu3/ipu3-cio2.c | 283 ++++++++++++++---------
> drivers/media/pci/intel/ipu3/ipu3-cio2.h |  10 +-
> 2 files changed, 188 insertions(+), 105 deletions(-)
>=20
> --=20
> 2.56.0
>=20


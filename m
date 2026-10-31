Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.74.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793406235;
	b=QCa00GcV69ruxiJUbZdx5Piw5Sz0C1DJAINAJkaw+JtsyTdxuD/3yY1PXBDQ1sQlQ6J9
	 3l3WJvptUxzB6fKgAjxHew9lkAcah2B/OVm6d2wX0zWvBD7Oke9AsVaWybJh4oL42w3Nu
	 C+qpq91sghLbbtldXn/hs8lpwiPzKnzpulLOgZIPcoEp822h00veGEtTDM3jbNJJcjH+q
	 CxSWMyAH2DBeYymEmvv+hTkRwgM4s/ewlpHB8CeICuVNiilNoI5JgJIJvMibUywLWs8GI
	 cTL02tzb6L0e5/LhvFbjT0GA9rp7UsehPzP4bF5yYDGj+OAQ1ALc9V69+B2qvdE3Gnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793406235;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-JNJ:
	 X-Apple-Category-Label;
	bh=muC8fCLNwUCBkf87XYQ4RphaPqy8BIi0mWDaPcUgcP4=;
	b=o/3jS5Qx4DiWQsofE22YBbdA1Zg6pAQIPg1qYnZ7UXYak4VqRVVIoFZGtLJxv940Gsoq
	 G3up+UzmNAdr7saMXt/fGyFilWMJwOIW8PGmL62e8iu+tTGv3FoJzVuSYTPtwBlR/jxaZ
	 btApuZcxJOWVdiTqVbFPC4W5zp6dOnnGOGV9pAyUtvpdWSWIExId5D8nnpTAOnKsOPET6
	 o1Ylq0AJ4WgTfWipkbfvciSlOGrLoT43wSvVcmuyxyTL11hu+Moq+FbPzrYsmKfP1AnLu
	 xMikAwYnupBrKPVoGJEBsE0Kq5LJCi1rjFjgL2Hc0yFHgB2J+ejA8DCIueY+uR7k9OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=RI9G3ieK;
	arc=none smtp.remote-ip=57.103.74.244
Received: from outbound.ms.icloud.com (ms-2004j-snip4-3.eps.apple.com [57.103.74.244])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E56606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 00:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E56606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=RI9G3ieK
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPS id 6CE5018002CE;
	Sat, 31 Oct 2026 00:23:52 +0000 (UTC)
X-ICL-RepId: 01a18f57-66f9-7bef-a592-2cde05231ea9
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQ9PHV8ZWQBDF0kLWBcOVk1TF1ZDUxFTFFY4Wg5bBEcUFxtcABcNVk1QG18CQg8cE1YVEx9UVgVQUR1fAgoERwRbF0YDU0VfAxcRUAFYHlZeWhdeTUcfQE1iSQFaGVscQBdKbk1TDw8ZWhRcGFNFUR9UWF4EU1YOQglKBVwHWANACUoAXgVFAUMPSApABkZYH1xWVxdWD10wUBtfAkIPHBNWFQ1NQxJCFQQRUAFYHlY=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1793406234; x=1824942234; bh=muC8fCLNwUCBkf87XYQ4RphaPqy8BIi0mWDaPcUgcP4=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=RI9G3ieKjzkH2+uOBSu/1oKFdRlkTxxRrTCu2v/oH4eFvC+SBvVdaCQlar22t9vK3fEWsNqX0UHJ39eINLFvJ4CkwPnt2mh9lZQkHpF1OCFwBYhSL9hmK6ioNhHjV8iLP6sZDsodvezkofjIsWSW9gEgLWdvMroqFvrlMdczpFV18u/PiBBdoN0ApHJnmKtEXWYLvkj6ftRQtjkiMweFCDkHCJipwVsAUMXXIk3CV5XENdK+24p1wEGndOSabKVyG8GMCtgck4yE7f1g5IgsF6/er8qPotdcBhBu6yZKVGYFmQnHN6LJdZfzF6lxP5rZFn08tJytOjdCw9FNB2Y3DA==
Received: from localhost.localdomain (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-8 (Postfix) with ESMTPSA id 5AD1718000AF;
	Sat, 31 Oct 2026 00:23:51 +0000 (UTC)
From: Joe Dzado <joe.dzado@icloud.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Yong Zhi <yong.zhi@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Dzado <joe.dzado@icloud.com>
Subject: [PATCH 0/3] media: ipu3-cio2: support concurrent CSI-2 streams
Date: Fri, 30 Oct 2026 18:23:29 -0600
Message-ID: <20261031002332.33609-1-joe.dzado@icloud.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=IauKmGqa c=1 sm=1 tr=0 ts=6ae53519
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10
 a=VxgYvlp6VsgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RYueC7QpxTZu7R4hoRYA:9
X-Proofpoint-ORIG-GUID: j04pW1lzZ4xsMpMXYNnHQdK_pxYrWtC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDAwMSBTYWx0ZWRfX5oVLoHA1gv5N
 /EsEdzOerHuNVgfFpzCeeJa/Ap3kOvtPiK0Fh6CPzpwMv8URZWd51e/ryjv2EVEFP7qmpPhAtCI
 1+F1Jeq6VBbJ52e0xa5HBeo+wWkSutyxmn4sLmAfQsInzq7Tu2JQJQ4oXY/1/nLVbW/m7+PCvXB
 mwZsa8ICiQ9+0XfWV7hfngFVkRDUq0eikBzH2caUTKu5vhmmkHqbOwF0bT9xREf4zGYtbw5BO7S
 XmpXzIAVkssSw0O/z+ygsGAr+TzZLwvL/IBDMIZOfpI4TlA1k5y/lIuf5rsdeD/RH2yTTjQXK6S
 6cgVP/z3QAeV8yZ7S4d7lEDc7jowyxjM9yodb7/OuEmqj36fAUE2fu8R+dQb68=
X-Proofpoint-GUID: j04pW1lzZ4xsMpMXYNnHQdK_pxYrWtC-
X-JNJ: AAAAAAABzRsNxKzsOIV76zWEuJMwx9HXJblsmvlQoxFWTYKhJh5BXmr2f1S4yFB7B4hoWr
 4yc+mm/OiZEMpRVymoNFKb6W0INyV20eiV7TdtTIhaTRBzNdJutatKdBSCANIpCcuZqbWt
 TBIO+zLwRFe71dkojYcx1A8iMs8NCtWNOCx/2XNt8ysHd/JYu+DmVK981Xi9syLREObIdo
 5p7fQibfgZxZitc2iVaLK7nIUm7EaOjrK5XAwwioolsEKT8RZI/t9IRghS63G4u3Za7mHK
 2Jk7eLx58FUKI1BnCPB0oXvbo4a2v74U+TnJhn5gybWK6UliwQMLFZdu0H65SPVfSCbI8y
 XCajg3mXLVThc0JXpktrbLwUfd2V36mTTcc/aGGXTIg3a7RTs8UTQtB4L7XUdq4XZxXweX
 xrZPv4YykpVfRGKJR/7WRYXtGDUfn/Mz4fIsSqHNnxfXRKUSdoNYZZDerMTfeDaUBeZq4S
 Vy+8SpgJwMPQDkqukIadIQk4KPI7WZPF2YUxuy8fvs5nIDODCUrDhhmoOj/MGGgaSGiPo6
 I91ReL9CkrojsmSyo+CFoN0xAa7kdanOpIwyU7dEM6obRncyVdaszBjmD3aeQtWZyJU2Bv
 q9ZjlJjp1CV2wWuCVdPWKp1uQQ6Ww8AqVytsRBJMObHywJfdgohqWKspZqPvysKCVE85Kz
 MRVbyrmruKmXeA1r63AlJDuqOSAmhWDti1YEcpS16B0F2ZtsvYsl9CdAc4RVTWd86wFdq9
 2odmmwNxtXeKaYVqGw/ptXv95JpFfZIe/IwtIa/GgYyWAyA9oi2Q22DrBO/R1Enoqvtc8q
 yJHG5E/l+pO9njXTyagUOVSBnSoOB/vFUmDjc0cvBF13po+qHUTVtkj8vcM7a5Vv7I/dH2
 J9K/CarLK7m957DQPv65iTSyoIwGreqBiIXc9wfOvShw4DXWv/Pf44/bViAzyPwkVYyXQ9
 UjKR5whWH9C8pY+7+QtOg+PgzsLoGnH3tJMD3/hchD697x/wwadE3Ugh4M/N/nMmha3Moe
 5xauVqx4Z/1kElxN0uwsvXqDIzcU87b9ua/PI6axFw5+QvghE/oxrnjccEw7b/LsQ4skAF
 4xFqNsH6hLy9/UCqKxyqWIZKrmAt+omQDPQgMy8i5sbHO5+TQsSwgKR+4SfekaXtFdk/V2
 TXLgNp3TjJqgdRcflc480clAhdFzOdfftjpUefonEwWDy8wD11K/3Oe6Dqsw/WWEvLifZM
 BOt8Vux91mll6rvbQ1Es+FP/mjm7YBAcEic+GrU7fOfi7CJrXrhAy6peB9tPjLY=
X-Apple-Category-Label: MTM3MDgxMjY5NTokY2F0ZWdvcnkkX1BlcnNvbmFsLA==

The ipu3-cio2 driver currently assumes a single active capture: every
stream is pinned to DMA channel 0 (CIO2_DMA_CHAN) and tracked through a
single cur_queue pointer, with the IRQ handler assuming all completion
and start-of-frame events belong to that one queue. On platforms with
more than one sensor wired to separate CSI-2 ports (e.g. the Microsoft
Surface RGB + IR cameras), starting a second stream reprograms channel 0
and cur_queue out from under the first, so only one sensor can capture
at a time.

This series lets the driver use the DMA channels the hardware actually
has, so multiple sensors can stream concurrently:

  1/3 dispatches interrupts by DMA channel instead of a single cur_queue
      and converts the streaming state to a per-queue count (no
      functional change);
  2/3 serialises concurrent hw_init()/hw_exit() with a new lock and
      guards the block-shared setup so bringing up a second stream does
      not tear down the first (still single-channel, no functional
      change);
  3/3 maps each CSI-2 port to its own DMA channel (2*port), with a
      dma_per_port module parameter to restore the old behaviour.

Each patch builds on its own and is bisectable. Tested on a Microsoft
Surface Laptop (i5-7200U, Kaby Lake) with the OV9734 (colour) and OV7251
(IR) sensors streaming concurrently on CIO2 ports 1 and 2 for several
days without errors.

Joe Dzado (3):
  media: ipu3-cio2: track the streaming queue by DMA channel
  media: ipu3-cio2: serialise concurrent stream start and stop
  media: ipu3-cio2: give each CSI-2 port its own DMA channel

 drivers/media/pci/intel/ipu3/ipu3-cio2.c | 283 ++++++++++++++---------
 drivers/media/pci/intel/ipu3/ipu3-cio2.h |  10 +-
 2 files changed, 188 insertions(+), 105 deletions(-)

-- 
2.56.0


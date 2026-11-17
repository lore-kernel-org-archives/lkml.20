Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889628;
	b=38mbr76BWV5to9a8KZhUwP36pFhcrzc8v+cZrsGUd6z/PSiAH1eibTCbC6qZUvaxZBqd
	 lqRk16m1SqbQSpz7v5ZCWf36zMo1qBo7pDAUk0VwyQr6Evq021DjWQrGDgB1drfEs/W+u
	 /tirXSM7avjs7jSK9FcmMO9cA4XbV0wBWs5kuxDmlJ6dnyK9CeNFVLRbjJ2yLDm70GMwL
	 QFoQT855/se1ld8gEWD5HgJyxnEd5IlmM/e9ChIiHOIyFOf3bmMoeXb16oW7i8ks+kBcf
	 wXKYhq3IupMfzwH25Yg9ddhLaAKMeG/IABCtf+M5K2pPJO1kNL7ImUgCPt6a2ZuWM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889628;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=sFybFcKRVCMmwYTPFrOZ69E+4bDngwwdegvKAzmsDEg=;
	b=ZRKPmlMs2cfq/G822LlmLQjJnAZeiY6Gj0NS/UdczFsBmiyxtnZEtw1KoqxY36ltVZRl
	 xEKCrcYROKeK+FpRuWty1RBmH4lIDDVj5DpJPcZ9GuhTlEPJB2BQTZb88F/iVMpVArwfn
	 +S3st575LqvWE9fjIEZjah9ceSQLLW4dbJUACI5tRQoQ5rPHWChlX/DKwBy1iDk/MqoMw
	 cg/mFPThaadlGxhyrN45sgbELuO0kL5dk5SxBe0pzh3gSJvIbgN0mwrU5WMjqo2pVda5b
	 LAW7RfEHONc0TYtLPhpWd3GkFWzzmhI1X0hDMG0oDFM3C9EralDvgebQzt2HfFVoWrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ocb1DtN9;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFCC606A31C;
	Tue, 17 Nov 2026 04:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DFCC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ocb1DtN9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=sFybFcKRVCMmwYTPFrOZ69E+4bDngwwdegvKAzmsDEg=;
	b=ocb1DtN94JkOUBbFAR7uXX/TKGgjf+ByqAnUk1EH7C4bPycE+rqiYaqBaJRnmc
	Tnpd6Bo3dyntjk9T3SorVYtdR8bE/7LDhVdBbjW8wAd24SfQTB346xo6+una/EnR
	NbpQ9J/E7Ddy7LhJogxzUk2QpF8h33FMbSoo6L/zgrbU4=
Received: from WIN-TOG0NDEIICD.localdomain (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wD3X3eO1_tqF_PiHg--.17474S2;
	Tue, 17 Nov 2026 12:26:55 +0800 (CST)
From: Shirong Zhao <shxzhaosr@163.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: wan: farsync: reuse card slots after hot-unplug
Date: Tue, 17 Nov 2026 12:26:54 +0800
Message-ID: <20261117122654.747083-1-shxzhaosr@163.com>
In-Reply-To: <179488901459.3291.9572765536095948605@kernel.org>
References: <20261117121314.811514-1-shxzhaosr@163.com>
 <179488901459.3291.9572765536095948605@kernel.org>
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
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email 2.53.0
X-CM-TRANSID:_____wD3X3eO1_tqF_PiHg--.17474S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw18trWUAr4UXF1Uuw1xKrg_yoWkGrbE9w
	n0y397Zw1UZFnFqr45K3WUXr4DKay7Z348Cr18J3WYkr4xJ345Zan7uryxZFnruwsFkrs0
	vrykK34IvryIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUU1CJJUUUUU==
X-CM-SenderInfo: hvk06xhdrv2qqrwthudrp/xtbC7g+y8Gr714-tawAA3s

Hi,

Thanks.  To answer the two points:

- How it was found: this came out of an LLM-assisted static review of
  mainline, looking for resource bookkeeping bugs in drivers.  It was
  not a user report and not a syzbot finding.

- Triggered?  Not observed at runtime: I do not have FarSync hardware,
  so this is a code-inspection finding.  The failure mode is
  deterministic, though: fst_card_array[] has FST_MAX_CARDS slots,
  fst_add_one() indexes it with a file-static counter that is only
  ever incremented, and fst_remove_one() clears the slot without
  decrementing the counter.  Every probe/remove cycle therefore
  consumes one slot permanently, so after FST_MAX_CARDS cycles probe
  fails with "FarSync: too many cards" although no card is present.
  A probe failure after the slot was claimed leaks the slot the same
  way.

The patch picks the first free slot instead of the counter, so slots
are reused after removal; card->card_no already records the slot that
fst_remove_one() clears, so the rest of the driver is unchanged.

Compile-tested against mainline 666539eecdf4 with W=1, no warnings.


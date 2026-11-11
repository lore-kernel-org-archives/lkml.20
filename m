Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391842;
	b=WC5lFimvRPrZVWzFJNZjgVYTK8mRL5+4YJ5G6g4pauI/jbBcK6eeMLJu4ACgSAhexQuN
	 4ka4zMXUvkeNURi/6yu5NNjfBALogqU2WbpG0ymSL8hFZwH/hPT0gTsySf30FzTMOHav+
	 +O6gaV0S1ldEinIiRsA7XkNdtdmRCIbUOM0hbYitzrJ7zVOxUZkI3SXXDbCqEmJDh2wIQ
	 vrp3ahi2ghZv2yKMDhm4CjQedeG8Ft9Ty9Oph502OMimST/fzQmiJdp7tesqZb14M0bj6
	 X4Bw4UdGOVXFEJDfyEm8lDebDYHgLYKmZZIfpRQu5VxTIIa7z2VTJStz/jm8DXc8k5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391842;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=IufNXsNoB8xfQAU7zCYVR5erkbYE0FcNy66hIgW4lkI=;
	b=XJHwhI7hg/+PQLRVcvyJmxy2mJ/qBSb87LTJWzv9htvBgeeWabrmrgTcwsdlnhq7PMbd
	 QDOoSJcDzIe6/z8SlPsGsp484IocNNZeNQqwC62D/OcUMLh6yhY1Iwqwc57E3F8vr5khO
	 JupMti+jFYGIkkXuftTektYGc/BZ+wrSvnJy+RP7NuD246ITQTFttIBDBwjqUKiIqt702
	 KcXS2EPayTPx17MDMm/0JEYy8Bq117KVHCxsfdk0w4004ktjnFVbOFTddHg6XmC4M8dUG
	 HR9bS6HV36Z9WGyrJEEhCnTvOjDeFxxLTLsWUSpmEZfuMlYnnMgFmfl/PGRbd97HXhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4E3SUao;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EE606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4E3SUao
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91601F00A09;
	Wed, 11 Nov 2026 10:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794391842;
	bh=IufNXsNoB8xfQAU7zCYVR5erkbYE0FcNy66hIgW4lkI=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=f4E3SUaoNRt8xinz7Y8nw81C8p+E8Ofs1kInONw+r7aJ9L2T+vq18ODnBd/qtj0V8
	 hiHwJaK/TpMFKcHniF6cHXFOmHe/aOvqPFwkFft2cZuUZW+LJzGfGVDd0eO5ruLzSw
	 8e+3OTa1RLKdLhdOxnViCW3dVIP8Q17k8UVcCzIhjkrmhUe1iR0H5Yc5ZF6TvypGyU
	 OyLqRh1ctHd6HKTx/+ydcxbG7SXKE00sI328WaU3bXj1KVBOCu1evnUgx4TS2uMI53
	 8Gijs9iN4cSsDIcRyo2G2Ezoy9BIwKxhKo+jg//iKFLOGC7f45Iyt6v+y30md1fbpn
	 XLe9gHjLi7Gww==
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfauth.ams.internal (Postfix) with ESMTP id 19D6B1980052;
	Wed, 11 Nov 2026 05:10:40 -0500 (EST)
Received: from ams-imap-19 ([10.64.2.39])
  by ams-compute-01.internal (MEProxy); Wed, 11 Nov 2026 05:10:40 -0500
X-ME-Sender: <xms:Hj_0auPQeOWyXnuroeoDVDbOxN5baiELB3WUouDCiNowmGu0luTRkw>
    <xme:Hj_0any274b2r5v-d8yqt7mqPz4ryOSUQ5a8HNYlygx7oH6BXbVbKU_FQjEim6eow
    A85qsgRK9fKc-268vTR5tRFb4cP3rBFEeKkVlY2sBeovk57CyZ6dsx2>
X-ME-Proxy-Cause: dmFkZTFjDI7QWig021/eXFx0ahuxZXlbfi5d9h4/xo+SDWkvQu0Q91/jB5v0OKL7bsQyiE
    XrkYcU/GbBBquYJXZH1wiXPCPavomNV9/Z3MLh8hzXM/B3FL3cjFSMMoXZzGAH6jddHYIo
    fTPa0KI/aikSUFyC+8HJAlqV14z/JGyYY0CAejqmHBXSpFN1UBCAumHBk+PJ/r4HGsio8o
    BKlREcY0J0VhMtU+jfV1B+YgqI5nCoeASECQFNYYHPOgZKZjIDnimifxsS1OJITdCUife4
    3OfAjRw89oVLdio6q8uTxuxRcXEkM4V7IqmCP9yQjoJXOUot8+QJAi5PwC/FduEFfRtpQH
    5VMXzzhLVl4MYBAmnFIkS7ynM0QoEE76Oo1QSqBxFXCT/SgGlOnx8a3qJithD9UfoDQ7AP
    HCpY2DbaRSbIK0Za5JUm4dtwI2lqSns4mvqmWTGsXYmo+Pr7tet/WIPdrSICG5mm4fiOzh
    wEWcTtumsAmdJg0ysFNfu3YJe061XtLmAkFVvHRXkkWBsF7Ad2aXpZ1QKrPJTXtFkgeU/n
    xfO8pzihxdj1ZFMLTHqZ+LfS+9mchaQuLJAjsoj1Kjk6tjbaA54GUdBV2+PuT3VRHnNV5i
    aG/jvsjhe2Ycl+J08//fSrWVTMkRRNTAsG0kNuI6L7XEGqNhcoArvZ+Ws6tg
X-ME-Proxy: <xmx:ID_0auywWTqQ3s3s-WixPrj-YGZ7qrPT-70LnCpA1F14j_-lS8RQbg>
    <xmx:ID_0aryGVbSb-zlWyx3ijAsByd2ENuEf0m85S8kJxkm6YFh0ifZyuA>
    <xmx:ID_0agYD3RFyXFW64VjlGCtr0caLybCB__6nPg4BdV8oBMYvATEHPA>
    <xmx:ID_0akUHVi211vXinfeZ31qSnignvRNLLWLo9YuK7Uxy5GD6DpxZgw>
    <xmx:ID_0amhe_ndzn2iY3gE0NszbcX6KWCO0Qq-kBvtUndWc_mXNwZM4sO-Z>
Feedback-ID: ia3204a8f:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 73AF92F8005A; Wed, 11 Nov 2026 05:10:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: Am_MQAJHDGj7
Date: Wed, 11 Nov 2026 11:10:03 +0100
From: "Imre Kaloz" <kaloz@kernel.org>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <7b19087a-986a-414c-a35c-e44052458495@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2611080926150.17804@angie.orcam.me.uk>
References: <20261107005245.20299-1-kaloz@kernel.org>
 <alpine.DEB.2.21.2611080926150.17804@angie.orcam.me.uk>
Subject: Re: [PATCH v2] MIPS: sgi-ip32: Fence PIO reads on CRIME 1.1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 8, 2026, at 10:28, Maciej W. Rozycki wrote:
> On Sat, 7 Nov 2026, Imre Kaloz wrote:

<snip>

>> +static inline void plat_read_fence_end(unsigned long flags)
>> +{
>> +	crime_read_fence_end(flags);
>> +}
>
>  This seems hackish to me with the call to local_irq_restore() buried in 
> crime_read_fence_end().  Why is is out of line?

Good point, thanks.  Only the 5us udelay() needs to be out of line,
so that asm/io.h does not have to pull in linux/delay.h, the irq
restore had no business being buried in there with it.

v3 keeps local_irq_save() and local_irq_restore() together in
read-fence.h and makes only crime_read_fence_delay() out of line.

It has been retested on a CRIME 1.1 O2 with audio and SCSI DMA
running: 0 stale reads in 50M read pairs with the fence on, 15 in 10M
with it off.


Thanks,
Imre

P.S:
v3: https://lore.kernel.org/r/20261111095650.14954-1-kaloz@kernel.org/

Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BFE3F4DD0
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789475562; cv=pass; b=Cnh6ghzkrivVgeX12MBMUVKVxV2UInlQv5ewPq9if27Wo3pC4siyM1aEerpnPeNLfm8JTV6N3VQs3ziekkTJgBzcdPzkiHEEBAQ2mZRRoWRJ6uL2/yj9ehxKX4Y/rPpR5wYpV/CEs8rpGYocTvgjOKptshUfCI6ArGB6yakkCvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789475562; c=relaxed/simple;
	bh=NYx6mzzZPmldI53NSxGpwwRPncOdBwkbPbQ66RgsM7A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=fUmE3KPJmXy3R7nk4oQHtT21tr32+2T5Ca3hSc7ky+9W9o5q89a6osv9101oiCaHHPfp6yqoM0EsC8KMbE40IINqkTlNKXNbFjTznAQUUmfwmZxRs7b9erLH83xG639bdOYRVivZTFrtIcX0kxeX2ubkF4txXx3fxNDe5VV8ja4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=h0bhXPsB; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="h0bhXPsB"
Received: from fauth-c2-smtp.messagingengine.com (fauth-c2-smtp.messagingengine.com [204.75.18.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hkhHM36jPz49QD6;
	Tue, 15 Sep 2026 15:32:31 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789475553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lulhfXdBZ8IlWRG8McqTlzoi9Lws1M12SFhrapzdGsk=;
	b=h0bhXPsBZNOVOfd6N4w3q1xg/szeproanK22fun1P/hUdij+pm5nOpndqKHKKOCZu7vLX3
	TcWt0zChBSDAULJlte4tBpv/m2S6dQlfNEhXCfzJqbzie1mR1Oy5Mnx1+nb3BxG2s3zfog
	EkAJ5ssLYlMIGQLbexYRphW104PeQeEgvNTWC9YzqWVV+h+l/9Gsu2DPFWCM2t5WODYsDc
	f6kjzU/Tr5K+q4YVGJcH6Y095Nj2jZtUkKIoYEQ8QpAm2wgTaqAjhQYB9wLOhlaqXMkehf
	D4ETZhDijFWnBwqyS7gANgJH4Tf73kUb3RwrUV0lFTWRuYHamuXJlq3fRfG0RA==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789475553;
	b=K+goZCTycWcC1eg5lT1DekiN2WGp0IrNF/F9bJ/ye3+Jd3Ernq/QruqtodLo/p0jYqLaRO
	NilKt1WQN5nJITeq66XaamrLr9vB+mzEt8qWmoZBy3EbhhHViTZRZkRAfLY7kk6a9yHYP6
	N1WmNj+hTpQ0NAaq7q3rIe1Q0zR75F65Go3DpASUnaYtl/6Kq8ni8l9c1W3IeyXpVTsM+P
	iVdBu36FREV5rLDO724Kexh14a3XpdjENfQ8fb2su94+ubzqIAsVxysJpxADgBnD9dLYqY
	lS2kmhLTm50gpCiqA+n8nI2Pg0ytvc+4TOTxy9ScwYDWFH2W4wryX9Tmd4271Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789475553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lulhfXdBZ8IlWRG8McqTlzoi9Lws1M12SFhrapzdGsk=;
	b=Hl51J7INfgYXyzNXizEqHcx/H+vfkYGe6kKlwQEzn7TKhzXKobBu4vvdOtoStrx6ni4uIZ
	n5mFB6r17BVWsKAzSspLUYKQcGaUAjj1g6sntDi05kwizqDWOnDjCF4lzwqTYzrhdIV1b3
	xXvShx0pPGGKgkBZb2ZECKR8ef4d8krKc5p+Bl4ks9S7BhE+xbG72TayreN+Cf0tWXq7kY
	+KskfZzdqLUNRDbJ28HqqZ8DUA4CWkd05W18pLZuy2mBCoDigLhPmMyz3oldZ4F0c8wx0f
	wOKu57BxXsshat8iwdo7j8Faes7IyPBmq0vgkJ0FzY7qoNU9EEIuMoOufooeHQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 78E24198003A;
	Tue, 15 Sep 2026 08:32:30 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Tue, 15 Sep 2026 08:32:30 -0400
X-ME-Sender: <xms:2jqpak0bJ0YRiWQiNx_2y0ZIftizHOz3eY2-gSxBctN2xImZgQhApQ>
    <xme:2jqpap6huM2Q017AzlPLLoZRbJhikx6bUeMaJUZYNcaXA3XmKkiaoYCPNU_M7rhMQ
    1urF-vkH2lw4lgvr3sdCSleFNK_8FLKRMUWKGeUraFr1y1Ssl7F6eEf>
X-ME-Proxy-Cause: dmFkZTEFymrOVPWK+MQ4UXejtvxyh+l6dc5IFIgY4jnDXoWEvKpMjB051KQpVtX+K4gQ75
    kUfcjqqxEf3p9FzEJAN0QsyR1bZY+KS7rL4N8A4Zr61S146jEPyD/UHZtYNPbKCo7DWY+p
    s4x6/sThfkRdNZV+RL7rVbK4RWJVMo2nLKKITqNAjCmiDkIBD7hROe4coNhKbitLSzCJy1
    mAo4Jiq8udQVkdUsueh/WGbRTj3wyUMHAM3AzJ4Zsl37M2RLv7LzWwPXgdFKPs7S2lGFUB
    N55+wUYvrw9L20LzbwhmmQ7s+ErG8LKT9ccLLa7hDRnuwVBbqSX0SoHf9niz2A/OvVcQJu
    zDSpJNLDB8FGblXKsvXis1Iw1zZnBPxoRM36BrN+C9kLGA7xPSnQPINWIPv5mdN8QIiI1p
    1iyL1odL+MY43Qw8n7/v7B8fAy3L/Dnaw3ErMoe4s/6ijKtZI8gtjJEkd569lumsEghzaT
    xB8Wx+Kk4MdnciVvLwlRy44HQ9mbyqsiV/AveldrPTVxiFmtJj9ulds+wF+AJlupbeBwak
    QmCAv9s8K7PnZb5Mw0JBxK1rc/jvSSeP9q5oBJEr2Caq5N7nZf5//LLecDHggeeOaN+vYl
    hY/IZcs+h5CYej7CR3MDuymC1gvQK29r7cFct0XF6k70BPzNFzNyvXG+x8GQ
X-ME-Proxy: <xmx:3jqpapE5fuSSiL3vJPkxhThkglAA33DNJI7cVgIdZx9U3P7PmmA3OA>
    <xmx:3jqpana-kdrjVns9y24LBC4N2xbFW-ZwkIsAaoDLmvBLmFQaijy9gA>
    <xmx:3jqpakN5YO46-r3Ba2vQcOGTsvQnwzBrs90AEfYwOB_WSFerGW50eA>
    <xmx:3jqpaq1SrDBlqOKwSL1iW3o-i2bcCkjKY_QDXzxej4a5un8rmL6zyw>
    <xmx:3jqpaomo-h_ZFFWWaFEAnIyOOr5e18WpSkI8FBLX4AagS7DwrKIqXFR_>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 1540AF80089; Tue, 15 Sep 2026 08:32:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AfrYmASNsTfZ
Date: Tue, 15 Sep 2026 15:30:26 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>,
 "Jeff Johnson" <jjohnson@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Eric Dumazet" <edumazet@google.com>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Willem de Bruijn" <willemb@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Mihai Moldovan" <ionic@ionic.de>,
 "Denis Kenzior" <denkenz@gmail.com>, "Marcel Holtmann" <marcel@holtmann.org>,
 "Andy Gross" <agross@kernel.org>, linux-kernel@vger.kernel.org,
 mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 netdev@vger.kernel.org
Message-Id: <c4a033ee-b71f-4548-8be9-0a43f31c8d42@app.fastmail.com>
In-Reply-To: <20260915071131.GA30612@marmottus.net>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
 <20260915054207.2513877-13-juha-matti.tilli@iki.fi>
 <20260915071131.GA30612@marmottus.net>
Subject: Re: [PATCH v7 12/15] net: qrtr: mhi: Report endpoint id in sysfs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Sep 15, 2026, at 10:11, Arthur Crepin Leblond wrote:
> On Tue, Sep 15, 2026 at 08:42:04AM +0300, Juha-Matti Tilli wrote:
> >+static ssize_t endpoint_show(struct device *dev,
> >+      struct device_attribute *attr, char *buf)
> >+{
> >+ struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
> >+
> >+ return sprintf(buf, "%u\n", qdev->ep.id);
> >+}
> >+
> >+static DEVICE_ATTR_RO(endpoint);
> 
> I think you could use sysfs_emit instead of sprintf.

Thank you for the commentary. I tested sysfs_emit and it compiles and:

cat /sys/devices/platform/soc/*.pcie/pci*/*/*/mhi0/*/endpoint

...prints 2, as it should, so it seems to work too.

The next patchset version will use sysfs_emit here.

BR, Juha-Matti

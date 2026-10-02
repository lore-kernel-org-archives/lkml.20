Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780625F7B9
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790975870; cv=none; b=AwxxOn3SnF7Q5VQ5L2ufM4E80BNPgtC3HIaiivdW8oWdP8w8jkHr4HgEhGR0PGipx1DZlsOTk2tPk49GwPPz6ns8H5Xa/K4aSZUhfUD6xMOyRLgGWhb7tziHixbQgJyE9dUu6xVzz/GQjE3XWpuLWm64JhwO5zqDd5ZFSSSTkco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790975870; c=relaxed/simple;
	bh=SwVzjzCEvI9xgzYskQdRtxzYscx6RxP9paKnYNf4bDY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=W0geIncLJ8hGhwgdwgOiel3WtzhuMEPq40ss9Gt8OQjwroFr9xnxmrbZsFd/LXscyDMgDlmX1QESG4/nWoWn9iT+XFnWBhcnAqSEvp0D9qYtBBlJLBBXwRveZ8tF5IcvJ8PzCA5lXxQE0Ko4VtEakrYl4CyhjkI4NuEakcaUm3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=XDFwohhb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CjNitlPj; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="XDFwohhb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="CjNitlPj"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id A94FAEC01A7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 17:17:47 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 17:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790975865;
	 x=1791062265; bh=YX7f5u1JAxSjRaaI8LoRy7woQY9evgYyUE4A3mVXrJo=; b=
	XDFwohhbdyvMVgoVNzE34ILFZPZsBzNkZtOVPLOdg2DoLWLMqVn/ZjghTdLoKs6H
	hAixXvzH7jBemHZwf8HA91H16m7D7mmLRx6Iuv96QE6O3ExeXP8CXucJ3iUUP0t8
	Tbb44YKKjoe2t20483jXnOOy5Glaks4SAbKteRAulIwU2m4q7MCy5qVTCOQiGg30
	cQpRbU5Zb+2dOb/nNcses34tdv+xWTO0BUjQaeTA5OLUdP7cbxWyFC2sa6HuB+Fb
	POpHN6nAWhIFHnaINIvcDXxOgYBeSY4qIbWtE0KLSj1l156mXHf6Uzs0/zpFCh7k
	qP3LOYC6g5EK1a00ZpQGaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790975865; x=
	1791062265; bh=YX7f5u1JAxSjRaaI8LoRy7woQY9evgYyUE4A3mVXrJo=; b=C
	jNitlPjJ3/T9rV+YlZjIUQLTMAHuKNNZpI4JdoTwJZLjr7MFnDrAR0XYXi0CwQAB
	cM5nKYx9Iee5QPh1/jdGe2WhH8dwgTJ39RGvwY7pVWfZz0wn+UQuEwJLHVxPy9Bu
	JQOUaBxvDqtr65r9wdjWg86J/jB2pHhp7xm7hR3sGaVEqdaYCw3Rpk9SpM8yTKxG
	EDMzEFwh4BnSDseIib0C1J4e3oNkGMVk8SBt4/oL4iHxDfoKAhnpjL71BhcdlQNL
	Cxk41q4jcwm+y/huAFwnDj7dqOmUAIGGiV3zv/lQruFL11Eq8mJUU9/gWBBah2I6
	cdc/ITP6GgMmG7Tzut4Ug==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790975865; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:FpLr+4w9iDDtoWyj67UzaFoKrK/nde7aA6rfAXPtfeP5lh1
	EoelnfGMWCV5fJjCXe+pP+xeaJqZmV0M3tK3DSJ+npVlU9MeruEVQJ2R7PHR8GTO
	vzxL8tee2iTZLnqEx8h6ccaYnEV1YH700L48q7JlxWWFDvY8QHVTBGF4lFLz5dk0
	DWupZNLjWU3BdztAh+OJwu7NdTePM4fNyaDtaAHKJRIcEcuIkcBwvXJKfBEdto4H
	v8eruDoh/uY2XcX2wTV8Fv6cIssYNOmBdUvOLxmycK/uucnrlrr3hi+FNqmhdCAA
	g4/cfHDIhuNg0nIT1bVMd6Zsn0xsF7qm0mi1GNw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:OgrhGqbnQeK3nZJVUWQxI+pE8gcw3piOULHYYH0INTM=:SwVzjzCEvI9xgzYskQdRtxzYscx6RxP9paKnYNf4bDY=;
X-ME-Sender: <xms:dR_AaupNS1Ce6Kdq4kz4Wym18PH2nIG-kkw5a9u4q0KvX0m_CDpDFw>
    <xme:dR_Aanc8V3Na32mXaSmdoL1eTJkTM7Zuv8dIo96caY8M1Aa9r6XfhgC5UAo0cy7J0
    Wla46N5w48zuyav1bvHLkM7eAB0R04rC3cMqD3kwSgt0hbx_NMg20oe>
X-ME-Proxy-Cause: dmFkZTFk6SJTZ93NKA+M5MmtoYXlTCu0kvb9TOLJqOnPE7J0SxG8MNqPZR74cfLdrecoi7
    nAI3UWr4DeXETGdfJFiAmiWLs9jlAkS8prf/7AupP/qsmbMaNlAJv+i/yStg0CSwIrbrI0
    mW0kj/Yt92wMoCxwno7re/0y0kf/hv7E6/ixPkVHZq1d68Eah5PCBXKG+I8MZ2h6R0iIIn
    3FyBCYfX+zEN4sUB9qqjss6eO8CZyewbVBkEtmzISTAEKudyq1asy4AF8FyKeAkZOCRXe+
    XCi7xBT/hYmV1v9QbscGDx/L8y6F25zKYR4zla0S2anieUYhtCjDRKPXYM3sBkNdQ8EXMj
    eCHe7uJjoDUWSx5Gr93PEc44jkOUFPUeMVKFutR0SU8pbPDQ1t7HT3YtAv1lyWv3hiNIPZ
    YslURpa4JTQMlzJuoDtgU3vRw+EfLSdVj6Qb570RqBEazrDeWPzJtfgWUm3XM1UBJRUOeM
    BIMrU7gs4wTfXKnjx3X+/w5zY5Pt2Fb0yh44DjMjwmB200xMnAAjbA61ww7ukxrh4tEakn
    59MVrTv3kUdIyHvzL71gC7DQnBt0H7X2ovZj9izhY4WA9DTGqZTUnJ4yXd8w3+EPViAU0T
    73bxaWgY+RrJAXijWwfJJaztiTaJOnTyNUEAPQYf87MgjJWz2d21SQDUGgrA
X-ME-Proxy: <xmx:dh_Aarcegph4Yfs-VXEY-JkimoL4oqDeyGxQPKjPxf0jf5QhRV614Q>
    <xmx:dh_Aak6_JNH1OwlQS20eNjz0XAnYsvhyxvxb5oPwhlxwAzZ3noJ2rA>
    <xmx:dh_AauXiMFmN19nwQBNGljdKhyLgDh_9M_BEFdx1d6XN1jbPIKMB1w>
    <xmx:dh_Aaj7Js4qyXLKKhU_qUz7i2ry88WjBcZd9-o_x8fiuz-hlbqoivg>
    <xmx:eR_AapvWjpnnrQ8gq0auOo438PvFBpSK8wXqV5xa6CF9VIFi6dUx3eWK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 979CD32A008E; Fri,  2 Oct 2026 17:17:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aw6mAajFSntB
Date: Fri, 02 Oct 2026 23:17:11 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jens Wiklander" <jens.wiklander@oss.qualcomm.com>
Cc: arm <arm@kernel.org>, soc@kernel.org, linux-kernel@vger.kernel.org,
 op-tee@lists.trustedfirmware.org
Message-Id: <67bbda51-d1b6-45ad-b798-d8c0e53bd23b@app.fastmail.com>
In-Reply-To: 
 <CAGgiveXqFFi+nq0834+hwBBnwJssh16aayZBgh0toYCVN+OMmA@mail.gmail.com>
References: <20261002142443.GA778834@rayden>
 <84c1dc64-6380-42e6-a501-9be86666e5e7@app.fastmail.com>
 <CAGgiveXqFFi+nq0834+hwBBnwJssh16aayZBgh0toYCVN+OMmA@mail.gmail.com>
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026, at 21:04, Jens Wiklander wrote:
> On Fri, Oct 2, 2026 at 4:59=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> w=
rote:
>>
>> On Fri, Oct 2, 2026, at 16:24, Jens Wiklander wrote:
>> > Hello soc maintainers,
>> >
>> > Please pull these fixes for the OP-TEE driver in the TEE subsystem.
>>
>> I noticed that the contents of this branch are not in Linux-next.
>> Is this intentional?
>
> I made a small last-minute change in the commit message for "optee:
> register TEE devices only once fully initialized". That's why it may
> seem new.
>
> "tee: optee: ffa: support shared memory offsets on large-page kernels"
> is brand new.
>
> I thought it was better to send them sooner than to sit on them. Both
> are added to my next branch, so I assume they will show on the next
> update.
>
> Please let me know if you want me to keep them on linux-next for a
> minimum number of days before sending the pull request.

Thanks for the explanation, that makes sense. You need to decide how
confident you are in the contents before you send them, I was just
worried that this had not seen any testing at all because it was
inadvertently left out of linux-next.

If you are ever not sure, just mention that in the pull request message.

      Arnd

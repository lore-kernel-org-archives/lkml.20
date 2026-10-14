Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B120347F786
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967902; cv=none; b=gqBvdhWEff+q/WaGC3boKqFPae2UCI4EcWfmpMiiq8YpgI7rUMFv7uq7zFaDwiyf3PUCXBGuXVH898W64ImyWeqK3TT9JT3nr4ovD7TdEP25OtvGhmk3uNFPh3I+OdPriccB1KTRN5znoN+jqQQ/lJIIjkU7WVG+9tiTf4tAGyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967902; c=relaxed/simple;
	bh=M0aObq6bJgje0UT2uUYtzH9eDNb/TIATR/h5EGpBzx4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RDeUkTJJHcQr7tdFCmdvaGGDJvOhtWMWtKAs2bT58kUz+GVwuYLMwV2QIJ00QCApEoYJE1B7VMs0dBlDLmdTF80M2++t5jR+re8+hKXyFsleMLWNggwtu7E5SqEohJ2P7xrqOiVXHVFsoYgab24Gs53wIKvfXXpN3TxAqKxBK2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=H7Q8uwOd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uXnuJTd4; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="H7Q8uwOd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uXnuJTd4"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9A82514000A2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:51:39 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Wed, 14 Oct 2026 04:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791967893;
	 x=1792054293; bh=s+LFPCsnRJvUDK1wOaRGQjPBjNNnRquMTT9sppD5pbc=; b=
	H7Q8uwOdfZ5NC7b7Lsvv01U48s0aTFncOG9VIwFbOOe5N47jIwLMWUYikw7JG0Ri
	jrcbi941SLOrQHyadwOo9J7mwHjXWjCgP6vsitQLvr5fs26jfIhlsdCTH711ASBx
	23JYMgTbTlqSTRZI3pWC50O4XBIv45l9M+qBXXbb4jJh/nzSY8kc5XjMLkNSQN9j
	xbc8OdK308x1/ZYi4EUma+kejvWOPE+7OSj2utwDhspTTto8/6nw7uftpLndrqlD
	6y30BvDBAHBT1ihJ4+1ljsIYqTxWgKUK3woEc4r3ZSnmqGhK6zHvn8MxmUT0JuQk
	1qPkDHu8wa2A5OtULYto0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791967893; x=
	1792054293; bh=s+LFPCsnRJvUDK1wOaRGQjPBjNNnRquMTT9sppD5pbc=; b=u
	XnuJTd4UKSjZwjkMpcFrsaHYu29Z0NIP/lmiSEym7AjjBr2of1MybzODN5jJQySl
	Cj3ndxvY/MpQSneJPdqbgYGLIsNTxTVU6Lt+TrpnFCAa1QglxhctOhnuEwGHRE2n
	MRivEGXn1M1exXKX/IG2qdNhDxm2MDUERFxgXCHVwjB/O+fttZgVOuO7smVImGg+
	QYQja4c48Bh683vML4JGtxsNy5NoVW204pM8Dn5K9JzdHvIkigl6R4qeRPWO4M4t
	6JRj7dWOHyIFaN0luQ9vE9Uh84q5Z63QnsDlEQvAZSxYziGpBr8Yscsf7Zs+XFbP
	ywdTrJjW48Fs/X5+jVQJw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791967893; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:abJinEQlnVg/qH9OUfZ8qrq0/PBKCxi7eU+8lIDas6Mf9wg
	oYJ5p+M7E4Xd+ubPdzKj+aLDfQT2hdGhiRdjcWsvShvfRapPlWx70UHQ+dT4U5d0
	Zj+i0UiZrpmrhOvd2JoXIKHRlgxx4JZ91ZjTk7zKuJ79OuUnGyQXxOVRgzfQHc6B
	cSdWrpoVxaIzEcagC0mnHdMxyxdJ+ns4pqNXoHAAb0hSrMO+tEZESTdPjMBr2Jho
	Pdc0QU7s5VIv7RBTJNQe/P0JlC5ppYqg847enQg9CylZEHPhYmmGAkJvQGbPL9xK
	INjuK+KA5C4DhUuYTP3QM4VQI3fAIMyl63hcPjg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:v6jLbFLw97rgSTMbKiy0NdGsK2y8cjSwS8WxYzPzZMk=:M0aObq6bJgje0UT2uUYtzH9eDNb/TIATR/h5EGpBzx4=;
X-ME-Sender: <xms:j0LParrUFvTBU9K5I63Y-2el0ciOVViHHyk-Kq_Ou2Yh2hcmMvoRbA>
    <xme:j0LPageD3rN_ND-tLI8Og7jolQ8CvuytjspA1jFXB1IzvLr0ZLjWp7ZChrJ4OGzri
    l_C-NceuDSiwG9FaRPinYr0IFnRKdutPSE9NowvdAkbJUcqI5SZj_u5uA>
X-ME-Proxy-Cause: dmFkZTGfLAdL0vxkYY9Ttp8RamOvH+ay9++SlVeOLJK84cLH+pRPHm/ENjo/I7LTE8S1CS
    Pt3dYazVhuhFGQGkwCmAnYYyN2w7mdq8y3lgN54SKGHyb3aF+4577m/Tl0GQ5FAxX0GVGz
    4Z7n1u2AxTAhSmN/KjfRXoFBFt5cDn8bvvDfOyC93p7I5Znsg2Oxh7HIF437xkWy/OP9h8
    KXiWYFfh9U1fjnFV56J+aeDhe4Qvn/DtUgAeGCpOfq1JTPSP2Mn6y/OdTpM6Q0BzDsSzpq
    qmhdDTB0vEA3lzY+dRnoDMgr1oZ16v9QXLvTx8RAPx8+WdFl38hiqqKh1QxfSt3nM7VzUT
    wW4qwdfnUOGClYvS5UpYaaqIQuMcjfjNP8qxSn90BOqzbmjxxGa3nBrtBpLJKok/SPnuMs
    WGS6raSYS7nXd3S3c5sBTKaB79nmVExOo0fxhAbLNJPhgWs+OUi+SHZ49g975Vksf2RFt1
    B4Eey1G0WHJEYzpX9tDIK6CMe2oX7qxqVlU9Gf0ncOv/9Rz9Z5QdxNMTboTLIv6W1cMt/B
    GjYIxcTXmyxAmiarQXOZKDIvr3ar5oAmnV5r0BxhIbKg/UjeF/NxfFaIHAqne8Jobu7rqd
    vjo4SHyOQni/1IUBfAq6ZWzUue0th1TqM20pp0ltIbnkGn0UTeRCI4YfQ7lg
X-ME-Proxy: <xmx:kULPatM4VJ1Zwhq655jW2EEW3xBlfzHEbFjBAkoxfR_iU95aYvE_9A>
    <xmx:kULPar2WUvss1AKYri0cURhIrYpDA_3JivpX165pibkxZYFreSNE2A>
    <xmx:kULPapQXn-HDuXcQZzYvyCI9G7Z6yfo3mcHSgeKc45ZdgeqgBxpWyQ>
    <xmx:kULPaulsjdHffN5dkWaQGazC0dX4uVEwOwhf_UwhFQfMHFP5CrYCaA>
    <xmx:lULPat6tNBS87e05J6rt2D6fCks1s1cE8x5Ay9Y52WC2KUjFub3YZUjp>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2DBBE32A008E; Wed, 14 Oct 2026 04:51:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AAmuA3xfg9N3
Date: Wed, 14 Oct 2026 10:50:41 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Morton" <akpm@linux-foundation.org>,
 "Biplab Raut" <Biplab.Raut@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 "Gao Xiang" <hsiangkao@linux.alibaba.com>, "Nick Terrell" <terrelln@fb.com>,
 yann.collet.73@gmail.com, guoxuenan@huawei.com,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <n.schier@fritz.com>, "Kees Cook" <kees@kernel.org>
Message-Id: <e2afcf01-c77a-4da6-8f56-237d97abdaf6@app.fastmail.com>
In-Reply-To: <20261012203257.614d88c12146544aa6487b4d@linux-foundation.org>
References: <20261013032010.2453893-1-Biplab.Raut@amd.com>
 <20261012203257.614d88c12146544aa6487b4d@linux-foundation.org>
Subject: Re: [PATCH] lib/lz4: add software-pipelined prefetch to decode fast loop
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026, at 05:32, Andrew Morton wrote:
> On Tue, 13 Oct 2026 03:20:10 +0000 Biplab Raut <Biplab.Raut@amd.com> w=
rote:
>>=20
>>   Kernel LZ4 median scan:  1.0994 s
>>   Patched  median scan:    1.0472 s
>>   Median paired speedup:   5.09%  (range 4.19%=E2=80=936.99%)
>>   Patched was faster in all 15 rounds.
>
> Well that's nice.  I can't actually recall a case where prefetch made a
> measurable difference, although I'm sure there are such cases.
>
> We used to use prefetches often (10+ years ago) but it seems to fallen
> out of favor.  This code is a prime candidate.  mm/ barely uses
> prefetch.  Maybe it should,

Unfortunately the patch causes a build regression on x86 when using lz4
compressed bzImage files:
x86_64-linux-ld: error: unplaced orphan section `.altinstructions' from =
`arch/x86/boot/compressed/misc.o'
x86_64-linux-ld: error: unplaced orphan section `.altinstr_replacement' =
from `arch/x86/boot/compressed/misc.o'

I see that the zero-day bot has also reported this[1].

The problem is that the prefetch() helpers use SMP alternatives
that are not available in the decompressor. This has been a problem
in other patches before [2].

Not sure if there is an easy way to stop the decompressor from using
the alternatives here, for 7.4 I assume the only option is to drop
the patch and try again once that is resolved.

       Arnd=20

[1] https://lore.kernel.org/all/202610140857.6jRIqXf1-lkp@intel.com/
[2] https://lore.kernel.org/all/CAHk-=3Dwhrc-ruKs4Kt90EGzKd+pYhZFKs6bgBV=
CV=3D55BK+p1nzg@mail.gmail.com/

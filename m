Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793644773;
	b=fJ3huUaboi4S80eFkWXLjRrOolt9bRHIw+zPwnwQJf0Y9ae+dWyybB067JVOKbg6d1sC
	 1o8WW6eWVE9Ur4bFc7xzS197uIXo8+awuaJxQfq9AnS1sYo8Ymk8T9PuWIlEhdMZcx2l7
	 WqkzSzEfBLtPa2yDDKlMbyTtIpKIjFOTnyYdN+3B0gc01iRsZ5moKGOsGX/YtmP/Oovmh
	 RLQW1TPjBnjIEskR2K8o3Cm4882UHlH8IeTr+7ZnR8Az5lOtrjpjDuMcY46AIMTkCCdwn
	 GyB/cSG7C5TXDHpPHqhwksrxT8JUzmwct4g3ALpQp/hZAxwVxKtVTE22ajSRnRQ/tRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793644773;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PeaNE7dalZwV45zaReGeYmf1fDt50itIMVJ+XKn3L28=;
	b=Kq8HQx6LwxC/WUEFE2+EfWt6YfaT6l9/m8n6G7k7jxRYu+uTLcu3YTTQB1TsY94zQa4G
	 nd+8BBL2gWdEYZ9s5Ik04mCLDmH3IacDJWzyPd11rGNBixL2alMBVqKwWdrnwjp9bCP7A
	 uUAVfy+ZOmfBZsxHlf8VDRToNqpy3dl+1D+po9AHZ7vAn6X6kt8lNTBQc9h/4IEPQLRpm
	 5zyPjRoaNPcKsEd8+/TYcJEypJdKkyyYhBhpOFzmOa+EgIwC5bPTW8qr9+0w9ONM59Nob
	 nAadgyWSS74oeHsaMCWIpths7XDHpxOweQddFyl5zRcQHvbADNIMHCjQTjgA9C9IoUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shazbot.org;
	spf=pass smtp.mailfrom=shazbot.org;
	dkim=pass header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=OHabTl7l;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qoDzDGIY;
	arc=none smtp.remote-ip=202.12.124.156
Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E37606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29E37606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shazbot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shazbot.org header.i=@shazbot.org header.a=rsa-sha256 header.s=fm2 header.b=OHabTl7l;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qoDzDGIY
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7D8147A00E6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:39:31 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Nov 2026 13:39:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793644770;
	 x=1793731170; bh=PeaNE7dalZwV45zaReGeYmf1fDt50itIMVJ+XKn3L28=; b=
	OHabTl7l+viCbt0xnKbWjHRYOp9fqLBvx01Ncz7r0plvc+DQ6XbooW1G14AzTGtj
	3+FD6jIqolqFwJD6m1xAK6O1ncVZjCtSOgyvyvgZeMVz25OLtdnEMZjdFvyxpsPL
	EIKjwe1oukO9BCs3ozOxAjWK4xbUN6sEnckOWigxgh5RA/53l70kLPurAFZPuVL7
	lCkgGIU4zijvKYUQCmNfyrnIGe7Zqjt1HGZRMsL6n0lYe+frjP5shHrAm6Y3GetV
	t/59MqwQJlghYjwmcT0qddwVy40bq2yY4tx+6Dsozh1C6xjk3umGXPHfgaV2L8ZD
	y1CSgaygG0STLQCQKkh3IQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793644770; x=
	1793731170; bh=PeaNE7dalZwV45zaReGeYmf1fDt50itIMVJ+XKn3L28=; b=q
	oDzDGIY8iT/DzXfWJ01ViDQqoe/9TlstXBRx2KOisUcIbG7x5dRWNDrugMweHfIs
	oz6PK8yLnEAa8e2GgxBR1Gmmsv+qZKD1FQKv3h8Wu7yFvjqprYhAd2s1T43+8ALr
	/wIholWrnkjKgKVtSW7BOIjXPbWMOZKSZohWImrQDrwhbYNFfRvLeaaGIhxOwebZ
	z9M+VByPVzzVgpOAyP35DZ7Z2rcrtAJ146JEhtIlJFh4nz26N3PhXlXUYbs0tBY+
	hi9XZgIb8cFxoWvoLZwf9fmBGuZH7iQXOYymDsoef/ooDKMrn08n14swVNR5NV+f
	rPN3o4hnkaWXanNAIfQAQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=shazbot.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793644770; d=shazbot.org;
	mf=PGFsZXhAc2hhemJvdC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:ykRcF3YBWAgmDz0LS3LIXXaZT8+jIrDKGIQplllBM/eUXUN
	em2Tlg0xEzXOKu4n2TzrqgrcjXACQVR7P7gWUGFdfvVsH6qYW6g1vNYooWRLjwdC
	M81CIOlUe/CNYM9XnwjhFCJoDwCebydSMJVXAooI3fxMITfHBCEoBBqYRsJOhTDo
	b/J4ldv7D5AOrhu9DcrNYSOBEJM2XSPtwlt3SvgfmthZAiotOOGwWFAvn/ZQciky
	YRaPc4jG3mP8MdrMFWL/sFTZOtqLq7ZU2zVvf997VnoFwEhPERmj1g1vc4jDkVDW
	HYb4Jm1j1x5bsnRwZ0mTU6bB9hNCNY5euVpIAtQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Fp2eSHsfZ1U36xYwtr7TUfbdq1XH0H8D0Sny0UeoCPA=:x7kQmzhCXKWd5h3q6Q0WiLpfxi+SiRly4NhaLANohPw=;
X-ME-Sender: <xms:4tjoatFx3m_WF4kZHh_fNtu6TfPtp7WtjI1vi6R5ZytBGwSwSeqdpw>
    <xme:4tjoaviS3LxaEeprsq-CcUaF_EutNSM0TkM7yHIDcRoa2bZR14WtxQ2agzLTgrhmf
    2FH5bDtE-Ny3f9GWgI6aZp3_USt0_3H1F3OJXR_x7_3ujIBJsWXCJKz>
X-ME-Received: <xmr:4tjoajrcTBpTxBpGl4xbYV5xzxjbNnSnQtjWUD6sPObGFDnkWdzw0wIaFuDqig>
X-ME-Proxy-Cause: dmFkZTGJBkKxJZJvDgvB9LxD8g6UoLB0N8oShSmK73J69dm5gDlx+vLtLfqQOEaAYkL8aH
    6+6Aq8uMp4Cu4dkR7iPVYfuOMMAUtnqsoN/78CaROPLdOUxJQFAqbk/y54ZSo7H5Wo1ngN
    TX4H4na2S3nfdVrVyFW44vzULM3GH8bNEC+BpRLVEGToyCRkuVnkCHO5RxKCxd2YDjodBv
    IgEr60QqAnX/Ufv/ebmmgUdN8leSNNXBCXEotS2o4VRO/JxjltRwUEtaFqV8gueG9R/nrB
    Pf1AkYvtZywbiwEZXwJdwO5NkkAngzZC67zRSJ9nnk/bRg+zFSbKXvlA0E9InSTmcbyeAd
    0ur2YYA4s5C9khY7Rb7cGia7H3365CtUkRTf2eDfEAmUqKnA1sYcdVAe4E/9xM5ALmyGJ0
    hzbubFZpN7xxaGoLAGcrWJY/CrYbAqe7ORrvAIVwDS9OuzFinuv1qwZ5fodcXd6NRx6n4E
    pGOPCqCXoUhbv6rpyJEldx+GM0ioe5nHWvZNZa3dD64hkJlYeGldRsYuPSbz4eHNgtkvpY
    7rb5czCyt9TdjzJWDx6EvLu7jYfRkIhNjWR9WwYQA2O46jvQBa5EoNbjT5Bj/t1i4H1+U0
    57weZuvKSrza6xNGisFErBiFggM/4Zf2u8T8uUyzNt+VALEB4CG5mIRgNGWA
X-ME-Proxy: <xmx:4tjoavTn1qcWVULxj1spTrnUjFcY9RY1qXPeaJKlCVhqqkLgV9qB7A>
    <xmx:4tjoakTgl16KHnMGc_D4x11opFdHIvbcsf743V8KO9Q1pnsJNnSY8A>
    <xmx:4tjoatU76TbOr8DdfBhneaTActkH6PQr8SNYVSkR8lJYRiDngJEJog>
    <xmx:4tjoah10ZpkHu1gU19ucHFEPXip5yBD2McgkpSIHSf9JO70Q7Ip4dA>
    <xmx:4tjoagZlSQ2D6iIMOobjOPoR3rC2ay3ZNnB5TPKn-Abr_9zDiznn9EJZ>
Feedback-ID: i03f14258:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 13:39:29 -0500 (EST)
Date: Mon, 2 Nov 2026 11:39:26 -0700
From: Alex Williamson <alex@shazbot.org>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Omar Elghoul <oelghoul@linux.ibm.com>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, hca@linux.ibm.com,
 gor@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com,
 schnelle@linux.ibm.com, mjrosato@linux.ibm.com, alifm@linux.ibm.com,
 farman@linux.ibm.com, gbayer@linux.ibm.com, pasic@linux.ibm.com,
 frankja@linux.ibm.com, imbrenda@linux.ibm.com, alex@shazbot.org
Subject: Re: [PATCH v11 5/5] vfio-pci/zdev: Add VFIO FMB device features
Message-ID: <20261102113926.19518a8e@shazbot.org>
In-Reply-To: <689e23a6-dcbf-4fee-bdcf-13d333db2e85-agordeev@linux.ibm.com>
References: <20261028154352.15108-1-oelghoul@linux.ibm.com>
	<20261028154352.15108-6-oelghoul@linux.ibm.com>
	<20261030161146.5af10847@shazbot.org>
	<689e23a6-dcbf-4fee-bdcf-13d333db2e85-agordeev@linux.ibm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 11:12:57 +0100
Alexander Gordeev <agordeev@linux.ibm.com> wrote:

> On Fri, Oct 30, 2026 at 04:11:46PM -0600, Alex Williamson wrote:
> > >  drivers/vfio/pci/vfio_pci_core.c |  4 ++
> > >  drivers/vfio/pci/vfio_pci_priv.h | 18 +++++++++
> > >  drivers/vfio/pci/vfio_pci_zdev.c | 64 ++++++++++++++++++++++++++++++++
> > >  include/uapi/linux/vfio.h        | 30 +++++++++++++++
> > >  4 files changed, 116 insertions(+)  
> > 
> > I think the only thing we never closed on from the vfio side is the
> > merge plan.  If this goes in via s390 I'd want a topic branch against
> > rc1 since there are a couple series floating around contesting for the
> > same feature numbers.  Thanks,  
> 
> Hi Alex,
> 
> Yes, I can create the branch once all patches are reviewed.

Great, thanks.  I'll try not to step on these feature numbers in the
meantime.

Acked-by: Alex Williamson <alex@shazbot.org>

Received: from fhigh-b7-smtp.messagingengine.com (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84564BA1F5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952369; cv=none; b=tWKRhhAQPxELBCxT79exWkThhXm9yA1PoMXWZGrkJ6qX0O4byTZumiCn7jVcskj+cRbvw5ISmf7mXbLV9U2V+48OWM3cMSYMG9h4Hte4n6g8z0zgbuzIgEtBHDUKFf5ceOBd+3wEa0CPKg1K3BkhsRoDfnLKPq/NZO1vMq6JFSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952369; c=relaxed/simple;
	bh=ZQlWcwgWptLVRnqN8KpFHq/07zl8IaxueqcKb/qUE/o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZDwrjpNhCBCyQK09MjLWMglMxRHN/hbxm9EdTyw1rV9IqSjmqhFQ8I4t/z29QFmHqZXKxw8V1yOP0rMVTpvFf8FjY3pE6kvRHEVyEPLjXmPRLKlddMu3zX4+Rkbv7ErPqaM6yY6f0tayqEWZbcu3CpUqtQBtpmDMu3ReZGeT2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=DU8r+6Qo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qDr11TER; arc=none smtp.client-ip=202.12.124.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="DU8r+6Qo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qDr11TER"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 88D317A00F5
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:45:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 02 Oct 2026 10:45:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790952351;
	 x=1791038751; bh=L8ScQo2XHsL22y6tdy6WV3wIGjP5rt+oMt5Jee7tGn0=; b=
	DU8r+6QooSxJXE+GJf9M3HKYd/HfJ6KvSGX+F0iibBV31YUB9jhdtAQQXmBKoqkK
	zIpr8HfVKKxt9GT2C+z6wYEZ6Q1GDWtmb+6rZxEvg5XS1O08JgI/dpnBlY0ZLOJ6
	unSUuzPVR/OnZJAph3cQ2g4Vo3FmYFKw4mk2WAxTtfjbgXc2Ckae/BBu6HisGrYZ
	Mb7jwi3JJycmUxWOE6s6D6+CPTBwdC6Dnyq84Fr1pYMLvc0AaPJ2AXzIcqB+Dx/1
	NzacYJmbEYfBLNu5YLJ+JRPk8QhlJeoU3O+DTIRnaJCHvuHo9QwzR2yikSK4zcb1
	mVImT7vA7Rtn5az6Ke5STw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790952351; x=
	1791038751; bh=L8ScQo2XHsL22y6tdy6WV3wIGjP5rt+oMt5Jee7tGn0=; b=q
	Dr11TERg14l/tRrkzb070KNhyqTfzuM8lbktBwRaTfPEiRcvmf5k+d3B5fPP+ZCI
	VHKNp+tViOjyPcKkDL7QE7yHI5kJocjEKgNg4UxC5i15XuBn1hdQx/UUFUZ3DeOU
	vab4mDW0ITZyGmXMPfaAspACTs2Nh1SZOlI2Ohb+AItxyQfq8zGD+1ic6wwdRJdv
	fRFL9oOH9LNFAfmFVTE3sORhO/bDzq71uGwCyf0sjS2gQGCpWzmh/Bf4rxRrDQSC
	09V8WDdOlvAUGqnH4mh6sBYsG5ZG4A85CuO8Eev3t8I3LVixnwAKIV2R/sN5EXKS
	EfqlHWYeE6PhLox/IyBNQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1790952351; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:fwYDUAwzo5FvtTnwU1NfzOHmpaxdI3v2wBN9EdP90q6GFAm
	ACE7sQH2F+WPEQdI/YD8vpuBzCsNALazlU/BQ6ysyb8gxKvX8+Zu9AcFp4icHZ0D
	IUlbNasM4YT7NM47y2XvBn9awlw08HGAuiOng8I9OID6JkHSg6OAdfyQDAwCJtPk
	gisrdH1zoOCw/3oL6Dc/1gbxFOWxaeD5mGbfH9Dc8avNFvzGl28OljvTzmgDGQyI
	ytr9OOvMjkGKfXTtMeteZlZ3+xGo8gqOdbTg2Xmt0HLZ3o46AzTXLCaN5cxZttJT
	71sObgaM6dUHjIyPuCBfTqcLxZhIK+9cNyzlWcQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-09-30; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:KPwX5aka5VYDXiAA1fI3Hls54BYaGNzPqNKeVN846/M=:ZQlWcwgWptLVRnqN8KpFHq/07zl8IaxueqcKb/qUE/o=;
X-ME-Sender: <xms:nMO_ap6ULmmmdXI86LWJvzbZd_6LfUxwK29ICjZgA7sWeowTtG76dQ>
    <xme:nMO_ahsPkoObpQEYnW40qCMwgtzSJ1sHLKvIhSt3vQjWkjfVTlTA8tqxxeEsj7pXG
    1eKnBTiYa-BO26xVs6VtSrGpZzNpK2oOyKNG4qt9Mh1seuISEBU3LE>
X-ME-Proxy-Cause: dmFkZTF9Oq0glzIMNMGryai4UmT1G6mPHvT/F92K6D2yEKlpGreaufoUs2nxbaXfd+lnnH
    M5TP27iH4vwFvc79soTqe7haIDsn8U4fD0LVCRAA+XdVLwKKyxg9WkFEMJWUwif3Dky1gM
    xhcRyICh/qWBNySas4rg/dAQiHiCxi4dHZE51Ze+YqMHZLf0Ptb6tPFJAlexj0kDM4K0MH
    d9NjhNTVN8HdMzO5TzTsvuggd6nbg4t1hJfblsdX/2zURACTcczyULOuF2+iQoj661r2bl
    MkJNM/muUOElaUlk3e6eOQoAOvc21hT7zDk2BguP1t7fDrhirj7ysuDGO+apB8bzqGU0Jm
    b1f5ziayS85CSQyFrjDwbX8bwewZG6x3Zp507BFV8Vy9msvMCYpgiI5M0MXYJ76q2OcLYt
    1SgrcgiKRbc7K0W3iVQk0n6iLNIK5gF3ItGmgLT1zZS/r5Jew6hI7B+1PePGBjKwTxUIm1
    A9txD6fArXK1O5dMckdUgNfPhq2kIfNC+xCDpwYtWteBp8yjB5LefyB1frKC/WxFPCvQtu
    GYhKsoU4WMIAODl8IYAmwa3PtkAvakHCvFmlvS6woWIVrR/Zv2BQfGxUYe2jBGBNTBzsj9
    YhGIcpHoNSKDkdSnVIbpfoGLtkOO/Fm+KItRjvAIHgLvkOZmXjpDFfqpQzPw
X-ME-Proxy: <xmx:ncO_ahl2u0s3daDM9bl1KugX1RVQl9uSBEZ5gxaSS_5hzphZSBktOA>
    <xmx:ncO_amIu5Ru3ERNjssNPp5McznZEidSAnEvFe28bs082k5KOqOI52w>
    <xmx:ncO_au6aDu2XBdaXGy-FN5w1QEVpMyrMt5JHl182JxMvPBgC3zJKyA>
    <xmx:ncO_ai3qAdVkpkR8aol0N8P3v7OlOrLaFWBfHuO2dMxOFJndPj-kQg>
    <xmx:n8O_aj7ucERi3L_--pVAdwnQ7gr3n6xdB3mURb55rIaE7vVqtUPYiQ34>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7DCBE32A008E; Fri,  2 Oct 2026 10:45:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AHul4omuBXlV
Date: Fri, 02 Oct 2026 16:45:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alex Elder" <elder@riscstar.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: daniel@riscstar.com, bhelgaas@google.com, linux-kernel@vger.kernel.org,
 "kernel test robot" <lkp@intel.com>
Message-Id: <954a3942-11fe-4ffe-94dd-9c5a461b9a6d@app.fastmail.com>
In-Reply-To: <6f1e101e-9c15-4166-8ec2-346e587d6b33@riscstar.com>
References: <20261002140738.393453-1-elder@riscstar.com>
 <6f1e101e-9c15-4166-8ec2-346e587d6b33@riscstar.com>
Subject: Re: [PATCH v2] misc: Kconfig: tc9564: fix and simplify dependencies
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 2, 2026, at 16:35, Alex Elder wrote:
> On 10/2/26 9:07 AM, Alex Elder wrote:
>> The TC9564_PCI config option selects PCI_DYNAMIC_OF_NODES.  But that
>> depends on OF_IRQ, and TC9564_PCI does not satisfy that dependency.
>> Simply adding "depends on OF_IRQ" results in a recursive Kconfig
>> dependency, so we need to satisfy it in a different way.
> OK this still isn't right.  I'm testing with a SPARC build
> and it's got a circular dependency again.  Please DO NOT
> TAKE this version of the patch.  I will send v3, which
> will address the original dependency issues AND will
> complete a sparc-defconfig and sparc64-defconfig build
> successfully.

You still have the 'select PCI_QUIRKS', which should be
'depends on' as well.

       Arnd

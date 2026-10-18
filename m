Received: from mailrelay-egress5.pub.mailoutpod3-cph3.one.com (mailrelay-egress5.pub.mailoutpod3-cph3.one.com [46.30.211.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED33CF1FC
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.30.211.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339645; cv=none; b=AQi6FtOb3O59YT2ZtuVMceqrBvOe+jGSnEih/UrgIsf0pA63kldRtJILiFbxZnJnfok//z2+5YCHtuN5ORLj1G9zCqSFKePhuQOu2SBBOrci6dE583W1kj5kFBb+004ymqpCwMcWtf7Bwa5dwyyw9hSP+9m0b1tr4Vf+0bXavao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339645; c=relaxed/simple;
	bh=PF7sploXZKUksNVu2vBA7Q/K83btVNBj4zu783ro08Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mKFCWi2AzGzArdhzXiPkMLt3MrsypW526mzhiKmre+Lu45ktwsHMbac4DTrwkYS+fmq+NnqPCs5kyp33l+3EGZAs1/kvCkK37GwAKv/C7BMrBQ2NwvHB7O8gtuYoFeeHHYHfxUMLdpe2aiaOvV1iSWBOCZnOvlabMZWptwxP/cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se; spf=none smtp.mailfrom=konsulko.se; dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=X7mUxzzG; dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b=Zo6n1lH/; arc=none smtp.client-ip=46.30.211.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=konsulko.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="X7mUxzzG";
	dkim=permerror (0-bit key) header.d=konsulko.se header.i=@konsulko.se header.b="Zo6n1lH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1792339636; x=1792944436;
	d=konsulko.se; s=rsa2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=PF7sploXZKUksNVu2vBA7Q/K83btVNBj4zu783ro08Y=;
	b=X7mUxzzGpMgIXeXta8T3QM7r5oTn2SVxPFka4nW+gYehm8wYlZiu/5B4wR4TUXCI+fimkasBxauHR
	 loaODBO6aedIAUBWbJsRnvtMoEH7MCZTt3hkvRgXCGaoZcf5uM80dvWT6H/vP5nI6JaAcfUqWmIrtB
	 7gNssFIRuotBLh7dUDkZHIdlu0xdwOG3k4CGvy6BfUD/LO/zzVtbNvedL3sN34QUB1ytJD28jf2R2x
	 zdLwUPeO4vpzVuyObfYVTu1YiW297d3C1WN+M5iEDqAKOPQFcOZfZzTFlB6uQ8hCUJNLipADWf3AFa
	 7Ews5+wHo3ybU6WwlxRyKNyR3DiXtag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1792339636; x=1792944436;
	d=konsulko.se; s=ed2;
	h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
	 subject:cc:to:from:from;
	bh=PF7sploXZKUksNVu2vBA7Q/K83btVNBj4zu783ro08Y=;
	b=Zo6n1lH/O7fHr5Di7LPgOH3OQMp3Zc3EhFairyTVgUzHY4cZqORMGVI72yjIweltKuN3m5We8GPWg
	 1j7UYuDAQ==
X-HalOne-ID: fc234faa-cb0d-11f1-97ec-1db1c303b0c0
Received: from localhost.localdomain (c213-102-77-204.bredband.tele2.se [213.102.77.204])
	by mailrelay3.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id fc234faa-cb0d-11f1-97ec-1db1c303b0c0;
	Sun, 18 Oct 2026 16:07:15 +0000 (UTC)
From: Vitaly Wool <vitaly.wool@konsulko.se>
To: harry@kernel.org
Cc: akpm@linux-foundation.org,
	cl@gentwo.org,
	hao.li@linux.dev,
	hch@lst.de,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	nickolai@csail.mit.edu,
	rientjes@google.com,
	roman.gushchin@linux.dev,
	vbabka@kernel.org,
	vitaly.vul@partner.samsung.com,
	vitaly.wool@konsulko.se
Subject: Re: Re: [PATCH v1] mempool: fix min_nr exceeding the elements array after concurrent resizes
Date: Sun, 18 Oct 2026 18:03:15 +0200
Message-Id: <20261018160315.1465504-1-vitaly.wool@konsulko.se>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <atTh-yyVIPQ-zNWJ@thinkstation>
References: <atTh-yyVIPQ-zNWJ@thinkstation>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > How about we take my patch [1] instead since
> > it isn't prone to this bug and is a nice optimization to the existing
> > mempool_resize() at the same time?
>
> It is not a good idea to squeeze a bug fix and an optimization
> into one patch.

Generally speaking, yes. But that patch had been submitted before the fix
popped up, so there was no sqeezing per se. It's just a better way of doing
things.

~Vitaly

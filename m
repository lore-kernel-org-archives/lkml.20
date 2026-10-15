Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE3F493D52
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053582; cv=none; b=DqlzNv8gtf3r9j9mIHkbYH6zinywYZdG7xoil9d4Lj8fLZhd3Wger+IrLr2sr/juCd+MjWQhaB4sLdSRYenmeKn+W9SjNvsltKp0s6u9jJza2LiCG5bNxU0wdMcbGlvrceDaxQuwleCQDHgaH46ZHyrx09HRFIPT2wye+cihxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053582; c=relaxed/simple;
	bh=E1GWcc5IGl5D+i622wPhfyitPLb1n8zR6Na6LjVvxc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DFtRkh1KcnltBIziTUX8Hd+wQhm0h0NZAMhqEFY5GXloY0eSrxspnFDhEv10Oq5v4Ql0mCGycS0CzIcPnIYXQFYF2JyJ4/sPyiTVFysAyqfUZeZ4yiSPEr4Jt6sUjogVZZP0H7cnPv8VodW3q4s/SwxlvawP3TI/mmVu0fu4DHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cH7wevxJ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JBxjdmKa; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cH7wevxJ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JBxjdmKa"
Date: Thu, 15 Oct 2026 10:39:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792053579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bAP0jFBI8WAL+VDXYWXzcPI8IjLkXvZH2SutsFfuipo=;
	b=cH7wevxJoqYgrOYPPcVpz1mXa17o3t6H5ZnOsS6sjw1dpVIaZxU2ngfODWwZFwo/vmCxJA
	eGnLvO/WBiw4/EiEXuyA9D3GZuXgsdU35tnaL8xCz/YCUjxsZkMRNyXHAQ7H14yZcljvnV
	N/KX9/XAZihSlQsqmYOTlVdi4OF85MJw5CLI82EGF/yWzM32+vFDetwVR87DZCajcKOlbv
	IXN0wwrbbX3Sampb+W1FPG7b2Q53YwriFA4O4kr25vBLMf5XmrZXjprkighBQIpSyGi4Qi
	nJeXDqJsxa/Og19RBgtub90tRQgzWIrP5Q1ub5/s351/DZZlddQN6bC7l+QVUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792053579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=bAP0jFBI8WAL+VDXYWXzcPI8IjLkXvZH2SutsFfuipo=;
	b=JBxjdmKaAHPCOWINepCeoqlvfCr2GJ2vjheYVcFtESuxFM/2BxXPJ4dhpZTkDKvtcKMNwv
	CU5ppBAO/ex+CyDA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
	Michal Simek <michal.simek@amd.com>, Harini T <harini.t@amd.com>,
	Tanmay Shah <tanmay.shah@amd.com>,
	Saeed Nowshadi <saeed.nowshadi@amd.com>
Subject: [Q] zynqmp-ipi-mailbox and SGI interrupts
Message-ID: <20261015083937.8SDbdK8P@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

The ZynqMP IPI Mailbox driver supports two bindings of which
xlnx,versal-ipi-mailbox is not present in any kernel dts file and
xlnx,zynqmp-ipi-mailbox is used in two .dtsi files.
For the per-CPU interrupts the irq-type should be 2 (which would
correspond with GIC_ESPI in the dts, no?) which I can't find.
Before the IPI_IRQ_TYPE_SGI it used to check for the value less than 16
I also can't find this in the two available dts file.
I did browse over the "AMD Versal Virt" but it also looks not present.

My question is whether this is used or just a development step that
never got somewhere. 
My guess is that the device tree here is preconfigured from the boot
firmware.
So is this SGI-IPI a thing or not?

Sebastian

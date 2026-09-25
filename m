Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053FD397920
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790318663; cv=none; b=btFHBgZmUhb5hfWNf8WEcpylgimZ3qM5MucoBiyWX/w7onVTr0Y+mvZc1nOpQcluK06wT9Rmxv7Gc6vTyjvX2hQFdgOd1CHg0G326pWloSwdF5LJg5VQYl0v+gwqnWVIdp0PXiBJ4uzoNU3YhRqn7JtkO7ioAzAzyoRhAZaGMc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790318663; c=relaxed/simple;
	bh=03IrB9vAF/bkxYF/q/kywUS8ATF2rd0t56Gfd6VXeNs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=tvuMwCUQwvJdTE/j7VPfeHH1QJ0oJs3VXE70yhNViVhpC7vTdur4SChtEtP3/mhyKQF+zC2V00BA7TeCfruSWyfocTDizAO5KY+jAu4B+FlBIlGTjNIKCCAtdyq3QLf8nJMY1BBuqVasqiWZw5G2X3bhyUfH8QfwaggKnTys8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Nu0oj7Ul; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BgM0Gyvv; arc=none smtp.client-ip=103.168.172.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Nu0oj7Ul";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BgM0Gyvv"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 33DC71400150;
	Fri, 25 Sep 2026 02:44:20 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 25 Sep 2026 02:44:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790318659;
	 x=1790405059; bh=NaZmI7t4xspdCcSwZ61TEkj8dOh5uZ/p24PV+ZMnDZw=; b=
	Nu0oj7UlIMonbzdFuiOnXEWPF2hJYzyzOAljnTNeALWZYE+crT5NlZVumdUphWuo
	RZfkszIAbYJ63RItV/vEeOiQ74DLVVtT9yETf+2AJF3Il3Eex3n0xgcWnaeuY6cY
	6wAQ652I4qv5mzSSgasKwoKYU+wCzLh52vxBQtMU0A1NGLzTkU08uoOOv1YJHDNS
	ckaCEp+UHTtrcaBH6hQjxny3jF7C9TpRGj0uTrpkGWUCUr66kKW6kP3H8y7Ud+l1
	gwVry7mP+a34dtogloyKtXCbn8Yshbn9oEBHJaRjbb4wzCv636+Ld2fSI4+wZHCL
	bp3lDOJZ7vw0Y/KnzuS3FQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790318659; x=
	1790405059; bh=NaZmI7t4xspdCcSwZ61TEkj8dOh5uZ/p24PV+ZMnDZw=; b=B
	gM0Gyvv3PiGDCIXQOHuxl6hJHi3qhgh7HkwPgl/OcTXEjOB3+UqitNM84mISi+iz
	+ycfiYljhdmWBwO0wKZRXBfXuBfOqTioznIm+HWkfsKX23zU2Sb00pQljzDUbuIr
	HkCvLt+gVhdFM5OfjBUcWNpyOT7+RVLygdng5266IoTu+8jNHrxCxDIzdsBEBvPw
	++iA2YoJUtZuy7QvTTU1Uv+PgEFSueGgJvqQzKnpBprx9voPJ3rNvJQFKBk96l2m
	O0NqblZtGOUxFcZGNEIVKtIRSuIVTPDsCyZDqC1Ue/3ZAE0DCEy27p98K+Oq1l3t
	kwmxWfaZ1uuOee0Vrj96Q==
X-ME-Sender: <xms:Phi2apPO9ujYSIDasbhJpnMTzke4qSpbwvrwzhlkXuIAI7-cnSWZfw>
    <xme:Phi2amzawLOHn6D_TcxFB_sryNZBvDNGlXG3Mk5xGBUhjGYtjqB5YZpcBGi2Vvxu4
    LO4jainLSHlBfr9xfRwMoKueRag02HeC2zWkT5k5Me375Lln4hJE4Xm>
X-ME-Proxy-Cause: dmFkZTFwSDqkQ+iCgv9bfoZ7OnGDv2/E32uPE8Fd0Y8/G3hqdMfXKGBRJsqwYtMQUVYQrL
    6rBdD5WBkmP95rwBjb56UCQmEFVpH1MQeNf2EH79A9tcFirxDEH49FPSDtgesI6qTlZLhS
    FyGt8jwZs6/BRCK8WQBtj8/8wSniM5z0sAeYIZUw6RfTL0VgIo3U3fygtLYZE95pxCSHFZ
    WepR8wEVKtPNAYRuRFUV+Y6YLWfdH1/Sqbu3qA9d12FobAwCl+aIFvcISyJveD7NAd69ne
    nat+mzAMqvQmRT39Um5yv7DBEV4FS8+RYnZbN6r0+WRL47rc70az+oyh1zU2Ychr2GGWJK
    u2fZydkW07nhk+soJMbSuvqR99kgSdHxX+7M/qJVrV5nxIlqC/RPoPvuKCMjyhYck5Mn+f
    AdFbaAQW7BZ/q/bJBeQ9EqwX0ccvLKpZIf0UH39rOJ8ygTbhJoyyJz7XCaowgaxqDiq2/t
    d7BY1jleB6/ow+3+ojRHL8gX24SKUACYZjIQrd7G0Brdt9XWe0nPXJMcfi9IIQWoiFdlP5
    UsrXZxRyK7FVGTK3USyOhdqLn7j9uBACH1EQaZAZnz0Wxhmaz8p7Rx9+/rfD741yv1TZ5H
    xDqojH1YmlZuRqBLUIoKWOM7MzgbFiWpplx5yWj8NVeSv+K0ybsfoQUp/sgQ
X-ME-Proxy: <xmx:QBi2aks9cVmtVVgDWOpZQLMYJnnq0WiDCmfwfRCxnKtd462F6IWytw>
    <xmx:QBi2akh84Y1eWIqTMNJITEkMXmXRjN7zw_8ZM-RSgwQZXQSLDngT3Q>
    <xmx:QBi2aqZyKF1u83uvY6x5VtDegQdByG0waYvUbau_-OqIjkhMPjJFWg>
    <xmx:QBi2ajZsRH8i_I6LnZImUEKiEH8hyvZa7XSe454pHywC3zynHKSWFA>
    <xmx:Qxi2aoPDxdGsEJ87ytSqbbO4qDTPCBr6tYWu0Df0M_3PB94lWMJwcP_a>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 7288232A0087; Fri, 25 Sep 2026 02:44:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Am_z2EeL-WEB
Date: Fri, 25 Sep 2026 08:43:54 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dan Carpenter" <error27@gmail.com>, oe-kbuild@lists.linux.dev
Cc: "kernel test robot" <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Juergen Gross" <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>
Message-Id: <94cbe491-1b32-47ec-a9b5-bed69bc4d52c@app.fastmail.com>
In-Reply-To: <202609241805.VsLzGPLn-lkp@intel.com>
References: <202609241805.VsLzGPLn-lkp@intel.com>
Subject: Re: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift to zero:
 expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Sep 24, 2026, at 21:39, Dan Carpenter wrote:

>    489                          return -EFAULT;
>    490                  break;
>    491          case 2:
>    492                  if (copy_from_user(&m, udata, sizeof(struct 
> privcmd_mmapbatch_v2)))
>    493                          return -EFAULT;
>    494                  /* Returns per-frame error code in m.err. */
>    495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
>                                               ^^^^^^^^^^^^^^^^^^^^^^^
> These integer overflow bugs are from 2012, but I guess your patch 
> exposed
> the arm32 build to the zero day bot.  The bugs only affect 32bit 
> systems.

Right, the randconfig came up with an ARMv6 Xen build, which was not
possible before my patch. I'm sure this was reported for other configs
before and just showed up as introduced by my patch here.

This is clearly a bug but it does look harmless to me, as it only
results in the userspace corrupting itself when passing invalid
data.

      Arnd

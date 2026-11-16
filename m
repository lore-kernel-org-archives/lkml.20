Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.177.127.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855018;
	b=Tn639fomZKJIe4fNlyGxfJy0WUsFsogvbXHuMl5T9KWYXU8lQ2EhxPPH4IPi0dV31J/W
	 2H3BhYWfxWdmiz2aU9ADgprfNL8Zvz4vHmLs8MnGQndmk1UT6tCBrr/aUcA8ZU1fusq34
	 DHKU1COPkJOt2f+ryI2qPr/9CIG5jRc4EhkZDslBm2S2cw4sN+9P5h/eZBSiCTaWJnqbS
	 td9Bp6NGGtEnAfVDLZd+mBPSqowjiSbRpUN/ltGpn9oyzGIGM3D7t/4N5SnXhacBn4AgJ
	 HRuiUp8EExxXd2JS4LvlYQ26rm1oAykOHAkpTyz6/Sm+YLRuaGKPm40e44cKH/BXF9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855018;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=vdb0XB5tbcxRoHmRNGigJWSGFyafmmBmgtOwe6odnDc=;
	b=5k3WnYyJsah9PUG8gC1xK0UJbTaYqP3PRAWmYxRtH/8WVbU55C9Tegt9b8bPYnd+QHiW
	 euiOk4VkgJ5RBnQDGtQQZ1DgBYHx/36+o3rR6dKDMhtwCEqf1lEoPdIMsu9waCT2elI28
	 gG1lO+HBXLicaGkXx+r8ZftAGwtfdJvHYGz1uFCu9B8zTCQPC8tV6s3jQ3HrYhigqVege
	 yeKg36cme+F+7FmTqOjpPdYLdLOECt6HTjfR951FqBgibOe0Y+tVJmAfGyk56AB/veJN9
	 NyTYV4FUnFGNfBaq95HcgyGvwezsA7G/04Jcgjp9hJp6V3CnYErChkAa6MSGBmqeXPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=k6MHEM1y;
	arc=none smtp.remote-ip=198.177.127.196
Received: from out-utut-a196.jellyfish.systems (out-utut-a196.jellyfish.systems [198.177.127.196])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE796606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE796606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=k6MHEM1y
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxk664Kfz2x9D;
	Mon, 16 Nov 2026 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794854993;
	bh=vdb0XB5tbcxRoHmRNGigJWSGFyafmmBmgtOwe6odnDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k6MHEM1ywbJ5rpC2qeQAay1+Y34A27EHFPIRkIpLRlk0gY65DyDbSvLTETJdsCFuS
	 2FJYuQucV2NQOf+PdCPQBBS32hD+Yn1+rsQQKrQFY8LEa8Tkq6I+9hyQOtIw2jmW9z
	 89Qbg43mRaA+X6wcOpW658M8+J4m/hFW7zy4EnoyzpyScK/QGKQomnqHMQLsIl+TDs
	 8EsTvSZMHzkfIDD9SXPyT1Y70+tmDBz2c/9XegZ8FeTFwMVGZARHXr5EQiubcz4RS4
	 AeMfe3PLzY3DkaziQqtI1moqBQRBb8ayzVXA4Md4cNK/tJ6xvyoZE2dNMJLEDfqW54
	 z3ZIDBaINCnxg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: francesco@valla.it
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: Re: [PATCH 2/2] remoteproc: k3-m4: Leave crash recovery enabled
Date: Mon, 16 Nov 2026 21:49:43 +0300
Message-ID: <20261116184943.1900328-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avodrGAJY6tZtrpP@bywater>
References: <20261109054830.42715-1-dev@chrispinetinega.com> <20261109054830.42715-3-dev@chrispinetinega.com> <avodrGAJY6tZtrpP@bywater>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

Hi Francesco,

On Sun, Nov 15, 2026 at 10:04:00PM +0100, Francesco Valla wrote:
> This can be fine for a core started by Linux, but it's not for a core
> working in IPC-only mode, where Linux only attaches. In that case, a
> recovery action might start a firware living on the Linux userspace that
> is different from the one originally started outside of it (and if this
> is enabled by default, the user might not even notice this).

You are right. In v2, which I have just sent, recovery is enabled only
when Linux booted the M4F. In IPC-only mode the driver keeps it
disabled, so a crash there moves the core to "crashed" and nothing is
loaded in its place. A user who knows the firmware matches can still
turn recovery on through /sys/class/remoteproc/remoteprocN/recovery.

Thanks,
Chrispine

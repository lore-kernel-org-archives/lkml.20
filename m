Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570667;
	b=qNB1AbEYTur0nEAWbvqjKF5wFvOxzixeswSjUL123DVgRrh8mA20JqP1Dr5FNinMYHgm
	 OgPBcnmsrmvP6V0sOkuFZ0WdAicBa+JF//dmdNfbEWNaHRL03ZBcHhKEzVIEdQzGPsoA5
	 8bkaue/wOIbH0C3gj8jhrQ+PMdNtH7yNftY4GvRhwC9E1CVVAUPH6B/h9YjwrZQgT7asl
	 hL1x4LH+Sey3hFdEwd2QDYaTRe4Bew+qMEKYwu0P+0HYPifHa9bf7/CpFx7Lj2KvJm5Pr
	 B/ClUJTvDyjNZv+vADJ7RFpRfmAOtF+snu4Gu3tWh3UBWxtXa9fljK+dsGKh7ZPY5PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570667;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status;
	bh=mtGj6veBCDbwsO8PKWpn9QJSGAVDV4qLDzsTbYJws+0=;
	b=AYUoYU/oyyNlquR9+0K0zpkUG96hycdaT6q3LTxHTuxD9yUdL3HzL2bT5zJosQIYW762
	 bAlvAL3hbiMNmE2ZiS+H6wXmhrfQd6l36Q6Q10HntJrn6PGgkPlDJhHjmO3Cs9Vuwx+5O
	 sVMjDFKSTQtNtW/rrX+MTgB8Yo/GdEYdbxVKp8NunznRDS7JeLiLstxYid2JXbjYZxwBZ
	 bjA7WE4M2uzbOZ+5y6pfE62lixHU7pE3LuKOiI2QEzFfkpivYPN9DsWhIkQgmrSH/8SNt
	 AQuDeRN2N41QgdUylCEjcI1zRlq4ZBQ/jWeNMiLluQKqaoTcSbiGnx5P04VxWRk/tAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=jmu.edu.cn;
	spf=pass smtp.mailfrom=jmu.edu.cn;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91A3C606A338;
	Fri, 13 Nov 2026 11:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91A3C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from Vostro-3710.lan (unknown [14.220.232.40])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54988c7f9;
	Fri, 13 Nov 2026 19:50:54 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: coiaprant@gmail.com
Cc: amadeus@jmu.edu.cn,
	bigfoot@classfun.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 5/6] arm64: dts: rockchip: fix USB OTG power on Photonicat in battery mode
Date: Fri, 13 Nov 2026 19:50:50 +0800
Message-Id: <20261113115050.362683-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CALj3r0hOjksUtYg+qLqPU9kz4w3SAqGvSmFFi9YBXNGiEPEZSw@mail.gmail.com>
References: <CALj3r0hOjksUtYg+qLqPU9kz4w3SAqGvSmFFi9YBXNGiEPEZSw@mail.gmail.com>
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
X-HM-Tid: 0aa1d4bf11ec03a2kunmbf5334663d203
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGklMVh1OTUwfQkgfTEJMTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVU9LWVdZFhoPEhUdFFlBWU9LSFVCQklOS1
	VKS0tVSkJLQlkG

Hi,

> I understand your concern regarding 5V_OUT not being a standalone
> physical regulator. However, I'd prefer to keep the node for two
> reasons:

It looks like you copied your previous reply.

> Regarding the startup time, a fixed-regulator without GPIO or clock
> controls does no hardware I/O during probe, so the overhead is
> negligible.

Adding an uncontrolled regulator is not recommended. Similar discussions:
https://lore.kernel.org/all/90eafe45-7863-4c1d-b1e5-55a4fe32c806@kernel.org/
https://lore.kernel.org/all/20260511065338-GKA3624147@kernel.org/

> On the node ordering: the node is named `regulator-5v-boost` (starting
> with 'r'), so it is correctly sorted after `battery` and `chosen`

I misread it, sorry.

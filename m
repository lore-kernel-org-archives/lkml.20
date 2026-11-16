Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817324;
	b=Cw3osvdRyW9OJaCdIP8Raa3s67h/RxRNJgVmcDnyDD5fNKSHzAbYXfl3qRNk8bpvktEb
	 e3Ai6b7C62amlG4eIa29UXeUuWOBUZkC/6BgyZnXrmLDeR0DdEal6kS+UHWG7DvBRBgFW
	 jLs5bpNPhI134VfkPckNP/xny03TVSVRa7CQokN+xt6+TdO5A9NKBlKSQGN9cIiHzJJRa
	 1k5QP2DM0CF8yO6gX2JOivnOOZ87fXyERQlbIlPRYrqrnr0O9R7guMWcz78ty7JxOj9yN
	 pZj9cpItau1rZ07W/nrK0kMCjzJ9z80OkCg0yt4FanA2IEqqAU+wMxNMc9xzMk5/YOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817324;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=77LzJsdVsNip6MkS8i8hGAoB/pLEvqzKmKYq6uHg8Jk=;
	b=bowdITmTFdxk1ATH6l+J2/zN+YQ1Py3kKtagNk7gLcjdsUrVboii3FTZ9YFWIerpZxbm
	 owB+9sf0A5CfAY8o8ulRlL3724zivQ7jit4/vnnFmFe5S+C/9yBwpDP6wRxQny7XrKaHT
	 lWn25AV3kgoYmAUVjDzAwERxaf6WuAJgw/0VUDNoTUse0p61ofeiTxt13vl1ketn9U0iU
	 fcYn6UYCMK5Q4Km9SWAySLL1ClUha1+MpkyGGgUam5bqsb5Q+vd8qs43D46oCeqBC1OYx
	 YLI+3JUMd2RYQ1tfXAi7weSY1X3AKbuaXQkSVPT+fu1wy970ybdzz8Xq36k48QIOQ+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KTfGac7e;
	arc=none smtp.remote-ip=95.215.58.140
Received: from mta1.migadu.com (out-140.mta1.migadu.com [95.215.58.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A014F606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A014F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KTfGac7e
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=77LzJsdVsNip6MkS8i8hGAoB/pLEvqzKmKYq6uHg8Jk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794817321; v=1; x=1795422121;
 b=KTfGac7eBtXHx8eqAe1+RnihrQjb5MO6vN6Qs0tdnl7O65SOmKUlSIz7bxKCgO5HKmaK2Zfj
 mMdpG460oZfUKrtpAXKGIRhwSB+ipvE3LGsK1YYHVKnJJW7Xvu1leSM75xU3VcjiTn42De7t66/
 ClvnRzYPkoz0Mm75LYhDoPlU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0d77f15ee914f6d3;
	Mon, 16 Nov 2026 08:22:01 +0000
X-Mizu-Trace-ID: 0d77f15ee914f6d3
X-Migadu-Flow: FLOW_OUT
Date: Mon, 16 Nov 2026 09:21:58 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 Yan-Hsuan Chuang <yhchuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next] wifi: rtw88: program the beacon interval
In-Reply-To: <20261116072022.1142783-1-mehmet.fide@gmail.com>
References: <20261116072022.1142783-1-mehmet.fide@gmail.com>
Message-ID: <F67843D5-7D0A-4A7D-BAB7-DC3DDA1DBF6D@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 16, 2026 8:20:21 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>The driver never writes the beacon interval register, so the hardware
>keeps its default of 100 TU. An AP started with another interval says
>that interval in its beacons and sends them 100 TU apart.
>
>With beacon_int=200 in hostapd the beacons of an RTL8822CE, RTL8822CU,
>RTL8822BU and RTL8821CU are 102.4 ms apart on the air.
>
>Write the interval when mac80211 sets it. The beaconing interface is
>always on port 0: rtw_core_port_switch() moves an AP there.
>
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/1D396970-35B7-4B0B-82E9-24B523AD69C2@linux.dev/
>Fixes: e3037485c68e ("rtw88: new Realtek 802.11ac driver")
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak

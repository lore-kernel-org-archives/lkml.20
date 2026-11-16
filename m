Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797894;
	b=sibFP0nBZPrdIOXtU8VuTIGI42CMXB+E/w7BewOiGptxzCUIpsYFPzOwgtR/QkuN+EPv
	 zgw/H4JnBRmEA93KhHT/DOW3JKIwJKksABrGlOrAzXw0URhlzqDXWYzRg1AjALAgxCjKQ
	 AqDHm4repp5frJQpL+08ykpP2lw8KvWgIDMyqIgAFMBh66pnPhxrt2n7u39fDVkCG/Q9o
	 FeGvLbhUxEH8+sONyjwKUlKTypFrKAm905TxTdlYvYf0XBs+7aMPd8psg9AyuagZMZR8O
	 gjfnBGnL198ovA7Hfk0RlEdpgFlUmZG+XHBDQs6MNefeuqsipwt7NyAUNi7l1gK5Zow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797894;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Pz245/qiYdhAlbrbZ9JGtp5YOswGm+RxhscLH6qfgIM=;
	b=YKiEAS0e8zat9ZYvCAAN6OwQgR2wfesgpJOGIfE9tRwKtzNYvMpH98o1SypPAWXCXF8z
	 7wqv8GGpgBfn4OoyD3rOcwvK3dN8n8+z/X8FLdY0CdgT4lfhzojdLTkd5DUimqU3bp3PQ
	 902+MyitTPffYQkySu8WpTvfJelYETaCOh1SyMhqsbbozjyB3OV4iT86kcVxB6UKRL+6G
	 76D3UgjAy1wjq4GLBdUDkdJO/hwJMDy6Ybr73BBF7NIlAr6gWxXGyHD5txMFZcqrIVHK5
	 QkC1+yADdUI1D2IjKSXKOlpWhWnT425MDsSQScLSapC/gL+8xyITH0oCvcWs1/lcKew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sBpx3Ibm;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463A6606A323;
	Mon, 16 Nov 2026 02:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 463A6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=sBpx3Ibm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=sBpx3Ibmg/ey4nt9IsmrNa9gaEQTukyE5dcsTHQrmUhG35IBjUHuIRujbOhyWo8+ueHLRrZ6gS14+
	 DFldiIZ/s701n1Iu3nzNV5CMKJ/UyzHxSgets3uriQZcIk1rSFC5OZEwUSGDL7bQGWJjVjm3TNSSxE
	 TQlP6A47Efq10Q0s=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96afa7140acc-0018b;
	Mon, 16 Nov 2026 10:58:09 +0800 (CST)
X-RM-TRANSID:2ee96afa7140acc-0018b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHD-W7400297 (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76afa713e7df-79766;
	Mon, 16 Nov 2026 10:58:09 +0800 (CST)
X-RM-TRANSID:2ee76afa713e7df-79766
From: Aibing Chen <chenaibing@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: Aibing Chen <chenaibing@cmss.chinamobile.com>,
	netdev-bot+sinfo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: hso: cap the MTU to the mux tx buffer size
Date: Mon, 16 Nov 2026 10:58:06 +0800
Message-ID: <20261116025806.244-1-chenaibing@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179479401486.3291.17345716560777690357@kernel.org>
References: <20261116014904.556-1-chenaibing@cmss.chinamobile.com> <179479401486.3291.17345716560777690357@kernel.org>
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

On Mon, 16 Nov 2026 01:53:34 +0000, netdev-bot+sinfo wrote:
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

Code inspection, prompted by the automated review of the companion
skb_tx_buf fix in the same driver:

https://lore.kernel.org/all/179477764293.3136.7267245337781305691@kernel.org/

That review noted that hso_net_start_xmit() copies skb->len bytes into
the fixed MUX_BULK_TX_BUF_SIZE (2048) buffer with no bound check, and
that hso_net_init() never sets max_mtu. Both statements check out in
the source, which is what this patch addresses. The syzbot memory leak
that started the series did not touch this path.

>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.

Theoretical: the overflow was not triggered at runtime and the patch
carries no runtime repro. The overflow is statically decidable from the
code (unbounded memcpy into a fixed 2048-byte allocation, plus the
missing max_mtu), so the fix stands on inspection alone. I chose the
max_mtu cap over a runtime length check because the default MTU already
fits the buffer with the same 14-byte allowance, so there is no reason
to allow a larger one.



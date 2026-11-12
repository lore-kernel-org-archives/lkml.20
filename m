Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794504728;
	b=JgqitDmOFlddeETg7jKKgRydU9JSKjcmoVk/6vvzvz7tNFNiVGAYB5TDxWAlghDsTDRu
	 zGNaau7pavRkcj+N4hl91i2ybEL5kMXI0Bzrji0ZQGaMgZzfPwxjmessBoaZOW9B9S6KB
	 g9tfQHNrHReTkyQeDoDu/+XGFNJzJCSm3JyxpG1qOZPVzUO8OHVoV9AcH43TKY6u3i/yV
	 oruuw+ZViLhbXYqJyKxAznDbywx/8SQpR8aXD1zCnfQ9cRhNqgto4m9sLGuktj2gBevXU
	 7ZiqaKwouNXPYiPk/BiLPpzkh0MpS5LUMk9sOWxMc9RMlev0FUI84FqOk5xy7ajfmoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794504728;
	h=DMARC-Filter:Date:X-Lima-ML-UUID:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=Db56q1Y0i9xxL5GXR+WUWzXZbEx3dlY3X6AjZ0FloLE=;
	b=gYa4bq2NlbM2opRNkhd8ak1nwKkYez3vxhqaP3Apr30h9r8gHuqSNnr8RjU+mxtvH0oA
	 9vtmvWekfueYk7sZRVGvx8vgCv7n6q4Vap8S+ircC8P+Fm2gIqg50q5gAl4c66hvA+BHS
	 enU0N89iR8uHZLkPmnxANSgdpEtNjY+j6HzxJXjXgVJL094j/N8nLwsIBRzpfHwm7zzlO
	 oG/3IqW93ChLrKDoESa/2jjBtgpN9oy8Cb/gZuAKMJy+anANIbYRWmIsKtnRJiuy70kYJ
	 IIRzNURSzYXfhheEmMU6S3+U4gKbm9FRAYWWDCsyD1DoIYWCvlEWmtVqLkuerLAS7rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=X169yS9B;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49756606A321;
	Thu, 12 Nov 2026 17:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49756606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=X169yS9B
Date: Thu, 12 Nov 2026 18:31:55 +0100
X-Lima-ML-UUID: fea3787b-a836-4165-8b0c-f9a62fb1942d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794504718;
	bh=Db56q1Y0i9xxL5GXR+WUWzXZbEx3dlY3X6AjZ0FloLE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X169yS9Bf8atbSYp5ITEWtTz6qamqpJM5uYWCsAvFLR3amNnvEBmBIdAN0g9ESaZ4
	 qkFuDgiyp4aZ72iV2VyiQY8q/844V0XCUkDtcZZzAjXHmO4eT0OfAEoRgDMvZyHCFB
	 nN9gHJDyt3sxZMhZaDFuo1xH3HUNXAMo9S+47bJywgQ6xNQn6mHvBYSxUdRYbkjDHD
	 i3wMyLCLT6M3WZwY+8P49D+c+8Nx0u98iDlb6yDBn2j++yfPz2ngLesZz/bzb5JbBi
	 xw+lPoV5ao64v5JDdAyjV7bR3bSe02iIK0pj01HeoorzkqyTaULdC1ZHHOANiLQy42
	 ModUar3co17KA==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Cc: arend.vanspriel@broadcom.com, asahi@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, brcm80211@lists.linux.dev,
 j@jannau.net, linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 marcan@marcan.st, michael.reeves077@gmail.com,
 sebastian.reichel@collabora.com
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: msgbuf: count tx status
 only for the current flowring
Message-ID: <20261112183155.63671208@kait2en-mbp15-1>
In-Reply-To: <20261112131859.339060-1-kudzo51@gmail.com>
References: <20261111195559.160650-1-kudzo51@gmail.com>
	<20261112131859.339060-1-kudzo51@gmail.com>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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

On Thu, 12 Nov 2026 14:18:59 +0100
"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com> wrote:

> Here too the host saw every status before the delete response, as in
> your BCM4377 trace, and the generation check did not trigger.

Thanks for measuring. So both chips complete everything before the
delete response in normal operation, which is what 4/4 relies on.

I'd rather not fold your patch into my series. The stale decrement is
older than 4/4, the old wait reset the counter on timeout as well, and
your patch applies without it. On the T2 Macs a new flowring only comes
after a new association, long after any late status, so I can't show
the case there. Your AP numbers can, so please send it on its own.

Andre


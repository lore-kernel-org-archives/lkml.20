Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908508;
	b=1JWzpqb1EOmmU4UXsEREEwHvzzWHD/2XpwmuIAZTnLgV484SkESDRbPv4pGbat3UWVau
	 B9ut55xqBYyXeg2Y95zHn/of3wUdlT+erp7kxw79zyHv5r6Kg43roAmLE6vYsNzuhCt4A
	 /cbCtZD9XHxPp5GqRj+LHGPy7b37ofGMZP+lSke0MG3Tx/bLMQjnVldO8ed5Wwh8VbdBj
	 q10gc0/rxyu3KBw3tIVragjsSRymsTC/nXvavHrXuF3uvT61+jxjrfVa/IVDYr6bKWJxc
	 RULxf1WrSKQ7c0cXbtzzbPsRqi6/bRsG6Rs/t3dqxH8N610LotFMuff2VnlGzYWJz3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908508;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=pJeVHAjhkfTCe6QZwEaPdZKS9kQq6VsosEAL3LTxMls=;
	b=TULVit3W3V1dqoUsORhPACpDPxSlhisd0EjAkbbDibYS+4wPJVrf1Cm7/akkaoO8fEoz
	 jXTl4288nY2kHP0CwEsy1mhbfBF/qBQB+3t8TPTHXrKspoOeqkoCQd5KHm+mIvrgBKEgG
	 FANny0XgWaqyYZ975RU4niYOL7pW0vLiIPzASm3+1b7A2ZEI125Qho/ilEVD2xwdnZNa3
	 s+VUhLo/kxhXHrBSzcs6cAhJqpsZjXDYrWjd4FQgqjK+pyvLZNgbcaJpzK7FCAmS8k/eY
	 RhUEMwoJYJsxQ47C8HLkyBVN+v57bppRq46zvskqj8mxsDU7JB4o57n/FKKoSMmbH8A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=rTIIn0rW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DBA606A32F;
	Tue, 17 Nov 2026 09:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00DBA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=rTIIn0rW
ARC-Seal: i=1; a=rsa-sha256; t=1794908469; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RtZEBrfT5l60f/memSEfPrHdi98xbty1hb8daIViqqCBebjFPL+uNy9uFPqXtiJX15u4wMwkKsu3sEtQ1jzxQ0d4Q8TyvhDL8Om3z1/qtriUOUgQtXVlPwbhqi6l7c479hYgxNj4Hb0UgtOx4HgPYC8LmbR6JSzCHVZQx4nf6Ys=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908469; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pJeVHAjhkfTCe6QZwEaPdZKS9kQq6VsosEAL3LTxMls=; 
	b=ScL40iPo60T0GdlrkBTPCO2+brMG8mdlXwA5LaWGBZJXXP0lc4n53NRgKcGG+Tsler6FTPYOMlYgIktiNPCaizxWs/pJ2ZqyAGlYP9cHZppz4ehMv7S9gRO6f7d+tJ6DdN9PcoekjNNxHlgdP5afymV4H2QqxwhMpM5E1NkfuUA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=rTIIn0rW9rt1R7Wm3JsViWxYc543a11CMg14u5TS3ofTBkxi9dF2sX2dxq3F2N0tt2fc6Cu4fSiwLdyakWItVB7h8CYHqKlJZbLBiZyqcju6DBO5Jh0ak3dE+k8AgB7QzGZtUHZuT6HxlNTd6I/ltvyg5uutTYIasjRY9HY/RhzA+PlCzKMoGakMaoz/dM8vRgI9lziPBxE+xVsZnrwI6w9eXynEdS/ogzLUacFMvYpCgkXw8HCTAo3EQdUkLYvqPTM6OjeKb2AkLETc9k42jE8pZkeXcbJcU0/J6GJHHu/uE+CNk4O8pM/f98Gteock6KEIVd77HogsbcmcbVp/AQ==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=pJeVHAjhkfTCe6QZwEaPdZKS9kQq6VsosEAL3LTxMls=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908466688768.6595462314916;
	Tue, 17 Nov 2026 01:41:06 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Zong-Zhe Yang <kevin_yang@realtek.com>,
	Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 10/10] wifi: rtw89: restore channel when leaving idle on non-chanctx devices
Date: Tue, 17 Nov 2026 14:40:58 +0500
Message-ID: <20261117094059.1744-2-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <4c7cb29ef6f442e6babe7dec989cbfbd@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-11-owner@ph4ntom-rev.uz> <ef6d8d689d88443e993d667e7a75d538@realtek.com> <20261116152804.781-12-owner@ph4ntom-rev.uz> <4c7cb29ef6f442e6babe7dec989cbfbd@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Tue, Nov 17, 2026 at 04:14:43 +0000, Zong-Zhe Yang wrote:
> Perhaps add a support_chanctx flag in rtwdev.
> (You can refer to the support_mlo flag.)
> Then:
>     no_chanctx = !rtwdev->support_chanctx;

Sounds good. I will add rtwdev->support_chanctx next to support_mlo in
rtw89_alloc_ieee80211_hw() and use !rtwdev->support_chanctx in
rtw89_ops_config() in v6.

Thanks,
Enver

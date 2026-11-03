Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793660746;
	b=LlCnMSqxOHuIrLz+mmgg5BSQBW/O1R+aucUek2RaghjZU2/IvfzFUmYNEIjxFJnG5l0c
	 ZdHClxHL/cFeKR/qn5OYPfBxcyxYlvMAfrgSpQMEzrvCixNXhLuHae0DGOpi83DjKRMk3
	 8QPFKEOnoBGfX+pu8a0Zro3rZK70mncpo4Jdsb6TRDQoQcJNBbAnfKqTTCbKQ07q/ICaP
	 nC839zIFCsbdaCU4YjOnshQsdhw+a9WOzLsSWGcNPHvnOy/xnrFFRTnlrCwwexK8Dn+n2
	 d1M1B2+84O8nsn5mgQ1abCfpF1GzqRJVO/85KZo4GxSUXIRbK5TZ9ZaWw1Iw2AlWrQg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793660746;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Hc0x0QRxuaqe8TvUFZCR5wxt2TwNiv26WvHElMW/+5g=;
	b=rY2MRSo4pof7KpJ7UufqhGHR2Rgz0TqoiRgdvJeTbQR1JIijmbLR1c+qZbg6NHqqqlD8
	 8vQ9pktZRf9fQJIMqD0vfcv7+vtesbMfisfFNvhWrAnb4K+9/3Ih6DPQnLXxV2Y62gVnS
	 I9ECtgFKg/E0eIhisaMVCqmTYi/5ezFBQjhMyXoOQ9f7lPojhVdvLfGz6fdXJQK/XmnpZ
	 9FJIY7Mapm9/tsBbWc+0hNox1ygJh3BD6XMhFO86XeeolH1AevNU+QCx4usJCnYKHUbn+
	 Ub6XMKD24SjBcpXxngRz8xt72mRv9TIoEXoGYbwzi0eIDd35pQYkPWiOduvGjZCEx4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=cbtfboIg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.15
Received: from sender-op-o15.zoho.eu (sender-op-o15.zoho.eu [136.143.169.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676F606A327;
	Mon,  2 Nov 2026 23:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5676F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=cbtfboIg
ARC-Seal: i=1; a=rsa-sha256; t=1793660714; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=izFyDDATMdgrU2HVh7JdT5XX1kw8rOmCSbHgppnh7I47k+hddu6SodTXdvbxzkrOcww7oDBnmnsmufSTEPhaUyPxTG/ulGXMU7Z9JfSo6ogRiVXid15nDwl4gVasmKK7IMW4hno5Y2SlTBWMRTJFxj8IC0vC6U5Q7tk5AUQ55DI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793660714; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hc0x0QRxuaqe8TvUFZCR5wxt2TwNiv26WvHElMW/+5g=; 
	b=c4e8w8jwri0MDoSdsQ4Q51tc5+DxyPrBhtxxgQXV9+mXpO1T/k5+k1JR9De8kKGkeulkDP0L7jdxzfkO89b+Vr2mAmviH7T4jKvBmWFu/k4N/cU53kBwofQh62DZvtCyKCb7CgIC/FQeqxpb/VJirD12WK4neZyaO3XFQzH/WVY=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=cbtfboIgWaKtR+K8zOSJqBrhX5Bm8M63HgKGZuulkeSi4LsxoYJcQwEYJqK0CaCDy0L7EykH6rsUUxV5gx0nu3dyuz1r1eePMWm9ud7jUT1bPN11uXxyFZtAWE951EgfyP/vALuKqSOcfEOV6+Ey8jYgoJWU2PyPn7cgyO1t+dw=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Hc0x0QRxuaqe8TvUFZCR5wxt2TwNiv26WvHElMW/+5g=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793660713451663.662783201423;
	Tue, 3 Nov 2026 00:05:13 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] media: rkisp1: Depend on PM
In-Reply-To: <20261102223316.GB3548113@killaraus.ideasonboard.com>
References: <20261102-rkisp1-depends-on-pm-v1-1-35a26cb2bbce@iav.lv>
 <20261102223316.GB3548113@killaraus.ideasonboard.com>
Message-ID: <20261103005500.rkisp1-pm-reply-1@iav.lv>
Date: Tue, 03 Nov 2026 02:55:00 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Mon, Nov 02, 2026, Laurent Pinchart wrote:
> > ARCH_ROCKCHIP and arm64 ARCH_MXC select PM,
>
> Why do we need this patch then ?

Only COMPILE_TEST builds reach PM=n, and there the driver still binds and
probe reads RKISP1_CIF_VI_ID with the clocks off. Nicolas asked to close
the PM=n case per driver [1]; rkcif already depends on PM. If you'd rather
leave COMPILE_TEST-only configs alone, I'll drop it.

[1] https://lore.kernel.org/r/8aafdbbf04a0d939c6b4d7d5577d97bb58d1c439.camel@collabora.com

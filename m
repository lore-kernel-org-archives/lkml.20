Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794843215;
	b=HtOAHDp8yrqJyciwbOaTsUiNRX5dO9j9Y6fvZDo/D71yPYFVA3+j7y/gW/cpB3A8FJzL
	 /vcO5I5XETBme3QFyITncyEF54TVMnbu8HZ27D/SZc7OaycUQ7ZrXOEWYxXEgRFt1/KuG
	 Xn1NvMhcoIr92YfrbpnyeDG/t10qSl0pm0nSh2esCc0zdYmwETA0AktBAV6pAHYGHhUT9
	 KeyhYIC8pgWOx5Uj6UWSBeU8hrpbbpHxiaYGt30gvzSq9B+XIdXc5VXmDXwmfNHsBMOQ0
	 RPRud+hyYr3WhBOvmlH547R04NR/CSE4Ue6Y+8fBZzCcs6Aim44siIZP6AovH1p0GcQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843215;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=o88PP2scyPFuSwSd+OQDxBgAlZGW0viNjOp0KAz222U=;
	b=gtt+v79QpysdyCzfFBTvYwLDVhzknHW1RL4bx+heHV4ay1/eWqEpQM0DC+hCpDQ7QE7x
	 r5LeB63+BNc6bQiIaTOie1VMCZZ1LZe7cUr45xhn/FUkIbuL28fMGbio8ybNYhhorlM3N
	 5GJJjrtfRr4m82P2O15qB5QTTXxEJYsyjWWodZ+CFqA9SYrvyz9KBdyGfsRU/0zNcNeh8
	 WPm52nwF+Oy4vT1b/yjhpMr8pAPoUKbtqnJ23ATEiZ71v1hb4mI9T/o/udLmpC1aBJdZg
	 GXerWGgXvkbxkHj9Q2EjilwzwU/XDpkbEHCRoqADFBb5w9p61UOfooqpN++onNecvmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=tO1SwoSW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.54
Received: from sender6-of-o54.zoho.com (sender6-of-o54.zoho.com [165.173.180.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61705606A31C;
	Mon, 16 Nov 2026 15:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61705606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=tO1SwoSW
ARC-Seal: i=1; a=rsa-sha256; t=1794842912; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nTfTgIIKfFSi/0dvYDkKZgWHKXMlSTHbA/vtB1P86UfSb1HHyXHhFeFl7Ipm/K2SRG0r7JkS9tKmrlTrzQ87HSOyvsxldDmUXpzZE68lOSeYauIZvVAvhZ/DxWR+4AXmEA2Vrnd9TxJj4xBnVY0vVCO7lIRkj0ZlHqjZFbEV/6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794842912; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o88PP2scyPFuSwSd+OQDxBgAlZGW0viNjOp0KAz222U=; 
	b=Fy3BNYLZgt8obbx6+rIl3/NeIX1NvuEgT/F5S0SwSJy9Gp1USAkgGpSIxpyRBtGHUhLF8B0M+NdYOb5+T/DcJ/GKjBnhDCcBOBvDltUIeJj3ebzTFLZOhm0uDfCYLzYBO8uNh9vVSYY4MuBNPv2sWAwbBVWVuifAYZUU4H4cDBQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=tO1SwoSWlgzJ2XIhuupfHwc+2SSgZyocIGT+/M6UdHr/mqanStrmyKNOK5uX65x9q6yzkJCTFZslpfYRTUkrIaJKRE+GVm4JhW3yWlPFSxImdvfLGSKJr9AopPQ07r8rce645ToD/X0O76E+ujzbc2X+T6YPdl3jAHzBYtqBZmalqW1QgsiUA0M8joVB8UiugjXsusQPtwKIDvQU7Uqckn9FnuczZ8+xtQsCP/0FYEN+WfhDDJP924Q77GmiP7lZVIBa8BoGqnFcJyKyGtS/KrN4L4M8gHNf/0DGqb6l0lAREye/REqcZ6aoDlIvYcbttWEUK+5wj+ZotqQT9QfNOA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=o88PP2scyPFuSwSd+OQDxBgAlZGW0viNjOp0KAz222U=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794842909729685.6735990743005;
	Mon, 16 Nov 2026 07:28:29 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 08/10] wifi: rtw89: skip host-side TX hooks for injected frames
Date: Mon, 16 Nov 2026 20:28:00 +0500
Message-ID: <20261116152804.781-10-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <6d14ce5428da43378c19fa56c1755c6e@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-9-owner@ph4ntom-rev.uz> <6d14ce5428da43378c19fa56c1755c6e@realtek.com>
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

On Mon, Nov 16, 2026 at 02:20:40AM +0000, Ping-Ke Shih wrote:
> If these are harmless to inject in single one monitor interface.
> I prefer not applying these changes.

Verified on RTL8852AE: in single monitor mode rtwsta_link is NULL and
AMPDU is unset, so these hooks are harmless. I will drop patch 08/10 in
v6.

Thanks,
Enver

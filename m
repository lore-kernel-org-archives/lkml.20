Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607209;
	b=0IQn6RA5gIWxC7nqyrNAOBfsYKbfAfWgmhtrOVefBBBvJ8KAIdqC1r07YQi35wdcJCE8
	 0nf7i0ZvHTs07++unsLSCNgfQfN/AIVLP7o7leRPmgLsb0+tpb9EYASSf9NgWVhwojDzb
	 vq2+i/drLlienrhgp1o5oFPZNuALH10Zh+qtPzsa+MNiXwpTl9WRlcoEToCfUAQ+NQnAB
	 YLwQ1SoLvB/H7GBwPX8u3C7GWvvx+THPEcIUiz+uYhoY56+XonHVjKNAdNz2iwUdG2i5Q
	 OztZg7kVgmtVt3OmggbfyiNGkgOdEX2urIFrVtYo83YdniMjI3M0ypjPjClJNuXtJuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607209;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UtUF+a5890kzpEQ4ckVOJsmJXLi57HjJheQjY4toPlw=;
	b=K1o9pKy/XgpNKU7TOgwH+0cZTIDEzovb8W2tt9w7nEJI3/oUS6zMUTXpAu38F4GWi+3E
	 vY8txVarDY+TmVUXrvQqsmv3vMekYQHo4EbRC48ktOaHuuNyKv/ZU3ZZR41JAch6kwUlP
	 ODjZzEjHk00QJet9A6+5XUNGhPL4MGITa4FR7je9Opvqaf134LegkT2csWdr7sSIjHkEW
	 RtIFzmlQtuU9yY7OOzznZjTRdNyLdk8xKHlBLk0hiQTiKgvyAslISy3VMhHWlsZclEUgX
	 H77LXTu07ULa+5OXhWcwJCq+1uQHk+o38COZcgavvgkLtArHVTBkFaJmxUVHbvLZDZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJo8CTs+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86729606A327;
	Mon,  2 Nov 2026 08:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fJo8CTs+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C841F1F00919;
	Mon,  2 Nov 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793607209;
	bh=UtUF+a5890kzpEQ4ckVOJsmJXLi57HjJheQjY4toPlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fJo8CTs+Q/yJL2Sy2cjqNeiQPa9MV+4yRVqKfZaIoMWxUXpReOcFAqwSWhoEuf0xa
	 1km+v8Re4Nz0Q3KSONI/6X99wumP5L1TU6kv/jW2UZv40t8xfTOx0oL4J0dApUgwO4
	 Vf77LbMi/lFYWE+vCkWB2m4tWJ/GR5cmKoaNibMMLLc6fsGRY0dLvZTV0CV7PsVE04
	 ZtH/x6EpVY93hopJ5Ng3E+xW6WbtilaSHz4WCkITwc+nxbXmdH4j0ADb/v2CKv3O3a
	 rg1gpoL7PffUeYdhH9Yi1xIQsGxHSD8mDcy5EbVL8DhsLZTdHEvZVKpoQs47yC8TWB
	 zY3KYO/aLNMew==
Date: Mon, 2 Nov 2026 09:13:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: snps,dwc3: describe two
 connectors sharing one HS bus
Message-ID: <20261102-screeching-utopian-avocet-492500@quoll>
References: <20261026123211.243224-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261026123211.243224-2-xiaqinghuan@mail.ustc.edu.cn>
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
Content-Disposition: inline
In-Reply-To: <20261026123211.243224-2-xiaqinghuan@mail.ustc.edu.cn>

On Mon, Oct 26, 2026 at 08:32:09PM +0800, Qianhui Xu wrote:
> Two connectors can share the High Speed D+/D- pair of a single DWC3
> controller, with a GPIO selecting which one is connected.  Super Speed
> lanes stay per connector.

Unanswered Sashiko comments plus some confusion with duplicated posting
of v5 without the rest, dropping.

Best regards,
Krzysztof


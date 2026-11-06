Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988510;
	b=2rrf7f4QlnJxGNMRIvVtMPXBZF/kYCfFc1Vs75G4m3C/EBecQrbFCAVhlJVYKvrizxna
	 82m+O88ZnbLwTP3JHOvXsLdzprw9pw3sZQDNQjEXKr6h/c8naHbZgsqpcOl0FKX8Ps7y3
	 PFAIpoCa9GOuKYgJSDmjeNfhO0hwgHixNYUG1oNW/yQptXGGNPzP8X7+XkfQ2nu3Bm8oU
	 6UrWhQAHQgh4lb2xezVkfxw554Iu8/nZqx5/tvu99aAhozv6aFK7HPiE60EruTz0IkqKi
	 YsroXnYyKKoplmX9H1Bi3XK4fXVi4/kW8+r8KJ01jX4+RmZBen9iAcB4qAAh8yPzwnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
	b=xLKNOb36m3F6qp/I5XZ7S08bX6u3/eXW4Aq6KEgr5p65IktJyO4lFjNvJxTnT02MzqVv
	 gw7/rWO8xGoc8GTVO38z/jMz3KRroOGTcK4VOTUM8/sOfrGapVTNexvRoEIVvV5yxIOYG
	 PimDFrftXZwhuWW+4G+Tqo61OaJiWR6YsMbZ9OD3pKfYB4P92PLelZFtQc91LLZkvqqIs
	 z/7+0ZfFkH1yVzhflTxHxIK0wxEL9+0fKgPIYpv1lnLkxWPQW3ck/QP2sCFr1uR+D3ObD
	 3OhUgUr8Qa6Fj50yh3l9qL/tnll4p0RJt0dvntpN0ZNwHkF10y/STZQyC31Zl5QzUSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl9kRzom;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA31606D80B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:08:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CA31606D80B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Rl9kRzom
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a3c08d6928so1679415c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988510; x=1794593310; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=Rl9kRzomM0oOp7wdeUPW3WC/r3jSD7fJijNyagohm+2yzcSET8sgMWU/dj2Ag3f6hP
         KP6il2thuDeIjuhEs2wc7Y3FblUJTxFjFihbjbVB1WYfkbBs1acdnMgRBWvQZWlEp6mx
         YR/3oZ0EpGaML4VkCYH7EAgy6OEgLX0sDq6S58wBs8uCEVbkEft36UaTLTxDlJ6J3Gab
         TsBmrqoY1HDT0miyy4um640FxLyIDCitna7S9zjGJqkevEittypG5FOPmBwZIR2kWJvn
         Lw0lRxpM49RPewr2m9yZycwXZfJX/OyfhIJg84yXOsFeNmo4WfUUzFoVsTd5FLvYPF16
         aMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988510; x=1794593310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=RMnDEPcynX/1ynCOnFEm8nXifr6CUPP0p6ZVnW+Ej1XUSyazRKaZVR+G0Byuhv9n5U
         ewpaMAKrTNfk02/z4g8+WNt3XSI169BURT5jp4GZYy9T8cVNglAGtl0kdNzTSBiwB26R
         PyE9VPsLAdAVGO5QFFXNvEdpiRfuaPaF+DCHd1hrjZAwC9VnzIj+6vqs6aAbpI4n3eRh
         9m7IrtmWV+mcREpwblR/nQyLwo+pUinXFtbLlt4XN3iNsgasSYgPSCUDjI1tsFFDA256
         DCjLIR2jbxVnHLm1o3ea0H3B2H5a9ZJ1JPJxg6gyP8D0FHJ5NYwnr/L/OO39ef0rqZsr
         akFA==
X-Forwarded-Encrypted: i=1; AKwUvBxTBl3OEQ0ILKNQ60wGDyKe9VwDkrNlfjvWnVH1XfdGIizJ4QYysagv0bK4mc6RlPIMVAJ0WYJrmTeTEDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LNWeWItSE1gE057g8qG1dVp07kEnEyrWQswsBolk/Yi/V8GZ7
	POFxMv/qkGuD//mYGFVMY1YiAgdIJLADNg0ijs9BQnElSJs0SjiltO85
X-Gm-Gg: AYBFou31OtmBTQoNxZYJ/KqKXSZG4HdLL1Fh3hzhyMuS6kPaPxLO1Uia8SLb5AQovIk
	a8dcVcY2Z/i9FM7kGX32v7k7Ps35y07lcizf+DssRHS6GzvZnxn3YqGu/UlG37DUHO9I4RK9575
	iLxu5xxkW3FiKGlvf+iZsSt2JlRZV6228yje4HvN5a4wkhBVszuRqTrYok0iVrUDYj15xNxdFCf
	22ARRisbh0nPc7THk+ob2guA4x6gTd0b0cz8/K8nks/hqGwq2vZmk1dpvt4eVlSBpg8z/qBRgRJ
	MwqdGDBCdOwVgBdLe9XQF20pd7tXRnz6HCWMokmKMeX7JcktAoYK89aiDyn8mSZh127/dIWol4s
	+wssJSIJg7pgiwN72Rwa8kYdv3w/SEA/EAife3lhzKqJw1xmbccTgSp51GoJV6LExdxjtK4t5sh
	NGGspH1KPnOElQrkS+jkza5VRptICqkMtiDvrrP3FbkI3O5RLkVs7zreiyRKyF7MTVEiBTDiEFr
	TLz2zY1DxDmj5OLqG2X9gc121IhBok9qMDNFUlr3h94McBIu+nX7HwNOXDkLc/biPEOVME3qSe6
	K8FRuHzAgzPbaEsg7RI0G1XVyP1armQTePptSXJ799CQf0KvUPWB/WLKpkDesNY93yW9
X-Received: by 2002:a05:7022:5f07:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b25d31e658mr3453567c88.10.1793988509569;
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fd2d6sm7443467c88.23.2026.11.06.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Date: Fri, 6 Nov 2026 10:08:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6595
Message-ID: <au4Xis7Ei2th7xFZ@google.com>
References: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>

On Thu, Nov 05, 2026 at 01:29:12PM +0200, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6595 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry

Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280EB3D79E9
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361496; cv=none; b=R8WNMMotZLfOfq0bLmNHVstMKECfZWh/iGd6qJgjNL0Z+I0QRo7u+t5afo4BCN/Pb08LHpAJEGGku55Hp7sH3sKvMslR/xP8403DkYMsyXV8peHs7ZmtNziaRERNpFMrQJDsCfLaST8E8XKM2rNBsSlBiikOEKoCPi7P993K6z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361496; c=relaxed/simple;
	bh=x/lNwsxaPxOTH9jg0MYys/GoaE9b3F4jTY+qjkpF31g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riM8K4rA1t9MsOiZX7CTwbDEub6OTSirO7UBNFKU3hSFRvGtm5wtfNjUhMt8AtzjDmIdrtMBl/uiTrLR+IS957cCsRqkQbIv+SiaKQ7to4Nw1v55V19ItYjgx//AW2AOmWI6UesRQkxJXHZcvlAgWTLbP9+P+kRL1vXsRzpuWyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKxFTeDQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKxFTeDQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so7398365e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361493; x=1790966293; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvehCLlx7d2UpmxXb9owDPjyANv0KE5Y1MbBvVO1Mzo=;
        b=hKxFTeDQbiDXSA4R0BMBcbQ1/6SM8JocG0U7/LwOWMJM+kkHTQriNmi8m9YNA9rE54
         qq2nSmzmrVHijNIeQ8rxsi2k+zybaro9AtnJ3nYeP0Udg3fFHjNyfkadw+55WOlVlBEo
         nF0iwaj7XbO3jo9jOEnQgLHu4m6FezpLLhbk7EOC4dm0LZjJtZDNCJB83tpNSFwDWQSE
         JqvGBHoPUE4zkb6UfbcvGtFXEXnTcAsHl9gf+D7BQYVm87b1ObkZRQAbTUdI8VvDhSeP
         1n0zxQOXky4H1h7FBT/xRUbIQR28yjnNKpndcx7UR9yBWUlCeju3lwTdZoYmuCAmnxhm
         wAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361493; x=1790966293;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SvehCLlx7d2UpmxXb9owDPjyANv0KE5Y1MbBvVO1Mzo=;
        b=EUv7BIe3gXS3oMresM3ze64k6qY+gUWik2mgXlFZkYdQ7y7Z+/zq5usdcrxs90RkhW
         uETgiE9l7uIWUsed70CoYLjYowl3b26LS/j7REVv6r1SVnkxML74HB7xTowMskxaLRLi
         CAIznBkQ7HMC7FncynokxFdKNxFBu4Xbza4fo6cuKr0DFgvVWnr/qq3YJ1NYvwjOttGm
         4RS5kYmd9y8W/oVeywSlqEAexevXFUdwK+r7DBE8qT8z3HV8vctLys6EME1ZlcaNUQFY
         blGgnD6Lf+vj/FAueETObhn90DEHtPrgLeiWJ4EseacdrkD27M6WwaHxH2SZZKddY6j7
         KOnw==
X-Forwarded-Encrypted: i=1; AKwUvBzxmOLgUxpuQXOKQr5oWh39X9qyfws6mkNE6vYQcOzAudQYDlhxCH/CdcWPFlhd6hWznJvbprJJoZY3U+M=@vger.kernel.org
X-Gm-Message-State: AFuF++ntRTpcdqBuxUzb10GTreBjau3SXDB3pUMq3Rho/A40bxRVNQ8I
	4nd7FCQ3PJBfLwZlI3bRgEeMRPAJ6IAxwAJZEbQgvepWLnlEaPAxsYKATd2h7nzZl9WTxg==
X-Gm-Gg: AYBFou20eujb5/PoYnjXiU1x80Nzpjd4igOALpXtfeJdjCqabUOq5FxetLj8D9plNT8
	b3YTtNCfnrx1whKeCqYl/lNldoiVts27HaxM5NB2jCNMgJC09wpU/lki7wfCYTaKD8gq8cYW//z
	ceXDp9Cb/MjQbxHLIITKm+BiB6JsZ6ECOqIv7BtH1VoMekG8gicoB9VErxivXmYvTkrpwE78LFw
	pCjZ5tKilq0Q/PpAOHPSDnh4VJJE6hdj8wg8u7MP70OGzz8AL76wZSXHyWtGdlSNDN9aZjMXuux
	QL0ntzYMxZ2euGk8x8G9Xwju8dlB9m4ftj57d2k3/qe2kVBVGXg8R9QcnsLUvV0P+gZJsJ6K0yy
	xlssIHS5iWp7Htdv0bFAha6aYIv4kzttmiSpBAoHO0T5SMaN4KEXGK7/MDCPRgeqYEbAhtOhkld
	ulhjoz0xudDg+I8yBwTjGgQtNaFnE2WSAvPDvvv8DusoYoNDGaaup26Pju/0CM2CaIeB/BFt2ga
	NgdVBtcb/Y3UlyCyTipldcys2n86c1ziEtZyFeY7iEp2wKasAzrhbn3pjUF+Q12ZGgrzC7cAv72
	im8=
X-Received: by 2002:a05:600c:a013:b0:49d:2555:1a6d with SMTP id 5b1f17b1804b1-49fe66f1ac3mr106645855e9.16.1790361493075;
        Fri, 25 Sep 2026 11:38:13 -0700 (PDT)
Received: from ?IPV6:2a02:2149:8bb5:f00:1efa:94a0:1c23:6934? ([2a02:2149:8bb5:f00:1efa:94a0:1c23:6934])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff43ad975sm80484665e9.13.2026.09.25.11.38.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 11:38:12 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <dbcc5429-d8a1-4752-8c63-08c08ad4aa59@gmail.com>
Date: Fri, 25 Sep 2026 19:38:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kconfig: error on reverse range
To: Nicolas Schier <n.schier@fritz.com>
Cc: nathan@kernel.org, nsc@kernel.org, grahamr@qti.qualcomm.com,
 rdunlap@infradead.org, nico@fluxnic.net, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922163749.2031594-1-julianbraha@gmail.com>
 <20260922163749.2031594-3-julianbraha@gmail.com>
 <179024742687.3875862.11053097465052610200.b4-review@b4>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <179024742687.3875862.11053097465052610200.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/24/26 11:57, Nicolas Schier wrote:
> Thanks, looks good to me.  I don't like that we do these strto{u,}ll()
> conversions everywhere repeated.  But I think it's ok for now.

Very much agreed, I'm thinking about how best to refactor this.

- Julian Braha

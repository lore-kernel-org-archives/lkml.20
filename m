Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794891664;
	b=2m+smR7zMBDZ6TVckPHL1nJR7B8f9bap9P2sr3CIathyeq4RDfOwQIGzcaOcuV/MjE0o
	 IyxEO/1zOF0/RH5WcQFsfLV1H+9FSfK0+LDKmFt18BNHUzI85Vhhy/qzBe/IkoRljZmCz
	 fgVh9RsrNMg8EmbBz04sxcRFCYlcS2mg3qcSKqNS4+K/6V+PdSYlTpmIFzBU7DcDD4kff
	 pwY2+YZUwFfIKU7zmsQuJgpAA40KE7GT40KRIq4ISntOV6Oww5K0l2Wb0TNP2VQ43c0aY
	 7s4SOF+wSwzmSXirr9Ra5GqpG0OCb5qD2oAKhq4IQkKOm3OBjGVug7bpSmt/Wnsrw5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794891664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l38YUj1Dx2pOL17ooAx7fDQRqnz7W9ZjgCY8kMC60Ns=;
	b=Td7JUtec+CYfzqobM4Sx+8wUw29vFVGBo4HQwCPXPfZUJ7jqxxgRGaTxln8wMjaWxIVL
	 rFSkzWjkxWnifYvtLDzEgwRpRllZDu/r9gcTx4aLaa6JVmh05QRDL4+CRBwJvNRHxFyfJ
	 7Pba0WVJZrCFVrTtmYkS4/869TWeOMRuqem63QzGT+7sgW42CGS67XKdxhgnP2vfRLKnR
	 B3WwBB+P2Rl0wE1/C7opwJJWphIeY+ZIz/KZWDgsrm/ACQfc3Z//wVWTcrF0yagTdEZDp
	 yv5HUJDRpMQ+ME4fbz2eS76SzIZFGpMiIycMMDJC0I+S6NEfNa9UBUYTiUQ9gEMNYew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMBCuBSi;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85BE606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:01:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E85BE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FMBCuBSi
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b3af93b85cso262959a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794891663; x=1795496463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l38YUj1Dx2pOL17ooAx7fDQRqnz7W9ZjgCY8kMC60Ns=;
        b=FMBCuBSi0o0iZVslnqf3UELcTJrbpF/yE/5GBAQFI4DZNYb+tKCJuP9Zm/yHgJKM2f
         nbx3+kS5uLsZNC6i2Ad2wpnKWrhRI5E3qIXCadS023dfOElycHXVpdy03GFLCRVTpV1Y
         7bL9hgEdWop6arRUR47GViYq+326skZZK7GncmLpoIuk4RFE6N4rX7xQMlbnJq/zHjH5
         qNUxmrkk0Offg4LQn0YAXBhpv2PEKt+W6k19mKSiJfoGv0xEkHEOp4EpBYz0hVH19pmv
         ecD/JOPLKR7mo0RfLsldF3NqzAnliYbDKInZw3/ETcKvsu7DBpSFgoSA1brXZloBfQU4
         Kltg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794891663; x=1795496463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l38YUj1Dx2pOL17ooAx7fDQRqnz7W9ZjgCY8kMC60Ns=;
        b=jeK4lybrKw8Lmwu9Ey6RcsnkWwoLYDIiVzXMiUsAV2xF5s6HLTfNyRurxwD+QC40XG
         6Eo84uEqD1s+W3Rpl5Z49iUXlBgJzukW4jT51S6VHWo7ygs7ApnWT8y8R7bSDX2pRn24
         ZKD8OGDHwxvovqAFU4AdEvdOWzuRMRl9dyFZCFfVBIJLP5vbcaPQa8LOH6kxqibgtyGE
         RE32gLkUZWMUQgeQbaDlIWAflCUAWvxNUYpP7yqRYTJ/2EU/DQXBP5CJ4NdBY9r6aWWG
         nc7/8zfKoHO57uweL24f31OSTwFr5+FVgZcg5/41M304f4Ss80QStTWWC/PPFRinSfmR
         NA4w==
X-Forwarded-Encrypted: i=1; AL+hErFtnLSagCR2IjSrUrCZ7BxP7NcGtxwNzG4YpBDA+CHFDCjTNXpcXScIBerO4ssJoRJHfMvYtGFPvUUK62s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LODPn1yu4G/biIF2QEnycNpy4xxmNAwZB2qSjnofuqmYRGaZh
	LTLlq7VnAnx+2WscttyxvGnrTrjWy0G0P8mrkJ2zSUCG07mY70FwZs8h
X-Gm-Gg: AZFdTZdw7EXzXf5nwYjzogRLT4oKkkrfHZ194p4VDZdIUdeAKj9TX8oswH07NwBJT0D
	6DCdnqOB81lC+yvHmR+0ZSQq3kISBO/GmS3EKpCEKH+FlczeiKYs99XGngU+NwCkRPG4u0s85WP
	BE9dVWoH+FqIEG7mYm1Y7OHZOldeygR+5YLnoRpDKXYrn4xIXhTKkksndTVSy5sK1NmgcBG7kfJ
	AARX0SBJqK0MMthcpn3Cyh9voExQLlEyOYTpBjbaafFnUXOOnMYCpAXwQcGqoVy+WWZRSmSkLse
	2MmcrBXz3rRB09FRp+g4wcb8XikrwrXwYe/R6sfGYcoK1MPZz4ysOAQqR2mrXJE0rher99AM/AV
	RaN8DSkbZVP08b/lXt+hmkZvXB3gzmc9RRZ7WX585TfZm9OdwLD7qD78oOz+mRhGLoyMYrV8HYz
	EbN2fXZAC3l0je2k3dm1z201KwVR+G7QmSkJemvULTeCDEanUSGnO93+CTMq21k6ETM8pjd6QoW
	rXvhVLI8wRiA/7Gl2IDqapNGI2KKqozGjTNmxIBtAP7Y2KCtrPpNB7PqYgVSMAkoWnqk3sGaFDl
	A1+0O1J6MTCzQfxXZl9nb+nLTgc3hNSKWF9jAMIyqXp/OsvlHaj++NrXTo2yszmO8NU71/yquu8
	V6xLsyymqlrnP7f/JJiidAjf6sU8IxDhuUTXTjFYEXTC2rk7H2lLafBqB+GrO46QJpIPRvM0Wsw
	G60I2TRRBDRciYoaVsx+o/ixlEXl9LCWoz3HB8RkE2FDgAz2galOrTcBOcWor/xyI8Ln61/XH+c
	6W6anNzJokVwWGrFZpIidlK5hx1kTGBH7pPKnCmYOZ9dO1GVRPJaRoozcsdo4p9ItzGM32iGsZq
	9WbVgB/74w==
X-Received: by 2002:a17:90b:1dc8:b0:3a7:82ef:bcdd with SMTP id 98e67ed59e1d1-3b1b0b5be93mr12038413a91.41.1794891663081;
        Mon, 16 Nov 2026 21:01:03 -0800 (PST)
Received: from localhost.localdomain (123-243-92-89.static.tpgi.com.au. [123.243.92.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3abec8092sm2046720a91.17.2026.11.16.21.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:01:02 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: David Carlier <devnexen@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] tracing: Reject .function on the function trace event
Date: Tue, 17 Nov 2026 15:30:42 +1030
Message-Id: <20261117050042.58677-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <20261114195914.2678414-1-devnexen@gmail.com>
References: 
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

On Sat, 14 Nov 2026 19:59:14 +0000
David Carlier <devnexen@gmail.com> wrote:

> Fixes: e6745a4da964 ("tracing: Add a way to filter function addresses to function names")

regex was an embedded struct in filter_pred until cfb58e278c6a
("tracing/filters: Dynamically allocate filter_pred.regex"). Before that the
pattern came out of the zeroed predicate empty and
__ftrace_function_set_filter() returned -EINVAL, so cfb58e278c6a looks like
the tag you want.

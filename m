Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33694AE102
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790004899; cv=none; b=uDPhl3fDvvuBE9d541ajlvXkLHNdsHV3M8h5g60WdImwT79GDVjsr1O0DRxo6XhV8TUK5S1vHgqymOvNVSuT+OyvtXcBNICyjVQegAK5+4fz51gbgIuUlEiouKyL9c6bUEeKBJERNo9cAMKOP/QivqN1fLi/dAHxTJgkKXAa2sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790004899; c=relaxed/simple;
	bh=gQ9HLzwkRf6QOXsIWrvc5d/32H7BThXeoPixPzN15yU=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Dq01zF2UaiGROK0F4vjkxIQDNfxdmbCU9vPAD+vpe6Wpmxg9lssEUdqJUYCmQskCvEpEQGVvnZg9lLoa8PgY7UY9LxmAqH2MPN+pcYbPgkLWCm91LCqfxUD8R+pfJx1MItHefyEy+aCsaddU+mcu0ggcEDpNkSST5inDRATeIcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CatOnh54; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0a/Rq4D; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CatOnh54";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0a/Rq4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790004896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yeWM3XnXvJtdimC0VqruCK0K1hFumXylSD+TDkMJQUQ=;
	b=CatOnh54QSNd+vnAOe/xNUodZ+Lmg+BXwVWTBs7D3sWZ4dPCOfqBgffR8itHTpYU2wFDj0
	9c8mdhNPEEGPdck+f/kvQUXqteKxxJ90bgucyUiyoyj9RTqo0OcMdH0h/LjnUJTVzap5HG
	L6pL6+Slejpfs0+ywnWLA95imf680Ho=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-3ddV-hO6NryG1f56aaFHaQ-1; Mon, 21 Sep 2026 11:34:53 -0400
X-MC-Unique: 3ddV-hO6NryG1f56aaFHaQ-1
X-Mimecast-MFC-AGG-ID: 3ddV-hO6NryG1f56aaFHaQ_1790004892
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e7de22fddso78368356d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790004892; x=1790609692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yeWM3XnXvJtdimC0VqruCK0K1hFumXylSD+TDkMJQUQ=;
        b=X0a/Rq4DAY3LYdH00U6chD/8M6cEZXWoWG4pP41T4xA5M5CWNK6VzKj43EDP0v4YWi
         bql8hEgAgxpEhlCagzGQDXZcckyRtseCRRgwcHjWPsRIKfwxJvVRDgxA6gjWr9LNTUlm
         AsQS93PzT52WU/kf0eUASIrS6ZbLxcW9shajE+HGr0zU+u5EHR5DmnY6AH/ErRbZjxRy
         7NbsrRUhebJlvhYY74axiEawgziQFhmhRdCojCnN+vGLhXFQxOlj/AkS8rZJNf9g756+
         NWdxGcZ0nNrkSzBVDIINI4OXh0YuMrCLLBnd7tW7qQ/gK4bLz3tbtgDS9H7HuBRm5Gja
         MC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004892; x=1790609692;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yeWM3XnXvJtdimC0VqruCK0K1hFumXylSD+TDkMJQUQ=;
        b=tf5qW/JEwdqq3gSVFQKO9KASnfBVyRIlxK2d9Z73g4VhFLKhIK6/Jpi6IddjZcCU/v
         tbFJGqWXHJWQuAV5VIcj0DecQ5f1ZJb4LtJazB7UC4ukV1X0vfd02MqvbzpBCL7aDQBr
         H1aExFyPM8uNTLI727Fuj1d6dRPUWpEog4raPtxTt1aWXSOa2E9RB5QiRl1X6ryk8yXW
         HK7/zgq8Wh9c0/Sdg3lQaDRHoMUmm9etzHAM27Q/mG5aGwatStlR7K1qtmQG5r3SSwCY
         XzYM1eAiUaA4tZwseFm2n8h02qVuldX6v9eLnt5b0jvO7/wNwCeuoqiaRYV9Ygl3xpY7
         5abQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIUR0+guD97iddmIlmwFeLMNTnac2yq6/fbQwKAHf0yw69w3uiMHw98uSEKQtxAjJw69ZhUdnVtaCHYLA=@vger.kernel.org
X-Gm-Message-State: AFuF++mMFYTDh/uW6L7JldkIWIQay7zWQ8F8Yvb8QyYMKD2nDtZmVkKn
	L6g0cQzdiZht+Oo6A70A99KtcTJA7vv/Qkvw7nFML4jiCiwGT4ms9Rb1tQXqgoka7xTHWnpKU98
	ChqZ/y9ZXf1jggDOQJDYM0IVDpXjKNh7tMPnf5KdNrNYWSxcOpZ4uH1UGyoDMcc156ggnHQMm+M
	4yEq65YTR61wXWXPGdQc79eMag/C/oZfbOuR+b2tvsg0SJbDyD
X-Gm-Gg: AYBFou2yh9UdNEId49g80UksmH2yowkppmkSXzgeB1eV2HMD9DsnPF7s/hqyKSfuWdO
	msSz2WdtNoJHTuGp0/XS4bFocKAt7zLZLpbTfmGuXLC3qgWwIXQmTx1wJQmNNKmQ/A5hiN/zmKk
	OonRujQ0xj3XI0cK1sA+9X77+7l1Io9i91QKS2b5Ad4j32Ay5CyYUa0g0xQ4roBeTH05SDO19b2
	BmY4EFvhAXWohGVvLksgqra8GntxEXfO3TYsPyMhOFVxcolmD4T2rx01Zvob8WEfe5YRBz1rCD9
	YHLm4z7QiE9ZreOTB1/qZySj5Upgoe9vwxg9TuusmzuruQXM8cGcfdBebRhNuIRaJ8w+JJVbzaA
	cY71m9RDgScfi3YTeQwfq2couN8vzL56vJLWCts8=
X-Received: by 2002:a05:6214:19c7:b0:910:44e5:8a46 with SMTP id 6a1803df08f44-913fc94f703mr12187286d6.37.1790004892535;
        Mon, 21 Sep 2026 08:34:52 -0700 (PDT)
X-Received: by 2002:a05:6214:19c7:b0:910:44e5:8a46 with SMTP id 6a1803df08f44-913fc94f703mr12186736d6.37.1790004891712;
        Mon, 21 Sep 2026 08:34:51 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a3204csm72842046d6.16.2026.09.21.08.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:34:50 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Christian Marangi <ansuelsmth@gmail.com>
In-Reply-To: <20260915125226.20579-1-ansuelsmth@gmail.com>
References: <20260915125226.20579-1-ansuelsmth@gmail.com>
Subject: Re: [PATCH v2 0/2] clk: en7523: Add support for selecting SCU
 serdes
Message-Id: <179000484817.707534.5059164498545591038.b4-ty@b4>
Date: Mon, 21 Sep 2026 11:34:08 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=714; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=Kj6cZ+k4kLRXD9ezE+CrbD5I4uWbOp8bViEeVEq7+Jo=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLI2+k3OOiwT7XlxtlWu55nX8cwF95IOLIlbenKeR+VOl
 XoTjdNXOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhIpRMjQ/udJd1Bm590/bXg
 bFzNf9u7PqyoPvp/DsvKqGTDj2G8Pxl+MZ/13fhC6FiE0kwJSYMJHXM55a9ZPz5gwfFJQ2Cq2rq
 9fAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 15 Sep 2026 14:52:22 +0200, Christian Marangi wrote:
> clk: en7523: Add support for selecting SCU serdes
> 
> This small series is a split from the Airoha AN7581 USB PHY series [1].
> 
> [1] https://lore.kernel.org/all/20260702093812.15918-1-ansuelsmth@gmail.com/
> 
> Changes v2:
> - Rebase on top of linux-next
> - Add review tag for Documentation patch
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: airoha: Add PHY binding for Serdes port
      commit: 11952173d8a180ac05641775f80bd6946327478f
[2/2] clk: en7523: Add support for selecting the Serdes port in SCU
      commit: 4e39820b601221997cb2220edc830f92367cdfc2

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781883;
	b=ubFLObhPdChSkOSKrcD2i6Ez9zP0bZV5F+IKge0zz6Y95m/dd9hDoOHbjbK7QOV2Df9K
	 nAL39HSnJEVjhDEVNNpwxJu+LAIqoo+Cn4Iz3+1YDtKpopwvhtN3O8p+odqEiQPNrvYyj
	 LRKmasy+frnS3x3l/ltrR5f6ZufenRwUgeGJgIPNS95nqV+zL7qQ8pl6qhBX4dktjJUwi
	 FfCWBJxuHVFIo1KYOH2VG9lzKt6sH7LvsRG7EZbRVxg/BNWZpTBJNZ+mJ/rcuePIQPFQ2
	 8iUJg2IrmkvHB4mOrj4vpsV9Q2NuR4irXwg5xGUYl3MaPof3bdjwhxcR5mOv9rvWMOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781883;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
	b=zRtqSlX3Z4W2f2yR53XCE5Ru2sOjTDMSoncei71jsBp2E8OA2jyUGv+rEqyhqzccM4bc
	 Cjwdv2oX6Xyys9zH3bhEX+e5ZkLfc+Eu1o2gKHAr5gNTHBpwooBXaueq+obHzFmnqEDGE
	 SZIUJ+8kbhIFnnATaXHT2zc+IZhRgUcUbkBp1jn7g7PDzlHO7a4Cm8V3L0AHuMqFxtN84
	 96Oq7kNzzyKt5LaR54ysLPwCVEN2PkaIye0BMispP4luptEY346d22vU+dX3mmp+DOmsX
	 xsmPAO8CJgLEpdMlGmvHJB8M/rc8XaSD3QcwAB9bCXtQ70zjoAJdh/6WXma8W1uXsGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B18606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0B18606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso1000189a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781882; x=1794386682;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yUcMHykGBsdlMngLe5E8c5GRiAK228iYooBSZKs6auk=;
        b=OtshT1JAitrDXS6HfYozdHTnAGKLZ5cfzF5jyiOrfkMSoJ+EQnUHSJeojFAYEZSMER
         lre4CLHbtYXAKqiM4jFS8+s7NQXRUEkbu8pv9JcsJclcWFPc2vQCXu6+sAJ/ZYnK4iPm
         P6OCCC7d2HEkDP7NClItvX6RwPmnBLUYCul+TNU32M65itEZKT2/CVnfbvVzwftHT8fS
         sIbG650rf3aNgvGWlTZ3oXuRWJ5YyE/aZfJPskma9oRDQ4JZVcQva3F0hTEiGsZxVt6+
         XIQUmN/Zq0vFP4ty6XQANlHtw0ouWrdvc37RoCgfF3OoJca3ZV+wsf/nIOsHFE8LysOh
         so3g==
X-Forwarded-Encrypted: i=1; AKwUvBxtNt340EQhNqE7v8yN0rP8ZyaLeQtV+M6V72mlXyO1E1rYRS4kBK6RlNQm5r453nMWEouX0J74UQXpgz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zSbhJc7aVWSMz4KmHlF1fR9cb1a8KcanJbvc+aPykXKM5yJRz
	P0NKeQF7vzrX8ECSzAvr10PKmozvRic+ggCjo7LPtohtgQHZSZTOr5tc/B8qxA==
X-Gm-Gg: AYBFou0TgQsKOG4FgCzW26ur8BNTLv1Zva6TgE/HX0+AdU6TOEYt1278AR0ulk1rvOx
	rkGJNshyFzQTvfT08pBAJxAD1JTbJYToMaoFw9IvJ7yEkqtIZW/tmJnXO0w1ly7cIvLpl/O3HIU
	Y3bjP71uEQjxYjqUFuZc9Mw2yEI/qPLMxsq/GHmhJz6wrr8gXzurh1d4ibPWeo66JhyuE3ra18u
	vB6V+gTElZvjAHrNKEOnzun7gqcvANRbDps4mgN4OEnrGCsfwUjJRdNij1/NeK4HiC4hAGwxqRF
	2SrJve/6kK5Nuda00fVYLoZnZ0k4LFNB23L6deffkllvE+yKCi6z9keIyoAQaNANTgp+Pzexi6r
	2/TvknbtbLJokXjCExiIqO3YtpH3Je0RINotMA+s+aRZpLLZGIHkTXJYyxZNK3AH1l/FYNEjaSq
	7j4XogJcxPS+y28JeGA32/9lpv0f/jbK9WKtNxu2XPD2t5D9hHDE8s2AvMWIIT7MY+wBoXp6lVc
	putXcSEJZFKhS90ZMOUMsF4C/s3uZOt91QD48XLMS7E1cgnvQF4P1uIJDdumIUn8pmhROZwGqv1
	vwNnxqruJ8TBSR420d56uSDR8qo3sFgFrayKlcofEWW2PdoWhi/qfpY0WbO6XCOM1/joCv20qK7
	gzs0kK/mYxjMdD7O9pPCysity+nb7Ly9R
X-Received: by 2002:a17:90b:2f0f:b0:3a0:e568:ed63 with SMTP id 98e67ed59e1d1-3ae896d7af2mr8262147a91.8.1793781882345;
        Wed, 04 Nov 2026 00:44:42 -0800 (PST)
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com. [74.125.82.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09369c638sm3054125a91.0.2026.11.04.00.44.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:44:42 -0800 (PST)
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a315ed211so399179eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:44:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy4H6NCmF+pGsJc2/UUSTQpfKV1SZyhpFE3A/JTeierrqr3NRo7A7hhU6soOJq1k8Wp7VNagf0ppshNv68=@vger.kernel.org
X-Received: by 2002:a05:7300:c5a7:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36ca1bc68a8mr2873501eec.0.1793781881630; Wed, 04 Nov 2026
 00:44:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
In-Reply-To: <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 03:44:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
X-Gm-Features: AclHuK9nnsy6U4khk5cNnlQ4F7O21MbUU3fY_2pf7x3dkjkCudC-yc-EGP9flSY
Message-ID: <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Drop.
>
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings.

Thanks, v2 drops it, and the series is clean with checkpatch and
checkpatch --strict.

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794889015;
	b=AJ6hAp9K616fLNSZwmOHSvb6lnBl8IFkRv4Rt126BKeo3/kzlM1aNQZpxLBkQl1FlIp4
	 5JMJ24AARhFGvqKsoD50KSrvDHXTAvVVlb1UJsp4LSCKSIKQ25jU7Cgk9T8VJVJ7OqJKq
	 aDuCgcp5nvVEOneoambwxchdR5uv14mu4hoGC9OWiG4GbDS+3IP9Plp4bre/BcmpuiEKu
	 0LL1RwvaMfam1fdsl4O73dvzmjMIl3WgHec1WPHwdy+lkYC7BFR8oF2W8VCOX2ZfVG32k
	 MA26U9YL7/TNveM7XaliP9Skan5w36q5QFAC+NPTEqv0p6NBh8Qf80ufs6/0aooQycg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794889015;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Auto-Submitted:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	b=auA1k2Mn0CRSLEk6cVZGJrX0kaNN09A3+A/aA2sKw5xY3Veiza4r8xhxq4EBSZfoEPvH
	 XJmw+gp24tXD0dv5ww51WvlnqoytSDE16ADw4uezG/4YWnj+7JdYu5wWEdCytLoUTO/eT
	 HBqxhQaR5J6SKQIzYJNB6DyP7t0FIYd+gho/fYaVKeyqoYgZ760mvPbUCYddzsEOxyuHl
	 5QpnPuAsbCXhVUjk18WU/QM8HDhb1nxN61ZfzaIclE4G9uHGv8fzPXhpRgAVIGoKInwoD
	 z3kUU8om0M0la2jPNMF5r54WsS+etio2w1M4sukHpVzUNhzBMishrMr6Pceub+OkRzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWDMCD75;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FED606A31C;
	Tue, 17 Nov 2026 04:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jWDMCD75
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B65C1F000C4;
	Tue, 17 Nov 2026 04:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794889015;
	bh=oj2zs7YpNjut+Fle9NDI2/nVbuq1xcuWOh/20pAlrQ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jWDMCD75LisRcYGA0VpqHWZD3qV5OTxbso7y1ZePw51GdfGEZT33y9ViEuTOqr0uj
	 /gOsoKvixXCa3y//OcHFyMaWFSlP5hgL7E8i/t6qi3Ho0E1HgjF4Oaz205ze6I8rL9
	 YtAUq7w1vXCBkwxfJFib92ecKO+ZS/aiyI45UKTXby4gB0eqFamsL/iQo36XhMJ3E0
	 JOaIMLkKPIsn9Ei0eRvXTSnQfUQkbF4qqdemNWBWGLl/tEGNkAxtZMfqhjGu5Z0d/U
	 setLTGx81kUAmTcSf5snzRMizB054Uf5rHNLsrnu0vT7ZG6bPfmJQeAe/I6v2eybwP
	 JS+zDMf5ShKJg==
From: netdev-bot+sinfo@kernel.org
To: Shirong Zhao <shxzhaosr@163.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: wan: farsync: reuse card slots after hot-unplug
Date: Tue, 17 Nov 2026 04:16:54 +0000
Message-ID: <179488901459.3291.9572765536095948605@kernel.org>
In-Reply-To: <20261117121314.811514-1-shxzhaosr@163.com>
References: <20261117121314.811514-1-shxzhaosr@163.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - How the issue was discovered, e.g. hit in production, hit during
   development, syzbot report, manual code inspection, LLM or static
   analysis tool scan.

 - Whether the issue was actually triggered, or is only theoretical
   (e.g. found by LLM and not proven at runtime). If it was triggered
   please include the symptoms, like the stack trace or kernel messages.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account.

*IMPORTANT*: If you do repost (for other reasons) - please include
the relevant info in the cover letter or commit messages.
-- 
The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

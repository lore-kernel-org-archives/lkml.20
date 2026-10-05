Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E3B348C6F
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791181695; cv=none; b=mJLsLYA/Qj0Cb/7T6W5CfF3aFpU/FVooS7bG0Sifa5tv1NN3k9e7TPunbz86/IJ7Tlk9dqtyDYW8y1Q2RP/OShPC0GJhcZtrisIm8BcdKwuUWK8QFuAw8viqK4YyaHd2Iwf7cErtamtHptT1To6+ngpCFlM1UaXP49cBFRIY8NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791181695; c=relaxed/simple;
	bh=JNCrdJBnnAqL/jwpqgfdN+WnXKXvfeK1kyNTahqk8NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z18DEpY5yNGWLh2jPcCT/awNX/wcM9S5qMuLiNUeQaJhnZpSmmySXpsdIE3lB/lNzS/wcuEWVR/7PY7VJFDJ3M9ku94nEvQsFNLpyNNeo7HOlRF7TRjS1RJwpTT2w8iG3gvyqv6jnJV6Hfjadu2xUiVfNKH7oJJYD0kgqCPm70s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=RYF57lsy; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="RYF57lsy"
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C0CD93F1E4
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1791181690;
	bh=JNCrdJBnnAqL/jwpqgfdN+WnXKXvfeK1kyNTahqk8NM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=RYF57lsyE8mjNcu8wAWA0J45gwNRG0uWjhp9TGW2mr0WeGA1xp4/DjCxQIw+wIVCf
	 +pKz8ug3WGybfyq3/S5pYTBCM/f0OGs5U/Y2JUEebeySrsrPpao/bD3y5BeIo4nu2p
	 Bsm5LzeXvs7KweELl1HA4zjpCXC5bUDGZzx8FBWqjI4JJJpN/axoLwe0/UtXs3Ugpm
	 bz4S+hBJFdEHFrl/G0MHWbpCe9x8ezzDSkWi3V5LV30g+9LxVbN+r3cnayCEhyxwyw
	 no41nx3DRJgBRxJx7WhFNXTrRdENH8aqCiUKe71zeHeidD78FxUuL3JMQqQ/RDY7g+
	 EQn7x+/WTTtvYkGduCqXbGYWZ9qcyXfxGCQ8qviZ7P88Sih6nfhMW7pjHw3UOsa0mk
	 7SsZIpEqTCJeC2+cEq01SkxLYgMXrCxgxmXIYbOXKR6FajGh46gHNCLcl8iTrTsV+3
	 BZUHrKvjR8PYlYszqB0GgWjEWL95rwT7lhhs007L2zlKBLT2WBUWwzl1gLBla4GaLc
	 P+oPpXvI2j06iGyZsHa0WXyZI+QvR3odkMwdVwfocorIezFim6ILjyK70WajcvXcE0
	 o4049JgFuafDXSugHjtEav+Fnb4TDPHVt8TavhKqsS9Bdl/Aj/97mDzsy3vjlPMfeG
	 tpT87oTYyIp3KWQb5UFtKkRw=
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-887a585233cso1101096b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791181689; x=1791786489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JNCrdJBnnAqL/jwpqgfdN+WnXKXvfeK1kyNTahqk8NM=;
        b=sLS0rOETMRjvqREawifpmNDWKDf0Gh4nWdXK9QYkn/tXaQ8EfiLz/S3aqGbSNdHCZH
         lmhOSaTeyvRx0O7ZFFbYO5+4GZQsUuNNSj+hYm3bKSFR7lzVaEfl9m9VLAdflbfqsUaR
         3aahROlbK5xI9aRYgrIG5klXrqMQ+lwy09INOY7AS6loiNqgHcX054qJJaOVW3LaXC3T
         NpF5M5ffSVmIXmY8+ui550bwyOI270olKOSFKH+KCVccWqsfpZbpmuhlJkRv1yriaPvl
         mKL8D6Ra6CkHGTfPmyIYR3X1AS7kEgVmczMnuEI5en9ewyFGi5l9hLqauVcOANkoqZRU
         eTtQ==
X-Forwarded-Encrypted: i=1; AKwUvByYKWxc36SovV4V0/zdRiwwR9xqKRqoYXWty0CJEe+5ta+DufjWKRjqAoB+/7euFfOo/hF9Xr6k0LnXeLU=@vger.kernel.org
X-Gm-Message-State: AFuF++l+qKL+FiU2KoTPijoGSKqmkjwpY1NcBohY2oe/rRY5yt/H37hI
	NR1NkGCwnXxyKtPWArQrYx665tftlOsg0rOJHi0g3P7K5vgxomIZ62rcpa8Hvn8fguH/+yXncJw
	9ORFbgoD0Hg/jkLE1XQ60t+sw4J0B2xeRfC6hrlwdisObHQRJ1ctb4m4jumMJ68UME26OQzS8KL
	80NiI2dA==
X-Gm-Gg: AYBFou2ueY5CU1eZVnxxOyA//GlcsF6intT3FKeejfJmGhz2dhfc/Bl/AT+uz05hwzD
	YxQca4gq3qOrmPQpTCXppRrDl7o7oR61qFZBOCTL0RzK7afEWW25LNlspGUziOQppbweoBthlOg
	1XydkNjIQOG4ZkCK+WcjRjjCXHCosT0SDKCjp+VjKckic7OwgyCIwRwWtfr/Nv8bhUgq97EsZ2R
	pyS5AJtIWief6OArUl4lB65GJtR8uOkBAz+ZI41zmIB+OKjzRZvDM3Pn2JadPGmZijoDpUsoLlr
	peCv42sOf2+FG8GLzYXkidrPw9QWkqL6Ekhc5OJc7srBgKn6aUU1VwXh+KSCi2lQ6VmdbP9ZbuU
	6bnihXJSnYg==
X-Received: by 2002:a05:6a00:1253:b0:88b:9eca:94ff with SMTP id d2e1a72fcca58-88c600d2571mr5084094b3a.7.1791181688923;
        Sun, 04 Oct 2026 23:28:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:1253:b0:88b:9eca:94ff with SMTP id d2e1a72fcca58-88c600d2571mr5084076b3a.7.1791181688535;
        Sun, 04 Oct 2026 23:28:08 -0700 (PDT)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0bfc3da9sm3061771b3a.25.2026.10.04.23.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:28:07 -0700 (PDT)
From: Changwei Zou <changwei.zou@canonical.com>
To: martin.kepplinger-novakovic@ginzinger.com
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	herbert@gondor.apana.org.au,
	sahil.malhotra@oss.nxp.com,
	ignat@linux.win,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	martink@posteo.de
Subject: Re: [PATCH v5] crypto: rsassa-pkcs1 - Avoid cacheline sharing with underlying driver
Date: Mon,  5 Oct 2026 17:28:01 +1100
Message-ID: <20261005062801.20336-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <e7b2e28eccfeb8c8dee87e9a8d782ccbd7d7da3d.camel@ginzinger.com>
References: <e7b2e28eccfeb8c8dee87e9a8d782ccbd7d7da3d.camel@ginzinger.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Martin,

Thanks a lot for your feedback.

Please refer to Herbert's review.

https://lore.kernel.org/linux-crypto/am2UMhd5CAhDiKBF@gondor.apana.org.au/

A new driver-level version (PATCH v2) is available at the following link.

https://lore.kernel.org/linux-crypto/20261004210200.290119-1-changwei.zou@canonical.com/

Kind regards,
Changwei


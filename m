Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794327127;
	b=aeQw00jSMSN+r42h049O1j0rk9ljdPXpvJkmO7NTZqgto44dRhYefKRfrI70zcLgiBtW
	 hO5bDjfSKl7+pOtR0WjM005cROrX7fCd0yLqTuH9QZ3cm2FOYASq567ihtLbHCg3aIYuY
	 GO9Bex7wfFfU4mCi3O8jyi5OXZvipBzMJ0NCbDmELcFN1eQivZkZ650lJSAONNbRi3erV
	 GuUFZW1XgboLkpWcdbZ8/jNzMmlXy+puQpICVzKkX2+JMf7DJQVd47Y7W6bJbdnDa+mRN
	 7iLB/XOMG8WXTvfQ+Gz5Z/1rGpQM/RXDp1vsjULqh+ZuQSJ+OaY8mHr7QD4/bzXrABg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794327127;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RSLplmlefCzlrzZekmOXD0yz8U/FyqcPjyO9JJ24e3g=;
	b=Urry9bXnqWt2SePdP9NZ1GH0a+LYvfaeGN7IzQSYZFKh0YGYDr5+WtAOar50DAlLj31V
	 +8RkmOhtVopJwwdUe/HHU0I663t/3L3BlYNHULTBiQwIz+2lQvfVfRHlWfG9I1vqsKuVQ
	 Whchlc6rZYvd9Ou6IU8KB3219iaZ3ZJp6/14j4xPRNCY/H8DLh5kwzJuh89Bhp+t9j20h
	 yzgW9fI5jyGIXbTZUzZ7ciH+a7nBMbHRwR+Mw5zdD4pXeq7JzFQuWng6EMC0vv1zdYK3s
	 gXmw8gQ6ldzVVFHVaABhSRvhkA9piKXu+bC0/HIkWCLAPOyKBWe30Xfy9SaCDj6mQTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rT1851wK;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD88606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:12:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAD88606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rT1851wK
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1bc97805eso1853345e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794327125; x=1794931925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSLplmlefCzlrzZekmOXD0yz8U/FyqcPjyO9JJ24e3g=;
        b=rT1851wKskl1h9ymNh8Xbol+PH9UppLA29igRFHTHd3eFBfaEobdNkisj4eq6NLoCJ
         iW6mkHMjfzEt3DomDzKW19n+/Q6ow/Qor3LjxEMpUQVg47KZ25vE0diQn5xg5ICcuBGg
         QCZOwflNYFooSOY6okpZsSNyxwaCtAmpuLswLPpSWVNNaouXHM/j0aXlqvfKdxNnIPTR
         ezfrSCPXgBm7pXfHKOgz5uEmkk5Kd8lAX7UAIdoaTt/9I4uq6xpJHAZGMb+Ep9mRqGBA
         Jthp1U5JDjizPbUn4dLi7NUU62IX7JBGG+3rkoTs+EZS+sm4XTBH6hllm1jFNqXj0xNI
         ClWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794327125; x=1794931925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RSLplmlefCzlrzZekmOXD0yz8U/FyqcPjyO9JJ24e3g=;
        b=1IEO2vXK5+1i21xGInWSZ8f2HrjbZSVDN+Qd2KwhSQTnNBSqTDtRiFfFo+gpscuWu7
         9vmalfwsS+e+IulsnfNVHkicn8R2P2NHK0LWozZ/FXraWetNIROIdApjT1h8FpG7uDrm
         4iEB/pMq7ZSGq4gqjYCq7TXgY5pbU6Gv8xUC4AXuDIxyj4509+c7Dmh9wxLdhxmeEIQW
         MmCPFJypUFHtXP4tNIOqU6DOeIC5PuQBTI/VVuwqju2TLhKWlRbeZDYzFDmlq4dWLUM9
         qIvfkz4qDXU0DnzFmVFU0fFmSH/sR+Ih8ZPAXhB6/TV3QJamV3M6hi35NAm087AmzUjg
         smlg==
X-Forwarded-Encrypted: i=1; AL+hErHp+Ir8O0LB6DSqQy8EPFXJ8hvg+QRARli4pUfJTDBcz9KOydEUYaG0oPiVANlIJG5Ac81gENqBkNZyGmI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Al7Iq++kLpQ88smDawZFBql+CkKpQgaxJluEeehtDPXgfhjjO
	DBzPTN4tK1hDzfXBvfLgEhN5t+JF8zVSsFMRRIFW0ssb3dPtHNCpq0/I
X-Gm-Gg: AYBFou2WTHc2TZYzH/DfhzAXu5UmUhGryaprFiGK8tExXeFzHkMfxpbc/m37DVkYtbG
	SSnE0C61zFv8z2qmJ5hhMaYhlVc2uiv/P6CKOxbPOwWVeYD3O3xGY4pvYVAR6n/KfzrSliwhoS7
	9Oh6xRyZAmHPgRBeVqUakcPG43A01p26uYKHmTaDNJczfMw0iK0sBJ/iwNE4dss3PvNWbeE8cRD
	Lf9/tJEI50vszCNGMADLdIxwCiFTj68YPYtAXCLE26OJwdFMP4alXMRXv2cwM7sIXtdqqCd03C2
	OOaCxQugY19hbMgGSVEzyygNIeSqnSjPS7rmmzD7GkPr20e2PH3vKuUIjbEAHso4OU/6HEGIT0L
	PYUwx8YsmVqeU089xD9hPuCR496hZtG326i4n/q24Q33l63RM1e1rry7RKWC6GnBnZHsW4ag7W2
	hyj9Z5fKMXHTSJVnZtUoaOI9AOQUBWlIWTC+i9sN4OeIUtlRNYySbJJD5x/9TnGmyWOP486LFDP
	m8g3QAI3e029HAD+OqnFrivVAOTc/cw6Y6dUInVYCc5NaanPRALoW6zdwyZMWAxNtyebMBvepzD
	tR9roEbMgzMcfQZreWyAkiUohYY0nILVYVZpt068SYXRi8yVrTayOrL7tN2kteyWn2fLkYC5
X-Received: by 2002:a05:600c:350f:b0:4b2:3c81:103 with SMTP id 5b1f17b1804b1-4ba0233a711mr52624085e9.2.1794327125133;
        Tue, 10 Nov 2026 08:12:05 -0800 (PST)
Received: from localhost.localdomain ([95.183.147.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0235ef62sm46727135e9.2.2026.11.10.08.12.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 08:12:04 -0800 (PST)
From: =?UTF-8?q?Bilal=20Yaz=C4=B1c=C4=B1o=C4=9Flu?= <ahmetbilalyazicioglu@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Mohsin Bashir <hmohsin@meta.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 1/2] selftests: drv-net: ring_reconfig: handle devices without channel config
Date: Tue, 10 Nov 2026 19:12:02 +0300
Message-ID: <20261110161202.77549-1-ahmetbilalyazicioglu@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <179432444472.994134.2763803571159924115@kernel.org>
References: <20261106150509.30458-2-ahmetbilalyazicioglu@gmail.com> <179432444472.994134.2763803571159924115@kernel.org>
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

On Tue, 10 Nov 2026, netdev-bot+sashiko@kernel.org wrote:
> This catches EOPNOTSUPP from channels_get, but what about drivers that
> implement get_channels but not set_channels?
[...]
> Could the channels_set call get the same handling, i.e. log with
> ksft_pr() and return on EOPNOTSUPP before registering the defer?

Good catch, that's a real gap. ethnl_set_channels_validate() rejects
the change with -EOPNOTSUPP when there is no set_channels, and a few
drivers only implement get_channels (vmxnet3, r8169, enic, octeon_ep
and others), so ringparam() still fails on them.

The upcoming v2 handles it the way you suggest. Looking at the same
drivers, channels() also fails there (its restore gets -EOPNOTSUPP),
and so does reconfig_tx_stall() when a driver reports spare combined
channels, so v2 skips those cases too. Other errors still fail.

I don't have any of those NICs, so that part is only tested against
an emulated ethtool family.

pw-bot: cr

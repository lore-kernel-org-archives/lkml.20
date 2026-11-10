Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337562;
	b=42Yj0qeS1Rv+tYhn0sE1SzueRctRmbrDDHIQaA/8Fnm2HWEKhR/7uiAvowr6IfuxVB4G
	 GY6bF3oczyzIMfNd2eUVdvEXpF9qAvMUMNs/OhWVwA9yZKDk4fOny57o380d/oqU2//6s
	 G5NFxACwEl+saOs9mHsp221YsXtnjCTYSvNWvQhQnQxqrrGXbUaOZvSSVXcrHZbKRHGrQ
	 bLwa45fU3s05NuIfQiVFV/zyImNbJq+DiqrydD8ENYvDj3dVzlsAqTqojof7YZpYB5HM8
	 A0j8hafRB5GpsMisi/DhHHFBKkA+YufODMWv+g4lfr4cq0G6OG8ASJLcFdZSraapYcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337562;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=WWnZldioVaIQvBqHhtWfm3ijxoimf6A6B8W6nEeMNyM=;
	b=bMDOeouMZwLg1ak/3BZvz3n5Le24ymamD81bC6HkRGQ5gbx9GD2ZPRBNU7vT9awDB6Il
	 U3htdgVOqgzFCqx53VF5Wygbfki5Gugj0cGV+VViEQdebGMe53nkI25w+5Z+Q9KpnWANL
	 4laR8P9tcnreFtWj9D1vMcJ8LXNWZmVqSi7+xo7mZocQxYXHE9EmYBeFMZHFietjiuvFc
	 3GzY0aMfyRrsMUSg3ZWLKliKxoOHGvJgad50uiSE0oMUxprkjrS6gMSwDSJs3CztIyTcg
	 /S3kTKKp1z9ScXX95IL1N/g+pV+7370MBLj004baw4tYZJwJvDqm+iSD5bZV6nwV6Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--atifashhar.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eFtwUUhT;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E72606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E72606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--atifashhar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eFtwUUhT
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3aed1b64104so3378334a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794337561; x=1794942361; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WWnZldioVaIQvBqHhtWfm3ijxoimf6A6B8W6nEeMNyM=;
        b=eFtwUUhTY+0jkJqJtGdXrL5foXpP7zDOhBd6CDjTlQ0ophu8e90pUUoNjyYfZZ7wL+
         q8idMATXLqolvhlA5UvJ/oTrp9S8A9lVYFtIrGE64P1miOOC6EscjOCOrYg/GJ/lLyLR
         0fpuby24nRonI4lK+Q1ef8mfZ9eWABhd4xeXSEI3rjZWJ665uHUS/DMAcNMewJ14/xv+
         2LW5vlCMAyASHQUg7bS1znXs3C9zIc3QMVpPwr3HBx9XAP2iJ8rBQmm3YA0OS4SvhdQ4
         nsqST8gyN4jyHc5mmZ3mkctgu06rAdJbxHoDnQ4TmETaeIMgtZWDOREohyMR7RX7Vv56
         g0Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337561; x=1794942361;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWnZldioVaIQvBqHhtWfm3ijxoimf6A6B8W6nEeMNyM=;
        b=TzLNmHG+QCLJhn/A8wpD5ZGjq/o3qSHeKTAQATINN9EOAJUwgVdhshIHGzD+pkL5Xq
         /I9TxWloBw0BNijfRUSvkTOGeymwO9sVuY8MrPtY2KeKx9tgnFp6+fRxcEPUDESzbcTh
         B72+ZuIxUtZ9a07J8WAojH+rNtS/cp5V/0a6da2b50Elz+RMw2QDhDqgPaAsmBjVp0nB
         E+8lPZIInIf0De2AiXQ3mxlLhmDEYgCEtIs9rQ1r5XccKkkewgTW7JglRuaa9mAYkMFK
         /619fQRMBqYq8Y3HRDLQ2nySmAJdtNRjLolDidl2xoUmbahL2c9HlAXcljUslpj7eRsn
         hfrQ==
X-Forwarded-Encrypted: i=1; AL+hErHWPr4gMeDhNb8LDbYj+GeM6QqTln6OowBJn4VYDc4ZVHh+sEEHXqo4/zOvNt3MM5gfNHVRD/9r+EUeVNg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n89MIyQZ5KWQk1W4EyMM0n2PRMJ/aSWEpeXKoytwRP/YHYtI4
	V1YXI5jfLM6718D9Khg85fsB5fE2VKQPxMLphhPV3yaJbKITfsPhWHiidRUXENB+fX9uUa2mRbO
	Ft/Q2dILJ8+Gq83K48cC20Q==
X-Received: from pjok24.prod.google.com ([2002:a17:90a:9118:b0:3ae:c243:313b])
 (user=atifashhar job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:524d:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3b166c8500fmr3498740a91.20.1794337561037;
 Tue, 10 Nov 2026 11:06:01 -0800 (PST)
Date: Tue, 10 Nov 2026 19:05:59 +0000
In-Reply-To: <20261109102006.GJ176724@black.igk.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261104133745.1432212-1-atifashhar@google.com> <20261109102006.GJ176724@black.igk.intel.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110190559.819337-1-atifashhar@google.com>
Subject: Re: [PATCH] i2c: designware: Release slave SCL hold in __i2c_dw_disable()
From: Atif Ashhar <atifashhar@google.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jarkko Nikula <jarkko.nikula@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Atif Ashhar <atifashhar@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Mika,

On Mon, Nov 09, 2026 at 11:20:06AM +0100, Mika Westerberg wrote:
> > +	if (tx_hold) {
> > +		regmap_read(dev->map, DW_IC_CLR_RD_REQ, &dummy);
> > +		regmap_read(dev->map, DW_IC_CLR_TX_ABRT, &dummy);
> > +		regmap_write(dev->map, DW_IC_DATA_CMD, 0xFF);
> 
> I'm not super familiar with the slave mode so adding Heikki just in case.
> Can this cause some unintended traffic on the bus towards the master?

No, it cannot initiate new traffic. DW_IC_STATUS_SLAVE_HOLD_TX_FIFO_EMPTY
is only asserted when an external master has already addressed this
controller and initiated a read transfer, and the slave hardware is
actively stretching SCL low waiting for TX data. When no slave read
hold is active, i2c_dw_release_slave_hold() returns early without
writing to DW_IC_DATA_CMD.

Writing 0xff simply satisfies the ongoing master-clocked read byte
while keeping SDA passively high (released via pull-ups), allowing the
external master to finish clocking the byte and terminate the transfer
with NACK/STOP instead of hanging the bus indefinitely.

> Also use 0xff instead.

Ack, I will update 0xFF to 0xff (and wait to see if Heikki has any
comments before sending v2).

Thanks,
Atif

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696241;
	b=zlMRFrRteisLGGXjxVp9jb0QEZrxfxu9if17I6bFaCAVxo1fbD9Fo/6q3lWq1IIVczh5
	 WrI4KPLwDJYeT04KCGPzTDXf/++wTeNrddbfkeyst9LJ7NSl3MJ+LcYOcwfFYbzw2bxsY
	 ZBFZw2QYtU3uSXACKwIM6DUU+8ZqxfZULlcLpxAiJtLIWLSaZQnJLRjrwBxttfwYMKhWv
	 Dp3MNWkMCQP4wPmJMWeiH7coCSsjgxy0+LHxjIXnydWv25gRLJzt4T10nNl+vAKwKkMTF
	 SZbdz+tAbLWWuJBJL10DJznWCq0rVBE19iQH7VdzFXpaVus2vauCa/nPR0Vw+gzS1Gw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Er/6bqz2N7+83QaIQ6D94RNvY6ZoeYk2XRlSx4xqVLM=;
	b=ahKQBkcO9gTzt/uVfLzN1t+TUXAYgD/6J8QsLZaVp5LXI2/OgqvNihgTN1qj6eVIMJ0t
	 N5QGHKBv/0p/h/LWsVRUF7L6UQKm7vImXWPGWjYmEVrOr0v/yICs1FFa49UcwGFXED/q0
	 B/VTJ3s13Bd9zssMu8l3UHrlZI3MQW7vjNUjnWbf7Rx7vvUNF3tUnCofPA8Xp+o2CjLVk
	 YD3Gc4iDrB9xgQe1+a1REBn468vyB+QmE7W9sKfE4BchgAFrweJe5u5biZuscGvArqXxW
	 wilqnT05UGbNX11oJFLCephX/joqio8m6M3RBF0uu0v/nllbNnRDbAQIx0CPiyfIQ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="C3/VARB9";
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF2B606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BF2B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C3/VARB9
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15dd124bbe7so5515290c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696240; x=1794301040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Er/6bqz2N7+83QaIQ6D94RNvY6ZoeYk2XRlSx4xqVLM=;
        b=C3/VARB9Ki3INhlpjHk6uw34w0eGjBtr09D2pcJRau33CqrUBKiWngGSjA+cADcyCU
         /g8gav+ogPg2gM2vm97bmSe4uN77DKvTC0++azS/JtNfZb+vtpWfj0h/t+IdQpZPISzr
         NneQuIO31ZBa+SLp4ZgJvw0C5xtqOPLQ54p4Ou72UBGbwCrYQvp3R/4tOL2rJ2zv8nbM
         IZKHxPw06svFbE8O/kXyNZ6LykNqU2tTGXtCSfmLFgis2lO2lczOoFf4/44wMV1Feq+M
         1fdaeGPTHxI+HWPS1QPadsE4If1L+Ij+cF0apDlUreUjUZuST4N33nOf2F/d6D2/4udQ
         69fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696240; x=1794301040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Er/6bqz2N7+83QaIQ6D94RNvY6ZoeYk2XRlSx4xqVLM=;
        b=haf8dNDH5pFb9nX4ROszEi3oNHbr1geq2KpHx0sCeBUvKBXYfsuIpBUUuK8BE/Cklk
         apdst2cOxamgFfN88EW/WuUTb4tfPSFrrCFZ4M8QH7n70Zrc+T11o26Nbbc9O0NkjjPZ
         CdAGsY8cbF6m1KfP37ZNp+T/306x33u5ZQXpDDIXzqtwBN++W+WhWhgvDsaLYUq1P2+K
         3dnbEtie9TlVByVqWFSewiApj/OWAiZbk09JBNckm8WB2IxWe3y2tEKcC/pElfeqK9Ia
         bQx+G1+gZWkD0n3Hh6ESG+BmyjjFcdcHYc9CSk+y8pKOUufc4/L1gM17ttzs4wOD8ZDs
         3ycw==
X-Forwarded-Encrypted: i=1; AKwUvBzHSiQ4KMqYIiye7LKQXYs7/1VfdgopyrKbZ/MSIYwH8JqWg9kDY+Y3k70pQm8aOkieXrPDr1ViAS8irGc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e69jjyn45pWFyGPF7RBtj9PrXLx9MdoF69Cc6BuOJOZM30+0K
	leEV1SXnB3UlnmpK6vsSgYHL7tKrPiULMkwhSMr4dSyZAW3dm7C8o00b
X-Gm-Gg: AYBFou1uCELsuUcQCAw+KAwzPRgty61YxXdWvO1reAmSPYargG3IfWIq0tKFrrbkpCU
	o0lIMf9wB4LKg2fNmOfBpV6zkRCHOsmIheaUrHiu5G1KlPW5xSUpkt5hCluS6tUWLk6T812O0yu
	wFJEijxMyVTKWrCGbBmJo3HCOfRgFipPq/F29tEfhVDoBxOhB6rKzjxH6qs/BQPIxrOFKg/K06i
	AhncHWrBrWugF7WDzmg6sSJxXeOA29z19igR/c3tcV/0YY68cNNxmEjDtrbK6/1lmF6snisH4Q9
	UeB+cm0kaDRxOLmshnhTabj4XaOh8bEuFBzbIMyjh0O7fRFYNXZyLv5Z5mHxFrWO6tZaD5E3goY
	LFWW3z7w0FAdfMF1FArlmbbnfaNNRkInA0uOBDRcRP6SsYuh2jyhrMHb/BkpJmtW4/WeqP9QT/S
	Zut/Dl1i5KU2qZlYwztstB5T40cZAANodH/Vc5RczKQiUVaMZutfEDAVjT0JVEkBZOEDl8KYPED
	k0KaeVQt0pInN+E4G7CL9eaz1gjRYWioDyf7xI5sZzHKeAEuKVZdL6RNufO3S+aw3QTk3FXgCOY
	dL5ZDTcCzkxKx0GPu3yh
X-Received: by 2002:a05:7022:1113:b0:1ac:9da7:e86e with SMTP id a92af1059eb24-1ac9dc67128mr17230382c88.30.1793696240266;
        Tue, 03 Nov 2026 00:57:20 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1b38ac58sm39704029c88.23.2026.11.03.00.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:57:19 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	rcu@vger.kernel.org
Subject: Re: [PATCH] nvme: wait for SRCU readers before splicing the namespace list
Date: Tue,  3 Nov 2026 03:57:13 -0500
Message-ID: <20261103085713.3479756-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103081418.GB4301@lst.de>
References: <20261103-bug-nvme-remove-ns-srcu-v1-1-e239087d63ac@gmail.com> <20261103081418.GB4301@lst.de>
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

On Tue, Nov 03, 2026 at 09:14:18AM +0100, Christoph Hellwig wrote:
> This feels like a design issue with list_splice_init_rcu or rather
> using list_splice_init_rcu with SRCU.  Do we need to encapsulate
> and verify this logic in a list_splice_init_srcu so that other
> potential users won't get it wrong again?

Makes sense. nvme is the only caller that pairs it with SRCU today; the
others (btrfs, apparmor, ima, smack) protect their lists with plain RCU.

I'll add list_splice_init_srcu(), which takes the srcu_struct to wait
on, as a separate patch next to list_splice_init_rcu(), and switch nvme
to it in v2.

Thanks,
Qiliang

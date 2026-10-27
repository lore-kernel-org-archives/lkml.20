Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793089072;
	b=LmB+WIsJUOQU7yCukVUz+/j3TWhKX5xJjdbpD5iGVrEcRdm/YWkfBN9br9oN0qjm4VLr
	 1Zs7GATAyVHMWgcPzK6Y5SQQ4r287UPbNQql5ru917KfABq1qwJovlbHY3jSkMmfaiKcc
	 725HW0dEWc3ryH2RC85U11g+D/U9QSuohPgRDpcXv0tVgAXgHWui4DfyN8Lo76e08gWwB
	 5NvIFv0at64qsO7ANdLSHT3GGxbzA+rCpOi5RDbZvirVHYNdrqJYhV/+3WCEY0lJZ34Xp
	 q+cWKVySGtG1C9t9Z+JiW7A7Ar9GfTTXPLP0OP8rir3llogsQolXO/T9nO+crpmbyVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793089072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Feedback-ID:X-Infomaniak-Routing;
	bh=FvYoCLZcn8V8gwy8R2AOjo/wkyQs+v7pSOhs75pLsAc=;
	b=JmXmCBvmoZZeA/w0ENqEJaGSlRtUDsjxqNEppqaq+R7TYwq+XU2IGSSS1/ztsZpXl1gM
	 PEmfD7wbfDrTgXDHU8k8OAeq6WmVLoj2mRyAhEQJt0j6sJpUyZdd8/ZOQTGFRbZ4pRZHa
	 3ddB20u9FrSD1tJPJjfi/3m0z75QmTsUTtjD65gsPMxvLqRLUtpxkqtS1FmJBl23PPptJ
	 JR3zGZogoXyaj3IUtxJg9H7CW19awzbVmTl/XrooBtGxPmgoLz+g5mDwfkliRlEvxroYp
	 1WISI29j/+L0qQrLQbY9L5vmRB5Km/U/wmAjIkJWYuSQK7gNdBqboGQFxHhWd9m5TLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=etik.com;
	spf=pass smtp.mailfrom=etik.com;
	arc=none smtp.remote-ip=84.16.66.168
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8706A606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8706A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=etik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etik.com
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jDNdp64dNz1LvM;
	Tue, 27 Oct 2026 09:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etik.com;
	s=20210927; t=1793089054;
	bh=FvYoCLZcn8V8gwy8R2AOjo/wkyQs+v7pSOhs75pLsAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VQjIb1uN7B+MBf3mFM3NKkJ4bC4V7Dt0ZLoF3OFneP+QCqXQzFFMHTd0vN8Gm5gI7
	 65QyOocl5E6oQtT2iy2U1BNziRmM8+h4iXQ2jkGQ3afx1Fqy2NVH93DJ1OX3ksgtGH
	 JvImcGSiy0SWHUBEyrDt4NBQBP5j0qsUVJE5VOFk=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jDNdn5CYpzjTW;
	Tue, 27 Oct 2026 09:17:33 +0100 (CET)
From: David Vornholt <dv@etik.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Vornholt <david@vornholt.online>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: typec: ucsi: Stop a power level change notification storm
Date: Tue, 27 Oct 2026 09:17:31 +0100
Message-ID: <20261027081731.122513-1-dv@etik.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <e22cf1da-89f7-4c98-a90d-357b18687df7@app.fastmail.com>
References: <20261010183917.146821-1-dv@etik.com> <at8kLPzAnJAfZRjF@black.igk.intel.com> <20261026180907.76867-1-dv@etik.com> <e22cf1da-89f7-4c98-a90d-357b18687df7@app.fastmail.com>
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
Feedback-ID: :cd1c7b8f1df508f:ham:123049f310c9d1d
X-Infomaniak-Routing: alpha

Hi Mark,

On Mon, Oct 26, 2026 at 04:01:32PM -0400, Mark Pearson wrote:
> I need to read through the patch properly - but the X1 Carbon is
> quite popular and used by lots of people. Have we been able to rule
> out it being the E273m on another machine?

No, I haven't tried the E273m on another machine.

On this X1, though, I've only seen it with the E273m. The X1 has been
running v2 since the 10th, and up to the 16th its warning fired 14
times, every time with the E273m connected, on either port. The
monitor hasn't been connected since the 16th, and the warning hasn't
fired since, although the X1 has been charging over USB-C on most
days.

Right now the same port has a 20 V PD contract (the source offers up
to 20 V/5 A and PPS) with the notification enabled. The warning
hasn't fired, and GPE 0x6E stays at a few per second.

So it seems to take this EC and the E273m together. From the UCSI
side I can't tell what the EC is reacting to.

> I've created internal ticket LO-4728 so we can see if we can
> reproduce and get input from the FW team on why so many
> notifications would be generated - generated so many seems quite
> wrong.

Thank you. If it would help the FW team, I can capture the ucsi trace
events or an acpidump with the monitor connected.

> I've only skim read the proposed patch, but I'm also hesitant to say
> this is X1 C13 specific.

Agreed. This X1 is the only machine I've tested. If LO-4728 shows
that other platforms have the same problem, their board names could
go into the quirk too.

> As anote, if you do end doing a quirk then that field is bad as
> there are two different variants of the X1 Carbon 13 - ARL and LNL.
> Better to use DMI checks on the BOARD_NAME - there are two per
> platform, and I believe you're on Lunarlake so would be 21NS and
> 21NT.

Thanks. Yes, the board name here is 21NTS4EE00. If we go with the
quirk, v3 will match "21NS" and "21NT" on DMI_BOARD_NAME.

Thanks,
David

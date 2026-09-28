Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD643B6BE3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 21:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790630076; cv=none; b=iry2H0MUzy4RJf+a25sHES1VyMiAb6r/rjuroIZ0FrUgsjWk6iS+fQq58sZY+bJRiZqZwnERopzyJgwBYqykrCgzzxJVZlwNkXvG0UKVnS4IhtJH25dXYmV+9tIu0SF1qd9Dpsji+Q7Rc3gEsZ1dZjLu3b/IrHvQN8q65x6T0zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790630076; c=relaxed/simple;
	bh=aCF8Tme2CgtzoXmWHTlE5OX7b96PnET6TbNRNjwcp/M=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GYJGz5yqPRVubXvMUrAdntsyos3VFLiYI6X5tECeX76vWHWaJVFAFWyZfCWgBTRUfhCFZv3Oti/2w1diMm1nVy3LRlReDoRtIk9BUQe16ljhaKOe5cXkvtHMbE1/0n2Ew3C0gxlx2mI7FU4X3eOLlEnQ0pPCx5Yguq//uJZNLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=SWLiRbSe; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="SWLiRbSe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790630067; x=1790889267;
	bh=9E6G+DXzASNqgJtgUo1mOrZfjexrcjMhX9iNGOYdpaY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SWLiRbSebasfOBJIUaFhOCQFjyu1yugNIdTd1xXJXSq49uSWDI0dlRXuFHs/QeztL
	 asRihp2DciUXJKeR44mdK+58eGOwTWB+T3bKva7pBrkZNpQY+RZ5CwSOPx5jMigJT0
	 V+6LxjWLw2RdRle7mN1CtzGjhNJiKVUunJK3LtthCXksu3Z33GxK1gQQjcLW7tD+z8
	 mYVxV7LnA/ae1a4XFJXBQeabdhQRJJnmf59O+GOWPHoLdrXfx6FeLSHF6gIrrVL/pi
	 xLS2sr+4PqautlP83F/kj15bD/uF04xfSRsGXy42m1CY0+UMFNsguX3SgnCjZUR3uj
	 DbaKQJrfVL32g==
Date: Mon, 28 Sep 2026 21:14:22 +0000
To: Ravindra <ravindra@intel.com>, linux-bluetooth@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Kiran K <kiran.k@intel.com>, Chethan Tumkur Narayan <chethan.tumkur.narayan@intel.com>, "Vladimir V. Kondratyev" <vladimirkondratyev2@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/4] Bluetooth: btintel_pcie: fix D-state transitions and PM flows
Message-ID: <20260928211413.26759-1-lsa.uz@pm.me>
In-Reply-To: <20260928171003.2925480-1-ravindra@intel.com>
References: <20260928171003.2925480-1-ravindra@intel.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a393ba71ed2e00f6f26f94f4a7033989b22f9f14
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ravindra,

Thank you for taking the race on and fixing it in 3/4.

I ran v6 on the Surface Pro 11 bench (BE201 8086:a876, s2idle, the same
base as for v4), with an instrumented copy that forces each path:

- plain cycles: the handler records D3 and re-arms RX, as before
- a gp0 dropped on the way down: one 200 ms timeout, the register read
  again, D3 recorded
- the handler's D0 or D3 case forced to break: the fallback records D3,
  or claims D0 and re-arms RX
- the race: the handler held in case D3 for 300 ms after deciding to
  claim D0, past the 200 ms wait. With v5 the fallback re-armed RX at
  203 ms and the handler again at 300 ms. With v6 the fallback waited on
  irq_lock, found D0 claimed and returned, and RX was re-armed once.

After every cycle Bluetooth answered an HCI command and scanned.

Tested-by: Sergey Lebedev <lsa.uz@pm.me>

Sergey


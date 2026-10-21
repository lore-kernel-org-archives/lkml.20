Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592151;
	b=VPXdvjwR9YwWywkSl75Ev0doDRpMEwCDZTVtMAc6pcY1KQzgXCTSUkTmdjf4QnN1LHfN
	 eRNh3zP5g0KPTp1/C+jH2ObLhRI4uy30FnicXgdpMMy5cM/JO+TEimFkGbTejG6621O0G
	 TDlRlEXfm2HNlABekKu3eIYR/h8IbzYIUDf0lqvqP0w2Cu/9sZmBwkhCHLMG8226v8vbu
	 T51FN3S/XGjWBR7Adte3+3bLA4kAQOkszL0Bs+C/JB114yRAdSkkjU1Z2OaZ/GG4gmoPs
	 j04AEbzkGNkucfd+DLgkdnVwAvuWtKrtzSs7x6rd8YzKZXR/RL01inuA+zq+3r+Owgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592151;
	h=Received:DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ecGvVV01uT5Sh/RVAiXSzTk8F9z1lk/dbcT05h9/buU=;
	b=ViO5c1+frL1RV881SYJBV2Wox4PHMFBLktXAdyp76btfW3r5LZrtIDrDw7XVfLgGb5va
	 dzVc/SWKdTvfwg4W6QuivlCvRi3mmfHFrmU+1nJXsU7tfuKHFOwpZysZdI8EwVgUOOMnN
	 upC8Lbk7b7/b7Want3kvL8VKQFZQsd5YYx/YuGZ2F26hoFm0p8KojPiyNlbQrbc/kghTo
	 mcmHcwlhZdQ6eAAVnySntzIUW0YT4boQCaLArDq0wDPLPlhXuu6gfwZCsl2eBW3v4BXIE
	 EQ4CEDlC9znmN9LvY3T2lCOdN8z/LkudP0RacmQ0Mvee0AQNoBC/gC4ij8Mqi5X1/zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mMbyWy/9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4DF5606A327;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMbyWy/9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A6E1F000D2;
	Wed, 21 Oct 2026 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792592150;
	bh=ecGvVV01uT5Sh/RVAiXSzTk8F9z1lk/dbcT05h9/buU=;
	h=From:To:Cc:Subject:Date;
	b=mMbyWy/9cl6m5PdTOepdti/E0iJmzbF3HhX2Iy6h4+kO5TF47Z1ShT0W8aJzcqM65
	 PXBmyYsg2/Lrvaarxvy3/I1GyG4M1dL1xYn3jgKaILGv/4bKJFqttip1NA2ZQYFSFV
	 7/hdTMrrrgALBzz5AJ0j49V3QQfU1aYLhoS4pfmC+l++PgFgtuDl3F7hZCXqvd4BPT
	 TO7ZxnUbYk+S8zJuVLfDjMXbkdJxKKC/Dz8OyL8pctisP96TQffP80NTy64z7PffGF
	 KQPSZ7HbMTZRoDbZN+p1B1Fl8fySW5/+HY+ZsofCaRhMG9bzy/l4rTH84deOBqJhrX
	 I4/3faCtPmxdw==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xJX6Z-00000009kq7-2CBu;
	Wed, 21 Oct 2026 16:15:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] USB: serial: io_edgeport: fixes and sync commands
Date: Wed, 21 Oct 2026 16:11:43 +0200
Message-ID: <20261021141154.2324793-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
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

This series fixes a NULL-deref triggered by syzbot, a memory corruption
and a UAF flagged by Sashiko, and another NULL-deref found through
inspection.

Also add the missing serialisation for MCR, drop the modem lines on
hangup and close, and switch to synchronous commands so that operations
are serialised as expected.

Johan


Johan Hovold (11):
  USB: serial: io_edgeport: fix NULL-deref on early status
  USB: serial: io_edgeport: fix potential fifo corruption
  USB: serial: io_edgeport: fix potential close() use-after-free
  USB: serial: io_edgeport: fix potential NULL-deref at open
  USB: serial: io_edgeport: serialise MCR accesses
  USB: serial: io_edgeport: drop redundant sanity checks
  USB: serial: io_edgeport: drop redundant open sanity checks
  USB: serial: io_edgeport: move initial termios update to open()
  USB: serial: io_edgeport: deassert DTR/RTS on close() and B0
  USB: serial: io_edgeport: replace atomic command allocations
  USB: serial: io_edgeport: switch to synchronous commands

 drivers/usb/serial/io_edgeport.c | 277 +++++++++++--------------------
 1 file changed, 93 insertions(+), 184 deletions(-)

-- 
2.55.0


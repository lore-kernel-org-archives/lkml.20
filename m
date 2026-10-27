Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117083;
	b=Igw6zBkkTA9VoIaNncwZKjL5J0JrBzI8YXBnJq8zD2wemQg3ePhvdtdY0+6lNqzU1LMG
	 O0BgVkJLGzoApPwPT3zVRI9lF3HpgAgNbbTJCyFybigzsvPyrKhJ9c0K6ixwDYzsCAabi
	 y0z08lSVEEaastUeO/oPjvVnGjZTcavPeyu6psIGA3at4bgBCPygPlO1V+V3Q2inE0BUi
	 JpaeT2tjcLMHD/TEewO+D9/3EEAJZGwdXHlRSJ5dKXlt+1eSpjqN8TVTcOgdnqXu9smR6
	 s00leOM9BZjoVlv/z2cL+yqzQrVwwBTMs2THKgnBeysb7Dg9L+FGjyVS2x+giXXw3ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117083;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YQ5YzK9S3F3vopcd3+xEFSFvk7QGHqKHI08GekIrR0k=;
	b=AQWJgRi34YKExYo/k/ls4VQQ6yVVqqcybJzpzRXmQ6tFGY1tMJaSuJsRtex13TsbWm69
	 xaYEHI0fW+CSVnuNSA2tRWKRcY3kcsVcCnXdGvnoCgBJjOD1VC1iPWlRP9kR7re/SUG6Y
	 umS38oZr1smagLNBM16+Tno7nLXsEPsljnQWZR8opYRbwJspcxvjyvOBFsXxlWRTqvs8j
	 vh4nvmdXOUxJH9YfrPOFzqtBXCWjKjJMlCnn4wbB0EMZr+DlayOCySVVxYtvSTwikfL3O
	 gFUIxhKNfLKs4KUuycyofN8GXlXaqgA7yusD5BWyX6kWCoLW0LQKEfYA7R55B9oolXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="OX/drPN7";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87299606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OX/drPN7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A725D1F01825;
	Tue, 27 Oct 2026 16:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793117083;
	bh=YQ5YzK9S3F3vopcd3+xEFSFvk7QGHqKHI08GekIrR0k=;
	h=From:Subject:Date:To:Cc;
	b=OX/drPN7HlQ9Uit/6rGTX/QYS15LWnyLoKYOZTgHmEmqcyf/HHXLYPkDFwnk/mC6k
	 Na2ZP1e2/Rj14easJefVCmWg1bkEgi92TxW5dXR6EQLskAD/IA2z2+mX6hiHGYbxZ1
	 SQX67u4suXmD8sETbbAfbNhZHQTODKsFk3xDeUb0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 0/9] w1: a bunch of llm-found fixes
Date: Tue, 27 Oct 2026 17:04:33 +0100
Message-Id: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrB1IQlHwKtKFTiZ1RK1kqhYkd
 ze2y4/H+09QjsIKTXFC5F1U3kuGLQugoVtejOKzwRlXWeNqnKYZ8xJxFiU8LBKZEB7Bd7V3kG9
 r5CDfX7J9/q1bPzJ97g6kdAEsAZqgdAAAAA==
X-Change-ID: 20261027-llm-char-misc-w1-cc0ff4fda7d2
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable <stable@kernel.org>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1687;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=YPpx9CFhYOlgSKUGxZJb7UAqna/NEsIdN4fmKeJirsQ=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPTk/jydLlXDRFmEe7P96puPO9OVPedW+9+o2M777se
 msq+2dLRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEwkxYZhwaIPTtkSlyKKm6/d
 VevbJ2nHucXcimGepUNBfF7fZ7lJbcfNfdaUs0Zrm/MBAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

Here's a series of some small llm-found fixes that have been sent to me
recently.  Most of them are just minor bugfixes and locking cleanups,
but they are good to have from what I can tell.

Submitting them here to get a solid Sashiko run.  If they seem sane, and
you want me to take these directly through my char-misc tree I can do
that now, or I can gladly wait for you to resend them if you wish to do
that instead.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Josef Bacik (9):
      w1: use the bus mutex for the "rw" file
      w1: remove the master's files before taking its locks
      w1: ds2482: set the strong pull-up with its byte
      w1: ds28e04: use the bus mutex to talk on the bus
      w1: ds2805: use the bus mutex to talk on the bus
      w1: netlink: drop the slave after the bus is unlocked
      w1: don't hold list_mutex while a slave is torn down
      w1: w1_therm: lock the list of slaves for the bulk read
      w1: w1_therm: leave the slaves of other families alone

 drivers/w1/masters/ds2482.c    | 36 +++++++++++++++++++--------------
 drivers/w1/slaves/w1_ds2805.c  |  8 ++++----
 drivers/w1/slaves/w1_ds28e04.c | 18 ++++++++---------
 drivers/w1/slaves/w1_therm.c   | 45 +++++++++++++++++++++++++++++-------------
 drivers/w1/w1.c                | 21 +++++++++++++-------
 drivers/w1/w1_int.c            |  8 +++++++-
 drivers/w1/w1_netlink.c        |  8 +++++---
 7 files changed, 91 insertions(+), 53 deletions(-)
---
base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
change-id: 20261027-llm-char-misc-w1-cc0ff4fda7d2

Best regards,
--  
Greg Kroah-Hartman <gregkh@linuxfoundation.org>


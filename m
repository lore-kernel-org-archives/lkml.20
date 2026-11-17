Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911672;
	b=pp/kJDTLfuzcv6QL7CWJzPtejJ/yB06/xJma9ny1LcadWhhqaMVT1yXkONfvoupPIgkS
	 UdOMrwIPZj4c1/NdQ63seG+A+Qb6RIGAOEH5Lg/05kv5aZXvI+sdW7MN8JRhod0+f1KmY
	 R7wKa/uLV8y5tGRWKX3FC1+aeGEUQI0aZJjY7K6mYqxH3g1/4/l0qQ7lwbumEGploJZL8
	 OCM3d0385b030CGtYWECHxX+cF3d8eLEgIR3XzzDZSx21CEewYAqk2XqKyRCEEJxMqUj8
	 l7agseVZDtMqRZs0tYe+6X8dw2syzKNwl8QHQ39h7ehCDDTXuhjZWMyycim3KrpIQ8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911672;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5og5gbIFuLrK4odCnF2cFU+0oOHDzasvRkpi1DDbr2I=;
	b=Wd7luxE4PLF/9oWuWUdTk0dDNbSZAGVQZwNX1kzTPsFIMxt4nh8RXx1Rul1vGY/tIXI6
	 JzLpHIUqstwtXeK2kEZ/IH0SslMkRqJo15i3S7Mzw2MxUffZk1cJ3/4fPjUcuHmFFUn+x
	 sOlo8NFGIJhovfKmJ9Q52YqffZ+za4ihLZCmBnLvQFz9C+54e6hBHgROmhx91+vElPGhw
	 xPOiO8MDjBITT5+AR6qw6QB2DoCCcJ+n7g6X95XOTI5rrHk/HhgSaG7phzddeC2V5yLDe
	 0+wzdbtsIeAvjKmgdgtfe6MaR3WSwC+Kf/gfWe7hP7BsgZ27HS6H72wsEAUwt0twFLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=gmail.com;
	spf=pass smtp.mailfrom=runbox.com;
	dkim=pass header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=nHjFWE76;
	arc=none smtp.remote-ip=185.226.149.38
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3113A606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 10:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3113A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector1 header.b=nHjFWE76
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xTGW8-002Ljx-Dl; Tue, 17 Nov 2026 11:34:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:Cc:To:From;
	bh=5og5gbIFuLrK4odCnF2cFU+0oOHDzasvRkpi1DDbr2I=; b=nHjFWE76JFPXgbBj/GeNNNvAxS
	rCElX7eBJuvMRBI2r0YgBwqdDHlcd9GW9k6/LLuvu1OwgHhlKoU+l9rRWm7yCBshvzmWvvIBlKlM0
	K8xGP8ToMETKCwq2SXPoUKChDlUHLJee29V7kuvfrFa+7/Hs+PER1gEfjMElwidyVTVbIicZuU3+f
	JiEMt+qiIQG53/dQMi4dPdRmxdGgEGjKnnahjPpF5M2d4qbMnV4yIeJoSso0Licvv25SFUtQL1flb
	FYSnK7T/LwGjdizJeVxdFJUPpYsqIudunBFDBEgC8OMl+iRCIieKjYXAzipEgqUo7mGsXW8u8WLeP
	ddpPFdMA==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1xTGW3-0002FD-2J; Tue, 17 Nov 2026 11:34:19 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xTGVk-005qHU-1t;
	Tue, 17 Nov 2026 11:34:00 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Petr Mladek <pmladek@suse.com>,
	Kees Cook <kees@kernel.org>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org,
	Jim Cromie <jim.cromie@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Samuel Wu <wusamuel@google.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 next 01/13] scripts/kallsyms: Avoid overrunning on-stack buffer
Date: Tue, 17 Nov 2026 10:33:40 +0000
Message-Id: <20261117103352.1244657-2-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117103352.1244657-1-david.laight.linux@gmail.com>
References: <20261117103352.1244657-1-david.laight.linux@gmail.com>
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

A maximum length symbol can be KSYM_NAME_LEN long (including the '\0').
But the name being compressed contains a leading symbol type (e.g. T).
So when the compressed name is expanded (after the hex is written out)
the buffer needs to be KSYM_NAME_LEN+1 bytes long to allow to both the
symbol type and the '\0'.
But it is declared 'char buf[KSYM_NAME_LEN] so a maximal length name
overwrites something on stack.

Found by code inspection, seems to have been broken before the code
was imported into git.

I expect there aren't any maximal length symbols and/or the byte that
is overwritten is something that is either zero or 'don't care'.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---

Unchanged from v2.

 scripts/kallsyms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index ecb444078c1c..140e888bf713 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -398,7 +398,7 @@ static void write_src(FILE *out_bin_file, const char *out_bin_name)
 	unsigned int best_idx[256];
 	unsigned int *markers, markers_cnt;
 	long bin_start;
-	char buf[KSYM_NAME_LEN];
+	char buf[1 + KSYM_NAME_LEN];
 
 	printf("\t.section .rodata, \"a\"\n");
 
-- 
2.39.5


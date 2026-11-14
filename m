Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682858;
	b=jeatvrKVr/ZXcRoCQDN5+AGeUuIpP0SCAMkvknINXpYuXlVfApcSn8cDmc9J8oUWQioA
	 0xte//itZBSQe6m1zxes44871dNjuUhNt/2U9vCles9fxDQ2m1GqdjG+OPHu9l9CAxOBZ
	 NrvPAcz1SFAsDPKWXpc0ybkjuQGLAtk/vuNJyDHDcBRf5KFJRjf4Mcl07+Y8gRiwdbPO8
	 OAQhtPJMsiyzfbY1NHFIhXywQOlOeaF3HwQURXDVYpqBaeDmGIcp83Ty2KaTTcDm/tD1F
	 11AcPBgdRh2KjbAr9fgkyJ3SkZP96nqBnXk4Q3BGaTzcOqKua1MYxKJNjXvaA6qk6Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682858;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HrpSgkNeKUnB3ra6VtwJ8vLJ84rrOK16D8diOtzFrr0=;
	b=Y5vQpiGknMx+RXiwdy7tHWtUFtrYDS2hrt1QXXPEpXwAldHqgu8IGyc22iiseRMRgSuH
	 JiFgW5ocxNlpoVEWZcVNtRmOk6l0oeJmqf6UFD1n2btnTUob4cc3QArjB4SQpJwL13iEO
	 XQeFZyPLMzgTODJWmA4rZg5BK8A8kF2T8Df+An+th3i/yDJgbbfhoxZvw96cffQtd2fS/
	 9xRe4FERkox+CrjaZD5w1NUtwIGl6/hYMUVNSonpxdvNV+b67iqFCWHb8aSvXYGxl+Zx5
	 5EvzNDDQvNCddJF/9oUMHCA3xnduE5z9qVDADNINfNv9x86/do1/PNNzYzA+VvNt/RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=FJc7YS5A;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB3606A33A;
	Sat, 14 Nov 2026 19:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BAB3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=FJc7YS5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=HrpSgkNeKUnB3ra6VtwJ8vLJ84rrOK16D8diOtzFrr0=;
	h=From:Message-ID:From;
	b=FJc7YS5AUZCYp0nF86kLMXAfGswwXfFdeta7OW3IGSUoE1MWvaiwf/2XrjE1C4WQC
	 NquHPxXr1RBTlDiMmouX/2pYBLNpGoPf/6RSBlQYwAHjwxMBThDIBpOQyw6z/Q/4Z8
	 VoBV9coKviGeoIG5KuT5FizI40oycrAeU3JVXW/g=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 2D5ACC095C;
	Sat, 14 Nov 2026 20:00:37 +0100 (CET)
From: Willy Tarreau <w@1wt.eu>
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, Randy Dunlap <rdunlap@infradead.org>,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        gregkh@linuxfoundation.org, Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>
Subject: [PATCH v2 00/14] security-bugs doc updates
Date: Sat, 14 Nov 2026 20:00:00 +0100
Message-ID: <20261114190014.17826-1-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
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

Hi,

Here comes the v2 of a new batch of updates for the security bugs
doc, essentially to make it more readable and to address some of
its apparent contradictions for those not reading it entirely. Some
additions were made to explain how to send a patch and a reproducer
separately, and to ask that first-time reporters send a single report
at once first.

The first patch looks big, it only reorders paragraphs to fix the
current mess resulting from minimal and incremental updates we've
done over the last 6 months in reactions to some repeated mistakes
found in reports. This accumulation has resulted in certain topics
being discussed in a somewhat inconsistent way at different places
in the document.

Aside this big patch (which only reorders, doesn't change a word,
which can be verified with "git show --color-moved", there are 13
small patches each touching a single paragraph.

Interestingly, I discovered that the list's address was still present
in historic areas of the netdev doc and in submitting-patches, which
could be an explanation for the non-negligible amount of reports we
receive showing proofs that the doc was never read, so I've fixed
that as well.

Changes since v1:
  - drop the security section in netdev doc instead of trying to fix it
    (as suggested by Jakub)
  - few grammatical fixes and from Johan
  - added the Johan's reviewed-by

Thanks!
Willy

--
Willy Tarreau (14):
  docs: security-bugs: reorganize the document without changing its
    contents
  docs: security-bugs: clarify when to Cc the security team
  docs: security-bugs: never publish reproducers of bugs with a security
    impact
  docs: threat-model: clarify the case of automatically mounted file
    systems
  docs: security-bugs: explain how to send a fix that can be applied
  docs: security-bugs: do not send archives or binary attachments
  docs: security-bugs: first-time reporters must send a single report
    first
  docs: security-bugs: explain what to do when a report gets no response
  docs: security-bugs: reports left unanswered for 7 days will be
    dropped
  docs: security-bugs: add a section for maintainers receiving reports
  docs: security-bugs: explain why directly sent reports add extra work
  docs: security-bugs: explain why AI-found bugs are handled publicly
  docs: submitting-patches: defer to security-bugs.rst for security
    fixes
  docs: netdev: drop references to the securit list in the doc

 Documentation/process/maintainer-netdev.rst  |  12 -
 Documentation/process/security-bugs.rst      | 409 +++++++++++++------
 Documentation/process/submitting-patches.rst |  10 +-
 Documentation/process/threat-model.rst       |  23 +-
 4 files changed, 300 insertions(+), 154 deletions(-)

-- 
2.52.0


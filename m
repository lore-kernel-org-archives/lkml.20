Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.159.59.229
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794682858;
	b=4u2BcNjlkI58/fbvRDjDf0MyVfooBB19V8E352iaDAnmxkOO06/EC15khVrbZCZ4/ZKH
	 PWyR92OKSOY9vhKmn/jwzQy4y9ashB/rTTFB4/89x7ncNjyH7nXqjKTws7wkzAZQoFzlY
	 /k6Pb/I7ZqzFBjwnxXMjCbBM6mFhFM/1kfTRjFNKL2r30OR2RIQUZPfpnvhNFSIHh7EUr
	 evkOgZSLRsXP/twVXfzYBkl2X3H3PyReMrLhSkJOo5q57he8nTb+hnob/p+psDLxAvH7Q
	 U1Tygsy6nIrrsIHP6CMITSc0s1xkP1qJoevvoJd1fck2814fEGu+7xSfpCCzv+5nveA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794682858;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PpyIN9dgNCqcZNJmMZOkfWMDQoTLKiHYAG5EAb8Z1Yo=;
	b=roAOEs9BEm63NPKnE7lJUUiJYPzATFq8saVAW3sZSzHunDzDEeilyr7qC0z3n3xHk0VQ
	 6AVMByLF+J7Gbosab03W/e2okN1c3K1UOsqJw5kLu924iBTO3YwyN4PHcewJizNPUgpHV
	 yAgFr8HGGOC3nUk9eudRU0hwY7RBMw12cwhhia5Jyo49rgNTOOdHZNf4ELMYrGAVVVDTZ
	 mgOrDReCkL5h+o44b93DXYCoHAVRH3ZwgKEx4VPMDXJj65vIlUhrAtpM6YUnqLKhe+BEf
	 ip/jsC0sDuAy2kOLRFFxFxSLOR2QApe/0Mo5yHTsGIWPA8nvQKWsG7xepSZJT2BX3Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=1wt.eu;
	spf=pass smtp.mailfrom=1wt.eu;
	dkim=pass header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=jZafHkuH;
	arc=none smtp.remote-ip=51.159.59.229
Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17997606A881;
	Sat, 14 Nov 2026 19:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17997606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=1wt.eu header.i=@1wt.eu header.a=rsa-sha256 header.s=mail header.b=jZafHkuH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1794682837; bh=PpyIN9dgNCqcZNJmMZOkfWMDQoTLKiHYAG5EAb8Z1Yo=;
	h=From:Message-ID:From;
	b=jZafHkuHQS8HAKsCipAvGRRzSPBD7+9b2UIXRxeaoSj7g/IxK45I76zXw80hRKMp7
	 sxe8KeKAlaK05Xo9BOptvkF0FVbRM+Qj2Q0zJ1Rs5HHNwUZNcNLjtayJFvBeRzQHLo
	 vWETNxpGeGDJV3EimnZnyV7v+1Roj5/O5r4sYT3A=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 4809AC0960;
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
Subject: [PATCH v2 09/14] docs: security-bugs: reports left unanswered for 7 days will be dropped
Date: Sat, 14 Nov 2026 20:00:09 +0100
Message-ID: <20261114190014.17826-10-w@1wt.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261114190014.17826-1-w@1wt.eu>
References: <20261114190014.17826-1-w@1wt.eu>
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

Between 5 and 10% of the questions or requests sent by the security
team or maintainers to reporters never receive any response. The doc
only said that such reports "may be abandoned", without any indication
of time, and team members keep collection of unresponded threads in
their boxes just due to this.

Let's say that reports for which requests remain unanswered for 7 days
will most likely be dropped. This matches the maximum embargo duration,
which is how long the security team considers it reasonable to keep an
issue private. Also remind that concurrent reports may cause the same
bug to be addressed by someone else who will then receive the credit
in this case.

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Willy Tarreau <w@1wt.eu>
---
 Documentation/process/security-bugs.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
index 82ece82ecfb75..992c8d8d9b1c1 100644
--- a/Documentation/process/security-bugs.rst
+++ b/Documentation/process/security-bugs.rst
@@ -382,6 +382,14 @@ run additional tests.  Reports where the reporter does not respond promptly
 or cannot effectively discuss their findings may be abandoned if the
 communication does not quickly improve.
 
+In practice, a report for which questions or requests from the security team
+or the maintainers remain unanswered for 7 days will most likely be dropped.
+This matches the maximum embargo duration described below, which is how long
+the security team considers it reasonable to keep an issue private.  Given the
+number of reports handled in parallel, the same bug may also end up being fixed
+later after being reported by someone else, in which case credit can no longer
+be guaranteed.
+
 Messages sometimes get lost, especially those containing attachments or HTML.
 Since the report is private, you have no other way to know whether it was
 delivered than to ask. However, some subsystems have a long report queue, some
-- 
2.52.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801415;
	b=x5YqjJsZIIsmYQedBPWYA2IDFIRmiYtn+tUqxsBQfge23LtuKTY552vZ4NIKBwyjWaRM
	 eKuc3Csxgm8t2CiIfNZQ9WO2S1A2e0XrqGMCLc0CykSuUhhm/eQU/Hwm/e6CqYF6YYhBT
	 OaR12tpuzc1oray9jtQYJga1k/rCZ4kjmXGNTs/0KadTb14Qt/5V+7Gv4gjiq9T8znN7w
	 h1EgKKqcRGSZafpJrw9j8mLbLSW5+sXYppEEYZ406YBiaxsy4sVp3SJqm+RHI7drX+YTW
	 mOzPKHQ3aMVbV3eg7boWmg7v7poUWIIPEhkozI6l6ksHBsDdlO3z9vjs+nrqWCL267w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801415;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=A2h+cBZbrdK3KfGEBVHJ/qn/6mirzFd4zLuXbF2XG/w=;
	b=d2XrqzdJN3hqqeKu5SUiznTkIh8BhXR707mrUqGhpE2/N8b5hoa0u639lb1+OyrhZdF4
	 /YCVrN24hxIA4m4fvk4FgzNkQMsmt4kAjFiru3So1apXCmOOxXxB67spSr6CHnpNw7LD4
	 +JgUOFm01lmabsDuTmBDYIQACjP4SDUoTzsUsA9nvdLbD1tgKRNeWyqC41QpseYovZspu
	 au+FEET1apI2D+p5LqH1/ouzeHATZ+BkbAga+cfrIMd2WtnWGp+a+IrSgAiyUbEC3y5Og
	 J2vchewNCuXt8EnB12Hq3ZTBPEJeWF9dlg3R/EA8hRZqXz3tvUQaSE+s/emIoKJhapg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=fyx1h7mK;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4218606A31C;
	Mon, 16 Nov 2026 03:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4218606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=fyx1h7mK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=fyx1h7mKqBT4oaMVXqpZ6om/2Fpdu3BNK0ZjcDm9/kB6ROA+Q/wjyLOIW+T5gHUHM0o/scZsYJf8k
	 S5483SvkCeAnLwRM9owP8R2igfkOyRE90IHoQveE1m3gxr4xXfO0T3As2zJ7vyNeK6QcGboz9aUXkn
	 WZJCLPNJk/0pZ+bo=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app03-12003 (RichMail) with SMTP id 2ee36afa7f03cfd-c7928;
	Mon, 16 Nov 2026 11:56:52 +0800 (CST)
X-RM-TRANSID:2ee36afa7f03cfd-c7928
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from openEuler-24.03.03 (unknown[74.82.203.40])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66afa7ee7fb3-7bfd1;
	Mon, 16 Nov 2026 11:56:52 +0800 (CST)
X-RM-TRANSID:2ee66afa7ee7fb3-7bfd1
From: Haishuang Yan <yanhaishuang@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mina Almasry <almasrymina@google.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Willem de Bruijn <willemb@google.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Narcisa Vasile <narcisav.kernel@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 0/2] net: do not run out of frags in alloc_skb_with_frags()
Date: Mon, 16 Nov 2026 20:56:18 +0900
Message-ID: <20261116115620.18151-1-yanhaishuang@cmss.chinamobile.com>
X-Mailer: git-send-email 2.43.0
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

alloc_skb_with_frags() can fail with -ENOBUFS for a data_len that passed
its size check. Patch 1 fixes it, patch 2 adds a KUnit test.

The issues were found with the help of an AI coding assistant.

Changes in v3:
- Patch 1: check the frags left only after a failed allocation, with a
  shift (Eric).
- Patch 1: say that the allocation still fails if the retry fails.
- Patch 2: skip only if MAX_SKB_FRAGS - 1 order-3 pages can't be held
  at once; one page was nearly always available (netdev AI review).
- Shorter changelogs (Eric).

v2: https://lore.kernel.org/netdev/20261110162418.28322-1-yanhaishuang@cmss.chinamobile.com/


Haishuang Yan (2):
  net: do not run out of frags in alloc_skb_with_frags()
  net: add a KUnit test for the alloc_skb_with_frags() tail split

 net/core/net_test.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 net/core/skbuff.c   | 33 ++++++++++++++++++++++++-----
 2 files changed, 79 insertions(+), 5 deletions(-)


base-commit: a45dbf182137275f44ad7c8bc8acd23f7af6b2cf
-- 
2.43.0




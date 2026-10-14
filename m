Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5FF37DADD
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946406; cv=none; b=IHIpbAv3aCANLVTBhXiZ3oVHTJCKojn+7u+v9fouswwdJsAUf4l3/Har5Hu9C6VYhngEm6lCAa4l0G8ssL53Jp4M/gdcFOe8NUwatUmIhqRkaP0FdlFAxaDdsenbXlbwZrtbaZpPTF5W/KxbY1AGJbApLhFKpY+9V/bJWcuKxqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946406; c=relaxed/simple;
	bh=21pyKGK+IKg/zTXev+HEz90+q9KFZmImFzV+iA62bcw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b0sbS2PQHUP01SliAYhIYISs1yW/yCXd/KkcpSygi8SWCCKZtwbAWtu/RuOi5P76+vDpW1Ktn1xTYcAH66HfWTQUuLNdbmLhoHAkVXdFRfEjdlVzKUPNefH0olMr2jKPHacs5ZZA985Kdlern7lCN5Q01DuAHu+M5ZYxJPGgCTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg; spf=pass smtp.mailfrom=gt.tech.gov.sg; dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b=KUF0FXw9; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gt.tech.gov.sg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gt.tech.gov.sg header.i=@gt.tech.gov.sg header.b="KUF0FXw9"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550c917fd3so716306eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gt.tech.gov.sg; s=google; t=1791946404; x=1792551204; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oY2fKx8mXWxNmYV5ihzs1KI0duZG3Xnqm3LRIyGvrJU=;
        b=KUF0FXw92jXFptAE5i8/1mzTQvnyqKxTbcLrQYlwi4zXVdVyTcDdf9xsZcVzH6JsSu
         7Mpe63/xZ0RsYzLZMfjTZ0FmsuCIO5/mpEEGQgLRAhAYGVT6mRKWuqMY6nFLEVl5DvE4
         1N3pE69QFJtdIY2On4zA3sW4Jq5x0nqfJdnl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791946404; x=1792551204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oY2fKx8mXWxNmYV5ihzs1KI0duZG3Xnqm3LRIyGvrJU=;
        b=IUwVE9R/ofAnLCOPVd2zxgvHFcOqi+3Jn4GxiBfluNQcz5DecN2NAfkI5CEHrJOXAH
         5b1X8YDuZWtBhN3P24qvfxz5WduQYyH3lyRS6UZH64SYSPyCbLYMlTrEEXFP/qpj4QPF
         PqWK+Z9F0UnjH/ScW2sr2b7sAp6PlaUwgA6CWSQvNHjainSOL8ZpmV733+enDSemJEeb
         xcFD4/vyhr05RprbIK6O9HuEghSZPhX3eT17Q1RenW2hXBPsg2SzNswb6AZpss33GcH6
         vKulVT63xlyd0Qy6VuezwsPevwkuRVq+CZxBTvnBXmWflPbfKYTuwF+OexHtKOlqDDw6
         OIBQ==
X-Forwarded-Encrypted: i=1; AKwUvBxajm+juCOkTP4SD0xiNf8qXof3moTO35JUuoBmOI2CpD1FvSLF3tUnTGlyGo9QLTWauVdvMgZirBbYZV0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOTl7zPcK0IJSCWI+P1WOjr8cFaq7xQjYYOmYtTYmztkRJGZ23
	7rZRVYerXGQGDBuOsKPyTqVQ4jWgwoz21RIPEkNokBAhOV5I9+tXzjhWLNQucB6zURk=
X-Gm-Gg: AYBFou1C04slD8w4qnFgFgUvcm7C72jyNGAtLuTiyP/DFvXbmc4sj9Prd/HfZyynbnV
	gJhYjyDxSy/qfuqGauP9Bx3MqvGzqkrXrgZqh7XqL6SorbjpRL5U9FLkvxEHjTZNyWKh7i+oqiq
	dTpYtfio+FVepEcvwRb6bAEhTUskay8Etc1jW+75RCQA1wXIfyMqFjwqPedtPBK8cI0hxat2T8Y
	YXhP+ifuNvIM3rzJpLgAkG/QkPlz5ORByEIE7/izm02oz2xZW0sLP2WOqtaogGoGWD2JnxzhZ3P
	RCYkUZdfw7IRtdB0ppl37TyCFjz7HVyV1ETjNGe2XnxPjG0ZnxxF2NmGRHAylrEKMJhyg5LiVrk
	a8xo6WZJd74yDJcbRLSQY8Ft0X2YrJxmjoDCV8bqk4JuLwJdAmNCQmY34d3mo06BwwG8jWWmqc0
	NVhSRSkJZVKTsthQjRf7DldKPVb1aZBcCL8mGH7/3zOjrtmwlWZ92dK00UlHHK1rPn4RRfzVG+J
	7mCOuCFpFTd3JmlCT6Nzoz0C9o=
X-Received: by 2002:a05:7300:8256:b0:35b:782c:aa29 with SMTP id 5a478bee46e88-35b782caf17mr7301083eec.33.1791946403882;
        Tue, 13 Oct 2026 19:53:23 -0700 (PDT)
Received: from LAPTOP-UUUVNN1I.localdomain ([129.126.57.197])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm46522557eec.28.2026.10.13.19.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:53:23 -0700 (PDT)
From: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
To: Petko Manolov <petkan@nucleusys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Wei Jie Law <98lawweijie@gmail.com>
Subject: [PATCH net 0/2] net: usb: pegasus: fix receive length handling
Date: Wed, 14 Oct 2026 10:53:05 +0800
Message-ID: <20261014025307.25233-1-law.wei.jie@gt.tech.gov.sg>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes for read_bulk_callback(), both reachable by a USB device that
identifies itself as a Pegasus II adapter.

Patch 1 fixes an out-of-bounds write: on the 0x8513, every frame that
is dropped because of an oversized length field advances the receive
buffer by two bytes, until the host controller writes past the end of
the skb data area.

Patch 2 drops frames whose claimed length exceeds the data actually
received, instead of passing the uninitialized remainder of the receive
buffer up the stack.

Both bugs need a malicious or emulated USB device, which
Documentation/process/threat-model.rst treats as a regular bug rather
than a vulnerability, so they are posted publicly.

Testing: the series builds without warnings (W=1) on net and passes
checkpatch --strict. It applies unchanged to v6.12.105, where it was
tested on a KASAN kernel with a device emulated by raw-gadget +
dummy_hcd:

- 3000 frames with pkt_len 0xfff, then 20 valid frames. Before: KASAN
  slab-out-of-bounds writes and a general protection fault in
  skb_release_data(). After: no KASAN reports, and all 20 valid frames
  are received.

- Five each of: 1536-byte transfers with pkt_len 1534, 1535 and 1536;
  101-byte transfers claiming 1500 and 97 bytes; normal frames.
  Before: all 30 received. After: the 15 that fit are received, and
  rx_bytes matches; the rest are dropped.

Both bugs were found, and the patches written, with LLM assistance,
hence the Assisted-by tags.

Wei Jie Law (2):
  net: usb: pegasus: do not advance rx_skb->data on dropped frames
  net: usb: pegasus: check rx pkt_len against the received length

 drivers/net/usb/pegasus.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)


base-commit: af32da41b0327b9c6a37856ba82b6760d6c8d10e
-- 
2.43.0


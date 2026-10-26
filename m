Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016258;
	b=y5gr8D+DrHh547juukiYNo0+W7RPaB7FhXy8s48bXF5GpCRsfmhDWiSgY5NOHPUg+EwI
	 Xdllgz9e7QdzV48l4SrClqejWSl5b4AyKVFPI7X6cLHmyjBgrKACAI/HrDVn+Hdq9HZJh
	 si0lbc/lCbiQlmlq1FnLKFMFJ/ZyRQTXsZVkYE8+eJ0CJyuqXHJ5O0Q89xzq0lsiVeJE6
	 xDm+s8UJL0vTJwb62gugbXiBa7QnJtSwMnOEYNdi6Q0NFxi6AhgRTwl3yiXhGWUhuhtQZ
	 JbY8Qxl/qrUKYtBHAPIFRnQpom5Hoz72+E6rmbEWaKXcIqGFvJZDh5fXzjpLL5lAA5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kLE4fUltKdv5uUw+RRFjSPgUp/UfLHROFugaciW1IrQ=;
	b=FhouvSDrRLFWWdJTmdoOL1oxo7H1y37XjgfB/tqZjzHWAM3rBba5AZoLcM87qIuJ7Pg1
	 tcCoiT24gm8TdDWoQbnS2uVblOEkKnKeFH39r2UMaXAxpmEW/TxCs6q0dmotzGigsWQ16
	 Fi8AOgr/nd6VpB1pVcXIxrroIaTkEQyx1pJGcyvs5wBG4H7UySvpfCQKyBj/T3AhnTa3X
	 n+zlBRJcTIsXmprgaSXmVXHHJM+RAoPZ7r3WQvuEG/4Q15iCWAcUmj3Isrx0ZjlJKFYd+
	 ZaHpcq3MQXEI5EII98I5totF7cBebgOADWtY60xGFExxP5V9xVKaXb2kq9VXxMVZfRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="c44ex/XP";
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74754606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74754606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=c44ex/XP
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so1138168a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793016258; x=1793621058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLE4fUltKdv5uUw+RRFjSPgUp/UfLHROFugaciW1IrQ=;
        b=c44ex/XPmtqTVtiuqa/0GcvrFN4lsMr7UlokOnm3tm9vhaHcNfNJKiEURU+QVnnbv7
         77acTuyynbe0+PdVQGEaDijC3a7byLiox8BIL3MBqsKZF4Ylc+eAEO0vdFwsakKv8zDQ
         bfQXgM1jf4PGxlPRskyEuXcfL9qFOpE/k6BIeA2hGli4kIbXYD+1pH3VoTPkhxeon4Ax
         sso5eO+f7PVempwkWje+R68n+7ExMEGVIU1a5otcmxh6MYp2b3U7D9XsyeUQpM8WZ+zJ
         2H8tZnia2t1DL3MjtZuDJBqozookU/+h1WpjEl6BQ0vmR9nDamBBByuTjYa6jFWOaGVU
         s4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016258; x=1793621058;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLE4fUltKdv5uUw+RRFjSPgUp/UfLHROFugaciW1IrQ=;
        b=Xomo2G5fs7r4Q49Uu7W1794QDfzIvSyNbdto1Hz3clE1t95E3pYrStsWqm27YsOJ6D
         uTDsSMiw1+U9/ZCoFz8GebHyqkxnCnTqWFQounTpPywhn3iA6M71MFU6HggTvsfffQIT
         0MMYwY0wwye2at2m6FuqBQWfIA0IdtCKCOuGJOHoSBveJtdt1S41q+54Q7ucW+9tmI3e
         wXVexnY8jucM1VEwdHStV0qso9lRkTB+LagToRSpK62n3yc8v8dQ9YBwy0L+j8apE69x
         2ySCVd2MDmpJgS+XT2zamt4XCeS0Jq6vzbFHcF9qUWUal4IS4RwTEORI0hn0d2Z+8lCP
         s2NA==
X-Forwarded-Encrypted: i=1; AKwUvBzWSRbOn5EuCVO5BjApSURxM5I+50wsmRpIqgewg0ZaoKDy6Anu0UO9WnWTggsktlo5b+8goy8yrfAG+rk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgSoZOetulmOl+9R5WD1+GOB6DFVIZxgPh29nP1Sy+fGsAg9Y+
	kKg57pk/NuVBa9lDc0PyuHVj1nVXLmJGad1atNIXcZzo9fRuFbeExYkf
X-Gm-Gg: AYBFou3pafzJBFBqGkw1Pp2Y4ajMW+JA3VnJoMZe0U7JLyboGIG88ImctN2GO5DQG9U
	+sqpeIsZCPDt6lZF0++bsayH+pWrlZ1JYZp4jjuR6DYPIMDFShvR+mlOGdB8b3WSCuJfGaxQcWu
	c+KwhJj91bhg5jMOdtpxCPbO0+02oBRCVjGDPIOxnPwMpBDUVT6LNPje5KDygssp4u6xCYlWLcR
	7F4jhIRmwOJ50zIFTugGQZz52DYcnIEmmMZpKSJ0txOQfe4MDl3trUVWXMlzIrDwEiCIzUuyQhV
	5tNcNjKYTSYSHvQ51Hxw1wD8V79eQmUKNs7U3ewVrTy5/Reg2Vn3Oos0VH1/5lDacequByaIWhH
	he8s5c3hcEj4utb3HvmjdJK/q3UE5QBy9MznrVX+1WMJJyOnIwmqpnETXrhbHMqKPLBUG+M4pF9
	d5zfE60eW2q4yG3e1q+0NYyTwsLfQrPKo4ldMWPeYSXLy/M9jU+9aMUPBk2+yZTx/tdn5hLP+dj
	GXIbFSA9EiT6Nm5fCDPZazueDRJku+PJadv7a50sflzvH0rZ4w=
X-Received: by 2002:a17:90b:2e8c:b0:3ac:8897:7b9f with SMTP id 98e67ed59e1d1-3adeae77a16mr5287757a91.43.1793016257392;
        Mon, 26 Oct 2026 05:04:17 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebb0639bsm8298309a91.12.2026.10.26.05.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:04:16 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: matttbe@kernel.org,
	martineau@kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: geliang@kernel.org,
	horms@kernel.org,
	netdev@vger.kernel.org,
	mptcp@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH net 0/2] mptcp: subflow context lifetime fixes
Date: Mon, 26 Oct 2026 20:04:07 +0800
Message-Id: <pm-mptcp-objects-candidate-0010-v3-14c229ea28a7d31f60a0-0@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Two use-after-free fixes around the lifetime of the MPTCP subflow
context, both found with KASAN.

The delegated-action queue pins the TCP subflow socket, but its queue
entry is embedded in the separately allocated subflow context, which the
ULP release frees on its own. Patch 1 keeps a retired context attached
to its socket until the socket is destroyed, and lets NAPI free a
context that the plain-TCP fallback dropped while it was still queued.

That context also owns the only reference a holder of the TCP child has
on the MPTCP parent. Patch 2 moves that release to the same socket
destructor. This covers a BPF program that converted a TCP child with
bpf_skc_to_mptcp_sock() as well as a delegated action that updates the
parent after the ULP was released. It depends on patch 1, also for
stable backports.

Cen Zhang (2):
  mptcp: keep delegated subflow contexts alive until socket release
  mptcp: release the parent socket reference with the subflow context

 net/mptcp/protocol.c | 18 +++++++++++++++-
 net/mptcp/protocol.h |  8 +++++--
 net/mptcp/subflow.c  | 51 +++++++++++++++++++++++++++++++++++++++-----
 3 files changed, 69 insertions(+), 8 deletions(-)

---

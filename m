Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794437514;
	b=LCLZTxR6aLU6Zd6mgidWewUgElV+Rd2VBKAeh4OYSPL0hXZt61hmfRFDVAPYChfGljIc
	 N9CcWYNaWcnO2NXSXaj3tZ7DUecTgRcAi6TqjszrRvnUwwQo+WuFpyzkeNUOTd2cpWdhZ
	 20aruo7LRA7ry76ZAB0rYvp+YYMxy6XpAT0+wjwot8ogHXNBw77xMeQ3/UzxX0zCtLAm7
	 8tQuVfsfNSd/L6VwJqqI7gZtu6Jkl6MIzQi764Qj1tLAHHza4BhYax9vhLbp5Techc9za
	 jWJ+kKqQ7yJVF4cb5G4vjghM29WQcTqZcOp7xlfo/0ThC1KgLqK0rH3rgtrUx2+upxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794437514;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=79ck1+vplnf+OrqiJIbR316gc5vOpfUXfVT8Q6jXBBg=;
	b=nwBLllA16TtrqPchS7d6cVKd1Obr0O9GZrV9dEPrSx88nKZykZxeghTlvSMRyvL+C87B
	 xR5oR5TTt09qz2BQ3Siv17kBexzN2v5G38aXIU/oqRa0JXkCIPaiw4fLM7E65Tsu06LXT
	 tLUizcj2z1paCH/kmMpgcznWw+voSOQFB7bhqqQetrZEJEVMY1/+K3OWSaNGrQfoNTD5H
	 xalSg7ZQHfPOL0cCwJp4NAgnmGVu2ytL5QT5OV88HiZtXHyRjwddhyAk1ClUsHTHEy1Qc
	 H2ZccpBuQix9irF66YLSlO10J2tEmFPfssttGD0XeYurb6DQJRpJggY+n/AsPxUiboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmG84sQ6;
	arc=none smtp.remote-ip=209.85.210.175
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A0C606A889
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84A0C606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bmG84sQ6
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so305851b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794437514; x=1795042314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=79ck1+vplnf+OrqiJIbR316gc5vOpfUXfVT8Q6jXBBg=;
        b=bmG84sQ6jOBx5Z1z9eiqgOqzF0G8a49vw2wPdyPszzMsTt7FCkfkAumUU54CrlrSDT
         PeLNPVl4JYb0ZWMpPKqjUnU5JGWs6hH1zxFRntKvVnT2MNYr+lmcstg/A8uXxtRP3rKG
         O3iMMDAOh+rRptveXwnFSlFHPOLBPayAvuBKwGm0bSZ1hUqAtoikIMAGfdXKSIPqq9jS
         mZITDYkY9hKvMztmURdKb2OUOt6LFgtuLdJS8Lq+JfoKBC85y8FGvpX/q3nsPhKilMla
         AQLn7aR1/8nqYxex0Ea9GCB3vrs7X8DvYYmNTMU1qa+KuaSfi8goilPXbxzJM5FOHHeD
         bH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794437514; x=1795042314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79ck1+vplnf+OrqiJIbR316gc5vOpfUXfVT8Q6jXBBg=;
        b=Qd3QVHxtPeG2AiBLa6U5L6k6lthXs2TboPn/Wb2C4IQrSwxPpPWOaeOXCV+Qabna85
         T9x791JiLz85dn6yJzmBR+6QRlm1G1LAWudelQ822DpuDlIpCSZm9mPFkfdqps4JAmK+
         8hteSo0jT7fIMiBTqpTNzXMvEAvhl5bAtT3pDIgc2X54wX5tQhJdmIh0oBP3tg5k4ayx
         7wmfCEy/fBIGW8+eV/gFFBZaDL9/goaCDMzf/+GtDTzYHhDxN79rWFF1lmPmIRHe89Qh
         rnO2TmnZBzXtn1BsU6zL1WpA/7wakn9lxTE9B7JwV1U3uv1DE0oPZREj04uH71wHnL9t
         BcfQ==
X-Forwarded-Encrypted: i=1; AL+hErGR+fQl2mreJSVhfI0dWIj/jH+JTQrRNQ88kfDAORK0dqz9bKZqV6Mh7mNxFJ32xvM9z03Uzc2mTpdi2P0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/AUPdkL9bnXtzIZRLBW0YTUb4K+HcePjx2FGrdQj32q/gJy/JB
	DjPpkg1hUUh/xtRdYlSqkuRM0wyTO/6lPsarO/WOgF5FTY5g+KUXdRBL
X-Gm-Gg: AYBFou0LGF1kw9e+7duSEe1s4S+akd+tau8pl+6i2zzHl0e5qgUhUDgUHNpsDTw8SIC
	5guhjyUemcFx6Td12SVfc49TBDSdkqT34RVN3wNHE5nxiSQEgf2jlpyMwhi43ssFPOZ+ZV+idLH
	1vXJVq1A5WUK6GEQbzgn//HnGiCBatIxQtvA9Ycv0erpfzc2fKua3F+MD6v+59RqrMVcNHdOjVn
	iOJDBWRXqOlJ5wgnVQME9/b4I7vs5Pi/wvM4MdXGyW/u0R2CUojWwE9Nb0MryhziSneTGL3nuxc
	QQTzxKgGdhGKKuSGFeYRbQSK3peeyY4Ehm+HOGbmGoEktZLFozxEQHtRA1IZDlVGTkbwbqjK6NT
	uwJL2STBC0qG2l6Y/eaYsc9Wk+V0xPUWi71AHG7z3REgcqM637JiuvrGjLnIGNLts5hQGHjRYOO
	czmkT/mqTqU6uYiH8E43NZBG2HLRlOLLplpXOmga0UmeScufS07CF28fYNYHXg0IE55GeSGMRjT
	PLNcYvZuk7O43zMhoOMSqwhrOlKs4tTT/Wj7iUH5hd7cDpSivYUFh3vlquFTsea0VZqxMc0Dl06
	0Xwdw165dJ/q6/M25B0rYMKhRNRedgHwpDd50OP4ftIjoIbQ/MTC4NaeQQWYT7VZ5vVuH6dhUWT
	Su5DQlo5DkD7AQ18NncJhw9IYK5qZSZZUJefHTz53dOjZQewscfTr/GGMO8Vr6AERgCa/Yym6iV
	iuiEYFbP8SuNZN/ilStEWSsGf9fvXxZc4UIVuEDjI6
X-Received: by 2002:a05:6a00:23c7:b0:89e:71df:d6da with SMTP id d2e1a72fcca58-8bc196faeafmr3981172b3a.5.1794437513734;
        Wed, 11 Nov 2026 14:51:53 -0800 (PST)
Received: from sid-dev-env.cgrhrlrrq2nuffriizdlnb1x4b.xx.internal.cloudapp.net ([4.155.54.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa86dd0fsm2471575b3a.22.2026.11.11.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 14:51:52 -0800 (PST)
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Kirill Tkhai <tkhai@ya.ru>,
	apais@microsoft.com,
	hargar@linux.microsoft.com,
	rlmenge@gmail.com,
	egoriluk@gmail.com,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Subject: [PATCH net v2 0/2] af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected()
Date: Wed, 11 Nov 2026 22:51:46 +0000
Message-ID: <20261111225148.88506-1-sidchintamaneni@gmail.com>
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

This series fixes a u->scm_stat.nr_fds accounting leak in
unix_dgram_disconnected() when purging queued skbs from
sk->sk_receive_queue on disconnect, along with a selftest:

- Patch 1 splices sk->sk_receive_queue onto a local list in
  unix_dgram_disconnected() and calls scm_stat_del() before freeing each
  purged skb.
- Patch 2 adds dgram_disconnect_fdinfo to scm_rights.c verifying scm_fds
  in /proc/self/fdinfo/<fd> across connect(AF_UNSPEC) and dead-peer
  send() disconnects.

Changes in v2:
- Drop MSG_OOB patches and tests per Kuniyuki Iwashima.
- Splice sk->sk_receive_queue onto a local list under the queue lock
  before freeing skbs so concurrent senders cannot extend the drain loop.
- Make dgram_disconnect_fdinfo a standalone TEST() instead of running
  no-op fixture variants, and also test dead-peer send() disconnect.
- Link to v1: https://lore.kernel.org/all/20261106051905.218638-1-sidchintamaneni@gmail.com/

Siddharth Chintamaneni (2):
  af_unix: Fix scm_stat.nr_fds leak in unix_dgram_disconnected().
  selftest: af_unix: Test scm_fds on dgram disconnect.

 net/unix/af_unix.c                            | 59 ++++++++------
 .../selftests/net/af_unix/scm_rights.c        | 79 +++++++++++++++++++
 2 files changed, 114 insertions(+), 24 deletions(-)

-- 
2.43.0


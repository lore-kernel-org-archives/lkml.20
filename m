Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796638;
	b=LqfhP+qSVo2lcEqmCMi+V5nOhDT0vxrntrl/rn055I5Ugn76Qr5OSLMUW76i2LSYT+aZ
	 EvafYpAp875G1tvwhYX+/n+sYCMgj8jmGYaLOqvtQoMx4EnKUIUVHOhmkBRvWG3IqXlGR
	 GoVzS79UkFIES+bcEJ4hjMRZwsmC3t/D5itO6wz2X3eU2OkS7nYl4yof9cx+9Rtdwq0Bu
	 ks+CQY0jVUglp8HID9MRh0f3y5gxk+URCWX/D/76yIlrPJShLM8leGR+vBo878z/IL5Fm
	 sndFyvs3+cWre66eBcRJctKmK5owRoCMlY+xdJXbcN+cc7kNKh6oN64eTlGyp05Ut0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=C5mb6nf+FAaI0BVTJRL0UIr+aUTcLOUOBCeg1JSMkZ8=;
	b=e+8NWBv194vwSgDWlH1VtbVLdaJUtReAXrSxBXbDOeJQTf+ZETXGH6ZgoJnQGfg3Sywh
	 1eYF6ewKeLXbzGgwA5qMjO5HxgIsbUwbONC2f3dioeWigroBVdyMXNKBiN24jJeQQ6UwH
	 3QNYF3ph/LOl/gc6XtPgSkaVs/K7JZ64xVuAiFC/hNlkEAAq5Zy0ltTSFLqkzl3rIJA+C
	 9hdPJjXr5B/pJy7WqOjs8xU+m8tv3pCpqOrHaVR+9zy2EeZ73LDsaCAaPKJKqiKMjbi0t
	 Tm9vySWuW63fFpEusn+D7QHGPzrOUML4cZAUegYqIOIr6VVtLefwQG7zSLvTlJIxGww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cbHPXLsU;
	arc=none smtp.remote-ip=209.85.217.69
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889CA606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 889CA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cbHPXLsU
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7d2eba206f4so927460137.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796636; x=1795401436; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C5mb6nf+FAaI0BVTJRL0UIr+aUTcLOUOBCeg1JSMkZ8=;
        b=cbHPXLsU+2/tNpUoRit7PJk2fMqdPTuKKFL4bxq5lGS4eK+xNtP0paVoKNWF4/8zaw
         P93b1vOzhgRdEadX597kwprlBFEKbmxK+6e3hzEFDpW9VtLtVLme/aqHZkNkgT7XT8bA
         4YHf9bolBarrHhiBD6NpDeGHtOPXb0LxpDZcziTafAy4MBIVwaPtrEU75lGjaObE21oX
         /lDuJ9SBy7eoAHFn9SoDQLURMPX3iBOMF6e2L2p02KK/q7i+fSAMunzWR5c/3tZv32Gd
         7OMlGMv7WpYbP6EnvLRnsCKfCV4umm9CJEvxtpYZ9rkwtboKK85aHRucQX1vG1dNGzqc
         i5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796636; x=1795401436;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5mb6nf+FAaI0BVTJRL0UIr+aUTcLOUOBCeg1JSMkZ8=;
        b=P2CWg9hlpVVsk8AuKqDTqLeXJrAHMevrI9q/4ka1EkXqYye6lOWBUdp8m9mOGZkgOr
         8gFzZdAxLrzyvWhEwzgc8OO2fJEYueD4bxIaAYKYPWJUrfvSCkECMVLwI30EMPX1tMcn
         4GuyAFoGflyIOGfXR5RjbqQ3+2ex97oAiBzlbZFpYps5VDWIa25X4Rh6by37J5z0ikwx
         LY+RownrijaPq3QrLmaYxdrmop5POzlCinskAvks/tW1TJe5WY8JnB36dftwv0Ha+34G
         3Gwq3SH/nKHmo7crbgF71lYXKALhxy1+Q4ewSi94RUNZwqYAVXwV5/BHvHRDZMO49tHs
         UBzw==
X-Forwarded-Encrypted: i=1; AL+hErFIMTCWL6CeR0zkmMyNftkv5OA9UOs0pbRiJEk0Rjsj5q0GvyE+TUe1gPLjB5sxxKdCZKaFyBJfGL+2cvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e8RfT/uA0uUEtuRxV07bYsxnB7+SSipJpKs3NYebSHgvaKNs7
	49SR6G8uX/B8IvpOH6opuYyoeirkCJM6SVLX/mG47warzwD+qp0/KRJDY5BupqkN2zeXYNT2iBT
	6nBz/0ePF5k1hpc2wRjXqKfMs5g==
X-Received: from ualq22.prod.google.com ([2002:ab0:70b6:0:b0:999:5998:2860])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:6892:b0:7c0:4d52:8cc9 with SMTP id ada2fe7eead31-7d64d73ad39mr3509745137.14.1794796636284;
 Sun, 15 Nov 2026 18:37:16 -0800 (PST)
Date: Mon, 16 Nov 2026 02:37:07 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023709.132684-1-thaisonphan@google.com>
Subject: [PATCH net v2 0/2] tcp: initialize missing request_sock fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: Eric Dumazet <edumazet@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ij@kernel.org>, 
	Olivier Tilmans <olivier.tilmans@nokia.com>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, Stan Iliev <stani@google.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thaison Phan <thaisonphan@google.com>
Content-Type: text/plain; charset="UTF-8"

Initialize missing request_sock fields for TCP connections accepted via
SYN cookies, where cookie_tcp_reqsk_alloc() and
bpf_sk_assign_tcp_reqsk() allocate without __GFP_ZERO:

- Patch 1 initializes ireq->ir_rmt_addr and ireq->ir_loc_addr to
  LOOPBACK4_IPV6 in cookie_v6_check(), matching tcp_v6_init_req().
- Patch 2 initializes saw_accecn_opt, accecn_fail_mode, and syn_ect_rcv
  in cookie_tcp_reqsk_init() and sets syn_ect_snt in
  cookie_{v4,v6}_check(), matching tcp_openreq_init() and
  tcp_{v4,v6}_send_synack().

An AI coding assistant helped audit the request_sock initialization
paths, write the QEMU reproducer, and draft the changelogs.

v2:
  - Patch 1: clarify how KASAN (via SLUB_RCU_DEBUG) exposed the bug,
    explain how it was observed, and include the inet_sock_set_state
    trace line (Eric Dumazet)
  - Patch 2: drop redundant treq->syn_ect_snt = 0 in
    cookie_tcp_reqsk_init() and clarify how the bug was found and
    observed via TCP_INFO (Eric Dumazet)
  - Add Eric Dumazet's Reviewed-by tags
v1: https://lore.kernel.org/netdev/20261114161248.3428695-1-thaisonphan@google.com/

Thaison Phan (2):
  tcp: initialize ir_rmt_addr and ir_loc_addr in cookie_v6_check()
  tcp: accecn: initialize AccECN fields in syncookie path

 net/ipv4/syncookies.c | 4 ++++
 net/ipv6/syncookies.c | 4 ++++
 2 files changed, 8 insertions(+)


base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.56.0.611.g1030f0b940-goog


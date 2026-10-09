Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C562391E55
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565124; cv=none; b=HgOSxQ1lTYSNCTNPiVWQvQpNHb9jLS6qQhbulIxylaVgnEdD5Z3B8PRu4psweylD/xN479qRo/sUahQCx7zVWfcRV1g6kVkgw3lt0dPYOrrcMsz+bfLf9pIZqYeDClKBfK45cUop55HstqJrvnAp0c611s6Sd1DuLULYYPh7QD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565124; c=relaxed/simple;
	bh=buZ6qltwC1ejIwyTNn15zGgc6lh0GpPbL07r50E9di0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/q3dIbRRetmKJD2ZtZR41hfGiEBM3OylNkGVzK4qeys2oER+oKoLXRfz7w6wcgKjrMmJDs9AUfd44Sqoi7oRJ5P+h0TSBcp2eG1rVgI7WbU4RENKwjv5rDT/Vd7pBR6iYS8QQuyFMoRPVNPpiPehxF7T/tCwkKeRc7DN+5WBf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Blm4zhXr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Blm4zhXr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-86b41d77a05so2071697b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565122; x=1792169922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KlijA4wF7PV1etHWVzlP7RU50laOzEh5e/QgJFQcuts=;
        b=Blm4zhXrRLyFimufOtIiYyCx7EOUslxZgUWXDFI1Qx+xQRs2ICjfR0TuTphkbFJ9AI
         oXwHr7kMzzQ5sqbK6V6P5DBNHdxBasoZ61kwHUWtWPuqnwke6Ru+duelLiL59Udyb9xT
         8W7sMAHi/ZaDL2Rj6hDSf6/8X81ijn+3PBgygzUhzD/0NNba2BqKBjEzygSTv/NQe7ZF
         1Adum989tvGVwivkOLXNgaFWXRwWD3PVaGUXPwa5YUYg/dhoixNPDKnY5D/MwEVe44Oa
         Oj+n1O8MLeMKMzPT7wdLZI8EHqeI9bzFkAF2aut21/abOfktl/qQ6pf7H/rUw4vZxImE
         H0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565122; x=1792169922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KlijA4wF7PV1etHWVzlP7RU50laOzEh5e/QgJFQcuts=;
        b=TLv3lsNZu09d+kQ3RtJsZv3TmPn5RpyU8dYSmXqvXXdwHnvxzKY4avFuU/DYCnxGHN
         1jhDl0D7iCJP7390UCunrvEFuQSlqZ1ixro2YBXw7beb7EcZPTCJh4wTHNLnihnrFhKV
         8fB3tIRJShnQrP2+Vh6V4JCgHHogJEvUguRYqpm69h5+G1a5W5EwEMxMqomn0dPmxnEW
         184gEA6Rt5nyfkaVGfGbWeMHqgoNgBO+LGWGL9haGItZXK8GPhrYUk5j75S2NNtzJR+0
         abA8td5RxM4WOtNv5cYyR/3kB9SnXp8785gY1NlZGtwgT3YKQjOJZqOU2nBTcL6OUN3n
         U53g==
X-Forwarded-Encrypted: i=1; AKwUvBxlqAnKskvLRoeuVR7i+sEutC7iBTBAOKaa7fRkzeqbaTa1AqNzKmRVj2XHj88cX28L7300mTmgvTL9H70=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpsWIgs6pB3ilgUpgldHQDXtyWBUFhCEatrpVUhopadXJd0ju6
	KgRGmcFAkFin50A2j8GZYp2WOj7E/Za8eauK6aRlBh3yobvI82y+LeHM
X-Gm-Gg: AYBFou0G6oe9yFbLvBF9ZCFDUfyljeubVuq3tiKdmKIT7gqotHQBF680Pcw0B4NGUnY
	WN92fO9SoNL7Ni1mFks7gkFtNVKMKW0MAoPcVaQbVCui3eQ5bsYwVhOMiygVEKwM4T6qGxyJqR5
	Mtu1N4ryMkrZIivMPp9adobSow3oMjlQYC4/o2n2ILrJ/DOUfHSQsp29dsQA1HBkatLa2nhGHjO
	yysz2RjhjFwZAsO1ash2QPuLMhApKzsYUAwDsIURP5gbxaqEGxKqu2hHpezEMtW21n2ZeCWLdaM
	LGlFSyY/1mkeg3JEoUAYEAf1Bgg7/p0T8MVyaiaaVuoQi0P7hCVW3RGMU1iXiptVOcCeiv9+GJ3
	aAKZep4egDYO4qZo7udsfV+n5mmp2QaTOuZdHQhBagjmQuwSjmWErRZVGdv5By8oVi1YTIdomZF
	qOMGI1jiXpY9GUsuy8ETv/fpizBebSkzbiygVm9E/fmlKrMEip+tGYFZtp1om1+CtXjqdR0tToa
	v/7tEzMEfrY/AKJTn9noj0E3w==
X-Received: by 2002:a05:6a00:2e86:b0:874:705d:f65d with SMTP id d2e1a72fcca58-897c6e18d04mr2218928b3a.43.1791565122176;
        Fri, 09 Oct 2026 09:58:42 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c37de994sm1494437b3a.26.2026.10.09.09.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:58:40 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/4] net: dsa: motorcomm: TC offload follow-ups
Date: Sat, 10 Oct 2026 00:58:18 +0800
Message-ID: <20261009165825.359259-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series continues the traffic control work on the Motorcomm YT9215S
DSA driver: it reorganizes the offload code and then adds ACL enablement
on demand and flower priority mapping.

v3:
  - rebase
  - reword commit messages and comments
  - fix cleanup path in acl_add()
v2: https://lore.kernel.org/r/20261001204851.2576101-1-mmyangfl@gmail.com
  - move type casting helper into chip.h
  - remove flow statistics and broadcast/multicast policers
v1: https://lore.kernel.org/r/20260926211813.935723-1-mmyangfl@gmail.com

David Yang (4):
  net: dsa: motorcomm: Split TC module
  net: dsa: motorcomm: Use NSEC_PER_SEC
  net: dsa: motorcomm: Enable ACL on demand
  net: dsa: motorcomm: Add TC prio support

 drivers/net/dsa/motorcomm/Makefile |    1 +
 drivers/net/dsa/motorcomm/chip.c   | 1662 ++--------------------------
 drivers/net/dsa/motorcomm/chip.h   |  352 +-----
 drivers/net/dsa/motorcomm/tc.c     | 1583 ++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/tc.h     |  381 +++++++
 5 files changed, 2059 insertions(+), 1920 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/tc.c
 create mode 100644 drivers/net/dsa/motorcomm/tc.h

-- 
2.53.0


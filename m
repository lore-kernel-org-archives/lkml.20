Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610983;
	b=a/GGO87o6rAdx6HwWSYnE9gyzVKvKZhVsR4SVS319cv87EgWOe5shdv4ln1PKXrfmbxQ
	 VSZslYUlmcIyyooqWuwPkUM+DGZs5Qh3HwkDMBypp8Q6uK11t4b11/JGP5WJVjEtJg2Ji
	 zuIZt4qtqINr9M5NsC7WziFcmQthWK3kPHm9NjuMm9D+T7oAdM6Ql4mKqHBtgKYFtwUw8
	 6iVfFlsiwg3TabdJvWBMeljyG31Mk96eGZfi/Q75MPcQxDXWhBju2w1++7VRMbqrcF4Ev
	 5bdhvW0yqIGO0/XQgbbjyMnCEt4nvvkMGioPGjQeUA4xWC9Yixh/vHV6n9NOA8iam9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610983;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AVSytBLebuCaadnUQmEtb0ClDlSDOFCjAcfWpAknlkY=;
	b=mwy4KdHagk5LvcUbrK5DcoFBqCs/G31cXc5trqZ5UCOdYALgyFe7fBQpFto814oGI88q
	 2wY46PsKY1njawVpPQ0/s733F809DRhEgsDneG0yeAm3UauxytAsTmQA1wXjHG51JBoU6
	 ci5w3XHjbskc3NMqsw3iT/SC74o5hqumby7h7e2p6bp/NgcHkn5dtzsX1kGk8Lcn45Njj
	 lAM+xGZAeKMpcfkVz69BaFdABFcI8XaTbitk3hbH74oc/Vpc6G4M1aCmf0o5ICOw7WHC1
	 VCojmLxmNx+xcHQARKLDz9k6l4rcX6Q6zKfbgU+7Ej/k4eyxQUE7ZhzGlhEyzOgFq5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xgY7mcsV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44745606A330;
	Fri, 13 Nov 2026 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=xgY7mcsV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C601F000C4;
	Fri, 13 Nov 2026 23:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794610982;
	bh=AVSytBLebuCaadnUQmEtb0ClDlSDOFCjAcfWpAknlkY=;
	h=From:Subject:Date:To:Cc;
	b=xgY7mcsV24M1V6dNmf4fmwF1qGuIsFqLRlxbey/5C6wbTqQ0RUdaCGWmgXe1sDoaT
	 nytDkoHSguAH1TRAzhmewKdo6F2wzS0xPobE56i6sEfPincnsom13bpYUu/BnoVJ0W
	 WxFXh203eRJ81Et9PprL+f1wf1gdhCL9iyIW7otc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH v3 0/2] get_maintainer: stop sending every patch to LKML
Date: Fri, 13 Nov 2026 18:02:44 -0500
Message-Id: <20261113-get-maintainer-the-rest-fallback-v3-0-36ee5a3e8d13@linuxfoundation.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5WOQW7DIBBFr4JmnakAE4y8yj2qLsZmbNO6UAG2U
 kW+e+Rk00UX7fJLT+/9GxTOgQt04gaZt1BCitCJ5iRgmClOjMFDJ0BLbZWUDieu+EkhVgqRM9a
 ZMXOpONKy9DR8oLXnMzuyxnkDJwFfmcdwfSRe3567rP07D/XwHsQcSk35+/FhUwf3j9ymUGHrt
 fWyb4kac1lCXK9jWqOnGlJ8SXmCI7zpH2ot/6DWKFFZTUymbYxzv6v3fb8Dhql3+UcBAAA=
X-Change-ID: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4
To: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, users@kernel.org, 
 Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
 Carlos Bilbao <carlos.bilbao@kernel.org>, 
 Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
 Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, 
 workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Petr Pavlu <petr.pavlu@suse.com>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3085;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=V8WYeTMsfFzpEBDEJ+2MXQFiTHPfN2pGO7TZK4m3ga8=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK+T1c+w5CwZO2LqtuFPzQLNAP1lvv6c/VucVFd85xrd
 VVMg3dBRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgImoSjIy3PgrtI511WsGpvNT
 BBveTNIUTGHdMJNloY/e81QPH/G3Zxj+R1wJvpd1wux74IvFLDHKgue2/GJYkl3jGjtL00fgXdV
 5FgA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

LKML has become mostly a firehose of patches that are already going to a
subsystem list. The reason is THE REST: it matches every file in the
tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
single patch. During the week of Oct 1-7, 2026:

  - LKML carried 13,641 messages (~1,950/day), 90% of which were also
    sent to at least one other list;
  - with ~2,100 subscribers, that is about 29 million deliveries per
    week for LKML alone.

This problem is becoming urgent and untenable. The increased volume of
patches sent using AI tooling has resulted in dramatically higher
delivery queues and if this change is not implemented, we will have to
start force-unsubscribing addresses that do not show any developer
activity or use similar drastic measures.

This issue came up during the 2026 Maintainer Summit and the consensus
was that "always include linux-kernel for every patch" was never the
intent.

This series makes THE REST a fallback as initially intended: it is only
added for a file when no other matching MAINTAINERS section provides a
mailing list that get_maintainer.pl would actually output for it.
Patch 2 updates submitting-patches.rst, which currently tells submitters
to send every patch to LKML.

Several v1 reviewers asked for a catch-all list that would keep carrying
every patch for those who want to follow all kernel development. That
is a worthwhile discussion, but it is separate from this series, which
only restores THE REST to its original role.

Translation maintainers are Cc'd because the it_IT, ja_JP, sp_SP, zh_CN
and zh_TW versions of submitting-patches.rst carry the same "send every
patch to LKML" advice and will need a follow-up update once the English
text is settled.

---
Changes in v3:
- Rebased on v7.4-rc2
- Update the cover to specify that this is urgent
- Link to v2: https://patch.msgid.link/20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org

Changes in v2:
- Don't count subscribers-only lists (or moderated lists with
  --no-moderated) as a destination, since get_maintainer.pl doesn't
  output them; v1 sent patches to e.g. fs/squashfs/ to no list at all
- Add submitting-patches.rst update describing LKML as the list of last
  resort (Petr Pavlu)
- Rebase on v7.3
- Link to v1: https://patch.msgid.link/20261008-get-maintainer-the-rest-fallback-v1-1-7d26d0b7aa34@linuxfoundation.org

---
Konstantin Ryabitsev (2):
      get_maintainer: only use THE REST as a fallback
      docs: submitting-patches: make LKML a list of last resort again

 Documentation/process/submitting-patches.rst |  9 ++++--
 scripts/get_maintainer.pl                    | 43 ++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+), 3 deletions(-)
---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4

Best regards,
--  
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


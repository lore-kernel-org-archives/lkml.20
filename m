Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792510560;
	b=b1wZhkNoBsIawAVMI3ZOpE8VNWaKSKQ99L78YRUPz24CBpdXFYagoWrAIvsZogUovKyh
	 ttczkCxGsPY2jB3mx8VktA8+5LBaMaNyMQ80DmUZceFKY2F9JYDQ/qFxflk6L5AaFmF7Q
	 w32wP1RjVvLERNr12v9tuwuGNnBQA4apZl5p5IjIwpBVUEKFjfNXvss0Vtmmx7zpdDO2/
	 TdjgmuvdRrDWRrOApaNRRYl6Pjh4nxQdOgQoZuUl85GTDW83j+0JaRBmyF7XV/qZkwBQf
	 uGPRL4jQWR4b+DPGyDltETB11JBJ6qSxkgHjwJ0QXTSFt5Hs1262I61OSAnl55niYPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510560;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=J37MMUbfXf6GAprn6e2bfVu4tJEsMX8jj9Yqith6wz4=;
	b=Uf4cXUTJbT/Y332nbwViFqm0hARYtdXLWbyk5F3y5+iSE3ODqYDw472pAh30MxsgxY5y
	 0dOFY9OoAfP4e3dJzeIDD0iU1h/v+PUw4lDw28yjXD1xYQrKxZCN/hh/jkwyp76I4sDEI
	 7PpWfHVezrXDro87hVfwIDdrnrrltqrth6OvSEwH8b2j1y9MxA/kHrOP6MoglmlcdAqSQ
	 L/tkpIBCPXkBQtrxiL5a8uHQszbb6sAjUM+Co38wPUlJoGGzmryvT5OGwq2hozra1f3Ts
	 7zz22wmJTseyxYb0icm4SI0XUNntq242e+JiiMwT3R2/CYC/2/wLtUIaCutFYtjycHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="Jj/5Do/l";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4E606A31E;
	Tue, 20 Oct 2026 15:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Jj/5Do/l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E801F000C4;
	Tue, 20 Oct 2026 15:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792510559;
	bh=J37MMUbfXf6GAprn6e2bfVu4tJEsMX8jj9Yqith6wz4=;
	h=From:Subject:Date:To:Cc;
	b=Jj/5Do/lBqivksD2Ade5aK8qgRldRLdwL//G4zTQxdqG5hL89lsGJza0escAqlycy
	 dTIWqTNoTu5FCeP2MfkYt2ecu5GgHx3D72L9n9P8siC92vkl9lhnR/mji9feU99id6
	 +K0E0Qw2kBmohTHbcaOAn7+/zpivphbn7ROZKeqA=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Date: Tue, 20 Oct 2026 11:35:24 -0400
Message-Id: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WPTQ6CMBCFr0K6dkxboRBX3sOwGOgAVWxNWwiGc
 HcLnsDFW3zJy/tZWSBvKLBrtjJPswnG2QTylLF2QNsTGJ2YSS6V4LyCniK80NiYRB7iQOApROh
 wHBtsn6BUUVCFKq90zlLM21NnlqPiXv84TM2D2rjn7o7BhOj859gwi933R90sQECppdK8KREv+
 W00dlo6N1mNMb05O9+zetu2L3bEmYnsAAAA
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
X-Mailer: b4 0.17-dev-39d60
X-Developer-Signature: v=1; a=openpgp-sha256; l=2549;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=T/zqreqE3eSIW7rggXai0gaHcGboa9Wp2fdmiFT+x0I=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLKud4X0Csl7NReVle5avXWxzb76s78arGyj8iYmqSXL1
 bRseOvVUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCKC0xj+yvytvLrUzLk6xvvk
 iSs2Ew/NW3v7ud3OjHDpsNu239YviWBk2GTcnLbpWqPhH7nry9Rfeq73KlhlGOOZycLpJWuW9Xs
 RCwA=
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
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261008-get-maintainer-the-rest-fallback-6655e8a648d4

Best regards,
--  
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


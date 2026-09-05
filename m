Received: from mta0.migadu.com (out-134.mta0.migadu.com [91.218.175.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF55744062B
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602807; cv=none; b=Ve3L8KBWNxKBX2BoCRA4Yoi6hEKfjO8MMWfZGFkYHR8gdjpB8OIXBO80Hd4wiRuBYvqSvdvd03vAKkMw8glz3ggf9EaTsJpXt5qC3SPK4Ea5T7zB8XpBZtt7PvBmTiAeK6mgbnxt1XAE9g760Q0R5nsRZ8dzY/Qlb1VIftfin7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602807; c=relaxed/simple;
	bh=24T1CPjX4+jaPgUcD7CVSc/qZByd3m+fY2TBiEjbd5E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LOfa/Y0Fs8Q4QMyVwNlX7IZZRqJ0wBvGz6cLfYdJAF4ibWvsiFCUAfl9k1qRp78iXSM0/JvDDDQnSo/NsHkE2CwycjhG4a69SrzFDMLfAjSb53DbFx04HTpQy7u0VmYBwfvnbo1MIb61NWW57clwzQpNyWLE0j0DLxh6JOb2HF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=QTPw8rN7; arc=none smtp.client-ip=91.218.175.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="QTPw8rN7"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=24T1CPjX4+jaPgUcD7CVSc/qZByd3m+fY2TBiEjbd5E=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788602803; v=1; x=1789207603;
 b=QTPw8rN71P9nAlziYAkQytChsIApe68PoTve6sMmmlTA/ReE+JzcB+MJILYH9xbsaHR4VVBK
 hgkkrnMp2ziPetmc62IpLcft5ENWztdEvih3vkYxURqd6yCVTowUjVLpCjv1mRa4xDTeaMoi2rB
 K7or1/jGHQc+eXn0jchERXwcJ+akA+e5nZrXT9y6I6y2Oh7GVN9Tx/5e8l1enp2CQopEMUYK37u
 u1K4s0dv7rSAcfCq0CzjftElXqYBL86kCWKJzAJd38iYoJII/9KYVmnWjwHuU6iBVG/sHzsWTLc
 3xVje358UrZy7A/gGD9kPjtt2jlojJnv1WybGjhjTVeUw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1c5a665168e845ee;
	Sat, 05 Sep 2026 10:06:33 +0000
X-Mizu-Trace-ID: 1c5a665168e845ee
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Subject: [PATCH v2 0/2] docs/zh_CN: update maintainer/configure-git.rst
Date: Sat, 05 Sep 2026 18:06:24 +0800
Message-Id: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNwQ7CIBAFf6XZsxhKA0FP/ofpgeJC1wMYaNGm4
 d9t69njJPPmrZAxEWa4NiskLJQphg3EqQE7muCR0WNjEFworkXHbAyO/JyQeZqY0sqg4ZfByQG
 2zSuho8/Ru/c/zvPwRDvtkd0YKU8xLcdhaXfvX7u0rGWdVRLRWSu1vL2X2YRzTB76WusXQcGax
 LwAAAA=
X-Change-ID: 20260823-configure-git-686aea09bf5b
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Update the translation of two files:

1) maintainer/configure-git.rst
2) maintainer/pull-requests.rst

I only update the first one in v1. However, I find a reference of
pull-requests.rst in configure-git.rst is in English, while we've had a
Chinese one. So, update both this time.

You may find some diffs are just about style, some are certain wordings.
That's because I find some current wordings feel like a little bit
machine-translated. So yes, diffs are ugly in some part.  Sorry.
But at the same time, it touches many parts of this file. If do mind,
I'm glad to remove unnecessary parts.

Note that there's a warm tip from checkpatch,

checkpatch.pl: Documentation/translations/zh_CN/maintainer/pull-requests.rst:118: WARNING: Do not use whitespace before Signed-off-by:

.. which is caused by a sample Sob trailer.

---
Cover letter of v1

Hi Jon, I added a SPDX-License-Identifier for this file while the
original English one doesn't have one yet. Should I do that? / Is it
"legal" to do so? , if XiangCheng would be happy with what I'm doing.

Also the same concern:

https://lore.kernel.org/linux-doc/20260823-maintainer-pgp-guide-v2-3-bea33b2ece54@wyuan.org/

Thanks.

Note:

The issue above is settled in the thread of v1. Thanks, Alex and Jon.

To: Alex Shi <alexs@kernel.org>
To: Yanteng Si <si.yanteng@linux.dev>
To: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Changes in v2:
- Remove the SPDX identifier, see details and reasons in the thread of v1.
- Add a new translation.
- Link to v1: https://patch.msgid.link/20260823-configure-git-v1-1-3c65eefcc585@wyuan.org

To: Alex Shi <alexs@kernel.org>
To: Yanteng Si <si.yanteng@linux.dev>
To: Dongliang Mu <dzm91@hust.edu.cn>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Weijie Yuan (2):
      docs/zh_CN: sync maintainer/configure-git with upstream
      docs/zh_CN: improve maintainer/pull-requests translation

 .../zh_CN/maintainer/configure-git.rst             |  48 ++------
 .../zh_CN/maintainer/pull-requests.rst             | 127 +++++++++++----------
 2 files changed, 77 insertions(+), 98 deletions(-)

Range-diff versus v1:

1:  c4b4c818df9e ! 1:  74ad4a89ee0a docs/zh_CN: update maintainer/configure-git.rst translation
    @@ Metadata
     Author: Weijie Yuan <wy@wyuan.org>
     
      ## Commit message ##
    -    docs/zh_CN: update maintainer/configure-git.rst translation
    +    docs/zh_CN: sync maintainer/configure-git with upstream
     
    -    Upstream documented the common 'git tag -s' workflow and cleaned up
    -    unneeded RST markup. It briefly updated the automatic lore Link: hook
    -    for Git 2.41 and HTTPS, then removed that guidance because Link: tags
    -    should only point to useful additional information.
    -
    -    Add a SPDX-License-Identifier.
    -
    -    Remove a useless top-of-file label, as Jon always tries to do.
    +    The English document updated the signed-tag instructions to describe
    +    selecting a key with -u <key-id>, configuring a default key, and using
    +    -s. It also removed the explicit section label and the instructions for
    +    adding Link trailers automatically with an applypatch-msg hook, because
    +    Link: trailers should only point to useful additional information.
     
         Update the translation through commit 944df7a31452
         ("docs: update the guidance for Link: tags").
     
    +    Also point the pull-request reference to the Chinese translation.
    +
         Signed-off-by: Weijie Yuan <wy@wyuan.org>
     
      ## Documentation/translations/zh_CN/maintainer/configure-git.rst ##
    -@@
    -+.. SPDX-License-Identifier: GPL-2.0
    -+
    - .. include:: ../disclaimer-zh_CN.rst
    - 
    - :Original: Documentation/maintainer/configure-git.rst
     @@
      :译者:
      
    @@ Documentation/translations/zh_CN/maintainer/configure-git.rst
     -Documentation/maintainer/pull-requests.rst 中使用的标记分支应使用开发人员的
     -GPG公钥进行签名。可以通过将 ``-u`` 标志传递给 ``git tag`` 来创建签名标记。
     -但是，由于 *通常* 对同一项目使用同一个密钥，因此可以设置::
    -+拉取请求中使用的带标签分支（参见 Documentation/maintainer/pull-requests.rst）
    ++拉取请求中使用的带标签分支（参见 Documentation/translations/zh_CN/maintainer/pull-requests.rst）
     +应使用开发者的 GPG 公钥签名。向 ``git tag`` 传递 ``-u <key-id>`` 可以创建签名标签。
    -+不过，由于你对同一项目 *通常* 会使用同一个密钥，因此可以在配置中设置该密钥并使用 ``-s``
    -+选项。使用以下命令设置默认的 ``key-id``::
    ++不过，由于你对同一项目 *通常* 会使用同一个密钥，因此可以在配置中设置该密钥并
    ++使用 ``-s`` 选项。使用以下命令设置默认的 ``key-id``::
      
      	git config user.signingkey "keyname"
      
-:  ------------ > 2:  7a451e345578 docs/zh_CN: improve maintainer/pull-requests translation

---
base-commit: 66fb95a521110da673090294561844c9f76ebe64
change-id: 20260823-configure-git-686aea09bf5b


Received: from mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBFF3F484D
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 10:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602804; cv=none; b=rLLbfygJGFNOinDfcpInQ+1XgqYXoEHfYfs0jJ6WAQT1TBeeEEZMLTFuf4DN0OlhbzEh2xgmOxR1JNw8Wp374rOEIcUvZgG9JB9UQ+ELllzYNLDOiL834kJ6zCAMasBPHz070DqgwDagdrp6pQudub69Ga2iHuokIYkztuVaLws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602804; c=relaxed/simple;
	bh=DJljWi/FDKXT+Grnmn40sS5FMRuuqHi97aHRYZis3sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MQ72SQ/dykeeTdP9c3rezqkdhZ5Sr8jqbGEWo52UGBtvNr0zhPqFvzjreuYzhXiyXHhkA7pW9bzK5+/A1+axoAABJfVHw1lHbxETofYTR14itn6bAnoL8r0PBrtPlOyIjUYySsEJgo1BcWHUjku/Jznhs7CsqQXnmU71w2uVSWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=MIWemT8c; arc=none smtp.client-ip=95.215.58.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="MIWemT8c"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=DJljWi/FDKXT+Grnmn40sS5FMRuuqHi97aHRYZis3sQ=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788602797; v=1; x=1789207597;
 b=MIWemT8czikkYgSx8WCg9KcUFiOP9VQjy5cLJpHzEN0tlQUj8ZfrE/SSucUm3kiInJEnVXdP
 FS+LBNhp3yorbBeO49cV1Pir81+zZLECq6Y8CP9pT6hHXSd5QbWGDs7iur6DgTh6MnOc3YRHNdN
 FbcB9oqmQQvGEjk2caKm7DzCRHm1B9dGSL1iYKIxFWOxq4WulIcpT9WUbfCMLFrZYtWfWaWnsTJ
 1ROSUUyZjrRB32LNQor/T3CP1bTieEwDT/DVDRMvjQg7z6DqQFn/aim69vABxLnae0oHEk3EnSz
 TiQHbdYN1E1TkwRVvyxNxX3lYyY3wuq/okTnGqySIGfMg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cff7936aa012e533;
	Sat, 05 Sep 2026 10:06:37 +0000
X-Mizu-Trace-ID: cff7936aa012e533
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Sat, 05 Sep 2026 18:06:25 +0800
Subject: [PATCH v2 1/2] docs/zh_CN: sync maintainer/configure-git with
 upstream
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260905-configure-git-v2-1-ab194db8c6b9@wyuan.org>
References: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
In-Reply-To: <20260905-configure-git-v2-0-ab194db8c6b9@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

The English document updated the signed-tag instructions to describe
selecting a key with -u <key-id>, configuring a default key, and using
-s. It also removed the explicit section label and the instructions for
adding Link trailers automatically with an applypatch-msg hook, because
Link: trailers should only point to useful additional information.

Update the translation through commit 944df7a31452
("docs: update the guidance for Link: tags").

Also point the pull-request reference to the Chinese translation.

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 .../zh_CN/maintainer/configure-git.rst             | 48 +++++-----------------
 1 file changed, 11 insertions(+), 37 deletions(-)

diff --git a/Documentation/translations/zh_CN/maintainer/configure-git.rst b/Documentation/translations/zh_CN/maintainer/configure-git.rst
index a45ea736f73b..693d4e5247a6 100644
--- a/Documentation/translations/zh_CN/maintainer/configure-git.rst
+++ b/Documentation/translations/zh_CN/maintainer/configure-git.rst
@@ -5,58 +5,32 @@
 :译者:
 
  吴想成 Wu XiangCheng <bobwxc@email.cn>
+ 袁维杰 Weijie Yuan <wy@wyuan.org>
 
-.. _configuregit_zh:
+配置 Git
+========
 
-Git配置
-=======
+本章介绍维护者级别的 Git 配置。
 
-本章讲述了维护者级别的git配置。
-
-Documentation/maintainer/pull-requests.rst 中使用的标记分支应使用开发人员的
-GPG公钥进行签名。可以通过将 ``-u`` 标志传递给 ``git tag`` 来创建签名标记。
-但是，由于 *通常* 对同一项目使用同一个密钥，因此可以设置::
+拉取请求中使用的带标签分支（参见 Documentation/translations/zh_CN/maintainer/pull-requests.rst）
+应使用开发者的 GPG 公钥签名。向 ``git tag`` 传递 ``-u <key-id>`` 可以创建签名标签。
+不过，由于你对同一项目 *通常* 会使用同一个密钥，因此可以在配置中设置该密钥并
+使用 ``-s`` 选项。使用以下命令设置默认的 ``key-id``::
 
 	git config user.signingkey "keyname"
 
-或者手动编辑你的 ``.git/config`` 或 ``~/.gitconfig`` 文件::
+也可以手动编辑你的 ``.git/config`` 或 ``~/.gitconfig`` 文件::
 
 	[user]
 		name = Jane Developer
 		email = jd@domain.org
 		signingkey = jd@domain.org
 
-你可能需要告诉 ``git`` 去使用 ``gpg2``::
+你可能需要让 ``git`` 使用 ``gpg2``::
 
 	[gpg]
 		program = /path/to/gpg2
 
-你可能也需要告诉 ``gpg`` 去使用哪个 ``tty`` （添加到你的shell rc文件中）::
+你可能还需要告诉 ``gpg`` 使用哪个 ``tty`` （将其添加到 shell 的 rc 文件中）::
 
 	export GPG_TTY=$(tty)
-
-
-创建链接到lore.kernel.org的提交
--------------------------------
-
-http://lore.kernel.org 网站是所有涉及或影响内核开发的邮件列表的总存档。在这里
-存储补丁存档是推荐的做法，当维护人员将补丁应用到子系统树时，最好提供一个指向
-lore存档链接的标签，以便浏览提交历史的人可以找到某个更改背后的相关讨论和基本
-原理。链接标签如下所示：
-
-	Link: https://lore.kernel.org/r/<message-id>
-
-通过在git中添加以下钩子，可以将此配置为在发布 ``git am`` 时自动执行：
-
-.. code-block:: none
-
-	$ git config am.messageid true
-	$ cat >.git/hooks/applypatch-msg <<'EOF'
-	#!/bin/sh
-	. git-sh-setup
-	perl -pi -e 's|^Message-Id:\s*<?([^>]+)>?$|Link: https://lore.kernel.org/r/$1|g;' "$1"
-	test -x "$GIT_DIR/hooks/commit-msg" &&
-		exec "$GIT_DIR/hooks/commit-msg" ${1+"$@"}
-	:
-	EOF
-	$ chmod a+x .git/hooks/applypatch-msg

-- 
2.55.0.966.g6673acef38


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794216536;
	b=IYxkcLy6XwdapllDAYyviRo8vNBaNvCqcDl1qN6pEL6XyfJwjXiN0yLFLt+xd8F9I+6U
	 Z45vBN2OJ5aU3+AF0m+B2RtnYDBkFr6mhiNzSAn8SbgHcN0VGxeO0s+68yVpSk6qsDdmZ
	 +UTCpR7nhvX12aCRxPufOl7D9YLzt9MGEVcVpD+/wD4vQ2zjZxBPg693P8/DK8mpodPp8
	 NLEWP//6QMiRbPx1I4yz13jcNxuEjNLLJsceFgxEb14pLdUSdUjcKstCDlDk/UUkUPzBi
	 c0CdRcld7UuR/spHz+oI0cRAs4GyZfst1wFGIvCuDJ5Tg5KWFQ2/gSAHBOgoUEhnjpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794216536;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=XxByvKIVggsZqzuZ6AvnRPfe/EcPCNrHZexcSq5aNXs=;
	b=Z0xS/tCX2YVWPnA/NBQOFRmQg37IamfOcVozeOWku4zo0fP8sZDkC19X3FWtaXclnxJn
	 X3e3pDMHW423hWCqypT2tzi8xXDTfLu97Md1KNre/WjynBWOuQvdpBO+rsqjcvoCDCk9K
	 G4982HEEv/QnLGhPulkl2q8GvtexKTKyJ8Sn/1FchYVbpqSN25zl7Wh9hpicoodcuQAGj
	 EtAYLUcsMquEIfmzA2vKCte0Ia7E7gQ2bScVll7zEONYCD09E9jAEmkfXxFPKUj3DKP/f
	 uHeGLWr1ZKRX7FTkf0qLPCTSrhrcdryPo/YoKoI1v+pYwuSJr7LdwAVKlm010BepJog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=XDtbAyhv;
	arc=none smtp.remote-ip=91.218.175.97
Received: from mta0.migadu.com (out-97.mta0.migadu.com [91.218.175.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 547CF6083602
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 09:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 547CF6083602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=XDtbAyhv
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/CK0lSz+gO4vTKL1DE0C+DiBhEp+AE+r7HnvzW8Pe50=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794216533; v=1; x=1794821333;
 b=XDtbAyhvvILs87KQumvkPJambTzoCQ9OQjXWIT1n/b3zcEc+VwpKYRKv16jk5QMV7uHDE+HV
 jsXvtNBWaBBHNUX6x/gZzhq1RTKA5gaNFqCc+5fKg4x8loIBK6mYr16mEbTTSwyNlFVEuPpIjuy
 /vsOvKcjFxgcmghM91Ho+Gph3P28JYA2LT/id/qmRnvJhO3+LCZ0VGbMYRAT+TqRDNgaKLoNlzJ
 Qu56BZACGCn7tshxK679g69vyPYSv6k4DdL9bOX3xxTxzSUvScygWOye2rTi5yPBCMYQAixAE+5
 YlgxpyUT/otLDYAV0izbYfYLxXyylmC/PsMveuUAxm0Fw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9502a0c5df4eb510;
	Mon, 09 Nov 2026 09:28:53 +0000
X-Mizu-Trace-ID: 9502a0c5df4eb510
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Mon, 09 Nov 2026 17:28:30 +0800
Subject: [PATCH v3 1/2] docs/zh_CN: sync maintainer/configure-git with
 upstream
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-configure-git-v3-1-d7807bb8e8c7@wyuan.org>
References: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
In-Reply-To: <20261109-configure-git-v3-0-d7807bb8e8c7@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0

The English document updated the signed-tag instructions to describe
selecting a key with -u <key-id>, configuring a default key, and using
-s. It also removed the explicit section label and the instructions for
adding Link trailers automatically with an applypatch-msg hook, because
Link: trailers should only point to useful additional information.

Also point the pull-request reference to the Chinese translation.

Update the translation through commit 944df7a31452
("docs: update the guidance for Link: tags").

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
2.56.0.438.g30c3f27cb8


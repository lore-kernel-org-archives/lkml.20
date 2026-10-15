Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AE73E40EC;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054661; cv=none; b=YHA+nckD7BUlrjzFKMKaShn6Ji+RaqXfyPAPM33uKX1SSFHTWA7RUMjO6dbM5dVwt2JXEMg4ndcrxS5axzDMDJDqnwjMBOQ6tXJYLZHKuk3d/cAE0s6SDeoTiuLVAw9miwX6vi1Wwht5MLrId2RxmQP1HkRB9M6tSkKChcUeoeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054661; c=relaxed/simple;
	bh=9qXzAXIy9ERY/McoS5tUOgvazRmtjr3oCt4tF6kNmS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVzFgiUWxdZ5UMaEVIg5vMAbqtvpiSA3dl01WT4+JkQb9FKGOu+Vq+fFvxSQzO5ugfFfuM0Sg+pTFNY7PryeKc6JdPMKSs2H/pafiB9kfyctbM/fJDtLndIpsGzHGFhrQzvL+pVVQJf901zbb6y5Q/hk/v5rjWmfjFkZqQYCGK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXyyxf45; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXyyxf45"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAA51F000C6;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054653;
	bh=NfGaKwxng/KQleoTCPZqRvzXH8ow977+0/C0fvkT/1Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RXyyxf45pU0nYxNNs4AxdeAK1+WQKXzkpvWnA0gW7+SBQmiDuneo3rX2bnp4f1OVT
	 TSsi3wTLODzFnTFjLimHf/jG+Q2aY+NbqA7NDf5BUxLWys/qy22cfbAmgcSCBRJLXU
	 4AIEV7cS13sHee9ECfR/Hm+WOMgM06MI0qw6SHWTebUD9lHOJS8oE+IyqQb2zvkdRl
	 0KpsBACIu4HJZJb5DlF3LikiTWxrmkFK7GbUpd4pLn9me7zB7NSHe7MxYanWr8YakV
	 O0oYOwt57bImZIqSrvHBUtPtKWCG4IkMIJWQ4Q+WgafdEGv7EE9tIc9YU+vj+do6jO
	 Fb8oD8Sf8hd3Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xHHHH-00000000Mj0-100U;
	Thu, 15 Oct 2026 10:57:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 4/4] docs: test_doc_build: don't select urllib3 yanked version
Date: Thu, 15 Oct 2026 10:57:21 +0200
Message-ID: <09dc30b251c726910ef192b0f750b1c476cf52d4.1792053090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1792053090.git.mchehab+huawei@kernel.org>
References: <cover.1792053090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Trying to install urllib3 gives a warning about a yanked version:

	WARNING: The candidate selected for download or install is a yanked version: 'urllib3' candidate (version 2.0.0 at https://files.pythonhosted.org/packages/ca/25/fe81738a115a2f1005b19bd69b6253b7b5cd6c9119164f13f02ec627fc41/urllib3-2.0.0-py3-none-any.whl (from https://pypi.org/simple/urllib3/) (requires-python:>=3.7))

To avoid that, use the recommended replacement (2.0.2) which
should be enough to avoid the warning while keep using the same
minor.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/test_doc_build.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/docs/test_doc_build.py b/tools/docs/test_doc_build.py
index 9db77ba9b6e2..ace3c6212132 100755
--- a/tools/docs/test_doc_build.py
+++ b/tools/docs/test_doc_build.py
@@ -112,7 +112,7 @@ SPHINX_REQUIREMENTS = {
         "sphinxcontrib-applehelp": "1.0.4",
         "sphinxcontrib-htmlhelp": "2.0.1",
         "sphinxcontrib-serializinghtml": "1.1.5",
-        "urllib3": "2.0.0",
+        "urllib3": "2.0.2",
     },
 
     # Starting from here, ensure all docutils versions are covered with
-- 
2.56.0


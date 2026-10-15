Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A4349C4BA;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054659; cv=none; b=ot59TdfDkbeD2XYl9gsN/WxneAGXJqre6CzHP5B7an1B6vGY46bn9Yoc1a/pSdsPFfsC1dUB+DuJ7h53OlKXoYHeP5A3Y2Ilqx+4yYb164AfFKH02wUUcks+lBq+qD2jVxhvM0KrOEkPy6lbSE7UlyhcZ07MfL3PW1YRX8032MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054659; c=relaxed/simple;
	bh=XA2Fx0nHUBuMbVSnPE6WuHy/VKxMkIiLV5WWJI4SWb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WwL3Jf8d0OeGYehCT9OEWYX0W5bLox8155ZI60MsSdZbd8gv+hpgsQPymxobndCJ0CSgR7JTE1FD+YFInuBS1K7AIgHhqtvvqZVFCWjmKXFX0MGvmyx84Hvb2ob02FOt2TeZMzpnCuYYVIXIUYcQO/98WmjpiewuSBIH4YtcEko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lDFeG2cA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lDFeG2cA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 270331F000C4;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054653;
	bh=bC4KSlbiaa8xr3vozlJdOg3gT1yFWu9eNeAQkfE4qgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lDFeG2cAwORHXvGORgDz1etdlBnaTNTE3oaswCPRcR8UcKgCENGXofEh7fCAX8hxN
	 vROtIi8eXwqK8tLN3fVrHwsYPUTqz1gVjGg5TLo6mWSs8JpAD5jC2r7VSoFiOFHtyY
	 h5BA7E4bzM7jGLYH1dvF8irGo67WPHOFX8znoEfDRzjWmORUELFvWr/lP3Yi29SJdv
	 ut9zGN4s27HlJcef4eRIE+H53r68FAGUQL+HdUH9GNuOJBXzc9L42chgCB5WcmMigb
	 5H+CspKEktB1n4cH8hKOEiZCa76vTH9obaSIYm5OzlIbnDZ/YwAzBRQ9zjkL2s3UiA
	 4x3GtNBWMQWKA==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xHHHH-00000000Mis-0miD;
	Thu, 15 Oct 2026 10:57:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 2/4] docs: test_doc_build: update it to support newer Sphinx versions
Date: Thu, 15 Oct 2026 10:57:19 +0200
Message-ID: <ea7c1a2a8b5adecc2f4d9ccee7ef1f32fa8d0d78.1792053090.git.mchehab+huawei@kernel.org>
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

Current version is 9.1.0. Update the script to handle it. As there
were python deprecations on newer versions, add support for those.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/docs/test_doc_build.py | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/docs/test_doc_build.py b/tools/docs/test_doc_build.py
index 4082317d581d..8b57d896c666 100755
--- a/tools/docs/test_doc_build.py
+++ b/tools/docs/test_doc_build.py
@@ -51,6 +51,8 @@ def get_min_python_bin(min_subver):
 PYTHON_VER_CHANGES = {
     (3, 4, 3): (3, MIN_PYTHON_SUBVER),
     (8, 0, 0): (3, 10),
+    (8, 1, 0): (3, 11),
+    (9, 1, 0): (3, 12),
 }
 
 DEFAULT_VERSIONS_TO_TEST = [
@@ -61,8 +63,9 @@ DEFAULT_VERSIONS_TO_TEST = [
     (7, 2, 6),   # Ubuntu 24.04 LTS
     (7, 4, 7),   # Ubuntu 24.10
     (7, 3, 0),   # openSUSE Tumbleweed
-    (8, 1, 3),   # Fedora 42
-    (8, 2, 3)    # Latest version - covers rolling distros
+    (8, 1, 3),   # Debian 13
+    (8, 2, 3),   # Ubuntu 26.04 LTS / Fedora 44
+    (9, 1, 0),   # Latest version
 ]
 
 # Sphinx versions to be installed and their incremental requirements
@@ -178,6 +181,10 @@ SPHINX_REQUIREMENTS = {
         "PyYAML": "6.0.1",
         "sphinxcontrib-serializinghtml": "1.1.9",
     },
+    # from https://raw.githubusercontent.com/sphinx-doc/sphinx/v9.0.0/pyproject.toml
+    (9, 0, 0): {
+        "roman-numerals": "1.0.0",
+    },
 }
 
 
-- 
2.56.0


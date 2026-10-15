Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2291496D4C;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054659; cv=none; b=JfLTK2e8OdV+oAUeLDqHfn23/6XHtDgLML4XBnBnjdfgDn2HqAloSO64VOzZ5FfgRTvLcoYLDLKO0a2jEDhXmfH+b8PcsIBlXZa28PnFZVI58YK9VnHuqK1MobLt8cHlBJKJuYgvfFxebc9t0t74ANqvohKQ/6iDl97p2Mg4s6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054659; c=relaxed/simple;
	bh=nA1AwkSwf28jxip5Bj3ji0l68Xbeo8VYJG8eCXPCuc0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NTFy+Ztj9DtYy1pBisBmA2OpXJp1gDVVWDHWL/m6Tx9bfqaPfw00ihxTwXuCUPtPUjMH2055E0mBvTvi3P5ldZETfiTNJwTlFtApkSV0WHussIv5hcEauyM5YjRk1YAhv3y6DGdzdfK/htPRaxsnbxeEeebDsA1sem7kqC2zG2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgYz0Eu5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgYz0Eu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28EE81F000C5;
	Thu, 15 Oct 2026 08:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054653;
	bh=/8AJXbJ1qf8wP1AoGud53XojAWbKJNvTY4/Y9innJpw=;
	h=From:To:Cc:Subject:Date;
	b=CgYz0Eu50flY4iRlQc7yX9+b8O4Hw7KWQOkfZUy3BS6xaVJugMYVkoSfsDro1bIAm
	 UIkDyauUid3rZAn5+EPKy9dJM5elMK2+mIWaJP/YvcNDLqJCDHUR3ttAPk8d4+CpQX
	 AmCIkXKLz/bxa5GCkRaPXn7JQ0FOPnj5aPky0hN5P+7iyYJC0iho75EFElIiFBrjpC
	 6ZqFMR8PHBQRBWTwHrzKkF2Rqhvz1m1KVsnwNZKhhB8gL970rkwrHm/OtOmcC1uc38
	 qywycgwsOq0RfqLGlVaBAjKm2XHxIyRe/eh4M1FqvfYz0CzwcB6uLHYNZWpH7d6gkz
	 V6aGz6gkcIopg==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.5)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1xHHHH-00000000Mil-0YDT;
	Thu, 15 Oct 2026 10:57:31 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH 0/4] docs: test_doc_build: Test up to Sphinx 9.1.0
Date: Thu, 15 Oct 2026 10:57:17 +0200
Message-ID: <cover.1792053090.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Jon,

This small patch series extend test_doc_build to cover up to
Sphinx version 9.1.0.

I didn't use AI to write code changes on this series. All manual
work. I did use it to help me identifying what versions are
relevant. After such "AI browsing", I double-checked references
and ended not adding version 9.0.0 at the DEFAULT_VERSIONS_TO_TEST,
as I didn't find a major distro using it.

With that, I kept there version 8.1.3, as Debian trixie uses it
(I removed Fedora 42 from comments, as this is already EOL).

Version 8.2.3 is on an Ubuntu LTS version (being the one on
my machine which has Fedora 44).

Version 9.1.0 is the current latest version, so it is used at
the rolling version distributions.

Also pointed by LLM, version 9.0.0 comes with a new dependency.
I could have simply ommitted that, since pip should automatically
add it, but I opted to map it there with its minimal requirement,
as this way it would be easier to track changes on future
Sphinx versions.

On this series:

patch 1 improves python version detection, as there are version
deprecations on newer Sphinx versions. It also makes the logic
more generic, as the current logic was limited up to Python 3.14.

patch 2 adds the new entries at +PYTHON_VER_CHANGES, SPHINX_REQUIREMENTS
and DEFAULT_VERSIONS_TO_TEST.

patch 3 solves pylint issues.

patch 4 addresses a minor issue related to urllib3 2.0.

After running the new script, it now reports with
tools/docs/test_doc_build.py -b on its summary:

        Sphinx 3.4.3 elapsed time: 00:10:23
        Sphinx 5.3.0 elapsed time: 00:09:27
        Sphinx 6.1.1 elapsed time: 00:33:15
        Sphinx 7.2.1 elapsed time: 00:09:22
        Sphinx 7.2.6 elapsed time: 00:09:21
        Sphinx 7.3.0 elapsed time: 00:09:36
        Sphinx 7.4.7 elapsed time: 00:04:44
        Sphinx 8.1.3 elapsed time: 00:04:59
        Sphinx 8.2.3 elapsed time: 00:05:00
        Sphinx 9.1.0 elapsed time: 00:05:01

And the logic properly used different python versions starting
from python3.10 (which is the minimal one I have installed on
my local machine):

	Sphinx 3.4.3 with /usr/bin/python3.9
	...
	Sphinx 7.4.7 with /usr/bin/python3.9
	Sphinx 8.0.0 with /usr/bin/python3.10
	Sphinx 8.1.0 with /usr/bin/python3.11
	...
	Sphinx 9.0.0 with /usr/bin/python3.11
	Sphinx 9.1.0 with /usr/bin/python3.12

Mauro Carvalho Chehab (4):
  docs: test_doc_build: better handle python version
  docs: test_doc_build: update it to support newer Sphinx versions
  docs: test_doc_build: address pylint warnings
  docs: test_doc_build: don't select urllib3 yanked version

 tools/docs/test_doc_build.py | 120 +++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 39 deletions(-)

-- 
2.56.0


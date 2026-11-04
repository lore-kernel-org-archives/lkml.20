Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771029;
	b=F4u0Cn3eHyelx8HWuh2cNvcu9zTQNrbNEyk5dKP2P/oRlzeumLQ2gz2UCwJLn51gWQNK
	 PlfajpCzKoEOs1aHI33nVCt787jzf9Cu0GN3+hA/wAm/x5q4BJO+8Y8qvxsoA08gTYagn
	 EXCH5ndtn9mO18xip81Laib9daGhTWufIj01VpmKTCcGLobfsb7GjVhgx52DnT7U75H04
	 ynPZkpqDQtZrBk3CmyVgUiEQhShSdh/5c3nt2LfWaos3R69UeHu2QQv6tkN5VKFSfYlU3
	 xbFxzQRxsP3p3V70Ngn/+O6iZip6gG9Zo0aRVozUEKRfLrjsVQ0epUKQjXlKKhXVGUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771029;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=vgc0DFd4+PSa0M2t5B65OkWM/F+A5U1LpsBsnLO9TcM=;
	b=D+62YzNXY9q6cf24fwQUbkV//CAISAPEX+tV3u+pBBQ77DquAEJDkr8IteynM7oS6t6o
	 a8NUeyh6ux3dxF2hqwJVegKgyXSCz3qLVxy9WOWCfd9MB0VnqZI3f94KXEZGEbX1EuTGV
	 IjfdaeCDf3sAjVu4XH6jeHTF0u/9A/MSo650Gs2a+jJVck1zmUH6Wmo8itNyZQGjbzad0
	 95OeYZ2t0mw4QIno66nW05eemln6LX6ezFm2U3DxFhy3S5spj+TnYtlNu7D/wcOFt5qiM
	 uEGTTdAZ3CTkg4IgRaxjhj2fiaUgMlfkto9P9MlgRCb/3CoXFw9/0/lWxyv2LB22AHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.173
Received: from smtp-42ad.mail.infomaniak.ch (smtp-42ad.mail.infomaniak.ch [84.16.66.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F399606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F399606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jKDrY3bvSz8FX;
	Wed,  4 Nov 2026 06:43:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793771021;
	bh=vgc0DFd4+PSa0M2t5B65OkWM/F+A5U1LpsBsnLO9TcM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c/IohlhnOF1wI8by5uV+v++dU2wD4hpystcpD7tr/B0Yd8LnG6p9gwzt9Uh2mxaLm
	 XY1sY2YUI3KqXwV154bYOxu/QO5CijLorb4lOQFghJ+sNG1wRd2t2L4dbH3W/GxQ7w
	 NevBfm2UpRx1viVhw3rUbBqW3SshrYoUNCA/ypeNgeHK+ATc/Z4pIvfsTcSi0ZkMg7
	 Z7ER1Bd7HpHPlxk3m9G++/EqeYy9li2ibChIHJNxlMLFmk0H12HLBOy+AqaaxxkmMr
	 lHQcUELmK5qoMmPJO7OcAs5DqYZIcHkQWIhCLT23lPkzcEzf0G6w5mDrh3cIDA7rg0
	 Vq612oQEUGaMw==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jKDrX6BMKzNtk;
	Wed,  4 Nov 2026 06:43:40 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOTme-00GYxL-1V;
	Wed, 04 Nov 2026 06:43:40 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sashal@kernel.org
Cc: hamdy.aea@protonmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] scripts: git-resolve: search beyond ten body-only matches
Date: Wed,  4 Nov 2026 06:43:40 +0100
Message-ID: <20261104054340.10911-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103164202.129634-1-info@daylightlinux.ch>
References: <20261103164202.129634-1-info@daylightlinux.ch>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

From: Hamdy Abou El Anein <hamdy.aea@protonmail.com>

The forced subject lookup asks git log for at most ten matches before
checking their subjects. Since --grep also searches message bodies, ten
newer body-only matches can hide an older commit with the requested
subject.

Match commit subjects directly, so body-only matches cannot hide an
older subject and grep stops at the first matching subject.

Tested with a target commit followed by eleven commits whose bodies,
but not subjects, match the query. Forced lookup returns the target.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 7ae52a3d7f51 ("scripts: Add git-resolve tool for full SHA-1 resolution")

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/git-resolve.sh | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/scripts/git-resolve.sh b/scripts/git-resolve.sh
index 7d14cf279e86..f04a56c5fba0 100755
--- a/scripts/git-resolve.sh
+++ b/scripts/git-resolve.sh
@@ -74,13 +74,8 @@ git_resolve_commit() {
 		if [ ${#matches[@]} -eq 0 ] && [ $force -eq 1 ]; then
 			# Use git log to search, but filter to ensure subject matches exactly
 			local match
-			match=$(git log --format="%H %s" --grep="$grep_pattern" --perl-regexp -10 | \
-					while read -r hash subject; do
-						if echo "$subject" | grep -qP "$grep_pattern"; then
-							echo "$hash"
-							break
-						fi
-					done)
+			match=$(git log --format="%H %s" | \
+				grep -m1 -P "^[0-9a-f]+ ${grep_pattern#^}" | cut -d" " -f1)
 			if [ -n "$match" ]; then
 				echo "$match"
 				return 0
-- 
2.56.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=84.16.66.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724132;
	b=J56AyDPlbmaXxSzViZc05dK74WHTRe91LXo9i2rMWr7Fht8CYBXPfJ14gP9wBZuPiH5/
	 QtGLk1fhH4rp0dPsiVmJfIxU203+rwgH8mIcJ20V5Q45p/RTPvHrvGz4etRPCp/fI8Z6n
	 ZxdZQZFIVb9JHEFz5M39gMNyqz6BwFrWiBotbcmfV02UZmKEXMvZT/PzpbvJKPjioZ/PG
	 bk3vkwJNikyeUQOusRa5ibfH++nzb/111tocA5bQhGowvv10s30z0RB4QdTeWZlIZdpEz
	 SxfM3OtwdJ4a5eJwWqIttOXi8RwjReMwR3SZ9BL1hpHbsc8GLkrDDWoyWFm9zL1gORQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724132;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=GvHxG46xATTMyb+oe3CSgKYChfUeGrKv8wzcW46AfiE=;
	b=v4mU9hJcYiZIQbgcnmEYUyp6Qp7RSQDdkIE46nzNLWFLZjtmogCfFUU0rCMmRtvwU5S+
	 GblVHYuUT7knXpfRWz22UftLW5vUIfwt1va/z5+sAAaLKxuBP8Ef8jR5lyWUpMA+JQNnB
	 +4hhwVjgrJkTAF/Ckt+1nHZUgjVXkJDXKECqncz4fu5b3qjmEsZDzFLvqfI/x9eTDpjVO
	 a8iHTXl/A2tkYv7F3lzPHTXpwq8lZiZ/NCtRjd9cpg9unUtuPQoauPLhw8vwrGsdZsHUj
	 r1ahuRsVK6p6rTVq9n09Iwevd0doxO1mIPTRbRROIy4rER+JAuNzoyKtmNmS71zlK2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=84.16.66.175
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B5760A383B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78B5760A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVh0Rn2zCX7;
	Tue,  3 Nov 2026 17:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724123;
	bh=GvHxG46xATTMyb+oe3CSgKYChfUeGrKv8wzcW46AfiE=;
	h=From:To:Cc:Subject:Date:From;
	b=W2Dgt+/RnWtRtdYg8OqLfFZuvpyVnPi2AWdLtphFkgtLr7UC8b9YQpJkBX4ZFMXbi
	 8+7Vlw6ZYsKTEwCVNB1JQBq6eyaXt8lrcCAoeMw0HRJaF/XYefWaWO7c7sq6FtGdF0
	 RVMhRaHcimiWEgysWsD85Uqdfgb5VVaG6QwZu6cAsVBro1GYtvJkqAFXHBRbXjxtJb
	 fTl5f28HXi+qX7ScOTyYAqZdWRUKB25q4zMqfNbSTiYjyImrfZwDF+PqaTqdjvCLgn
	 XYztDc32d6LWu3YHsi93EH1WMY5KSd2itno3Da/GaARec4Wjk6HiDAeBNu1EvIqyIo
	 jBWSS0kECCdpw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVg2vYfzxRF;
	Tue,  3 Nov 2026 17:42:03 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaE-00FDbk-3D;
	Tue, 03 Nov 2026 17:42:02 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sashal@kernel.org
Cc: hamdy.aea@protonmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: git-resolve: search beyond ten body-only matches
Date: Tue,  3 Nov 2026 17:42:02 +0100
Message-ID: <20261103164202.129634-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
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

Remove the premature limit. The existing reader still stops at the
first matching subject.

Tested with a target commit followed by eleven commits whose bodies,
but not subjects, match the query. Forced lookup now returns the target.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 7ae52a3d7f51 ("scripts: Add git-resolve tool for full SHA-1 resolution")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/git-resolve.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/git-resolve.sh b/scripts/git-resolve.sh
index 0be8838cd13..4b51d40bebf 100755
--- a/scripts/git-resolve.sh
+++ b/scripts/git-resolve.sh
@@ -74,7 +74,7 @@ git_resolve_commit() {
 		if [ ${#matches[@]} -eq 0 ] && [ $force -eq 1 ]; then
 			# Use git log to search, but filter to ensure subject matches exactly
 			local match
-			match=$(git log --format="%H %s" --grep="$grep_pattern" --perl-regexp -10 | \
+			match=$(git log --format="%H %s" --grep="$grep_pattern" --perl-regexp | \
 					while read -r hash subject; do
 						if echo "$subject" | grep -qP "$grep_pattern"; then
 							echo "$hash"

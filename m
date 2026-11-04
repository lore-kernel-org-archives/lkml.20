Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.25.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771022;
	b=orR6XFKWym5howus0X683nPNc84Ej010soygI5jPgIIcma4wfnAC0+Z8IaohKT3WyW0M
	 oni8XTxzvtEJlFuCjTjSu9zJHKfas7udEiiAkUUB2LLhN5/99bjnOcc4PX8rBXKhg8PsL
	 xDmhTiyw8jyYP7Z8/uoXHkiJEKm6LV1wtfFsJoro3a1GAjZefsGfCjWV5h6bJBF/RxJF4
	 1Op0iKiXtShEa7s1OZ5VaMag0Qhyo1PZGX1XU+I8QAbr0+A2NzytYQcJBbK/ESUuICje2
	 HtonWbYdlpruXTJ6I8BkdPVPHsardyLayeWSJ6rT59kVlmRnDfVmx+7twcbvoyvuwDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=2r8NEAIQIRSaBT3beh2G57avDFO6WPoqNmScnqelQYI=;
	b=dVNtcFO2/+bONW7naDv1MNZvhno5b+wMicjZ2s+/5DxlhKoFSzB9E0HRPFlI3jyFjd1l
	 kp0eFmQQnxJBE3zSw0ilF3DauZ25WPjexgJK8sXRgm6cUSBbLt+gQzE44hjYMNbvVuObi
	 t6l7Jg1IdtYp7c/A6wVxR25RAbKOMFz1gMSw3ZmNI3ll+aHSynUYwx6pdz4PHBCo4CxRu
	 ET7YVmaNX6FrRDRZLuNodH2m6IS7t6xj1mQjAm6Glia0fdEbYeQCfcD4lYrEviAbkO+K/
	 nhyYu/ubnf6wQz8EhGm5t1CdNgyAD9G+vwQ/Xd+bjN9HPw2YJM/ahv3OwCLyBOF1n9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=185.125.25.9
Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2B606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 05:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83B2B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jKDrQ2PVXzDLq
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 06:43:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793771014;
	bh=2r8NEAIQIRSaBT3beh2G57avDFO6WPoqNmScnqelQYI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qyLf/vk2791HZqD/AB1SvwalHjXj5VnxopSTmK7b3Buyr8hpoFdTKYUJIMS7qiRM6
	 f6f1hM6S+BcaIY4onfr/YvS9D82NATdS6OMDyCq6iSlQtItPf7uRU3ZddjRb4NWyot
	 +NUduPLT2bFAhwo8coMLF1DOlEcfl/7oH4zSAmzu44LGCYgNLcL+lC+cnV0exdZzB+
	 05V6SJroB4YxdUr2UgmaKrPI6vn0AUZPSedF3xNDODFqfnUpN01kTXIj8PffO4qE+1
	 d0hkAtuIsiNdquxn8LRrHeCCB3zHMjU58WS+ApVWhxQDN3hVt2WbsUP01YHuF2X9DT
	 OvDOujpBCu4EA==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jKDrP5PX6zVmF;
	Wed,  4 Nov 2026 06:43:33 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOTmX-00GYwq-1B;
	Wed, 04 Nov 2026 06:43:33 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sashal@kernel.org
Cc: hamdy.aea@protonmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] scripts: git-resolve: ignore non-commit objects
Date: Wed,  4 Nov 2026 06:43:32 +0100
Message-ID: <20261104054332.10869-1-info@daylightlinux.ch>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103164202.129624-1-info@daylightlinux.ch>
References: <20261103164202.129624-1-info@daylightlinux.ch>
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

git rev-parse --disambiguate lists objects of every type. A unique blob
or tree prefix is therefore returned successfully as a commit ID. Such
an ID cannot be used as a commit reference or Fixes tag.

Filter the candidates by object type before deciding whether the prefix
is unique or looking up its subject.

Tested in a temporary Git repository: a real commit prefix resolves to
its full ID, while blob and tree prefixes produce the command-line
error.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 7ae52a3d7f51 ("scripts: Add git-resolve tool for full SHA-1 resolution")

Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/git-resolve.sh | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/git-resolve.sh b/scripts/git-resolve.sh
index e9b5940c0f28..7d14cf279e86 100755
--- a/scripts/git-resolve.sh
+++ b/scripts/git-resolve.sh
@@ -49,7 +49,9 @@ git_resolve_commit() {
 
 	# Get all possible matching commit IDs
 	local matches
-	readarray -t matches < <(git rev-parse --disambiguate="$commit_id" 2>/dev/null)
+	readarray -t matches < <(git rev-parse --disambiguate="$commit_id" 2>/dev/null |
+		git cat-file --batch-check='%(objectname) %(objecttype)' |
+		awk '$2 == "commit" { print $1 }')
 
 	# Return immediately if we have exactly one match
 	if [ ${#matches[@]} -eq 1 ]; then
@@ -191,7 +193,9 @@ fi
 # Skip validation in force mode
 if [ -z "$force" ]; then
 	# Validate that the first argument matches at least one git commit
-	if [ "$(git rev-parse --disambiguate="$1" 2>/dev/null | wc -l)" -eq 0 ]; then
+	if [ "$(git rev-parse --disambiguate="$1" 2>/dev/null |
+		git cat-file --batch-check='%(objectname) %(objecttype)' |
+		awk '$2 == "commit" { count++ } END { print count + 0 }')" -eq 0 ]; then
 		echo "Error: '$1' does not match any git commit"
 		exit 1
 	fi
-- 
2.56.0


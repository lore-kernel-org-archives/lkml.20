Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724131;
	b=JvFSAi8yd0XV+txOhr8gAlL2eki5PDn0kjKBV4060d98h9p9E0TLiZsE/FUkv4CZcuPd
	 m1YpbYY0o1x4H9CuCv0J6y7EV2S4wQ0paiGrsfsTXwXKBuQb+aB3xzAJUyEygEv0Cy4cb
	 xo2386FAmfnmV0ZWDzyPvdE6KfXfUX6JcY03rqf7y2mwU6QZ7v3KOq4Y8aEs1bALt+pN6
	 Mogv+Lc/C+MiMX6I4qQnDrMlz4LGAsQtArGl/t2bxMp00+pMcONJppR16MeAlCe6RjHkd
	 G6RNHEEhU7n7fczQmATQp0hH/D4lzCScxnbaWRDncXY9AuXJ/TbRaOn9tx/UfZ9x35A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724131;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=zWuqlHAl8EMnuJQa3Ip4uIbks17jqw9fAtZiwgz0frc=;
	b=SoKNXFgNV2t8lCK2J5jAXl8Ii35M/1zW4SPUgaWdfJAkfiN3nE/YX86puHsZ1TSAceAe
	 WKkGCJH3QSTBpVyD7jBhXfGsR+xQ4X0ghxqVgsb9EgVuKyYqvWIPbFvDNFfmBEcGeC+DI
	 b+uRnL8j3Ftmvs4fUJvVjPoBq/Ka6mHbxnu/xtXqgxS4dM/oVWQmFyrkhZx3pU1/7IFg8
	 MKGvZWCTEIXYDvKQVWrE53pP3pFJ4SfFktPmZ2IF7nBs32sruTMXNgnR3umuJp9o9Gizk
	 BzUbXJJKp5+5CIBgNt1SDPMoNUjp2vtgaFqgPCfmrXrpxfsWahpDiDeWlvMVa5qRoWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=daylightlinux.ch;
	spf=none smtp.mailfrom=daylightlinux.ch;
	arc=none smtp.remote-ip=83.166.143.175
Received: from smtp-8faf.mail.infomaniak.ch (smtp-8faf.mail.infomaniak.ch [83.166.143.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E93360A3828
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:42:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E93360A3828
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=daylightlinux.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=daylightlinux.ch
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jJvVg48mGzDtG
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:42:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=daylightlinux.ch;
	s=20261016; t=1793724123;
	bh=zWuqlHAl8EMnuJQa3Ip4uIbks17jqw9fAtZiwgz0frc=;
	h=From:To:Cc:Subject:Date:From;
	b=DVscUd7l/Zl/PrN8J0SxWcnSHVAw7YUOXxT7pwULFJSp1E3Duv15kR1H2IAxTXV22
	 7VwTadnqvPh9vIXu0W6PolaPyH16fQODrOgRlBOomr2JeUMq1MynFtIcPysrhqTbyz
	 QdeDlFCJPdXemewEP4w3ZDi6l3iRV/EG4eJKzkjKuHI1Npj0Oxo9g45fC3V1+3HVPI
	 OORG4O6BdfBcb/+GQHR/GMNphB/M3iR4cknf8NdaSeukkP6LzaUYBsm8LEPfHKn3H+
	 v/A9PzsR/K3KmWivOBeiFKrXOU4ssyXfdWvX70wbXNeRHqr1dsomIMcbf2p1Nvmq+9
	 omw1VQYEF8qlQ==
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jJvVf6lyJzvpd;
	Tue,  3 Nov 2026 17:42:02 +0100 (CET)
Received: from unknown by raspberrypi with local (Exim 4.96)
	(envelope-from <info@daylightlinux.ch>)
	id 1xOHaE-00FDbV-1g;
	Tue, 03 Nov 2026 17:42:02 +0100
From: Hamdy Abou El Anein <info@daylightlinux.ch>
To: sashal@kernel.org
Cc: hamdy.aea@protonmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] scripts: git-resolve: ignore non-commit objects
Date: Tue,  3 Nov 2026 17:42:02 +0100
Message-ID: <20261103164202.129624-1-info@daylightlinux.ch>
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

git rev-parse --disambiguate lists objects of every type. A unique blob
or tree prefix is therefore returned successfully as a commit ID. Such
an ID cannot be used as a commit reference or Fixes tag.

Filter the candidates by object type before deciding whether the prefix
is unique or looking up its subject.

Tested in a temporary Git repository: a real commit prefix resolves to
its full ID, while a stored blob prefix is rejected with no output.

AI assistance: ChatGPT/Codex identified the issue and prepared the
change, commit message and executable regression tests.

Fixes: 7ae52a3d7f51 ("scripts: Add git-resolve tool for full SHA-1 resolution")
Signed-off-by: Hamdy Abou El Anein <hamdy.aea@protonmail.com>
---
 scripts/git-resolve.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/git-resolve.sh b/scripts/git-resolve.sh
index e9b5940c0f2..0be8838cd13 100755
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

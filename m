Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506337;
	b=kx2C2boJY6+yR6+aXsAMth6OTNwG3fX/p03rgFJsACKTMlItLyX7v0K1r4BWoc4fvPSm
	 SBlT0iTNd3StW7eM5WFUEB3wsJS5lO9I7eG46MSnKinYkJ8JkcPrR1XeyybmBKum7M+Bf
	 WFCu/PCKvPi/ICNV8qqFZ/snR/UlEZjzbWsdStLLgEen8C0fxc2eYUmXjDQqrtjOPJYNW
	 Y/WL0GL0p7XiTFj1+vMKZwXdVUELOSC5YU5ju9TJ5Z5sRImF+6wuz13bULhdD0aVyGU8c
	 UIDItJ8gaeLo7unzU6k/xzV1k4iUF4WhyMC7bpgBmvapoFSx1gB3F+tTHQwP1SiFFzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506337;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vcVAP9GRHUePUOmBJ/2Pb+sVoudjT1xB8cgrMOuN/18=;
	b=E1rjMqY1dU8ifmwSKFRryLJKsQBo9rPK+uMKypKHjTwsDLip/soH4oSe1WT8G6orQU1A
	 EHHE3JyXIYr9BeY/KMonId+tDqLPeNttn4ABniITLVqXgew03hBI14zRUUB+xHHHBu0X3
	 izfKPCbu6adcFbPCoUYyPufgVTA8jfRhJTu0RqBabqLQs7RHsnqGA/5IgVRCWLohOnqkR
	 ZyVhkm5sX15Qy/bcv4S59hnv/o3Or0jZcdJR8QWNKNKGSDFH3u4QhEQxOH2hCEzS5ECd6
	 nm+UwOidT4Bg0QRlbhrxqeezLBytb7DgqD6lK5icXON6mXIKHWqhz4C3xLbORoC9mlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqrfKF19;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8917C606A31D;
	Tue, 20 Oct 2026 14:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WqrfKF19
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1733C1F000C8;
	Tue, 20 Oct 2026 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792506337;
	bh=vcVAP9GRHUePUOmBJ/2Pb+sVoudjT1xB8cgrMOuN/18=;
	h=From:To:Cc:Subject:Date;
	b=WqrfKF191G1CLE6knPelgP/7ZmiLWRdsSko58XzLsTDvMD8TKqUGIxC7K+wvNApRj
	 f+3ImlvmR7rHNhO642l3pJORIHrEVZsInfP2ziZedokf3E7Dh4Q8lTqzJ1IGGKPkkG
	 wTzCxcHT8A9tmT1WNSHX7zJp1GJv0o23wtXhnn8VzOAASUZ6wA+Kx2/shf39BDpOzk
	 FM/Fp7Wuic9Xs//dzwJCmdkAVpy/kNAs+ELO2xND3gGRO07oBg3R5OQnV42VoMcdKN
	 NFCE5NwJRWwgPxSUivLDZ9hg/Ui9fyeNzU9iO5KKcNYzfomq5F2G4fCkafuIYlp9ER
	 dNw2Yh4klERLQ==
From: Sasha Levin <sashal@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bradley Morgan <brads@mainlining.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v4] docs: submitting-patches: say which commit a Fixes tag names
Date: Tue, 20 Oct 2026 10:25:34 -0400
Message-ID: <20261020142534.3533478-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The description of the Fixes: tag does not say which commit to name when
a later commit made an older bug reachable, or when more than one commit
introduced the same bug, and both questions come up regularly. The
commit that blame points at is also often one that only moved the code.

Say that the tag names the commit that introduced the bug, that a
later commit that exposed it gets a tag too, as handling-regressions.rst
already asks for the commit causing a regression, and that each commit
that introduced the bug separately gets its own tag. Say that the tags
tell the stable team which trees need the fix, and that trees without
any of the tagged commits do not.

Link: https://lore.kernel.org/r/c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info
Link: https://lore.kernel.org/r/20261013003535-mutt-send-email-mst@kernel.org
Link: https://lore.kernel.org/r/atCI4q2HvqVXOag1@stanley.mountain
Link: https://lore.kernel.org/r/bcef59f8-33fe-4bbe-8429-307630dc6bb5@leemhuis.info
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
v4:
 - Split out of the agents skills series, where this was patch 2/7 of v3:
   https://lore.kernel.org/r/20261016152828.3765695-3-sashal@kernel.org
 - Take Thorsten's rewording. A later commit that exposed the bug now
   gets a Fixes: tag too, as handling-regressions.rst already asks.

 Documentation/process/submitting-patches.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b46..33e8e7f8f5fa2 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -608,6 +608,14 @@ which stable kernel versions should receive your fix. This is the preferred
 method for indicating a bug fixed by the patch. See :ref:`describe_changes`
 for more details.
 
+Name the commit that introduced the bug. When using ``git blame`` to find it,
+do not settle on a commit that only moved the code. If a later commit exposed
+an older bug, add a Fixes: tag for that commit too. If the same bug was
+introduced separately by more than one commit, add a Fixes: tag for each. Do
+not add tags for commits that are only suspected. The Fixes: tags tell the
+stable team which trees need the fix: those that contain one of the tagged
+commits. Trees that contain none of them do not need it.
+
 Note: Attaching a Fixes: tag does not subvert the stable kernel rules
 process nor the requirement to Cc: stable@vger.kernel.org on all stable
 patch candidates. For more information, please read

base-commit: 3857c2fe5449541e24afc5efdb0f81a8a8f9a3a0
-- 
2.53.0


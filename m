Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C97D4DF4AD;
	Fri, 16 Oct 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164516; cv=none; b=oArW58KHRGv3a2CTl1VoYafWFMy6S2L/80l8uaBwTpB5JbhiMkmUmMDwO0SsTa8QG7xK/ds6DKMy6SpgJOyKR5Cy61urjMHXExCwpdZz/Q2GuLYd7+MCZDh2fNoA8va47c0u5cEKwHIZEJgMAHrAI4qI7KDmIOLSSfA50hRRm8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164516; c=relaxed/simple;
	bh=WGu2F8QF0jZjU6H0LBVtrOh2QmgSdS16U4Epc8xzr74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DPJEHwXfT0O/zH+EBiw7sdlbM1SkIEqujyE5bxeltrxeuLx8F1o/pJKYOVqckZUKbJ/W4DnuqSRenfzkmv5yrmPO4LkYRz2Fq+iKvOtQFatdZ+IvL+a3LxdknrXu16FWK1NUDltxvroDw7/KewnI9EouwEQsxxkEi5gaMSJYiyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YSy94puY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YSy94puY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C441F000C7;
	Fri, 16 Oct 2026 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792164515;
	bh=cQn2UKC/cvtGyJioDWFwZ+6MUYfp3oMbYe5HA7mAwE4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YSy94puYdrEYPlzqwr352BS5gcF0fNMfAuQS2r7TWG3G9Xb6dvgis3D+imsrLSS4c
	 I6BR08uJ/Mc5cr+J/Ro9i5zGdls/1DKiXTURIHvt1nVKC0QTQ3teCGaOYLatA9rHEQ
	 pmZYWlFVNePcy9AybqS8uFv21xCaK444+wshE91eQmdZ9CNI9ckXN+DJdfxPfBwOUN
	 F9QEcdWQbuTXhs6p3hxY+G4f1Irp6pZtiO1kxWXu2nQ7J5M8FL/jjf0/f7WA2cpAhc
	 PBGE4FEAfhNWyni91q/Zrb9nUdIyo+KPtd/ZT5CbOC1NT+AiP0dX/bT/8Y/45gXtFy
	 S1x4bMfmqmZLw==
From: Sasha Levin <sashal@kernel.org>
To: workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mark Brown <broonie@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dan Carpenter <error27@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v3 2/7] docs: submitting-patches: say which commit a Fixes tag names
Date: Fri, 16 Oct 2026 11:28:22 -0400
Message-ID: <20261016152828.3765695-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261016152828.3765695-1-sashal@kernel.org>
References: <20261016152828.3765695-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The description of the Fixes: tag does not say which commit to name when
a later commit made an older bug reachable, or when more than one commit
introduced the same bug, and both questions come up regularly. The
commit that blame points at is also often one that only moved the code.

Say that the tag names the commit that introduced the bug, that the
commit that exposed it may get a second tag, and that each commit that
introduced the bug gets its own tag. Say that the tags tell the stable
team which trees need the fix, and that trees without any of the tagged
commits do not.

Link: https://lore.kernel.org/r/c3ce794d-1ac2-4ef3-9e5c-1e171bd77a89@leemhuis.info
Link: https://lore.kernel.org/r/20261013003535-mutt-send-email-mst@kernel.org
Link: https://lore.kernel.org/r/atCI4q2HvqVXOag1@stanley.mountain
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 Documentation/process/submitting-patches.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b46..7c4e3c8272d2a 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -608,6 +608,15 @@ which stable kernel versions should receive your fix. This is the preferred
 method for indicating a bug fixed by the patch. See :ref:`describe_changes`
 for more details.
 
+Name the commit that introduced the bug. ``git blame`` and ``git bisect`` can
+point at a commit that only moved the code, or that made an older bug
+reachable. If a later commit made an older bug reachable, name the commit that
+introduced the bug; a second Fixes: tag for the later commit is fine. If the
+same bug was introduced separately by more than one commit, add a Fixes: tag
+for each, but do not add tags for commits that are only suspected. The Fixes:
+tags tell the stable team which trees need the fix: those that contain one of
+the tagged commits. Trees that contain none of them do not need it.
+
 Note: Attaching a Fixes: tag does not subvert the stable kernel rules
 process nor the requirement to Cc: stable@vger.kernel.org on all stable
 patch candidates. For more information, please read
-- 
2.53.0


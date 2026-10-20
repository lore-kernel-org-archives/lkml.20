Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513017;
	b=aUszO6tre9EKlmC5ZVHPHqInkcv5aWy2YwR37oJgpRfwc2731BhDJattqM10YdBE4s4i
	 7kBV1lX0ilS6ozl9Mf2i01mBgsO7pQyTcNYfbEIPS28YEYhaP5fmoRtNVDfiJW9p8ZSR3
	 FyA7y2cnfC5QPZPxZOSSQpPSycaEVxLO2LHaxdspaHhk4nIUiAUdlHuTKQXIaZhodlcRo
	 rqBJqEEslwIC3T1oS7hezVqo4yXGiB78hvLsdC4Fbysx2NqOztIp/xF5xPkr5gdj5aZky
	 zourDUugGO6fuhoMqcZdju2DUVZ7jOIETnt5gCE9uq7lBfN+HurFWhFX7SG6Rz5Cjhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513017;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=lXCAAqY9hbw9Apll3XgnXGoEsFr0Y756xpb9zbRL7R0=;
	b=C8HCmtdG1tcYh3OyIoxihDAlnK6X93MLKKsKnikGqw2r9z7MWZF+kz4HFO0BuQTO2wxW
	 yuWBqLajOJCD6fwIEqnY4dJHLNfVzFxcsLcEr4oJZ5Dl3uBnt26CQ5kEGT+cvOcIonj5A
	 woEFuwk4Ndo4bR93eltWY9DsqUCq2XHDDR9EkkcDOIaRV+HBtqsaHHq00SW2nBt3FwkdP
	 iEuM4k65pbPnWN78XcBL/kroUTc28Cnnwwm6BKLW9EBQUOa7VDcqKvlztMxIjYEDNHmWH
	 V8bldkr5a+gmp0027wMQ0EkFRFWnSDvBcIn4Ywq6CiQswu3B1yZefKG4BGQ3SlMb91A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvD5qPLL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64D8606A31F;
	Tue, 20 Oct 2026 16:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TvD5qPLL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9B21F000C8;
	Tue, 20 Oct 2026 16:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792513016;
	bh=lXCAAqY9hbw9Apll3XgnXGoEsFr0Y756xpb9zbRL7R0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TvD5qPLLR/6cWcoHwQx7oT6i0k1P+gPsWODghGWrBO04uWpE2SpytPiM4mu+JBn6V
	 7T6YFP545LaTlvkfP/pH+HspFoqdT19P40IXS8DDD/eio2SZX//nrO01hSKXYhSX05
	 elZ/RG5llDviF1wJ59Bxer16/ff03N1RZBtnL2ylCUba8zH48tv+yJL8IrFYSO1zOB
	 mdH+1dYE1VBr/RUdeiwvdFkF5+JtOAMTrFHZLliQXBYg2g6m/i8WUq99Dpc3R/xR8l
	 EPGvmi+ZKNilkTvrc9Ab/U3pUJaJwkzXepef5etainXNYyakXERR531B7AHoi+Dlw0
	 OiW3ExtrpYh0Q==
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
	Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>,
	SJ Park <sj@kernel.org>,
	Bradley Morgan <brads@mainlining.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v4 1/5] agents: add infrastructure for agent resources
Date: Tue, 20 Oct 2026 12:16:38 -0400
Message-ID: <20261020161642.3713052-2-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261020161642.3713052-1-sashal@kernel.org>
References: <20261020161642.3713052-1-sashal@kernel.org>
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

Add agents/ as a home for skills and other resources for
coding assistants. Describe the skill layout in coding-assistants.rst,
together with the rule that skills only inspect and report, and add a
MAINTAINERS entry covering the directory.

Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
---
 Documentation/process/coding-assistants.rst | 14 ++++++++++++++
 MAINTAINERS                                 |  6 ++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/process/coding-assistants.rst b/Documentation/process/coding-assistants.rst
index 051f0d819f68e..1efc7b08f09f8 100644
--- a/Documentation/process/coding-assistants.rst
+++ b/Documentation/process/coding-assistants.rst
@@ -19,6 +19,20 @@ For guidelines on content generated by AI coding assistants see:
 
 * Documentation/process/generated-content.rst
 
+Agent resources
+===============
+
+Skills for coding assistants live under ``agents/skills/``, one directory per
+skill with a ``SKILL.md`` entry point in the `Agent Skills format
+<https://agentskills.io/specification>`_. Each skill points at the process
+documents that apply to its task and adds only what assistants tend to get
+wrong.
+
+Skills inspect and report. They do not change files, create commits or tags,
+or send mail. A skill returns its result with the evidence for it, or says what
+is missing. Do not fill a missing result with a guess or a placeholder, and do
+not finalize the work until it is resolved.
+
 Licensing and Legal Requirements
 ================================
 
diff --git a/MAINTAINERS b/MAINTAINERS
index f53047aa8d3c1..9e522cda56f1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -713,6 +713,12 @@ F:	Documentation/filesystems/afs.rst
 F:	fs/afs/
 F:	include/trace/events/afs.h
 
+AGENT RESOURCES
+M:	Sasha Levin <sashal@kernel.org>
+L:	workflows@vger.kernel.org
+S:	Maintained
+F:	agents/
+
 AGPGART DRIVER
 M:	David Airlie <airlied@redhat.com>
 L:	dri-devel@lists.freedesktop.org
-- 
2.53.0


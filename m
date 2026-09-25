Received: from mail-pz2-f16.google.com (mail-pz2-f16.google.com [74.125.228.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459E1443C32
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790337656; cv=none; b=Qi0Old4vMPe7QkWiaiQ+Mv4yz210jj2HalSJlco7LtlKWzBCFQSbgEMU0bU/gmMvA9Lgygvb5g1edDO3zkUwka/L9RLOC8c/97rT5JzTA2F9b9904SkMCpB/jG5a/PEjjIC2gPcMKbKzwmyenjTArQ7iENwtt3YXcqTHOWhDjiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790337656; c=relaxed/simple;
	bh=X+p2WGLuzTjMis8lEexxPSVhvUaX7sHLToQhbMInFec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WRmiOn1UrQUUHP/HEDWMn9xM8orFE4mN3OcLpSbGZcDA03jWBpgJyOL7o43EMaOnEtIaKwzUrVvIIRSPFaDVjK/yC9E4aEDZk26STdF1FqV2rxwPXU0E57YXPuFBZ+hsO6Cepnbob3/bIsMmAoyNjL0r1LUcP4iJ/KEjVC/KSeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NLe7uJTg; arc=none smtp.client-ip=74.125.228.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NLe7uJTg"
Received: by mail-pz2-f16.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so251438a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790337652; x=1790942452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+1r5bHA9CuIYsqSBm/KvT0uOgABx/8PZUnr/xHf3B3A=;
        b=NLe7uJTgDk8wwmYDTc4g+vbY35UY/MTFnD95DpDAAJIdGNrMQzC1EtNrtOycwr5eeK
         s8qXj+37YTh0e2dG7CDlJgsAFLtix/EvKXXQ8JWdbzHn35iBcT9avZXJLCoTkKCqh9PL
         tCMoNMGYP7FOfp0C1+UPWEmRNibb9EtPxaspKvcouyIjjvru1dzCekpfF8eZrho9U8Nu
         r5+JC7UeFIkTvsfiGI703SilcCKYd2FuERRMilXvJrj4Jb0e+Bv+7QaoCa2eVf6Aq0GP
         KpiZzygWrzxEG8Cx5QGjp+JZvNC6yuVL8dt/qL5GpUBS23GoeErgI4bkse5c+4fuVEh9
         TEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790337652; x=1790942452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+1r5bHA9CuIYsqSBm/KvT0uOgABx/8PZUnr/xHf3B3A=;
        b=V9/7ue9CEuo99i4toYus64G2YhYj3ecZJ7OWvonp42FW3R8Z3d/t5/2S4AGnBqvmUc
         vtx/lA7YRPG/+PnxKp749nyCL5H+YcZCD1IKzaIDEAZDUISpWdkwJ/QOL+PBRX+/GdvJ
         ZZa/a0TYedmJGb8wWuDLZ7ChmaKwYHx250XgU3Eh571X/1U13Cd7AXBTyxP8Cgq5OUPM
         Pd0wp/oA7JiLmoMYFwujAelpXVnvn++pyvt2IRbJd8QIylUYpp6vLzUoi89rk9PJGzpD
         RG7jPPuiuQoxZjW/lV6DJLQTds9+4TewQ2+H//ML6R73t3hBIkRhJTM8j65qq8uymbJk
         I9UA==
X-Forwarded-Encrypted: i=1; AKwUvBzxvZrUMM4TztjFTQt0LXfJzTfyPuFSZLhmsmDUn/IzvbhWDWL+hf4H9DLmg8SBMZrpCb93RlJMt/sDcbE=@vger.kernel.org
X-Gm-Message-State: AFuF++neI/qT6MLq56LXMcR+VfSUtVUFNrK9+WmTfw4C1jp1L6L6Bj36
	9dFbszSiGrESDqNX3jBsTo9iovR4AsozKifZzbJmhh/B1xuYYrFpDYMO
X-Gm-Gg: AYBFou1HZEYrQWXf7S9GOPTxzYoR8sV4cQfNw/IZE7h/2JoxpdAzrD8/M8EZxfgR73f
	yXFbiOhyWoqEXsL9y4rlhnKFzMVTUPi9N8fGl8Mwoq04/HCMyvl/D8onnBnPXbn92ZdA+SfXZ9x
	hPo3p4CPtgQGFSOgire+kbw0ohMOphwXIbH3yLPGtDgUEILnC8pervRWqA05Hnrc1M4DKqqsAc5
	kj48UDoKhcHAWHRizoa31cm+V2hUX/352oMqSsuyXnAdTO+I9DXP2pYCEpui4KyOMQi8PnxOpJt
	zOG8mJ45nMh97P3Jddoq42G4iDKyO5h+Kz3Z2KCOtptQjXuEEuA1iMCDdlndSRD10+ejRFLPzz1
	sZP3OGrm0lRbAQTRdNsZxvgL4z5YAqipJ6XV2R44d+j7+BMGLWVsry/8tbBrC+SfIYWTwM8tfhP
	OgTeMDTaXJNOwVv7PFwS7PNTo0a+riA+GWBAAlHIq7C+QhF6gzQMAZwnOX+oT4JzEcsiSkcQvGK
	4gjH2vXVqyI3KXGbXnADlSkpb92lMRWlgXoubIfzwZhzN1MylxnyODf4mAm0VVZuQiZtWWZcTdm
	8+49q6pAQ98I990yUdXmQNIOmEhJmUBnRMSRCLDKHxSwQlX6Pyfxj3OkiDk0E88knLbJqA==
X-Received: by 2002:a17:90b:510a:b0:3a0:9640:802e with SMTP id 98e67ed59e1d1-3a0986ec975mr4901367a91.8.1790337651867;
        Fri, 25 Sep 2026 05:00:51 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm10254338a91.9.2026.09.25.05.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:00:51 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	tytso@mit.edu,
	krzk@kernel.org,
	maz@kernel.org,
	cassel@kernel.org,
	ebiggers@kernel.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] MAINTAINERS: document the branch in git T: entries
Date: Fri, 25 Sep 2026 20:00:47 +0800
Message-ID: <20260925120047.1093617-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A git T: entry can name a branch after the repository URL.  The first
to do so, commit a1aa5a770dc3 ("MAINTAINERS: update hwmon subsystem
git trees"), added two T: lines for one repository, one per branch.
Today 109 of the 846 git T: lines name a branch, and ten entries list
one repository more than once with different branches.  Commit
083bf9c56d06 ("get_maintainer: add more --self-test options") taught
get_maintainer.pl to check the branch with git ls-remote.  Neither the
MAINTAINERS preamble nor submitting-patches.rst mentions any of this.

Document the syntax only.  What a named branch is for varies: many
entries name the branch linux-next merges, others a fixes or topic
branch, and some subsystems want patches based on a mainline tag rather
than on any branch of their tree.  maintainer-entry-profile.rst already
asks a profile to say which branches go into linux-next and which one
contributors should submit against, so point there.

In submitting-patches.rst, say that fixes for the current release cycle
and new development usually start from different places, and where to
find out which.

Suggested-by: Theodore Ts'o <tytso@mit.edu>
Link: https://lore.kernel.org/all/arSMwd1bGO1vrif-@mit.edu/
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
v2:
- Krzysztof: one patch instead of two.  The header no longer says when
  to name a branch (v1 tied that to the repository's HEAD); it
  documents the syntax only.  submitting-patches.rst names the branch
  that queues work for linux-next as the usual base for new
  development.  The cgit about page he mentions is a good place to
  describe branches, but not every tree has one, so the text does not
  point there.
- Marc: some trees are integration-only and want patches on a mainline
  tag, so what to base patches on is left to the P: profile or the
  maintainer:
  https://lore.kernel.org/all/875wzu4vuv.wl-maz@kernel.org/
- Niklas: fixes for the current release cycle are now told apart from
  new development.  memblock is not alone: ten entries list one
  repository with several branches, so the header says an entry may do
  that, without recommending it over a single line.
- Eric: his fsverity patch uses one T: line per branch, which the text
  allows:
  https://lore.kernel.org/all/20260925041654.112935-1-ebiggers@kernel.org/
  Pointing HEAD at the main branch with gitolite's symbolic-ref, as he
  suggested, is up to each maintainer and is not covered here:
  https://lore.kernel.org/all/20260924040030.GB5048@sol/
- Ted: documenting the branch at all was his suggestion (Link: above).

v1: https://lore.kernel.org/all/64b0be79c535bb9545f9f81a5044146a8726c761.1790220653.git.matthias.goergens@gmail.com/

 Documentation/process/submitting-patches.rst | 8 ++++++++
 MAINTAINERS                                  | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 7ae79452e1b4..cfc72975a9d6 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -40,6 +40,14 @@ patches prepared against those trees.  See the **T:** entry for the subsystem
 in the MAINTAINERS file to find that tree, or simply ask the maintainer if
 the tree is not listed there.
 
+What to base a patch on also depends on what it is.  A fix that should reach
+mainline during the current release cycle, such as a regression fix, is
+usually based on the latest mainline or on the subsystem's fixes branch.  New
+development is usually based on the branch where the subsystem queues work for
+the next merge window, which linux-next merges and which the **T:** entry may
+name.  When in doubt, check the subsystem's **P:** profile, if there is one,
+or ask the maintainer.
+
 .. _describe_changes:
 
 Describe your changes
diff --git a/MAINTAINERS b/MAINTAINERS
index c52ec2d7d3c1..c3f8fc52f3ec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30,6 +30,11 @@ Descriptions of section entries and preferred order
        See Documentation/maintainer/maintainer-entry-profile.rst for details.
 	T: *SCM* tree type and location.
 	   Type is one of: git, hg, quilt, stgit, topgit
+	   A git entry may name a branch after the URL, and an entry may
+	   have several T: lines, for example one per branch.  What each
+	   branch is for, and what to base patches on, differs between
+	   subsystems: see the P: profile, if there is one, or ask the
+	   maintainer.
 	F: *Files* and directories wildcard patterns.
 	   A trailing slash includes all files and subdirectory files.
 	   F:	drivers/net/	all files in and below drivers/net

base-commit: 165768bb70265b5c38cf0b73fafd75be235f8b14
-- 
2.55.0


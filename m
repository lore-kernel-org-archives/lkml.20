Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D422931DC
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 03:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061918; cv=none; b=kv0rD5NYxUKMvkEE0Vsjv5To5Fb4Uo58rW/IvvJnG4vea/v3Gnxmv1XS3/l55+EfgIKk/xMzfLOFcqyPQiTRyFjgAfdez9ZJW+OlXWXLzz3GF6JbqfLR5rMnPsbYhUjPZgvb0R/JOxiDwOMZfnW5XCSjoNfI5RTZac6kKtC/8js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061918; c=relaxed/simple;
	bh=4llXfy3pmrtd0fb+o7Nx0IIsOZ8gp9ig6tO3qO+1+4Y=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Le9ApUauDkTd4o40evzt2W7l8nOV3P/N3SnXW7R+TnVe2IS0/enzcjGZWspbJ+13d6r8XnerUD82gLtZVRTY2QkaIdYlPnNKVhTk//Y3XVUzNytxJ4PKxVB7Yut8PP+CB2m1076YWvlGzhTby9Ai/c9FQ4vCcjjZZ6yea6mh0qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=kx1nP9YD; arc=none smtp.client-ip=79.135.106.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="kx1nP9YD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788061912; x=1788321112;
	bh=0dD5oMnTRgDfBjkWIdYVb0AJ9OTzv7ps3j7Lef16Jco=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kx1nP9YDF3alKUthfcrupusmAr4SR6dUDYEN0Fr7g++QgQaylVqCrhmLcgH4CDW8Z
	 RhCPcklCikaySQnDEhSplH6VOhLpOFaJfLMXPPDsoEFe6au8k6L89wijbYaNItWiVn
	 LMmN3ZThMy+MYoEjyR0GaPRTHocEKtnYm+cSmDFM2YvkN+hNg3j/gXqqjVeNglq/s8
	 S1NSV+exGr0kP2OHEhoMpZFrKWOPdjCHHGe2GKUHci1OBW6gHcmJ5jPdhgyu5MpU5D
	 UtHhkezpQOzN8SxtML/3AI+ImoHaSlNBZL0dMTeTBQ3k7QkriOUd0S6Ku39z/FISPL
	 6n+W6aj84rNvw==
Date: Sun, 30 Aug 2026 03:51:44 +0000
To: amd-gfx@lists.freedesktop.org
From: Satyajit Roy <edu042sjroy@proton.me>
Cc: harry.wentland@amd.com, sunpeng.li@amd.com, siqueira@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, simona@ffwll.ch, jerry.zuo@amd.com, wayne.lin@amd.com, yan.li@amd.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Satyajit Roy <sroy14@alum.utk.edu>
Subject: [PATCH 0/3] drm/amd/display: Fix HDMI RGB quantization updates
Message-ID: <20260830035120.937992-1-edu042sjroy@proton.me>
Feedback-ID: 147615787:user:proton
X-Pm-Message-ID: 282307d2556e7d497e19992471f8343a6200d0e5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Satyajit Roy <sroy14@alum.utk.edu>

The Broadcast RGB implementation currently has three gaps in the AMD
Display path:

  1. DM does not propagate the sink's RGB quantization-range
     selectability into DC, so the HDMI AVI InfoFrame Q field remains at
     its default value.
  2. BT.2020 RGB output is always selected as full range, so an explicit
     Limited setting has no effect in HDR modes using BT.2020 RGB.
  3. A property-only range transition updates the output CSC but does not
     rebuild and program the InfoFrame, leaving the sink with stale range
     signaling.

Together these can make the transmitted pixel range and the range inferred
by a television's automatic black-level setting disagree.

Patch 1 propagates the EDID QS capability. Patch 2 honors Limited for
BT.2020 RGB and adds KUnit coverage for both BT.2020 connector colorspace
values. Patch 3 rebuilds InfoFrames whenever output_color_space changes.

Validation performed on amd-staging-drm-next at the base commit below:

  - scripts/checkpatch.pl --strict: no errors, warnings, or checks
  - x86_64 AMD Display KUnit configuration built with CONFIG_WERROR=3Dy
  - new EDID-capability and BT.2020 quantization KUnit cases compiled

Equivalent changes were also tested on an HDMI 2.1 television with a
Valve Linux 7.2 kernel. The television's automatic black-level selection
followed Full-to-Limited and Limited-to-Full transitions in SDR, HDR, and
HDR with VRR active. No modeset or visible link blank was observed.

Satyajit Roy (3):
  drm/amd/display: Propagate HDMI RGB quantization selectability
  drm/amd/display: Honor Broadcast RGB for BT.2020 RGB output
  drm/amd/display: Rebuild InfoFrames on output color space changes

 .../display/amdgpu_dm/amdgpu_dm_connector.c   | 10 +++--
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  1 +
 .../tests/amdgpu_dm_connector_test.c          | 37 +++++++++++++++++++
 .../amdgpu_dm/tests/amdgpu_dm_helpers_test.c  |  2 +
 drivers/gpu/drm/amd/display/dc/core/dc.c      |  3 ++
 5 files changed, 50 insertions(+), 3 deletions(-)


base-commit: 75a5e1b6b3661c3f946885d01eebeb6b031035ef
--=20
2.51.1


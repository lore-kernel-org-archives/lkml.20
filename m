Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794598840;
	b=o33SOxgae9yF98g1qV9QLqgCOreiVtgusVuv0cMEa+FFBd8dQbi2XGGcIVpeHzKuR8UA
	 O5YNzGvUvBTUHrn8UFiKkAwSc8Mr4P5LB/8m8yenSK04g90tQDbstYJusZGAml1wJuqDz
	 WCppS3wRTsmdWS2fm0Jzi1YD8ldTTojHdY4TBGk+8sLhqoZtroFJomUv94DsfUjvC8D1t
	 xrRCr08ZmNY7Xu4aVf/NHVQ8lj1XbKu68J2J5pcF+lG7LJ69Ktpu+fKWtY3FR/ZbbQJg4
	 BhM2JFBLtRRaJeieAk5Ic5jOb3SROIVFzQoJNauyoMdWTYsC2lx/R88cSoi5hRTRkFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794598840;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ind5FxGKhk0lKjeY6Q70KuM8MMphQWZaP571DKXATas=;
	b=jnIlziLGSKeFAhXl94JPoU0nFBiIrpk2qvY4/bLajp1WmI9RcLs5Zsh76bTptFCQozcw
	 KyAwmSngLTTxTEkZpuVQgcXE9T7fNMXBnda6/MkMudwj2mFnOdnBJoqFIJXjzCzHBUWou
	 upGYFn7Tcnsfr3mLkkOZdHn7Bq5hIBnTTN9PKWBjWZStvA6uFd1GU1Qh/6MFVLNOttRWZ
	 afvTpZSlediMvlrzg4NiAF6MEwOdClyap7MCbR0JSgCpkUgXF+d6ElMHY/vpJF4tnnueb
	 i94b1Ac7UcpKEAIxvn7X0G9PSFcW+f9Ob1W9LWQxU8QGMo5LPoxdnUnDgyZM+O8m5Qg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNnPKJE+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7D606A330
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VNnPKJE+
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794598840;
	b=Rz3oT/5Men57gJpViXNJY+ppjxY4yAyC+SItmtorks4Xa0n9MYjX7unhcET/ffE/fmAi
	 KrZMGuhRRE4mGM/QS9e4HAk74DLIGBDpnMec2hdNW0pD/ULz71bqHh89ODY1GEWtpe5Oh
	 2saCf/db/tM6Nu9HXPprC/IPmYNre7ucZY2RYqcfcQQIvj3kjNhlGumJicnoWxsILerlK
	 UNMxho9ZqJDjfw7Kty/DGosCA+n1R4MHpVI9eydkMNaoyOPGWLQSC6RybJQ+tus1ebyBH
	 cU1R8BbPSet971vrVn9KuqVB8yzs9Z0Iktg9ZC8KkAUf1OvjjQpyt1bwuZA5F4j7SoA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794598840;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ind5FxGKhk0lKjeY6Q70KuM8MMphQWZaP571DKXATas=;
	b=h0ZSSXUohAqiNxiXeXGG1d2Nw+u3RRjNq8SK5FUJZptXODXHKxBGrUIh1ZHL6VEoF8zO
	 Uel8n49Yvj6svuFgPBknzB2r+ABoxBNXtvyE4bGe8JvfaxGU8O5zPQ8E/HFyrmYXYFx+F
	 cmEqAvMxX5bg6lMUUGz0Dp5m6tTOtW/qxm0I0kVTka67DjmoLb6zLaAoGDzxRG5m3poIB
	 UNqHEsLxN6abPYei4Q0+cWnPJVge6ip5F1y0MUITS6WcJ/lxKCkOE8oL3+aZev82fPrL7
	 88n6KKfIMnfYGU8hOu8MfvRaOW8Mi9ECmZI/7rZpz0qtW6Py4zZaHZar7c0weZdT81g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7D20B1F000C5;
	Fri, 13 Nov 2026 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794598840;
	bh=ind5FxGKhk0lKjeY6Q70KuM8MMphQWZaP571DKXATas=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=VNnPKJE+9Xqcz0CVT/+979EDcqZZXXAc2gYnGAdiJE9fcv5k0chQFW1JH73BIDgNR
	 qQRE/s8edVMfkJGQLXn+zfV4HSVPMUa5uRD5sam4djLWyEmmqPawDiBy55qC0lZuzp
	 0iY8dZFFaHtgfWCEGDD8WzHRTXqP/ppSrm2mEkrZvWXx75HzcZet5Cudbn4jmnXssv
	 oGvEExbXc4s8xEEHdQZi/G5/of0Dl9I63MicA1UpmP3wWQWIhbemC5P/qZSDs1BiIJ
	 R9D+ECc4SolBaYoJ7hyk8qbv1pIPz0P4kadGs5vwqqyLCto+iulXWHG9pgUnOiz3Rm
	 Q/Q3Y0coNcrXw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D5CD449A9F;
	Fri, 13 Nov 2026 19:40:38 +0000 (UTC)
From: Hugo Sales via B4 Relay <devnull+hugo.hsal.es@kernel.org>
Subject: [PATCH v2 0/3] drm/amd/display: Leave self-refresh before an ABM
 level update
Date: Fri, 13 Nov 2026 19:40:37 +0000
Message-Id: <20261113-amdgpu-psr-abm-update-next-v2-0-27ce790856ea@hsal.es>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSwqDMBAA0KvIrDtgRuiiVxEX+UztFIwhkxRBv
 HujLt/m7aCchRVe3Q6Zf6KyxgZ6dOA/Ns6MEpqBenoaYwa0S5hTxaQZrVuwpmALY+StYGDqnaf
 BGfLQgpT5LduVj9Ntre7LvpwjHMcfyxIo634AAAA=
X-Change-ID: 20261113-amdgpu-psr-abm-update-next-de20bc23b12c
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Roman Li <Roman.Li@amd.com>, 
 Nicholas Kazlauskas <Nicholas.Kazlauskas@amd.com>, 
 Chenyu Chen <chen-yu.chen@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hugo Sales <hugo@hsal.es>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2896; i=hugo@hsal.es;
 h=from:subject:message-id;
 bh=l8jc4NsRdgsccOogzVgaadplkZp52O9iy+YV0TvTNG0=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsr6nb9M50DXd5PTP5fpTLqQktyk71sg3aGjntxrba
 jysTRN9vbujlIVBjItBVkyRRfeGJwPLxMkzc4qeL4GZw8oEMoSBi1MAJmLPyfA/vquOdUtvm4vd
 Rb9D269WeQsbbuGa9e1+zLrIG2s1+xb5MPyVvRNdHpFba9zBrm+0Ki3khErs/SaXdSIfNJ6yPt7
 XpcIKAAJFSNw=
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Endpoint-Received: by B4 Relay for hugo@hsal.es/default with auth_id=1417
X-Original-From: Hugo Sales <hugo@hsal.es>
Reply-To: hugo@hsal.es

Writing panel_power_savings while the eDP is in PSR hangs DMUB on a
Cezanne laptop (DCN 2.1). An ABM level change on its own is a fast
update, so the new level reaches DMUB with the panel still in
self-refresh. Chenyu Chen confirmed the same on Renoir

Patch 1 adds helpers that tell whether a PSR or Replay event is already
set on a stream. Patch 2 is the fix. It sets the PSR and Replay
hw_programming events around the DC update that carries the new level,
and clears only the events it set. An event that a full update, a
modeset or a PSR SU dirty rect change set stays set, for that code to
clear. Patch 3 stops amdgpu_dm_commit_planes() from sending the same
level again after the connector update loop sent it, so one level change
leaves self-refresh once

"drm/amd/display: Don't force a modeset when the ABM level changes" [1]
sends property changes down this fast path, so it needs this series first

HDR metadata may have the same problem. When the HDR static metadata
changes while HDR stays on, the commit is a fast update too, and the
connector loop in amdgpu_dm_atomic_commit_tail() sends the new HDR
infopacket to DC with the panel still in self-refresh. I have no panel
with HDR and PSR or Replay to try it on, and the VRR and AVI infopackets
already reach DC the same way. Does an infopacket update in self-refresh
need the same pause?

v2:
- Clear the events right after the DC update, under dc_lock, instead of
  on the next fast commit (Chenyu)
- Only clear the events this update set, so an event that a full
  update, a modeset or a dirty rect change set in the same commit stays
  set
- Add amdgpu_dm_psr_event_is_set() and amdgpu_dm_replay_event_is_set(),
  with KUnit tests
- Send a changed level once per commit, so it leaves self-refresh once

v1: https://lore.kernel.org/r/20261031130002.2335615-1-hugo@hsal.es

[1] https://lore.kernel.org/r/20261102-abm-sysfs-commit-v1-2-e5addfd9539a@hsal.es

---
Hugo Sales (3):
      drm/amd/display: Add helpers to check PSR and Replay events
      drm/amd/display: Leave self-refresh before an ABM level update
      drm/amd/display: Send a changed ABM level once per commit

 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |  83 +++++++++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c  |  24 +++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.h  |   2 +
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.c   |  25 +++++
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_replay.h   |   3 +
 .../display/amdgpu_dm/tests/amdgpu_dm_psr_test.c   |  60 ++++++++++++
 .../amdgpu_dm/tests/amdgpu_dm_replay_test.c        | 102 +++++++++++++++------
 7 files changed, 263 insertions(+), 36 deletions(-)
---
base-commit: ba496bb837882eb1af58f41572fc289e46c77b8c
change-id: 20261113-amdgpu-psr-abm-update-next-de20bc23b12c

Best regards,
--  
Hugo Sales <hugo@hsal.es>



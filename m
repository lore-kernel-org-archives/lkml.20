Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801755;
	b=uCuufpEfFQ3xvAz0kgWWJpxzYeAQRPC+aE9UuMlYP/Uv6/riR/mLyntrmw3oMdUg3nVE
	 8G8yT6v8gLJa2ievXql2kJVRXFxrq03KMHjm4L6NTPyvRUG9GDiuHrc3yhCvT6A388lqk
	 MINUGMsoZozTehY9dZATMTVP4pnywLArjKCLMzZq7FYT4L3Elti+tbvo/5AyMRYSWpVSJ
	 ZIeMgtxWAU8QF6sMD+R/HkgQ5lDdr90InrFI4oDJ0ogBytUVQ8u17904sXZTZSwN5gW25
	 Lxn8dUXIdHrTs5FUw4MX7PPlDoSFKMmE/Z0yq1GAftHiY3nl3+bDajq/zixXy3p70gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801755;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=nrT6N3M6R+QLNzlhc/4Q2kGa3Co/mkpc+sZ0fsitGnA=;
	b=nGTNzhhL1zeQ/dSSSwO+GC27Qv7IMPqazXHMPdAdbVqLeUIwYG4P52hs+jJCOKoJwVP7
	 qqSwSDmBqt65EdaDGH5KtPm0PcEFUMhMdmikLU7NVBOdA5uqf3FAiIXnVQc4wD7BaYKP/
	 Dsr188WAgHj7pJt7KYjO4DBNKkDNEAXJVcLg9o3F0ag8lySX+rlsycGjzNJed59KA2zsw
	 5KRQya/whBTK5Fakye+ecIWWtFud1SHYk0obcU7kejMRIr8ck0EWKt5S960T3bP6r9WHf
	 gXN9supLqt8wA7qkQ4JaO+8bb5ysh2fQmVjDI3k5OkDE3e5yE697I68cLEFJ94nwuAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hsal.es;
	spf=pass smtp.mailfrom=hsal.es;
	dkim=pass header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=SHSd3Shd;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE7F606EE8D;
	Wed,  4 Nov 2026 14:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DE7F606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=hsal.es
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hsal.es
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=hsal.es header.i=@hsal.es header.a=rsa-sha256 header.s=MBO0001 header.b=SHSd3Shd
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jKSCY3KgYzMlww;
	Wed, 04 Nov 2026 15:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hsal.es; s=MBO0001;
	t=1793801753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nrT6N3M6R+QLNzlhc/4Q2kGa3Co/mkpc+sZ0fsitGnA=;
	b=SHSd3Shds7zDCI9ShyZUsMo4zA5wENk/4IOLEukc2n1K+l6tS9X16DXxWwIrdMmtvzLn+h
	HlEYiDvwFk+kNO87BeASlwQkHZEsRy1dtJiTZqst1mviNFzx5AQMDZ8Cm1jU5Fey4IE3Qe
	idG1And5s3TrT/RDiKhfLCsP0LuncbhjHOt/t8PHT7w+BLgSll3Ci3F3rKkz7nkebcpk6h
	8QpabdtteUjkiet7AUmgTteEoHg33uszJW1p+bIQuXcIj2b7JGbWLpY6bUTJGiOf/HdnCw
	peHGuwGHsCLsX25TjezPFu6i5aD6VlSQkzNie8fEQugajlmHGqgl9LJecyiLBw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of hugo@hsal.es designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=hugo@hsal.es
From: Hugo Sales <hugo@hsal.es>
Date: Mon,  2 Nov 2026 10:17:55 +0000
Subject: [PATCH 2/5] drm/amd/display: Don't force a modeset when the ABM
 level changes
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
Message-Id: <20261102-abm-sysfs-commit-v1-2-e5addfd9539a@hsal.es>
References: <20261102-abm-sysfs-commit-v1-0-e5addfd9539a@hsal.es>
In-Reply-To: <20261102-abm-sysfs-commit-v1-0-e5addfd9539a@hsal.es>
To: sunpeng.li@amd.com, siqueira@igalia.com, amd-gfx@lists.freedesktop.org, 
 alexander.deucher@amd.com, harry.wentland@amd.com
Cc: Hugo Sales <hugo@hsal.es>, airlied@gmail.com, 
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com, 
 christian.koenig@amd.com, simona@ffwll.ch, linux-doc@vger.kernel.org, 
 bhawanpreet.lakha@amd.com, ivan.lipski@amd.com, 
 dri-devel@lists.freedesktop.org, ray.wu@amd.com, alex.hung@amd.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698; i=hugo@hsal.es;
 h=from:subject:message-id; bh=Wwinkxn78FM9OoICfBjaIhV+CO/pTwUFVip3G7C8i1s=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsl4khx34uzr56oS3raxe/GW1Ko6aGzfIHOlQs+9VM
 88tdzPaKtRRysIgxsUgK6bIonvDk4Fl4uSZOUXPl8DMYWUCGcLAxSkAE5nFxshw9dMzx5VKSxi8
 vs6qqI5O2uRT5h7y5HaVfPn7yeoXrR2sGP4ZBeS1XHj9v85kQUn8KdXKm8my4p2r7D4uL74eZ59
 X94kfAHhiSSA=
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Rspamd-Queue-Id: 4jKSCY3KgYzMlww

An upcoming patch commits panel_power_savings writes from the kernel
without a modeset. amdgpu_dm_atomic_check() sets connectors_changed on the
CRTC when the connector's ABM level changes, so that commit would fail
with -EINVAL

The flag came in with commit c5892a102182 ("drm/amd/display: Fix dmesg
warning from setting abm level"), because setting the level did not add
the CRTC to the commit and no stream update reached DC. With other changes
since then, that fix is no longer needed. On the non-modeset path,
dm_update_crtc_state() copies the level from the connector to the CRTC
state and the commit tail sends a changed level as stream_update.abm_level

Keep the flag for scaling changes, which move the stream's source and
destination rectangles

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
Upstream, a level already reaches DC this way when a compositor commits
the connector after a panel_power_savings write. The store has already
written the level into the current connector state, so the old and new
connector states match and atomic check doesn't ask for a modeset. Only
the CRTC state, which still holds the old level, sees the change. With
this series, the hardware tests in the cover letter apply every level this
way

If a level change through the KMS property should still force a modeset,
the store could flag its own commits instead. It would set a flag in
dm_connector_state that atomic check reads to skip connectors_changed.
duplicate_state wouldn't copy the flag, so it only lasts for that one
commit. I think it's simpler to treat the change the same way whoever made
it, but I can send that version

Scaling has been in the same check since commit 3c6d1aeb4342.
From my reading the non-modeset path handles it too, as a src/dst stream
update, but it changes the scaler ratio and I can't tell whether DC needs
the full validation for that. Could it go as well?
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index dfbc384fbbdb4..256699cdd0b5c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6304,8 +6304,7 @@ STATIC_IFN_KUNIT int amdgpu_dm_atomic_check(struct drm_device *dev,
 			goto fail;
 		}
 
-		if (dm_old_con_state->abm_level != dm_new_con_state->abm_level ||
-		    dm_old_con_state->scaling != dm_new_con_state->scaling)
+		if (dm_old_con_state->scaling != dm_new_con_state->scaling)
 			new_crtc_state->connectors_changed = true;
 	}
 

-- 
2.56.0


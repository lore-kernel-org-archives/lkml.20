Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718254CF60
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878130; cv=none; b=bQPt12oE6+6bEkARZQlMRC0hbqZ649ODABJ5ZcXjtNpjBb973+9UyLXcfTx4ryUJHg7TztF5VgTcGSXfQHhpiTitASAV3plJS6Ph9MzNbOKK9bLFS05ReDQaPkqYeSXJrYncht0+UsQIfbLKa8mLgfXAKuOsOCF0mHQmfQAXfY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878130; c=relaxed/simple;
	bh=2drg0SUGm0XwLFfo/wi4sL4pww1TepXsKXZ65lkG8Po=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hXoBjeXA+HbwQ6ADoY04qGS//nIqAaY3JLMmGzavOm9qcKh6xgA1QiJWEGsC6xmyBTE3cNj3WHpzPntmQJxj/IR1lxrv3YS1dQcIkP7bsvZxdskg5oA0reENsOJUmpxotCLxKtA2uit+c9h1n3+jRbXR+79ZUDjiljZqBGgXwZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oy8yVTit; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oy8yVTit"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 577DD1F00A3D;
	Tue,  8 Sep 2026 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788878115;
	bh=4+NP7Y8ofzXWxvoRwWfepIf+jnMd8fP+DrMk3TDdkco=;
	h=From:Subject:Date:To:Cc;
	b=oy8yVTitVhrgDQFB5WwsVukWT0+Z3tbimtX+/23zyAOWNm93qyr9dlIGa45CrJ9wq
	 CQuMydnrC87bShwrbGKeL9CC4uGPqfRL6RLeFcQfiK3QbBzLLvtCR+zpSPMGEgBuT6
	 UqV18TgAajcDGdsn6D5Q83ApwPW5fVJHdq7K94uJIH2U8tyXGzhFe4GYgNeNxD1U3K
	 VxF6Vsy/25R77+kfmmvhQ4KX0Szwe+aqD7qsJ8Dt7lRhyh09YMN+AGxrHIPQs5J9fV
	 1ZND1LtvDftSeDqhCoJfrZzc2QkQs10G1vXAkL1LU0HKVQo7zJb5NlDVvVZVLG4pig
	 i/RUFgVemfBCQ==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v3 00/11] drm: Add DRM_MODE_ATOMIC_RESET flag
Date: Tue, 08 Sep 2026 16:35:01 +0200
Message-Id: <20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQ6CMBCG4auQrh3TH6HFlfcwLqAdoFHBTJtGQ
 7i7hY1xYVy+XzLPzCwgeQzsWMyMMPngpzGH2hXMDs3YI3iXm0kuK665AUd3IAwYIcQmInS3pgf
 ZtbIttRBdrVk+fRB2/rmx50vuwYc40Wv7ksS6/gGTAA5WaWdrUx5M6U5XpBFv+4l6topJfhQj5
 A9FZgXryqJQSmj3rSzL8gaUlUCq/wAAAA==
X-Change-ID: 20260708-drm-reset-state-flag-2fb2b5711f97
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 =?utf-8?q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, 
 Victoria Brekenfeld <victoria@system76.com>, 
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3686; i=mripard@kernel.org;
 h=from:subject:message-id; bh=2drg0SUGm0XwLFfo/wi4sL4pww1TepXsKXZ65lkG8Po=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkLZKUrti+JzNqTXP7h9j2v7//fTd2scvhn8jT93a+Eu
 B5qL9HQ6JjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATuVXB2PD8XMXhBMn2tU91
 27NKfkvypa9NubDlebPWb7uqQHW52AYVr61zzSIn+NuqGlqqr1l8n7Fhu4uWi8m+oq/vnIQmHH2
 v9KG6fDm/j9UjAzPdTWYTZ/JvmL+svCY0SGTdkTqBa/raCewA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

Userspace currently has no atomic way to bring a display pipeline back
to a pristine state. A compositor that wants to start from a known
baseline must explicitly set every property on every KMS object to its
default value, which requires tracking which properties exist and what
their defaults are. This is fragile and must be updated every time a
new property is added to the kernel.

This series introduces a new DRM_MODE_ATOMIC_RESET flag for the
atomic ioctl. When set, the kernel fills the commit with default
states for all KMS objects before applying the properties supplied in
the request. Properties not explicitly included remain at their
defaults. This allows userspace to describe the desired end state
declaratively, without caring about the current state or the full set
of properties.

The bulk of the series extracts the state insertion logic from each
drm_atomic_get_*_state() into standalone helpers, since the
fill_with_defaults path creates states through atomic_create_state()
rather than atomic_duplicate_state() and cannot reuse the existing
functions directly.

A driver-specific property is added to vkms planes for testing.
Standard properties are impractical for this: compositors like Mutter
enumerate all known properties, making it hard to isolate the reset
behavior in a test.

Mutter has a working implementation using the new flag, with a
vkms-based test exercising the reset behavior:
https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/5309

This series relies on all drivers implementing atomic_create_state.
The conversion is in progress but not yet complete.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v3:
- Rebased on top of the latest atomic_create_state series
- Sebastian Wick created and tested this work with mutter and vkms
- Fix colorop locking
- Link to v2: https://lore.kernel.org/r/20260812-drm-reset-state-flag-v2-0-e96ce13317dd@kernel.org

Changes in v2:
- Fix bisection
- Add capability to let userspace know if it can reset the state
- Link to v1: https://lore.kernel.org/r/20260708-drm-reset-state-flag-v1-0-c37dc985485d@kernel.org

---
Maxime Ripard (10):
      drm/atomic: colorop: Rename state to state_to_destroy
      drm/atomic: Create function to insert CRTC state into a commit
      drm/atomic: Create function to insert plane state into a commit
      drm/atomic: Create function to insert colorop state into a commit
      drm/atomic: Create function to insert private obj state into a commit
      drm/atomic: Create function to insert connector state into a commit
      drm/atomic: Add drm_atomic_can_create_state() helper
      drm/atomic: Allow filling a commit with pristine object states
      drm/vkms: Switch container_of helpers to container_of_const
      drm/vkms: Add driver-specific plane property for testing

Sebastian Wick (1):
      drm/atomic-uapi: Add DRM_MODE_ATOMIC_RESET flag

 drivers/gpu/drm/drm_atomic.c        | 390 ++++++++++++++++++++++++++++++------
 drivers/gpu/drm/drm_atomic_helper.c |   2 +-
 drivers/gpu/drm/drm_atomic_uapi.c   |  13 ++
 drivers/gpu/drm/drm_ioctl.c         |   4 +
 drivers/gpu/drm/vkms/vkms_drv.h     |  11 +-
 drivers/gpu/drm/vkms/vkms_plane.c   |  61 +++++-
 include/drm/drm_atomic.h            |  21 +-
 include/uapi/drm/drm.h              |  10 +
 include/uapi/drm/drm_mode.h         |  14 +-
 9 files changed, 452 insertions(+), 74 deletions(-)
---
base-commit: 84a558e0a7cec3d96a0ce536371835c3cea4379a
change-id: 20260708-drm-reset-state-flag-2fb2b5711f97

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


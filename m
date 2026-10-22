Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677198;
	b=uEdJ3xI94Tcmc5ejqRjRpfbBIaCaQVkQmQe+aMtNi7x5xFDl7CZ9GHo+eFHUfl9wyR3+
	 mJB/cPSSy+SNGsQsMf75Kym0j6WFQqSousI2yqomKjqWANEFCvZL38AQzKP7lNh9S6To7
	 99URqWjoqhpjk/1rlx9hgVPfNp/MVKuWA+DSkpenvaLh411VwMz2M9qyDE0FyZCuS9Sis
	 WO4ooZiEsIq/MswVl0FyIjLdRhMr+8JH39g1sLgHe3WG/UICmCA2uGoU9uZL6LIQm+fBT
	 +gJTaJU5ZMFP5jn1iIZ3AJbS8zjk/WckFKjHiLdFwo8xtwF7haClHBJllIk3y6tsxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677198;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=IpUq/OjiNWccmva9eLiM8o2ics/m5yOdrT3sfjEjErU=;
	b=uTfhMKSqgLCmAz3HeH16U+Rk52ZHZrAsb3HKrLLpVtB/Oa2wjuESTAVW6C1s7rc6hKrT
	 ebbb6C8u2AHAiunjbfQLEz7OjtqMyaNApHeVooF1TycfOxgpBfioUHPsRCaQyc6hxpct4
	 XaPaHriEdlmXnsuBJoGagIqvh3H9zbXwtRgiDJUx9Ugy6/NBdjY4JiLQw9a1KG//bEp92
	 DbQoRzw2JSsa3GXbfBkl6/IdHhZtVxUQTW2912tBn6D5Dvg/NA7PriwNiK/Zg6Un3FLXH
	 iJitouIGf8e6XrrVV0j1mVs6yxzghhLTqpydA9r5WoQG1AIrnrk6AMwXfQISH92bSWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I90b8iUd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320F60A2609
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I90b8iUd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DCA41F000C4;
	Thu, 22 Oct 2026 13:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792677197;
	bh=IpUq/OjiNWccmva9eLiM8o2ics/m5yOdrT3sfjEjErU=;
	h=From:Subject:Date:To:Cc;
	b=I90b8iUd2TgG4ICdQ+nVI2Z2Abx8obin1qEQTRbvITTVdIVLKRJh0ve8ax4AuMPWb
	 w+Lu6EqTkA2WMOr0svFEXR3tTGuXAa3o0btAlyKEUWDY85+qdzGbJrPhEOdFIMyd9m
	 sfJ5iqbjYPqkrUNCGvv0yAalC9H9E2v+u8UQmCGteMoJQHhG3k9IfdT5dd7TODuhO3
	 0OQAH0F2rsizukbxqfTRIc9FjTDUsf9Woh3FmPFICxe/AssBGXehegWnL11DfIBtuW
	 +gNrqPBv2rCE/5m0+Fq+Ibn+293Hj4Hp40ISdf72xGzKtRunzIUN3n/jcPi9lPQaHQ
	 9G8JqzlWVfTrw==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v6 00/15] drm: Add DRM_MODE_ATOMIC_RESET flag
Date: Thu, 22 Oct 2026 15:53:01 +0200
Message-Id: <20261022-drm-reset-state-flag-v6-0-f36d640b7e76@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XRS2rDMBAG4KsYraui9yOr3qNkIUsjRzS2W0kxL
 SF3r5JA02JMl//AfDPMnFGBnKCgXXdGGZZU0jy1oJ465A9uGgCn0DJihCmiicEhjzhDgYpLdRV
 wPLoBs9izXmpKo9Wotb5niOnzxr7uWz6kUuf8dZuy0Gv1H3ChmGDPdfDWSGFkeHmDPMHxec4Du
 ooLeyiGsg2FNQWs8kA5pzqsFf5Q7OYuvCmWSKlJ5EY7sVLEL4VuKaIp0gVKFG8QkStF/iiUULW
 hyKYEF1hQoleW93+Uy/30GT5O7ZH1fn/UuwLYz+OY6q4TxjojufVOxdZw+Qae0gQeAQIAAA==
X-Change-ID: 20260708-drm-reset-state-flag-2fb2b5711f97
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Jocelyn Falempe <jfalempe@redhat.com>, 
 =?utf-8?q?Jonas_=C3=85dahl?= <jadahl@redhat.com>, 
 =?utf-8?q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, 
 Pekka Paalanen <pekka.paalanen@collabora.com>, 
 Sebastian Wick <sebastian.wick@redhat.com>, Simon Ser <contact@emersion.fr>, 
 Victoria Brekenfeld <victoria@system76.com>, 
 Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
 Daniel Stone <daniel@fooishbar.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5358; i=mripard@kernel.org;
 h=from:subject:message-id; bh=umcqg+1I7mYY1xFgpimFgQ+TJGE3mXbOmISj3U3WXA8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFm3RJ090urEDkmVLWlKP6ErdFb/zJr7vBVvNqcKeR208
 PLtm1raMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyToGx4UAGs/DVm6efhT1b
 +93q/N/6lG2Ckfc7TrauPP7gJPecf/H5xltUf23pyPnLfaxwFc/Ur4wNa34G8fI6TOw8sH3zz4q
 wmfa7nFbsOlesLDIz//PqXVkx4W1ftGyXacc47VnQa7pwy3smAA==
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

And we have IGT tests as well:
https://lore.kernel.org/igt-dev/20260916095159.2896630-1-mripard@kernel.org/

This series relies on all drivers implementing atomic_create_state.
The conversion is in progress but not yet complete.

Let me know what you think,
Maxime

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v6:
- If using a lease, only considered the leased objects
- Fix amdgpu plane atomic_create_state implementation
- Link to v5: https://lore.kernel.org/r/20261016-drm-reset-state-flag-v5-0-dad2d64b693b@kernel.org

Changes in v5:
- Fix bisection issue
- Improve the documentation
- Fix connector hotplugging issue
- Added kunit tests for drm_atomic_commit_fill_with_defaults()
- Link to v4: https://lore.kernel.org/r/20260918-drm-reset-state-flag-v4-0-5ad106370f05@kernel.org

Changes in v4:
- Improve the drm_atomic_get_private_obj_state and
  drm_atomic_get_connector_state array reallocations
- Return void on functions to insert an object state into a commit when
  it cannot fail
- Rename drm_atomic_can_create_state() into
  drm_atomic_implements_create_state()
- Move capability check from drm_atomic_commit_fill_with_defaults to its
  caller 
- Added IGT test
- Link to v3: https://lore.kernel.org/r/20260908-drm-reset-state-flag-v3-0-905570f387a4@kernel.org

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
Maxime Ripard (14):
      drm/amd/display: Fix planes atomic_create_state implementation
      drm/atomic: Switch to krealloc_array() in drm_atomic_get_private_obj_state()
      drm/atomic: Use __GFP_ZERO instead of explicit memset in drm_atomic_get_private_obj_state()
      drm/atomic: Use __GFP_ZERO instead of explicit memset in drm_atomic_get_connector_state()
      drm/atomic: Create function to insert CRTC state into a commit
      drm/atomic: Create function to insert plane state into a commit
      drm/atomic: Create function to insert colorop state into a commit
      drm/atomic: Create function to insert private obj state into a commit
      drm/atomic: Create function to insert connector state into a commit
      drm/atomic: Add drm_atomic_implements_create_state() helper
      drm/atomic: Allow filling a commit with pristine object states
      drm/tests: atomic: Add tests for drm_atomic_commit_fill_with_defaults()
      drm/vkms: Switch container_of helpers to container_of_const
      drm/vkms: Add driver-specific plane property for testing

Sebastian Wick (1):
      drm/atomic-uapi: Add DRM_MODE_ATOMIC_RESET flag

 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    |   3 -
 drivers/gpu/drm/drm_atomic.c                       | 381 +++++++++++++++++----
 drivers/gpu/drm/drm_atomic_uapi.c                  |  18 +
 drivers/gpu/drm/drm_ioctl.c                        |   4 +
 drivers/gpu/drm/tests/drm_atomic_test.c            | 141 +++++++-
 drivers/gpu/drm/vkms/vkms_drv.h                    |  11 +-
 drivers/gpu/drm/vkms/vkms_plane.c                  |  61 +++-
 include/drm/drm_atomic.h                           |   4 +
 include/uapi/drm/drm.h                             |  10 +
 include/uapi/drm/drm_mode.h                        |  14 +-
 10 files changed, 572 insertions(+), 75 deletions(-)
---
base-commit: 489a8539ca6f347102c1334c2f08198abacc86c8
change-id: 20260708-drm-reset-state-flag-2fb2b5711f97

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>


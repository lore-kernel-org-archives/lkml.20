Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794837666;
	b=ZfY1kJqcBVZl6BiZWm9Fjd+tGByty2gb2yI91DfawEUK+PUyQvOWdVAOCaINYhpnvQLz
	 OVXjAR91HDc8j+xH3JauVDOmjctjL0iwawgw8R9i5S0vDZwxLj3WJaYCWpzmcQrWdt/KX
	 QFDv+g1fbA3n9SXCmvdZngAcEpixwB6XatGgm6mh5XexAw1bq7mOcbMhbhH3gDtWjzuqS
	 G/MIclZX4DrKXI0hnvkF4PXTNuAOKmR3GOaj/UNvOXhIzLLLm0Ero4QCCMH2JRWJMjE+B
	 g6N0teL43nIAWnqdZpyLXROr6P9hNVhn+XLsKhHIfOL2VNlfWCYyxUUWTxv+gfDoWLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837666;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TlcNcFV/e6ku1Q/CV6lyI3bgB/SHhlBbcUeMj52adDI=;
	b=3chMEsibcGrvicjfdRYnVsSYGL8Ai6Ik/r+MQA5yTCF0agih4E7T8IDFLJOSkLNfNcR4
	 jMChVWKp66SiYFozPNKUIy9qecl8HXCVm/ZGqGZAfaXH+s0rJPn4CCz5SZZvRL3q7nK52
	 1JJtUTiO6XFWX3mXmDhEHhMxhHY3A3c5DENENm9hIP0fPDT30jqQDsCxuNLszgD5H+zHE
	 oA81rRtqIM6qkUiGOtoyfdGU52Dey3toTDnLnsX+HkW8qK77lRBq5Y+Lzr/HDNFBMJES8
	 VUNyQlVonUnftNQkfWUz4f9A/RrCJiyuaMFMJwG7SNoYO4G/K2kqVZpCXW04fA6w6xQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ey29Xf6J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22458606A339;
	Mon, 16 Nov 2026 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ey29Xf6J
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794837665;
	b=cxt0vokZIJV4iLuPIHUR+VJ3CEdW8Ii5idcs0cf/4iBRIq36ydOl1kBwCU7gCJXPMRUA
	 nMUGDz+SlQdvcjwSY+viQnyZFk9Nuru/YHkeHMHBJz1ATcdMwnUtkE9fYqtVcfpmPQQYH
	 eWiGxfB5Z7U4Jvg4JEMhFkSRXl1t1V95UBjjlsPUpRc3a0zxKLRxIbJO8mw5VEGJCDUCq
	 5YqmfWLH6SNGHi19mW//PctK9F1HjJ0pryIET0NfqiuuWpz++/twa3Z/ltw5PNdykhLPp
	 ZKJ8wOfSA2H5DBIpy8kRp9xYnW0t4hSB+zkivNPdTr01oFAbgw6P6QVCeEcfi1Y9X3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794837665;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TlcNcFV/e6ku1Q/CV6lyI3bgB/SHhlBbcUeMj52adDI=;
	b=1Pm//x55opp/ieEqJvvwfTjQ9Hs/5KQbRhvFMHDzPdF8XUb7GNV1KWMiNsafgdi50D0R
	 SMpXHosxJi2if6q/eERla3G/hX5Hx0j4THqmNiPouK2a3A0fUuvmWME3dR37IqvDUiiV6
	 aVG6bfLzEK/4MQRyrRk+46M2whRuOd95iN/oQdiRVR5QZ+DGdvJnk1ZTnLF/NAf9dSS9s
	 +lntrXkVWiB5G0JaFHF66WQywNbvMRGn0XVvSvVUdOxJMCLivYMRGyTNuCU3RHbJhx9L5
	 h58y9MGBiQveSjhPFcvYL9lhsUvLGq0W8iwEKrTNNdE3LWcPZKCffA3mR341sPGabIA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B03C1F000C9;
	Mon, 16 Nov 2026 14:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837665;
	bh=TlcNcFV/e6ku1Q/CV6lyI3bgB/SHhlBbcUeMj52adDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ey29Xf6JyFJfpHI71UBshi9RsQA901NIwWdnTM2fMzynsr1vQVWsEjsYP0tsf5eun
	 iyP7OwLxs/d/SLygG8ElkXIeuLqNVZmowjo/0FpGROimtjdfBum8a+7K9015kcM8s3
	 3LzLa732mmQjR5p44NyUUoFakzM2iy1v6HK2ibU+yHa63rgsuijTGqPeTvRCNtXJ7E
	 OV0ahGjVm0S0hjpfQLYrLknlxj+PpZRrqqEAL8GaabXW3+jqOxpDeOZ2jnePRyn5NY
	 zsnViM3tJIAXpJpgT1SWCmcW2IlMQX7s+jYUKzc/i0GMZHhD1amtsaZ0FYV2CDS53C
	 tl7p7Tk7VnuXA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 847074A4AB;
	Mon, 16 Nov 2026 14:01:04 +0000 (UTC)
From: Hugo Sales via B4 Relay <devnull+hugo.hsal.es@kernel.org>
Date: Mon, 16 Nov 2026 14:01:03 +0000
Subject: [PATCH v3 1/6] drm/amd/display: Render the panel power savings
 kernel-doc
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
Message-Id: <20261116-abm-sysfs-commit-v3-1-7a3d84a5328e@hsal.es>
References: <20261116-abm-sysfs-commit-v3-0-7a3d84a5328e@hsal.es>
In-Reply-To: <20261116-abm-sysfs-commit-v3-0-7a3d84a5328e@hsal.es>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Ray Wu <ray.wu@amd.com>, 
 Alex Hung <alex.hung@amd.com>, 
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>, 
 David Weber <weber.aulendorf@gmail.com>, 
 Shivam Kalra <shivamkalra98@zohomail.in>, 
 Hamza Mahfooz <hamzamahfooz@linux.microsoft.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hugo Sales <hugo@hsal.es>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=hugo@hsal.es;
 h=from:subject:message-id;
 bh=FVHKsTcB+kzVbQ+9zevb2MG6df7WbrsHz6OXzX6yqvM=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsn7zzGdpqd6kKRUbEfRwLk8ZC0f8l2DxucdPWyQcL
 w3OtG69xNtRysIgxsUgK6bIonvDk4Fl4uSZOUXPl8DMYWUCGcLAxSkAE8lJZPgfkvfy3CKbJtZ3
 Dw0D5yWVVd+wNfn9997sl/vLWc45M98TZfif9GdGXfVTky+7z7+R/Ob15TTzVgXWg/E3JQ4FVAR
 d/tzKCQCkuUxx
X-Developer-Key: i=hugo@hsal.es; a=openpgp;
 fpr=193D095149CF7E8737B39064D912B0DB205A91C1
X-Endpoint-Received: by B4 Relay for hugo@hsal.es/default with auth_id=1417
X-Original-From: Hugo Sales <hugo@hsal.es>
Reply-To: hugo@hsal.es
Content-Transfer-Encoding: 7bit

From: Hugo Sales <hugo@hsal.es>

The DOC section for the panel_power_savings sysfs file is not included
in any rst file, so it never shows up in the built documentation. Add it
to the Display Properties section next to the 'adaptive backlight
modulation' property it interacts with

Signed-off-by: Hugo Sales <hugo@hsal.es>
---
 Documentation/gpu/amdgpu/display/display-manager.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/gpu/amdgpu/display/display-manager.rst b/Documentation/gpu/amdgpu/display/display-manager.rst
index f6de9e7779e29..ca4a956d2aa17 100644
--- a/Documentation/gpu/amdgpu/display/display-manager.rst
+++ b/Documentation/gpu/amdgpu/display/display-manager.rst
@@ -187,3 +187,6 @@ Display Properties
 
 .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
    :doc: property for adaptive backlight modulation
+
+.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+   :doc: panel power savings

-- 
2.56.0



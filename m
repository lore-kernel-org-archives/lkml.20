Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601489;
	b=JQCdvwm/7Y3dWrw8qWvC7+Gp5dMfoxWh6zoQJcZt+PwJGR3RbqRcax8W7poFM1gBEbsy
	 oYN9mMRVT6/0EW352Qb0wQuArVim3oQ/zeQWGLjAS2ZY+SzWyP7LBTa/5kGhL9lNnO0SV
	 m3lDk9hDKoEm27F8U/t8pa0JzwW1JH92+uI5wXpARTdjBKti+kT6TF5qoqT2w0pHxY6wM
	 BVk5PBB3ww64YhJhjTFRhb+tQyvQF9b8jRRBCKvKIbrHZQYCM00PXRcbaYZnQyFZRmaGZ
	 V0KMgkkZ4EO19Zi7NGGT6y7sBcr4iP/ibLCojuTKEUW0T0jrGmsMBxdZu3DyoTUeDaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601489;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TlcNcFV/e6ku1Q/CV6lyI3bgB/SHhlBbcUeMj52adDI=;
	b=vxuOUGywn3YEFTfa+ckX1DjR0MVNPU517+3RnACpmdDIOIxnBLsLUsNN/FJ/xwalQjZo
	 D8ZF9Dy9exfuFLTIoeRCTG0Cqnm+qUIBVL3sg7X+Nt4hkblcouWnKFVPtKxY7Uo74AZC+
	 8obU7mGyS7XGRsXrVL6TpD5OtKQukphvMlk++LD8jRurNj3TLSU4AO0egE73m7BKTZgx3
	 NLMpan7l3VOZF45H2QnqtX/m/Q87/lYumRU9nPlDV4q02M5j/Mb6kJ0RNjVLk5aUoiyPI
	 khySMkoXMtx7/TcT94k26bb7w26Pxl6gfvLvvj6D19mTzYl4gHMpNCkb4V5PyhL+Fow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsRO0BED;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC918606A32E;
	Fri, 13 Nov 2026 20:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DsRO0BED
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794601489;
	b=0FFUPqGFtay57PT06YoW2DjNb32KxZ+X+/N9ki054J9JEamVlo9eSXqSr8m4MkKHLR2D
	 dbUdoO9SAPP2A9fGEMBEEcS83Gm9aJrx4nqKPjVwx5UaFjN+tA50Uo5NV86JOAmgGJGld
	 36SpL1W8UQ1UG1ZekTxL7lJmVmvHWjMmirFNPs/aki6+VtSC9A6XgfSolUL5SBRhozDMx
	 aY5QNmY3mexRFdIumRo8rRilHuKKaOczZxWJJLCtOXW3Xs5VxpCZvEpAeVKNC/1H0Xx7z
	 ljJOxowz+tCyA0bsRwUN5iL40oy9uDqcbXfIcKqhVFQHgnGFosX3HxAEOSJqXcqA1Sw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794601489;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=TlcNcFV/e6ku1Q/CV6lyI3bgB/SHhlBbcUeMj52adDI=;
	b=ZFGNi5H0DfkC+9wZOIFvrGJdAJ5F8/58o8ZwE+sGT+fLQIbKzLWJugBrIT62MCfmQ6s7
	 kpIWMozzEn9XV/ecRmQZys6i3oSzYao6uhKLrzbS0CuPyfSE1JR7D0tmWBoCEMJpsDwsW
	 +zqWzOBkNYW8gOoNganoTSsCRgmjivtWvL/y91PTnTQd2qI3/2XqiqOFq4rpKaG0Tpbsv
	 aXJs8coTlpWEPE6NJo4U09wvjxctZ59pDQNdm3yQXh5nN3DEyBUixxtiUQ+RNdLwdax2b
	 4ZId7WJl4mY/4WDBgLRw6aZ4vubWTuJHuCYKsJq3Tw80jbpi2HKKW0+pcPaazrtQOcQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3BE9C1F000C5;
	Fri, 13 Nov 2026 20:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794601489;
	bh=TlcNcFV/e6ku1Q/CV6lyI3bgB/SHhlBbcUeMj52adDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DsRO0BED969P0k59woPrMpPC6EMMi5b68i0gv+Rdbr/8w0CocWkYWLQdPpwjdvv1u
	 77M+MmNZLIwCj9KY85x3OIhfG1uD2f5OpO4kRhJzcQ3tea5ok6Jp9QU/+KMxc7Xjqc
	 30V4IDRqWtROXOgx87wUKetgXU1ct7ynJJaiEZKGYCIR1cISMVkwNqi+CktqBlJ2rO
	 G8hXzLDCmpkoJIviMi/NK37wn/llwZlYzLe/lAfpV6dcCe55XIe0B8vuuRFZ01fZW6
	 sRRpthC8OY3+2iPb1drMYGZAxKfJN7qvTt8lgbHoYn+F7Jus+fni7lu/IaIRLMoxEi
	 mbgoyMADgbttQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BE26949ACD;
	Fri, 13 Nov 2026 20:24:48 +0000 (UTC)
From: Hugo Sales via B4 Relay <devnull+hugo.hsal.es@kernel.org>
Date: Fri, 13 Nov 2026 20:24:48 +0000
Subject: [PATCH v2 1/5] drm/amd/display: Render the panel power savings
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
Message-Id: <20261113-abm-sysfs-commit-v2-1-5808d17a7e89@hsal.es>
References: <20261113-abm-sysfs-commit-v2-0-5808d17a7e89@hsal.es>
In-Reply-To: <20261113-abm-sysfs-commit-v2-0-5808d17a7e89@hsal.es>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>, Ray Wu <ray.wu@amd.com>, 
 Alex Hung <alex.hung@amd.com>, 
 Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, 
 Ivan Lipski <ivan.lipski@amd.com>, Chenyu Chen <chen-yu.chen@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hugo Sales <hugo@hsal.es>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972; i=hugo@hsal.es;
 h=from:subject:message-id;
 bh=FVHKsTcB+kzVbQ+9zevb2MG6df7WbrsHz6OXzX6yqvM=;
 b=owJ4nJvAy8zAJVbLU7f+5A3TBYyn1ZIYsr4X8Uu8z/J+lBfn9HEiw6VTZdl+a+Vjj83t2s+TL
 jR5Kf/8pN8dpSwMYlwMsmKKLLo3PBlYJk6emVP0fAnMHFYmkCEMXJwCMJHUCYwMNy1ZH95sLDhY
 VCYmLPDuAfcBkXaGBQyr17O2HA5z0lI9yciwluGd5o3yujPplxeUWtT/P/497cZ/AWOLN/y/DRu
 3HjzIBgDSOEmQ
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



Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870081;
	b=uVGM6OZDct9fX6qSdiSYGzbvf1Ci8z0b5HV76dtKI34EnKwvxJG47fM0LLVyuPl2tpVA
	 P507G5phU4BABOmeAYSbOUUBqx+j8XQFlpMaahS3M7g3CmoGDtyhgzpR28Tj16VJQuaPW
	 qJkP5E0uTP1rAUIDdY4933uTOHHrbGp9G/Vn/G49ftT3eO6b/yyiGIk3mibevU6iYTwgM
	 6rQ+g5DzANXp3G+4tjDLP/dT6cqlUYwxA+aTsSMNmgwPc8avVXr8yAVQ8wjyPRR6bvMOV
	 1Ywpq86h5WsoX3WXxSwTPoX0Pm5/kZEzB9sug03ldOl7uHnNOEJfc3Py3xIqRv36T8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870081;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=lsCgcr53NQK1TI/PBS9u5riMRtU/RtsanXhSp8ZqY6Q=;
	b=HvKftTXo/8E7l9O/NdSY7/5+APR1/D9iHtX/GC6rAGz/LeYAf0Ui8fCNGXCOA004fJYu
	 FcWgyXpfpCW4LtVNg49Vxn3tYwSpZJ4+EO7zGZeg4QuFrKUYhYtsKHPEaXDcGkEyYSDx0
	 GV9/myZ/cS0Z0sowmjOQ6mZLObUVdz50F3AdUjdmI/lKIlB0WwVg5h/Ry/rqmQjeb/lSy
	 u8bMU7jXEHKkFJDUBg6RTEfZnICEWC3t7Y3dQobHT1Nl95alevDAzauSazuyRUB/N/7S+
	 BPGIuCwfRhUkmN4M6q8vgGGYvcdElpE/G8WPMgiWvw35k0epxjqH7eO+bEePu1GwHgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="JDdcix/t";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B3606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JDdcix/t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5347D1F0093A;
	Thu,  5 Nov 2026 09:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870080;
	bh=lsCgcr53NQK1TI/PBS9u5riMRtU/RtsanXhSp8ZqY6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JDdcix/tUqlpTchn2SciM2OXiiuZWqFqnxio1Kvts/Xt1XtoRygf/KK+FaYQt4x4x
	 5j41usriXI4wSCoXmTzrz1WurjTVQaI0ruqMCzHs9or5Gv/fgZDrFnd7IdNSsRiS46
	 479v0DYYD2CClCwCJMEpDGrdwKS8jXUPPzN0HR/ULKKPv8BWi4y9vvnIH91lnItPm9
	 IK/hHJP61vRPW+aHEBGVUAwijJFZqWqT1j4eIAtqJiJMyu0V4yb5WZK5WtQNtPjupr
	 ahDNKnJqQ7IcbYxclDNcxDVjR/MOHoguvL/cw/1dq82Vh4M1SZXX4aGuS09dW85kzV
	 qCPtx86/xBglA==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Haneen Mohammed <hamohammed.sa@gmail.com>,
	Melissa Wen <melissa.srw@gmail.com>,
	Maxime Ripard <mripard@kernel.org>
Cc: Daniel Stone <daniels@collabora.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	=?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
	=?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Sebastian Wick <sebastian.wick@redhat.com>,
	Simon Ser <contact@emersion.fr>,
	Victoria Brekenfeld <victoria@system76.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	amd-gfx@lists.freedesktop.org,
	Javier Martinez Canillas <javierm@redhat.com>,
	Daniel Stone <daniel@fooishbar.org>
Subject: Re: (subset) [PATCH v7 00/16] drm: Add DRM_MODE_ATOMIC_RESET flag
Date: Thu,  5 Nov 2026 10:14:29 +0100
Message-ID: <179387004599.656088.394688521591326726.b4-ty@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
References: <20261030-drm-reset-state-flag-v7-0-4e55eaeae683@kernel.org>
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
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 11:27:32 +0100, Maxime Ripard wrote:
> Userspace currently has no atomic way to bring a display pipeline back
> to a pristine state. A compositor that wants to start from a known
> baseline must explicitly set every property on every KMS object to its
> default value, which requires tracking which properties exist and what
> their defaults are. This is fragile and must be updated every time a
> new property is added to the kernel.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next)

[02/16] drm/solomon: ssd130x: Drop the init-only assumption in ssd130x_crtc_create_state()
        commit: c257ee259841e264d13c049acea68e5bfa79b592
[03/16] drm/atomic: Switch to krealloc_array() in drm_atomic_get_private_obj_state()
        commit: 923cb729e1a5863fb64045fff1ebc25d2a0dae63
[04/16] drm/atomic: Use __GFP_ZERO instead of explicit memset in drm_atomic_get_private_obj_state()
        commit: 1dc6799ff39ed7a10089a5ca01dd7b6ffdcea24a
[05/16] drm/atomic: Use __GFP_ZERO instead of explicit memset in drm_atomic_get_connector_state()
        commit: b317ba7316be19063b867d8f23901f4698ea05f5
[06/16] drm/atomic: Create function to insert CRTC state into a commit
        commit: 99f828c16262084c2667fe8bfa3451e977be75f0
[07/16] drm/atomic: Create function to insert plane state into a commit
        commit: 40a13a109c961fc046b115b35ef1639ae81623d2
[08/16] drm/atomic: Create function to insert colorop state into a commit
        commit: b31e771eb1bdff618b3bf54e38bed0679c07f6b9
[09/16] drm/atomic: Create function to insert private obj state into a commit
        commit: 2eb56a0eee85c22fbab5e92fe66d14cfd4effbf6
[10/16] drm/atomic: Create function to insert connector state into a commit
        commit: 471e13ae24e4856ca5d762f3cc65580990a683e4
[15/16] drm/vkms: Switch container_of helpers to container_of_const
        commit: 1fd0897e3774e33a8ef7154c4048af12dee1ded2

Thanks!
Maxime

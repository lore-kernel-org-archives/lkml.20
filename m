Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7889E49364E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784175; cv=none; b=JP9uCGzYSn5l4hdIgam0GCE2Fh5M7I2a/+v29njTUI25i72+G9b99Ie0qPBtHBJtjO1VZ+RWWQ0qqlcoKwQviFDxR54E2V7nehStWcdhwFlW5XmTx02S+iQFHM81I9qjCdC7AAZG2sX+BS89o9ZfCrcu5ySwAfOioOixMgr8UUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784175; c=relaxed/simple;
	bh=l7ug4HLSmucuV0BytQWrh1mjLjuj0w7Cau5Nxw9ih30=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOIgze7S5GK+I+nehUZXFc1kL6/LLB+yfIii87FuP8YK7+72sZqbCKgat8dCYSDvXOat5MhOU3nDDzn3Oq+oAPg7MhckgP6Osg+bHrI9yIG0mWEagf+0MtLI6Ve9mcVdLBtWdHcRRFm6myNMIL2rOg7lIyIM+Y/5zT0kHziVUZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RY9GmjzY; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RY9GmjzY"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-836ce6cbe1eso26382727b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784169; x=1789388969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5mjYZ3k2SfS7QDSelwqxhC0sbri/VrXDhQqho6Hz/5E=;
        b=RY9GmjzY9bHdJgOLkh8bUowCltXejyOzCe7UMa69c+Dg9W8vmlMyhAxBSeJGzIb5WA
         c43mTNaEeI/HGXsBUl+VYO44Wv+t6v5zeOzHGH/p8Riq9HyK7rpz/uJV7qyt1QGSsSVE
         2HiD/ZxO1bVI2yEtHGoKWb2tc6hI3DAeIAT9FQh3MgRKbj5M0sZUU3dzRXweNQiQFZQ9
         RJuhjcxumKl6RYXGj1C9PHkLp09i1tU9TPRuKtwmdji4I0Bs3YudLCDfWSapyF1Ppm97
         GK8wKcqbz60Ue/EsxbH4/+Fb5pdslFcUL6Lg+zaxvG4yeZVpbnduHzhVrjCec7OShOA6
         dnlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784169; x=1789388969;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mjYZ3k2SfS7QDSelwqxhC0sbri/VrXDhQqho6Hz/5E=;
        b=hM9RN6gam7ahBlnNHt2wkHOAq85NVscuTE3EwsPlKQ390TyifUhKCPC5AJtAcOoIgj
         KHtfrcEZQ6hDRk3h5viOePffGewQLbXFrbsY4oM+/D8s4bS8lfyCW7mawsXA9WDo9y1L
         LzXK7G9jQakT1JtefyllO95wRUn/NgXnZtPViIL8QiBw5ShFkIcCLERPEQ1Tka7O6i/8
         5jw8yjtIrQvBku/YKMZ27QrzwgViGlpedVQdLyyXUQSn5McmbO+vhpcfAjomi/xsRWw4
         3Uh7BBHlWN1kIpS6qhvXtEN14R1SAKZLW/Ro+USbahIeHnwb8WR26W/QprrSaNuwddQE
         x8Xg==
X-Forwarded-Encrypted: i=1; AKwUvBw8tGgmztQ93ION8Kajw22TSbRxw36yukzHUngl9FvydN4nxhZIuIv1crcvnDT5PGW706W6BhIxMiCLhRw=@vger.kernel.org
X-Gm-Message-State: AFuF++kWyYywEFSELT04F0PxLp/avEj8xp3YiWJcqnp/49jLPwWz62Ff
	d/mUijlycsSCqqiP/O0RDSUVwcOMxki9VcllSX2nhHPpIdDX8yaBgJE=
X-Gm-Gg: AYBFou20c0qhxPUZwEnqRBzbxyyTv4JeY0a1eEb19TevD5oy3MUhY9efS5U2y4v9R2a
	ZY4VZptkb/W3RvinAxM+FWcBySrr7EHj4R4+Pf8bKHp/0AsfVCxkZw5vy7ulG0FOgb7HVLMDQ6K
	O3YHeIPLDoSMf7gSgMp0/gS98Oz+WQnDdVlwgCCe0Pd7TDY8SDnIKwQJ9lWHiracVSCMcNYUOqN
	PRIxMbPX8TQbPwLsXgW/0Pcxgz3d1cchEh/k6OG8BfKYxsL/p20PHU7IeBnSckH3mnAUi7+JKZh
	TSQlBM18Le4J4+ulqKAFp0V+Nkfw3ZCpEWGtVxZuZKAsSvjMh2WdYWiPKHE+1GyZuGmZFhaOwRu
	VRpw2S7bYyt3Cc4cfpQePitZUAFiekZDi3LWhnwFO082IPRYDXjZOeV3rjmAVDcCiIoxdwe4Y2Y
	NDIhY0CboPmn/GXcUjLqvgkXLgDn2F5ZbRLckZABOC+gZnNjLY1q1IZ3GoJN5wGUaMwtYc2j4lt
	4wLL/nO1nqErIKrvp2R8dqlKDvVmh6KyErGqs4=
X-Received: by 2002:a05:690c:d8f:b0:7e9:4a7:9899 with SMTP id 00721157ae682-871261dc570mr103556167b3.11.1788784168867;
        Mon, 07 Sep 2026 05:29:28 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:28 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4 3/3] MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller
Date: Mon,  7 Sep 2026 09:23:31 -0300
Message-ID: <b8ec70dfa6e4e711cc95df2a6046741223d67c92.1788711082.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788711082.git.nico.antinori.7@gmail.com>
References: <cover.1788711082.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add MAINTAINERS entry for the Chipwealth CH1115 dot matrix OLED
controller.

Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 054178b88dcb..0be510e16a8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8665,6 +8665,12 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/samsung,lms380kf01.yaml
 F:	drivers/gpu/drm/panel/panel-widechips-ws2401.c

+DRM DRIVER FOR CHIPWEALTH CH1115 PANELS
+M:	Nicolás Antinori <nico.antinori.7@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
+F:	drivers/gpu/drm/chipwealth/ch1115-i2c.c
+
 DRM DRIVERS
 M:	David Airlie <airlied@gmail.com>
 M:	Simona Vetter <simona@ffwll.ch>
--
2.47.3


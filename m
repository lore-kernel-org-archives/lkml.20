Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BBC247DF91
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 19:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789933153; cv=none; b=HLsG3mbgWfhokIHSiGocRUIWywSbiHN2e+jnsYceXdcjDsncV+5XwGdkbUlWAXyv2oWvl/URqNOuxwqDgjvGhHN4+nEbjcE+IE1jAmpcSbeVIzuQVE8J25JY7C1yHo1JmvcOsQBzoOb1NOJo/rvtRw2pT80cJeGcf0/+1klSGkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789933153; c=relaxed/simple;
	bh=Y1uk7z81ukhofe/vSmwFM2Y0N/XlaFoNJ7JURZkhshM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIwTALdqZJy0FOhegyMFNjfbw2JH502SB4hUbQoV+Mqy5wam5AC/xjL1oQyOMi/eYfFwhzlty695/Tl/uP0PUY19PbxqU8WRdpCbmAXPGqH1fY+Im9Tna9WoCC+O1L8BBx0Usx07CEbeU+yjfLmaeoyk78Hb5pX0K+yz+sTtC/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=aVOeOsCo; arc=none smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="aVOeOsCo"
Received: by mail-yx2-f42.google.com with SMTP id 00721157ae682-8961cca9193so28171147b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 12:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789933150; x=1790537950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8DswF+PpHLQLFXIsTsYB07zyWStQD5M14yzCJNkAmPg=;
        b=aVOeOsCopIIqdi4yQt/etLZ4BcuH7f5M+OwW3kE3buEUPCunK71i6cYnubYSkU1G5N
         1wj/vTZ2Uqaz2UiIGKrWmFhuTuwnkMzgzneibPSjSmYP1d4AUVyFjYQ4Odw8oAn4R/aU
         ewv/DDlVxieiiQnelh8G67XpfMZ2VDHllPuchUr00o4RObsfInDy8fEtUy35ss3F+Eg4
         hu78SkHhWQWf7UU/1N7fsX3vd8cYvArSEYcLl9yIEGEQQzYGosTWYKZ/0EWjtCMncMNn
         QKEJIbP7YuY/ezChgBgghwUsWWpfHG3f/p8QYQhaEmPZyUjedjdphtnIxPwAS2C9iTxE
         zwiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789933150; x=1790537950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8DswF+PpHLQLFXIsTsYB07zyWStQD5M14yzCJNkAmPg=;
        b=uENfe2p8P4klsJh9ufoGNvqlIO1fQZWOQ5jAAQRyKTYz6Dpb9CC55ILRUuyrau5btZ
         QZgvIhmeUgNIgzFoUvcmvMEx8vUwnSxWswiDXNVO7iHa5PGHVCvonfn9P57dP53UWlJ1
         dMEY7SME1EoymgesTAX+qPxvms7y+F6vjO0mGrTeKEYjq2SvQhliaBRtfRRHILJKLvmC
         vM5aAaqALeRggWWaxTD3a/So/Tvs10eCAGa/mGTo4cbwknI7/pJWuE+XIC4FGNisDSHc
         JA6WD2wu7sPnLVCO+ACEZRhYWzbqDmGneEOCRVd6nXyLPaYusz10wlfCv+KKm167a/Ze
         MuCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVtjM8PV87nH6XJaUK6I53CFt7x/sWsXqVqmCzsrQQm1xmWmr/tBpoTGQQQs3NJrumyqUSPHZdjVwQTG8=@vger.kernel.org
X-Gm-Message-State: AFuF++l2T8GFuoQ+oK+iNEhlChKhV8ouDhFZ6mnPZvdfLDMREAQUctS1
	a7ExlCyqeb5NNQtrTRHqfOFrqBc9frle5KiC6cloG4wkvoKqSpH2LLyq39Aoy1UiYe0=
X-Gm-Gg: AYBFou0yZ0pwXUhxkGBQrPSbCxzM+qLOgkXB2mJ7xwJ9PB2AUMVZ+p1afX5/8wEj96y
	vYX9Q/FtccnI7hHI3mZHg+TSGSkK9JJBKqff0lta80k4NpDooqoiGCK7hfrvICvzNfaxfLI5WVa
	u5oVPmA4jVRaQ8wHtBCZ27zyHGqxJ/DggiHqzPZeqlcQ75uh1NnJXIa9SgtbsDpLwt1kHwfzbmY
	w1BphESJuO4qaQJNHqVXIEc7BQZP2oXKm2asu4udc10VCdFkpvymtLLct32VJ+ndnRT9iM6QRc+
	ZGh+mqADHNYb8bdIETTLhhX8BR+wO8gV5OlFYYKDtFPphPtrEndxlnRBcvBdrzZT7wCY6FOhxGw
	s9N8Sc1TvbPvrF9qaGpzLh0xuHWMkhHMTcKGHGD+BXLCHZKbzqm2hNgC7JK9xpHBUxIkiYvaH4z
	fX2MapPwRb1iCk1cctWMGi1WiDvdACkYO/Rq0U9xQ6RuQuZWI1aj3aZ8ra34zyQJXgU06jew3VE
	Vk7Ekf3NSuPfWz0UICMKxOLp9SkBbk58odouLko+fR6n3kdg1s7sihTKrnUkiUpaeOiyw+KIXxe
	0VX4Quv8GOGH92q/r+g=
X-Received: by 2002:a05:690c:39d:b0:89b:6b8c:8edf with SMTP id 00721157ae682-89b6b8c9360mr12390877b3.50.1789933150155;
        Sun, 20 Sep 2026 12:39:10 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-89a41521471sm19169577b3.6.2026.09.20.12.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 12:39:09 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	legion@kernel.org,
	kees@kernel.org,
	will@kernel.org,
	ruanjinjie@huawei.com,
	atomlin@atomlin.com,
	rppt@kernel.org,
	jani.nikula@intel.com,
	hamzamahfooz@linux.microsoft.com,
	joey.gouly@arm.com,
	tglx@kernel.org,
	nsc@kernel.org,
	alexandre.chartre@oracle.com,
	james.morse@arm.com,
	dianders@chromium.org,
	bp@alien8.de,
	jpoimboe@kernel.org,
	shuah@kernel.org,
	catalin.marinas@arm.com,
	linux-kbuild@vger.kernel.org,
	linux-arch@vger.kernel.org,
	kvmarm@lists.linux.dev,
	jaredwhite@microsoft.com,
	johan@kernel.org,
	pbonzini@redhat.com,
	mingo@redhat.com,
	linux-mm@kvack.org,
	seanjc@google.com,
	mark.rutland@arm.com,
	vdonnefort@google.com,
	tarunsahu@google.com,
	gshan@redhat.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	xur@google.com,
	djbw@kernel.org,
	oupton@kernel.org,
	nogikh@google.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	zengheng4@huawei.com,
	peterz@infradead.org,
	corbet@lwn.net,
	suzuki.poulose@arm.com,
	luto@kernel.org,
	hpa@zytor.com,
	zhangpengjie2@huawei.com,
	x86@kernel.org,
	yuzenghui@huawei.com,
	jic23@kernel.org,
	ardb@kernel.org,
	pasha.tatashin@soleen.com,
	petr.pavlu@suse.com,
	ryan.roberts@arm.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	dave.hansen@linux.intel.com,
	rdunlap@infradead.org,
	kvm@vger.kernel.org,
	fuad.tabba@linux.dev,
	maz@kernel.org,
	mbenes@suse.cz,
	jgross@suse.com,
	seiden@linux.ibm.com,
	pierre.gondois@arm.com,
	song@kernel.org,
	nathan@kernel.org,
	pmladek@suse.com,
	graf@amazon.com,
	chao.gao@intel.com,
	zhenglifeng1@huawei.com,
	arnd@arndb.de,
	sidnayyar@google.com,
	linux-arm-kernel@lists.infradead.org,
	vladimir.murzin@arm.com,
	kas@kernel.org
Subject: [RFC PATCH 23/46] Documentation: liveupdate: Add physical CPU preservation documentation
Date: Sun, 20 Sep 2026 15:36:27 -0400
Message-ID: <20260920193650.3373435-24-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
References: <20260920193650.3373435-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation for physical CPU preservation subsystem, workload
attachment API, architecture backend hooks, and KHO serialization ABI.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 Documentation/liveupdate/cpu_preservation.rst | 34 +++++++++++++++++++
 Documentation/liveupdate/index.rst            | 11 ++++++
 2 files changed, 45 insertions(+)
 create mode 100644 Documentation/liveupdate/cpu_preservation.rst
 create mode 100644 Documentation/liveupdate/index.rst

diff --git a/Documentation/liveupdate/cpu_preservation.rst b/Documentation/liveupdate/cpu_preservation.rst
new file mode 100644
index 000000000000..a7a534188685
--- /dev/null
+++ b/Documentation/liveupdate/cpu_preservation.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+=========================
+Physical CPU Preservation
+=========================
+
+.. kernel-doc:: kernel/liveupdate/cpu_preserve.c
+   :doc: Preserved CPU Subsystem
+
+CPU Preservation Workload API
+=============================
+
+.. kernel-doc:: kernel/liveupdate/cpu_preserve.c
+   :export:
+
+Architecture Backend Interface
+==============================
+
+.. kernel-doc:: include/linux/cpu_preserve.h
+
+CPU Preservation ABI
+====================
+
+.. kernel-doc:: include/linux/kho/abi/cpu.h
+   :doc: CPU Preservation Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/cpu.h
+
+See Also
+========
+
+- :doc:`/core-api/liveupdate`
+- :doc:`/liveupdate/vmm`
+- :doc:`/mm/memfd_preservation`
diff --git a/Documentation/liveupdate/index.rst b/Documentation/liveupdate/index.rst
new file mode 100644
index 000000000000..415ac748c9f7
--- /dev/null
+++ b/Documentation/liveupdate/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===========
+Live Update
+===========
+
+.. toctree::
+   :maxdepth: 1
+
+   vmm
+   cpu_preservation
-- 
2.55.0.1082.g2b9226bbc0-goog


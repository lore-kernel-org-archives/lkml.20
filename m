Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810953;
	b=hsYz9IjSFuF94TA8MwEY50vcI5LKfHJ3tlH9QZZUx09hP7YMUlYD8+uAURBK3nxQSS+0
	 YUjXZ8mFfzlnNnKmiP7Zue39Z1IQu3d8E1yWQXDDwj+rGr1UMR1C+/lfg9LaEuSDfYoTI
	 WCOmpjp1BGfIb+8XGL+vB9U5tlRheYxmb0gJ5rLiIe7bJWZaMrFGSBYkk3dmjwiCWJbHk
	 e8dkdIq/xIHrkGVUQ/NrqOFroAymRDufyuLy6FbsD3eU0drN7OSD2qBvw8waocqFozr72
	 oJOvrscx59W3alqJw6/RqTzcyWwL4BgsoOMMs7yU6SwrAfPhKTmKvuekd6u8aRgrhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810953;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=tEKKYrXNj6XgAhGCoGYV4RqZc7pwG0hhr+FNinyDBHA=;
	b=LtbzkkcEXKHaYuogwAOgyImArLT2sRuPzav/aD8Yia+BLYPO/hlBVjtmP7N2OP0gqfFY
	 jW8o6uptJyJJBgZ25JYlC+4DKcFDnlJW47+ApEBXO5CyKnQ+vDd1Rd6M90hjbZY2kSTr9
	 BPv+6DrmW0zhDn9QRoPgUQxio8LTejaFBR914qtpZfGavAje0sEIzSIoT3gNsv01wq/7b
	 08p3DvKuXmfiOlGW3qx9ZxPzfbTRMM0Bo+4B34QCMDvpS2sd2VUzpcItPzPw029nRCKIC
	 CihZLjM+qzFs3BwHkuPP8iVUIWUuB9L0OCvK8xXGdhN8eJ+QE7UbWgNfN16oRSfr1JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhvWsSxV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E886083627;
	Wed,  4 Nov 2026 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KhvWsSxV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E352E1F00A2C;
	Wed,  4 Nov 2026 16:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810953;
	bh=tEKKYrXNj6XgAhGCoGYV4RqZc7pwG0hhr+FNinyDBHA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KhvWsSxV8wgO6j8+evSeL8TkbxH0SzNHJ5oH2SmIoc9NDYD+PDOy2A4IxnrAe08XS
	 1xyuipGuoMYH7V64zhL+vqJP7S5vUrUsj88pvb9qLqGv6Sa5QdO2KKYoHhec4HvscL
	 FxlQeJnTco2wSGBjZ2LZoPTM3r7vUgk/OTonUhvRgwt5oMhc4Win0O/B9fYbE8KfWV
	 W6Rj48qbPwoRhYtQLXEZL2/Rpyz1vr1jBpHVKN1Q8kKwRjNVcNm5OSzyRNFwZ+FsUL
	 3Balzi1b85kMpVp3fPRYnCu1mzppY4VseMnNj5EXiBaMMI3zkiYOZMTguFdegybkk9
	 lZh5j/EmUZxWw==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 04 Nov 2026 08:35:23 -0800
Subject: [PATCH v10 6/6] MAINTAINERS: resctrl: Add myself as reviewer
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
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-6-1636a003a3c0@kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=739; i=fustini@kernel.org;
 h=from:subject:message-id; bh=XUHkgMfDTiHQfhcpXAJzPajKkk2ZY54UiaPZ41kdAiA=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmJ9sz/PP1bkK++ifb13zk08X6t28o1XaU7izMfSq
 7sKd99z6ShlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMpHQKI8M+jSUahSs0XfZK
 6xY8vGxjlce5NN73nG/FoVkG4rMUdH8xMrzyaWOwV+IOct97bMXBHQEOLRIJXg564q0tkR2zNOx
 FGAA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

The RISC-V CBQRI support builds on the common resctrl code, so changes
there affect RISC-V. Add myself as a reviewer to stay aware of them.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index df051086b5dd..e5731902d318 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23463,6 +23463,7 @@ M:	x86@kernel.org
 R:	Dave Martin <Dave.Martin@arm.com>
 R:	James Morse <james.morse@arm.com>
 R:	Babu Moger <babu.moger@amd.com>
+R:	Drew Fustini <fustini@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Supported
 P:	Documentation/process/maintainer-tip.rst

-- 
2.43.0


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810952;
	b=D0cn8o3faXdzG3cj82zFhEUPT66zOzTLaioRRrsGtjEzeZZB3yQLd3Eb+ItgI7S6WpMI
	 EbfMnWr4x5dUF57LJPcDClWHbSBm9EjZSmm9L+qlGc28sGd8zrQcrrLW+uR8a4cIMzapk
	 uSswsa8dHdZDKJBtPQmOJnxu4ZTjHDxQsstAjK8EwlNELtJ/QJmED3DhLdwNjYxr0raEK
	 LoTTsmnYpA5TDIoNghmeKEhL0jVNUAIBNW7iV8L1Zy6yPRuaS8H+zvJL8jyMTIprwFYYk
	 etnrFI4qx47LtW6Xkbcqv+Stibl9FOnL95RFN81lrIG7u7hX1I5T8dnBZeY4URE5jDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810952;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=G9/vz5aGr5AAQX1eE3o2mOmq/g+Bwv5XIHzp9+kVsUo=;
	b=JdY832r6+kVF96/RFn10K0xH9l4tfnHqQyvX4j+g0B2yCxVpRDL7IEMe/jV5ipN1CHpp
	 Td0vctJ0fwt9/K6gipjYfhFfR2O39oTSic1ufsPcpfjbrLve3qqYJEaP1Pu2V6rCl7SnA
	 D41YTyrxq/2x89JELNr3MQod7Y1tA/Cah8w46MAombtzP12cTI/GQYIDzuN+qc9gN5YX4
	 28aiLyQTb1pbekcCWPARYsgNU2HHQDWzzRkkZbTTgAiHMS2BlXho9p7eMoFPtSmAULOH0
	 +wTqFGVgsOTu9rys2P9tRujpq+HVFKQPinTFEVtgrKhvi/2D5FZfYZhvulm7NL3DfYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hXumGixM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0BC606EEA6;
	Wed,  4 Nov 2026 16:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hXumGixM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 505481F00A23;
	Wed,  4 Nov 2026 16:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793810951;
	bh=G9/vz5aGr5AAQX1eE3o2mOmq/g+Bwv5XIHzp9+kVsUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=hXumGixMAubV3OEkonpQZWF2Zv7VRg4aE+zzeQw/UjUFDniN7Cwpyg1GYrvzFQ+MT
	 6aXu1iLu9/inDTayB8g+qaqtu9Vt9pe9Bz0jlia8ZmXhnl+prbVW56dp8YOEViAXtL
	 BrVqLMuwQk2lMKzF/+aLBBLijT1j+ClwtMkziZFVZN1q+hwE2vZxlvbvrGAECTrY61
	 ozXvU7J0bEi10KVRYTfm4YwnBf2UEIlWaGu9YF/NLiV1W3zP4DnHE4Kl5bpT1H8mM5
	 qJlaY4jhELf22LNZfFAFJmJ5ghYzN4xcwLG2Joel0h/vRJhljytPiVQai8+f8Xg073
	 CfIfVmsvBg+qg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 04 Nov 2026 08:35:20 -0800
Subject: [PATCH v10 3/6] riscv_cbqri: Make RESCTRL_FS available on RISC-V
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
Message-Id: <20261104-dfustini-atl-sc-cbqri-dt-v10-3-1636a003a3c0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293; i=fustini@kernel.org;
 h=from:subject:message-id; bh=UWi5ylAaXEFSGdYN0vodmPAxCjO4JUBgxFx5++XYyJM=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWS9TmK9Lmnw6catL0euah36aP1tTm9r+YtPu3sutRYV+
 2w6vfRwT0cpC4MYF4OsmCLLpg95F5Z4hX5dMP/FNpg5rEwgQxi4OAVgIhIPGBl2NSSH+YSemvT4
 3VHPbkPHlZeDhd9K/in3u5DwYHKqyrRSRoYLDc9lNj/XqPkzLXB/1ATfmXfucm2wzu/cmbqvQXc
 Sx2lGAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010

Enough CBQRI support is now present to enable ARCH_HAS_CPU_RESCTRL.
Have RISCV_CBQRI select it so that RESCTRL_FS can be enabled on
RISC-V, and default RISCV_CBQRI to y. RISCV_ISA_SSQOSID is default n,
so this only affects kernels where the user has already opted into
Ssqosid, and on those the CBQRI support is what makes the extension
useful.

This is a separate patch so that no commit makes RESCTRL_FS selectable
before the resctrl glue it depends on exists. Enabling the resctrl
filesystem itself stays a user choice under MISC_FILESYSTEMS.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index 0d7ca2dec308..ed2e4bedb21b 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -35,6 +35,8 @@ config ARM64_MPAM_RESCTRL_FS
 menuconfig RISCV_CBQRI
 	bool "RISC-V CBQRI support"
 	depends on RISCV && RISCV_ISA_SSQOSID
+	select ARCH_HAS_CPU_RESCTRL
+	default y
 	help
 	  Capacity and Bandwidth QoS Register Interface (CBQRI) support for
 	  RISC-V cache QoS resources. CBQRI exposes cache capacity

-- 
2.43.0


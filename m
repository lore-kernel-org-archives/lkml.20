Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794180097;
	b=Uuy69Ouh9RyeQEWDWT6YBh/BpJaZjMfcCX7pYQp5mNEIDmuPeE/P4/sJy/GJKsjCuLEC
	 ZI3EpgufqhJeDRHLa0q2oOMH83O322Jb0ENE/REWfphYx2MuO4hvKJyhk/CspuIQt0HOo
	 vZm1Yvfv9uOAtZ5Vds3nNZ4DJQzKFcgqvaNc+hVGwAsCVOyF0sz0eyVMbhLSJrNNjrfJ5
	 FODIHLOyOYIYNFJoJHaR2FQlhoJNwKlnCzXslFnlRaHWpgy3bIxyS+0ZqHywA0ASerQlR
	 52VofKS3LGUVXO1UNs9lDC50HPnPv1k4t+WlV4RzStEDgfxLq19Ygm5albcN8va1Ehw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794180097;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=G9/vz5aGr5AAQX1eE3o2mOmq/g+Bwv5XIHzp9+kVsUo=;
	b=vw8UtQqYXGUVqiAntnnfLAinjwv58n9N4JjVdLEYMm3Vk/8//T3C18twexvh6YLyjDsC
	 kXgy/s64uakE0vZYcU/Vi8NvEDKhZ4M245JZyESTZMXWGy+1JCQ7KDvcA6Dg+KsdTYkYH
	 +T+LOJnSB/PDL5vTsj5e/nAek7p4/miljXRFAOHfyo4fErddgEZmH7KOxYNJ82m4OLTUM
	 hm4J0bALQh6eFMN3UIpMk6/xrXYTDVheuzSqw9kXth2GLf/DPoTf1rbL4wwuTdWWrDc3s
	 Bcpqc2fRQYtQ16BEHsNqZBAkLN7UNGvvy9RtG98OjEokT4N7k0CsVhPq8apnfAl1E6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="m/pkxU/C";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A8F606A335;
	Sun,  8 Nov 2026 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m/pkxU/C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEA8C1F008A5;
	Sun,  8 Nov 2026 23:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180097;
	bh=G9/vz5aGr5AAQX1eE3o2mOmq/g+Bwv5XIHzp9+kVsUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=m/pkxU/CN+7pbjKbDlvkkcZF2cbHVvkOC9/Eu3BtFBRIgdgsg9nqw0dU0/0ixDCgw
	 Nd/QN6/NvU1TquCqXfs7NPNdp2TNmPNCoFeNr3vRJ6yKu171sNi+hv/Wfaxs1awFZ/
	 z5lLf5/fZKKbsTct+qCqSQd4G53LU3vBsRp+ic0NorEVOZ2YtUHWMbIqE2ZDtNDydb
	 VG1NkuGaJ2hUf27K2XuL/cKq7g52t18MgXVynN9ozLiLQvkVeT8T+C/iz7fgm+IqXn
	 MgF6sBV+IabsKFHFY77DnsUhdzhQyAKNIP0Nw3hDYhbMKfHMS7cPxOdKrlhzpUoF4v
	 MFt+5Dt92napA==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 08 Nov 2026 15:20:52 -0800
Subject: [PATCH v11 3/5] riscv_cbqri: Make RESCTRL_FS available on RISC-V
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
Message-Id: <20261108-dfustini-atl-sc-cbqri-dt-v11-3-33a1bf0cf01c@kernel.org>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
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
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
 Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1293; i=fustini@kernel.org;
 h=from:subject:message-id; bh=UWi5ylAaXEFSGdYN0vodmPAxCjO4JUBgxFx5++XYyJM=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWR9ZP6Xe0RA71T2lE25ov+1J4p/i5j3oPZyw7/CyupYQ
 ZabnwvZO0pZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATabRjZPh6R+HdRN/feQr3
 Xc14fE8c+npyjfy66fIOKh/uLZ4tL2zF8M98xaUPymJf447mTFxevUS8Q+ON77HJ9zYF+acHreq
 0t+MHAA==
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


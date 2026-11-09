Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229590;
	b=BL+TuK3g1+o1uwEXurn+vbADXPBg2v9eojxFF5Nv8JT6GA3VkjFVgy4HfSDDH3wmQ/B0
	 JpB8m0HkoSMglHJNZ/zD7yR6wSMO+akVWEwzA6ubJvxITMpt1l7fCLIhXDWEA+fRF1KkK
	 0TMweIb6Iba/cafJZyJzKJuDjXUzGdeL8p+zR4dmbz6d9DPL8Dffv10pdg+i6IvxTqQED
	 HBjIbIt8x5aK8PGJW0NG94CBlJiry5lmhDEXAnG7VDfzobXXGXG1QWgpGbG3xgyYMofo/
	 BFibVqsNvs7q5YohcOfQ1LYx8pH+ui8Xg88kXi5rqlZBoCaL+dxt4Tir7upGSKJy4PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229590;
	h=DMARC-Filter:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 X-Lms-Return-Path:Cc:From:Date:In-Reply-To:References:X-Original-From:
	 To:Subject:Message-Id:Received:Content-Type:User-Agent;
	bh=eH2m2Zew8oyu1f0utHA4YTbxzS4hIWuowjmaOpnZyec=;
	b=B69r5ElpR8f0iGJlkXrIiBeFF54AZVHRN61rcJFfvBk4W/fHKljjd3Ig4/NK848prNDV
	 3TgPwVsJdM00YH8H826WJ/2vuDcvao6d8kRp4JkbdJjlC+gsJiOPZ/Owfz0hEu3wIi0zr
	 C604DVXPiJgqj3GNtmfHDVHEowAlYdaAoLzdc0PkBLuqDt6bvggxmbYPaj3Bx2XNL0506
	 cOzllbWz3+iZFZ+/J1S6qVnwaBg0OTH2gmoaH7punkUGl/8X4R96iPjPX4bD+UHSqlTjT
	 84EFmkYCdc731sVQFQsdPTsdEn3NNlX82JyPntCIEZe1LrHMu6Hwkq4DxNoGDsqVl4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=picoheart.com;
	spf=pass smtp.mailfrom=picoheart.com;
	dkim=pass header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=FPncPHrn;
	arc=none smtp.remote-ip=209.127.231.36
Received: from va-2-36.ptr.blmpb.com (va-2-36.ptr.blmpb.com [209.127.231.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1A2606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC1A2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=picoheart.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=picoheart.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=FPncPHrn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1794229584; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=eH2m2Zew8oyu1f0utHA4YTbxzS4hIWuowjmaOpnZyec=;
 b=FPncPHrnGO+ZqH6h4jZezfHOh68vzD6GFyBL9l21fKlsjKOgOM96kH5+woKABP9ihuvKnV
 SM91Ohyn7Bv1fjK5h4mEroQOsJzvKy1hMCAC/TndzXs/ZH0I328yxCFJEiHinh4ctVayui
 ZRf+KPrEPgHEa0bnSVJbqzpRI9Bq9b1XN0y6bn4sER4SIs2QpxfbR6VBjo9JeUlAOzp5G5
 HRukT3+mfocpS4Rwh6Td4H0wMihXt3SmDhn/2ySCE8SVvd1dn+vnyLc+h8kra6b5p5lpzN
 7PKvLa6jyzNvaE0+SeBciYWWyotFeo3gZrWUvevi7uuIi64Lb5LMyk+8hHDSag==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+26af1c545+7976d1+vger.kernel.org+zengheng@picoheart.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>, 
	"Jonathan Cameron" <jic23@kernel.org>, 
	"Shaopeng Tan" <tan.shaopeng@jp.fujitsu.com>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, 
	<x86@kernel.org>, <devicetree@vger.kernel.org>, 
	<linux-doc@vger.kernel.org>
From: "Zeng Heng" <zengheng@picoheart.com>
Date: Mon, 9 Nov 2026 21:06:09 +0800
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
X-Original-From: Zeng Heng <zengheng@picoheart.com>
To: "Drew Fustini" <fustini@kernel.org>, 
	"Adrien Ricciardi" <aricciardi@baylibre.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Atish Patra" <atish.patra@linux.dev>, "Babu Moger" <babu.moger@amd.com>, 
	"Ben Horgan" <ben.horgan@arm.com>, "Borislav Petkov" <bp@alien8.de>, 
	"Chen Pei" <cp0613@linux.alibaba.com>, 
	"Conor Dooley" <conor.dooley@microchip.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Dave Hansen" <dave.hansen@linux.intel.com>, 
	"Dave Martin" <Dave.Martin@arm.com>, "Fenghua Yu" <fenghuay@nvidia.com>, 
	"Gong Shuai" <gong.shuai@sanechips.com.cn>, 
	"Gong Shuai" <gsh517@gmail.com>, <guo.wenjia23@zte.com.cn>, 
	"James Morse" <james.morse@arm.com>, 
	=?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, <liu.qingtao2@zte.com.cn>, 
	"Liu Zhiwei" <zhiwei_liu@linux.alibaba.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Peter Newman" <peternewman@google.com>, 
	=?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
	"Reinette Chatre" <reinette.chatre@intel.com>, 
	"Rob Herring" <robh@kernel.org>, 
	"Samuel Holland" <samuel.holland@sifive.com>, 
	"Sunil V L" <sunilvl@oss.qualcomm.com>, 
	"Tony Luck" <tony.luck@intel.com>, "Weiwei Li" <liwei1518@gmail.com>, 
	"yunhui cui" <cuiyunhui@bytedance.com>, 
	"Zhanpeng Zhang" <zhangzhanpeng.jasper@bytedance.com>
Subject: Re: [PATCH v11 0/5] riscv: Add initial CBQRI resctrl support
Message-Id: <bb2f816c-9c8d-4a27-8353-a946ba58870c@picoheart.com>
Received: from [172.16.137.224] ([124.160.26.250]) by smtp.feishu.cn with ESMTPS; Mon, 09 Nov 2026 21:06:12 +0800
Content-Type: text/plain; charset=UTF-8
User-Agent: Mozilla Thunderbird

Hi Drew,

=E5=9C=A8 11/9/26 =E4=B8=8A=E5=8D=887:20, Drew Fustini =E5=86=99=E9=81=93:
> This series adds initial RISC-V QoS support through the CBQRI
> controller interface [1] integrated with resctrl [2], plus a DT-based
> platform driver for cache controllers. It builds on the Ssqosid
> extension [3] (srmcfg CSR) support that landed in the v7.3 merge
> window. It has been tested on both the Tenstorrent Ascalon Shared Cache
> controller and a QEMU implementation [4].
>=20
>    qemu-system-riscv64 -M virt,aia=3Daplic-imsic -nographic -m 1G -smp 8 =
\
>        -kernel arch/riscv/boot/Image \
>        -append "root=3D/dev/vda ro console=3DttyS0 rootwait" \
>        -drive if=3Dnone,file=3Drootfs.ext2,format=3Draw,id=3Dhd0 \
>        -device virtio-blk-device,drive=3Dhd0 \
>        -device riscv.cbqri.capacity,max_mcids=3D256,max_rcids=3D64,ncblks=
=3D16,mmio_base=3D0x04820000
>=20
> Cache allocation can be exercised on the booted system. Mount resctrl
> and read the default schemata. The L2 controller has 16 capacity
> blocks, so the default capacity bitmask (CBM) is 0xffff:
>=20
>    # mount -t resctrl resctrl /sys/fs/resctrl
>    # cat /sys/fs/resctrl/schemata
>    L2:0=3Dffff
>=20
> Write a narrower CBM to a new control group and read it back to confirm
> the L2 controller applied it:
>=20
>    # mkdir /sys/fs/resctrl/group0
>    # echo "L2:0=3Dff" > /sys/fs/resctrl/group0/schemata
>    # cat /sys/fs/resctrl/group0/schemata
>    L2:0=3Dff
>=20
> Note that this series only implements support for resctrl L2 and L3
> cache resources using CBQRI capacity allocation control. cc_block_mask
> maps onto resctrl's existing cbm schema. However, cc_cunits is not
> supported as there is no existing equivalent for capacity units in the
> resctrl schemata.
>=20
> I previously iterated on an RFC series [5] that implemented all of
> CBQRI, including capacity monitoring, bandwidth allocation and
> monitoring. The bandwidth controls for CBQRI do not fit well into
> resctrl's existing throttle-based MB schemata. I believe that the path
> forward is Reinette's generic schema description proof of concept [6].
> My plan is to rebase the full support of CBQRI onto the generic schema
> once it is ready.
>=20
> Tony Luck's AET series [7] replaces resctrl_arch_alloc_capable() and
> resctrl_arch_mon_capable() with generic helpers that walk the resources.
> This series keeps the two hooks because resctrl on v7.4-rc1 still
> calls them, and answers the alloc hook from rdt_resource::alloc_capable
> so whichever series lands second only has to delete them. If the AET
> series lands first, the CBQRI glue will also need the three arch hooks
> it adds, resctrl_arch_system_max_rmid_idx(),
> resctrl_arch_get_num_rmid_idx() and resctrl_arch_unmount().
>=20
> [1] https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0
> [2] https://docs.kernel.org/filesystems/resctrl.html
> [3] https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0
> [4] https://github.com/tt-fustini/qemu/tree/riscv-cbqri-cache
> [5] https://lore.kernel.org/linux-riscv/20260601-ssqosid-cbqri-rqsc-v7-0-=
v6-0-baf00f50028a@kernel.org/
> [6] https://lore.kernel.org/all/d258a32f-12d5-464d-abe9-4720fb3e44b3@inte=
l.com/
> [7] https://lore.kernel.org/lkml/20261019205031.16977-1-tony.luck@intel.c=
om/
>=20

I have tested the CBQRI patch series, covering the following:

   * Boot-time initialization
   * Mounting and remounting the resctrl filesystem
   * Creating resctrl control groups
   * Configuring schemata for L3 block_mask resource allocation

All of the above worked as expected.

Tested-by: Zeng Heng <zengheng@picoheart.com>
Reviewed-by: Zeng Heng <zengheng@picoheart.com>


Best regards,
Zeng Heng

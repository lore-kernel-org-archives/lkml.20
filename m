Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.218
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318008;
	b=m5LM2PiwnEPHvpRtSJ6G3vKrsOm3mENkzDUH0eO6kvk0U6BQnh1/5JWiP+V7CAV4tFWt
	 j+iKlfiLxSK7nrz24u6M0DnkCv9VjbzT/nX8M9ZgYlXwUfs2ZmKTydQsNVjBkD9+XmtdB
	 j+7rrnV8N4vggfQOLnWujqVNjw/5qtwrrm2wsygVwMpvMzFWto4ZTI8Qp5Lmg5VEbvmv2
	 NTJk2qVAftP02vkbN78M/lNbVzN5fWezSvqZeBWdGNFQlkLicmRbOhXCA1WMdVp0nGSGH
	 HXIpCmb/eqjbRNcjsDf1b9G566o9AcxbjLbFSOKyZHUmjWzuAam7MyWiXepVNM/hBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318008;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:CC:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=StTeopdbwWMEf6YkIRSVtERljPRHgySRJO5GAvUKmY4=;
	b=qv7Hqj0F9NR3Td6cH9dHEqW/Q2zmODDgkmBhdZUH/cS7IFzutnQ2HyaHiS7EIGRo8FLR
	 okCXNxKSXvlxntr/uLCzn61RBMnZnzHq0Iz5BHo+tgJPMCeSlbzbulEBG/VRSAz1xfpwt
	 oxvNmpaFrdXDty6rk0MWOJQK5MkVKBqsjl0Bzfcrz0FcqzQ9astl5CjGqBKGtbWhT7CPL
	 V4iuCXXZP3x+aoQCLEbR+V+uDnfyJCthmZUwelWeJbeom6RpUIu3u0U3gxpbIzay79adj
	 3WSck6LRln09Bua2I0QP7kya551Etvf4fXrxajDh9smoY7+VesKEQzELFZvliILqUkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cAMdEG9P;
	arc=none smtp.remote-ip=113.46.200.218
Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D37606A336;
	Tue, 10 Nov 2026 13:40:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D37606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=cAMdEG9P
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=StTeopdbwWMEf6YkIRSVtERljPRHgySRJO5GAvUKmY4=;
	b=cAMdEG9PWSy8VraqdQeEi3KPpNVHXUndXFxyNoac7PkIJEWvTy5sBXsR1gb6HUBruWF7gaIED
	OOjtYTMYrXAVk9OLtMEsq2UArySS/TKniuXwZZCmpYvuLjs9aZ58wleMvOZCvgzjH7gvHi+FN6n
	tSrpiz0DdJHc9HkRm7b7D2I=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jP76j1kwPzpSwS;
	Tue, 10 Nov 2026 21:39:25 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3773E40575;
	Tue, 10 Nov 2026 21:40:01 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 10 Nov
 2026 21:40:00 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>,
	<tan.shaopeng@fujitsu.com>, <will@kernel.org>, <gshan@redhat.com>,
	<zengheng4@huawei.com>, <jic23@kernel.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v5 RESEND 0/7] fs/resctrl: Fix some resctl bugs related to mpam
Date: Tue, 10 Nov 2026 21:39:31 +0800
Message-ID: <20261110133938.3768632-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)

Fix resctrl RMID allocation to report a retryable -EBUSY only when
the target CLOSID actually has RMIDs in limbo.

Split the domain-offline path out so it releases busy RMIDs without
allocating a monitor context it never uses.

Also unmount resctrl with the CDP state it was mounted with to fix
another bug with mpam cdp.

And do not allow monitor group move when the RMID index changes.

These fixes are split out of the v10 Narrow-PARTID series below.
	https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

v5 -> v5 RESEND:
- resend because of email problem.

Changes in v5:
- Update and split the patch as Reinette and Ben suggested.
- Adjust the commit message.
- Add Reviewed-by.
- Link to v4:
  - https://lore.kernel.org/all/20261105070934.2258613-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/

Changes in v4:
- Fix the unmount resctrl bug as Reinette suggested.
- Adjust the commit message.
- Add Reviewed-bys.
- Link to v3:
  - https://lore.kernel.org/all/20261031063634.1678345-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/

Jinjie Ruan (6):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs
  fs/resctrl: Clear the CDP state after the cleanup
  fs/resctrl: Stop the limbo handler while resctrl is unmounted
  fs/resctrl: Release the limbo RMIDs when the CDP state changes
  fs/resctrl: Add info/moveable_mon_group

Peter Newman (1):
  fs/resctrl: Disallow monitor group move when the RMID index changes

 Documentation/filesystems/resctrl.rst |  15 ++-
 arch/x86/include/asm/resctrl.h        |   6 +
 drivers/resctrl/mpam_resctrl.c        |   9 ++
 fs/resctrl/internal.h                 |   3 +-
 fs/resctrl/monitor.c                  | 151 ++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 |  50 ++++++++-
 include/linux/arm_mpam.h              |   1 +
 7 files changed, 196 insertions(+), 39 deletions(-)

-- 
2.34.1


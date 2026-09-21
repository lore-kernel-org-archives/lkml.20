Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F2A4A1DE0
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999040; cv=none; b=eYI11oJcyHtoo/pOln9YJUnKkm1PFP9WzIOPCPukXzZXR6EWQLyV9+gskQ/X1UWzLXNW+fSX0FbEFXmMsUX2wL63AdYN5UGChm8Xw+LVmibnhf2noMpqkJFWOxWMnUyA1cOcWY6k6MTZw8KkfaXljMbf53oYUW0/ihbumiFDCh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999040; c=relaxed/simple;
	bh=ziJAcfm3TK6RrK87RrtizCgnSxoE6J6ewE7wzNYYcBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G6P9x5Tq52oJC9fIs6LZ2zjdIkk0WYDH3uFQL7PqVyZ4/GetgJRHro/mHdKQsbYHmD1tvXP+Rp8QqypU/44Q7HyfBrLWDOVOiU3OtuD8BpUlcSvPdCVvZRYPYDeOOf88ds61nH+R0mSUbUy5A1P7eamab3EUF246C5jYNzCoe+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=djgasQBh; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="djgasQBh"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8236819F6;
	Mon, 21 Sep 2026 06:57:12 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2360D3F528;
	Mon, 21 Sep 2026 06:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789999036; bh=ziJAcfm3TK6RrK87RrtizCgnSxoE6J6ewE7wzNYYcBw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=djgasQBhgEMz5ofF4MIaeHQPltp+Cv3rmAiah6OdIDA/xaaKYi/cYHs5IUQUqKlEo
	 EjdlGWePEmyJATF1cVDkbJTvfBWX6SKGCXOC28nx/TeYye7eSzmSn7ZLTJw0zzboZi
	 LWVrT3jq0FltOFgT3YtU+aeMaVP8EbUcYJO8Mwko=
From: Ben Horgan <ben.horgan@arm.com>
To: reinette.chatre@intel.com
Cc: Dave.Martin@arm.com,
	babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	fenghuay@nvidia.com,
	fustini@kernel.org,
	james.morse@arm.com,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	tglx@linutronix.de,
	tony.luck@intel.com,
	x86@kernel.org,
	yu.c.chen@intel.com
Subject: [RFC PATCH 2/3] fs/resctrl: Use correct schema name in bw_validate() last_cmd_status messages
Date: Mon, 21 Sep 2026 14:57:01 +0100
Message-ID: <20260921135702.2874931-3-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921135702.2874931-1-ben.horgan@arm.com>
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As bw_validate() is now used for all scalar controls update the
last_cmd_status messages to display the actual schema name rather than
unconditionally using "MB".

Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 fs/resctrl/ctrlmondata.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index efeb36e0db25..968eb04046e9 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -131,7 +131,8 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r,
 
 	ret = kstrtou32(buf, 10, &bw);
 	if (ret) {
-		rdt_last_cmd_printf("Invalid MB value %s\n", buf);
+		rdt_last_cmd_printf("Invalid %s value %s\n", ctrl->schema_name, buf);
+
 		return false;
 	}
 
@@ -142,8 +143,9 @@ static bool bw_validate(char *buf, u32 *data, struct rdt_resource *r,
 	}
 
 	if (bw < ctrl->scalar.min || bw > ctrl->scalar.max) {
-		rdt_last_cmd_printf("MB value %u out of range [%d,%d]\n",
-				    bw, ctrl->scalar.min, ctrl->scalar.max);
+		rdt_last_cmd_printf("%s value %u out of range [%d,%d]\n",
+				    ctrl->schema_name, bw, ctrl->scalar.min, ctrl->scalar.max);
+
 		return false;
 	}
 
-- 
2.43.0


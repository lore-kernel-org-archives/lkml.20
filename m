Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793363518;
	b=al8ACpOwvdoWyiOgJlIhZ7oVDn5nlXtAH/kvR0o9BoHEI0no4NGP4BH2Y/aVeKYovsF1
	 REtN+0IMzUqlA+g59rJY0jOg1RVgwZh+bEp8hUoh8rgrTBpxcUHS9A1Sk01fdNpQkIjPj
	 dUILMrP9C+NJv2O5jz7w7K3G7Fxv6U7UedXHmSNXn2DKsreWW0R35CZUHMDKF9Uz8U+BE
	 Q3rpkQfHj4Ghhl+WAnARGPSEpjxN4rKubifqSZjBzFZbsEZTHso92KuO7++Hmd4Swusxs
	 lvNseugnncC2crQ45bvlA6h3+Ke1bJzYtVh56GQ7+T7WiHR+9WMpnLU7V3opzfsCdeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793363518;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Flowmailer-Platform:Feedback-ID;
	bh=05pkMzmFo1mom25+6d31PpYQTI4GpPLTaW3NXA3ILjM=;
	b=ywjSB+FmOZKco70UgV2vpG9S8gJ9fkRH24TrGKxs+wpYt2HHiRd9dI0qzD40iq1w/JIB
	 hktXfD/bsZwvMB3fmidtWGx5XRhJ3JNA6z2s1jZf5cixAdRiTLp8S+oMAeOKxtcOZFyg3
	 Qlt6SbwcTjcjvefnR5WEw29JPtt1Dz5LcMt0gHLlx8t5hGSAHPCmv895kkU16pD9fwep7
	 UAxXZcn5DYe5mMGB2lAsO+QMtH6u+1267lz0UoXQtGyYLw3+ceN2nQxQnWMqpBoNFGlFd
	 eWRFe2270WEJu6/GN3DrxX53f4+G70v9Y3l+iv/UwV84fPzS8DWfGSNW3FNJLekA6Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=florian.bezdeka@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=fJj+7rOl;
	arc=none smtp.remote-ip=185.136.64.226
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3BE606A325
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF3BE606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=fJj+7rOl
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261030123149fa9ce733e600020706
        for <linux-kernel@vger.kernel.org>;
        Fri, 30 Oct 2026 13:31:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=05pkMzmFo1mom25+6d31PpYQTI4GpPLTaW3NXA3ILjM=;
 b=fJj+7rOlf5wWW666dHQ5yAw5DPGzAR6aPPT+ArWwkamPA8/Z6kze/7dsNp4FV25spGqqnE
 UQm92ZG2eA3m9vVgNQIecUbaJbqKduDeHQf6LakXqxhMctjDMRfcvQax5l42dLIFds+GAs+7
 +IgM26Jkst53dS6R5fwMpDSTMqc+vxf4d+hf8D8Wm4lV/sZL35mDTcCn7sOasHix0aBQgwcf
 ERmhRgadPDLE9THhniPVzUKorRsQXeG7fEFOpiy5VbEk3osIztok4M91dkVzSLQ36FnoYnww
 MTw2tTxKucoEFk0WHdpHo6SlTFRbM4nYG1T7HE4Qd1s9COjlv+AVw2pQ==;
From: Florian Bezdeka <florian.bezdeka@siemens.com>
Date: Fri, 30 Oct 2026 13:31:42 +0100
Subject: [PATCH 2/2] entry: Complete syscall_enter_from_user_mode_work() to
 bool migration
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
Message-Id: <20261030-wip-flo-fixup-entry-code-v1-2-7724c29e800b@siemens.com>
References: <20261030-wip-flo-fixup-entry-code-v1-0-7724c29e800b@siemens.com>
In-Reply-To: <20261030-wip-flo-fixup-entry-code-v1-0-7724c29e800b@siemens.com>
To: Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Jinjie Ruan <ruanjinjie@huawei.com>
Cc: linux-kernel@vger.kernel.org, 
 Florian Bezdeka <florian.bezdeka@siemens.com>
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

The return type of syscall_enter_from_user_mode_work() was changed to
bool in the commit referenced below, see Fixes: tag.

While doing so, one caller in
syscall_enter_from_user_mode_randomize_stack() was overlooked and
stayed at the previous type: long. Updating this caller accordingly
now.

Fixes: 05c033db7e9a ("entry, treewide: Make syscall_enter_from_user_mode[_work]() indicate syscall execution")
Signed-off-by: Florian Bezdeka <florian.bezdeka@siemens.com>
---
 include/linux/entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index a8b2430eadc5f8500195454e24f86cd9e0d06614..15278416f8860724d90bb2f8862017fdf678771e 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -202,7 +202,7 @@ do {									\
 									\
 	instrumentation_begin();					\
 	local_irq_enable();						\
-	long _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
+	bool _ret = syscall_enter_from_user_mode_work(regs, syscall);	\
 	instrumentation_end();						\
 									\
 	_ret;								\

-- 
2.56.0


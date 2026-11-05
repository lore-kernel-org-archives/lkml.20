Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841295;
	b=FFN9JUmTneemhDV7bYWdJ8qnOCLLEzDhC2P4V3GXOQC5iaKAMCf8syN4fajSTvUPGED+
	 0oe0t7UbT3hrNDUk+PwIOpG05Q4yZFwpPpEzaiPK6VjDNyyR4YcCYSoNO2EHRDgO0hSVn
	 UjfCXv9zIq9hbyQ0xeJEs7cvYIqL8EFcIxc2CfDDJCJPlJooNfvKk7clFnsghy21d/gE5
	 6YcXO4Xs02/W0qRlFIW+66q7R8ByqbSne4Sme4JW3sreM3L8Zj6eQSXB5YuE85F983kBU
	 4DTgVgPUmO6s3OinALN3kUM6Pt8PYW5smQA5n9+pItiuQoes02nNTxs988j8YIOXc3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841295;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=XFChDW5ehIs6Iq9hni9SKBNe05DaMKuDun7X49WCc0M=;
	b=uR/ejCrtVhNrqUMerWBADLOPyjoch/gsGz9ytaY50eHawL0tvBAKYINuL/t+jK0L2vhb
	 kg4GfMGUWgFLTvteLFk7oj+pBdY3F2qIQRaDrcRAveaWQxpo0bqH+Km3aufXaUSa2Zk5p
	 fAitxOvSqXC4jKt8Kv56XziEhOSAHcpRcT4MJGZ5Q5D7uDDO024K98Ze2n6tOgzu021ca
	 NE08Y0bUP4onqeVPWv9p/NslUL7Al1YGkqvYT23HeKXrxKu43TP81j9qvChBexSh9HvoP
	 mMmseBB2QA4ioyiL0/NofdxhqW+wLGeXrv9+Zd832Q8q1AtyO8FxJNm3dwYaZVUs2TQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=f11qytBO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Znge2KwI;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA47606A31B;
	Thu,  5 Nov 2026 01:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA47606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=f11qytBO;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Znge2KwI
Date: Thu, 05 Nov 2026 01:14:47 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793841289;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFChDW5ehIs6Iq9hni9SKBNe05DaMKuDun7X49WCc0M=;
	b=f11qytBO2Hkuk/0a5LaFGe/nmAwFN8APDs8/3V/8Qp7Wux2YBzXZFMhrqS2Nh6b+fivGS9
	J6o3lThBvqgP6MpfoTnHjLuMGHMWmnx4zmjyyfiq8rgecHXu6Fwu9DkIB3c1TCnGHQzTsa
	sN7z1wWrSHWqRQrvybXbaFMkW9ZT3yAnUwjya8lj7igcrnm8C4jJRK2ysga75CwIuLQVeo
	vwBdMscWU371cz0nragax+BMgJ7Qqg9hu7fhiAl3l0mknDzMkq8r9/7mDNA34Eq8wZxCOQ
	gQu+yDrXCQsj/Jna2qrYkfgPEhSaTTwB5N6o5hlkPgD7Xhh4eET2kLUU84Prfw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793841289;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XFChDW5ehIs6Iq9hni9SKBNe05DaMKuDun7X49WCc0M=;
	b=Znge2KwInQrQIPkdJYC/b3swAmigQZV+cLWLuarbh9lAY0PzKSN4pmH7Al0WXBAbPfPUSd
	AA/wS/sJeeRySzBA==
From: "tip-bot2 for Drew Fustini" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] MAINTAINERS: resctrl: Add myself as reviewer
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Drew Fustini <fustini@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-6-1636a003a3c0@kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-6-1636a003a3c0@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179384128782.1009794.4876947094145271732.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     6bb462e8e5334f7bd3384843253e96112c98f5af
Gitweb:        https://git.kernel.org/tip/6bb462e8e5334f7bd3384843253e96112c9=
8f5af
Author:        Drew Fustini <fustini@kernel.org>
AuthorDate:    Wed, 04 Nov 2026 08:35:23 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Wed, 04 Nov 2026 17:08:26 -08:00

MAINTAINERS: resctrl: Add myself as reviewer

The RISC-V CBQRI support builds on the common resctrl code, so changes
there affect RISC-V. Add myself as a reviewer to stay aware of them.

Suggested-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/20261104-dfustini-atl-sc-cbqri-dt-v10-6-1636a0=
03a3c0@kernel.org
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb3..fbd4e64 100644
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

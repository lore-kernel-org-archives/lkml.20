Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984303;
	b=dwXJvjrljoxfwrEyw2D2N7BBsohBq+QShMtJmRwe3kWUnVvJRLF3DedAQTkMvBWRxtfI
	 U9L4HNK8mPEhbvXRErNFxOUlNZpiciYfWGoNm77QeszNlodNP9hZP9+6nU+OZ5v+yJEEu
	 KYd3aWmuW9+tGPSLe2wZKCgREfV1tf2NDACz+gd2EZ0jzEo5iK1fOmKlQRja+JF2sH0pY
	 SW8ddE8RtaXHcTS6uvWOkz8Qakn4VciTWpWs3kd+wpf5w51QKvLyvn/JOrEYXR0aIF490
	 U+F4z1jEfL+HKP3BSptI9LpOxrw2AE761kWn2q1nQ4AFKNmIcnhfl9BuT1IyCO3OjQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984303;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=A+w4R6kqPlcPIEsd7IkHMWKNbZrQ4+Xvw1Kv/t1cqaA=;
	b=wIvRkVX0cC9RmzTibiX+O3VkClnP1oZX3mh8WdGr8i9Wzj/9KxxA2syS0dbGEvLZwal5
	 1DAvZNS+HdZxaLZkSGGITtwnNASnmhUOtbYmOHl9tyetHzGjNv2qFQ/ry2o5BSVEhET64
	 PylEVuPeBHTnyczbtqZvM4Ar2/Hn3PI4aZrAhkMqOrmCeTs4wByVD7fvyUE9MbACLfwMh
	 6Y1yLGxNQMEIiCArcPVWoouE4NtRZn9gzdUzreLAyJilTPt7TOz1G9BeWJBX0HXasKfXs
	 Uiz9aihh8gDbbFaEhr3ZA8+wpp4rcEBAvnGn6XPMMmOOzhaR/xuDgbhsG63NnynuCgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=x6oKSbOF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fCh9VSxC;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7198E606A326;
	Fri,  6 Nov 2026 16:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7198E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=x6oKSbOF;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fCh9VSxC
Date: Fri, 06 Nov 2026 16:58:07 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793984291;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+w4R6kqPlcPIEsd7IkHMWKNbZrQ4+Xvw1Kv/t1cqaA=;
	b=x6oKSbOFmD8hvDwcWkjw5OFqkpuXvPf7kONSnM28P2tSezySjeHTKEoArrcDdTvWC93Q1T
	bqjlwuosvKcBuMlzvgN0r2uCCP9EP247jkTBrKV452nV4tC8nytM9ppxlAwaCKnlgtBzq7
	eVzTo3TRLDA6vGGDBITceh/fq7NL05W1qVVIp5lYjqk5oxq6Z45AhhqlhFh3udteTyY0cD
	L90iMM481U4BJPxODw/i/pFSDT7vA/W5BaRqi5i3Fz/rDy6fSWRvUCpJRwo9Aj11vqmrLI
	1EHiPeeFcZG/klhFF2V7sOHMA8siB9RuAMZP4JA9xbMxv/lS66BNRY6/572IXA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793984291;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A+w4R6kqPlcPIEsd7IkHMWKNbZrQ4+Xvw1Kv/t1cqaA=;
	b=fCh9VSxC22adWVHzOtT4EqD3COhX7yLMNCmlW4mTxU4XOEDTw9RAiX35098qP7Kzm9YwdT
	qUWLHomH0cKkrxAg==
From: "tip-bot2 for Reinette Chatre" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/urgent] MAINTAINERS: Add Ben Horgan as fs/resctrl reviewer
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Ben Horgan <ben.horgan@arm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3Cc68cbba4455d3f5e65c38b76b3daadc04217abca=2E1793838?=
 =?utf-8?q?993=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
References: =?utf-8?q?=3Cc68cbba4455d3f5e65c38b76b3daadc04217abca=2E17938389?=
 =?utf-8?q?93=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179398428760.1009794.16352494139109017284.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/urgent branch of tip:

Commit-ID:     b73fdd0f49e175dd733650669193c1504d283955
Gitweb:        https://git.kernel.org/tip/b73fdd0f49e175dd733650669193c1504d2=
83955
Author:        Reinette Chatre <reinette.chatre@intel.com>
AuthorDate:    Wed, 04 Nov 2026 16:37:47 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Fri, 06 Nov 2026 08:53:29 -08:00

MAINTAINERS: Add Ben Horgan as fs/resctrl reviewer

The resctrl filesystem provides the user interface to the resource control
features of multiple architectures, among them Arm's MPAM. Ben Horgan,
MPAM maintainer, has consistently helped keep MPAM's requirements in view,
both in discussions about new resctrl features and in review of resctrl
changes.

Add Ben Horgan as a reviewer so that he is copied on resctrl submissions.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Acked-by: Ben Horgan <ben.horgan@arm.com>
Link: https://patch.msgid.link/c68cbba4455d3f5e65c38b76b3daadc04217abca.17938=
38993.git.reinette.chatre@intel.com
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fbd4e64..99ae546 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23460,6 +23460,7 @@ RDT - RESOURCE ALLOCATION
 M:	Tony Luck <tony.luck@intel.com>
 M:	Reinette Chatre <reinette.chatre@intel.com>
 M:	x86@kernel.org
+R:	Ben Horgan <ben.horgan@arm.com>
 R:	Dave Martin <Dave.Martin@arm.com>
 R:	James Morse <james.morse@arm.com>
 R:	Babu Moger <babu.moger@amd.com>

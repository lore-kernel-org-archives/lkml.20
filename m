Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793593889;
	b=hrR+rbxCekb+zAx4TEuhtTSnjUPhNPCCW6oPp1uq5uZxgXrGCOXdHRMFcLjsyZBrN3eV
	 MvavSETq2MsL9+PCVY2q5kgUVH8r9+/0TmiavJSy+NFuc7XM+jyq16GZXkpkHCmUNsVp5
	 JVhrQ82W8i15eGZGlFfFP12p/A2Wh+eoQnHEkvzUMZ2I3eClnlMx5t/9Ti4QjxmDaYaH8
	 fuJc5J/gfE3Fj25/lEoukOQRwAN0l2tZfSkDZG9nAgaSbEa0K5VZDPA0Xy93QqVN0VIlC
	 YRZUqag3vZwbF/ObJ0o6LtIURfITJ+81GoBs2Q6iiXLj25Nj8GoURSOYydJH3S4Yp/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793593889;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=XkLBIjSbVRCk26R+MupO3H38Tk6gmluoKUeZe16pUQw=;
	b=lLkDEfAt1SYpzA2gduo5p2BeSvrKxR+8JT+a01R6mxQroHlSr0+cfLh9fgkU5+SNEifd
	 wO/p1WEeFUHdfpDtpwynBbKBAMjK+h3IvJEGVBwci3BuAESVmy6WYtvnJW+MTgm94MRwg
	 3RzxXqyasXPo5TDxOKNpG9iiX6SQDSk9P9VR5ju8YOJlTIh/AKoIboX6EdfrEJZcHpAJv
	 N7MvS/qNG9DFtHs55d05lvm+dbG+LUXS1qP3mNWqy+5DhwiJHkOh1saYZSEOuxWM+INKs
	 eGOYwY7hg3L+acbSqolMLjUkyDmFUVJKeop+zfL9lG7dkwauHOlxhFgFYK8svOL/+uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b="OMvdirf/";
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yi9ZFYiR;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F818606A326;
	Mon,  2 Nov 2026 04:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F818606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=OMvdirf/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=yi9ZFYiR
Date: Mon, 02 Nov 2026 04:31:25 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1793593887;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkLBIjSbVRCk26R+MupO3H38Tk6gmluoKUeZe16pUQw=;
	b=OMvdirf/S8RU3weIllgc6g6kT83cHcXK1IrgVEE9dRstGonH94KR++QtqHhdTyV+bjaNOZ
	THQSPwxx50WsIct+9XZtMSDAzUny8uVvWajqNY/r7GiYjOqXw3PDh6d8toogeQl28fXPDu
	Yj929LCGdYoN5cxFgP+snPzVsa05Ecm1GG9zcNd+R0N4kjEbuwk24wz+wj92KYqh6NYyyO
	0gTiZCrss/A5/SiwIDrAPAeHxjItMQh+DIGiOw3E+pwrS27rqYZqZso0eF7dZ1g/JljxIf
	NCalDPtK06+Nwj6XomKPYofF25VIQ2q23B/oaclFNiPaUJtv6XUtj1+ecD/7Pw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1793593887;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XkLBIjSbVRCk26R+MupO3H38Tk6gmluoKUeZe16pUQw=;
	b=yi9ZFYiRWQibCf7hHkH4cPUPmVh3cRScQqgEhVzTqqYuf4emhc5jM+grFJeaBxg57l7lcd
	F3a4qJtf0BanaMAA==
From: "tip-bot2 for Sohil Mehta" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cleanups] x86/bugs: Replace RFDS model checks with VFM ones
Cc: Sohil Mehta <sohil.mehta@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20261030195214.1284995-1-sohil.mehta@intel.com>
References: <20261030195214.1284995-1-sohil.mehta@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179359388559.1009794.13162832200073973480.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cleanups branch of tip:

Commit-ID:     07479e8845c8a3a17d49a707a7178e9fd8360ab1
Gitweb:        https://git.kernel.org/tip/07479e8845c8a3a17d49a707a7178e9fd83=
60ab1
Author:        Sohil Mehta <sohil.mehta@intel.com>
AuthorDate:    Fri, 30 Oct 2026 12:52:14 -07:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 01 Nov 2026 20:28:55 -08:00

x86/bugs: Replace RFDS model checks with VFM ones

The RFDS vulnerability check uses raw model numbers to identify Alder
Lake and Raptor Lake. Most Intel-specific code has already moved away
from x86_model checks, but this one got added recently.

Replace the x86_model checks with VFM ones to make them more readable.

Signed-off-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Link: https://patch.msgid.link/20261030195214.1284995-1-sohil.mehta@intel.com
---
 arch/x86/kernel/cpu/common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 9bd50c6..aba7e99 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1391,8 +1391,8 @@ static bool __init vulnerable_to_rfds(u64 x86_arch_cap_=
msr)
 	 * both Core and Atom CPUs. Mark unaffected when Atom CPUs are not
 	 * present.
 	 */
-	if ((boot_cpu_data.x86_model =3D=3D 0x97 ||
-	     boot_cpu_data.x86_model =3D=3D 0xB7) &&
+	if ((boot_cpu_data.x86_vfm =3D=3D INTEL_ALDERLAKE ||
+	     boot_cpu_data.x86_vfm =3D=3D INTEL_RAPTORLAKE) &&
 	     boot_cpu_data.topo.intel_type !=3D INTEL_CPU_TYPE_ATOM &&
 	     !boot_cpu_has(X86_FEATURE_HYBRID_CPU))
 		return false;

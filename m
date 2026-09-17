Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351CC4F68A6;
	Thu, 17 Sep 2026 21:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680387; cv=none; b=O9lbd/BeZw63L5YnNq9hBrTKf8T2LDttHgVLXYb7ViUkD0cJitnXZ+fAqEYS5v+/jiw3/S4Gd6LaQUmCwMn+i3gS+S5DlJwEqj0+2kkl8f/E+Ir7eZDleqf+dy8fSl29IUtAsB40EcEP0WVjdNqxXUR+bOgOFt2z7qMXcZVQLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680387; c=relaxed/simple;
	bh=HTPao8ZmGqllvQ8mNfr3aPz9Af7Ly2wymYQSVn/UA90=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=jUKrbOSyD7cePZJNWiMH+gAYfrek1A6958tfNCtAxUTtqA7CJfSZpJTLSqYl5JnSCl+27v0GzSUCWC0v/5B5xidxxH4neUCv4E6bw4e7dINLw/SnCP83Xk2vSOqGSuYRwFbpNpKc44M4P2sL6I5dGNBoonzh27G/nR5wsYlTfdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mORWEeiu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=GzM0Et++; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mORWEeiu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GzM0Et++"
Date: Thu, 17 Sep 2026 21:26:21 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789680383;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7g38MzXuXc8e8wiQIN+JY+CpoD/WiaTgR3+0vzT49o=;
	b=mORWEeiu/upelFQHyNCqOV8DOueodau1es1mHL65GQVF/E4blL7zRhSKr1P++53tAjpk/b
	RSC3+kow6krMTNWfRSBz5+HYZ7AY7eR0ktmkdeW3ErN5L+j1K5nrc7TUn4E3cj+Lm4F/bj
	P02Zjz93Qcl1kRe+tOrkggnSD++ZK4cSZj5aMx+qe+rH+odBdeF4bKUp5RTMMy2Q0tZsSR
	3b3CXYZ5dB4di4CGe6S7XfY0k3dypG//XfpCPbjUShO1gvD7QnXjo2jyhB8/CiCd/JiN+k
	j/M3NvCLSfGfnY/+65Dt/3yknfPg4pmhN6I/gHHcvI3NXWbePY7MYVA7Of03XA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789680383;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H7g38MzXuXc8e8wiQIN+JY+CpoD/WiaTgR3+0vzT49o=;
	b=GzM0Et++IMPAv+PSzaBw+aET3tuKsZ7EVw519pl+fXVuC8GelLWwc3c6Co45Wigp7NAso2
	1rL5PmPq4X0DQWCQ==
From: "tip-bot2 for Dmitry Antipov" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] fs/resctrl: Avoid extra call to strlen() in
 schemata_list_add()
Cc: Dmitry Antipov <dmantipov@yandex.ru>,
 "Borislav Petkov (AMD)" <bp@alien8.de>,
 Reinette Chatre <reinette.chatre@intel.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20260821081128.19242-1-dmantipov@yandex.ru>
References: <20260821081128.19242-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <178968038150.1720534.7663862263198825241.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     4b31656d917c46c6d9f874162ede4f54b2a5959f
Gitweb:        https://git.kernel.org/tip/4b31656d917c46c6d9f874162ede4f54b2a=
5959f
Author:        Dmitry Antipov <dmantipov@yandex.ru>
AuthorDate:    Fri, 21 Aug 2026 11:11:27 +03:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Thu, 17 Sep 2026 10:41:53 -07:00

fs/resctrl: Avoid extra call to strlen() in schemata_list_add()

After passing an overflow check, it's safe to assume that snprintf()
returns the number of characters emitted. So drop the unnecessary
call to strlen().

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
Link: https://patch.msgid.link/20260821081128.19242-1-dmantipov@yandex.ru
---
 fs/resctrl/rdtgroup.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
index 5dcbb0a..68be9b9 100644
--- a/fs/resctrl/rdtgroup.c
+++ b/fs/resctrl/rdtgroup.c
@@ -2858,7 +2858,7 @@ static int schemata_list_add(struct rdt_resource *r, en=
um resctrl_conf_type type
 {
 	struct resctrl_schema *s;
 	const char *suffix =3D "";
-	int ret, cl;
+	int cl;
=20
 	s =3D kzalloc_obj(*s);
 	if (!s)
@@ -2882,14 +2882,12 @@ static int schemata_list_add(struct rdt_resource *r, =
enum resctrl_conf_type type
 		break;
 	}
=20
-	ret =3D snprintf(s->name, sizeof(s->name), "%s%s", r->name, suffix);
-	if (ret >=3D sizeof(s->name)) {
+	cl =3D snprintf(s->name, sizeof(s->name), "%s%s", r->name, suffix);
+	if (cl >=3D sizeof(s->name)) {
 		kfree(s);
 		return -EINVAL;
 	}
=20
-	cl =3D strlen(s->name);
-
 	/*
 	 * If CDP is supported by this resource, but not enabled,
 	 * include the suffix. This ensures the tabular format of the

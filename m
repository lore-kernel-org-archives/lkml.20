Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794259598;
	b=Si/Te4uPxegqCS1yFUOoxqPTTTgqal2Hv2DWz4L01viSKAOqI0KgLlkmaRYyOMQRx5CN
	 o7QEktK/w+sHnDrTGcOKsn7qCP+ufNBNfm6z5Ge7TUlWEM8WaPU34Fe3hJiFQ/oHtawlV
	 A7Spk8kESUysD6a8uMywglzwGbBdef26hF3B3NtI08of7trk25/v0LMoBAYmwnGZJwIdv
	 PY9TQKFhXVeamHPZxko4QL9Mu6jRBsq8BaOx/RmdeIIewd64MT8W/8yoaRgd7WSxK/XWl
	 wAViTi8KeyiYjzoumMtp0NLrHHrFPnM34ktpGcQZ8zxemqhmBPWhkSxmtEuuFWxNQEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794259598;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=9T/Cxfy40DMYKpgdCoy5lmF/aG4jW9r6fse7gIoy3p0=;
	b=dCHTDNsEab9h+CGRQSY1kM8JldXTiXZ+F5vcW3BXoPpNqK88S+PG7PLBTLj4bWOVGal+
	 v95Q5FWBWXPpMpryovncMQ0Ozg7gRrzpMqCoKBuicrbq+BUyThLYecex/YiDWRhit7SD0
	 YIEYJ5ha1FbiT91Z8Zz5KC5lvMGgyEHk6NwifVxRy/MROF9dqdpN5EBC4RaqwSy7BWnIQ
	 W3Sh37D8DS8wbV8Vn4aNp3z+ABcKvfr7D5HpgfAPZ94y9eRdII0yWwkvju5XA96mH+d+G
	 dK/Eez0DOX9JsFOx+ayRtwJkiXyNuytgUl7s6CyansxxRGGDkweaV5aDnXLTlBSZcCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VIfqHijT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wsNnpdZa;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78361606A332;
	Mon,  9 Nov 2026 21:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78361606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=VIfqHijT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=wsNnpdZa
Date: Mon, 09 Nov 2026 21:26:32 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794259594;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9T/Cxfy40DMYKpgdCoy5lmF/aG4jW9r6fse7gIoy3p0=;
	b=VIfqHijTf+YUNwcIdi4BmfxoFBRfhirlXHL7XJxrpNrYLQ6wwgDUf1KPxzvLkgbsHpp+oi
	pdf9v8bh2nW/OyvvzYk8meDLh3CX+C3Ufe2MU7cq6REfyRXu81TnkFXW/E1y+lnN07yY8Y
	L1F/JERT4NJGmRNCtZ/GqR8A0Lk2KzTyH/A/X8ohcOIuGDH0q3dHXtXipERc8RmeJ7z8qe
	augL6DXOV4ZJYL9fi9pj4ILyMeKueFA77nEQyveC03MN6tHN8h1r6bbkNlXlzxcuyFUbFD
	xo/p33Ji/aeOUAvDSDT/3pQOzXNpX+Vzika/k0n4M0fhaZ6R0qgnLjRKPwp38A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794259594;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9T/Cxfy40DMYKpgdCoy5lmF/aG4jW9r6fse7gIoy3p0=;
	b=wsNnpdZabgzzwQXjMXFOfW15K+lJ5POt/OBpZchjZHcjjSzEjh3KpHLD6bFNP4/k8bDB0k
	33oP6BvEyRTh2jBg==
From: "tip-bot2 for Reinette Chatre" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: x86/cache] fs/resctrl: Drop unnecessary parameter from
 resctrl_io_alloc_parse_line()
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 "Borislav Petkov (AMD)" <bp@alien8.de>, Ben Horgan <ben.horgan@arm.com>,
 Chen Yu <yu.c.chen@intel.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 Tony Luck <tony.luck@intel.com>, x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: =?utf-8?q?=3Ca1cbad5a426689842502793f21ddb1e9b3b6408d=2E1793834?=
 =?utf-8?q?224=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
References: =?utf-8?q?=3Ca1cbad5a426689842502793f21ddb1e9b3b6408d=2E17938342?=
 =?utf-8?q?24=2Egit=2Ereinette=2Echatre=40intel=2Ecom=3E?=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179425959226.2093942.15264992073228548889.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the x86/cache branch of tip:

Commit-ID:     2a93af75384b7e95d62c5a9a39e13573e2170ec5
Gitweb:        https://git.kernel.org/tip/2a93af75384b7e95d62c5a9a39e13573e21=
70ec5
Author:        Reinette Chatre <reinette.chatre@intel.com>
AuthorDate:    Wed, 04 Nov 2026 16:13:33 -08:00
Committer:     Borislav Petkov (AMD) <bp@alien8.de>
CommitterDate: Sun, 08 Nov 2026 19:10:41 -08:00

fs/resctrl: Drop unnecessary parameter from resctrl_io_alloc_parse_line()

resctrl_io_alloc_parse_line() parses a line written to the io_alloc_cbm file.
It receives both a schema and a pointer to the schema's resource. Its only
caller looks up the resource from the schema just to pass both.

Passing the resource separately is redundant and allows a caller to pass a
resource that does not belong to the schema. parse_line(), which parses lines
written to the schemata file, already receives only the schema and determines
the resource from it.

Pass only the schema to resctrl_io_alloc_parse_line() and have it determine
the resource itself, matching parse_line() and in preparation for passing
additional information when supporting multiple controls.

No functional change.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Chen Yu <yu.c.chen@intel.com>
Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Link: https://patch.msgid.link/a1cbad5a426689842502793f21ddb1e9b3b6408d.17938=
34224.git.reinette.chatre@intel.com
---
 fs/resctrl/ctrlmondata.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
index 4562072..69123b2 100644
--- a/fs/resctrl/ctrlmondata.c
+++ b/fs/resctrl/ctrlmondata.c
@@ -955,11 +955,12 @@ out_unlock:
 	return ret;
 }
=20
-static int resctrl_io_alloc_parse_line(char *line,  struct rdt_resource *r,
-				       struct resctrl_schema *s, u32 closid)
+static int resctrl_io_alloc_parse_line(char *line, struct resctrl_schema *s,
+				       u32 closid)
 {
 	enum resctrl_conf_type peer_type;
 	unsigned long dom_id =3D ULONG_MAX;
+	struct rdt_resource *r =3D s->res;
 	struct rdt_parse_data data;
 	struct rdt_ctrl_domain *d;
 	bool update_all =3D false;
@@ -1052,7 +1053,7 @@ ssize_t resctrl_io_alloc_cbm_write(struct kernfs_open_f=
ile *of, char *buf,
 	io_alloc_closid =3D resctrl_io_alloc_closid(r);
=20
 	rdt_staged_configs_clear();
-	ret =3D resctrl_io_alloc_parse_line(buf, r, s, io_alloc_closid);
+	ret =3D resctrl_io_alloc_parse_line(buf, s, io_alloc_closid);
 	if (ret)
 		goto out_clear_configs;
=20

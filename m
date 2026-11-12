Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505986;
	b=jSuUz0utSYyUkcSumax8RtkVWWkjB3P+FTQwku9vGke1hnbjm4YKvE/KOsAAs63fK0hK
	 qp++ZBIuzWb9W4XcpGRybxN8UKry+Q1GNZPlxxKX5d8wqKkhWdFXgKqGYU0uI8rYAol16
	 sSLKcwcUam+ec6ds76/TXLSr2y7w9AwYPzEOx2MB2KOEd7feVngk8jtPn3OLr0tLm1O7o
	 PPIRzZEof6ZK6VBJMiqOfz3URnZoOaI2nxF/cxQiSFbnApTrj7yD0m4pY+3VsQgHTDo0J
	 VfVhBn42W6PhiqaKQAu4S5VK/b9N3C+YXyFrd5/RNtlfqBh6c+MhJxCQJI4owMUHVGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505986;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=cSMK6Mipuf10/yEEPfPm7kNHAS+0RyoBzAv5GUWOO4g=;
	b=bqbpaYeuD7UjmVFt+p82ixOqcEmnEAHb0QymYkz7QD/SMvOjU1IcEk4KlD4VjcxovzBE
	 3glbDhD9QYa6FdeTCSpqChoTmfnoan811aGNYzFYok114TykIhtXf7Z9O68ermZ4/EeZM
	 ETCNm0tFydLCOsIfzjyNUFeJih08TmexhU1HmhxdGfR6xoP72DGwrFpttjuzDnKzcZMIX
	 yS/LZXhDE1MK5MmGpjnyzJJ5cTW6EA0LYgdpThfpGaei9fbXqMXtYwiShemK+k6YaLW2+
	 Y+CKtetyfqRsCZCyt6XYvjhAHyjb9eYazESnEUSxf+WsnN0t9V8TYSGwWAQOJ3UkgQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=gDCaIx2q;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD675606A31C;
	Thu, 12 Nov 2026 17:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD675606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=gDCaIx2q
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F141040E0237;
	Thu, 12 Nov 2026 17:52:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id yyKEWDN8BssN; Thu, 12 Nov 2026 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1794505973; bh=cSMK6Mipuf10/yEEPfPm7kNHAS+0RyoBzAv5GUWOO4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gDCaIx2qATLjnrOXRS37KojQ3sDDoQ1nmzGSXDPs/mAXVoFTzsVWj1r4ZlZbHQgL8
	 rGZ39SPqroqenalvwkx733rk1nAkZaLQVMm6Rumy1imtO1dDg6UuVX9GPDIKg5Emyk
	 s0ztoJr3+UaGTi588grcyHEDV/u/4y4nYs2yoWyrH1OcDYp45Yw4F3EvmdsPuJEwOw
	 cWxhRT9oPSQoLn/PxqKjq8IfMCsVX/3qNDzuNCz1MDjLxCY+HdgInXf1MEhJZi8StS
	 HKApvA4o6wgavZ9vnu55+EYUPFf0nFrAWiI4MJx/AfC6VjdhFexvvRoIaokCiqu51J
	 Q9tjdne4Y0v7Im/sxelBI0up2Z07UgP8e/Apw0wR4vtoW+jheKfXUv2phoBbBMpp5M
	 wt2bITF5FcLBeTF1ihWWgMfapg6Qbl8rFjslMPsr3gDGLo+mF/G4sXWFuLfQRFHR2S
	 m0v8cE/uBOqq9E+/U4ITXv0Paflkxub30z88ybZLYKWRm8swUw+j8jSMnV2VSRV/9l
	 yLd5M+2TtNCdTvKX4uLcfeio/WcNkp38+mhqYz5+gD4Br6RPgzRgAs14x9T0vGB1bd
	 gn8++xROpZuRUiNT2OF0T6WAIeMAgOR2i/KPtVa9CoT/geIEZtOak+W10vHEQYiZez
	 gBV84XafUXRefsq2c9Leid58=
Received: from stx.tnic (unknown [209.52.143.85])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D251C40E0234;
	Thu, 12 Nov 2026 17:52:48 +0000 (UTC)
Date: Thu, 12 Nov 2026 09:52:44 -0800
From: Borislav Petkov <bp@alien8.de>
To: Ingyu Jang <ingyujang25@korea.ac.kr>
Cc: Tony Luck <tony.luck@intel.com>, linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RAS/CEC: Document why debugfs error checks need to happen
Message-ID: <20261112175244.GBavX87Jq4Qe7cXO_F@fat_crate.local>
References: <20261101135340.2197888-1-ingyujang25@korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261101135340.2197888-1-ingyujang25@korea.ac.kr>

On Sun, Nov 01, 2026 at 10:53:40PM +0900, Ingyu Jang wrote:
> debugfs_create_dir() and debugfs_create_file() return an error pointer
> on failure, never NULL. Per commit ff9fb72bc077 ("debugfs: return error
> values, not NULL"), callers do not need to check the return value.
> 
> Drop the dead NULL checks in create_debugfs_nodes() along with the now
> unused err label and local variables. Converting them to IS_ERR()
> instead would have exposed a regression: on a real debugfs failure
> (notably CONFIG_DEBUG_FS=n) the function would return -1, causing
> cec_init() to abort the entire CEC subsystem.
> 
> The ras_get_debugfs_root() NULL check is kept; that helper has a
> NULL-returning fallback and is the legitimate "RAS debugfs root
> missing" gate.
> 
> This patch supersedes an earlier proposal that converted the checks
> to IS_ERR().
> 
> Link: https://lore.kernel.org/all/20260514193202.2397348-1-ingyujang25@korea.ac.kr
> Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
> ---
> Resending, as there has been no response since 2026-05-19.
> Rebased onto current mainline; no other changes.
> 
>  drivers/ras/cec.c | 39 +++++++--------------------------------
>  1 file changed, 7 insertions(+), 32 deletions(-)

---
From: "Borislav Petkov (AMD)" <bp@alien8.de>
Date: Thu, 12 Nov 2026 09:49:38 -0800

So that people can stop sending unnecessary patches here.

Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
---
 drivers/ras/cec.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ras/cec.c b/drivers/ras/cec.c
index 15f7f043c8ef..9a812defd0ef 100644
--- a/drivers/ras/cec.c
+++ b/drivers/ras/cec.c
@@ -478,6 +478,12 @@ static int array_show(struct seq_file *m, void *v)
 
 DEFINE_SHOW_ATTRIBUTE(array);
 
+/*
+ * The general debugfs rule is that most callers should ignore errors returned
+ * by the nodes creation functions. This is not most callers - if those
+ * debugfs attributes are not created, then the CEC controls are not there and
+ * users cannot modify its behavior.
+ */
 static int __init create_debugfs_nodes(void)
 {
 	struct dentry *d, *pfn, *decay, *count, *array, *dfs;
-- 
2.53.0

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

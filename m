Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.207.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144175;
	b=uXeypUdEQCu1hA+GbdZ+vP7+586EAOpz2cXDlM9p9MURmmnC84NUs+U2H5PL7fRJ79rA
	 uG/mwm5eAynC/TmhSZlbS6Q3eTBgK8/rnV8z34AVdhTrAAoKNYkbg1cf/xe2RLl12aimf
	 IsMqSM9Xe40BDJCwy9G6fWJhAwPJXmHwwib3yitlvq/L1UN+goIJUG8SN66Xdpn7lEE7N
	 BBB+fhymnWtCJlQw7F2DZ2kWgg8LyXdQBjMd5fjSIfHi2sm+1EpVMLfzy8JmLn3Pt87zW
	 VyQbJL2OJ72xQngcyUYLEqQMfXiTGoZK6hlDU1mlOm9P6obIRfz9WdigKvpabxB0uoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144175;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Received:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Smtpcorp-Track:Feedback-ID:
	 X-Report-Abuse;
	bh=IGYDahWwuRgVs+v3B40ksZVdUjKk1YSApRxwtmgYmAI=;
	b=JLUttnSfBkfR6hljYE4Z+4e+CRpkbGftUSJ4FmhBVqNgtClL/uI/ETiwdcMS5dbVL2kz
	 kzncz+6jSynGFY3S1fboH4TaPjinYcI0XKDRjDCJLhAutbRsjuKDWvfaoKb2rMKLarVm1
	 ZXcD6d09ukQR5b288XjPI7ZhihV2/+K116Mu5lPjWAK46ZKC8mYvzNDEg+DvvEfZKA2Jv
	 In8hxfaGN0Y6ZFhLtbO2dNHUVy/AgERFNFbFbJ1/A+p8sUBkfxmHN+t3/TWv3j+y50XZF
	 DuKkPxgSOME2Ddp+9o60At/TTwfzIIyVmNGcs2jxJGjKxuubqK+ZGY6TqSZ91N6x4gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shangen.org;
	spf=pass smtp.mailfrom=em879706.shangen.org;
	dkim=pass header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=G64iVQ9X;
	dkim=pass header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=majP7aEM;
	arc=none smtp.remote-ip=103.47.207.181
Received: from a2i949.smtp2go.com (a2i949.smtp2go.com [103.47.207.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC07606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DC07606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shangen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em879706.shangen.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smtpservice.net header.i=@smtpservice.net header.a=rsa-sha256 header.s=miusa0.a1-4.dyn header.b=G64iVQ9X;
	dkim=pass (2048-bit key, unprotected) header.d=shangen.org header.i=@shangen.org header.a=rsa-sha256 header.s=s879706 header.b=majP7aEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=miusa0.a1-4.dyn; x=1793145074; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=IGYDahWwuRgVs+v3B40ksZVdUjKk1YSApRxwtmgYmAI=; b=G64iVQ9XZQeQYBEhimdNAQ4R1R
	VqKVNeWF4GQIG6UH8nA/ASb17jSj6ER9gsnAKKLJ8Sp4XxdvkA+F0kO0nouqtHLdzor5OQcUzsqAe
	bNVegIZlOCau2an3MSS5tDorA1+1XjMv6Vk5GwAQfYHGwSuVvSW+rV7n10sSgj3T2CTrQ5X2zkV/0
	WAF5CW4BO7EN1uQ3aYueyGdQNOhCdN7ZX4woQzUejIVQf9+lvGHVXMspRL10GodAGeBEaZ9WKMRg0
	rDXq+cg5ThrNUZ3Tl0maIwSXEbDsWQQVzD6P6cOluU1hEtNP4BzOarORoe8C3YeoaNi+KGbo3bs4l
	n0IMSM+w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shangen.org;
 i=@shangen.org; q=dns/txt; s=s879706; t=1793144174; h=from : subject :
 to : message-id : date;
 bh=IGYDahWwuRgVs+v3B40ksZVdUjKk1YSApRxwtmgYmAI=;
 b=majP7aEMPV9lJZJEVomroGY4oNEamMRvG/Wk7b/vgxSOCWZ8l19Vq63MTMlWT6L4j42i5
 q/ZYveQ/WY5LOwkvwJWpucliqaRz0j2WhvgQOpYGNdXLQ3FqturdOupy37Eh3i60e0SaLzE
 PeI+LHUFMHyPUIhJ6D+W06Lx1k4eJgNjNmieQXnTDYBVpFIHaSzX+Ypr2FarMPBzp27yZVL
 IDadjNmeCnzoFZ3652iXKmzFiXP3w5YF/BfADlxbM3+zjtdoaPGADKs2kHLjfl+DUnsF4XG
 WZmTnOishimJeuQam26klqN9lRCoKTBiPSl0b0disREwt/B7j2+PmS85mdhA==
Received: from [10.45.79.170] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <sim@shangen.org>)
 id 1xLqhc-gL4Vta-Ev; Tue, 27 Oct 2026 23:35:36 +0000
Received: from [10.195.244.224] (helo=sse-laptop.lan4)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256:X25519)
 (Exim 4.100.1) (envelope-from <sim@shangen.org>)
 id 1xLqhb-FnQW0hPn835-KyNy; Tue, 27 Oct 2026 23:35:36 +0000
From: Shang En Sim <sim@shangen.org>
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Shang En Sim <sim@shangen.org>,
 Krishna Chomal <krishna.chomal108@gmail.com>,
 Suryansh Singh <technosfan14@gmail.com>,
 Emre Cecanpunar <emreleno@gmail.com>,
 =?UTF-8?q?K=C3=BCr=C5=9Fat=20Abayl=C4=B1?= <hello@kursatabayli.dev>,
 Radhey Kalra <radheykalra901@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: hp-wmi: Clamp PWM input before narrowing
Date: Tue, 27 Oct 2026 18:35:08 -0500
Message-ID: <20261027233512.211524-1-sim@shangen.org>
X-Mailer: git-send-email 2.56.0
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
X-Smtpcorp-Track: MxaDNltLsDH3.Di-WREiu8eQN.5qyptgVergP
Feedback-ID: 879706m:879706aL5FzMA:879706s8MPA8VqoV
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

The hwmon write callback receives the PWM value as a long, but pwm_to_rpm()
takes a u8. Out-of-range values therefore wrap before the helper can clamp
them to the supported range. For example, 256 becomes 0 and -1 becomes 255,
selecting the opposite end of the range instead of saturating the input.

Accept a long in pwm_to_rpm() so clamp_val() operates on the original value
before interpolation. Values in the valid 0..255 range are unchanged.

Fixes: 46be1453e6e6 ("platform/x86: hp-wmi: add manual fan control for Victus S models")
Signed-off-by: Shang En Sim <sim@shangen.org>
---
Verification: Standalone arithmetic boundary checks passed, and the
affected hp-wmi.o object built with W=1.

 drivers/platform/x86/hp/hp-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 52077833ac89..d66481a98c32 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -688,7 +688,7 @@ static inline u8 rpm_to_pwm(u8 rpm, struct hp_wmi_hwmon_priv *priv)
 				       clamp_val(rpm, 0, priv->max_rpm));
 }
 
-static inline u8 pwm_to_rpm(u8 pwm, struct hp_wmi_hwmon_priv *priv)
+static inline u8 pwm_to_rpm(long pwm, struct hp_wmi_hwmon_priv *priv)
 {
 	return fixp_linear_interpolate(0, 0, U8_MAX, priv->max_rpm,
 				       clamp_val(pwm, 0, U8_MAX));
-- 
2.56.0


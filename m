Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049887;
	b=CjHor1GKGtBPYwkvZDwfihyd5Swvp0751RIP7AbgHjs5ey/l6Exw+F5tvtxTgXhdDZB6
	 9Q1NGWuz9/IiDP4sUQu/SOeCvaxFAFbayWk/19IOu0NVnW4rWd5nL9eX28ngjVJ+EQuj4
	 SRa9uGo4Ho5ERfw9E2hVtOO6B2PurrQWNtYNfzs4LcRN2gs9dxSS7BXbvZJEoUmT0fEGx
	 i12+7QqgHdvHEHwCKxnLnBJqjYQfyYcGwx1dtIku/Squq7XWMF38vI7QfujUHPLf0YpOh
	 JWaukNT1riu+9Tb44WciR9m7fqmUlu2+XSL4vbaVdNf8N0oZWbtkBtR068lLIh6fOTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049887;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BwkbHjJ4mKegV1VLg0LQSGx/Az9TTLJATUcODgEo9yI=;
	b=v53qmLMZIJ1QP1b8CD9ZFnDQu0UrDvKfXhkG9ZxBBBygE1sMFcDrVUrTDoFOwzHpgp0H
	 4856WQMcYgTppbPZ2nH6NLbtpWAv3adbFuhROtPdoJuuaQw+MTzX2lNjldIttAm7Kyma7
	 Fl2lOwWwfWIKi/XeMxlXBNfLu1MfKJhjsVtmwY3k0PjQhLmdAYbDvsz2AW2fHSFep0Iaj
	 qCD1OKxPAGmrdZ7CDVxHWCgE+xKmvQ5EcBoAfqHCiGQR594+6mcWUWbE+q1Tehyy3Linr
	 phE8QKlv13Ifo3bxHfps/3AYstMGvMeuhamzB9H1VUwaxukqGFAHSfnHPtEDwVkERRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublbcDVg;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672AA606A32F
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 11:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672AA606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ublbcDVg
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36fe5944e9aso323055eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 03:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794049886; x=1794654686; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwkbHjJ4mKegV1VLg0LQSGx/Az9TTLJATUcODgEo9yI=;
        b=ublbcDVg2tEYPKewsQpukaBaBzxDJovRTOC2RkH9BuQJxOrpDI/XXMCm8+ctvS2Cp7
         Of3irGlYInwGu2Cs9tT1/Q8iwhv6fxQwNWKOj8NGKFv5BjA58iKT1r+XMG3Z8OdOdD+B
         jCiTEyc3lTVpMwROBDgG2Z91EbodPmy//A5vdE3G6pjwZW0dWy4qf1ChVZglKJk+hX/P
         vWkFhQowxAjbWR4vnUedm3QtiCu+t6sYrmX814ke/5r1034MUw7/0amZz36MiOo4bDy/
         90k1Ee1gytzEIQxVzj70rZZD0SA9sdLU82QYoNpFBYTMS8CAWxrsaoNTLmSQugdVu664
         OB4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794049886; x=1794654686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwkbHjJ4mKegV1VLg0LQSGx/Az9TTLJATUcODgEo9yI=;
        b=dCKHe+DaiejfRVMl7gSzH5Oo13naql09iviAzxN3r32Iw9GXUSEwYZSLSsp2+TgWcw
         37vI07oaCpPbrt5h9sdimvGAeRMkB5XYFDvAMcVrnJm0FNkMQF+Egb7Y3O100R/jTWbA
         5VN6pMhAsr/w8R6Sz1xhPU/15ahCRIKSZUPW2j0KLqRjwanUubbl4KkVNllwoFnFCRKW
         CTKAHXtBlX9AyGnKZ1feH5BA5i15Cf4Mhm4r2Qb0EHklpM0R3towC81SgKXe0NigCqaO
         KRO1Babdr30RxmMFygnjRxyji/2bx5SDljbS6FGXvchFpUIGFSPKBG7kWhQI3mKzOvmV
         bTig==
X-Forwarded-Encrypted: i=1; AL+hErHtDRDj4dl/NUJRhDw9aDPoXD08zu9+BSpEsYAgawGiKDVqiZRTbIIKm5w6foq2wB5DLVWYR+rkiTrK+Vs=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tunS7Yte1WNj8KI2BSrZLld1F7iKUmbJbNeL/xlQGWkVQ9fZ6
	o3MXP+UmkXOEv9jtEKICNY5beW74kAItDokPqCo9B0/QiXIjF47m16Ca
X-Gm-Gg: AYBFou3B+hk0Rdjzaq/pmb5BJlYHGqzEGVa1/XEw+zL3MKkQOD2hQOtB4F7vDpydyjo
	nTf32gILhtlxoykJqaSjxlIVhzNEabFgR7EjyC/xNyJyZGqEcg31oVmu5gAk36A345mJiHEmaCF
	Yknf4adYO3EWEH7dkhUF4xNol8zTUtLUO7m9K4Bt3o1YHWS3MjMpMdjGoAOZPLt1ux+F9671jFr
	LZFd14eUGhOb+R5BBmX30s08WxaGtuNPFnkLLxJn1VkcFvpP1kMsontjTFFXmMUs/RTbYfSierg
	813VsZMmrW0/6IOYqvsF//DMtod2//I4+A/KEofq9c+Vl3J2Yr0A5S7vReQfsj51nBsZ4M5NHkA
	VmE8Cx4VIXW07WZajxC5DD8VF3vFHIUb4w0XafqTKboxe0v6Z5MEyRaoPh2ehrV53h05KLb+LJM
	SYyEpsE0BXPAE9DAJKfS+N92GPHCAxpqIrVyaUWHR3czbq85z8rSEM1m299JheF7apaddMps3bf
	8EbQWoPsH7ct21/2x6tPsV8TKvuGcA1GkajHzUwr7kf3STEwVawfEnxsDxTp2vunrftAMjGtEHZ
	ij6v/psiAC+tyZI5jOZicpo+ziU+zhC9J+XRJG8TJED4K0emi3lj+Fa+L2i2MQ8BhBrJgijum4M
	V
X-Received: by 2002:a05:693c:26cc:b0:36a:3005:aa65 with SMTP id 5a478bee46e88-36f7611ec47mr6077505eec.15.1794049886246;
        Sat, 07 Nov 2026 03:11:26 -0800 (PST)
Received: from WIN-GDFRURIH76O ([45.198.20.201])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36faac86a96sm15105878eec.29.2026.11.07.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:11:25 -0800 (PST)
From: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
To: perex@perex.cz,
	tiwai@suse.com
Cc: Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ALSA: ump: clear stale RPN selector on NRPN change
Date: Sat,  7 Nov 2026 18:10:54 +0700
Message-ID: <20261107111056.667-1-alyandra5b@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
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

The legacy-to-UMP converter keeps separate RPN and NRPN selector
flags. When a stream changes selector type without sending data first,
both flags remain set and fill_rpn() gives RPN priority, so subsequent
NRPN data is emitted as RPN.

Clear the previous selector flag after flushing any pending parameter
data and before recording the newly selected parameter type.

Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
---
 sound/core/ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index 0a7972d91..b112064cb 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -378,6 +378,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 		switch (buf[1]) {
 		case UMP_CC_RPN_MSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->nrpn_set = 0;
 			cc->rpn_set = 1;
 			cc->cc_rpn_msb = buf[2];
 			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -385,6 +386,7 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			return ret;
 		case UMP_CC_RPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->nrpn_set = 0;
 			cc->rpn_set = 1;
 			cc->cc_rpn_lsb = buf[2];
 			if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -392,11 +394,13 @@ static int cvt_legacy_cmd_to_ump(struct ump_cvt_to_ump *cvt,
 			return ret;
 		case UMP_CC_NRPN_MSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_msb = buf[2];
 			return ret;
 		case UMP_CC_NRPN_LSB:
 			ret = fill_rpn(cc, midi2, true);
+			cc->rpn_set = 0;
 			cc->nrpn_set = 1;
 			cc->cc_nrpn_lsb = buf[2];
 			return ret;

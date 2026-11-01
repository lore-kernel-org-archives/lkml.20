Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793496380;
	b=Ooh4EchMcC/oYiY528L0i+nO7wNQJToqdFwGmdGnYLSVNV2w7KMU/jDjxHW5c0LICo5N
	 kamByWeN5hzPW+p3ESHHFKcgqyV4WUYOWdBOE72d8/TxqVX0fhyfN1yS2ETrcnfa4SdMb
	 ewisgKKljXgvepA+946Z6s499SCwwO0GywekvdVzejxaXZ015kkeDJUyvtLfNJE441YTl
	 Fql11S9vu2XdA1nPY+6l1RtBbn1sQ/ZCv8oTy8LEg4hCnoOGUwDhdcZlaa8bRNaFyDtrN
	 AgSdN1tjdIe2WhBBPGjgKxpEd8pnL3Pe5t/TnUUCDotb2/du0Uz8d/+ot+T8piCXn4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793496380;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=YIO/wuqnNRfPuoyQxCQ5Pvo+F5MRblOAdwgMq3xL4Lc=;
	b=W3Ru1L+7OwYYMIFkQmdhQLGrLTJaCi3Fg8LDjIi8gMvZlIWyPsy//Qq9WOxQIMC4Prcc
	 e5NMqEC+t0xJu4SERnQLm18Xhrqawre+tR3Dk+QTRsGsV+dEEX41x0H8bl3b83PAUWrcU
	 YfJuJYl6K+p84zFs1cETf5Y6Ma55qQCVPco2u8WA510pYG35HpKo7xyM2dlQEQN1KN/PF
	 658EZWh7XnPs1LVnZ1pvM/dCR8VVlqkHrKYA3xcG2awKSTuV6dKO6Wx6y2WWxjXBAkzDD
	 RHmAR5ZXu4taqLs6mNBPI2uAbAQE943iLcZIgMni5LPpvPhInQBhINweBx47U9kAQ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZdzdKzz;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB61606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 01:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB61606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZdzdKzz
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc81984fceso612979137.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793496379; x=1794101179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YIO/wuqnNRfPuoyQxCQ5Pvo+F5MRblOAdwgMq3xL4Lc=;
        b=NZdzdKzzFe070I/A4X0Fc37wFboISxd+dXeprLXL93hPsdzyrxnOaSYC/oKSwdpRBm
         lpn3m96r40JJqJzs89RLwlSccm9pWzFYp/Emofr0XL3WgAQ7UlSHV8dfA3KNYpWvX+lK
         wgkjgGR/8jfPobWkC/VnLPZHmkOS7JyCD9b6AoIPE87MXiquya17jytSlyBh0lS9Ii1z
         6eLpAa4nDORZ9DmL5U0qabmWsvJ8r2n242dLo565TSVzWBbaeWkXZ5M9gghEhvX8eIpS
         UsRLUsJh2hAj96GuQY74YSZnzPsQcWumuMikix9nioU3RlzSJdu7NLcjsL+Pz7CBOjdj
         7fEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793496379; x=1794101179;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YIO/wuqnNRfPuoyQxCQ5Pvo+F5MRblOAdwgMq3xL4Lc=;
        b=mNJaK40NBPby7ESMtlQ0DMe62sz08/xV1qmv5rVaXlLsXHTZNo07mr9gq+NT5CwQMD
         P0B+3+h9snTxjLvs4+dqOTczx+QR4J/Js0tv0eiU8PcZp3RxA+Qx00/21RW1nue8ni9I
         Ue5vklQ1R15KSj6c8hnG8m+0ybm7EGCym+ueqlzPKFA+9RPh43YrEJ53aOVixGjHi6iX
         s2vMGV3+EkieQ7vzhghfJ+j66YbqFGNMvV0HUx5FhLkwBgg2qHfmaCfiYelmMm+f28rD
         AYLlksmlYM8i8/B0kZiyV/I8Fwxnln81c3ADXx1ifgUWUaaGBR7EmhJBu2/80JByMHf4
         +I6w==
X-Forwarded-Encrypted: i=1; AKwUvBwp6wxBhfHhNBiVQU83jl9hwzYBGt7wWu3Ebnnmk6sRxxx1jelR8k7mrU0nEVfPxsr9jAlAbi3u+s4aGrU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH0sPxEQVpuOAq7nIzM5kryjGO4yd26o2Y/MxjUK/GXK3/Yr2O
	x50/lwc7fdO4CE5sbWDdhsWouP8awq61gPkMNBbzE860HlaoF6psvO5x
X-Gm-Gg: AYBFou0/piWzVq5VR+aq/GxPC9bs5m7mxkQimtZR7J7iPzcoDVmexbDPJYAUODArayl
	j/1+neC3pfRaSpVi6LIAVidqXKWA/OKpVU0+KuIVN9enf7RsGvjHb4Vt5Mi/njqUCN3PGfyzsDJ
	eIiReJ+ogU7bg2nshiyCkmeyLEGgt0arnkeZDDsw9JHA1vPQVVifD6VQhRm/af3xlVFOroz2sv2
	vg96ZeJH+w7outF415Oq1gpuf8j2Hvclz7RgESzNJAFjClr1n2x8tSjuGli511a1kNsaa7qhMfB
	UnnixVW7umsYwaNlAdzqmQ3y6cldNGMhicQESzR6uYf/Dowzop/nt45gKRrxEZ2dOwsAUd+iHdS
	ukp3QVXY/aIaOi4GRMELaICbH2QvSD1HB+LZB7Kailj1SYsg3pm0sL+TkwNgaiVDAjK96I7Ke6l
	EUsHEDkRrmtJzVN3jjVVkEaX1v6lsM5cPi5oCT7P1O8qJNg5jUQPgTBFW0uoVgneNBQOzBRlmTN
	+ObTP2T71HDBgeB4xGLLnWNUJ2CrjGXRaDaRd6Y6qaVp0RaxFl0qSeZgwqIVARPO1iheKl/4fzf
	mIIcP42kR5/Q//ynEv2wPK2rT6HnoHKKj5NNUUvW3LTC3F0M5UEnZQfNC5EXF5YfjHdJXXXABg=
	=
X-Received: by 2002:a05:6102:3309:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7d072636f57mr2626543137.6.1793496378542;
        Sat, 31 Oct 2026 18:26:18 -0700 (PDT)
Received: from nb-x1-03 ([181.120.144.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1c6sm7089367137.3.2026.10.31.18.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 18:26:18 -0700 (PDT)
Sender: Ciro Iriarte <ciro.iriarte@gmail.com>
From: Ciro Iriarte <ciro.iriarte+software@gmail.com>
To: "Martin K. Petersen" <mkp@kernel.org>
Cc: target-devel@vger.kernel.org, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: [PATCH] scsi: target: core: Parse APTPL res_type and res_scope as hex
Date: Sat, 31 Oct 2026 22:21:39 -0300
Message-ID: <ea903e6c-09b5-4a11-80e8-6e1387f39ef5@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

core_scsi3_update_aptpl_buf() saves the reservation holder's type and
scope to the APTPL metadata file as zero-padded hex ("res_type=%02x",
"res_scope=%02x"), but target_pr_res_aptpl_metadata_store() reads them
back with "%d" tokens and match_int(), which parse with base 0. A
leading zero selects octal, so match_token() parses only the "0" of
"res_type=08", the trailing "8" makes the token not match, and the field
is ignored as unknown. An Exclusive Access - All Registrants holder
(type 0x8) is left with type 0 and the write fails with -EINVAL and

  Illegal PR type: 0x00 for reservation holder

Userspace that restores APTPL state by writing the saved records back
to pr/res_aptpl_metadata (rtslib-fb does this when it recreates a
storage object) therefore loses every type 8 reservation across a
target restart, and with rtslib the storage object creation fails. The
other valid types (1, 3, 5, 6, 7) and scope 0 only work because their
octal and decimal values coincide.

Keep the on-disk format and parse both fields as hex. The valid type
and scope values have the same hex and decimal representation, so
records written in decimal by hand keep working.

Fixes: c66ac9db8d4a ("[SCSI] target: Add LIO target core v4.0.0-rc6")
Cc: stable@vger.kernel.org
Signed-off-by: Ciro Iriarte <ciro.iriarte+software@gmail.com>
---
 drivers/target/target_core_configfs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/target/target_core_configfs.c b/drivers/target/target_core_configfs.c
index 2b19a9560..a45bb3d56 100644
--- a/drivers/target/target_core_configfs.c
+++ b/drivers/target/target_core_configfs.c
@@ -2126,8 +2126,8 @@ static match_table_t tokens = {
 	{Opt_initiator_sid, "initiator_sid=%s"},
 	{Opt_sa_res_key, "sa_res_key=%s"},
 	{Opt_res_holder, "res_holder=%d"},
-	{Opt_res_type, "res_type=%d"},
-	{Opt_res_scope, "res_scope=%d"},
+	{Opt_res_type, "res_type=%x"},
+	{Opt_res_scope, "res_scope=%x"},
 	{Opt_res_all_tg_pt, "res_all_tg_pt=%d"},
 	{Opt_mapped_lun, "mapped_lun=%u"},
 	{Opt_target_fabric, "target_fabric=%s"},
@@ -2229,13 +2229,13 @@ static ssize_t target_pr_res_aptpl_metadata_store(struct config_item *item,
 			res_holder = arg;
 			break;
 		case Opt_res_type:
-			ret = match_int(args, &arg);
+			ret = match_hex(args, &arg);
 			if (ret)
 				goto out;
 			type = (u8)arg;
 			break;
 		case Opt_res_scope:
-			ret = match_int(args, &arg);
+			ret = match_hex(args, &arg);
 			if (ret)
 				goto out;
 			break;
-- 
2.55.0


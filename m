Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA78496D4E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 15:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791299997; cv=pass; b=AwYp7Qc66oqALhoNr3wvjSj8lMCSlL6O1us6voc1jN2tXu2L2fB0B58LGerZkt9JUaJtAx1JEIfB/A/MzIqcB8DLiLESa2clfJt7pXcK42VdaMatX/NihXwq2qe2yr18AENl3CmWz0ye+s6Npvy6SZuEbxpHF+Vj2V3JCYa5Vxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791299997; c=relaxed/simple;
	bh=D8NJyNcaXmiLOu/5xUDOc5pfb/vtlF83ItCriA4u71o=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FNrE0Oqi+/uROk/eXFKfoBbAyMWGVL41VH3zmyC9WkCx3UPRIldt3Fog14rgs27im/aV0oThr8UlZENUWFtFDR2WwknrFNww8DmTBX+nMzSaieYdLFMeKYBULfIzvL5sJ7oX9/cNzEx+Lijomv4JUUmWeVwV6opPYrg2u5v5FyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsh0v1l+; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsh0v1l+"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-917a64f28d0so10887986d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 08:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791299995; cv=none;
        d=google.com; s=arc-20260327;
        b=KnyXxIm/Ad50/rKkZ4Ye9Ry/XsYMV8gSR2hx7ARgOimxhehS2i10RlBBpaccePSQaL
         VYxELloMdhgBFeC+bjSdwbrLOeUHkx9IaExhQ1taofw4/T6spfgopWJqysmp1/+AzIF2
         cepmD6ghR0Y0CRzyLN8DkTBU2Z7tOO75OWnWWWKOMd5KgytczWXhEZSEYt5ihHJA5BnF
         wuAJePa1qustFKL0stNFNtBCPZqYwwm+pTky24Qc5Hco0cxQ04w0NOMANF82OytPojDn
         +3qi4Jg9F2gHGuk1ZM9iGbctpc2oRgMOXo0ZioNY7+lfbwfLjFrzNXYhOeAHWSwjh4+7
         6VgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=yFVV6rDqzkVe7MPT1P1wIPFYg4xEhPTH8XQEr8tqcT8=;
        fh=inwor+dFGOFzCGNqI5ZQvT4YDRk+sMVzapBArWE0J40=;
        b=MWPOCUsHPEzJZCDSXiLvJ3FQ/1i8JKRC2lOXb3SuQEBkTWcjkscT2lRn8h6lUUUkl3
         Na0cTWRTsc16b7Ww3Ip9rYQD/z12aq2cpIqSewatuud0/ljWXdgkgoevNxV38s0q9wvv
         0EcfDRXbDXCuBEbipKyFrcVgs8aa95zASQtGpevB6PQ3c1PGzpH9EIf4H7xjwYXzDajy
         OHmOdRrrGNDL91mI74RTlK1VZMy01RwjRvjtJ+5BHazOdzlKofjTR05+O6KDpmMegO/4
         s4bRW4YB4iRr+m710EcGqme5WbsirU1zN6M9pe/LItyD4rcOwKJnjB7SrSt5OAkRsgaR
         TV/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791299995; x=1791904795; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFVV6rDqzkVe7MPT1P1wIPFYg4xEhPTH8XQEr8tqcT8=;
        b=bsh0v1l+Gv6aC6hyZB40+jYYvnHpmXUXLiWf4JAHMNmK3ZWuWa9Ym0IX8Gq6vtDuRs
         yjgSjEG1rCp+dgEU8G8OP4FMbYDFaiU4/ubnfUZ/7AefysGLfVaYIqvsLVsGcsw+6TZm
         zRUem1nWB2W+zgaZfBUnMQz7E5SFOJDWyP4Xbl5etJzolOVBFMD4AaqORqDPYxCNW65+
         ZsEB5uwRvlOOZGsSBMTOWSLpB0Hz1sn1wJ2FLbnCTKjASOvQUkW+mwjNbGhO7rxcK1nH
         ta77erzEPm38lI0/13BFqPuCmS0gzCKreqFn1edhga+KvxmACIsX9b/R5iXqaK/YOx0V
         xuZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791299995; x=1791904795;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yFVV6rDqzkVe7MPT1P1wIPFYg4xEhPTH8XQEr8tqcT8=;
        b=exWr3Jv8+T3AHVpKVbUSxAA8dGT4ur9owCKOvQXDyQLEsa/GOIA4ghd5XHvhrd8yMF
         9lTjRTO78TMddXu73u8wZXGscCriz05yG7vmdbvFq1wavWNVaFOTmkHdK0AnGcgj5+qK
         3W6U7+zEec7dCtBX7LXjYot7AJANykvzAeTNIRKb/AYiVCuTbOsFSGFQFxMj05rrPAVc
         aqOPbwNYeY4Yl8AyioZZsVrbiW7b6GE45B7e3hS/x0kCP+FWkcnO+/21Hv+Bs+K5NGHT
         qi72aeRRlZWTWFcCVVHZouaTIVuzl212yPE7bYnkXEwqwWGepYBOycqSYtTmZ1x261Nf
         yTTQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWrck8HWAPylu209ImB/g/WD8g8Y9KPYhT/vY8bRLFzCkOZMY/8jJLlqdKfGbehXSeXGSNjFSJIgAWpRU=@vger.kernel.org
X-Gm-Message-State: AFuF++kOBecQN6z8lw/UaM8nAoWyl71QTZ7HNwlhZVVUspkr1HLSq8ph
	vrNO7HtDKFuzZh90pYStQ5SPtkEGCU/dxb//TcWG1L1/9zjWHhJSI00BjBT2F4AdxiKqrKD3tJ5
	afP0+vsBtAUPYkf29F3VSMtIyrW1MjxU=
X-Gm-Gg: AYBFou2uWSLA99op4MLxkmykdqdxglFuTA0GXxMmyfzPa0aVSVUU2kJ3JSNYNAKAYKI
	+5cYpf/XJ66m/Y+cTjiwEHJh7aDY8eOS1UEdzE5JVrv+++ulFeLl6H1YISf3Cqn1WXoUL5Cwbp8
	yZP4H4eMCqwu/mBE8ox4psA14Ou/b2Z0pDjP1aS/QRKPJkaxp4J6dISropaEmz74dV4uaMzCSFU
	CVe6S79qEwyzI7dFzhppb8MFowSLwpmktphNqwBJbsfkf0AZlmHx+3uf0boVc5UYyiegsCWDMhq
	gC9H3EqeGqCPv1vOQuMHqNcDL7O7bo1D6qlA1jw+M1XE8NOC4pgoB7vaRuBLE5A6OsSatxlPQx7
	RezU75uoloXZPlBj2pdpcaGFsMCYrbRdYQoMBjX4wzWNr5ouJabNE86zXfVtu8Awz84rs+R5CXu
	0TGvhAHkw0Yzvwe9ino2Cz/UxcWLCmfP5Kc1+LwK/N8kP9bprHzCfItwMW8m3sIDeeYKl1eNfNI
	Yo=
X-Received: by 2002:a05:622a:e49a:10b0:535:70b3:fa0a with SMTP id
 d75a77b69052e-53570b3fb28mr1387511cf.38.1791299994820; Tue, 06 Oct 2026
 08:19:54 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 6 Oct 2026 08:19:54 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 6 Oct 2026 08:19:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Tue, 6 Oct 2026 10:15:54 -0500
From: Ting-Han Hou <ue081723@gmail.com>
Date: Tue, 6 Oct 2026 08:19:54 -0700
X-Gm-Features: AclHuK9yqSdRAFzPsVeJO1Zn2ht02ZhprGx2lSC9pDzBb2P38sk3c0pSEMytM_o
Message-ID: <CA+NtrhQBK8uW32qO3dXxVxO1GSN-0EJfyJ16tnyx0o52T17WtQ@mail.gmail.com>
Subject: [PATCH] scripts/make_fit: Ignore schema checks when decomposing DTBs
To: Simon Glass <sjg@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With CHECK_DTBS enabled, Kbuild appends a schema validation command to
the fdtoverlay command saved in a composite DTB's .cmd file. When DTB
decomposition is requested, process_dtb() treats every word after -i as
an input file, including the semicolon and the validator arguments.
FIT generation then fails with FileNotFoundError while opening or
checking the size of those words as files.

Limit the input list to the fdtoverlay command before extracting its
arguments. This preserves the base DTB and overlay order and ignores
the subsequent schema validation command.

Fixes: 17c31aded9a1 ("scripts/make_fit: Support decomposing DTBs")
Assisted-by: LLM
Signed-off-by: Ting-Han Hou <ue081723@gmail.com>
---
Reproduced with DTBs and saved commands generated by the current Kbuild
rules. Verified uncompressed and gzip FIT payloads, shared-base reuse,
and the non-decomposed mode. The schema checker was a success-only
stub; no hardware boot tests were run.

 scripts/make_fit.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 15ba269..9bd35aa 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -292,7 +292,8 @@ def process_dtb(fname, args):

         if 'scripts/dtc/fdtoverlay' in cmd:
             # This depends on the structure of the composite DTB command
-            files = cmd.split()
+            # Ignore any subsequent commands, such as schema validation
+            files = cmd.split(';', 1)[0].split()
             files = files[files.index('-i') + 1:]
         else:
             files = [fname]

base-commit: 69f80fef3153299d9c72c53d1d71eef6354b6926
-- 
2.52.0.windows.1

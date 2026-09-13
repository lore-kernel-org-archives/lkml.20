Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B865313267
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789311285; cv=pass; b=b1OwuNZ4yeWXF0gLBsAAwhfIfl5f8roqf6F33VaOLnlJnjJ0CdkehG1hZCWmPOL9fLHxI64sos7J3YgbOKmIVwS/02uYbojGVRyCxr2pK/L1OY3F91GLLYxqAk8At8cL69vIUA0jf/J/XIB5jgNr/c5U8fdmLdV7Krsu3IKIFlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789311285; c=relaxed/simple;
	bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=BIZ+3EH10n8VRL44SjlWfTmumQykH5T/9DU0bDhLjef+VDPN7Bih1HS82Y3MjlUttX/SNa68GURYOPH/hjSrzyfTcuk5CR8VWW8i0/p4iS+cGjnh0nuyyHEybvr8iSnNh8ndhq9av02txFwuicaECPwD2W/nmo3lCeFI2/WlBlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4PHrWlh; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4PHrWlh"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aae3147so1036452d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 07:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789311283; cv=none;
        d=google.com; s=arc-20260327;
        b=FTTTvNfUVsK3526mXwUO5i81dWfklWfCEa/5EMM8mdSAcZMxp5QpRc1rlzjLWdQ83l
         tVTGgO5g8fhKpRB5hKZRPKY6wZxMKcC3qCAvnFGfXO4FQJuFX/LbcZycmPryPH9ybquY
         pCQfFZ0GXws3/ZCR6FxmKZUFlVt8RDUqUWhUKy5zNh5iknNK+I2KSKnfhOZNpRtOngQQ
         MRfxowPXO27GOG5dn5eppRE1Nwfl+1Mj7WxLTePRH0j2fxBzxtXhkKEsjni76OvY2Unb
         M7Ymg5lMAjKBuqpfkhpKzjX8jkvNm9Dlb2r/tNrYQHYswdrJSWLwXpQfjuNHrUADAXWv
         BwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
        fh=bGDyFbenFl8ysnVcfoe/zRfw1z/mrmFhg+77saIR20k=;
        b=FcvKRygdwfsTAyA5zlHrCryO0y7kuUbM4RimRbhNZ94NzNPcB4qVmLWpqsEezpuYxB
         5WgSmtf69qJExmQV9Vz1ncep8T3+8GqHjZF4/79kKpiROOyPLC/aexnwPxDCayDDGXXq
         Y44Bl31Kr0oZC+yfhf7BLqGf1wKjDGmOY2s8p3o0E72N/uvf7EZPKCS/53s7sI3RdzmO
         hf6lVBgz82bS5rpj1wJSoB2MnWutQ4W6GnShqKJyz6j504bUj4UdzZaReQu+wcxkstcZ
         LbcO1B7H8RfZNkVJyXM1bsY2dUfO6gZ96VRiy3UqVsT47vx+oG5OU68ZO2JJjyVmXHU2
         u1Yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789311283; x=1789916083; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
        b=K4PHrWlhphlBHTSYC3JNDORbI13NPBrcIUL6wsvCvQKjIhq+cDZra862eT1MVH4BDn
         CkyHn+XH4isJGpKfGDhYp9FsDgrBfcsxngQUm1WKPrg+eM/TR7LkRW8/pOuwQvNMnneK
         Q9q3w2Y1XqtQevwMjCtGE3clFRVgCioqUyrI16rE6NnBqXKc1r2f4uFmCeWUYoYd491a
         J2xKk67TDtNLnn/zMTJRk4jDWUF8y7TgBLUDGBqr16MhMUDdTjfMb0Z9DWJf9pYno4Nl
         shk7Y7gDqHLWWHHw7Tyc3c+SE1W4zdLjwBiYIUVFYxro+4E9UqT3k2e2353+nbnURQQ4
         RG6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789311283; x=1789916083;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5o+exoV/LDdiHzW9lCUaclIoJhNHlTzMl+ffFgN8f6k=;
        b=QctHG+1G3a0yEdjjN7Tbn4vN2EJY5F5lM6VabCMFrtS8i+TPd5yn4ofrmN/FlOVD52
         rpr8VmOjHJtTDx3qfgI11T4IiemUbzE5roAs6XQtOinVIkMjMfW2TMqpQFismSuEMEft
         tBpM3tIEC7Zdsuic9Fia8zC10EShCraaqZXvZjwnEKiirYn/bjpOaTi/3vey30RswyZX
         dSVs6BfRK2nfcvps4Psk7Ke7p9bXIecAN9hrNH/DbrMs2kfReKUD5OV8Ne7I+rF4OIqu
         EGak7XEfkup3GFRXBANraTv8fDMkYSL7GI0j2IWb/PfeCpKfBdpA6Z+2wJPiRvy+c6Ym
         mwoA==
X-Forwarded-Encrypted: i=1; AKwUvBzGx8CprJRhsABvLmE2Un5LITeYd7IIHRooDCrcsen88h29Hdly6dqHCra+2fZsf7fM/ACaibKZjIZTuak=@vger.kernel.org
X-Gm-Message-State: AFuF++nyGXrNS8PRuR1QBybp9GF4en/q63IlHtRLaJQMaCryXcEwD9jl
	ioiPiEDEcUToW2djTpAnEUOTiYAXkposNwdc6qDmg61u+RMRIdt2YanjngVSTlfXTVATbH7FAit
	SA04a5EgBA6Q9jrqC0IjlOUbq5OURUKI=
X-Gm-Gg: AYBFou0qXYx2gh8WEwTYNV2jEkOAM2J6Y7LvaZ4f0EW6o/jFlSsnXvqqZYNdFgr0AdO
	SOLvEJRjEmyjfUo6oCZ0s6sboKVzmnJIWsAIePXpyJdMwV4hkG20fCw2Q0dw4RIiDUuNQmtYLSt
	vLXNYjwFB7qyYGWQPtMPrzxOlv2ZpdoPF0Hxa0Vm+tifd69pU2PSQvn6w6IlL/v3y7mQGQVCAMK
	bNcFSb+N3QEB7RJ/su8/T9d8clEPHgo/tgnFPy0cb3LJIIKpuNTccfduGEC0q+yQf3tEcJJNOmd
	H3tyzdx6tFlBydgZjlrG84M1jUGfyMLorC2eK57b6KMlLu8uU+nUqNdA
X-Received: by 2002:a53:b989:0:b0:671:22e5:ec1c with SMTP id
 956f58d0204a3-67124775701mr3936368d50.46.1789311283066; Sun, 13 Sep 2026
 07:54:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Im7CK <computergod47@gmail.com>
Date: Sun, 13 Sep 2026 20:24:32 +0530
X-Gm-Features: AcwNN1X5XdRy-zyfSEKG5z0aU46Jb-e2EgTxUnKIdnK8A5TQjvj2H_0q-nZHpBA
Message-ID: <CACgbi99eSJRx-q5yZR3cMheDaDxKKpExg_fkzapbM8B9YuSh6Q@mail.gmail.com>
Subject: [PATCH] kbuild: fix grammar in output Makefile .gitignore generation comment
To: linux-kbuild@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Fixed grammar in the comment describing the generation of the output
Makefile and .gitignore file.

Signed-off-by: Mebecool1 <computergod47@gmail.com>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 66654fa71..13236b460 100644
--- a/Makefile
+++ b/Makefile
@@ -681,8 +681,8 @@ ifdef building_out_of_srctree
 # outputmakefile generates a Makefile in the output directory, if using a
 # separate output directory. This allows convenient use of make in the
 # output directory.
-# At the same time when output Makefile generated, generate .gitignore to
-# ignore whole output directory
+# At the same time as the output Makefile is generated, generate .gitignore to
+# ignore the whole output directory.

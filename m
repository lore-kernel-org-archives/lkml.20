Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063765;
	b=swgTuf45OoFQ2NVA33k6unsBw7PVeoj3P+Yoa/l0XtuYQ4ciON0MYtpSy4vsigbEfFs/
	 m1S5nFiUTPt8OUp4Eia8ZtMS7VibW06YyftpRLUY9q4LO0cP8yR2Tsy+5640kwW300y+V
	 xF7bC3gPwWZfdvdULEezbN4kPx3i4DCnns+3I03jyelgTjOFGxlAJt8IlCm5g3uInT6KJ
	 r2YaBNgWAfFkw+/C/9zKL6AqGk7uF/3FCdzRmOa/jVLkxOOs1KF+efF2CkLu0Fbb450Q3
	 YgilV2bPJO/e+f0v2EY2h1XoiSo/IIvYeOmQ5wTGpF6yoJOY9uPY2uyNRnknUX0ZGvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-B4-Tracking:
	 X-Change-Id:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=2zB8oT3vAlhmw/RfQ7UUbXIgxoE0OWjR6BJ2E2Tm6xY=;
	b=nPDWiPJCNDCNxiaowsnVCsuCwi3/553NiBj7PrdA1fdkruUhYPTzRmb0eF+4NnWWf7Bp
	 ZC58CNq8yC9by1X/0TxZlwrFlQTWD0Z+pn0mxdhgbGeDARECbKfUJrLc4SVx6Xo4+C6iw
	 s9qZ++fRmgl7+1UAsGljhIAxenno8YGVc3hEkeNAiXBDbukNC32O26mSnNrfYl4JLURyB
	 pTEPYtVx2bnfW2d95raTIIvxdx2p0CL7yZ1qdnR2dnC7Q9eF0++6WsVSNWL5Bj/fKmuD0
	 m1G1gyV2FAk+JcY5evXWbQzQqbYSYoTpKEJkP5XoNCHs36KjvHvtVrSWzIivHTAwn8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iW6Itpo1;
	arc=none smtp.remote-ip=209.85.218.71
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564A86083638
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 15:02:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 564A86083638
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iW6Itpo1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c3f04e0e481so29503066b.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 07:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794063764; x=1794668564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2zB8oT3vAlhmw/RfQ7UUbXIgxoE0OWjR6BJ2E2Tm6xY=;
        b=iW6Itpo1jD69+l8iuDQrgKFwiSVgqol4rixw0igP9QasxeJH9+/BSEg9VkrvxQau0Z
         ahUVqG5MHWWMXC/ysuH8Pz1gFZ6YpBKbrCLAfu5Ylc/QiavEkKuDPDsk2i3sVcAqzX1k
         braGnhjYRXYit0gDwKzDxcXMuap383InSTdgF5W7Jc9qRS7Mz4rcIWEFgYJBXUYBdcA6
         uXMkNioD4PCxntSxKPdumlY05J8diLoEy2rR4StZ+FKbVF26Feltkrgt0y1agNiM67UR
         tIxkfPJ+M5BHXZ5mFX2E7tc6tGTBjy0aorCFaXdchIonIyUuqpwtA7hbfglXMoHCtD0g
         uR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063764; x=1794668564;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2zB8oT3vAlhmw/RfQ7UUbXIgxoE0OWjR6BJ2E2Tm6xY=;
        b=T/wCeW8N2Hydn+mIFxgiVR1PMFyCdHE/XZMObdv043TwNgyVQ5nXcpoqBcFOJZpNdY
         KjJYWkj6g1rtzzTlnCD+w0DURL8cAI5bZKrSvZ76fqN8CfC3tQgYtRdlzbdlDjJkpI+O
         2prJaTMFYFsawrgd2iBEjdoHbkungZsrVgAjcRpCmRU/nfPqzr1vv4jroM7BAn4ULcRW
         XPkvYVafyBGfOO2Bc+UC8m4euWL6XZNEehLqLjGAiYINtZGiXLnbFVnWvvqqMy5ca/1V
         7k+K1j7SDRtUgQ3JP240lRRBPfT8RbE6Jh9cqIYSHTSXB8gBzzhgSw/FlWUkBezycDvp
         oshA==
X-Gm-Message-State: APuU4Z8P1oMmSCmTO1+v7jTkU/IZba3wEJ9R3i3Syx+ZBjgXemiUHtod
	c8D1UQfln1ia98ZGChBQTeSEL4MU7u7KL3tfS78a5K13q1Po5/ouATVbEsLZfvAQmFSMeOK7X8u
	49A==
X-Received: from ejdbc12.prod.google.com ([2002:a17:906:8f8c:b0:c3f:efc4:a116])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c0a:b0:c33:dbe8:291c
 with SMTP id a640c23a62f3a-c4d35448ab9mr510217366b.20.1794063763383; Sat, 07
 Nov 2026 07:02:43 -0800 (PST)
Date: Sat, 07 Nov 2026 16:02:36 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIs972oC/yWMWwqAIBAArxL7naBCz6tEhG1rLkWFRgTS3ZP6m
 4FhIgTyTAHaLIKniwPvWxKVZ4DObDMJnpKDlrpUSlYCHeFymBOdsLzSkNANfxqEwUZLrIsRK4K 0ODxZvr991z/PC6k5+81uAAAA
X-Change-Id: 20261107-checkpatch-file_path_changes-ac920c85bc7e
X-Mailer: b4 0.14.3
Message-ID: <20261107-checkpatch-file_path_changes-v1-1-8b11814560d8@google.com>
Subject: [PATCH] checkpatch: Fix bad FILE_PATH_CHANGES on headers
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The FILE_PATH_CHANGES warning ("added, moved or deleted file(s), does
MAINTAINERS need updating?") added by commit 13f1937ef339 ("checkpatch:
emit a warning on file add/move/delete") was guarded by !$in_commit_log
so that commit message lines would not be mistaken for diffstat or diff
header lines.

However, it was still evaluated on the initial email header lines
($in_header_lines =3D=3D 1) such that a title using the rename notation e.g=
.

    Subject: [PATCH] foo: rework bar_{get=3D>set}_baz()

triggers a false-positive warning. Furthermore, that same (wrong) code
path sets $is_patch prematurely.

Instead, only test for FILE_PATH_CHANGES when !$in_header_lines.

Fixes: 13f1937ef339 ("checkpatch: emit a warning on file add/move/delete")
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f720191..03e3e4b72cdd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3481,7 +3481,7 @@ sub process {
 		}
=20
 # Check for added, moved or deleted files
-		if (!$reported_maintainer_file && !$in_commit_log &&
+		if (!$reported_maintainer_file && !$in_commit_log && !$in_header_lines &=
&
 		    ($line =3D~ /^(?:new|deleted) file mode\s*\d+\s*$/ ||
 		     $line =3D~ /^rename (?:from|to) [\w\/\.\-]+\s*$/ ||
 		     ($line =3D~ /\{\s*([\w\/\.\-]*)\s*\=3D\>\s*([\w\/\.\-]*)\s*\}/ &&

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-checkpatch-file_path_changes-ac920c85bc7e

Best regards,
--=20
Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>


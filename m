Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794063446;
	b=pxzl6Uvr7b7MmIWkPTg0551ypu3gE6DH5BXKEIYgxSixOLInAhD3cqbl1exK1aMMJ0l0
	 wT+ZzXEcQ0NdaoDHzWRsW3/tEVQv+2/RM9eSPGIsKJNoP88p2lQkutYgxrR+HP3qWrvpY
	 qeLgn8HiduSYHejwUw16Yd488i/9xXugd/7Y/uBCvczGv2ESwnKAZiEGrpa9cNnVSTT2M
	 tsC8HTqzcR8MAgOvzPK1NELbzA3k9uiEVK8FVr0vMtO+RUAJelL6pBvR9upxcrA4isqu6
	 g6RRcwlQ4XYE2DJzS27/7cHIWo0sA56fdeQzcuSoxh6W7q50ZqTKK3tKFWR++Ihn9KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794063446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-B4-Tracking:
	 X-Change-Id:X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=ov13PIbIfHR1mTz2tF9sGrKO4J57ojCKP34IMFXX7s4=;
	b=Ce5GSqYpGBifrXIKestB2u2j4F5odlGvUZy27h4QQfBJydY34NXzIiscgxbwQS8Wni5/
	 kuIqIzsNWkyeGL4WDaFN89GR29p2jRb12faQgk5/fx26ZeyudfP8733paH5XiTfv7H407
	 2qOJ3jnRfai3p2G++1pgANkLtSQAOsb55Odg0yVD6QvLATVX44Kkei4XV3I6w0BkM27Su
	 AqJZPZVe3IZbw/3+CtxKnx2sufvS3PZBJBsgGZMg0THRZCa4dZl9hDImuXgHlhm+5QDol
	 McguVmpU2nu3qspUcJd6OM54YqsxTTMukaLveJDO+NinOBZfxECB9qB6YCpMSg1xXQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IyyzqkFR;
	arc=none smtp.remote-ip=209.85.218.72
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAC960A2621
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCAC960A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ptosi.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IyyzqkFR
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c414c206673so170706066b.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794063444; x=1794668244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ov13PIbIfHR1mTz2tF9sGrKO4J57ojCKP34IMFXX7s4=;
        b=IyyzqkFRtTFWu0C8R17A9dEkQ6V/lFKoX1u7MjrznML0VDFG0sB1IN3Zk6EfcLkSUT
         7JLcJACOqT1LXZ4ZHgwH8B5iVLmGz0t1WbIx322o476iKHIPVOaEpNUU8ykXjOoI91lh
         uxM8JKEBdLQ1GI44KD9GGoo4dz7wpaldfiItPpP7hR7YqqBwJcWrRFbFiydRlf7izXgf
         b/FRe4PtOcDijhYOLx/NVnvlV/jC2r9R+2gHM11TVanBFmV12ileY2PQhzy4VKiqGxL5
         4waq61dxgWQ9GXEhtU5H28RbSabx2fJxyyMvtA0Ue4EcowDviAGABh/5CRG0EZKFn17d
         bhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794063444; x=1794668244;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:mime-version:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ov13PIbIfHR1mTz2tF9sGrKO4J57ojCKP34IMFXX7s4=;
        b=miZaDKeIMittIhxaR26/UtT32KIjwkRt9ZPVj2jSW6wPXyxirk75zz7/yJhfynY3FI
         uCQN72nBzzPr/GM6PMcpkpJBNwYkilIQnZgXztt/JoEl4hYa+sfQlkmz/zaXimfgB8R9
         LzIYGlSpjyhaod2/7wJUnVB3/q6NcMwX+4KpUfcXvWPx3WL+BQLzXd7vCveM87KetI3r
         OSbFbbEUQhspOCn+jcWm+tmlh0hQBjuwtOUUSt7wzeMYR6MLnklmxI6vyd6QA6Ra/txx
         xTKJZK9dwzktcQwRc1iZHjTH5FKwhRJuJiKjQwhlHXgzrFQMHGcSg9Vy+Hls5Rj/Vnhs
         NrMg==
X-Gm-Message-State: APuU4Z8u61fxWxtGg93yGWMKqWyp2VM7oxoO+buIwVp7HafwePd9feuW
	M41EOSC5DfhlHseocFGhCETKI4hI3CFSnfDDmE0Kteq8jTNYTPy69MjZA3umkqeqGdw5PMB+L4B
	bEA==
X-Received: from ejqf21.prod.google.com ([2002:a17:906:5615:b0:c3e:e67:7058])
 (user=ptosi job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:ee8b:b0:c4c:eb16:b567
 with SMTP id a640c23a62f3a-c4d34c91f8cmr419015066b.19.1794063443895; Sat, 07
 Nov 2026 06:57:23 -0800 (PST)
Date: Sat, 07 Nov 2026 15:57:02 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD0872oC/x3MQQrCMBAF0KuUWTvQBGKLVxGRYfo1g6YJiUih9
 O4Gl2/zdmqohkaXYaeKrzXLa4c7DaRR1ifYlm7yoz87N06sEfoq8tHI0hJrTuWN7Z5Ea+YpALM LiwQ/Uy9KxcO2f3+9HccPJ1l1A24AAAA=
X-Change-Id: 20261107-checkpatch-asm-complex_macro-75ee815da528
X-Mailer: b4 0.14.3
Message-ID: <20261107-checkpatch-asm-complex_macro-v1-1-9a7b3c69fc28@google.com>
Subject: [PATCH] checkpatch: Fix bad COMPLEX_MACRO on asm volatile
From: "=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Pierre-Cl=C3=A9ment_Tosi?=" <ptosi@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Commit 42e152931deb ("checkpatch: exclude asm volatile from complex macro
check") added a substitution converting "asm volatile" into "asm_volatile"
so that macros expanding to an asm volatile statement would be treated like
a single function call and excluded from the COMPLEX_MACRO error ("Macros
with complex values should be enclosed in parentheses").

However, that substitution was placed after the loop that flattens
parenthesized expressions into "1u" (originally "1"). For a macro without
whitespace between "volatile" and "(", such as:

    #define foo(x) asm volatile("..." : : "r" (x))

flattening the parenthesized argument list first turns the statement into
"asm volatile1u". Because "1u" starts with a word character, the trailing
word boundary (\b) in /\b_*asm_*\s+_*volatile_*\b/ no longer matches after
"volatile", leaving the space between "asm" and "volatile1u" intact and
causing the macro to still fail the single-lvalue check and trigger a
false-positive COMPLEX_MACRO error.

Move the "asm volatile" to "asm_volatile" substitution before the
parenthesis-flattening loop so that "asm volatile(...)" is first rewritten
to "asm_volatile(...)" and then flattened to "asm_volatile1u" as intended.

Fixes: 42e152931deb ("checkpatch: exclude asm volatile from complex macro c=
heck")
Signed-off-by: Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f720191..5319a8ecec50 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6050,6 +6050,9 @@ sub process {
 			$dstat =3D~ s/^\s*//s;
 			$dstat =3D~ s/\s*$//s;
=20
+			# Make asm volatile uses seem like a generic function
+			$dstat =3D~ s/\b_*asm_*\s+_*volatile_*\b/asm_volatile/g;
+
 			# Flatten any parentheses and braces
 			while ($dstat =3D~ s/\([^\(\)]*\)/1u/ ||
 			       $dstat =3D~ s/\{[^\{\}]*\}/1u/ ||
@@ -6063,9 +6066,6 @@ sub process {
 			{
 			}
=20
-			# Make asm volatile uses seem like a generic function
-			$dstat =3D~ s/\b_*asm_*\s+_*volatile_*\b/asm_volatile/g;
-
 			my $exceptions =3D qr{
 				$Declare|
 				# named exceptions

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-checkpatch-asm-complex_macro-75ee815da528

Best regards,
--=20
Pierre-Cl=C3=A9ment Tosi <ptosi@google.com>


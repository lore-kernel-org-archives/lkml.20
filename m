Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793800415;
	b=2ccGEIyunet14Rz3vG80IohTE6+GNwkUBKULSOqdXIxoj9CJCpgpCcF6dUYyHVLJuoO+
	 j0wKbmbSJJQOtVyygDMPp7CeMHRgn0822BS1mrDsKQh4H/f2PDB0KK3rSw3gjJYY2moTO
	 7mYk/wqh2E++Q1u9cWxDsjpwEzZI/x0NzbZL8x5uBMSeo0tJmiRwCakiyy8cQEAHn5IgO
	 OhRuM93B3hp5tB+O2CRUFfhKG/1/AdieQXsTi2IvCz9AzjHSgzji7pnN0bX0mHi3yA6Kg
	 Np7hBJdkT+3hy6jL45iENVwGdSjVUEDlHhvXNzKAkqlpGdC5t3zJRYWi075/wiK/XKA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800415;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yRAKHVjLh+7Utu7fT2dFkx4zz6rfL88F1uzkNC+J7/U=;
	b=Kak4iW1gUzCQp92qiClyi/uMQL+jml4DiRQBObW4bD3GIdSqIhdAwNXB0IWrCOzwuWhR
	 N2Fb0ESG6CtI2Qmesk9CDqYL+/3RV9P6GJRhIWQmOZFWg5Y8T+6fbvV830coq/uULIFkT
	 KG59uJy7DgDwPUNznzB1SlErGFwnrJmvfVtBlCg4Mx44+0DckWV6iD2IvB2SOqPZa4yFb
	 1sgbp8HcrYgrYZYWvgfleBLBThurgAVEedwmNkFRBWDKHotsauxVF4TYD8PHsF2AFHgZZ
	 AHVUrzP94UeowwhaUjIyJRcsvXdjgIntNKkLyVHz0qeWNQtNXEP6NyWHP5huztucHBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TonCEqDP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883C0606A326;
	Wed,  4 Nov 2026 13:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TonCEqDP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793800415;
	b=DSQXybcWGnmeACw/ZuZjPfJIwHX+MTjr4FIZ/8qAJWfvU/wbRnNVdM9NuEtbLKnEFWp3
	 o9AMxyOPBI/fTsGdXploCPd4DtPN2iiJR1OwAozYOn+KsvsYPOHZ7oz5/WQbAK5vwhlhD
	 hAuyaur7/5w3pw3D726kKreFR0c0h4eHSUNbsPpq6k0LbSnm5yxGxG5DIjVPTHXU/vQJu
	 8Wwkzbr9ETlBoMugw4bonGAUfwTCG1VMS7z8CE4ojvuZjycZBygxEluoNiavFnxAPuUXE
	 mRvaVnpSMpuBNJSEDpyTVHGx1j0+M+4gkeWGaY2eBabfOdDDtLldHC2tXbgTOf9dJKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793800415;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yRAKHVjLh+7Utu7fT2dFkx4zz6rfL88F1uzkNC+J7/U=;
	b=oHknAFTfCJf8RpdUDnQBNy1+S3BwcGwKW3cWcWkJZoFlZf6Od5/aIgjXNqB/V3W7XDcg
	 dfMXYj/97gTnkFizNbhMQFW6IiVVVjLsSqfNNhgsHRf++RrdZSxmefumkZ0KTwBTmlCzk
	 BjgsWzBl8swHOkhDUFNxa9aSbw1Mk2wbbZZL0rEG6bP+y/zq37hAgQvfSDEdcOlZ0uNS8
	 a9MavVlY1jAqkc5ZmhDpPdjGwieQTXsSAfWkraQiJ2CwkrQBgvfCmGAAvL7qNgOcGOlBu
	 82JQ9A4C9N++vbwR1Eokya4RpPlCaC+/E164sZHo6ALhcXI0ca3DYgFgyyqBcE0YEYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DEB281F000C1;
	Wed,  4 Nov 2026 13:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800415;
	bh=yRAKHVjLh+7Utu7fT2dFkx4zz6rfL88F1uzkNC+J7/U=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TonCEqDPmsUqccyZJ71uiszINeRE1APr48y2YGjPQQDhtn/dO2hdxU8kNMU0UgHvq
	 ECGtewPcriNyshzE5lAhOx/bjNyYv4ZiC8arDu8gtHKCxVteEDTgz0CMUFjkUcH0Wg
	 6WduuGiBMIWKWX6b7N6BMffufHzh0wCgCt6a27tUlrCXIzi9+KA3sqcW4DLBTYCGHy
	 hXoQ8mb7z7ztesmo0szZnC8BC3X/UyG/TjfpxMr2gACP0KiLfLw33p/m6do8zXwLTA
	 PgJc9zaSyLmXfh+t9k5g2YBd+OFVsK/fTiHs2XjIcHoypmvOZt2caGZuTshOJ3yz0P
	 gdFJNwii0g1jA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 35BCF46E54;
	Wed,  4 Nov 2026 13:53:34 +0000 (UTC)
From: AleSZLucero via B4 Relay <devnull+aleszlucero.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 07:53:29 -0600
Subject: [PATCH] doc: process: clarify scope of applying-patches as legacy
 reference
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261104-doc-patch-fix-v1-1-617cb9f4cd47@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkHFgvpKdDDdci8qGhGIf086z
 sBMhUKZqcA6VMj0cOEYOshxAOtNuAjZdQYl1Cyl0OiixWRu6/HkF4XSkg6iRU0aepMydf3/tr2
 1D2sqEiRfAAAA
X-Change-ID: 20261104-doc-patch-fix-0241ebee9254
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, AleSZLucero <aleszlucero@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793800413; l=2000;
 i=aleszlucero@gmail.com; s=20261104; h=from:subject:message-id;
 bh=6D7WcOq0h4YcM4Z4K2LccHCGleOSZiNJjyl0B7SS6fs=;
 b=NAaFqc7c38Fl8v4KPRiEc7EEuhMVfWxXk7IRJiaZPfgi/+WI/NbrbrsMzUxEx3/MolYjrwp4X
 Nq5d0DITiXTBVktkAEHKKyNP63JBcyzymU5kGdUviMGqp4Kp3SHfWz2
X-Developer-Key: i=aleszlucero@gmail.com; a=ed25519;
 pk=zRzEBMID7l1FXqr2CjfnlIn++3m3N05FuNYb5zPA3cw=
X-Endpoint-Received: by B4 Relay for aleszlucero@gmail.com/20261104 with
 auth_id=1410
X-Original-From: AleSZLucero <aleszlucero@gmail.com>
Reply-To: aleszlucero@gmail.com
Content-Transfer-Encoding: 7bit

From: AleSZLucero <aleszlucero@gmail.com>

The applying-patches.rst document describes the manual manipulation of
source trees using the traditional 'patch' and 'diff' utilities. While
technically accurate for non-Git or constrained environments, it can
create friction for new contributors seeking the primary Git-based
workflows.

Update the opening note to explicitly state that this document serves
as a reference for legacy or constrained workflows. Provide direct
cross-references to submitting-patches.rst and howto.rst to steer
contributors toward the standard Git infrastructure.

Signed-off-by: AleSZLucero <aleszlucero@gmail.com>
---
 Documentation/process/applying-patches.rst | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/applying-patches.rst b/Documentation/process/applying-patches.rst
index c269f5e1a0a3..74af6d8a2249 100644
--- a/Documentation/process/applying-patches.rst
+++ b/Documentation/process/applying-patches.rst
@@ -8,8 +8,15 @@ Original by:
 
 .. note::
 
-   This document is obsolete.  In most cases, rather than using ``patch``
-   manually, you'll almost certainly want to look at using Git instead.
+   This document focuses on the legacy method of manually manipulating source
+   trees using the traditional ``patch`` and ``diff`` utilities.
+
+   For the standard Git-based workflow used in current development, including
+   how to format, apply, and send patches via Git, please refer to
+   :ref:`submitting_patches` and :ref:`howto`.
+
+   The information below is maintained as a reference for constrained
+   environments or legacy workflows where Git infrastructure is unavailable.
 
 A frequently asked question on the Linux Kernel Mailing List is how to apply
 a patch to the kernel or, more specifically, what base kernel a patch for

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261104-doc-patch-fix-0241ebee9254

Best regards,
-- 
AleSZLucero <aleszlucero@gmail.com>



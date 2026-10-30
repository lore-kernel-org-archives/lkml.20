Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359776;
	b=S/j+jbmZrm16oPIIrLJiPAMnCImMfZV1ve1oIuDSj6Qm2VwNbnMssNt30xcuUJ8j0vgN
	 xitG7j0q0WSRC3RX0MhBeKu3i4Xy/sAmQk9ASHyCuzdGka8R8jGorQNCV5crjbs1KgN4o
	 ihBsywczeJ3iY5ZQuJUSzLhc+KYONBzOCshyvxWArkFf4v4OS7JcvOA0tvv9442fOK+Vg
	 NcNJcHUPvB93l/Ihe6s8d1OR20mVJqlA7HMVLeFegWqEukXychJtLTYwwFrrWCLlsqsMj
	 4LhKugQq+sX3EwOa08WsozEeg8myy4VY8gIPJxGK7DQiIb+uEFKjT6UHRDll6jzjgiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=k+4d3YeUVXdsSSuX0GC4pWzZJQi/FeecQ3AMlBUJ4B4=;
	b=MRZmssZfRSh0yGzkSqkmf9PEi5/yw3ecKNoDEjQCCmv1UZ/shsf9Q4/JWaP5KpFv5hn2
	 CsT4cdrh85ertCw4qYSDk7i9I9sbiWp7gZqKKCA9mnIcGGZmHOW0tfIhaZ8kIIBDB98hx
	 WfKXNjPXUb6DxsAcooc42cj2NRdFwG1X6G0F+IRZll+xlJCeB1+Z2jK7vKO5qT6il2vTF
	 i5SEVggnpRw7SYACp91dkSlFYtikmxm/GfPmssJvUGYcjJJPer4Nwrjn/z6FTUEzsbcyo
	 /pclJ4CSpKxNdrXAh8DVR31Ybnx9GIqkl0MEtsq/0LthC2p6dAaAubOa36Pv2VxiGUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kKrY1rZZ;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1FF606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1FF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kKrY1rZZ
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so817298a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793359774; x=1793964574; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k+4d3YeUVXdsSSuX0GC4pWzZJQi/FeecQ3AMlBUJ4B4=;
        b=kKrY1rZZ632i0tdgWUKU60WkHdyu9nIPYABSlnuDF7oi8bFRjYIKhO5XzQlbl75Ctt
         PKmMtRZPK0a7q4qLIMkDH91H294XZN5PTFJPTWW5twUPp7rk6sLiMLTNgNcCE5HdUHNE
         yCOWYZ/97ECB812gXzDxla/kwLzWPAXLpFx+xrIggUru3Y2QupTUl9sjH7Agq6QDLTq4
         3vgpJkLCRBAEldI5hzc57hgiE/mnhdPgVKDtypmHjZQJpMJcikLqd46Mv0VVKj/H1MBG
         9auiZjArNPfy5+uFbFhTzC5P6xaBcYxazq5sGVZkbHE+Dr0F87rvsmDMCVQ0kTbw7pTS
         G/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793359774; x=1793964574;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k+4d3YeUVXdsSSuX0GC4pWzZJQi/FeecQ3AMlBUJ4B4=;
        b=mUXtaVxq3hilkOsmYp4rR15uSfRVAxzGNOH+2yCRjbsmzdreTkRQkEG5HKP5L1eVod
         NBafsLrb+lT0LpzXVO8dVzhKMy1hyeqNGR4Lhagbw+J5dXyq9+QJNJY4DW/kkFH5uQeg
         6KqCzPudl442Y2IRUMQsX/pbKDgU0BqSTJ+VKjzquSOIAdkvzBt/WKLMvO8LUWLyHDHi
         0l9Gz+KljW1xD02SM+zokdBEDGVPWjALrhe59MS8K1O7vQng1IqwWaNzq59TyxaneKF4
         Lvu8YsTS0f8J4inlbdPhjqf1gtFLJCFiDGv7SiWCNQfPSEKOsEjrhqIUDK7g1kmHpB5D
         o/dw==
X-Forwarded-Encrypted: i=1; AKwUvBycbJv8z7rQwu2gefGTt1vdND0W+NuYAWWVkSkSI9Qlx5w720j4SulmCtBsS37L5f7wsRaARRQhV2bY3dY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA85usT3xv0nr8xpVU6xQoq+U6HLf+EJb1Cul3MI1tBQQSxn/R
	cKAqAPPtkynZMXVrQxdo/cxXVPVKmFCD3p0k7sRQx57Lu+ZD2+QQyGRT3xoaUW5t+A8=
X-Gm-Gg: AYBFou1x0RiZQmfzT/jJpmCifPHoK5nPQMYReqUJxbyV3ANvnq0GrK4cS7oQ4lyzsaV
	qVSg5y+GAy7TkgYsnNEZPgA10+/CWAyF86drgFywf7ovolzW6xProvZFbY039tLOoAo7lhdntDK
	6XX9YC25MDWx7o3QD6nIU6Byn73akY94ig7o4sXBxd6wFvbGjokK1LFFcypwbMrTnszACaqcGLI
	5/Wg+YE70jyFzi7v7BFYZu2D24kU3kC+Pro3/jpOh0Uxot7O18VP9J1va5cXBks6PRrZJUiE1eN
	MafWV0/Z7yCY61SV8Gk6TB8Jd4r7fUQ64HGpi54XFqUvKaLLhMbL1f64y4EGhiwVJmJFMwvtj5m
	xBZspyO8Pba1zTb10GD9j1ijL46GRNKAjUD3GyLYgc7qCxQz+u7ota4ecKe4Lg9liNZWTt+157d
	2YFBYAR74voEcZIdtXgsRKAVRamrQcdC3vNHc3lQGMG3YlufG6HNjr9iTskK1rg1CLBo4UOurvm
	kGG8rfQeG5gFNKlK93XmxRc/8GLLDriW+d0VSBldt8bmCH2/Bg0Pr7jnf06yWs8zwutYSE+g4Ot
	Va7YbwLzY/qh4zIVKEqDSmkCPcXpqz3kFkTOKRe6+C1d+COBELfBcBBq6mtI4HCnqweVfFSw9Eg
	f6a4EDqmw1xq7dY2a2z/L
X-Received: by 2002:aa7:c0d7:0:b0:6b3:d0a0:39e5 with SMTP id 4fb4d7f45d1cf-6b4d438bdb7mr1069754a12.9.1793359774419;
        Fri, 30 Oct 2026 04:29:34 -0700 (PDT)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4d7aff3d8sm494375a12.17.2026.10.30.04.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:29:34 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 30 Oct 2026 11:29:31 +0000
Subject: [PATCH 6.12.y] kbuild: link-vmlinux.sh: improve detection of third
 pass requirement
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261030-linux-kallsyms-fix-6-12-v1-1-9c43c892de04@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJp/5GoC/x2MQQqDQAxFryJZNzKJMJZepXQx2NgGp9MyQVHEu
 zf4do/H/zuYVBWDW7NDlUVNv8WFLg0M71Regvp0Bw4cKXQBs5Z5xSnlbNvHcNQVIxIjp9iPSa7
 kgK9/Vbydz3eILXG7weM4/iJjCmVxAAAA
X-Change-ID: 20261030-linux-kallsyms-fix-6-12-2a67fae81111
To: stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Juan Yescas <jyescas@google.com>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3

commit 14b8b4bf2d7bd5d58c17adbeed0edfda1dfc1a7f upstream.

It can happen that symbol sizes within .tmp_vmlinux1.kallsyms.o and
.tmp_vmlinux2.kallsyms.o differ, without affecting file size on disk
because of section alignment and/or padding emitted by the assembler.

link-vmlinux.sh doesn't detect this case currently and keeps using
.tmp_vmlinux2.kallsyms.o to link the final vmlinux. Due to the
different symbol sizes, other symbols are shifted within the final
image compared to .tmp_vmlinux2, and the final comparison of System.map
against "${kallsyms_sysmap}" fails with the message:

    Inconsistent kallsyms data
    Try "make KALLSYMS_EXTRA_PASS=1" as a workaround

This can happen in particular if the linker emits additional symbols
that might have different names between our (re-)linking steps, e.g.
because those names depend on the virtual address of the symbol. Linker
stubs for ARM errata work-arounds are one such case.

These changed symbol names can cause the output of the token
compression of kallsyms.c to change due to the changed symbol substring
count, which in turn can change the size of the kallsyms_names symbol
itself, causing the potential shift of subsequent symbol addresses in
.tmp_vmlinux2.kallsyms.o and therefore the final image.

Update link-vmlinux.sh to not rely on file size of
.tmp_vmlinux?.kallsyms.o alone but to also consider symbol offsets
within to resolve this, and do a third pass if required.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Signed-off-by: Nicolas Schier <nsc@kernel.org>
[AD: adjust context]
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
This patch fixes an actual problem people are seeing in various
different kernel versions.

The version from 7.3 doesn't apply cleanly on 6.12 and a minor context
update was necessary.

The bug was introduced by 7e2b37c971a2 ("kbuild: kallsyms allow
3-pass generation if symbols size has changed") in v4.10.

xxUpstream 14b8b4bf2d7b cherry-picks cleanly onto 7.2; please apply it to
the stable 7.2 tree as well.

Cheers,
Andre'
---
 scripts/link-vmlinux.sh | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 94f794ca11ca..a5729419a452 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -131,6 +131,18 @@ gen_btf()
 	btf_vmlinux_bin_o=${btf_data}
 }
 
+# Check if kallsymso_prev and kallsymso differ
+# If symbol sizes within ${kallsymso} change, any symbols within vmlinux are
+# likely to shift, invalidating ${kallsymso}.
+# Since file size can remain unchanged even if symbol sizes change, compare the
+# actual symbols instead of relying on file size only.
+kallsymso_changed()
+{
+	${NM} -n "${kallsymso_prev}" > "${kallsymso_prev}.sym"
+	${NM} -n "${kallsymso}" > "${kallsymso}.sym"
+	! cmp -s "${kallsymso_prev}.sym" "${kallsymso}.sym"
+}
+
 # Create ${2}.o file with all symbols from the ${1} object file
 kallsyms()
 {
@@ -151,6 +163,7 @@ kallsyms()
 	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
 	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} -c -o "${2}.o" "${2}.S"
 
+	kallsymso_prev="${kallsymso:-}"
 	kallsymso=${2}.o
 }
 
@@ -263,7 +276,12 @@ if is_enabled CONFIG_KALLSYMS; then
 	sysmap_and_kallsyms .tmp_vmlinux2
 	size2=$(${CONFIG_SHELL} "${srctree}/scripts/file-size.sh" ${kallsymso})
 
-	if [ $size1 -ne $size2 ] || [ -n "${KALLSYMS_EXTRA_PASS}" ]; then
+	# Due to alignment, file size of the kallsymso object file might remain
+	# unchanged even if individual symbols within change size. Changed
+	# symbol sizes can still shift other symbols, though. Therefore, don't
+	# rely on file size alone.
+	if [ $size1 -ne $size2 ] || kallsymso_changed || \
+			[ -n "${KALLSYMS_EXTRA_PASS}" ]; then
 		vmlinux_link .tmp_vmlinux3
 		sysmap_and_kallsyms .tmp_vmlinux3
 	fi

---
base-commit: 85d82e0d7c2dfd3e75d34f35b7ebbf41f45c9c4e
change-id: 20261030-linux-kallsyms-fix-6-12-2a67fae81111

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


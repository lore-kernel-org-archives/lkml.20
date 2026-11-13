Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569429;
	b=jV8cfL/YYOZyXzX/FHVn4iSezcmkFmCKjn+3jieP8zM1ds3A+uv6hdJXeXVIiX1swb7q
	 hyNsuv4Swx9/EKgQZZjNCXZborHJNH6huDBcmp9sACvNE1xgOGiPBPFBlyDLGOwoiXpJv
	 l46FpVXG9qRigdJyLRJGokxJN8XTWf3ZkUG+bqFyMJlmCV9kIPJDd2xn43jkqFTusC/+j
	 AJ2Sn+/qzfpTgmDLWMDW7rvh5P2S+nUZtvW4Tt+za5dMoCtjd/sKGMBblcth8oCDZj/0d
	 EWR40BkyLFmN7yJV+eF333fdTkIiuftDJwI6TPArdOf31nsOIlHDwxl01IC3vNMArhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=8Je89T51T2LctLHyYFmc++OizS8/9zsUyvOTZbIhIaU=;
	b=V+PqWQBbKGuFFZBJYxAXBXvFBpBWHFIQrcGbtCoXoyzvM9X9/TIPPFh/MDFKV9nUvqN2
	 7yVliypL1Dh31/Npgs9XDsYaRsphx6PkoI1qEfm3OvAJbDjdzk1xWW0XPh9Mw7hp4Qw9Z
	 +Bm3X0APc0eUiikRvxBIe/hga/d78vhyhBQoumRyGzBzy25bREGjqeHx9qB3xMRAmqcAf
	 FjGu8YoKO/dBqHrEHGo4mkRiHssQh/p2YvTJA+sMA/zmLOMIRtJXpaxekhuvAo3lNjYQj
	 dB9j4jFu11hj8QyAaD903IDLIC4Z4nfNe6lyulJdJBjWArpZoSFD2htJdcJTftazqQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mUcLZpJQ;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65F9606A338
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65F9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mUcLZpJQ
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ae25c846edso9611091fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794569426; x=1795174226; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Je89T51T2LctLHyYFmc++OizS8/9zsUyvOTZbIhIaU=;
        b=mUcLZpJQbYBWoHRUVtLPMCgY8QIdad1Yjt0R++LNr3e0CaMQmf/RoDYTdxhzxQN9wb
         s6g9V4pmR/41PmMuQ+SydSeGgVwIJH2AuV4jwBKESXb9mxyckdAqE/sv/m11w38u/cbd
         bOrGf8tIcWaqJZWgpqIf2eLrQvhze6SfN/zsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794569426; x=1795174226;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8Je89T51T2LctLHyYFmc++OizS8/9zsUyvOTZbIhIaU=;
        b=h7a9S9vyFUYILenK57ryJ71wwF6gQKkk0mRYYDg6FY8AXF7ba6142GfmSBVuQk7sIy
         KebEaKXVJHSD8el9tQGTnoviynsM5iwzZy/dttldBwxHwqd2rzCo0HFZ3qUX3LGnhviX
         9sQ17SDbjb5H2tdxK/LBVlixmZUy4gKoCrrYGNX390xDsb8xFlRXrjH6EY4iuP8pSNBn
         JgNRVyuicP7ANPDYi0RPnqeJomUwmARd2e+zgmxmckHPl2GCPjeMonCjFGXo7GLZpD97
         X9WKWFiDxyidpGmfyP/h/+RGrNhdeuBkxC+QZ4btV1TbvVQB5O6j3A5EBSCAV/jG3Wy0
         dQkA==
X-Forwarded-Encrypted: i=1; AL+hErHyknCP2iH04iOAVvM/s1OT3NjxlgRmAnRhg882ZBbdusRT55jzRuqm6Zr1TiYGxN/0vPc8KtC7+qXbJi0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ey0eVTZjtWMxGpoY5ubMhSiGa1jQRsI0MREKF0499Mfvpqog9
	PCSea7NZOGAs9XBbIw9Jj7O6vVF96dtxag1qZRPLPfyocGJt8JW0Ms7nD6zF8/rs9g==
X-Gm-Gg: AYBFou1nnAfOILjFl30WB+PmSTKR7cwCgf6i1Q5elZKgL0bSWloyB5mc5DZKFAM+jJQ
	b8zz146+85OaBA9fEz12qk+VSkEyyL690L/hxL9We26sHkCBvcbc/9wYICpKYIhe56Sl9wI2pma
	QTNzULQ/r7qPakPE8H/wNYEN2zD5jIRtRkCXLRJyFU6SZlTAB4+OqaD33cdy51xtW6GStjJqtd+
	v8iGLbS0xC0PxsNJ7ylr7gvow1YNwxtJVJgd7Zhmjs51M92oldByvLmjtiYAaeaok1x4XzHhKX7
	P2u3Iei7W56bGIU61Mbdq+TosC90SSOf0P+bcwkmDyzNKCOUfZKU9pdLq0GXz22wx0gSapNeAtR
	iQGqIrLAJrMRYcGuDXTUQkkjiBIc3Uj8fkhPXc37n8tAnPJyB69KeFPgBmjTHafFyDyRMnMMJiC
	GmDcQSeEn8YVmX5fOetF0t4hp81e70iVVCTZYqn5SOls9WwWs5qC8EnA+fno1DZfHmiD7e+qhmn
	DCLlQdAMExrx/MR+9dLyuuSEOWkA3Hj1n5+7OksPpTnanlYyp2WNFXkmer/RFmOk0wrXuLzlU8V
	tEc2iLkyDr8Wwpi3ImZBPxU+s7cpwL6T/ww2Ou0/GQdw4d9cdrwDiO1Ck7uaxtZUrScofB5kMP/
	nkCe9qrk2hg==
X-Received: by 2002:a05:6512:3b23:b0:5bf:d189:9e82 with SMTP id 2adb3069b0e04-5c17079b190mr936927e87.17.1794569425711;
        Fri, 13 Nov 2026 03:30:25 -0800 (PST)
Received: from ribalda.c.googlers.com (214.118.88.34.bc.googleusercontent.com. [34.88.118.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712d9f5csm652154e87.4.2026.11.13.03.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:30:25 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 13 Nov 2026 11:30:20 +0000
Subject: [PATCH v3] x86/uaccess: Drop the address space qualifier from
 put_user()
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-unqual-v3-1-b32e19375202@chromium.org>
X-B4-Tracking: v=1; b=H4sIAMv09moC/2WMyw6CMBBFf4XM2prpWF6u/A/jotAWmgjVVhoN4
 d8tLDTR5bm558wQtLc6wDGbwetog3VjgsMug7aXY6eZVYmBkAqsKGfTeJ/klVGuaq1LYRRHSOe
 b18Y+t9D5kri34eH8a+tGvq5/icgZshJJmKbijTD1qe29G+w07J3vYK1E+po1Fx+Tklmg5AJLi
 a0SP+ayLG+B+yj22QAAAA==
X-Change-ID: 20260825-unqual-25d9ee74fd10
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Dan Carpenter <error27@gmail.com>, Chris Li <sparse@chrisli.org>
Cc: David Laight <david.laight.linux@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-sparse@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

__typeof__() preserves every qualifier, the address space included.

When we do __typeof(*__user *int), we are declaring a __user integer,
which is pretty much meaningless. A value in a register or in the stack
does not live in the user address space.

This annotation did not trigger any error until a recent version of
smatch[1] started caring. And as a result of that now we have tens of
warnings like:

  drivers/media/usb/uvc/uvc_v4l2.c:1112:13: warning: incorrect type in argument 2 (different address spaces)
  drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    expected void const *from
  drivers/media/usb/uvc/uvc_v4l2.c:1112:13:    got unsigned int __user *

Use TYPEOF_NO_ADDRESS_SPACE() instead of __typeof__(). Unlike
TYPEOF_UNQUAL(), TYPEOF_NO_ADDRESS_SPACE() only strips qualifiers when
running with sparse, while expanding to __typeof__() for normal
compiler builds. This preserves const/volatile mismatch checking and
has no impact on compilers that do not support __typeof_unqual__(),
which is why TYPEOF_UNQUAL() is not used here.

[1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f

Suggested-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/20260825-unqual-v1-2-7024fb81b4f9@chromium.org
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Recent versions of smatch preserve the address space qualifiers while
running typeof() [1]. This has triggered tens of new sparse warnings in
media-ci.

The RCU patch from earlier revisions has already been merged as commit
0381ade2ea82 ("rcu: Drop the address space qualifier from the dereference
macros"). This remaining patch takes care of x86/uaccess following Dan's
suggestion [2].

[1] https://github.com/error27/smatch/commit/e53027a4e816a772403baafa83c09e4a94c1cb8f
[2] https://lore.kernel.org/all/CANiDSCuizbMt77XfrzGPMa3Biai5TF1vcs+C5qdhYoLrP=9b3g@mail.gmail.com/
---
Changes in v3:
- Drop rcu patch (already merged as commit 0381ade2ea82)
- x86/uaccess: use TYPEOF_NO_ADDRESS_SPACE() instead of TYPEOF_UNQUAL()
  (thanks David Laight)
- x86/uaccess: update commit message to explain why TYPEOF_NO_ADDRESS_SPACE()
  is used instead of TYPEOF_UNQUAL()
- Remove RCU maintainers and rcu@vger.kernel.org from To/Cc
- Link to v2: https://lore.kernel.org/r/20260914-unqual-v2-0-60a1407a0cd4@chromium.org

Changes in v2:
- Add TYPEOF_NO_ADDRESS_SPACE() in compiler.h
- x86: improve changelog
- Link to v1: https://lore.kernel.org/r/20260825-unqual-v1-0-7024fb81b4f9@chromium.org
---
 arch/x86/include/asm/uaccess.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/include/asm/uaccess.h b/arch/x86/include/asm/uaccess.h
index f4700ad6b5ec..66186a642f26 100644
--- a/arch/x86/include/asm/uaccess.h
+++ b/arch/x86/include/asm/uaccess.h
@@ -140,7 +140,7 @@ extern void __put_user_8(void);
 	int __ret_pu;							\
 	void __user *__ptr_pu;						\
 	register __typeof__(*(ptr)) __val_pu asm("%"_ASM_AX);		\
-	__typeof__(*(ptr)) __x = (x); /* eval x once */			\
+	TYPEOF_NO_ADDRESS_SPACE(*(ptr)) __x = (x); /* eval x once */	\
 	__typeof__(ptr) __ptr = (ptr); /* eval ptr once */		\
 	__chk_user_ptr(__ptr);						\
 	__ptr_pu = __ptr;						\
@@ -177,7 +177,7 @@ extern void __put_user_8(void);
 
 #define __put_user_size(x, ptr, size, label)				\
 do {									\
-	__typeof__(*(ptr)) __x = (x); /* eval x once */			\
+	TYPEOF_NO_ADDRESS_SPACE(*(ptr)) __x = (x); /* eval x once */	\
 	__typeof__(ptr) __ptr = (ptr); /* eval ptr once */		\
 	__chk_user_ptr(__ptr);						\
 	switch (size) {							\

---
base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
change-id: 20260825-unqual-25d9ee74fd10

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>


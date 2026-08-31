Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D702C42E8DC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197795; cv=pass; b=QIeybPh8qh5alLkTEe7myrCLUrDqT0YNmU3c99BQK9Vm+4ATb/7KVaYMzGyyI38zDxvS/viQa1BFqK4gvOkCACl42IpAxvrAqMC9JccwylS5XJKG/NaFSzrImRYX26VW8OOeFXc2FpVLjIPFIEip+CsQnziFMQ9QnKxjljZX6xM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197795; c=relaxed/simple;
	bh=gfRjgqhCPM9k9eik7Vs6QHFcYIPUlMQFi0PeCz1wfdA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n6rYsdoqgm6VoIqS81tBFNjtd68jaxXR10dhQ+3cS4M7IJUQaohIEl1Mg8PQ/WJShzGbXnREEv2RXJv7Po9u0HsdflQill4o8jyoIiHuY7iyO9M1JyLJy7PPr1jRdBKIATs3q3QauASvWjsM22tTc09m8oJ4cHSNB6rwfdlk1JQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnHOEuUT; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnHOEuUT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a6108734d5so5565043a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788197792; cv=none;
        d=google.com; s=arc-20260327;
        b=r3Ne71Ho7pLj88Aw0Dk+Cvf8WABsPZK2B8GQoMYltse4qTDGb32Ct1LenzhWiTHvEl
         PSCAvBNTS7FRkyvv0TtZGVp5rDJQKoliKrWkM+57n0+t2vJcwbrm24wP3qJVAYjo6+rA
         rA3JP1P0kGCxyGCs4onhUPF1pmoOk+GmGsePiiq7Tq8CVtfY1OWtr34U3vOX0mJjK14A
         zsb94+bWXJANl3uLCSyqkyVps91NJHJkZRFAIXMW63yBnaLLFOlveX5rpKaPhdP023KI
         zej+u7JEtJGk9s3pEF6u4pUYVGfte8HUWoPqdnXvrdkpeRy4mdTsS+vJscjPsaGrboir
         oYqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=IZzP3oqq4/kAiWuvQZGEb55y680ZMND8wcZo+k9awlA=;
        fh=DkIjLzGWazjbQ3rqeXMwpkWzkGp5u1fmKRm2na5PnIg=;
        b=PD2Q01hqN45ZvojhpEGlu44YF0O5duG9dRpL8fgdmkHdlT+DYVF6l92/wFfHR+Yj+S
         ZRpyTabRx0DewmldTziRrGmMEUdiYUPBK8JPTl00BEKcAq+HBokV8c7oo3shr5/NLwNQ
         A63m7WZlq0P9ZeopfMdGa05DO8RrhdkZz3R8dsAqh4eAwrOMbnZYs3EDPSOxAC4Z7gCa
         kWenBG1rOeN2IBJDFRSNysnCJIScljENkNMZPlgvjf/OeXndVBcrLZXg+zImfBp6c9jf
         ABU0FhqHLUROl1p4wcqDsyuFejsaVr/TBJEAZufJ2SGAxdxGbKwvfaPW7zbKlR/5Uw+N
         zARA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197792; x=1788802592; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IZzP3oqq4/kAiWuvQZGEb55y680ZMND8wcZo+k9awlA=;
        b=mnHOEuUTK+iZ8yvsMG4RTf4yQ2FoIX5PZWeJRzLdur6DgKgpdYJBDIJkA3wg7fPc38
         JEqJuiNCC3il9s5EaXy2grACYpjmUyB8B8pptsaWSVhLDFX+A5WKeFzfyzAzXJu86/8C
         yZWAEG4Mv8Bkr4Aq9VKFTRR6vJnUAy0iEjOplqipEhqAJEwOABEj7MUSsT95fIAN10hL
         nYvHBwUeOIY/UOjqKSnkvwuy167sLt4DujDoplDP6PS+iZu3f6bXO3EBp7XWXAbTcpFh
         fPE3c/SMmFD7+LwLgm1Lvn6P0VMy+cR8HXducJnfEZnFh4wJUWbeXwX2oA4S8xqP/AYX
         3cPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197792; x=1788802592;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IZzP3oqq4/kAiWuvQZGEb55y680ZMND8wcZo+k9awlA=;
        b=X4RrHfZZtzIQ1oW86dTHTmDUDgaoh5zKfVsdAAb3lLd0XpblPlOozZ5ee6iFsapT82
         QVs2uVgCJqp2Fjba+Zekmu11ToB4Fs/AvOOuGCE0CxQmghBuRc4UweDxEypA0/ygKZz+
         YF0ZYj2LDDS6y662B3EMIdj8joEvC0Vy2XG1X8WtYuY4kpQ6AWHWWkm+xA5AdlqVoIzu
         +P5/7I0n5+yHofeZB2Twv2Uelt4nwhhR+uxOKOKkz7njo2ddI6sxnvEI3G/AL6802QOM
         XIH2cQOTz8LcEnzQoZcnjFXBr45U25aY4EiR6ww9iHAQpVuxLeB4Z0K1QZzP06NVJP7L
         2o+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/WCYIQPbK+lvrWSMAq56jsEInAzm1v4O5AllKAYZ5LldRI/s9Drnf9Zddlaxi0gAugpgpMqobx121z3k=@vger.kernel.org
X-Gm-Message-State: AFuF++ml5Mfl+/DABmm+CS4I+qsjJ5XB2nY/jO9c+6Sf19SZ+PR0N+ga
	s1IIqiCnl1FHSQdFYtuht7Sw8cqTqHzjA6NH93IANJf6V6n/9kIoNqKuT3NRfpIanvUZXC07OZD
	CbEO4udW7zvku7DiAZfvLQSIp+HfnnDQ=
X-Gm-Gg: AYBFou2GmDE/jvTShj5w5CHw/Lr0rXeDoyqHid/opjyJN6mA565ydPhJd+rdi5BdYkG
	SWWy3cMTc2g+iPi0lWqB2LF1DGro0FgQQ4W6+6u/WkVb3+irb5tltEsFC2qAtF8dRVeWwnamt0F
	IMDiFfI3YKjrpbOz+nrgUyhe6CS94+hpG+cCZKnD1n6ybUKUbfZpPLdqy/CSv0oknWsGvC39frr
	ZUM/M1/36s5ufFwKI9SRrJfry1HTivNycdje9wLCa0cs3zlDZ+qhbRD0IWntc6/PkrK2jfyurjq
	9/381JOpUQWsnQET4bKgXJd6GUm5+GgodDd1jghtaO7+W1CXcKoDkUk7zoywZE00Cc1Kfqkdh0Y
	Ohw==
X-Received: by 2002:a05:6402:4284:b0:6a6:32f5:90b1 with SMTP id
 4fb4d7f45d1cf-6a663b123a0mr2033787a12.19.1788197791583; Mon, 31 Aug 2026
 10:36:31 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:36:30 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:36:30 +0200
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAH=xXfE6o2sLwcYdoH9cayZpbf389y8PeJ_aDRty61i7q4QKow@mail.gmail.com>
References: <CAH=xXfE6o2sLwcYdoH9cayZpbf389y8PeJ_aDRty61i7q4QKow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 19:36:30 +0200
X-Gm-Features: AcwNN1UVT1h5fURaq8X7i_1K5SyCbIhqers5WQBhHgJj2IUeqnOWgcUE-N56XB4
Message-ID: <CAH=xXfE_xfPP30wQH_MO-ayUf7ZLY+z3p1++OD+wYwN18k=rpA@mail.gmail.com>
Subject: [PATCH v6 01/11] f2fs: initialize sb_info early in f2fs_fill_super
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org, 
	Kelvin Zhang <zhangxp1998@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000281229065a5b3e15"

--000000000000281229065a5b3e15
Content-Type: text/plain; charset="UTF-8"

Previously, init_sb_info() was invoked late in f2fs_fill_super(), after
processing superblock error tracking, mount options, and sb->s_maxbytes.

However, read_raw_super_block() reads the superblock folio directly
from the block device mapping using folio page offsets. This makes the
initial static sb_set_blocksize(sb, F2FS_BLKSIZE) call redundant.

Move init_sb_info() to execute immediately after sbi->raw_super is
attached, allowing the block device block size to be set dynamically via
sb_set_blocksize(sb, sbi->blocksize).

This early initialization also prepares for upcoming patches that add
dynamically computed filesystem geometry fields, such as
sbi->addrs_per_block and sbi->nids_per_block, to init_sb_info(). These
fields are required by earlier initialization steps, including mount option
consistency checks and sb->s_maxbytes computation.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/super.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--000000000000281229065a5b3e15
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-f2fs-initialize-sb_info-early-in-f2fs_fill_super.patch"
Content-Disposition: attachment; 
	filename="0001-f2fs-initialize-sb_info-early-in-f2fs_fill_super.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: beb5c9156df1bd38_0.1

ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwppbmRleCAyNTNh
NTc5ZTlkNWIuLjJkOWY1Yjc3ZjgxNSAxMDA2NDQKLS0tIGEvZnMvZjJmcy9zdXBlci5jCisrKyBi
L2ZzL2YyZnMvc3VwZXIuYwpAQCAtNTEyNSwxMiArNTEyNSw2IEBAIHN0YXRpYyBpbnQgZjJmc19m
aWxsX3N1cGVyKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIHN0cnVjdCBmc19jb250ZXh0ICpmYykK
IAl9CiAJbXV0ZXhfaW5pdCgmc2JpLT5mbHVzaF9sb2NrKTsKIAotCS8qIHNldCBhIGJsb2NrIHNp
emUgKi8KLQlpZiAodW5saWtlbHkoIXNiX3NldF9ibG9ja3NpemUoc2IsIEYyRlNfQkxLU0laRSkp
KSB7Ci0JCWYyZnNfZXJyKHNiaSwgInVuYWJsZSB0byBzZXQgYmxvY2tzaXplIik7Ci0JCWdvdG8g
ZnJlZV9zYmk7Ci0JfQotCiAJZXJyID0gcmVhZF9yYXdfc3VwZXJfYmxvY2soc2JpLCAmcmF3X3N1
cGVyLCAmdmFsaWRfc3VwZXJfYmxvY2ssCiAJCQkJCQkJCSZyZWNvdmVyeSk7CiAJaWYgKGVycikK
QEAgLTUxMzgsNiArNTEzMiwxNCBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qg
c3VwZXJfYmxvY2sgKnNiLCBzdHJ1Y3QgZnNfY29udGV4dCAqZmMpCiAKIAlzYi0+c19mc19pbmZv
ID0gc2JpOwogCXNiaS0+cmF3X3N1cGVyID0gcmF3X3N1cGVyOworCWluaXRfc2JfaW5mbyhzYmkp
OworCisJLyogc2V0IGEgYmxvY2sgc2l6ZSAqLworCWlmICghc2Jfc2V0X2Jsb2Nrc2l6ZShzYiwg
c2JpLT5ibG9ja3NpemUpKSB7CisJCWYyZnNfZXJyKHNiaSwgInVuYWJsZSB0byBzZXQgYmxvY2tz
aXplICV1Iiwgc2JpLT5ibG9ja3NpemUpOworCQllcnIgPSAtRUlOVkFMOworCQlnb3RvIGZyZWVf
c2JfYnVmOworCX0KIAlzYmktPm1heF9hdGNfd3JpdGVfYmlvX3NpemUgPSBVSU5UX01BWDsKIAog
CUlOSVRfV09SSygmc2JpLT5zX2Vycm9yX3dvcmssIGYyZnNfcmVjb3JkX2Vycm9yX3dvcmspOwpA
QCAtNTIxNyw4ICs1MjE5LDYgQEAgc3RhdGljIGludCBmMmZzX2ZpbGxfc3VwZXIoc3RydWN0IHN1
cGVyX2Jsb2NrICpzYiwgc3RydWN0IGZzX2NvbnRleHQgKmZjKQogCWlmIChlcnIpCiAJCWdvdG8g
ZnJlZV9iaW9faW5mbzsKIAotCWluaXRfc2JfaW5mbyhzYmkpOwotCiAJZXJyID0gZjJmc19pbml0
X2lvc3RhdChzYmkpOwogCWlmIChlcnIpCiAJCWdvdG8gZnJlZV9iaW9faW5mbzsKCg==
--000000000000281229065a5b3e15--

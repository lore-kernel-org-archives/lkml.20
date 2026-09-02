Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9E5345EB5
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788314700; cv=pass; b=aHnO6O8AdR72fCpOo8eL6EFa2uGXB8I+ql6YvTzR50KGw8WaWFbDBuYpiPL3Eg/Znr4MddT2duDodDBeu0jPaZC8u8uhgX4JmgGDDWLHkE4BfJX5ghMy7Ilm5+dpSzHtAZRgLlRIZdT6/oR90LL+d7OxDxj+7/dOCkbZSlo0PYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788314700; c=relaxed/simple;
	bh=YT5zBfH8mpMM2lyf1FZRCc3QvS64XCHPvFvZMt8wsKs=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=TyTxdyXBnBqQLfwe+xz9T5cF8ziuVfFT2L90tc1ozyX2ZnKX/A6Dc3gwY7RNTPKEG185AaWDOBNn/GbYcTv5U8Xa3s+9obgvYlHRvE1UzYCUm2fJSGHZy0vNetFd6uxedDxXSKkpk+SiXwNCVzWoeobM+WPRvjtug3hu50G/VbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJWWE2vJ; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJWWE2vJ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843e397f74so500932f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 19:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788314693; cv=none;
        d=google.com; s=arc-20260327;
        b=bvV1blq77/Z/NLUoo9YPpOE+OdSiCkFG+gmLgs8rgY/UgkTqYRLWmmkYKFIGOjTJkX
         QQNG9u3ZD4xQHhfNYN88trCcucrcHcOQLsWAUHD9TOSrf9Jzlu4gGc5yCzFLJBNsCNnP
         uSncXrJRMANvS1DxQbfWFGRUP3WRr2gEfmErXzKHQpvLYf3fN8NIllYS/Z4KrqYcIzK4
         FSD1lNlIZ9Gq0jsmk61UzvYT3CqaDCmw5xOAqTtWQhMtMvU2HhTF6z5mVKGEpwPkAN2U
         s2bQ+gcScj+2re4GRpnrI6UuObESGlCChG26SY7W9PQSNm+1Qpv+l7Myxxy67JvZ4pwW
         VAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wyyDLth+ZOHBMkr86Vlswg04HV1jJ+33CAE9hpj/U7I=;
        fh=OGpU6ufBgYJJC9qojou26EbUUFk+XtZqNqHUb6vHQmU=;
        b=kY0E+EeR/DligF3h1yCOWlv+vLH4xGf64r1PfWs0VKJsiSsX4ua3jhI9c5MBxSBVRB
         CMDLpIGF4Yw5kSBhBIydWTETqTHLUFsQSBGWlZUnqmfiOoV0X3Jbl0ViMPa4nW7/KmJx
         mjDghx7YatFJoA7l1rWn7cBLu4zJTSqlCS8o4XuNSnGy8XX7vJS7a5u6QRV8Joa+80xw
         wiop3hzT25WOf07SViPFRdnfIzlmnZoKyowO/8nK1Sca8aNfi45LkswMmAcxk+50hWpt
         08oJ2fRdVaOylcE+ITuP5wFo0a5tpMaKz5pZA6g9dr5AsNze2Y0aiv6v8u2SL1yhvpHs
         11JQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788314693; x=1788919493; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wyyDLth+ZOHBMkr86Vlswg04HV1jJ+33CAE9hpj/U7I=;
        b=XJWWE2vJs0qHQxweJ9q5qDVSXo8/U/dE093CK0PMiu5AympCX92QfZfMDFH2LQKWqN
         d9looQxjTR1nc5meUcwSyLNvse0SEZyf05FvDowjkt69gRx509J35ZuRxdyuGpNSNLlt
         1ZT0/HqrCKt1CqW9K+mmWxW+IMOCnA1wjELK1V+9ran9mZvHc4FlkdCvHfEKnRq+wo8m
         uktcZ/QSsHqYzvuzhcWQrrsGjoKsqoV6BYilv6ZVJxRH5u34wpCToB5MLoeE0JhF4Boc
         JR/MTKESinW1Pk4VMr0ajYDHwfLuZ+oEYXThPiCcPs7cfSz0/2qlDQoqEWFuoDGdIs4h
         KElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788314693; x=1788919493;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wyyDLth+ZOHBMkr86Vlswg04HV1jJ+33CAE9hpj/U7I=;
        b=dx3OZ59Oi38c6QPXPebVRwj9NdB2TmNBVfTT+AbqMu+0Zl5xOwxC0iitW7rViezEha
         CLNwskZGywyphxDgJA/KxbIpKYvNNugtsvfRPJ7ZdS56dRgdhh93GpX9E4Re9uTn39+U
         AuzY4Jg4hDnYhdsjLOiQM532TG31kxQrFEZULHS6F97MxVXO5XEQaUvpOv4ziHxG/IA6
         MI4guMwblDs8UjZbeqZIMJK62zfPp+I2kxU8k8PDVY4uuPH3SfntJMkdLpZ7AoBZdH2c
         4ceLNHITp9yuBNoGETHLFNoGqZUOed60zFIUs8jdQ4aNyWvwGyuxCWOm0NTfp6G0hKSj
         qQ8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzM4AYO1CwPMdGMIluZeo7LxgAMsjH5Cmi18uNK2EbxFZoZ+jd2QE4ZHrrEoSWVWxahwQEfWfEPKfpLpIE=@vger.kernel.org
X-Gm-Message-State: AFuF++l2oeMOn7P6J+Vvvrg5t0vDS6TTXK5i+6WgRAsuPIRgOM4hE75I
	zIP1q8B1shjAkB4riJDtY1zL583L2Hqk6LKMC8nK2p+NEvz2D9sdIZ01IpCs70pdNeZZ2ckTpcN
	mbl1F2/butwZ0My5hFZih1RWgZSxHCgA=
X-Gm-Gg: AYBFou1ARi2vxvDJokM6b5VXh5wortvIMKvPwTCV27gvvYOeXdNwYmsY+hfwJHVVvu/
	zQDUmt93gBcHvyScyUC+01rvBeOG6BcLu2krpSt4aQGjUNHZ8KPOl0JHkhg5MUKtgw3OAXkh9zP
	5IrEXgO2mxvao577bITHT73cstrF6DlwUQsetyw+6jYJ7QopN9OmmbAfs39ACMGj0UD94qc50et
	6NNVR6lNstYv3nsP2iP+XujK7frRj8jzNJMK+9gL/qxSgAqkv17nTxuDkZutAlj+iyJ80CnUTXS
	U0uBtZg47Gpsf3h9LE9goMPwISh238N7iRf8hWsnk5o=
X-Received: by 2002:a05:6000:2dca:b0:484:42c1:41bc with SMTP id
 ffacd0b85a97d-484a3bc2e28mr1560654f8f.5.1788314692763; Tue, 01 Sep 2026
 19:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Qingyu Zhang <usupergate@gmail.com>
Date: Wed, 2 Sep 2026 10:04:41 +0800
X-Gm-Features: AcwNN1UdyjD22a4J79gsh1SqF6GjF6XDdTJzwrSgkDe80nmS8380P2jwFtSVCD0
Message-ID: <CAPBHda=tMkmjY3-WE-d8jnNfDt5bEsAvu1BCiwOT4FgqqYASEQ@mail.gmail.com>
Subject: [BUG] erofs: LZMA stream state NULL deref after failed dict grow
To: Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>
Cc: linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

z_erofs_load_lzma_config() can leave strm->state == NULL while still
publishing z_erofs_lzma_max_dictsize. The next mount of the same
image skips realloc and decompress NULL-derefs.

Type: null-pointer dereference

* Summary

       for (strm = head; strm; strm = strm->next) {
               if (strm->state)
                       xz_dec_microlzma_end(strm->state);
               strm->state = xz_dec_microlzma_alloc(..., dict_size);
               if (!strm->state)
                       err = -ENOMEM;
       }
       ...
       z_erofs_lzma_max_dictsize = dict_size;  /* even if err */

On alloc failure the old state is already gone. The next mount sees
max_dictsize >= dict_size and returns 0 without retrying. Then:

       xz_dec_microlzma_reset(strm->state, ...);  /* state is NULL */

* Affected

622ceaddb764. Needs CONFIG_EROFS_FS_ZIP_LZMA, a microlzma image,
and a failed xz_dec_microlzma_alloc (fault injection or memory
pressure). KASAN recommended.

* Reproduction

1. mkfs.erofs -z lzma,dictsize=4096 lzma.img dir/
2. Force xz_dec_microlzma_alloc() to fail on first mount
  (poc/fail_lzma.c: kprobe sets dict_size=0).
3. First mount returns -ENOMEM.
4. Disarm the probe, mount the same image again (succeeds via the
  max_dictsize early-out).
5. cat /mnt/payload

KASAN: null-ptr-deref in xz_dec_microlzma_reset from
z_erofs_lzma_decompress.

PoC: poc/run.sh. Use lzma_streams=1 to keep the pool to one stream.

* Expected

Failed grow keeps the previous xz state (or retries next mount) and
does not bump z_erofs_lzma_max_dictsize.

* Actual

NULL state + published max_dictsize -> NPD on the next read.

Please consider the suggested patch.

Thanks.

Suggested patch
```
diff --git a/fs/erofs/decompressor_lzma.c b/fs/erofs/decompressor_lzma.c
index 6b0cdb446c6a..3719c6f83f8a 100644
--- a/fs/erofs/decompressor_lzma.c
+++ b/fs/erofs/decompressor_lzma.c
@@ -128,11 +128,16 @@ static int z_erofs_load_lzma_config(struct
super_block *sb,
    err = 0;
    /* 2. walk each isolated stream and grow max dict_size if needed */
    for (strm = head; strm; strm = strm->next) {
+        struct xz_dec_microlzma *state;
+
+        state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
+        if (!state) {
+            err = -ENOMEM;
+            continue;
+        }
        if (strm->state)
            xz_dec_microlzma_end(strm->state);
-        strm->state = xz_dec_microlzma_alloc(XZ_PREALLOC, dict_size);
-        if (!strm->state)
-            err = -ENOMEM;
+        strm->state = state;
    }

    /* 3. push back all to the global list and update max dict_size */
@@ -142,7 +147,8 @@ static int z_erofs_load_lzma_config(struct super_block *sb,
    spin_unlock(&z_erofs_lzma_lock);
    wake_up_all(&z_erofs_lzma_wq);

-    z_erofs_lzma_max_dictsize = dict_size;
+    if (!err)
+        z_erofs_lzma_max_dictsize = dict_size;
    mutex_unlock(&lzma_resize_mutex);
    return err;
}
```

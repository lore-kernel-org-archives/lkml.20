Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C312339768D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 18:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790621956; cv=pass; b=pkDCxvwM89mkqE98uCeleWm6oICgJ8h/5lB04TX5AoKGisrJXEQXtH8OYS05IHb7e6PE7+2i8s76zTXnEuaWRcyqG3+dCl24ykiXwkMWlHkOuvsO9WwhgCjeFmGrlYbDhC8cTmwcScD+O43Xhe3wKdQznw4VECQWRVuFPHSNeS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790621956; c=relaxed/simple;
	bh=zbxh97DfahtmVFw2yx/P+OI0PpzLVE463PD6gyDR+VQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=lzvlNL5+OLeQ3+oT9friphqobN5S3Cmmto5k6dbybaSraigKovrwiPwU5dOQ6+D9DH4rCRfA+HA2HFUZBhGbCbWSU7eUnXSOS6gUp8vK0D9VlEdRxYcMUMGu804aBpx3MM207JxsedaBjmfixRN7pRmUL/+B7OLJEwyWD5uKq74=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ALNlkfXN; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ALNlkfXN"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f35f74caso1703291e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790621950; cv=none;
        d=google.com; s=arc-20260327;
        b=lVRCrsnDfDjTfRSb+IE9NvXax8Bxa1BADRbeomGdFOCPttpdO0Xid7ZBtNfW9xvJLZ
         buGZl86dWORsFJT+/FXIC9cmVGnJiYrhXXFSOEjaDpGwp3UkrmxUB90JfnEahF3n2ncq
         6+D8KoL+dGJy50FFlyE3NhyiPtZHCOg1ni8pynAyGP/siY0eBr7b2o43lCj2p5cDNDM1
         S7MsBxnxz4RaLiaL8PvPsEdfqnC8tFeCM2S6OjFvnyCV41e0ZLacCoSqkYpSN2Gj5v1D
         zJrxsagJCDziSEWcTx/g4UcnJ43kIW8gEF3gwHbG+CbwMOti/Z8VjXxCmt+EYxIqA1x4
         ntGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:sender:mime-version
         :dkim-signature;
        bh=2mj3lyrm7aE/R7y/QOz0OagCVKj44YeS0Sz+Yo0D/po=;
        fh=Ek7UGwBSeWaGsU2c73PPBmSIRCmOYYpouwuHFMeOe6c=;
        b=JbuDZvbJlDCvo6ZNcdK7FAx0bntGmGY3jNDs1iKn3+rk1EqaBaCBq0Qs2uW62Xf/qA
         8zrxqSF1enzOuYnwkqZPU6YR32E2mKtjenqhfI2GmiIM2X8FGrwjeopY2kqUDYG2uB2e
         1w3907Lgj6JNmuvoNAf/zDojkTIPln7ODQlkXYl6+gRQhhSseOJrYSYanmfN0KeAb46/
         2hpsi4UPqADux1jM+x5If0Z+1K/Qyy+vXyeSxb7Ifgo193e+Uigtqqc7IsyydYBzvXPe
         sO39M1Gr46abFiNvtzB1fniIm/YaHgzMf6fYQsFpoepUclWtXIq9fytLQZUqWFtzYvXF
         NHig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790621950; x=1791226750; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2mj3lyrm7aE/R7y/QOz0OagCVKj44YeS0Sz+Yo0D/po=;
        b=ALNlkfXNuHGvk48OfekmkexPjAHnoMbcsmSB3p+GYTqQ/2wliYgKPKzGrseWFJNf6a
         5qOYy+y/brxPI6LgihssK3ElXOsT+OCYvaWcIgETehpKUIX/SFwoaXpkwcRNUIGDeySX
         +1p9YXd0w7CLVCkYd2X+RVRUwm11tnWty/dnVv9uzJtFBBr7Ulin5dikMzZwJDnKzFqi
         A8dbUJl7jQzgVOovGH2WaXL3ClgPnPimSBmDQjwv6/ECl45EfrEU6LPzPm+f8I1s+0ft
         qXJWynVqFiJbAf6aBJX/oDRl20hV58+2IYhqihGcGvbVWIzAmyJzrRLVq1fKvz1jAPUc
         DlqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790621950; x=1791226750;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2mj3lyrm7aE/R7y/QOz0OagCVKj44YeS0Sz+Yo0D/po=;
        b=gmfrMcA6fZ9VHZ2IFIPxGDCt0eN/vRj9p7GeMgLxVLKZ3fHqiaD5SDLzYr5hlySEt7
         CPR2FPsD7ac0mzoHHLNrDXCG7sL7nDrUoqEccz/QFnIYxFCghTPnUAVzw8dUZTEvEep2
         AaoGtLM6x9/brUatb3j/P1VXVwW3PkU/Qa74Uk4eKxod21IaMFWyHfk/CDwx1mljrEnq
         jrx525+4fXHTCG9/vGjIPuK1o6BwknoPwWrhRco65c0AreQsLqrk1x/RU2RacJDHJq2h
         amGlY8yjBB01AdsopZGt6SNyv56i7oM2Fp6fHYc14WCd3N3dBUkCaVX6+44dCjtmc0Vm
         AoRA==
X-Forwarded-Encrypted: i=1; AKwUvByn4ZP3Vpi644L5AIMpWxg2DH/A+LQNZdxyw1dpa+4atCGzZanYcnDKwKH2irxh3GteUn6ulbRywSxVJDM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKO0MQ3LCyqoWEfUUQyy2LZcVybpuMpisz4dYg5ZRQWjlFLRRVx
	M+EB8YeakD72ZzhFOv9q7noRYruYn+LPjsGflmBFG637JoU3+GoCj2+XPAyjWT/xmd88L+2qoNZ
	KmFqUcGg1TyEpgiwA6gojzzENUutwiCc=
X-Gm-Gg: AYBFou2MoL2Fd3VK6wpC00vj8hz7yPLIcRI1p1UjSOPWUm2F+iBE3OxUdb28ESkPALH
	4Efrtbh3ZC4cINcD+lPnob6lEEgZwUVS6TKtFJWVpJrcjSF9YSKTaPnGWPz/WswFf043jflRNKC
	BDXI85c3G30fbyZC1PfzzipUJUl3x8G7JHHN+hwA/dd8aUu3hijjgRiyFhDOMAOSlViMgSzodI8
	4t1OXqOraAf5KQ7s5Q22Kd2x8Xe9pRRjPPPo5m9+b2YYpSeFnOYkKBJnsdL1LO2ny1doi4OrGFz
	77iSdvBCVVesx8Nm8b9gX9zUm1lVqydYe8l1GO/sctqqaIdVuMW+E8yRX6ahpKLYB8zbko6q7BY
	A6xSniRBAmD5u
X-Received: by 2002:a05:6512:230f:b0:5b8:f30f:7cfe with SMTP id
 2adb3069b0e04-5b8f30f7de0mr2381443e87.36.1790621949786; Mon, 28 Sep 2026
 11:59:09 -0700 (PDT)
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 11:59:08 -0700
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 11:59:08 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
From: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
Date: Mon, 28 Sep 2026 11:59:08 -0700
X-Google-Sender-Auth: yJdVTHyK8StYuaczuakEtPmSH0s
X-Gm-Features: AclHuK-Xz52AgVCzLAZuF5oizm1zR161dvYMBuInRdqEcsrUcYBfED0bFxZLpG4
Message-ID: <CAANnmVB6Wu+vtdmg+S5uZKkdYMA1gOSQBQ25SpSpasKG9U-1-g@mail.gmail.com>
Subject: [PATCH] fs/adfs: check name length of big directory entries
To: linux-fsdevel@vger.kernel.org
Cc: brauner@kernel.org, rmk+kernel@armlinux.org.uk, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The F+ (big directory) entry format stores the object name length on
disc as a 32-bit value, bigdirobnamelen.  adfs_fplus_getnext() stores
this value in struct object_info::name_len and then copies that many
bytes from the directory buffers into the fixed-size obj->name array
with adfs_dir_copyfrom(), which only validates the source range, not
the destination.

Nothing validates bigdirobnamelen, so a corrupt or maliciously
crafted filesystem image can specify a name length greater than
sizeof(obj->name), causing up to 4MB of attacker-controlled data to
be written past the end of the array.  Both callers of ->getnext()
instantiate struct object_info on their stacks - adfs_fplus_iterate()
via readdir() and adfs_lookup() via path resolution - so this is a
stack buffer overflow which is trivially triggered by listing or
stat'ing files on a crafted image.

adfs_object_fixup() also appends a four character ",xxx" filetype
suffix to the names of non-directory objects when the ftsuffix mount
option is enabled, so name lengths greater than ADFS_FPLUS_NAME_LEN
could still overflow the buffer by up to four bytes even when the
initial copy itself fits.

Reject entries whose name length exceeds the maximum defined for the
F+ format, which also leaves room for the filetype suffix.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
---
 fs/adfs/dir_fplus.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
index 4a15924014da..ec663bc12a92 100644
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -192,6 +192,11 @@ adfs_fplus_getnext(struct adfs_dir *dir, struct
object_info *obj)
 	obj->indaddr  = le32_to_cpu(bde.bigdirindaddr);
 	obj->attr     = le32_to_cpu(bde.bigdirattr);
 	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);
+	if (obj->name_len > ADFS_FPLUS_NAME_LEN) {
+		adfs_error(dir->sb, "object name length %u exceeds maximum",
+			   obj->name_len);
+		return -ENAMETOOLONG;
+	}

 	offset = adfs_fplus_offset(h, le32_to_cpu(h->bigdirentries));
 	offset += le32_to_cpu(bde.bigdirobnameptr);
-- 
2.47.3

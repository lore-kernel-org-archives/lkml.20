Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440511;
	b=3xzdzEisEx2Pd2gjdiWDb6vdjRgcDdguyt/WvfMK6pKWpFJcq7ML8MTIgHSnn5cvxcWg
	 gQPWYo/Dt/zewx8ElKuIUyt+t8B6RdW34vmezzH3nBXkNCpqapWlt0IOVCgwJWCSABKvN
	 ubmg1PYti5fGVLm3zJR+g02bj3wJADexetMvkBrW1tuRI+yByWbW+tXx5qALNrZV+wz4C
	 umAxaxN6AhiqCzpXwZlczlLmIAUZo1PiYtki46z5gcdWBrr+Ej7sezU3C14n6wgwst8z7
	 ysD02dLe2uy3A5dvH90AwDmVmMezRmnSVK5M4xCmN0bnwf3lUp6hab2v79FQTqbTOcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZRdXRrWaH3GXnj/xf+WF4Od3Gq+lG/ySQbyFtokDobQ=;
	b=vAyarVgwwP9gT7/G9PGANcJHcYBVo8DmF/TqgqJjdoD+fGdDFdEldpstE8eLYmmBeByY
	 ds4eo5HrRYI5woYIQv27eBMn9fOy/oX9uDGGyrTjm9sYrMkxJteIJHZhu5KnWnFvR7qNs
	 mcb2I0Ck4zev7kQt5XgfSNY03LNTOUFax+yCPVKQ6CVeSfzGXnKxLoFDJ8ia6BsEKrvM8
	 RuMVXuT00d15VToBwXVA+kpAPI4gwyT5xISLNs7XEEabnDp4eu+7XOy/Z5+G8jeJQC8dp
	 EHej5sbWfKh/J9KxqV1r2L1fldKWjYzn/XCQ22+oA9za/mSGbLP+NCjqrnUMPsGswNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2Qh507H;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A3C606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8A3C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A2Qh507H
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d885929so1213338f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440509; x=1794045309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZRdXRrWaH3GXnj/xf+WF4Od3Gq+lG/ySQbyFtokDobQ=;
        b=A2Qh507HjQmeA+P5m9XKhryYbdN17f8lKZGAWxv+nA+hICvwXHyi0LcTij2wosUvp9
         4T65S+6TaCqcUcWn5ZHncrl2EgOPVXsrxszLH3BT+nWa9T9s3U+uhdm8xtaJNmag0Hxk
         X9MIg4QnRZ82ONsxf+wgvsWa0D16q+cPDPkRZHGuDnEEXmkrf9UCXjZ3/758k38PLH6N
         QEolL4+/5vBJiHSpZPmG8GPzEAuQOp+cQfwjjZVO6jS9Hwzzf71bEx2GHHyiDMh199f9
         T6YXT0njlhFl5YkocjUKdhtqvluDoCaRLRtoHAZj6/KKwjubfvlSbvjENsT/TJ2NzC6O
         6GPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440509; x=1794045309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZRdXRrWaH3GXnj/xf+WF4Od3Gq+lG/ySQbyFtokDobQ=;
        b=WUxJFLX6EtFMbjCP4RC2UK0gF0F6ga1VZI+03No5UQ3LvMapUvlBTXJTNADgyjNI6Z
         1gu48uSeDIiX6Hs6VCjhJ5ELhhfh7YFyqMn59HObeYPUenGzioLEtOfvDJi/ISQq8bZD
         HDN1NqoOe+B0/zwEAMSjDk2kowLPMJw0/EgabRpAMdAlB/3Qu4UUmMDGZEEe4jbPNDY3
         UB2FnU1YsU3rk1OL1SvN7q0UiTnHrVuS9VunF/r9d8vCbP0MV3lbCiw0LcwJhbqBiAeI
         MjTEzcQC0dTGVP8Cmt1zBw/M46aKbDzAJCixEvhy5mhk3nbrPBCTVHNH5Era+zCfx/G0
         6snQ==
X-Forwarded-Encrypted: i=1; AKwUvBxROm/Jg+DPMVCKBF9uTsMFXcO5NI3EfcaLFJ4j8EBLDPr9eRr3fx8FgT/kzxawi1+l1bQIEhVFvm4IU8g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIPZQgQPf/mJhNfn5BoPcNPkRSrbx1eULiMc8FfecglGEo9Uzu/
	z9/1REq6GA0QVL0uOgcf6XRyJuDoXB1JgSX6iHiENMGzGkNRAYjTRwmT
X-Gm-Gg: AYBFou0Er0gjUGdzLnPfUE3+7Xvj/pBDYkDV06vdW9CdrnbAg/zs9MGozReCmP1Up6V
	zsqTyBO/PS0ST+A/DAEH7qJiiWNbpKdeveTnmLi23hDbozoQTHPEcWhdh3hVyotJ3rBHzHzGk3Z
	ZXgzkReg5zSa/1lbOPHT3FAul0FoUc0/LM7KRdepTlNMiTVrUxJ5ufuD23g+RQRwVRN4oE1BmeB
	8QepblsxSYofqQtyo+kRWiFuvVbi0js74uPCWvcMId8s41ZpifSYFYNqD8vg/npFteRnGEqkmLf
	iVR0fNS+kILW5XbsOsHXgoAKz4KvCi9recyCPsZ7+svMSFM+4FczqQto7xT7z8s6JYc3AtzB43T
	r3nuKrf+zJgwXR4rDi7QLm8mlJgyJMO1xVy5Tv3KFLhUaqjiRd0KhBo3sDgsP3YjrksAE+YdAUO
	KHYJ4arzQCpMeHFB7pr/XDxeDDq61z/MYUq87vI/aR/G9R6XE84x5C0ie9ay5jtw/r6aD7ZT8YQ
	BL7L88PF4u5v7EqFkEUFExv9E8OwGPkjY6XED5BO4bSsvb7AIF3H5ZgRnk57hbNGWIm0aqnji0E
	Qi9X5EeU9QR5XtkVuopqJlW71YgWn6YinbJMfr1UMDTFMdJu4uQUWtEIj3SMQZohHQRZn4QcGDh
	ksg01rFjiMxqIWAx0VPfZJWbaNceOU9LU7fWS2+9wbyzz7mAFhzMRA/yOfhdxx79JrvU=
X-Received: by 2002:a05:600c:4752:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4ac18e5d4d0mr113107915e9.29.1793440509125;
        Sat, 31 Oct 2026 02:55:09 -0700 (PDT)
Received: from archlinux.tailbe3ea7.ts.net ([95.173.233.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a6bsm7869505f8f.27.2026.10.31.02.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:55:08 -0700 (PDT)
From: Ismail Tarim <ismailtarim7@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: James Ogletree <jogletre@opensource.cirrus.com>,
	Fred Treven <fred.treven@cirrus.com>,
	Ben Bright <ben.bright@cirrus.com>,
	patches@opensource.cirrus.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] Input: cs40l50 - fix OWT upload length
Date: Sat, 31 Oct 2026 12:54:34 +0300
Message-ID: <20261031095438.3070451-1-ismailtarim7@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cs40l50_upload_owt() passes the size of the effect in bytes as the
val_count argument of regmap_bulk_write(). The cs40l50 regmap uses
32-bit registers, so val_count is a number of registers and the call
covers four times the intended length.

regmap_bulk_write() copies val_count * val_bytes bytes from the source
buffer, so this reads past the end of new_owt_effect_data, which is
only sizeof(header) + len bytes long, and writes the extra data to the
DSP beyond the end of the uploaded effect. The free space check above
only covers the real size of the effect, so the write can also go past
the space reported as available in the open wavetable.

Pass the length in 32-bit words, matching header.data_words.

Fixes: c38fe1bb5d21 ("Input: cs40l50 - Add support for the CS40L50 haptic driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ismail Tarim <ismailtarim7@gmail.com>
---
Build-tested only (W=1, x86_64 defconfig with the CS40L50 drivers as
modules). I do not have CS40L50 hardware, so this was not runtime
tested.

 drivers/input/misc/cs40l50-vibra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/misc/cs40l50-vibra.c b/drivers/input/misc/cs40l50-vibra.c
index 7ef4534fe..68f0c40ef 100644
--- a/drivers/input/misc/cs40l50-vibra.c
+++ b/drivers/input/misc/cs40l50-vibra.c
@@ -250,7 +250,7 @@ static int cs40l50_upload_owt(struct cs40l50_work *work_data)
 
 	error = regmap_bulk_write(vib->regmap, vib->dsp.owt_base_reg +
 				  (offset * sizeof(u32)), new_owt_effect_data,
-				  sizeof(header) + len);
+				  (sizeof(header) + len) / sizeof(u32));
 	if (error)
 		return error;
 
-- 
2.56.0


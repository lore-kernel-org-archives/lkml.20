Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792998586;
	b=kfejKnldAUgBAYn0guZ3EbWEfMuESzxN1uVqluLXCkYbEUYkL/ZkdUi82GPa4xaWeqEd
	 KcigDu3m7kZcfZKexdAB8Lz9NLaiTo2imQIZ+iBH/sTj2JYFTQ6cGOae+autx/s8bTj+u
	 V1fYT8FU8fsBzLXe4YOkZVVNyT8pP4bjCb23+/T2jZW3rw0DplRc65jmshEbiKwNiKj17
	 YjtkletRUnlR/vWqrVc9PMbvQ4s5IMdHoqROOpvQ/EOhbhQjgppLc4vYygg/NWMtCLsZn
	 CSn49DxYhKmvC4ug4sNKYk/XpWN6nkZkoRzgm7deSUkXNWF6Nnrv8pMgh3Qcdnm9PcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792998586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:In-Reply-To:References:Message-ID;
	bh=NhqYyPv74NL/BY6caRQe870hWekwcUFmd+4G2FhAc5M=;
	b=2aaLNVK9yvdVoDXEP75K/wmUtwxSHPmVbzm88pWmxApO2DY/PKnAzid+wjNQU7sBZpH0
	 rFNaxi6O7mIotYzGMjAtaPIYQMpNIAmg1KIp34xST/poNp/IQWcbGYcJpl3jU9aVb981J
	 NUYzSrKolJeoDLoh42rdHps1fxtWSgd/owVwMIXqOswVvYpAO+UhzwZE3KmKzOq1z9hnY
	 qTJjVg5t3n5v4Rl596YyqiQzCrspOD9MhxOTXe5gIsexaKyuMgib0445VW2qf2naX5OXC
	 4jBRIkQomLpDzgn3VqNGc7LomG0P+J+hCfHvrGw98Tdzsok+QNpQFoFyQRyIjIZBBUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hIVZI9MQ;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0720F606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0720F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hIVZI9MQ
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c46d41f6af3so109593566b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792998584; x=1793603384; darn=vger.kernel.org;
        h=message-id:references:in-reply-to:cc:to:subject:date:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NhqYyPv74NL/BY6caRQe870hWekwcUFmd+4G2FhAc5M=;
        b=hIVZI9MQ73cXW6Kmn6e0cAksfZ4gsTv7dtZ5OsKF9feAnAQqHS7NDz3YxldxISW0uj
         4Pm/DREjJs1ym7Fr9NPHyl/ZC0hG8sNjlGOrUE7NTEnHB6mKewfEGUq+EFffI3vCWLuc
         oYcOM8kbxycwpGeNOREdPORvxnkUcGmCxQDr3qeA8tz8Smj45lsVTBguK+gigyCQO5kc
         hQ8HqulTfI3ypyOV8oWBcLVIC98SW4M8vNBanhu1CKlZnvBlVXsjD6Izeub1jJVno8mP
         nPzGsCaaztZH5pKYOkwfKWGeBiTttUmSmFnr5fGy+rqhoIGtDjYZ3/IcscdgLCIDirq7
         5RtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792998584; x=1793603384;
        h=message-id:references:in-reply-to:cc:to:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhqYyPv74NL/BY6caRQe870hWekwcUFmd+4G2FhAc5M=;
        b=EAbZWK6njNVz5eoHyvTtmWfjsF99N72FHfcCnxJ93pWQM+hpiBAiECZ/ja06lnqdVK
         KF1y+7IkTwUOajYBCR94VkkyuLUpXaDNg0JqRhKthoSoHum3zW4bEvZbux/2sRYMsMbw
         EVm1qitgOqrsNlv+kPUUH5hiYIDDSMEdTuswA4SgsBFBXm5GGcnldc7yoZjzARmpUhc/
         IhdtIEQUaROc0Zerq3NGz2wJUvP/C5PYu630IvZ3LcPF55E0RrkHDRUj7e+tOsHzlpA3
         KeePX9ahHwen8zNpzbOsqP+QaXM2If6GWrYeC3DOipYPQD7tcGL/yODcKHn8fEh4SKC+
         geRg==
X-Forwarded-Encrypted: i=1; AKwUvBz69ic2cvw2t/wJJVosFHSPBncThDSuXF6i8yTEAzgiOBKcll/kWyKJb2VB1mbDFn68Z6RDu6eGRdNK2cU=@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Xuyj10QSAkgs11LoFxta4r0vAn2PgnTKbwNbdvftDDMXKzcz
	rOS1JDsp2vjK4Qjt/hj1JghSmDfPfgR9hJgBymX9b2Shuof3IstRXXoD
X-Gm-Gg: AYBFou3zEIgcVGmfavOiKljI98XLha3ZxFBhjeu5quznCcp98J/eIEyLG0t7N50vwKH
	qGLWdPQZLUgqo9lBszrdXCNoXx3wtbL3WlUw76Z2C0RhPUfhi4hpPnDOjXW/+8FtyFjYIl5jqDC
	G6w/fAMyAcVL+wjiDUSOk0sxU/BcCqB6Qgg9vJGmaNTau0Bc8AX552+MuTC5/b6i+uu8E72nrYZ
	CBlvT8y8UZhU92vS+fMCt15x7gXa8KLlX61vgiQZLqKNiFKd+RBGc+AHUqCUQx5Ftmfh4yDk9iU
	IovBTH8ipZODP/YsWqNgu+U75U8wnpyKBTn/23s/1rwgm/j3uy5UNah+LpH/SB347BuvFyku7DH
	DCXxLsxtFnK0zuUA3c/OBpjH+qt8Xc0JQ2U+spaMngmzV2FHFjvIQOlCblmhI7hO7Gm4LEOqk1g
	6qi/Z6Pky2bxCgnD66V0bmY2RIHUiA+HOIeqN7dMSb6hBEl5htDDGp1lGS+Qc0Z5XfgmIHi6gVE
	FNtIYKaCEkZAr2M/yr2ATImsOzY1phtVttt1j6EHwJMP26Zy/ffyO6+FVZ8
X-Received: by 2002:a17:906:c155:b0:c29:f5d8:9c73 with SMTP id a640c23a62f3a-c46bde6e440mr782878166b.34.1792998584236;
        Mon, 26 Oct 2026 00:09:44 -0700 (PDT)
Received: from [192.168.1.182] ([188.241.197.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445991e83sm3363345a12.34.2026.10.26.00.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:09:42 -0700 (PDT)
From: Konstantin Nikiforov <helllamer@gmail.com>
Date: Mon, 26 Oct 2026 09:21:09 +0300
Subject: [PATCH] md/raid5: complete unsupported discards successfully
To: linux-raid@vger.kernel.org
Cc: linux-bcache@vger.kernel.org, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, yukuai@fygo.io,
 song@kernel.org, magiclinan@didiglobal.com, xiao@kernel.org, colyli@fygo.io,
 kent.overstreet@linux.dev
In-Reply-To:
 <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
References:
 <CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com>
Message-ID: <179299857972.12222.2729359466842183358@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Since commit 90573092673c ("md/raid5: validate discard support at
request time") raid5 advertises max_hw_discard_sectors = UINT_MAX no
matter whether the member devices support discard or
devices_handle_discard_safely is set, and make_discard_request() fails
the discards it cannot handle with BLK_STS_NOTSUPP.

Before that commit such arrays did not advertise discard at all, so
upper layers never sent one. Now they do, and the failure is not
harmless:

 - bcache forwards discards to its backing device whenever
   bdev_max_discard_sectors() is non-zero, and backing_request_endio()
   treats every non-zero bi_status as a media error. After io_error_limit
   (64) of them bch_cached_dev_error() stops the cached device. On a
   machine with root on LVM over bcache over a raid5 of three HDDs the
   root filesystem disappeared a few minutes after every boot.

 - btrfs enables discard=async by default on any device that advertises
   discard, which is what generated the discards in the first place.

Discard is advisory: blkdev_issue_discard() already turns -EOPNOTSUPP
into success for its callers, and md_submit_discard_bio() silently skips
raid0/raid10 members without discard support. Do the same here and
complete the bio successfully when the array cannot pass it down safely,
so that callers submitting their own discard bios, like bcache, see the
same behaviour.

Fixes: 90573092673c ("md/raid5: validate discard support at request time")
Cc: stable@vger.kernel.org # 7.2
Closes: https://lore.kernel.org/all/CAO96y0V6oncv54ihXnHfJMYiG_QAQ-NM8BOdqPDXKL8r8-kR9Q@mail.gmail.com/
Signed-off-by: Konstantin Nikiforov <helllamer@gmail.com>
---
Kuai, this is the raid5-side change you were fine with in the report
thread. Reproducer: raid5 over three loop devices with a bcache backing
device on top, four blkdiscard calls on the bcache device. On 7.2.11
without the patch bcache's io_errors goes to 4 (bch_count_backing_io_errors
in dmesg); with the patch applied to 7.2.11 it stays at 0, and the
affected machine (root on LVM over bcache over raid5 of HDDs) boots and
runs with the patched module without any backing-device errors.
blkdiscard on the md device itself reports success either way because
blkdev_issue_discard() masks EOPNOTSUPP.

One correction to my report: the "discard_granularity is 0" observation
was a side effect of my own workaround (writing 0 to discard_max_bytes
makes the block layer report granularity 0); on a fresh array the
granularity is the stripe size as expected.

 drivers/md/raid5.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index b91545ce090d..b462b18e47ff 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -1144,7 +1144,16 @@ static bool raid5_discard_limits(struct mddev *mddev, struct bio *bi)
 	if (!conf->raid5_discard_unsupported)
 		return true;
 
-	bi->bi_status = BLK_STS_NOTSUPP;
+	/*
+	 * Discard is advisory. The array advertises discard regardless of
+	 * member support, so an upper layer may legitimately send discards
+	 * that cannot be forwarded safely. Complete them successfully
+	 * instead of failing them: bcache counts every failed backing
+	 * device bio as an I/O error and stops the device after
+	 * io_error_limit of them, and btrfs enables discard=async on any
+	 * device that advertises discard. This also matches what
+	 * md_submit_discard_bio() does for members without discard support.
+	 */
 	bio_endio(bi);
 	return false;
 }

base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
-- 
2.56.0


Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB95535E94E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 02:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788315124; cv=pass; b=YSXyy7ISfvhF5vGrFg9zYQOkOrWzPBoIyGVpk8BCDi0RIKB56YdZvnX/AFDmkw7yYEOMzyTG7ajHFCNfbQ9Gt8AYPdPBon0k5Gj/s3ALH91plWftEanofwdAnrKb4YRPtEr/JoFkPi1AlnJF59owWlMQstkZmiw8f655gzF/+ko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788315124; c=relaxed/simple;
	bh=m8dMhdjgbxNUNzyBg0Mvg7t7wUGshuRTgqDq2yP8CA8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=df538B3mCDTd2vXKzFV3FTdOeTfyDl6A/jnAAZk5kDjlvmjM48g4ovKTd3E4rLlTa4CqNF36KG+x20PmhHsBM5N2vyFg2i/RjWPPZ0tfElJz9+HEjjNbqeZ5tGa3uwTxXl6oT9qbNd/D8Yl7RhXPfb4Eq1crW6W8BR94rLBjC0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEeJ/F/v; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEeJ/F/v"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a6868f18aeso160949a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 19:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788315117; cv=none;
        d=google.com; s=arc-20260327;
        b=S8QfvVBVCBBjJ6D3N3TQep02trsQ8mntBcHqhgyK9sQoIeKTl8jNmwXxtVoIuboUyT
         5EnAJEso9lR1E3zoRoeky9DyCYdLh8mO74oTuUCwgnE2eBdgpET/Cv8VGm5f94DGIef1
         fyHGgvaBOhfzF5zsjJbYi4CiY56RFjD7INa14JmMvz0lj3u5o2tCD1hh2XQrDWcaUt9F
         EAPt7BZdZnlCUYULQcbz+qPnM9pPLyACudXcJPf5VpzpWnHynUFiO6P0L0ULXFN4c1Pb
         f85bsIoT99dyw8F05ieQOcNRUL4FOc7bXtkEEuESmDoGOlvDVZ+D9H/OHFKHoGHmHjVx
         Ayig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=eDcze+EPoOau0aTnfHPEFG0SVyi8+C2I2+TXMMX9vLY=;
        fh=Uo0o09fHl00uTSdPas85Ba/ebx9orSSuCnkIKzYD7X4=;
        b=g0D0I+N81YZ9BGh8+dgSMROLCsnM1xO97yoLTDvE1CKmd6c2Zdg5dSs1d7xB6Q3HKK
         GG0iWM5AFt5IBqF+pMLvmgkA/VDFVfpOMTaSvhbUHaLeTuf01w6Em0o05bXpm1v08ypH
         eMNBRaGDCeJFlLGkb7BztSBw9vJD7xzP7Y9v5iNcW6wAqEZlkE7JwKBmmED2hpDmdLYs
         iI9tJkCiElz9tM20LK60yLPcLBOSEOI4+ygP85f53NP+hB3s9keO5xc1ADgCYwwwMIgY
         fthSo8qevlUDUK8ebvp69cC1cOfhO1aiWAokw9p7xuCsFhubglh0T1V6MGQk3BUfnois
         QrnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788315117; x=1788919917; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eDcze+EPoOau0aTnfHPEFG0SVyi8+C2I2+TXMMX9vLY=;
        b=IEeJ/F/vF5GMCyCTxHIzZbmt3tHnTeJE8jPTJ4seKUkuAlc4tv9wHr/U5Hkxijv2TM
         xO6dVs0273lmffBHsesd0ieeXU4NXRnO3Y5HT60pJwxxIbmzNNYRSfk04cCKrdWylinj
         QDKe3qaMlV5oV4LSb7Y0y+ZDmc7qKeVubeDYgjPkEQTCmK1wYxWyLDlRflK9hkOzTLlA
         TOqL4NvrHGmlhFWY0Vknv/75DvQDQE0M8aFPVSNMJ4sNmI1IdM4NFkyJhmKExmuwfnVW
         SlqeQ8h6DT9HS0jHuD5AQ1Ha1gSX7or/sp+BdeCisBtVJzc6mZ/u+G2ekMHoXO/iUNWN
         FQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788315117; x=1788919917;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eDcze+EPoOau0aTnfHPEFG0SVyi8+C2I2+TXMMX9vLY=;
        b=hd97rD7ZN8ZHhtllX5q+1gXl27c78cz2nVcw1LM3r+7WyPSiRrZ6iSo6K5D45bBHMn
         rh9M8W4vCRmAWAz3Z3NY/yTQ3IssXKA1MuLggdQLWnZF0aynV1I03SrdPUlVWKtRoJmm
         4HHWznfHA6L5XdNhnw3EiRwU7kiHrF7BLq+P1cZlkb3LQbwo+uuOAOhXsRzAu8wO4PQI
         x6JR54xNNOkoO+1WqyfsrWM+Ddf3+Lx3EMtNR8h0irLgAY+PE0ARdpG4eLQ54xY3/Sej
         fl4zxomF+dx6Uta90kTjK1D7LM84R+Hna/77Hnzc0PBfLQybKI4pEXiOYxmIM86zZqYD
         KN0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwqr62oqu4v9kPJLZ7yAjQBhVpuIwnBBsCwgMQ/3mH4LPKOt5nvyrxcBawcJwJgd+t3vAx+2bxsjQAHy+k=@vger.kernel.org
X-Gm-Message-State: AFuF++mVcvWF9+N7y/h1JWr3MsPjrVKoUeExTmmpbmdWnv+nGIy4ku1s
	MmkhG2nUG31blFROd2DLmK2nyj7N5fJ1mPmScsJJOZ+jlosEif3wnHG+THi0v2di1KdCLMSP4vv
	j0sdIcv39/m7JZgXEPIWVx5roXSI8y2E=
X-Gm-Gg: AYBFou2bhWWXXOhhVfKlfBKk7mUzJ63YU5RoQjVpH3o+2jCEpzOI/XIN52I09AJvRvs
	ltf7Y0SaeS89EFHH7ElGDca3oDsQ3stqy64/tn0aiPtqJapE/SoX+uzE44QB9Jgx8hQgPm77uz+
	vXnxD9X3igcEF5zANarRGZUKzEu4aFcLHA97dHTeekT33sbfNmpJXwCv69eCAyhd59UKNmyS4BC
	spJP+Cc/FBjF6vE9pan/TiK4QQcHmWAZ9dXFtuCkNGKro+JihCCVN9yhvX+eeG4g2T+UtElkYm4
	NTk2orBdqoI3iy2mXTLeFyPdFx6/QRdSZF06icO8h1E=
X-Received: by 2002:a05:6402:4284:b0:6a6:32f5:ff40 with SMTP id
 4fb4d7f45d1cf-6a682af8134mr1043284a12.20.1788315116598; Tue, 01 Sep 2026
 19:11:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Qingyu Zhang <usupergate@gmail.com>
Date: Wed, 2 Sep 2026 10:11:44 +0800
X-Gm-Features: AcwNN1WS-AgXw-xjU-Unr85m45__hVj5DZxPESU09yVatno4Yzj-jTHKyb7kYhs
Message-ID: <CAPBHdam702gA05btopOc=0mDpmzR5g4fkxOwXbxXkW6CPRaqmw@mail.gmail.com>
Subject: [BUG] gpio: sloppy-logic-analyzer: trigger buffer leak and capture
 OOB race
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

gpio-sloppy-logic-analyzer's debugfs "trigger" file has two defects in
trigger_write(): it leaks the previous trigger buffer on every overwrite,
and it races with fops_capture_set() so a shorter rewrite can cause a
slab out-of-bounds read. One patch fixes both.

Type: memory leak + out-of-bounds read (same function, same lock)

* Summary (leak)

trigger_write() does:

       buf = memdup_user(ubuf, count);
       priv->trig_data = buf;   /* previous buffer leaked */
       priv->trig_len = count;

There is no kfree of the old trig_data. capture later kfree's it only
if capture actually runs.

* Summary (OOB race)

Capture waits for trigger pairs with IRQs off:

       for (i = 0; i < priv->trig_len; i += 2) {
               do {
                       ...
               } while ((state & priv->trig_data[i]) != priv->trig_data[i + 1]);
       }

trigger_write() assigns a new trig_data / trig_len with no lock.
A 2048-byte trigger (1023 instant-match pairs + one never-match)
then a 2-byte rewrite while capture sits at i=2046 reads past the
new 2-byte object.

blob_lock is already held for the whole capture, including that wait.
trigger_write() just never takes it.

* Affected

Introduced in 7828b7bbbf20. Still present after 44f3468a0aef (unbind
UAF) and 7a7baebd9f23 (probe leak). Reproduced on 08dbfad3f504.
Needs CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER, CONFIG_DEBUG_FS, kmemleak
(leak) and KASAN (OOB). No real analyzer hardware: a dummy gpiochip
binder is enough (see poc/).

* Reproduction (leak)

1. insmod gpio-sloppy-logic-analyzer.ko and a dummy gpiochip binder.
2. echo clear > /sys/kernel/debug/kmemleak
3. Write to debugfs trigger twice without starting capture:

       printf 'AB' > $DIR/trigger
       printf 'CD' > $DIR/trigger

4. echo scan > /sys/kernel/debug/kmemleak

kmemleak shows unreferenced objects from memdup_user in trigger_write.

* Reproduction (OOB)

       dd if=/dev/zero bs=2046 count=1 of=/tmp/trig
       printf '\x01\x01' >> /tmp/trig
       cat /tmp/trig > $DIR/trigger
       echo 1 > $DIR/capture &
       sleep 1
       printf '\x01\x01' > $DIR/trigger

KASAN: slab-out-of-bounds in fops_capture_set.

PoC: poc/run.sh (both halves). poc/bind.c provides the dummy gpiochip.

* Expected

trigger_write() frees the old buffer and takes blob_lock around the
swap, same as capture.

* Actual

Leaked trig_data buffers; KASAN slab-out-of-bounds on concurrent
shorter trigger write.

Please apply the suggested patch.

Thanks.

Suggested patch:
```
diff --git a/drivers/gpio/gpio-sloppy-logic-analyzer.c
b/drivers/gpio/gpio-sloppy-logic-analyzer.c
index 044d81e7cafb..a0fa0755368a 100644
--- a/drivers/gpio/gpio-sloppy-logic-analyzer.c
+++ b/drivers/gpio/gpio-sloppy-logic-analyzer.c
@@ -213,8 +213,11 @@ static ssize_t trigger_write(struct file *file,
const char __user *ubuf,
    if (IS_ERR(buf))
        return PTR_ERR(buf);

+    mutex_lock(&priv->blob_lock);
+    kfree(priv->trig_data);
    priv->trig_data = buf;
    priv->trig_len = count;
+    mutex_unlock(&priv->blob_lock);

    return count;
}
```

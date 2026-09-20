Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA792331EB4
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789921667; cv=pass; b=jGecKLX0Xfz3UDyA79M641eej8eoRlCcEh3Xf9YZ38PsiJ+hxY5SbU1/r0PchzYtahYI62rj7wnUVn12HiAPmtc3gduCEsONw+Pld2Cv0aSgvMX7fXx6ALkhYoTBEJ+tWE7HyWsWx6H8f1Vg9NccfhS6ApVYobzXJ9tXeMrWIo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789921667; c=relaxed/simple;
	bh=avM/l9BU5JWE8PpCWk7n6bBHBFYjehL3joo4vq+2G+4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=PMgFUlewclhWOVAUjN47YgQbmYDZPnLMUbULyqfxkdUa6t+9SBGJQpYhPyOHPwcrx0MeHlJl86loCsFTRVI/fSLc1gO0lSBtbTUb39N0HWaLawT/gs0tTIsJrrQNDdC4NR+6MXFZHCjWnvpa0R7w9e9dEBRVRkN2fnqwGrLDkO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CjdqwEVt; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CjdqwEVt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912df756so15134365e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789921662; cv=none;
        d=google.com; s=arc-20260327;
        b=fMRhUWEatsEOC4pQuRFwTRQBTPv9Jgajn7eWvKHcx3e64heDrNiOWX8y8fodNuolmO
         zInsukHGSegvsYV6GgMTyWk2cyYMo59qy+5/b5CqzYQCb3UkpXLSogIpVmQ0in2OK9nY
         n+LVmpa0xDhxwjsaiAtTYwLydpj41LZYbjyNOaoZYeGc8P7gBsIL5M/71N2gYX8FJNgq
         ks1LLl9QcHwkszY5QXpX5UZD6VweXKZSxUYTV7vQSanBdUikWKk/3q4iz+efV71a8er5
         ObZQjmtB/ZqRAvXd9qwznIk9MaluG7ElugZJWH8hIZKe14+31xs08RSQHeYbsVJw+N3W
         t6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=OOHUUuKzu4rwfHW3wNAWtip0q7hVj5PZNv1z25ySe5M=;
        fh=ceYJA/YKMM6pHVIW33NnJaj0wO9r3RvziqgL+oO8mD0=;
        b=WJiU1prfA0NsjIFcBpjyOAqEZZOKCKj5zvvzXstNHzAVBU7avVlk0BfJofjYXB2NYX
         Wqi/MdiGqZBFDb/uIdYMKWzpOmSRpQZSXd/wOYDrmXkPA7RRR4pI/3mhVjSLywWE3U/e
         JsUB8/zmJxKgP+DN+HgF4PYvGNYWEAYDSLK/jEJ0OTudzn0SFImNiNg7lpTPvQWAZffF
         7NOpaJs80gO8thJlMtvrOC1PO8IOU82VvsqM3rMXcHcNMZIz9I55zHTwB5Z8R5wY4r3z
         Wn+S6ghQ2eUWW/IK451s+UU8vT1jOztIg3bF2uFh3A1xTiOfsuwHSgRyTzDNfuTgERwm
         NZnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789921662; x=1790526462; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOHUUuKzu4rwfHW3wNAWtip0q7hVj5PZNv1z25ySe5M=;
        b=CjdqwEVt6/PLNHA+vgYp4tmsMBlc5QRThjhOTbqlM3LXXImJ4MRwQFXGcr7amL378T
         xraBkcCEORXW11C6rGEw14Iefv87G07Mfw2m9rBNEtCBKAOhzz4vEdm7KVkcfEOl+iL3
         XrW+Y7k+cP5nMRXCxSB3F0fQYIGSGzNltiRjjWTzO5SAdh8KrGAsIdotIt0Wv6ae/vw1
         DVgbZzBSEOj+OL7RU8bBAm6Aj+InAo7/mj84ChR2qWV+wdCJigJL9le/Vso2SzlbjFVW
         WacIvG8AqT2jq2ghsOhJBQKO/qknGKNAix2QmiFBLqGMqLaOHRRs8bm6BR7jdG7wkk91
         pyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789921662; x=1790526462;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OOHUUuKzu4rwfHW3wNAWtip0q7hVj5PZNv1z25ySe5M=;
        b=a8EnZiYhHoqob3Azm9Cj5T/SVFhqDgdYKOa0tvYP+iQM68f+JkydRtEqxGr2pEju3C
         Plrhn/d3l1Vfuue7IVzHkp20NdV+q069MxmQ8LPGlVPudNobLouH+X1fEQse/1JR+JEW
         1JQSQFxJT0w23rpBxX80nnaR4EDIz/NUlZPYO6NdEhQTCoGXxNvqbTFmwhaTtXeoWvtx
         rx2ykpVSvqsyye1g2KBDgLUtIbip8CZYOgWaNITZECBPfkVNHCmtxaOlybqjBcv543/J
         bVR5OeQooipubcQSluh3Yp/97YqqpcCt86tTNYH47w1q0X8ogBhP+kf+nmy7AWcF7HIG
         hGWw==
X-Forwarded-Encrypted: i=1; AKwUvBw7+Q1zqlXZFdunBYKL/uG1oEocZy7JjmOQAQyD3XY5u/TAiKKwdjqmFf//fhB0chvjdzi0lLk/9Ur7MEE=@vger.kernel.org
X-Gm-Message-State: AFuF++mNMH3zquc3DHTKEcRL3jzM0nrfLZS34YAIgS3fLoP13LAMIWTk
	wDunsWyZwqCctpqE0Xl78Arbi3ou6p+373fgq6Xw/IixhdtACIP1SUqUJ2qsCsBQPkyLbebeB8f
	ndxwNbXzm5SLx7PldMEXPlp5Lz26GH38=
X-Gm-Gg: AYBFou1DBlMiUbYekMCKhggCcHE3zx8ESr8r1g+r8vm3cGxZluuI1OHLYQH8uv8dp/9
	oVLi2CJa591cHAVfHhyG45FblFXihEKIU+zgOo17TAT/wISFQHf//4opm8FiCMFAZzx9U720XUm
	fliYQC4PIYMZrYp/bxeUJ5ZnLVr7HapXumHrqjbAkhE0AORfZSiub+lQiYYm4Pp4Rsaqvrh1rJQ
	7oz8/6iAMqhswCYGJApJZfijQjb95KPJFjk2QhuWO7AJACK6YhZjzfWMGt1KPGEWxkXvKWy2ANP
	O4i2rjQRSc7XmrVJWnVODw0K3oKwGdllsDnJJw1q7p9pvAIBY2DomgAFjlaB2SZ28uS/gRNDWyi
	zjZk41OKk2VM=
X-Received: by 2002:a05:600c:138c:b0:49d:1842:f001 with SMTP id
 5b1f17b1804b1-49fc56ef0cbmr114442195e9.14.1789921661718; Sun, 20 Sep 2026
 09:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Pooyan Azadparvar <pooyan.azadparvar@gmail.com>
Date: Sun, 20 Sep 2026 18:27:28 +0200
X-Gm-Features: AcwNN1WlmptaAsREL24tSf3McPUsp7gZlMM32gCgC6aUV9hvK_r-r9FIlGd3yv0
Message-ID: <CANC3H+LdtoydSp+o2ecErAw7k6R2+gRf9LyxcaoHv_mGhJmyQQ@mail.gmail.com>
Subject: zram: block_state returns premature EOF with short read buffers
To: Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

The zram debugfs block_state file returns zero bytes when it is read
with a buffer smaller than one formatted record.

The issue appears to be in read_block_state() in
drivers/block/zram/zram_drv.c:

        copied = snprintf(kbuf + written, count, ...);

        if (count <= copied) {
                slot_unlock(zram, index);
                break;
        }

When the supplied buffer is too small, snprintf() returns the length
that would have been written, rather than the number of bytes copied.
Since copied is then greater than or equal to count, the function breaks
out of the loop without advancing *ppos or increasing written. It
returns zero even though the file contains an allocated block-state
record.

I reproduced this on:

        Linux debian-Utah-1gb 6.12.63+deb13-cloud-amd64
        x86_64

The relevant kernel configuration is:

        CONFIG_ZRAM=m
        CONFIG_ZRAM_MEMORY_TRACKING=y
        CONFIG_DEBUG_FS=y

Reproducer:

        # modprobe zram
        # echo 16M > /sys/block/zram0/disksize
        # dd if=/dev/urandom of=/dev/zram0 bs=4096 count=1 conv=fsync

The slot is allocated:

        # cat /sys/block/zram0/mm_stat
             4096     4096     4096        0        4096        0
  0        1        1

A normal read returns a record:

        # cat /sys/kernel/debug/zram/zram0/block_state
                   0         1161.269400 ..h...

However, reading the same file with a one-byte buffer returns zero
bytes:

        # python3 - <<'PY'
        import os

        path = "/sys/kernel/debug/zram/zram0/block_state"
        fd = os.open(path, os.O_RDONLY)

        try:
            for attempt in range(3):
                data = os.read(fd, 1)
                offset = os.lseek(fd, 0, os.SEEK_CUR)
                print(
                    f"read {attempt}: bytes={len(data)}, "
                    f"data={data!r}, offset={offset}"
                )
        finally:
            os.close(fd)
        PY

        read 0: bytes=0, data=b'', offset=0
        read 1: bytes=0, data=b'', offset=0
        read 2: bytes=0, data=b'', offset=0

The file contains a valid record, but the short-buffer reads return zero
bytes repeatedly and the file position remains unchanged.

This does not appear to be a memory-safety or security issue. The
observed impact is that userspace readers using a short buffer receive
zero bytes and cannot make progress through this debugfs file.

Could you please confirm whether this short-read behavior is expected
for block_state? If it is not expected, should this be fixed directly
in read_block_state(), or should the file be converted to use seq_file?

Thanks for your time and for maintaining zram.

Pooyan Azad

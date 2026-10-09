Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3791E3D0BE5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791555009; cv=none; b=Z5G5FTJbD4Vl5WHFW0IPQmUC/27Fh0PawoiMq19DIpjPMS6/0TXxGY8MlnOoUdeczhVSC2XNGQsgDbDKSm0T9zHmjxUYTqdM2FRdF9JoKPOhaL7GAthMLZ7R3kLZxLPhl14GdtWFXInwiiJX+i1RyXWr8sZfnHy64jtweJZK334=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791555009; c=relaxed/simple;
	bh=/wYwIrIQK4xiLW7OvS3VyX36IIyt93+83vMJBDyZoPE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nJqP2Vvmk/zrO9W+J9AfP73Yvz6E1lbuWN5NzxEeH0N0kQ12Zcg5dOJy/no246UHCOYZILtAI9XE4e4WTXo6lspMXEso5XGafziw33h0lokDLrd2RdIyf5b9eUpnaV7P41zMICJdsid/XbLujdB2alzM6biHTwV45huoyby3XHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmpcfIhO; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmpcfIhO"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so3500847e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791554999; x=1792159799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VcCKhy+ULTce1/sRIbiZhrqW/+l3/hqpSg51rQi2k5A=;
        b=jmpcfIhOl0FWaUzgoqv1N/bnKnJbtE2H1bdbW/QicIi5lw6iN9C7UX3bJLOkRiMRVv
         gLBpTUAiFEYvJ8kKLOC+XE2c+CWZxFGeA0XX7VjXKTXZXXs8uLA8QaH4ydQEgpqRzKT8
         MgttbfQ6BE641uVnCWthuT1L5yR27m/IaJ/+yebpEpzYm112uS1oyp01uibtv6igh9Lx
         /w8jOJk33G3w7xo0KQFcU4bDw5VATIJaFiQvo1TtmrLGgOvplrhng5NL8vhl6Vy49aDZ
         t9JuiX0/9OoS4CSjy65P+T4nxRwNFisfk/zDXENg0g5weGTW7K0mFdgn/usTKoEJ1JAL
         YcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554999; x=1792159799;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VcCKhy+ULTce1/sRIbiZhrqW/+l3/hqpSg51rQi2k5A=;
        b=oFhF2nWErC8qdhAL6xyJ1BMEhUVYNbbg9W617i3tjFLx3pSdpslkp6t+CI0k0f2XqK
         wz+ZxKbjVlYfUmsejd0e2MjcAF8CCi7QFW/LNs3WHAiaVlEQszsuS7t+FPBiE3wXi/TU
         ESQaNzW4FBr2KheOY/j6+Tc67vN4ukbAQwP1Var7B+xeI70RZ/Sn3bifZ6vB1/ClcVWF
         3RwxIVB+UCfzSgPsDkiiZDUJ+ZOUI/QK/3N8MIZMFW8rTQhr5aNbWu7Kyncunwc1u09U
         Z9RDj9baEG15QY3uSeIU2OP8hWQ248cKT4mUbpUgbW5r/Z8oBE13958U5aflL91Kd4Ty
         g98Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaKNNrBluPbfj8LdkiiVW3y7pk6loSM8G0afq+Kt1cbVPZ3XSqvqk4HwrbsnuyuC2ZoSUAXH5B3PbBNLM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKaVtkEQX9noTZP6vwA9zoNegXVXrdhfvq0iwmaj/Dp23/Sxer
	gCRFRsmm6HvQ8yjiAttw6U6fG55RmSZAkn4+WT/K0xf5EWzGCSHOFwdqECJWrA==
X-Gm-Gg: AYBFou1nsniQjgn5IW6AAhTFxi62qNZmvclZYvxm8H+eJEm2wYtOM8E+uM9uySOs9xA
	2MgJPT/+iRXiPMGkSB7DbsTrPfYcC7//HkmuEzLdlm9B0uWo5DyTGJ4T+44JFfspg4IjUMdUSj3
	sr4Z20JtzCAvZQaXNWOv7AwIZrcYx3a2QZ13zV1RoULUp67omnQkBqtqQDyxP6SxtRFl2VK6VW5
	XfWvcMQuU0ZIrdnxOYNu+BHN6Ai7CVcxmn7ITz50gUUULgqSjL2wt1+mN6nsWPjnbgKajtOl1xd
	JiOlIlm9jDi+zrnjhpFAGrroj6oCEQZUus/TUp99MmhZIcVsXqIgnexqof8oSAv7kvht/qTplHh
	Y7pU45YvXOIe+VRfyYu+Hg4GW2URqoTsVfxsmJxrfYKwND56sTEXivDEdSVXVKWM5jI2+fxEAAM
	bMdmOvEhMTNYMb26HI2h36RrmFKYrk6Pn+/JBvBzgik3w8uGsWygN9jmdRFrSrBPcAX88WyC9PW
	PWSkq/Qj3FwP81UsvtS1LXQPzVR9Az3
X-Received: by 2002:a05:6512:3da7:b0:5ba:4408:7801 with SMTP id 2adb3069b0e04-5bcde8c9b10mr811066e87.53.1791554998613;
        Fri, 09 Oct 2026 07:09:58 -0700 (PDT)
Received: from [10.128.170.180] ([77.234.210.12])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde913d0sm689165e87.26.2026.10.09.07.09.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 07:09:58 -0700 (PDT)
Message-ID: <47d7da4a-5029-4c56-a5ac-3e4c526cc569@gmail.com>
Date: Fri, 9 Oct 2026 17:09:57 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: konishi.ryusuke@gmail.com, slava@dubeyko.com
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org
From: Vyacheslav Kovalevsky <slava.kovalevskiy.2014@gmail.com>
Subject: System writes out modified portions of the last memory mapped page
 beyond file end if file is resized
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Detailed description
====================

Hello, there seems to be an issue with NILFS2:

1. Create a file, truncate it to some size that is not multiple of OS 
page size (which is usually 4096).
2. Open the file.
3. Create a new shared mapping (MAP_SHARED) using `mmap` from 0 to some 
point beyond file end (but still on the same OS page as the file end, 
otherwise next steps will fail).
4. Write some data beyond file end using the mapping.
5. Resize file (e.g. using `truncate`) so the file end is now after the 
mapping range.
6. Observe that bytes written beyond file end (using the mapping) were 
also written to backing file after resizing.

The last bit violates the POSIX specification, extract from `mmap` 
documentation at 
<https://pubs.opengroup.org/onlinepubs/9799919799/functions/mmap.html>:

 > The system shall always zero-fill any partial page at the end of an 
object. Further, __the system shall never write out any modified 
portions of the last page of an object which are beyond its end__.

Linux manual <https://man7.org/linux/man-pages/man2/mmap.2.html>:

 > For a file that is not a multiple of the page size, the remaining 
bytes in the partial page at the end of the mapping are zeroed when 
mapped, and __modifications to that region are not written out to the 
file__.

For reference: `ext4` / `btrfs` / `xfs` do not write the data to file 
after resizing, as

The exact same issue was recently reported for ZFS: 
<https://github.com/openzfs/zfs/issues/19220>


System info
===========

Linux version 7.0.0-34-generic (Ubuntu 26.04.1 LTS)
nilfs-tools version 2.2.11


How to reproduce
================

```
#include <err.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#define WRITE_OFF 10
#define WRITE_SIZE 10
#define WRITE_DATA "Test data!"
#define MMAP_SIZE WRITE_SIZE + WRITE_OFF
#define FILE_SIZE_INI 10
#define FILE_SIZE_END 32

int main() {
   char buffer[FILE_SIZE_END + 1] = {};
   int status;
   int fd;
   void *addr;

   status = creat("file", S_IRWXU | S_IRWXG | S_IROTH | S_IXOTH);
   printf("CREAT: %d\n", status);
   close(status);

   status = truncate("file", FILE_SIZE_INI);
   printf("TRUNCATE: %d\n", status);

   status = open("file", O_RDWR);
   printf("OPEN: %d\n", status);
   fd = status;

   addr = mmap(NULL, MMAP_SIZE, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
   if (addr == MAP_FAILED) {
     printf("MMAP: FAILED\n");
     return EXIT_FAILURE;
   }
   printf("MMAP: OK\n");
   close(fd);

   memcpy(((char *)addr) + WRITE_OFF, WRITE_DATA, WRITE_SIZE);

   status = munmap(addr, MMAP_SIZE);
   printf("MUNMAP: %d\n", status);

   status = truncate("file", FILE_SIZE_END);
   printf("TRUNCATE: %d\n", status);

   status = open("file", O_RDONLY);
   printf("OPEN: %d\n", status);
   fd = status;

   status = read(fd, buffer, FILE_SIZE_END);
   printf("READ: %d\n", status);
   printf("BYTES: ");
   for (int i = 0; i < status; i++) {
     printf("%02x ", buffer[i]);
   }
   printf("\n");
}

// ::Expected::
// CREAT: 3
// TRUNCATE: 0
// OPEN: 3
// MMAP: OK
// MUNMAP: 0
// TRUNCATE: 0
// OPEN: 3
// READ: 32
// BYTES: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 
00 00 00 00 00 00 00 00 00 00 00

// ::Actual::
// CREAT: 3
// TRUNCATE: 0
// OPEN: 3
// MMAP: OK
// MUNMAP: 0
// TRUNCATE: 0
// OPEN: 3
// READ: 32
// BYTES: 00 00 00 00 00 00 00 00 00 00 54 65 73 74 20 64 61 74 61 21 00 
00 00 00 00 00 00 00 00 00 00 00
```

Steps:

1. Create and mount new NILFS2 filesystem in default configuration.
2. Change directory to root of the filesystem and run the compiled test.
3. Observe that last operation returns unexpected value.

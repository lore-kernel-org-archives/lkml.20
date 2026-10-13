Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F174FD274
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 13:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898888; cv=none; b=ffcKQeF+Sd4DDym8DnAI8Wl1RL2uiouD7ElR/pgXCU4YPHy5JdHJNWmG9WbK77D8irvVbjdl5RVEHYn5UTKrUqcFWXgcP28H+scfGd7h5m1WYM77zocWMI3CBSS+Zu9lGK3d+DUS2uUuuR3Bl94eVH93/GjSjEU7cPCrRRm0tmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898888; c=relaxed/simple;
	bh=/RTu033VlwJ9e0oapQKMl7yfI7+GbcQgR/7ycBUqfuU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dDl1Bz9Dd57jSjyRAQLQzbVDb6QWsr6dRRlLYUI3TzZJSxZIYfSfE3hu7wm6fQ4aO1WhAMgawGIKopph6MG/ZWUhVhROGZw/wsqnk9PYAXOkh+X/rsONj7KxnmjSBM3lh7Vom1odnwT0A+uvon+u0BjOWKqKLR+Bz4hWYMJx6kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwTrWkLn; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwTrWkLn"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-89a595332c7so1470755b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791898887; x=1792503687; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UEr7nVXn9dfA+3Y3/gltmjKKnXP6bzWJ0+fALNgm3RI=;
        b=RwTrWkLn9z9XWTBv7hWVvDMWph3rxROLAV/gaZosBiExni/RYdasHazZtR7Yyxd/uI
         66CPNp6TzhTOkXz+z8dOGRklOlbyhpAfc1+EQcbX6bjjfB5M9nSwiFp4kSSFIYWKadm5
         WkKiTrC6BLNjcNp3FuutcOIVg08KTyBSRvzXvnmdQQUT4V8agarO+idIlerjwp653ugj
         30xo/RzSYHdsp+gzgNmWi0G8ue/vel5WueXe5/IPYNOwPCs6p8bRT7JiFXCKHVPS3cNa
         i/5oU48DgUbnf6k0pXt7lTgGCwZUg403OgvcvvpyXfLkTA05tjLsfjiL9DLBqabCkUwo
         BkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791898887; x=1792503687;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEr7nVXn9dfA+3Y3/gltmjKKnXP6bzWJ0+fALNgm3RI=;
        b=r5MEkZVg/FNzpx6ZROb9k0+HipEPqWMqGhXMl7YmmNaR4jhcSOLyEk36HP+2V4AtWa
         Ub4XewMZ4VI3y9uhGcrw9oCLWdVaFqJYlgJfFokqw1ZceXjYKALw1sxYz+KmXxVrWRP5
         n4IVZMKj/2eY0T1OJG9UsVbAgyZLs+/phFFXB4jGNclM0p7pJJDGJiOsCmcu05CvDSSV
         xyrCC68FDr2yAvjKk7j/0Xse4qn/yaJejjF2uiq3wpMrVQUaD0P/1QFOKOL35HvlRwzz
         S9AhcFyoreLsLwXKtALkV3Wssj9O0yYxDMsUE6KNKcuSTkb2dT5zCdkunO3FyffMoPKY
         b5GA==
X-Forwarded-Encrypted: i=1; AKwUvBxlvUSXiiSdZLsbkiArS259juNReTPVUINN8uxLiROG1QcXkeHTbDgihnH3JgOVmyFCt7zbRluD6o2UfpA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLIKAjHtxY65ljL+/FxUc+KhRMd2h4Ccave78T3qzeiC2zvvpWQ
	aiwuREJvy3BBCxNAgHZod3Gt6shyt+2c5AxJ1W5uo6WKqgj+H6Acm8Ri
X-Gm-Gg: AYBFou2O7jCHWQOQZ41qPKYWm0vHm4vO9OtzBxKc4HsRTgHaHUZlbQXHHLl90ieBjAx
	oTI8W/b/Lnl6sAjrvbqduwq7p2e4j+7UofWESgMhar4FEfJoaqgnhWvINHGbzgGFvA9jtxP9STu
	jHjxjpobC9L55+W23aU2wNcLYm27s5v4D9ocOL6sYfed4bgtRJlFOWby7+Un1kLiZsa8grLPJSj
	qL+QBzodDG0tmzBAJVSzp2itlyZG3uf90oOUUg/mUGrA1IY0LHBUA9GkZGd7Fv4yRRccJTY2RKQ
	FT7XdWdf6AaAEbxLmYu0Vh50Nj0H8URba3GMqIHYZBc+Z9iPw3I8RLYmzsObQ9RQd/HbCFObVfb
	bY1goCzFKFzhQQelD1k4zxNCKrhbwaFDqVwsW7981wS9kypfh/QfbIJ2qMpvLLmtjp2ah/Q19J4
	aNRTpr/ctp/ybZ5ZmhgZE4Lm58r4lAKGbF7TmWbf6i7mQzi+tbama5u8iGnB53MhNZFAJXDIiSP
	OE359Rxd6QKcNZGHik=
X-Received: by 2002:a05:6a00:23c8:b0:874:705d:f64d with SMTP id d2e1a72fcca58-897c6443144mr9896972b3a.27.1791898886497;
        Tue, 13 Oct 2026 06:41:26 -0700 (PDT)
Received: from [127.0.0.1] ([103.175.98.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c310737esm5187059b3a.10.2026.10.13.06.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 06:41:25 -0700 (PDT)
Message-ID: <34f2ac0a-04d0-41cf-a2a4-11a93c7c9b91@gmail.com>
Date: Tue, 13 Oct 2026 21:41:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Xuntao Chi <chotaotao1qaz2wsx@gmail.com>
Subject: [BUG] usb-storage: 14cd:1212 returns incorrect data after large
 READ(10)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I would like to report a deterministic silent read corruption issue with
14cd:1212 USB microSD readers and propose adding a MAX_SECTORS_64 quirk.

A READ(10) larger than 64 KiB can cause the following READ(10) to return
data from the wrong LBA. The trigger I have found is that the second
read starts 64 KiB beyond the end of the first read. Instead of honoring
that gap, the reader returns data starting at the end of the first read,
that is exactly 64 KiB before the requested address. Both commands 
complete successfully, but the returned payload contains erroneous data.

The same problem is observed on 3 physically separate readers purchased
from 2 different OEMs, all identifying as 14cd:1212 and with the same
serial.

Device and environments
-----------------------

   VID:PID:         14cd:1212
   idVendor:        Super Top
   idProduct:       microSD card reader (SY-T18)
   bcdDevice:       1.00
   iManufacturer:   Generic
   iProduct:        Mass Storage Device
   iSerial:         121220160204
   speed:           USB 2.0 high speed
   driver:          usb-storage
   logical blocks:  512 bytes

The error is reproduced on an arm64 machine running 6.18.54 kernel, the 
same machine running a 6.12.112 kernel, and an amd64 machine running 
6.8.0 kernel, and is confirmed directly using libusb.

This has been observed to cause data silent data corrupting when 
mounting an ext4 partition from the device, and setting 
max_sectors_kb=64 as a workaround fixes it completely.

Would adding a US_FL_MAX_SECTORS_64 quirk be appropriate? I retest 
against the latest mainline if needed.

Regards,
Xuntao Chi

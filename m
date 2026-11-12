Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478926;
	b=DVLvN3uLFpu053mj7zjYn5lt8DDnFHu6X5ePVjCKK1X1emXOzdFmFTtpqhs4ejnegMnr
	 QrTmsyfw4I7jdRX7vFF9nAPKl7Gv1tPctocM0TGP3peD+eTTEfUzqOKe3fwP+7O4obnjG
	 0yvqgDfJG5/ofL5E6uNv8TAMq+ZZLYkjQYpSgeX7g6H49ulQDGF4nNBrk5Y6de6oQ+qrz
	 ZLi2XdbShWGGtaDNRDAbp/62QIsEQjkHFqJIHd54EA9FkZlquVFcADu5p6MrbwoL7fogl
	 KZf5rdejsbGvcUc5xfYCCALdki4hnmIWJjG96txVFHvltn9EOl7VJ1jFxDVnPU7jSxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=uowx1pkDTb4NperQz2xtneX54qAZAB1zTdOS5Ap0tkI=;
	b=DtWPd0y9sNg9XTKFARGV2T3VU9peAAHJ2mBGLXG7MANstNCFbMPJ4Iv7uKniO8yhhIul
	 UGp26fCJ4R54fH6xT6IUo1HZJflGYV53Wd50p++T5cMuaBc7JlVPiGjrpukIqxvLIlgny
	 lzf1fng4W4oJtk205jYs8ObJZnz+HyzlZDdkByiSfTOB0zpiMQs2dZPS0Z/4Vb5gTXMYo
	 w76MFipzKtjCB7nUoQ1hHDWmxeyN+MjrMZFf13R6jsfmNpI7ZhMInjTYvyT7PYuElYRSc
	 hp5/5dwkbhoExOFpHpZ+tS3+46AGh7QEVh2QesS1Nz3owRYOixGtWLI0q8UogYScBWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="y/SJe+ZR";
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E3F606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:22:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E3F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y/SJe+ZR
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1aefd1bf74aso579180c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794478924; x=1795083724; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uowx1pkDTb4NperQz2xtneX54qAZAB1zTdOS5Ap0tkI=;
        b=y/SJe+ZR9+2V7gOmXRL2T6cFYN7nJbVcJP+LyR9YosSapoxsfFfM/KqjPm80zG/5Ri
         URw+DCJgemKoF9llBk4H0l4CkbA0LVSGLsYprU+2NAyC/CCkUEORehly4VbhibENBSNv
         KAXanrYSaTlAXfVTwDZYsCbYoZE9D0YW5BIRurbg5Ld5hD/9lffY2BUXV9MryrhtjnpF
         071b89pwqfp4tmr5M+5kwGlh6tsdLPEY/2cdhyVP/noDL3mMk+NoDXIaTgp7XoIiYYxz
         deUTiwNVvSCAMFVydtYpEIGOqe17ou1jWEPD927oda4slvGeJQdFtbCvw4UuYFJ7sayM
         CiMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478924; x=1795083724;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uowx1pkDTb4NperQz2xtneX54qAZAB1zTdOS5Ap0tkI=;
        b=vznDMHDHV9IMy2hCjmUnQsv6YfYVC9OQ30Pl2cr9II4/d9wD4V9GC5/accsl5eDVLV
         cgODWDa1bFuGzjdBb+udFnL2kL6r+EL74RQKVKoZ4Jm9j4uauiHIXzlBJWrTkJs4uLmp
         hDcrfIdXDeq8aS+5qBvXG9hfDXI9uXL4bKC93vqGOXj4vCjVTo5O5uQpE1f//j+WTFle
         EZSJWErjQ0ca5BaSpbmBL3mKdXSIpamqL284EfDJU7hvf3LAypXUEaXbNuSsa7whqnMQ
         qqFhTi9+DsFTuBYp/nNn+OUBDgIJtn83UFCGGXhJQ6ZqilaCguFKj8nqa6SZkq/aX7Rz
         WhpA==
X-Forwarded-Encrypted: i=1; AL+hErGaAskHNLt5adJXw/1S7K98wEtQ8DkOSE+7hKR3tyxe5XLXkEA8lqACGbLI9TRRv+mehbeBsxDMdu3qm0A=@vger.kernel.org
X-Gm-Message-State: APuU4Z80yLk+NsTtaNyBZ2IvWjs7s16dsvi3TFXnWToJJiq0RYssx72e
	OuIRTjN7VJz6j/npZTFa4EGr0z8pXO2vJwGaIMmNYVAAte9YOd4CI6dm
X-Gm-Gg: AYBFou0xOc+OyZOXbQCmJiKdc6tIMBKWjsyiVFLEBAFDDNjyG9G5pDBOd3i+Rt9uzIG
	00RxFtu3zYCAAEZ6l2FSKPE0XxEi2UTUrW90oo+uUsrcGADTW/pM9wMQm1IRhzkXMHnEN2UbWgf
	tCfo7HSlRXWhNJPj1qS5T5gkqODfQgDoREhO9YrhZByb7WtKiJJNLUGNmsHZPbFcGhOZI6sf9ai
	qFkqLbRYVxA0Kxw7S7/QkejygSN0Zh9Z9DmHCJue82lm4LrZfcX+Clv6V4yaAHafKJXUEtTaU5X
	bHA2UeO8PQtrKhgCTa98qkvQnZrQDUF20E5u3nMZ8Zo9mlJ0IzAR4WC1b/6OT+ypuNciIXXPRz/
	puUkoY9eYaiLKZ1DnyXargRa6sDgpTmZOIQ+ozCti+WCcAj9vdYJdTd3fV1C2HstgimBbXx/fAS
	g7U5LmJaKtPJ7g56Tf2KNQAywUPy44kyf/oSYYKatEthpV8LBwuc2iOfEYxbrVv0ERI3mfhnnZ3
	teJ1rYuJp9GwIuKFIR9seX6U6Qawmbp2+Dv5sPCEsAUSgA/x3dqGzdsXBmoNyOfWP0nBDruvCrS
	j9jrDnrCilYlw38/kvSKxiHID+ch7fsJyKabDM5WYA==
X-Received: by 2002:a05:7022:ed0b:b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-1b4f5e9dde3mr1645864c88.12.1794478924186;
        Thu, 12 Nov 2026 02:22:04 -0800 (PST)
Received: from [127.0.1.1] ([183.242.161.82])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm23649633c88.12.2026.11.12.02.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 02:22:03 -0800 (PST)
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>, Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-trace-kernel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rvgen: validate the monitor type
Date: Thu, 12 Nov 2026 18:20:20 +0800
Message-ID: <179447882046.254241.15114935256138596418@gmail.com>
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
Content-Transfer-Encoding: 8bit

From ef3ed8fae481c0ed3dd16c881aae455be9e92f2e Mon Sep 17 00:00:00 2001
From: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Date: Thu, 12 Nov 2026 14:26:10 +0800
Subject: [PATCH 1/2] rvgen: validate the monitor type

The monitor type is pasted into the generated monitor as RV_MON_<TYPE>.
Nothing checks it, so a typo yields a monitor that cannot build and the
tool still exits 0:

    $ rvgen monitor -c da -s test_da.dot -t bogus_type -n bm
    $ grep RV_MON_TYPE bm/bm.c
    #define RV_MON_TYPE RV_MON_BOGUS_TYPE

include/linux/rv.h defines only RV_MON_GLOBAL, RV_MON_PER_CPU,
RV_MON_PER_TASK and RV_MON_PER_OBJ, so that macro never resolves.

The accepted set is already in Monitor.monitor_types, which the help text
prints.  Pass it to argparse as choices.

Signed-off-by: Chaosheng Qu <chaosheng.qu.linux@gmail.com>
Assisted-by: LLM
---
 tools/verification/rvgen/__main__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/verification/rvgen/__main__.py b/tools/verification/rvgen/__main__.py
index 246b43fa2..6053db5e5 100644
--- a/tools/verification/rvgen/__main__.py
+++ b/tools/verification/rvgen/__main__.py
@@ -38,6 +38,7 @@ if __name__ == '__main__':
     monitor_parser.add_argument('-s', "--spec", dest="spec", required=True,
                                 help="Monitor specification file")
     monitor_parser.add_argument('-t', "--monitor_type", dest="monitor_type", required=True,
+                                choices=list(Monitor.monitor_types.keys()),
                                 help=f"Available options: {', '.join(Monitor.monitor_types.keys())}")
 
     container_parser = subparsers.add_parser("container", parents=[parent_parser])
-- 
2.43.0



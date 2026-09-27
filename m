Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343843BBFBD
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 16:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790526895; cv=none; b=fdo9xJcB0mvVEftjg7JsRn1RaI6KPv0YrO6vefLxru9koFZrRcjea0o2AjUzXxkS9gaTdttX4t4gY3DEgU9StitQ5IDe00143SdHZQQk7ZoAzsD/i+UJg2JPH8x2A3FnSmDS6R7PY7I9eT1wmeqRJErpDlwyCmrn6EmFOaPWvBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790526895; c=relaxed/simple;
	bh=pDOZOOWaBT7bPuq8slE8xVFevxZOBPoEbocvdhQtSt8=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=VzR9WN+h9b5z364F/HXo/SS4BWYN3kGBrzY6PESrzH9xXJuSYkYWtrNL6N7YAdI8lcw47DeXsxTOD/r3tF2rv1vE2Zq+qkx6A/j+O9aA/b5vf7xQ7e9Jtkdx1LXsUXSYCAgqkQZflTX5VT0fXIaCFlkkUOCXrH20exdn84ctt3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AsIkcb3/; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AsIkcb3/"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e79a408deso13359375e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 09:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790526891; x=1791131691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QHjXpFdzhv3C4hfYuzeo58w6uZ3blP9zXG/f+JNvoxg=;
        b=AsIkcb3/Jagj1XOj23ClOcvW0JwKFtRXkObtVSevHeUys/TrFcnuqAqAif/23kO9PD
         XoFWx/J83RHBkXG9gQf0Cyp8Yx0IP/WKLikTjC8YDBtyKBtZ+t9J5W1JtMwtGaEFrZbW
         iINq1iUgwfWkuEj3RDrsjuR1Ogv5FCH/Yq5vxORnfwwSC0zOgdGK4mpdi5xLYB2iVFYM
         QTpztmfS/FyN9QTO4pQRVWp2fr49mye3zps52CwG0pwkj3BU1otwwBhwJfbE5q6moPu4
         49maWhfIlGA8cmAtzTY+ZUahlCLElnRYtlU4GDT9CvXP6SwTRf4DenKUuNNNBzwn78Uc
         WGeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790526891; x=1791131691;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHjXpFdzhv3C4hfYuzeo58w6uZ3blP9zXG/f+JNvoxg=;
        b=GsXN+PE+TSLeVfwt6lKZNMNjzlU3YwqystdYVD0yXMqyJ0CJVDtyI6ZQKdXUfyL2Fa
         py9aMWBLKalr8hC2X3uC4F5PjPEhUMOV1s8GnvKxo+XUH/vdxX/UvTEwVTeIMnGQP/ix
         liPo9ZxGISNs2eg5K8ijdm/eJ5lU8o+bT+70LU0nQR49E0pLZCIOT2CWFokF1fbgJD/j
         VOAwdXKPS24E2vKOA7K+D2evL7XC/cdgSQoaiOWJCC2wnOLMo4VsCGeE1XNGPzMtFsqm
         mrmf5Aa1VoUcG0zmsaY84sUfHUEGMH/O6Q00ECKKTKXjxm040bq20xGUw1jlUaTOWTrS
         XZhw==
X-Forwarded-Encrypted: i=1; AKwUvBwzG9xiqRCv+PR+uHLMhg9l9XwyDgz9t/szmI9BKBej+/TIpEgCgFwBYY1IRQMCVcONzSi31ygCcDnVwLU=@vger.kernel.org
X-Gm-Message-State: AFuF++kAjBtKlu8eOKbpWba82X2HBUPi1vER/PqRinVHpLIu1UczWrJP
	ZjsTjccbyKVK7fEyYl21AIAqztCoV7uhayOEBh8MI19g55mAsSzVV/zI
X-Gm-Gg: AYBFou2Ld11t4WYNL53NAPLboOjhQkCinD1oSc199YuqxM7qigYfsgP4Op9MrzpzeFC
	OOxKF/bPNsAXVtrztINV4iYITwcb9VZOuj1nZSMhr3GCfcjy5tahWITFLZAWzd8JYDOpkhdW0cg
	XDa2h2BXa5BviMA92LJnXIyKCiEUbXmWmruwcqoB2iw9u+M+uFsMA3d+dKk7Zv3G8Ee3jNj/ztU
	bRTGI5jnjLPIyTrpyd5kxuaqGcrDNJr/DIsI+H51hG/b10s7byjx+tXwUjNOHTxv5WH83NGJ1T9
	KCpOYJxD5zIEYN3gi5MfWKTkkAH7kRu6uvHOPzvIbQbdy04ymfiuqWJDYY2PAHBPPZU5PxOKbXa
	oVECTzBh5V3yh6HdoqiGJwavHehaXKgDlGgpTd4S/yMH0NKBzV6EAV8zCMX6q+XerwqwUWeGOf2
	iRnNjEIMkwSExZhBZwquhXLt1V/5ueA03PFfwSGpX+STddfvR5+1/0a2oW87RZhc8aoNdeH8p5C
	IyV0t+F10CEN79vFkP/EZjcuvrZw3GkYY1UupwKO702U7iv9eWRsMcTiQw=
X-Received: by 2002:a05:600c:a418:b0:49f:e4ca:e1d with SMTP id 5b1f17b1804b1-49fe66fa070mr158260075e9.27.1790526890971;
        Sun, 27 Sep 2026 09:34:50 -0700 (PDT)
Received: from ?IPV6:2a07:7e87:3bf2:0:1388:ec72:45b6:c87e? ([2a07:7e87:3bf2:0:1388:ec72:45b6:c87e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fef5fe71csm144419165e9.2.2026.09.27.09.34.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 09:34:50 -0700 (PDT)
Message-ID: <18c22d05-af53-4d94-b6ff-91441adc65c2@gmail.com>
Date: Sun, 27 Sep 2026 18:34:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-PH
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
From: Carlo D'Ambrosio <carlo.dambrosio@gmail.com>
Subject: [BUG] usb: typec: ucsi: Acer Aspire 16 AI reports connector 2 while
 num_connectors=1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I am seeing a reproducible UCSI issue on an Acer Aspire 16 AI running 
Fedora 44.

System:
- Acer Aspire 16 AI
- BIOS 1.22 (latest available from Acer)
- Fedora 44
- Linux 7.2.7-200.fc44.x86_64
- Dual boot with Windows 11
- Two physical USB-C ports on the left side of the laptop; the upper one 
is Thunderbolt-capable

The problem occurs when I connect either a USB device or the original 
Acer charger to the upper USB-C/Thunderbolt port.

Immediately after connecting it, the kernel log starts being flooded with:

   ucsi_acpi USBC000:00: bogus connector number in CCI: 2

The messages continue after disconnecting the device and also survive a 
normal Fedora reboot.

The lower USB-C port does not trigger the problem.

The condition can be cleared in either of these ways:

1. Power off and perform an EC reset by holding the power button for 
about 30 seconds.
2. Boot Windows 11 and then reboot into Fedora.

Interestingly, Windows itself does not appear to trigger the problem. 
After Windows -> Fedora, Fedora starts cleanly again until something is 
connected to the affected upper USB-C port.

Reloading ucsi_acpi does not clear the underlying condition:

   modprobe -r ucsi_acpi
   modprobe ucsi_acpi

Removing the module stops the log messages, but after loading it again 
the flooding resumes.

In a clean Fedora boot (after Windows -> Fedora, with nothing connected) 
I get:

   typec port0: bound usb3-port1 (ops connector_ops)
   typec port0: bound usb2-port1 (ops connector_ops)
   typec port0: bound usb4_port1 (ops connector_ops [thunderbolt])
   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-70)
   ucsi_acpi USBC000:00: UCSI_GET_PDOS failed (-70)

There is no "bogus connector number" flooding at this point.

Also, /sys/class/typec contains only port0.

I used bpftrace to inspect the UCSI state directly.

While the failure is active, tracing ucsi_acpi_read_cci() shows:

   ret=0  CCI=0x20000004

repeatedly.

I also traced ucsi_notify_common() while reading the UCSI capability 
stored by the kernel:

   CCI=0x20000004  num_connectors=1

This repeats continuously.

I then reproduced the issue starting from a known-clean Fedora boot. 
Before connecting anything there were no such notifications. I started 
the ucsi_notify_common() probe and connected the original Acer charger 
to the affected upper USB-C port.

The very first notification observed was already:

   CCI=0x20000004  num_connectors=1

and it then repeated continuously.

The bpftrace probe used was:

   kfunc:ucsi_notify_common
   {
       printf("CCI=0x%08x  num_connectors=%u\n",
              args.cci,
              args.ucsi->cap.num_connectors);
   }

I separately traced ucsi_acpi_read_cci() with:

   kfunc:ucsi_acpi_read_cci
   {
       @cci[tid] = args.cci;
   }

   kretfunc:ucsi_acpi_read_cci
   /@cci[tid]/
   {
       $p = @cci[tid];

       printf("ret=%d  CCI=0x%08x\n",
              retval,
              *(uint32 *)$p);

       delete(@cci[tid]);
   }

This indicates that 0x20000004 is already being returned through the 
ACPI UCSI path; it is not a connector number subsequently generated by 
the typec_ucsi bounds check.

I also verified:

   ucsi->cap.num_connectors = 1

using BTF/bpftrace.

Finally, I inspected the Fedora typec_ucsi module corresponding to the 
running 7.2.7 kernel. In ucsi_init(), the code calls ucsi_reset_ppm() 
and subsequently obtains the capability data into ucsi->cap. The 
num_connectors field being used by the core is therefore 1 when the 
connector-2 CCI notifications are received.

So the state visible to Linux appears to be:

   UCSI capability:
       num_connectors = 1

   after using upper USB-C port:
       CCI = 0x20000004
       connector change = 2

which results in:

   bogus connector number in CCI: 2

I am aware of the earlier UCSI issue where connector notifications could 
arrive before num_connectors had been initialized, resulting in 
num_connectors == 0. This does not appear to be the same case: 
num_connectors is already initialized to 1 here, and the problem can be 
triggered reproducibly after the system is fully booted.

The fact that booting Windows clears the persistent condition is also 
interesting, although I do not know what initialization/reset sequence 
Windows performs and I do not want to infer the root cause from that alone.

Could you advise whether this looks like an Acer UCSI/PPM firmware 
inconsistency, or whether something in the Linux UCSI/ACPI 
initialization could cause the second physical USB-C port to generate 
connector-2 notifications while GET_CAPABILITY exposes only one connector?

I can provide additional bpftrace output, ACPI tables, full dmesg, or 
run additional tests if useful.

Regards,


Carlo D'Ambrosio


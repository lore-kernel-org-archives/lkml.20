Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1283ED3CF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766362; cv=pass; b=kgTvtoosoxe+zYz4toD1WxtN7lIDKfTBvz/oQoZp6r+9oCAcfunSlGUa6vKCCVMGP62aCNXF/bAZC1SpPAmU7euIZ/RIeb82222uolMyf8ff5RLkwwpiSQydL23iwNhd2QdRKZZwtNtcv/ROj1Z1dg0q1SyJm29vD5bno4w5/Yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766362; c=relaxed/simple;
	bh=EiPEneRnI9r7Jp86ZD1oK9EFwlun/kDwKJ7gdkGXih0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qcxQCLM3G0HArP1pqzcTtU29TGad7+1XQn8Qafzr9YSGOFnihpAfxOW0PvfM+iC34RwvDTE+4tf0cxkjL22DRBpNvv1gEBabe8XGUHd8STOEkGkeMgweSlTDPRZ0weRliF5UDJ74bMYyc0jK6rfjxN1BP/S8qKSEQGxsNi4r4T0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lz/PBTXD; arc=pass smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lz/PBTXD"
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b9c8db8c4eso659719137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:05:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790766351; cv=none;
        d=google.com; s=arc-20260327;
        b=dvHRIy9CwS7QsacuDjCb+6O9uIBu99nk7hJ1P3/UdDnorcSO8gOUeD7fXRxxtODKNX
         /fOTdUZVEeeXW4UxV3hm/gT8qwJU8cUSsCwDp5wEg9L3jTiW3s66QO+CUdNxui1ckt7D
         uE9qEXbPztcn2PH0d0ajF7ccwePFdIwlGFyXUjzAgdsWqUf8Jgw0oAb1V77ZB22Kz4uY
         aJ5i1xv5pFrK56S4X9RQOomgdqe1b6R6OwJyrqcrEuBL+eRHvTGB9mQ597HcpuLqmIEI
         CjOCmL6wP/Qj6PoYPmlhTq1850saHU/GdHjvFF9badSlRRDIq+P7iXdvQSLtmLZk6FZV
         E0aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OTCXCo5OR+c8Iv1GP8nUq4PH5B2NnHbbWepDU2k+v5I=;
        fh=egphjEoaGZbHk7IfSnEAmOaCgPZAVMM9/ZWP+YkAWpM=;
        b=PhAURnzdeoafHTUutUOIP2B945jkhcq/Z04MWgRSnR4sYKqpjkI063HX4YpDRWHZ8b
         raaD8m4CMBSHrhi92QCTR2n+DdEucON0PG3K0jOIHG3bx0vlouxx/zXWHpyMcxXdOKHh
         ZevJ0EPynta0Rb4xqVFgHwo2CnYJUDCvUI0uJ2AifSmljfPnf6LSR9LJkmRz7ag+uCci
         Qu9/5SvmnJb4yMO7vrHtFl9Fak8DmvS2EkLCrbJQ/1iz+8wweEbBxE31y434WhYY/DwF
         WlGAnWvdGfc55OE6Y5R46N+Hs4W027I9dVbYaEvQoxtc/PL+aptkuD1TWl2VYJR/dABF
         eTcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790766351; x=1791371151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OTCXCo5OR+c8Iv1GP8nUq4PH5B2NnHbbWepDU2k+v5I=;
        b=Lz/PBTXDt4buNSHeUAH7sbB9dIFtyyeGZjLl7ajcbW4EPwTGfuidxR0hKIvhJXvA3R
         TF0voH8Nn0MWCl0B9Sh0cDWiFp81caTUbxmzsQmn5Nq+bMTOojPkFMpX36uxo6KrqDP/
         H5PU6XFJfBXTa65id2t1B0VOUcpIfnhusX2YBgBmMiC4RvLVcbbEXgtqx6SRRAciP91J
         EPfgyLle2M0maSbnDfNLPqaysiTg28YWgAhfm+tB4s4X7t/UT3eXmzD6zmv3VkU5sKBY
         fJpHNMI/c73Y5ZwpykTDr/o45fpGo6RdvE73rBs37/Fa4dtPtLPy7tMXqWF4DeYv1s1b
         Ukig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766351; x=1791371151;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTCXCo5OR+c8Iv1GP8nUq4PH5B2NnHbbWepDU2k+v5I=;
        b=2yo7k91GigAL3Epgn5qKKpvRgboGLrD0I7gFChInIJahUfjFvtkW3f2tamMFW2NEjd
         w1DIwDnplKrdQahLUOnmI1yBqLLDn31QIgs2CGF2hGBjLnFDxpltpw/bgDgwNAsY5Al3
         LsoOIOeOotZt++BsDUbMeUcCm8ShR+99KRiXychU3Z8iHS0TTRdnRnUNJNNU5tBJ2qu9
         gbvCDap3sfUfZJx58mru73tD7evACZIqm0L61PhgUJPtZypF5i758SIP12tySCuSvYX/
         CWeuIfZ7ggINLdc/GPRfinAzLf81hXe5npnCOYcZnYxi4dyNYOu+ZhPctMbB0MqifR9t
         wsKA==
X-Gm-Message-State: AFq9FYJ6+qbopTyPbfdHmaVX8VdZZiLjiiBTD/6qAXJ30fot/fIlMWg/
	Q0KvUQhcA4QxA05Z2wQGBre8+bXoaLMzGUXqeX15VlK3A7eYlLnBXnTnKy0hFhrK2KEnm1bWo9a
	fUT32fgLtbfSyKSMF1fEHoNU4VpqG5w0=
X-Gm-Gg: AYBFou20M3PZjkOp+u5cg9XRtTcIr/EDBmCVgOqli3evQO2x/YpBC3j8EY+p7mXXKds
	yYBi0ihc5JsI5Kq923LwXgptCiW1HflT72yrzOQe7JKjZbPoSY7Al5Q4mQj3hrB3DFbXilfvfDo
	vuNPzZoPVqGDXsY/Cdlz70VDsnMpLHvIleg2+6fuIRyjFaLH+9AgLmOa+lJbQDok0TIFv5sR83e
	cDh0g3Ul3u3gZNhxMwPwScg+SZ9UbNPIokvqCtlfInB0gnHCYBGE8JUBSvZSN/2yKZHnzopNXkc
	ot911gR9sXo6CnuLuNSEvDWcNPiDG7Voe8Q5fWwUcRbAQ7ZBwSxbVs4odgV9++Di2UHcIRiGX21
	IfbZJdpJrjpVQqdVzA8duSrgZn2az1gIg4skzs7zE8lO9Md5zcJhUwpxCCTE8AlEoKfYolB4=
X-Received: by 2002:a05:6102:5814:b0:7a6:e302:e24f with SMTP id
 ada2fe7eead31-7be7359dfabmr123703137.24.1790766350743; Wed, 30 Sep 2026
 04:05:50 -0700 (PDT)
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 04:05:49 -0700
Received: from 543150747168 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 30 Sep 2026 04:05:49 -0700
From: David Pieters <davidpieters1978@gmail.com>
In-Reply-To: <2026093012-paralyze-amniotic-65b8@gregkh>
References: <2026093012-paralyze-amniotic-65b8@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 30 Sep 2026 04:05:49 -0700
X-Gm-Features: AclHuK8ZB163fSS2v_LgACHGzyQ2H-jVlcAzug1VJilUJ49c0xY9B0G8Z3BJDds
Message-ID: <CAJ3h-bPBQf20naK5VNOMkTR_5opJO9oKg9QvGMiGDvjOtH55XA@mail.gmail.com>
Subject: [PATCH v2] USB: quirks: add USB_QUIRK_NO_LPM for ELECOM DEFT Pro TrackBall
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The 2.4GHz wireless USB receiver of the ELECOM DEFT Pro TrackBall
(056e:0132) and its wired counterpart (056e:0131) fail to handle USB
Link Power Management (LPM / USB 2.0 L1 sleep states) during initial
enumeration on modern USB host controllers. When LPM negotiation occurs
at boot, the device stalls and fails to register any input events until
it is physically unplugged and replugged.

Applying USB_QUIRK_NO_LPM prevents LPM negotiation and allows the device
to initialize properly at system boot.

Signed-off-by: David Pieters <davidpieters1978@gmail.com>
---
v2:
 - Insert entries in sorted numerical order by Vendor ID / Product ID
   in usb_quirk_list, as requested by Greg Kroah-Hartman.

--- a/drivers/usb/core/quirks.c
+++ b/drivers/usb/core/quirks.c
@@ -329,6 +329,10 @@
 	{ USB_DEVICE(0x04f3, 0x21b8), .driver_info =
 			USB_QUIRK_DEVICE_QUALIFIER },

+	/* ELECOM DEFT Pro TrackBall */
+	{ USB_DEVICE(0x056e, 0x0131), .driver_info = USB_QUIRK_NO_LPM },
+	{ USB_DEVICE(0x056e, 0x0132), .driver_info = USB_QUIRK_NO_LPM },
+
 	/* Roland SC-8820 */
 	{ USB_DEVICE(0x0582, 0x0007), .driver_info = USB_QUIRK_RESET_RESUME },

Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08DD3AE19B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059335; cv=pass; b=ryRLQ6Z9AQVdRO8uLNdnHchygqt6bY4zdQa5ibf4ApTCqtIYRpwQURxSiLgxdowD23aNX9rdcevDK/hjkxs7hD5rkEMTmHhxOf8A7l+kbxn+eXq1WMi5eaDno66U73i72yl4GspSNVcV6NHbr2/bpyYpEAIUAWsveofVRYppftg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059335; c=relaxed/simple;
	bh=Ze8p9X2Zoi1dZkh7hq2RK6uSNiLXlp4tgVATUvETeRU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ag8grfAiUwncJUONurS+qcZXaW3wJbdrQs9GVn/JCQC2MUO7upxHTnB59LoT41BHv8cIlxLdbj3UavAuL94R8DcF+8vGsIa80guhfz+UWqy/O3YyzjwJR6d8S02HlpCXGcUu/1xHHduZ5dLLsCmr0TRfH16DAvHOi/rzAZVrzeM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bplwbiiY; arc=pass smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bplwbiiY"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9b2f02so980211fac.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:55:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789059332; cv=none;
        d=google.com; s=arc-20260327;
        b=DW8BSPkuk3y7cfujCVsUxndhYeN2l1YlSBCGvzNlT8tTdrXvn/zlaOda65WQIsoLZh
         rX95a+VGzFvmF7i3vRAO0MQ79gn5w7D09VpZpW3gpGJhDdli6PN422u3+Ssej/HwxX0M
         noG5d0s6BAfAZe06IDLAf5maQjQjc20eapg3s8j7xDh8xe8qaipJ4pqZMeeoLDIBgnDd
         405I7DIRNyxPhgpO4s/8dUwsOcW6PT7IfPGiw0W4Q59r6oQbY2uus/lAUfYx7JxRJNBl
         sqOakeR1evT5rvfDTzHNor3/GGVRI4NOslfwP36DnB7+fuGkmt+hytGTqEP9Qdeyzd7g
         OMPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Ze8p9X2Zoi1dZkh7hq2RK6uSNiLXlp4tgVATUvETeRU=;
        fh=+Nye9jEeIoa0yWaRzItJZID5YksWxmCtWv8hW9ayEFw=;
        b=Xb1oefmEpWL5SVF5rBkYY/GzI5zbSMsrVEYD8V9mERk3SMCiqNCL7cMZvdA3bDAVhz
         B1A4ub0sITckjH8x5mji81TKyIoowapo7lRgNycfAuiHDLH/ZiLEyd8iUIRBfvcbNjXu
         Qv/zOmYB53C9+TU5Rjj1KGX9W3kmFQCztyFW6RTg6e2h/WNiafn32L3+dmELpALoUrz9
         /CpSDMKz1n7WqePLKVbzWXmX6lObZGLOzTvoJ4MGnhtWdCE9oa2udSK6sQ4ErLAo14N+
         nesV6iuTWaXxseSK91VcG18/tSm79eANeev/Q61sLt59kzwVPnc0QeWgOq3jRWm04QSe
         bifQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059332; x=1789664132; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ze8p9X2Zoi1dZkh7hq2RK6uSNiLXlp4tgVATUvETeRU=;
        b=bplwbiiY2uEpL1LMJjiaYMFnMa5gxr+iJRSCsuTJCFSAGiBvOqvU6mwBaSkocCRkdu
         uR/7hzAyHzSBKc21CL6ImPqOEF2cZxJBFa9PLbmKXUHNJPpjwZDU7DPj40aEpcSCeNKP
         yLibTecA4bkxlHWu3anReLGy9ZQcS2Fdy9+btgPUKeOBTr3+XoJMSVmBOHXHJD4nk6kD
         H4qOpmJ6UNURyiVdJkOQF0ilT+NwWoz9s8QyTETtgO8JQ26MD7im/hf4b6WbiynzXABU
         Mf3LH9pFsn3Hhk97zdgncX6XJ0ATsgeLmWBAbtc3EEgMZTZWGh/Es/JzuPXsCcegoEIH
         4odQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059332; x=1789664132;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Ze8p9X2Zoi1dZkh7hq2RK6uSNiLXlp4tgVATUvETeRU=;
        b=NNYLECl4mXS0ovW3lkhkTpej62m+ZfiegppzBaywOCaInwwH2BTcNpQ3YU6/DunqDM
         a4K57AdqsYkzWEIUMF0veYAEbD2j/firU2Dcb7qbdN0sst2Up8WS4cALBhJK2TyeGYNL
         7LBvJNuaaOhjzTXkdtb3rDBjBGTVMdHOBnlADRWxLo0A0CBZAooxFRNh4vhQngQ5q63T
         TNWNcbsHmOf4XXy4C8kZpe5oSfeOJD0NiOu1F7AV+nGFW0/Iy61yyhEjb72YVl4p78lb
         JlLXw1XU2rUOS4MXYXg3CLuGpRX620LwBYpLvr5aU9a4jm4+uhwB5t5Ji5nPxSkOjfed
         /6Dw==
X-Gm-Message-State: AFuF++nGUnUOcWuQXxKDqY3MPKZ/ZqVP5czrcGpZ0O0khkqjhhUjDbvG
	N2WI7NbPsAkUYkHuurtP173nl03X5UuncnE07mhh8e1TsN7oEDwSZGMVsOJZ2tBvwc/gghhNs+m
	Wfc2naM6GtEtWPKhNtmnRoWjRVPgUBQY=
X-Gm-Gg: AYBFou3njfSet+Bn6+b7oq0Ewczmj35ozrUNdQu4Uk/XYVDnTnPqZWYdBb+Ks57XQNF
	RyhqmpWRYGzHYQcvQKSMHeAW/WJS6jmWeDBjSiIJtPPd8o2uPRePEvZwtqNIqd8RsezeAjQVHj6
	aEH3IUrrn7mOtS4KFP3Dg8SGQIxJUgFIesEZwjNwKgWfr7gQSJI+MfL/mOnaTv0qA6+oh2VfBql
	OGxp6ABlrABlUi4VXThSFSdbdvhFEBgpaZpKDSuDUXmdNfu5mfhzMNSbs3C6UHz2OuI0QQScoPy
	6XluA1Pf8U5SpZ+j+/1KRHkfvQo0Ge0qAfr8l2+pAON+V5X3a81ooN0FfRnhHuS2QA8FSZtnAKX
	DCZdLsL4ayd8=
X-Received: by 2002:a05:6871:5a11:b0:470:e96b:43e2 with SMTP id
 586e51a60fabf-47dd3f5e9bbmr140773fac.14.1789059332092; Thu, 10 Sep 2026
 09:55:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Brian Anderson <173brian@gmail.com>
Date: Thu, 10 Sep 2026 11:55:21 -0500
X-Gm-Features: AcwNN1V_aUZf-EDgVruHlR0V1ORkEqX9SnOsqZip1nS9dAm8K5b9V_KK5Vkgvf0
Message-ID: <CACQPMpo+f7E+StoQco021PXF=bE-8BOfQxChO5cs=FfO4KM=LA@mail.gmail.com>
Subject: Custom Power Cap for Radeon Pro v620
To: kenneth.feng@amd.com
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Thank you for all that you do with your help maintaining the AMD GPU
driver. This issue proposes custom power cap values consistent with
the Radeon Pro v620's SMU that are currently inaccessible due to the
power caps being derived from the VBIOS.

Recently I came across a friction point with the kernel driver for AMD
GPU related to SWSMU. I have a Radeon Pro v620 and after reviewing
community documentation resources I came across a generative AI
assisted report
(https://blivioniag.github.io/gfx1030-wiki/tuning/power.html) that
talked about the power management for the v620, specifically through
the lens of LLM processing with the v620. The v620 does indeed list
it's power_cap_min and power_cap_max as both being 250000000 (250W),
but the report I linked is also correct that the GPU's VBIOS accepts
values lower than that. After following the report and rebuilding the
kernel with changes documented to override the power_cap_min values I
found that the GPU's VBIOS SMU does indeed accept lower power cap
values than 250W.

I understand that this is a difficult issue because it doesn't
represent a true bug in the sense that something is working
incorrectly, as the kernel driver is correctly reading the power cap
min value from the VBIOS. That being said, legitimate functionality is
being obscured here, and there are many use cases that would benefit
from being to communicate with the SMU within it's accepted range.
Would it be possible to include either an override for the v620 or
another means of deriving the power cap in the AMD GPU driver that
could enable setting the SMU within it's accepted range for the Radeon
Pro v620?

Steps to reproduce:

echo 200000000 | tee /sys/class/drm/card{V620 CARD
IDX}/device/hwmon/hwmon{HWMON_VAL}/power1_cap
For instance, I use:

$ echo 200000000 | sudo tee /sys/class/drm/card1/device/hwmon/hwmon2/power1_cap
tee: /sys/class/drm/card1/device/hwmon/hwmon2/power1_cap: Invalid argument
$ cat /sys/class/drm/card1/device/hwmon/hwmon2/power1_cap_min
250000000
$ cat /sys/class/drm/card1/device/hwmon/hwmon2/power1_cap_max
250000000

Kernel version: Linux version 7.2.4-arch1-2
Distribution: Arch Linux
CPU Architecture: x86_64 unknown

Thank you,
Brian Anderson

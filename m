Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617A43B6BF3
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 04:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790482315; cv=none; b=Q99PoYSXPZbnkTmlc/xpqFV29UIsc9lrd3+lgqedl+OlHS7E3efMK6BD3yYqSn/IjtmNnKSx/oe0tSgsCE3kL/1YahuKyzkSvwqytQm/lZm+TQlA+nJV+egWpNiGeMi7o/d2RR9DQ6fEsjt5sZpNJ8/IVHrElcQR90Sxip4v/tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790482315; c=relaxed/simple;
	bh=VLWeropCVNgal1tBk4IXkcnMMJw8jlVIylymhpt57Gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDDBjnYAafP9874sW59d8w4KtUspgl3VO++bI27Ym65e/jgXaTeJgi+gNTFQ9rS3qQ9mNaNt0QYDflTbyMH755hHK3ACSVwwmYM0/uvGNnYmYZaRXSMvvjhzldWMKuqohqtCLVAKiuvFFFlCgEGE1MP5Ni45ZpAVN3rN9LfjwaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcRWV2yV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcRWV2yV"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747f05ffcso8647305ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 21:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790482313; x=1791087113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcS3RenUvubWv2f6ewrazrqpLWiguUUmu4bcjJFtKKA=;
        b=bcRWV2yVhc82pBpim2gBEX9WEQBVrZMIjH5Pe1X94z4hA/HHAoWmSmuZl6kG+ahps/
         VUC6XStFQXntIVFNSB0z3ZVFHgnD4gHcbvKMkfctFMueWVfE6snD/Zn3jx/BQl+4pfkn
         L4A4zPsf0F2K7tbR0ajs/EAaiJnEn5zGFsCJ0Idlg4+JVqe38SzKfMket6JPNQCP2Gi/
         FZZat6wkaDAGi2fcO+SDwl00dkxBjyRlMlrAN5ApEu1BXr4k61MpMpXJR2TOaZPWCY4m
         BXRA1ea6laob1uf2hAQzrMM8qRrziB8NBSTDNSmIC6V9IYpwKi7luTCdQhI6oBLzeZKS
         etdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790482313; x=1791087113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcS3RenUvubWv2f6ewrazrqpLWiguUUmu4bcjJFtKKA=;
        b=e4v5fTFaScltQlA2ABfb1GefNwC8MrXYZJcTIZfuGBJcOfd8JgnXVU55Uyg19taOz7
         jskO7yMCvB0Ixg6TtY3qP03mtm++qPaD2f6PqPMW+ZpU27UTHZwBaVHiv7LgAt9Rxdwi
         0OWtqfx1EZHd7En7HsNtX6CWKF3YXlrdP7TMZe7wt0mg5hyCJAeGkpj1cfdElz7i5/0Y
         6zzin3xezfZLRylz3wnkyyqG4QumrZ7CLgFOBQS5/o6KKxnjuhIcijezxjbdNq2WrBAF
         3ZoKHFt+lhsjYOg02hMkelXpr8JQJaigna7IMfaEvvHNdnU+h7MxuM3SYogfG7Vy4+ZN
         Gp6Q==
X-Forwarded-Encrypted: i=1; AKwUvBz13jv3/GIrdRfqmYPV7pLNwyGqkPysJ45st9a0dHhmq/6uP4lKWY1UYiU2D0jxeHUoWZhNenHjZ8l/F8M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMyt05hfegT5g2WpbLML8cK1TWI9riWQeAplyabYP5b1UktVGV
	EcjyJlsTbKeJZ5i44YALLCQjnX/t5NeUfnlhUEbaAvQnVQxfpP8pPFfq
X-Gm-Gg: AYBFou3XDXvKmzqBpxp2GKTaICid69B3cQ/a52fClSojUStrufw/G3WQ8kYssixFu7+
	dJmhC0cw7UnEj7InjaUg0csZZrE1WWtA4ZLXWMnr6A9mp4xd3OmGbGTYTpSMQkas7jnwiC166cJ
	f6Q4WPQIItMH17Hi4r+h5+ibqCPevQAz420XfXeNtOECrq8U6mCYMbrAqh13Nd/iOR3CCsigOEe
	HmEqXZkR+6TlK0F7+n/Yqb9DyHX2CpqJpAGI/5D3ykHWzNUWmwdtEngJbA3JytyGRbSjZshokAL
	il21gKjEHGde7TZy3IeSB3l1eApQ1HuB6DYz22B3xZXB3vnF3Zo91EfvJW9x2MqQW2l0RwRrj5+
	n3J2A26sm0oVppwEHdgoNvFNm8mDNftljria5WFWcXWlytveaBOis/dNp0p57TEUsr3ezHqy4RH
	6A/WyuaP8oNV0r7m3sEjXOsb0AYopK3gKRcU1E9C61kordN+6S5gdgh6ossp44ynQGOmOva2Qde
	AWDQ0H7VSEtpdc++ZCoKCsy
X-Received: by 2002:a17:90b:53c3:b0:3a0:4668:4cb0 with SMTP id 98e67ed59e1d1-3a09896a5a5mr8482883a91.47.1790482313402;
        Sat, 26 Sep 2026 21:11:53 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b4f6345fsm5542732a91.1.2026.09.26.21.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 21:11:52 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 3/5] HID: wacom: check the input device in wacom_intuos_pad()
Date: Sun, 27 Sep 2026 13:11:36 +0900
Message-ID: <20260927041138.4112920-4-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
References: <579o8so3-09o3-o312-4sq0-0qp6n672q46p@xreary.bet>
 <20260927041138.4112920-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

wacom_intuos_pad() takes wacom->pad_input without checking it. An
interface that declares no pad leaves the pointer NULL on a fully
successful probe, and wacom_intuos_irq() still calls this function for
pad report ids.

Reproduced on linux-next 20260925 (x86_64, KASAN) with vendor 0x056a
product 0x032A and report id 12:

  BUG: KASAN: null-ptr-deref in input_event+0x44/0xb0
  Read of size 8 at addr 0000000000000028
   wacom_intuos_irq+0x1b46/0x3300
   wacom_wac_irq+0x1b59/0xb3f0
   wacom_raw_event+0x68f/0xb60
   __hid_input_report+0x398/0x4d0
   uhid_char_write+0xa99/0xfc0

The function only ever serves pad reports, so the check goes at entry.

Fixes: 10059cdc0ad0 ("Input: wacom - split out the pad device for Intuos/Cintiq")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
---
 drivers/hid/wacom_wac.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 794c2865064a..48a58a6672c2 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -553,6 +553,9 @@ static int wacom_intuos_pad(struct wacom_wac *wacom)
 	bool wrench = false, keyboard = false, mute_touch = false, menu = false,
 	     info = false;
 
+	if (!input)
+		return 0;
+
 	/* pad packets. Works as a second tool and is always in prox */
 	if (!(data[0] == WACOM_REPORT_INTUOSPAD || data[0] == WACOM_REPORT_INTUOS5PAD ||
 	      data[0] == WACOM_REPORT_CINTIQPAD))
-- 
2.53.0


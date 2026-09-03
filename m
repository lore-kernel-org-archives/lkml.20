Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B494A0F02
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788437332; cv=none; b=H04wgfGIXLz6faLOajdlVyLix4/IzPokKOwrVcvOTQqy91x2CzTmU9IGN9pzSHbSlexZ+aF2G9+1ROA8vTwca9y7V9+Qryjum/Po9OmyascEuJPkKqfA4dVM6PfQqgy/WgnHfeiu/yCAZF9W4wgN0QMWRr1QNPIBXI4eijWdvoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788437332; c=relaxed/simple;
	bh=DS92zY7UggopypjAfNvS0nI3xwM4VczeNIlJ4DH107g=;
	h=Subject:Date:Message-ID:In-Reply-To:References:From:To:Cc:
	 Content-Type:MIME-Version; b=SD1giOmbsdcTTGHNmVFCQsKkIvrO80rAPEabVc8Z8VrRf6vLSmC40XdEu0UA7bSmQNzR2Ydbu5e0cVfXuyVMvHylPOou8148Q8z0pGsjPSZ8qAGa+418zMjVufK4dAjSX8BdAZMZT2jRKP+2mttBwjTg8nCLDkdm3LRcLH1L9IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9Fzd3DH; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9Fzd3DH"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-84830c774a0so2507446b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788437330; x=1789042130; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:cc:to:from
         :references:in-reply-to:message-id:date:subject:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cSmqLTzwH1GLgzGsnxGCY8DR/cpVAEWeeTTJ8+EvwM=;
        b=I9Fzd3DHr94RnEW96jbjjh0lOCRs2n0uCr8IiwQDB6Z++YbtCJrZESgK9f+VkpxCrG
         MrMSCeiu90unl4FhmHNdSebLSOQNBv+RqdXAg3eHW93m8U59JIx6+WG3xyfNYiD5cfC7
         C05aGUTkuaMvl6OuquhKwSRIwvu94nmhA6+rVgNuTpILGFSnhiu9PRJvVNyKOCsU9NK2
         E3GMpc3+TDCtpiY+rGfin8sJ19UY1VsD9//1SR3caiN73oHK68BdPwRM9tnspdkXnbzW
         UuCHxylht5SvWPTul4v6b+sxXfpdJu5P6IuaaL8dFTVu+9rcsxi9ZIe0ji3HEjcjl2+B
         43JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788437330; x=1789042130;
        h=mime-version:content-transfer-encoding:content-type:cc:to:from
         :references:in-reply-to:message-id:date:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cSmqLTzwH1GLgzGsnxGCY8DR/cpVAEWeeTTJ8+EvwM=;
        b=SZkma9KcJasAwL278QJgjH28Cs6LA2XmnTIigyjhH0uMA7gcyLNok8SUmuCUcs/mjz
         wJtmpgEoPqYa8x+4gAk5tGC9kwW72ky5sniQtIpxrshBIN/ZRUPRy2o9OVPLVQZMLpdd
         Hr3P1xGgp4Wo92/riQw46eAt8gbd16rg6BvrgJjK3cA52LzLrqljNcEQ351BRVhIUM2g
         FbAUWKIl3doJBHjH2IW+LlgXZdAdELXhlS+WUz8cc3j52bBX0zUC0YfsfwSjBX/U+fXR
         Hz9aTg5b89c79xTpppT0dXyEd4dNBGzBjfQQWOWW4l3N4Mw7zWnnwOMruIQLkf/SvQIH
         9DRg==
X-Forwarded-Encrypted: i=1; AKwUvByG9YHhXOSx52n8r0RRQZZu7cYl0L3nnnWPJIRGpfjUTynR7RgWVTmmA99lYb5Ewt93ycXUgIBqDZvAA+c=@vger.kernel.org
X-Gm-Message-State: AFuF++n09zA2rbib9osedKddytmDBrKJd2JiQVKxUpPwtA1CpSGdQ+ip
	slRnkiGuIPmIrPSwcQfsmvv4+8jclXhMoEMOuw4PAijSG4Dsmwv5WIY8
X-Gm-Gg: AYBFou031ojaIP8I+awSXYnFpm6+mv7vYQesHt7YtCsTpyHO+XepiB8AXf7a8WKo18S
	Y44vzP10cIZhmDqlpj7l1lBfy8wNXEtyazPmpypj+pN1+Q9hT1CynKqTPslhTNVDAQVYlkLxnLn
	Wit8lSVQBxAMIO36N8sCkngFlh3WJHBhNXM5DPJSpbC2BRKfgTYst2A1sEzVpve82ae6/obTlu5
	XbGDPm0WJ3ZcRKxIcy+EpweDubTn4J4LM7jv8PaFXD6iR492UTTFMcdW0tVfcYILYYW0ZKCQy/t
	kh+HDJB1zcDgziijcGwnlayK5iNNCSL72gUpltJb2pOabhZpcy+s8E653ugiYn//XseV27UHaXd
	x1j2Nw2cC0EvIQAdTD6phsuqpX5TpxQnAdGhtmL10GIATHs4QBKHPRULR1vrvuED3bXxDXvsCGb
	TDCqj97urjeWKTydsvX4YLuWjOhgP2Qa/Sd9M8Zz743slzzWG8PHHasJCYs8qTElYXKg==
X-Received: by 2002:a05:6a21:3944:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3d9af3efa11mr19982146637.26.1788437329916;
        Thu, 03 Sep 2026 05:08:49 -0700 (PDT)
Received: from [192.168.71.146] ([240e:b8f:91e2:d400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d424edesm869853a12.22.2026.09.03.05.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:08:49 -0700 (PDT)
Subject: [PATCH RFC v2 0/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED driver
 for ROG NVMe enclosures
Date: Thu, 03 Sep 2026 20:00:00 +0800
Message-ID: <202609032000.RFCv2-0.lhw@gmail.com>
In-Reply-To: <202609012200.RFC0.lhw@gmail.com>
References:
 <202609012200.RFC0.lhw@gmail.com> <202609012200.RFC1.lhw@gmail.com>
From: Liang Haowen <nbg2974@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Martin K. Petersen <mkp@kernel.org>, linux-scsi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Denis Benato <denis.benato@linux.dev>, Armin Wolf <W_Armin@gmx.de>,
 Hans de Goede <hansg@kernel.org>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hello,

v2 of the LED driver for ASUS Aura RGB on ROG external NVMe
enclosures. It addresses all seven points from the review v1 received
(from the sashiko AI bot; there has been no human review on v1 yet).

Changes since v1:

- Teardown order: .detach() and the attach error path now unregister
  the LED class devices first, then cancel_work_sync(), then free.
  The v1 order (cancel first) left a window where a brightness write
  could requeue the work after cancel_work_sync() returned, so the
  work would run on freed memory.

- Request allocation: ene_write() now builds the request with
  scsi_alloc_request() instead of a raw blk_mq_alloc_request().
  scsi_initialize_rq() zeroes cmnd, initializes the rcu head, sense
  length and retries; skipping that left those fields uninitialized.
  An explicit timeout and RQF_QUIET are set, matching what
  scsi_execute_cmd() does.

- Serialization of the ENE sequence: brightness_set() now only caches
  the colour and marks the LED in a per-zone dirty bitmap; a single
  work item per zone runs one sequence (MODE, colour slots, APPLY,
  SAVE) for all pending LEDs. The v1 per-LED works could interleave
  their sequences between concurrent updates. As a side effect,
  multi-LED updates now batch into one APPLY/SAVE.

- Subject line: switched to the leds subsystem prefix and
  capitalization.

- The attach success log message is gone.

Two of the reported items did not hold up against the kernel this
driver is built against (7.2.2):

- kzalloc_obj() is not an undefined macro; it lives in
  include/linux/slab.h (since v6.17).

- blk_rq_map_kern() with four arguments is the current signature
  (rq, buf, len, gfp); drivers/scsi/scsi_lib.c calls it that way from
  scsi_execute_cmd().

Everything else is unchanged from v1: the hardware (ROG external NVMe
enclosures, e.g. ROG STRIX Arion, USB 0b05:1932, no HID, ENE LED
controller behind vendor SCSI commands on the disk's LUN, 4
independently addressable LEDs), the scsi_device_handler that does
not claim the sdev, the multicolor LED interface, and the
protocol handling. v2 was re-verified on hardware.

Known caveats, unchanged:

- the handler attaches manually until a notifier lands
  (echo asus_aura > /sys/block/sdX/device/dh_state);

- SAVE (0xaa) is issued with every colour update, which writes the
  enclosure flash each time; wear has not been characterized yet;

- the LEDs are registered with a NULL parent device, because
  parenting them to the sdev creates a reference cycle that blocks
  the sdev's final release on unplug.

Comments on the interface shape and on folding this into the shared
Aura work with Denis remain very welcome.

Signed-off-by: Liang Haowen <nbg2974@gmail.com>

Liang Haowen (1):
  leds: asus-aura-scsi: Add ASUS Aura RGB LED driver for ROG NVMe enclosures

 drivers/leds/leds-asus-aura-scsi.c | 332 +++++++++++++++++++++++++++++
 1 file changed, 332 insertions(+)

--
2.55.0


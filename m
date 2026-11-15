Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760637;
	b=CeB+XjlWB7lMONSk25BTWqzNm467rwXhuGzY2ahqy91HcFvaCge7eOOGqhhgiy3DAV4s
	 HUGi8lQ9WV/E0MXjQRE73A4mCSph2joCR8ASajg125Vk0kKjxZHKvQjzWz9GlWW9gjLNk
	 7LbSMDEMByCNnac0c5cDfkzPi7TZisIOhqCshemt0mSi4QXpHicogMrvd5mRPbR3sIw9z
	 pmXkHC4kQdA0HjxsOHlALOAgveaykGYDfDWy6/9RgtiSimyUL2IF3PyEBj8JOpDuoGE0K
	 zVQsmcl8wtZD19B+sjykq5HbN4MwZqy1+H1uLZefBI0U387ajmq4Hw/j0N43PMGxm/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760637;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=h0UIOA5y5g73G2xVp5c5QuGwzYb9nfi5JmvYX9WUW4U=;
	b=1QQtcPJGflOomiy+x7CJqIsSRa952tspyt66lyDqDob1ncaefHfFPwFCM0U0+iaMxHEE
	 Rx53OoDmUU9Z3WREU0jKECJnj/1W2g1/PONK2o/R7xG/2kSmAVHYv/TwuFcQRj8ofv8vC
	 7iY5l+1pZOd3+dI84hj0CDy+4A3IZChPWz5O6rMnafAokH7RwECLsbPG2lzZKTLU/yaAx
	 KE3x1e923kl438gIP7hoqlxDdx1JSRO8RnkpEQ7CA1U08ywDyYivWlSfWoKjQRwO2mLnI
	 nwGRDuTTp42UK9h8Ho9IJ/XqEnGGr5dEI3lbwUMPx5iQt9vGMJONXsclmnSbYbQ396Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqyV6JyO;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0513A606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0513A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QqyV6JyO
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a2761c69fbso3304848c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760636; x=1795365436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0UIOA5y5g73G2xVp5c5QuGwzYb9nfi5JmvYX9WUW4U=;
        b=QqyV6JyOFTRAuPpUpSjsHjh9IltAK1HRjYR22txDU9rj6OyuT6FBuBqcxjeeWYYxam
         SZTQrd5xAckq5xaBB+yc2zXRsLxU+BIbtCalXB0e0AmJesDoOB5ZLXOuw8CMAVf2J6FF
         24zyCDpaVw0u/olJEZVIyTaJSt3jDIXdq3cQ5H1PSctybE2rQ4eK7RZN+11l6XX0CuHn
         06I05KDZAiEZRHzFTQM5Eh2HUNTMl0tzOedZ9he4BQLQ8CGHzPN9ESUkp/nMiSzMJl3U
         T3ewmEaTRByrHFBgI4xz2gCTsjEmVfeA3h27J7ShH9/c6I+jswMEagRseT/dnHGyIfrm
         iYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760636; x=1795365436;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h0UIOA5y5g73G2xVp5c5QuGwzYb9nfi5JmvYX9WUW4U=;
        b=BYRN7OftytQToMJQSAPyxDAjRhX+SUX+ibbcXLzU1EWS6G2qDfAfN/EjUWnP7ygc6K
         oUXefRQJVTkU6L4819V/V6ZNc9MIdQEShCXY+rwg8EuSP+SkQuG2wMRY9DoYk5X/atAO
         DeXPnjmKR7fUi7ia4quzi0HvpuzeVUIbTmj02A+ZaRbdzujpwRUuaSOgR7vCHIm7ybzi
         gqWq5sPUXQ0nIfvJ3b3oPdH38AIeLzQ8Vj23gzARQXVI2z50JrgBIDDCg/aw3vBG20qa
         NpPswfBeKwmCuGP5YyuoO2Wy7+4ILunVAJmzG6ahqP9jWGg3f+9UqNzo5/11s5ne7Gj8
         T+PQ==
X-Forwarded-Encrypted: i=1; AL+hErHDJmeNW6jI3l/9ekVCo03f3qOg45st589IFKZqFYXAMqPv0tPyrIeaQjucDzH+T2f4sflKowRTrY5Uip4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7wqeZuEixR09sch8kfSYzLovzARFINV9dbFzd4E5KTheHwnVK
	L1Rhsaz21LhTDwcrXxF8/zDKdGnb7aFUC0AbkdgzpZn2ivHovg2v7c/7
X-Gm-Gg: AYBFou3eg9tdaZIIlRM5NdCEEcMXtqWIJVcErnHQjByeupm9TgA23pNy0DNfqPfDOF8
	JghayplSR2r/DPWDfPlts2+NlXGb/LpFarnX2NJRirfFScwT+4I/OZrUw5HFvtdVUNbSBGl1o/u
	+0TS8DxgP0eEhoPdWiCYOvumsf0TctoV59XTAaaB4+DAOJVe1EujUOT/+7TpXixYFLIPVZXT4p/
	7WhFohc3+JpzNTrhc+vZwBILsRRvxm6Sv8RZpPeBs2lt+ONGZOLqnlGjsxYyHWBK5XxIDFJQR4J
	uFUCRzCqa5nq+FoT4HFM0JnhsJQo7BAWBs0Ow+50cfKWy6HpyA4jQ56+E7tWWBxuo3CofCs7pDN
	oFsEIIX92rFPHrA1wTOwvpLuPeb66/5ZFPfyfbzDm10cUGxWydhncEx/8AIQnRHQgwxdYaSxze3
	oW5YCIbMdZBsOueS+79IDeEGQyVwYJsnmk4IYYpl9vKZMeSx/sGmzkM1GZAjT1jAidgUyhELwbT
	TVKJrvcQukc4fUn5LDhEM6n2iwOembFfSXGsFZseMW/c+we6MJOtm/qLN4Xf/Vts3GU/tN5sMqg
	ZXkTk/KRNHQItuk9DDDHN77vmA60DZ05zD7Yp+2FKSzZjl2fSYCSWdq1Ny1+p8w9mKBCbx30lc+
	EdBs3sfeAA7CmHQ==
X-Received: by 2002:a05:701a:8458:10b0:1b5:1a5a:1dc with SMTP id a92af1059eb24-1b51a5a0221mr4419691c88.12.1794760635969;
        Sun, 15 Nov 2026 08:37:15 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm26437031c88.14.2026.11.15.08.37.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:15 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [QUESTION] usb: usbfs SETINTERFACE during a runtime reset-resume
Date: Sun, 15 Nov 2026 08:37:09 -0800
Message-Id: <20261115163709.226641-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Alan,

I have a question about usbfs and runtime reset-resume. I am not sure
it is a bug, so I would like to ask before sending anything.

The kerneldoc of usb_reset_and_verify_device() says:

  Locking exception: This routine may also be called from within an
  autoresume handler.  Such usage won't conflict with other tasks
  holding the device lock because these tasks should always call
  usb_autopm_resume_device(), thereby preventing any unwanted
  autoresume.

(usb_autopm_resume_device() no longer exists; I assume
usb_autoresume_device() is meant.)

proc_setintf() runs under the device lock but takes no PM reference.
After USBDEVFS_ALLOW_SUSPEND, the device can be runtime suspended
while the file is open. If it then resumes through reset-resume,
finish_port_resume() sets USB_STATE_CONFIGURED before
usb_reset_and_verify_device() runs its restore loop. A SETINTERFACE
issued at that moment passes checkintf() and calls usb_set_interface()
while the restore loop is still reading intf->cur_altsetting and
calling usb_set_interface() to put the interfaces back into their old
altsettings.

On v7.3, with dummy_hcd and a gadget that forces reset-resume, I saw
1097 SETINTERFACE calls complete inside the resume window over ten
rounds, all with -EPROTO. There were no KASAN or lockdep reports, and
I did not see any corrupted state afterwards. I know 7794f486ed0b says
that I/O to a suspended device fails with an error code, so -EPROTO by
itself may be expected.

My questions are:

1. Is usbfs expected to follow the assumption in that comment, so
   that proc_setintf() should hold a PM reference while it changes the
   altsetting?

2. Or is it up to the program to call USBDEVFS_FORBID_SUSPEND or
   USBDEVFS_WAIT_FOR_RESUME first, so that this overlap with the
   restore loop is acceptable?

3. If it is the first, would taking usb_autoresume_device() around
   checkintf() and usb_set_interface() be the right fix? In my test
   the ioctl then waited until the resume finished and returned 0,
   which changes the current behavior of failing with an error.

Thanks,
Cheng Yongkang

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624927;
	b=HQaDYK2actfZ9aPJndFupOfEt8IV2IqnxeSG5ONbW51Nx1ia4OFKQ2bqD/dFhGPsjjgW
	 LG5kjnk8xOjzjKHUubwT7UfkG93PDT7MO2F59CVD7pNE6/Ic/MYF+wQqfiycBstYwhdcu
	 eYjToHQ6mhFkJp0H7NAN3VpfNy46JH+FlFRypWU4KiL7gJ8FXmY/b4uxU8dAaK6OhKKH2
	 NrOLYXnqbpJ7WYYw9bTnDRZBlu7dyYUWKYwptvOC9zdUhuVGG/YOMeiT5lu8U3JuwNCdl
	 V7yaJ+0MO9iC9krxgdLt0fJ1IRRNrSAPMDyOnocowWQwpyj7FSFkuSR8RSmj04hpVRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=U9QbGtzeNGJqzyzCb4IjDhpDG3gtmR1xtKLnaooRWwg=;
	b=G9RAi2IHNshGVYo3jTBt9MBauyG76/z89sghQ8s7w5qSEgn+7KanHzTaFVhMfyQTrl5A
	 FwKhbVDSiFNckh5DBBAGj9nt5uSVI9l+6irucCHgx7D7mKsWevWl7CJjdoqXd4sfGSMf+
	 1dPCCRBxiGQC76vVM1svRii6JAnFgPWZiUjobLNnjuMnTh0IKW5JbbAwQyFZQ2i6+Z1MH
	 o0iSv6DQ4W5j66JtgKBiiZ+UXPCYCMQrQt2FjJYjxT4BctYaPPlkXw9q2XYiOhYDh9o7h
	 gJWIaoxxc8Dq3KnUUfHKhDizdtrBlSdjyL6t/J2x0VyXLG2om+g6Yxp7vMwPCmCaw2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j/697NcG";
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA82A606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA82A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j/697NcG
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a18fc7a38so5156355eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793624926; x=1794229726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9QbGtzeNGJqzyzCb4IjDhpDG3gtmR1xtKLnaooRWwg=;
        b=j/697NcGRQDxkvUj7OWJYXmLtHTaGypmTBLd7YgbPvcb2Nt/eY4r3D21B9ZFw0VIx5
         w5Uf1IwS2Sdvl7Pk3BKbnX1YWzrBKK6NKfxCPjgztnKtAf0LMsM3dcJm9Yg7elRPB9XJ
         8lEiTVl1JDqZ/sGA792TXSQqrq6N+gBYhbzdHhAQrBSQUYFGseSf2UdW6hc4kghhjFul
         XzoSg4a9Q/PJwWEB70/08It9ze12d+i2M5AAkwGAYAeTBSrOcgAwVYjEX7cxipP3ppO0
         CkSrEkQjWwGm1E7VbVbcqFPB+U1DwD3y4fRqvXkFRoMbZLUrAS+RNDGFh1Om08rD/pbE
         9Heg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624926; x=1794229726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9QbGtzeNGJqzyzCb4IjDhpDG3gtmR1xtKLnaooRWwg=;
        b=woiSHbfY9GZ0U3P5TF6HQIPUTUOEO9PRNAFp1nCJMJmca135IVlP2bgWKpE4hbfrjp
         j/N680P7PsQuxZyFmyykyW8kxgUF3xnrfsy8D7PIOJzNi61Cwm+CXtSx0FHpduWadMYN
         PtkaFNLJcV9PVYqX9uNuLc9r9Ri6Pcteah1YCnCqY7C5FD9ZQIHgJzXW4lJu60AJkppU
         o2fOi2+QDwlMyB6YFy8Gl6ITEvhmfHlXpBY9ElfjnyGqxkvu46BB4g0Kg6YKv7nEASeD
         J8m+z7P6V4KwEqWewL/vTjTZF/K5lOr4rx5nvpCCtbUrFvhmS1VWe1QJoGW4uMM1hnUa
         PG/g==
X-Forwarded-Encrypted: i=1; AKwUvBx+f+saET8Mr9kHTG0ObvG8fveQ1IJVbykrZN5mjWrzX9bI9JNr6N0kDTQ1bvFu2jAxG8+S2lVbZ7jgN+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUyWYiPG6Zmb0bHoC12xbi378upI5YdujpWUn61lIC9lt42/iw
	tDNzXOifEmwGpRMopVNxpIe2X9zV6slDZtlqL1LC9HLzd8YcJ93D8WIs
X-Gm-Gg: AYBFou1gnwDrbNLjq/TBiDc7b1XJQLBv0RcR3CTbudC0buKA43BjXQzO6xxVZEa+8Qe
	KF4OJf5Y8evXhC3JuWgSb8TaAtxdk7YIDqTUviWSB4YQDZeg3yHWSrf0z9qWsG+DKHMwCTG9q/6
	7mDRPvXtfNtjF8ykW9qxjO7vsVrJja1h84GXKBhTSsU+lJKi0+H/wedLYbyrx4tLFZAwRoipO0x
	oCmamustBKmc/eDt1f6XtVIoNBketUKJFUFan/fQUooD99EGmvSefBw85ktTLwWU1Ub1BabB8MN
	pXay27n/T7TbL5jaH5IeRGCmexqGVxavB6uoDIeskM2mazv5kJLTRbhXmLMWChcs/3jVzKUhXVy
	l2VgAif5g3iW+BqBzH3YuTrwH0UlCyXVNw1JFep/SUWlDzEFTM5Kw/qDqheeJWRXP+u345ycxb6
	dlWP6hZTX/9jiYTkEnXxDju46Fz8yDOquHxthHKe83rEc67oa4cktFBtaT0wi1V1IbMXMR+TPiL
	TQzmyyVad5a9bbhLErkmdZo5rdPdT1nY/z0q9MpbyE2atNE3FL2OGvSIhW6VTOXnO7VUivjMwgr
	XYNw+tWQYzHVJkojr+3MAN/Zf5U=
X-Received: by 2002:a05:7300:d0b0:b0:369:9eea:cd25 with SMTP id 5a478bee46e88-36a4235f6ddmr15378035eec.7.1793624925608;
        Mon, 02 Nov 2026 05:08:45 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm50979337eec.16.2026.11.02.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:08:43 -0800 (PST)
From: Yuan Yao <yaoyuan0329os@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Vishnu Sankar <vishnuocv@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuan Yao <yaoyuan0329os@gmail.com>
Subject: [PATCH 0/1] Input/trackpoint: Add new ELAN trackpoint device variant id 7
Date: Mon,  2 Nov 2026 21:08:35 +0800
Message-ID: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new ELAN trackpoint variant id 7 is found on thinkpad
X14 Gen1 laptop(Product Name: 21XMA006CD), it's now
incorrectly probed as Generic or Logitech PS/2 mouse but not
trackpoint.

Add ELAN variant id 7 to match the TP_READ_ID command return
value, probe the device as trackpoint correctly.

I tested the sensitivity/middle button lock/rate/resolution
setting, the trackpoint works well in daily usage and when
resume form system sleeping, no issue is found in my last
weeks usage.


BEFORE:
input: PS/2 Generic Mouse as /devices/platform/i8042/serio1/input/input63

AFTER:
psmouse serio1: trackpoint: Elan_variant7 TrackPoint firmware: 0xa1, buttons: 3/3
input: TPPS/2 Elan_variant7 TrackPoint as /devices/platform/i8042/serio1/input/input65

The patch is rebased to 7.4-rc1.

Yuan Yao (1):
  Input: trackpoint - Add new ELAN trackpoint device variant id 7

 drivers/input/mouse/trackpoint.c | 2 ++
 drivers/input/mouse/trackpoint.h | 1 +
 2 files changed, 3 insertions(+)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
--
2.56.0

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794331322;
	b=rkHLjTvkQjR0AXp4fUpbGT0MMgzCzv4pLoWPhOw7zEME4Dy3BGXcmehx6JLZNoZodA9C
	 gw2Ery61fpyUnTO8F4Wlu37D3TNNhTTQgQGjyj5FDhnwQJ9kVHNl8xpOmquQ5Ew7zRPI/
	 Cbt9zmj/jmn18haBa/MW9HS1t13FaPcUba1pgfd0CT6MDxck4/Xw0sN8QQlJAq3U6xo7N
	 H8DEb0rOOcmjcIZ9pk9iYTkFj8jyOs0YoTBxNB3IOjDBDWAKqWWLxtL1nJ/kDlhmPfKWb
	 daPiWeIH17RYp2FuT6zTQA0HaWOgCPdV7UAUEY088F7l3Ah1GqbErtWgiOvqyFkuaPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794331322;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
	b=U7+d3P0iHULpmAMRHuXU1h9Vtj8Bg836YIywQk3w3Eg2P1H2xAmBUVAqCzEUnKlVBNjM
	 KyGbsd5n/LfDpBLkMSXVh0QJzf4Uc/XEb8xrfNmgo+lJ3kP/hEVNN6r8IzAavwolCMyuJ
	 /75TtbtFVymezSy5t60b7XCOdnSz30N0S8K21nq9yZ4r7IRojiF4SkOOXmxAtU89uhAWz
	 G0hDVdQTKKXkYrOrmEEky93g/Kuo5ui0StKTeq9FILRnfIWKfl9qaXGkmYbAHrzHmJLN4
	 AGScByCmW+wUcE6MuR0muA/e58rncPElFqFNtSEFwBcbcDTc2DvyrM9jdssQyc/BOTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjolmdHB;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8CA60A2627
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8CA60A2627
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GjolmdHB
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-492690dd5daso1707950f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794331320; x=1794936120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
        b=GjolmdHBr50uXXPHJ1wg8NM0yDKma2Ldu1G/e1NNxN+q5BLXzJ8jmX9QJcnnk9hlgT
         lSbuSJV30ux5W/eLL0TmJ4jule/4FQD3WA3c9OfYj6T8atTZzfz3JPBWrBNf0yICi8CP
         m08xao3OyjLRvTJzrR2QBt2fTz4N0NrbPsh46PQ8qFOufnJvRcLbJXNc8xqHm19ykv3u
         aqUGQRjjHomUPY1ixLytGgKUEuiQiRZtjE0tm81aW/2/dqvwPhUwsajbYHFOv/qDii1j
         80gcbsh9KYpDxi+F9KZgUo64bZ+n6NASiu7QaJUJYgm5M2J34WeA+3zn14udtehSh0JQ
         vz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794331320; x=1794936120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a2lfb+YWF9ky2BY7yTeGdWupjNrafjgwonatQpIRY38=;
        b=FQfw//WPXiFMwM4WKmRVak+UbgK2oHCmcDnneDhlQHziXwP0dO3NOZCTgYg9DGiNAs
         01gFAB4DeVLZHeAP5YwyQL9mkt36cACbM5w5YaGytUMJvdz6VDDGLKl+yGXsrI0Z7jgb
         OLuXH1+pxrKPWvrkpLYOEjoeWdiDDSgyXT1erDmGxlv4hSBPirjyBelg5ISevoGrcoaT
         yvbzOieda2x/g8h4Fdej9+AZ0ap05BnEXvuxPR+YJgxC1A1rkLejGlqdFh0hQ6cO+ePn
         Rn1d85aNIzLE/EB+htF8ru5+IFIkhgfLIPJVM2DAoKJ/Ch0IdiBCD9pUjLhnn32A4Frh
         9KmQ==
X-Forwarded-Encrypted: i=1; AL+hErHwgre2hcw2KPmaTxiiD0voHpMH7LZLK9aBBhEMLGJKyagGABmT1+nFTUtc9MwRoAQrnihf6AjsEkQaovg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AfCHGtiX0giOEBGcSnhg/d3ZXTSKx7V9zEmfO5Jqj0lrHi3uk
	CiXclMhCdvjG1thadHw8pLCHwWCodKNxLw6A+gmZb185UWMjGNB4OXlG
X-Gm-Gg: AYBFou2kUkzDUBvqy9F7Jqe2kBfoMOQ7iauK8PxK1reafL0oEcMVKnTo/1par1NaQxb
	SAFwgqto8OeWBPyvp27jFq7/tXPlrYIdHEide0xRtUCAc/CclXLogplaoa4HSUTcKORLBqYxv7c
	kgTavQhmrhDSD+6cowgqmyMSibwixJxu6te0PeEHFoLJ9lbvi4fgO7lQ8KpQ4ByoBZxigUkwHnz
	MB2lnOiYbF+o/0ZgTfojzBU3OnkcFQxn+9sWs5I4a6D9VfKws1EiHJfEQQO23ogvg2fHwHMwM7x
	3sTwEXy163fc6taBk9xYkjCl03uOsRs9oippsOg/zsspvk2cJHyPl6JD+QIYvmqPf310R+NQH2n
	Bo/3alRJRFUonLpW3hF6N0WIThDysHHi5wXgdeXu8LYyuopaej6tWfaNwLfw0LP2OqZUXoZItrn
	LFDzlQLV+0Ke47xyvzc0mlAqxEsUfjZBEdJbqYh540w5fEPA2fXMtUDnV0tW6xVRri4GBpGokbS
	2Rro1zm1CaWnm1AoqU33ptl+7CQmWEV1mvXNeQhfgXyylEatmpvT3o6JbOvWEZEx/7NA3W5qqtD
	QsT/ALPOTWSgt1929nWuWZi2AWzyHQJafpXSkykYrCx5d64+Lc9JJ5w=
X-Received: by 2002:a5d:64e4:0:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-4982f77f085mr6324632f8f.37.1794331320173;
        Tue, 10 Nov 2026 09:22:00 -0800 (PST)
Received: from localhost.localdomain ([188.190.249.216])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49836c83432sm5460826f8f.58.2026.11.10.09.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 09:21:59 -0800 (PST)
From: Vladyslav Tymoshchuk <tvlad744@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Vladyslav Tymoshchuk <tvlad744@gmail.com>,
	Prashanth K <prashanth.k@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Faisal Hassan <faisal.hassan@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: qcom: Defer VBUS override update during system suspend
Date: Tue, 10 Nov 2026 19:21:48 +0200
Message-ID: <20261110172148.1640-1-tvlad744@gmail.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <auu9hx_Xnjbi3WkB@vbox>
References: <20261022224220.480-1-tvlad744@gmail.com> <auqXyUxc9cRIuYou@vbox> <f9d27fd8-cf33-4e6a-a9fc-6770a933cfb3@oss.qualcomm.com> <auu9hx_Xnjbi3WkB@vbox>
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

On Thu, Nov 05, 2026 at 12:02:46AM +0000, Thinh Nguyen wrote:
> Hi Vladyslav,
>
> Could you test this change instead to see if it resolves the issue?

It does. OnePlus Pad 3 (SM8750, UCSI over pmic_glink), v7.3-rc5 plus
board patches, with my dwc3-qcom v2 reverted and nothing else holding
back pmic_glink notifications during suspend. I added debug prints to
dwc3_usb_role_switch_set(), to __dwc3_set_mode() before the glue call,
and to dwc3_qcom_set_role_notifier(), with the device's PM state.

The same kernel without your change resets the SoC when the cable is
unplugged in s2idle. The last lines in the ramoops console:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  qcom notifier: role 2->0, vbus override 0 (pm suspended 1 noirq 1)

With your change there was no reset. Each suspend run was 150 s of
s2idle ended by an RTC alarm, with the cable changed by hand during it:

  unplug                  2 runs
  plug in                 1 run
  unplug, plug back in    1 run
  cable left plugged in   1 run

plus unplug and plug in while awake. In the suspend runs every role
switch call came with dwc3 in the noirq phase and only stored the role.
The glue was called once, with the last role, when the freezable
workqueue was thawed:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  PM: resume of devices complete after 108.388 msecs
  Restarting tasks: Starting
  drd_work passes role 0 to the glue
  qcom notifier: role 2->0, vbus override 0 (pm suspended 0 noirq 0)
  Restarting tasks: Done

Unplug and plug in during one suspend came down to a single DEVICE
call, which dwc3-qcom skips since its role did not change. After every
resume with the cable in, the NCM gadget was configured again within
5 s. While awake, the glue still gets NONE and DEVICE although the dr
mode stays peripheral, so the call has to stay ahead of the early
returns in __dwc3_set_mode(), where you put it.

Host mode, with a USB stick on the port instead of the cable: plugging
and unplugging the stick while awake works as before, and so did two
suspends with the stick left in. With the stick unplugged in s2idle
(3 runs) the NONE call again came in noirq and was only stored, and
drd_work passed it on after thaw:

  PM: suspend-to-idle
  role_switch_set ->0 (pm suspended 1 late 1 noirq 1)
  PM: resume of devices complete after 2554.135 msecs
  Restarting tasks: Starting
  drd_work passes role 0 to the glue
  qcom notifier: role 1->0, vbus override 1 (pm suspended 0 noirq 0)
  xhci-hcd xhci-hcd.3.auto: remove, state 1
  Restarting tasks: Done

The host-mode suspends were on a kernel that also keeps the USB GDSCs
of gcc-sm8750 in retention. Without that the xHCI came back from
s2idle with an SMMU fault and "HC died" in all three runs I tried,
with the stick unplugged or left in. The dwc3 code was the same in
both kernels, so that is a separate problem. I have no result for
plugging the stick in during s2idle: the port did not detect the stick
every time, also while awake, and I have not found out why yet.

Two comments go stale with this change: dwc3_qcom_set_role_notifier()
says role changes are protected by the usb_role_switch mutex, while now
they are serialized by dwc->mutex in drd_work, and the @pre_set_role
kerneldoc could say that it is called from drd_work, so not during
system sleep.

Will you post it, or would you like me to send it as v3 in place of my
dwc3-qcom patch?

Tested-by: Vladyslav Tymoshchuk <tvlad744@gmail.com> # SM8750

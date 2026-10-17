Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100FD20D4FC
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201210; cv=none; b=ukCqM64EhhpyWzgO52zsQFhxhkhaiYINRtmfv9OxFqO/4T0tb90ReqBtdGQQMC2QwHoz1z+n9HQQzG6LcxaYvjmzKZQ8oBTnRlDiRwFOkTMPd22OJLxHJuPmQK8DMC4pcMNGy9f2eaMhUOL97/LVFWkYlX0oPpxTSNiEEHaop6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201210; c=relaxed/simple;
	bh=yvRP1u2Utq0xeeZaPJqudxqNo20F7ftY+jKRkqzUimY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sxX4pH6h2rVd7+6PzKeC+xyoguzX/qskFZ5Xqm1oZN8XIu1gZeh/ZjvT5n1LVNSVZkIG1fd9QU6TcPA0fu+4w1pcVIRXc/1BXYpvMgN68dcR5Tcq0uVtlCB63wVLnlBLo99V5xkPmiCHDNNO12xraNTry0KVR5IIMk6awBdXw4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKfag5dm; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKfag5dm"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-170135e43c7so290649c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201208; x=1792806008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WyelgOLNhU1TGp2fbTGjic6AmzczPO+7QxOzuA4ZKMs=;
        b=EKfag5dmToJtaW6U0+QgD9qH3TD+804yWOfzSMFM+o579stX/3IB58r/zVfudFXOnC
         BTu4NO6qe46xQKSnq1EI0RvDzE9JBxnNv4TCu73Es1AZzySuvZgLlTBcxGSSv0Ru4dek
         7rnsrivLDwk2x8wnIlhFufCehlsUzsKTK7UAfaVqwKfSvgIFmdlrmCob/nM8s3dqnA+A
         X/OzgHfOSGajI0PMbGE9/nlce8JmNRijFgruKsHe7940VF1kmJpJNtSadEiIxgmURGJG
         hB25uRc0bt0tTwJl+64zw4kGdnT+Mr0XO6vVF1TGzB7MEfbZR2iy4PqlGCeIg1d7bx+t
         HxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201208; x=1792806008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WyelgOLNhU1TGp2fbTGjic6AmzczPO+7QxOzuA4ZKMs=;
        b=C2joqQsEXkz7YDWyQUmaCAFZpmzBO544TpZoIt1g4GMK2/4MFlQD6RG9z/RywAkTgk
         dqM5UXHSdZwf7AeqyNam5/t/sjO1BGaQ643A9m9ify+LaQnuPcQfk97RrYPp5kMNWTOL
         lrP8Zjww1HaH0t9ajKkVSCL+0pblSsxtMQfqsLJPJvvydHtr4zCA0uaNWy6oB4FryPso
         HdyRtIP8Rc+BMsX6V+Ehbep1Eo75Dey5t2SVau9L1TH3F4a3VX75J0/mP8tPy+dkOWnx
         5vvfMlJ9dlAm9eCQdhFwbK0LUASOL9haj/vjwYQmVWoYaMO30hy6DalWXwJGa6OjF+Li
         bvaQ==
X-Forwarded-Encrypted: i=1; AKwUvByb9hQa1X45buEa3HmfMw+OSAgQtKxNLhWbqIBaeL8lineMmRQxSl09aHwf+rWowSjfsdLBrgc1Fs6a5E0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpWBuuJSM9CYvIO9dEfAGPtP0DYHnJdw61GTPV+9xlEEQFQMo8
	TMXfD/ABAj916Td3X1lJTpmlgfvCfFUabUzxmvaeaW59j7dsmBlwyf83
X-Gm-Gg: AYBFou1b+lAUpCK6NlmH95OfpVR4fynrQM7Z7kBFFd/iyLI28BYC823BU4HuOz8LHT8
	xqagttAA0dtKPxxOI+jrsiEeIDBthzROXJgV03Py/59LxYozwe1awKK5FCcs+M03zdDj11IfCsq
	LDujBUKyh5e1xpljGku4Yh7YSx+3u17//spUiLrqrREJHfD7+IH+MMgCeavdhkTaKOKNPKNNjzf
	fGrj+twASwWrwuyCYnYpT3SQvIMcrqxrWhpJ4TiKs+tos2M/mcs718JR4tTwkGAPMV0JRsCkuGv
	UJcy3F2aQSheLvrf3RKig+u5Rn25p39evExx3JRRFIMFXO0EG7S5iwWVYx+UHIm67tNG6fZC9do
	0fSnUD/MWcIoOlk51x4278AlL++JobzvmQGE1vCr7OPKmvyeYocvieS6bzViQ6RqyWgLVMLFNfN
	NLI3QyqJZbygX4VJycG4tg9K2OjnBYCR3Lay8/AQTlRBKnm/JA/kKvFtrdReRWL0N5NdT9p8l0U
	TjQca45+KCtoKz7CfyLNFmb10edeXls6+NBeQ/qeWU+eSqaB1clN/ksqiaBLr77bBCdkzQr2DoK
	EvH07QIot+w=
X-Received: by 2002:a05:7022:fe06:b0:151:7831:e401 with SMTP id a92af1059eb24-185120a8c4fmr3099997c88.15.1792201207411;
        Fri, 16 Oct 2026 18:40:07 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:06 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org
Subject: [PATCH v2 00/11] HID: hid-lenovo-go-s: Fix various bugs
Date: Fri, 16 Oct 2026 18:39:45 -0700
Message-ID: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes various bugs in the hid-lenovo-go-s driver

Patch 1 fixes a dropped error on return from mcu_property_out().

Patch 2 creates a mechanism to ignore stale responses if they timed out
in the previous command.

Patch 3 fixes a deadlock if the device is removed while cfg_setup() is
running.

Patch 4 adds missing pm_ptr to the reset_resume function pointer.

Patch 5 adds a kobject_uevent notify during reset-resume to ensure the
os_mode return is caught by udev.

Patch 6 adds a suspend callback to cancel delayed work and re-queue the
cfg_setup if the device was suspended prior to or during the work.

Patch 7 moves attribute init to the end of cfg_setup, ensuring the
attributes can only be used once the MCU is ready.

Patch 8 reorganizes hid_gos_cfg and renames it to gos_cfg_drvdata in
preparation for later fixes.

Patch 9 moves the static led_classdev to become a member of the drvdata
struct.

Patch 10 moves drvdata from a static global to a device allocated
struct.

Patch 11 stops and closes the HID device when probe fails.

Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>

---
v2:
 - Patch 2: Only mark the ack as orphaned when no reply was consumed,
   i.e. the wait timed out or was interrupted. An MCU error reply is
   fully consumed and does not need draining.
 - Patch 3: Re-take cfg_mutex in the remove path after stopping the
   setup work; the commit body documents why the re-take is safe.
 - Patch 6: Cancel instead of disable the delayed work on suspend so
   the work can be rescheduled again on reset-resume.
 - Patch 7: Bound the device query retry to 5 attempts at 50 ms. Register
   the LED classdev manually and unregister it on failure and in the
   remove path. The registered flags are set before the matching steps
   and cleared on any failure, so a failed setup run can be retried.
 - Patch 10: Fix stale work function name in the memory barrier
   pairing comments.
 - Add patch 11: Stop and close the HID device on probe failure.

v1: https://lore.kernel.org/linux-input/20260914225303.868569-1-derekjohn.clark@gmail.com/

Derek J. Clark (11):
  HID: hid-lenovo-go-s: Return ret instead of 0 in mcu_property_out()
  HID: hid-lenovo-go-s: Bound stale reply window before reusing
    send_cmd_complete
  HID: hid-lenovo-go-s: Prevent deadlock if device removed during setup
  HID: hid-lenovo-go-s: Use pm_ptr for reset_resume callback
  HID: hid-lenovo-go-s: Add kobject_uevent notify during reset-resume
  HID: hid-lenovo-go-s: Add suspend function and gate access under bool.
  HID: hid-lenovo-go-s: Move attribute init to after device query
  HID: hid-lenovo-go-s: Reorganize and rename hid_gos_cfg
  HID: hid-lenovo-go-s: Move static led_classdev_mc to drvdata struct
  HID: hid-lenovo-go-s: Use devm_kzalloc for drvdata
  HID: hid-lenovo-go-s: Stop and close device on probe failure

 drivers/hid/hid-lenovo-go-s.c | 720 +++++++++++++++++++++++++---------
 1 file changed, 526 insertions(+), 194 deletions(-)

-- 
2.55.0


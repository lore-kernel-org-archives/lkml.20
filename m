Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929824;
	b=Ju/XNe1BizXtOIiVeHSj/wrfioxc+Xszt459Wdn1F50A5aD0HCpAPYgI5gvJNZfpk1hJ
	 Mn/QlwkSZNKrT3WUsDpRnVZpPZFrXUhuh4UA9vPHtjZ18XtoZUEyPQDQBxl3akYbUJ1GX
	 XGbNU6+XNjSc/HrKm58uEAS0P18n50zj58IphixCdSwCg/gtB+EDYO/M7Xx+8YSqemQH6
	 O6YSPltL6FPJCCcNcJD+9Ic4zlZ8kjALM6WZlaZQuRxONM31o04vCIFwgS2prcfUSXJJa
	 llOwYCWPv2dwECybOrY3yjSrQgu4XbPeoMbhJ9AYazAX/slWsGFxicQ5+Fvag6BYYBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929824;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=X8BtSKrWvVbIEE/cP+rBTBr19Xje+l3L0dnP4Fz9jF4=;
	b=Qx4Eg4maTlSFMz0a3JlgBMxhp5YMAl5RS5jPCWd6fzah9EJSb7yiGa8ljjZQxvJOhU43
	 ++xz2EVshe6p9YbQ40Bm+8onovoIb8TvJXx+9XoxpUhh9lNmU7gXVv0ICl5EcDhDu0K29
	 DhySZ/F0c/2n0hwRckdTDHiAwHMZI2hWWbMCXEtjsrVQsrAF4J86obigKtgxF6v/r+G0r
	 89r55wAVH1RqZ0wUVSutbjAOKcBfuGpCpRFg/eBsX6SDxA5X69n0+BYkKkyVmgy7MmZm4
	 UyDM3Cnb7xEVEF20kcqNv0uzvz9InLxbOKEEG0oUqgbAjTqzSor7Tg8SmkkLtXb8oXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaeNWWDJ;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F5C606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F5C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CaeNWWDJ
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-15ea896ddc8so7513986c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794929823; x=1795534623; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=X8BtSKrWvVbIEE/cP+rBTBr19Xje+l3L0dnP4Fz9jF4=;
        b=CaeNWWDJWhvbfZO/KO6n9I3/GPO9vLmW8FpPqHLq8NU2CVAcmF3dIeFfQuU4mMjjf2
         y8rXYUK1iTMRA7+bs0t+j86zrYhFNDuVopyV6UdVjbCqmPoZYcPnoRBkt66PIiSqBjs9
         Ze7ZvGELjNZPuXIsa5DNV8TC3CndbPm0P3cT0vQLZ/ikasLyZX7Ro9ABZRNF30QQmjLR
         Yy+MBvZpCs6jHFFoDUJ/gxji/8cciOddYY8reotKo1QIfaOnylvENIkRJNozR/IhsXYs
         Af4ELR10ZRnHeXCwJ/PuH02rCCx+hrsLJ06mAL+5Oh6OvVQnZ7iTBqE52aZEqbWDSRwA
         4oNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929823; x=1795534623;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X8BtSKrWvVbIEE/cP+rBTBr19Xje+l3L0dnP4Fz9jF4=;
        b=abQALNmFgizigQLTD7qe6yWiR3sT+cqcqYGfvJQe9C3Rv8CvTfpAP4GeT7sheFmE9X
         t+IsY+nHt7biKH5W/edt7Gf7dXue6cfwmm/Z7caib1q1R/cPwkwPCUUNIf6Y6tx5sW6x
         z0bT76G2A0JMeSgLWgd5cpxZbZX1OvsKLU8rcSDQ7klbuLbA1sE09Ga/ULR5VosIesLn
         CIE+jfafzPVwqJu9uXZOB+x+eCJO97N8Pjs0Nn8Ktb8VPdNY/fa5WECY9jMIrJ+IfrRq
         V5u/lKQiqLUcoWWzX7/gUzNUz71OCvAeb0KEWlF3y32ArY5Dkbgi6T2xfQ4X/4B4UiQv
         6pTw==
X-Forwarded-Encrypted: i=1; AL+hErEOtDw8rWkWd/UqNb5v8GAEiF1kqpNIHgmSkwODnsSWKK4xy7xl3w5Jk4WVarL3iBwp2Lr0ckdEfuzMLyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kXcQUV+CzrW3w58BuVTJL27nBrCN3mG7xIocl+ACx9C1Aq3s5
	563LHr7OJL36UMfXvJYnpm8OOMmoWr4Tz8Xaoy5Kbgu4N3ue/VwBE79e
X-Gm-Gg: AYBFou09atfcJ7XkIWs660GW5Dv+L01R/DySZsOO1toEdPCMfwxWocnNkieTbpwzhep
	dHH5eAv5hmuUx2Cs7znpjmS/6sd83KH4vrr09IYMSMOoYs0oTuBmJOAkQb3hF1cTNd/ukmluW+N
	3u3GMrTqs0ovn+uVt+18zEzaSHrjij8xsKnEZPyJSbusySYPr0+G13Wk4XeEAax+0spefIsUCz8
	FqDwtY4aLV8atamHA2X/5jQ6TFkGlYxRAT9jYPCK3qttP6d+cGUHCdoWig7RTEhi1+ipSRZAeG7
	MHQv1K1yK+57gODLl+8vgP9ELhycSBx7/7eLse3Y8kvXJNiSQFRqlnZphd/eo24G2aLs5Q0O4gv
	SpZHXOT1HfOHexJbxAiLlqDt1JN/FifUWKy+33eNEwtk5HMImIP9prcpCKG0rPl+fHmJP7/F3sB
	TlO0pywVeezRnIkg3WMp2ccITJcNWxLR5oNFdL5+o71DUV66oqb9kvk0uVw2fnsrVNL5qyFcFsy
	oZV/BFUwFS0PdR5tU7eshnDKs0sDu9ev1zL0KMOjcGPX6kj6cXhihJWPGxzch03bS5KVlD1mOY5
	7oOONPEAcVxKYQKKIhvVZXh5X+KCz2uLHCmextWLhINC5cPE2GTKzqOKAq64NW/snw==
X-Received: by 2002:a05:7022:3a87:b0:15e:6541:3099 with SMTP id a92af1059eb24-1b5030980c9mr14244003c88.7.1794929822695;
        Tue, 17 Nov 2026 07:37:02 -0800 (PST)
Received: from marstop.local ([103.230.223.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm37933300c88.7.2026.11.17.07.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:37:01 -0800 (PST)
From: Spandan Barve <spandan567@gmail.com>
To: Jamil Khan <khanjamilahmed202@gmail.com>
Cc: Joshua Grisham <josh@joshuagrisham.com>, Hans de Goede <hansg@kernel.org>,
 Ilpo =?utf-8?q?J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/x86: samsung-galaxybook: Re-enable ACPI features
 on resume
Date: Tue, 17 Nov 2026 21:06:58 +0530
Message-ID: <179492981820.29200.9583804047448815059@gmail.com>
In-Reply-To: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
References: <20261112165433.64461-1-khanjamilahmed202@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Jamil,

Same problem here on another model: Galaxy Book5 Pro 940XHA (SAM0430,
Core Ultra 7 258V, BIOS P07VAJ.330.250516.01), on Arch's linux-zen
7.3.4. I applied your patch to the 7.3.4 driver source (it applies with
offsets), built it out-of-tree and loaded it in place of the stock
module. Hibernation goes to a swap file via systemctl hibernate.

With the stock module, after one hibernate/restore cycle:

  $ cat /sys/class/power_supply/BAT1/charge_control_end_threshold
  cat: /sys/class/power_supply/BAT1/charge_control_end_threshold: No such device or address
  $ wc -c < /sys/class/power_supply/BAT1/uevent
  0
  $ cat /sys/class/firmware-attributes/samsung-galaxybook/attributes/power_on_lid_open/current_value
  cat: [...]/power_on_lid_open/current_value: No such device or address

and right after "PM: hibernation: hibernation exit" the log has 50 of

  acpi SAM0430:00: failed to execute CSFI; device responded with failure code 0xff
  power_supply BAT1: driver failed to report `charge_control_end_threshold' property: -6

They keep coming for as long as something reads the battery: an earlier
boot on 7.2.15 logged 5443 of them.

With the patch, over two hibernate/restore cycles and one s2idle cycle,
charge_control_end_threshold still reads 80, BAT1/uevent is complete,
power_on_lid_open and usb_charging read back, and there are no CSFI
errors or other new messages after resume. platform_profile works with
and without the patch, as you noted.

Tested-by: Spandan Barve <spandan567@gmail.com>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637231;
	b=cmgxsvSa+XdOBgEzYeE/8RBvRzHvWrElWC0uc8p+FFsE9T8+wRgugQoMrWpqIboAyti4
	 xNpYVjFwTwq9j/eP6YcllU6zseciu8cyc/qOzZsB44XXDihCSkNgHlBiRyCJOUhKYwpax
	 uiUhMI1vRPef0CFQpXh6O9Ibj5wrk6gRRBpfTn/np/+f1IpdYiIQRmhxFZaneeVV2jCRf
	 1QAuVh2dIDlFhodV4aoMKit4bq03ojjvie+yFGMVklJk94APFWWIs9jCMwDHLHjDx9JkP
	 ef8P8VsyNH8Fa4+cprk1bDRgAMa50+3v45Aw1/uowovi9e/YaOYMUEdC9zMskmgExQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YaDop3dDW+Ra7JQAGGMNhBuRX2sr1P19swlGlJ+EoZY=;
	b=CSqgc+PhffJ06BBImqj3XceUAOMKmcI4mX4MzeA78hWy0iMk3yhCcMfCfqT1cwj14omP
	 07JLJoREn2Ax1t1eQN1kgQIV2oLpsdcr61zIUrTg8W5iVNot4fDYAfZoOHGSZmweKsZDQ
	 FdOirJ1VA4pj0X+gfUGJynkeJE2frGwYc/b5jXINLmvd7nSP1yl6n2BjTuhj76FmCQuKB
	 T2wLUsbi9JAAmlKpDkhrJWRTljtu2Hz3utQ9/j0ksDVlhph9D1Mf1qmDAjtINZnx4n1do
	 B1Vl/m9RRy0K0ztiv7gH3DtwPrjuVcBtHSP4EYr852KaR25gfaLwVh01jEROWWEYyBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ew1/oABE";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D61F606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:20:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D61F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ew1/oABE
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so3627785c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637230; x=1795242030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YaDop3dDW+Ra7JQAGGMNhBuRX2sr1P19swlGlJ+EoZY=;
        b=ew1/oABEMlCvxKhR5/p8peXoLkErkEd153ueW8YA3bNRVAw07Vu85SZELMui/LLRQ6
         MjAuPhnHlrolK5w3qcsuuBWahf2ORzwHaA2OM9WYgf6yk1X3tJQ7nEjlo6PbCWmWbIAv
         DV2VAs/SUXv4oqW1nCAzNOjrp9OX2rxwrQRrDsFp9fAjX1Fz/YMNnCxRHzmFVdFiI3Ap
         +CVxz+5PkyWdzgeO7qBPJPO2mL6uVuGQLKt6GqSTL+J5cUuPjfpR3CMS9r9jidiSLUeN
         FA9/mrVAMfnxGNDuVuHPqil3M0PjULOG+D7QE8QJn0b0cQBhZcbFighI9pf22Cwv4Sv7
         YjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637230; x=1795242030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YaDop3dDW+Ra7JQAGGMNhBuRX2sr1P19swlGlJ+EoZY=;
        b=hyYfybx/eJ995ongAA8QL37Z7qDMcCZDin6UnJQq2N3VicgrXBoLLuO8T+exDK7h0n
         +9oD3obESKUc5yzDBWlRxiVgVjfPe5pHD1OsL+w0lkgIovwPb6LFh3iP1rrzvP7rwqdY
         2L+5sP+Y2qPRpdhE2G6TBZVZ+mWIT55vUsuizpr8xNshtnf7AMOzFGzi64ENLc5Ibfgd
         zmdtKaVM/C4rXoFy0vVherXieAeVnb7uKPss4bpshd0u+Ho0AVMeZooJNfYE9oqwEVyH
         z5TizXom+ekP15tFnIHIwAuoOqu6LJw2kPN2Q0vw55S5OMICjaqRA/cJEit8Al29T983
         +kag==
X-Forwarded-Encrypted: i=1; AL+hErE8IGu66sDdAMZnA8Bq8CJSY9wYB7ODHMFhaR4d4RNQ/xeP/gHsSqYwi2gM3x0w9EDvDycP+1dZhpQLeLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dpVQyKERQ5EZkcLvLhBvR4yqwIfNDxEdZY9YFK5SZUEbI5CJS
	+wgucP4h0x3sa8wltsBCO2rgWcCCo38ztdQ0jfUPEmlh2/+0TuiiGEinh9cILw==
X-Gm-Gg: AYBFou1+fMOKDwBtI9Nn8IsmvmhHuqgRmj1iHoyZpPhvGcce6Dy8NqDAiXQ2x47MqFQ
	JOAgxacfRExIiuib1IKPXZPOwBo8VjI00wQ1jXaK9Gii2mLIdEQ56cddiZBPQtfyGHmA7cp7tzN
	hOvs6LzZKxf3LaAjr+gTRoX48JOpCfpNMXwwsSpCVSV2olQ1498no9fs6bpO8kQNDO9AumBYa15
	9dc88aurEqxkyy6TUkegUfsLmw6JlveaXu6A7qQMbHyrIxcArodyHe94vQtAwZDihjk8cHkUazN
	ZEAqR9cgl9NUVruDrIhp365tks/kdYY9KMaIC8EuX2MEt2m0ZNQF4sWndpD6mCur3hmyR+x8q8i
	SEzx2+e4iHESB7hVWkwzIoZ9+e0e27huVNH4ons2SDD8Q3CIWcdkd49s4u5NIhHjqWpIReYTBmA
	bfEoQqEp47TiQiTnKx5s17ifHtI6K6q4DoSCkUzk+5OAkZX6272kTnhde0M3Q1+zXG1BXsZzR2i
	qIHbMrOxo2J8br76lnxeBIYu/PbcYrbBhNq9bRl7CIOBvO/0FzTXUuaidpQP4lS8Q0BF4rfK5hr
	Us1rChqr3FRKu/bf1pyiundonSuEAJLLDBblpjqqfZhrEaMgmfLONKV7R9xit4hF0I8SYGPjp65
	7q0LwdrMHI2Qet3hVe1M0LZAXirkNbmVqAPAZ0sTmEeUPSnYzUH5eaIY37W+5CcVP0GWaZYqZ0o
	rntg==
X-Received: by 2002:a05:7022:b881:b0:1b3:a9c6:b293 with SMTP id a92af1059eb24-1b5031124f0mr4696379c88.25.1794637230452;
        Fri, 13 Nov 2026 22:20:30 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b98e5sm13305738c88.14.2026.11.13.22.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:20:29 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (dell-smm) Validate pwm and fan_max values
Date: Fri, 13 Nov 2026 22:20:21 -0800
Message-ID: <cover.1794633179.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Two input validation fixes for dell-smm-hwmon: a huge value written to
pwmN overflowed the scaling and turned the fan off, and an out-of-range
fan_max module parameter could wrap an allocation size to zero.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
fan_max=256 and fan_max=4294967295 are rejected with the new message,
fan_max=3 and the default still load. The pwm clamp could not be
observed: this machine's BIOS ignores manual pwm writes.


Rosen Penev (2):
  hwmon: (dell-smm) Clamp the pwm value before scaling it
  hwmon: (dell-smm) Reject a fan_max that the BIOS cannot take

 drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
 1 file changed, 7 insertions(+)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0


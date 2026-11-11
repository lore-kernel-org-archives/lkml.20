Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402892;
	b=CBCmYgw0VVT21jpiMeFN6OZwZ8qI3od5JXL06VEhn3vPU04gZzX+QFOsPAFNF6iXPALP
	 5soRwlROC3aKfi8opKU7F7hCM0peKTH3T26ATm9RT7LtSiWFC+aD3QQRZKrwWbI6QjZuB
	 TjE3lM/stOp6yy1sXwKkKAD5a3xCLDk3HsatOSue+4YKZNC7AAjWIJGsJYfg+MME8dYp+
	 v+ols5TeqmsR748YAtTPyg0mNC7CUk3fHdC6015t30jGKJ80SLkV9rW40tzJKwhN/SLmB
	 1CR2rYOkhmZ7u6wnM8DlSdltpLp7dFNU2+coSRb7ibj8l93j1rfHXS4u3lL8dVNDJWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WU9tbewfdDNGygX+WsvROhINm1RTKRFNHxU/Ul0rphA=;
	b=LL/qBtbljNP2aKhX+o1YHURiWvj0lCaazaSC3MdqxsQYA0bWePZXXVHnIH+QeHZNCJaX
	 0NjsDWoUSRnKphKtc1+hv5zR6Qr3SD8jSOD1ZfllmAibGUKouOpjLhT8aVCRi1KvuXBIk
	 3Z9dKR+YSseGzgCYuaCReJCq+Br+rp5b9jnQ9DmPtOVU1zS/CxpwHgLv2DkHw3/wKUNB+
	 d9CPOh6Kkirtf0X/KvqKhp51+GUOWzBZ1bVbLr9aUffZTLvHBd/SO+HTo6uOzrsJxCEQe
	 4e4+7odu1ifyZAmj7U9tCr9TYqRL/+opeHOuk796ToAFmLdKe9htxmzYs7v4k2Ocrxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+OZ+8l;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD874606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD874606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qS+OZ+8l
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f5a0893610so1952251eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794402891; x=1795007691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WU9tbewfdDNGygX+WsvROhINm1RTKRFNHxU/Ul0rphA=;
        b=qS+OZ+8l5x0OUYgVDcIkSVxv7Vxi8PNBKwee4x8AXelL/5+qr2Pr4Fg+UQfFw8l1rj
         No55kaqFI71remSSwh8C0sIWEmcRXLn/LgJJ8lpGzDPnaJ/5WcocsKojdgzmaa8lHvHd
         HQs2czIVCMURudA3gIXJ9vsP2VOZl0vZkzTqQQoaBmWWzwM574avQsLeQej92E4jBIeK
         o/tBVm9WAiwxh/6YuHMR25V/owmTOwmrZYG0gAMJRMI7R0389sw789bnXVCewsgvem5b
         uEApyHKz8LT0KTVR8oTw0vc6jNNTx0qwaCt0x5PcX0soUkxaXY9G9iXg3IrDp/yvIV0j
         97/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402891; x=1795007691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WU9tbewfdDNGygX+WsvROhINm1RTKRFNHxU/Ul0rphA=;
        b=CRXvozvuleWppb3R3ZBFrZOTaBYZaMrUx5hkTOXHOFynkCtZmTJ6xRbWoy5tytMg1J
         +Oi8H2WOu4zmVAw2qgz7a+Kg7oNbO46GlwhQ9xnHk7mfZs6y6YZDZ1QkY/YF3DEwRmfo
         eYuItPuhtcsmRFACyaw+PIMXdJNIZreRlIeEzyBT9JW34ObmU1dfCHRoYCLHjvUcs/3A
         5P6qSZhmEOuUdeX2Ev/0ecOdGjuS3fbihl3vybBrwNxUkR8kyiybD8MI/PJFMEzqbIwT
         jpzLJqgPqHlYmwrlb9fzMmcPHjyLQD9c0Ucg7MAfVi82TVYXj9RoMUDHLvre0MsNB1yT
         Xmsw==
X-Forwarded-Encrypted: i=1; AL+hErHFlG1NYprrc7zaEVVCXJT7AhllhnlSnj+GAgJveumA0+cgCKh9cGw4vkxZPrEWFeHjGH46+jQY4bdsV6I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pKH78gALwdAglnbd5FnR5JqvUL/sbMDFjomW8jg8A2yT6F5Od
	bftir8Scmg0Xon/7JF+1QeDvAIhHSM6cvEjo/fNqsPrDH9K8KAM9e8ym
X-Gm-Gg: AYBFou3acnGiMDJXcyYzeQonPKsfSY4cW41gym1rT3rUHk3uWXLdWxnK6bEaLsJW3KN
	l7KF35Qwne/TcwCnbloPUoNGKsh8dv2hcdBDV+DzVMCSWU+lxznof3JeeyOK/mHK0SbPFQg4/pH
	qd0qaO2vZG+PVbTW/7HVeditGzicpt4RxYqyboaaS0u9sm++9umxj8VgUMutkuRMBecUCS+EDEn
	2MpcMqA/9t7I/9x1Lty0OzBSR/BluM5OXnXrkaSQdW34jNex/xPzmbugBTC1MjWwmk1p/lnPDNJ
	Dd8MB5IISjZbm3NKl2uuqwOVshBPKBgBtGtFuKtKn13OjEIjfzlPMGJiLRFd6EYMZOzRe0T/ak0
	0KNl5PpKgy74N0piLAOwI2LfwWCvGl3lZg9PjdcmfUgUAB5OyzaKeutjQ0W+izNz2fS97n9yBTy
	5PAycOk7sUv7pDbZ++PgJ6PbL3xBBiBIbxYPMqQX1NLDcNPb01ohsTLpO6yHT2X4K7A6niC/rGk
	3X33TBwSseLgbA5/rEmjWVF2O9ATTpgHkwIXyhRvTbQMoZ7fj8BUWrXB1aYLNwlNV2I/O9i8Y7s
	xo7u6gJ6/q1KJ1JSGPtofj9C5QhGySeIvrIwAzSDaiVdZd5UO0eXVWMNtwLhqAr3oF7eFOAZkhc
	=
X-Received: by 2002:a05:6820:c0db:10b0:716:f44b:2dd3 with SMTP id 006d021491bc7-719178602d7mr969188eaf.21.1794402890659;
        Wed, 11 Nov 2026 05:14:50 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fbc9c5sm3602123fac.9.2026.11.11.05.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:14:50 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] soc: qcom: pmic_glink: Add GIO pmic_glink instance
Date: Wed, 11 Nov 2026 07:14:24 -0600
Message-ID: <20261111131424.51869-1-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110-gio-framework-rtc-driver-2026-10-12-v1-2-e4164178183a@oss.qualcomm.com>
References: <20261110-gio-framework-rtc-driver-2026-10-12-v1-2-e4164178183a@oss.qualcomm.com>
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

Hi Fenglin,

I tried this series on an HP OmniBook X 16 (X2 Elite "Mahua", DT boot,
qcom,glymur-pmic-glink, 7.3-based kernel, firmware F.04). The RTC part
works: rtc-qcom-gio reads the correct UTC time.

But UCSI breaks when pmic_glink_gio is bound, although the commit
message says ucsi stays on the legacy interface:

- pmic_glink_gio loaded at boot: ucsi_glink fails with
  "error -ETIMEDOUT: PPM init failed", no typec ports.
- pmic_glink_gio blacklisted (patched pmic_glink still loaded): typec
  ports and partners come up, plug/unplug is seen.
- Same boot, then modprobe pmic_glink_gio: the RTC works and the ports
  stay, but UCSI no longer sees any plug or unplug (old partners stay).
  USB data and charging still work.

Happy to test a fix.

Jeff

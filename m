Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401776;
	b=e//wsoc1eUXH6sQeQ+2XEqkfT/v8Wt2IB0x1n4VxQxRCOMjF2Lted/6xpQcgSY0eexn/
	 5yGAqXARVVrA5E3JVUu7923KQ29uV3u4/nJK6CgVheerLJtBlCHra+3t9YR5JX++VV8Jw
	 LdJ3lf+icBAwV0iKVqRJIkcgYx/NfZcH5pP56+ykqhhd2XPv4S2UZI+h654KQGZt9xg6S
	 lF2bcnQS79HQxGWSWsVSnK5W0Pdxi5aaGmwwUeB9qwB84nVQyX2knR35KfBcSStouui0Y
	 24oetPD5D/h4FiGFHJm60qWK5eepeZ+PY7Lwn1tcenyHrrpGrIZ7czlt3eVgznxkg6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=LZaPAQBVelDTdaBdHa18VdLK1p5kWkR6/VtxrrA9a1Y=;
	b=CcHYNxRiIfnCayWDALHXl3GGjPmQBBkb/vIfmVct63gvutapafqK6b7q5gYLMBr0uGRi
	 qFsOsDuElKQUw4azj5eqBdtabQ8CRmvOzVKPyFFsEtFZ2fkZy3BgCHoECzx5N6wswglFb
	 XHLHgNIiB0A87ge49RI7nu43dJibh5fNt0vF44XA883xy3yzEcc+LtcXE/uVYTxHEy29a
	 6kd5YC6kev53Pm3GtTKwBGNL9/3ROq3cxvTFyGSItan7j6UfpvVMtuSJyEpgFbkUv5hiy
	 DD1BrZ9ZoLoXvvfctPBTooJSRtkoKbtWZUHsFGfRyo0QRtJ7sfl78jA6RA+iRNaeysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPiBxmTC;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C32606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68C32606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tPiBxmTC
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b904d10882so1401687b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794401776; x=1795006576; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LZaPAQBVelDTdaBdHa18VdLK1p5kWkR6/VtxrrA9a1Y=;
        b=tPiBxmTCD8gSiTAAiDPu9h4YLRg9n/o9MvyE0ZLfTOssaWFxCjngmLJbJJ3WIE8zpu
         Xtb2cZt2pzMBxhhr12x7bCIXvL2s/yBhLNPtEEAzjXJd60W599y/yXq1eD4MmOzm3uL5
         vWANTQsCiwUX+a/D1yumZ5P1GeZ+yYa196V22gd+LS8hv+TiBbj6axk5HolxuONwtybF
         q4ZQNu2OdDXNHBycMLF3enIi+lHqxX1/QY66SLRAE4J10ao0E/XaLpKoExTvflDfeId1
         yFWvO3RO/kTsrQ6OI0f6rH8y5cVs1mnzqD7QFF0rT21rSVGb00AgIhlR2FjCD7AOphOL
         Mfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401776; x=1795006576;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LZaPAQBVelDTdaBdHa18VdLK1p5kWkR6/VtxrrA9a1Y=;
        b=h/puDiRxqqFDz7Svf5kH33e5LqwjANZP7CRkFC1HWE5zi+HV16L+TWjZcJhqTISJmE
         z4QzDmRfbVnSCeh8mpjre6nXRJu1ZTtJNhuJnti5/PJSxF5SxRGEHilLQ7xb58NElLEp
         8oWOCLgfjfQ0b0tkv1m3YIESblvxCLdExejBh/UtyGQK0EEoUR4gCjBvyuXmxfuYyYCu
         oms56JWJoavZ8Kn+8k4pBeTVsq1ok6cRYADA6x2EFEG+JIfw5+fB3J0PxzxRXrm7PogG
         ckddCEw+N4ALfSMDrjHOt9sCXweR4YpLjjLPdhvevqFV4wdsxkHldM1g+NI6RgeuKjPM
         7xnA==
X-Forwarded-Encrypted: i=1; AL+hErGWxMYCUfWLuu3HXCLnQyv9kkWl+QhVQFEK5R+DBnwRt9h4rxSduB80bFA1Am855S6kfOCoMiPH6TM4VGQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mMdCP8CZjMl5fLLmNQymxuwV/V47wWpVFFb5+HWKtelT6CwjA
	u3eAAUim+UhHVMCQ/N6OLZodmaskQASIA7bPIEkqdGk0plbQTkDfMtFx
X-Gm-Gg: AYBFou0CK5QsGk6NRFgzpEETcaVRfeqJmfEQ7AgL7dpo+dMmQ3rdIjknL1yu2qEBVn/
	3cwt1Iw28M6vU0EiBCEb+ur2DACcGfHBowNRHcjIwnxgaqgWculwDLX92IottFCqzE0qNSe6JDD
	KScebHssw7qqmfDkfmk9W7ZQe9ah7G7Rwpo0rQ4gEZHWQ6bQBWGJFNCpV3QLUSIWMWa2hA6J0qC
	gC9mrbm3i7FT8W+THbY9wRqSrKPQsZYL5pAsWYaoo/YOsNglRUIDuj9NjPbR8KCDH1ZjbfDSKGd
	2O6tKniU2nGlo3TLppQv97ysV9xiCagM/9+6LZNFtEms/dc97uhTsfg3WRWGEsaCyXwxyTJp1Fz
	zjGbH596LCIaCUilQEA3evWMwhwwJrxaGSsRXKeNitJrfXF9HuzZFFtZ3hKz8CrME6dkhwIHDgb
	GYn49l6qnkw5hMvNkLAd8AMWCe5vtln8CPOaWOwkQcJLBtH2qQOV130mjuf5/bI6fYZ3fv179bW
	8p+pgEgzwxZrFH0Yir+0M2oC7Dz402oph3zFUdO4WgHZInzRHvsRdmc+B0SUIoqD8p3l4HMFUtI
	mssLwLYoslTY+OA5KwV/wi49oVs7u7Oneg==
X-Received: by 2002:a05:6a00:1382:b0:87c:e44e:5694 with SMTP id d2e1a72fcca58-8bc1cb715f1mr2475584b3a.21.1794401775648;
        Wed, 11 Nov 2026 04:56:15 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6d79sm2130859b3a.10.2026.11.11.04.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:56:14 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: leeonion.muyu@gmail.com,
	ben.horgan@arm.com,
	james.morse@arm.com
Cc: reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm_mpam: Account for a MBWU overflow before reading the counter value
Date: Wed, 11 Nov 2026 20:56:01 +0800
Message-Id: <20261111125601.4120592-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
References: <d45dd5d2-15d2-41fc-adef-b8e9af9eb1a9@arm.com>
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

From: leeonion.muyu@gmail.com

Hi Ben,

Thanks for taking a look.

> Is the a theoretical fix or has this been observed in practice?

Not observed in practice. My hardware team was reviewing the software
overflow and NRDY checking logic with me, and we found this while
walking through the code together.

> Based on this, for MBWU you should only see NRDY set in the
> MAX_NRDY_USEC after a change of monitor settings. At such a reset
> the VALUE is reset to 0. Are you seeing or potentially seeing an
> overflow in this window of time?

I agree. Our starting assumption was IHI0099B.d 6.2.1 RGKWNB - that on
a settings update the monitor VALUE field keeps counting using the new
criteria without automatically resetting to 0. But as you point out,
looking at the reconfiguration path in write_msmon_ctl_flt_vals(),
the driver deliberately writes VALUE to 0 as part of the IDGYLF
sequence, so the accumulated count is discarded there and even a
31-bit monitor cannot overflow within the NRDY window after a
reconfiguration. The overflow and NRDY cannot collide.

My apologies - there was a second trigger in my original analysis
that the commit message failed to mention: any error reading the
counter value after the status bit has been cleared loses the
accounting the same way, and mpam_msmon_read() does not retry
non-EBUSY errors. For a MPAM_F capable MSC, mpam_msc_read_mbwu_l()
and mpam_read_monsel_reg() go through the PCC mailbox and can return
-ETIMEDOUT or -EIO on transport errors. So I believe the patch still
provides protection against this failure path - it moves the
accounting to the point where the status bit has been read but not
yet cleared, and it is a no-op in the normal path.

Thanks,
Ping

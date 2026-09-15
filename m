Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A3B3C09F2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789485980; cv=pass; b=o0uugvF+Vfd2qv2vR0y3U6l3cck7NgbGh6SBhsQUEYJdtOBQ1MOpnVLWOJpAm4LU88ZK5Nk3lwDDlvw2TlPlh2K+bfS4ROxroP81pk0g7Vf8OgMekHrMdDDhQDudAeHCbWmbZb/O1vxii6xilZwB3wfEWHr8VnFSZdm+/3j3TtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789485980; c=relaxed/simple;
	bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ijZMlOWRJpeGYIDeuq/7e0dyXpFq14IaSgxuTlyR++ZGk5eaogbIrktrxHzHsDTMeyPfYtMSWkoAwB8hJ/VDf6MVyx1WheV+YTDteh2F2VFeHm/7we3u8+JJqGICNKCbvOFD50T8akWxkeH1ZBLZecZ99VhWQq2zcun/HEuh+wU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=coLl47DN; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="coLl47DN"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4ab22370so490357d50.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789485978; cv=none;
        d=google.com; s=arc-20260327;
        b=JV+EifJnsO7ilClqRJOwbJpCCFFilWaD80R5HBJ6ZXMotYHJjHO02hsULHSbCaE9va
         kUXwHVY38y8xG1BLGwUAt2nfuH9nzo+YuI0v6A32aO90FucWD8rENwKyuCrX+QuXc7sJ
         R2VOAA3G13kR62rfHnu+N92AumJRx2iG5qDbt6paalAHZHa2VT/RTuN1/6zFjJjzlC+9
         DjjMAdgnaE3e/N19Fu4g7cd5FhYKEhIkceiUexQ7sei03mQb1EAa/+WaK2wLw9M5Q6YO
         QrE+q+7Olk+ZCD/3xGmw+0nWh8JgbQ2almalKrzY0fYFRQWQ0WXA9nryPd8crWt5Uejq
         q2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
        fh=jrnz5HGMBH2I2XCfx4axECAXDYKUazB3fwYhjJ1hz9E=;
        b=D9yqzEG89W9pSn1J1MFmOD97npOyM7gYXjhv/IaRBcKPB7kwLBYLzYpcJt0noMBrjZ
         5ctYf2heMLmHs49ankDI1EJfFA8Z+P0EmAj+aVJzKtmZT+HR2G4r3dS6rJU4S351ojNq
         i7neLlKmclW9WmjVYC6fRR0ZEiz3bHd99HP3yNAw4vUF8X4IDeYofw1wLKA7CmYfRISv
         oh8YLBv7DWStEAf0HgmIUbVGpBrmKwtiSscPIMicH5ouh7Hp1QNkaJtj1eSCGnpL++Bx
         uQZdZkql90TCJC2vyjTc84KLda831rh8P01oPFWXJTxA7ukFXLeZ8HTeuLZWjEF+/ADI
         srAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789485978; x=1790090778; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
        b=coLl47DNbab8N6oy62v9UEOJ4GVmJ2Zmq+PkImIgJKENTWLBnpavC2m3WYdBcgdqdp
         wmzO0Vd+1O8kFp2HKRo8k1IZV9HszVJv5HsWfobpc5CxyZ+2VjRXc+fmQRSjsIgCfZ2C
         yuBMx0wg4fys2KSpSGKg44mpU9vK1UO+55HqpCuIhJOG96cQiktHRv7ln1QzatwHdHra
         RmOP+Q7x0E14FzwG7YnfC2A/4xlu0ATKs8bD3wg7NeZk0W/BLKj+NqlSa2vkTVWOqLqq
         6/Xf5cU5WdsXyyEZB88Sev61M6X3rn5mwvCooSTb+fNY22xj4uDFIgp4wXT7kGHGAa3b
         2nEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789485978; x=1790090778;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=04fmncXiznmgA07ISCSGYRT/QDNH7yTRBIsIsR+2C0A=;
        b=inagSZsFoaMfN0W7fKYpaYwK3SjyZhWlUrur3/2kqI32Bed974oDrbRKaFLa0bM5wp
         8VHUd/M1HPho46opFssGiIAxhMYKD5BP4iQ84cdmNoWLmvmW8Qk5KMzv3sg8CYOFO+UD
         dR7U9Lnd+r2UNTCiBllJ0mCyPqB3foCPmRXLS679NTCViR9o/MhNfr6mKVu6M/VxydWf
         x88Fqy4etW9Ffe71FzMZ91EC3otagII0LJc0kcMIc9eFD1ggsH6NmQlrbeExYp0aMZtn
         uEEwa+SRKeojNuH26eM3IrYFtADn2Y2RupZXuRTdsUfr4YzPCWbMg+t7TzCVphEvY5sc
         1dyg==
X-Forwarded-Encrypted: i=1; AKwUvBzTMZ597FQcSjSGyc41B8TPeYJJpkWAL7kHgiUZR2SKPDJtAbJwIN4FPRY21SQB7dHFpEyg4R3CNWfQ/m0=@vger.kernel.org
X-Gm-Message-State: AFuF++lwNPrj6LdeLHD2gCJ+GJ/x1lNCEkodxg2kacTCkMIFjRCAn7Ab
	vc721tw6B32+Vi+9XoQHaWl7K8ih7/HiweekdO4FWAtFPjD8O1JdSqEzoNhp3wBo8BBQngo1hBa
	JD6hjInheL0WtB+OM5GiOEjsM1KRABQFBRduGOEDD/fgzPxcye8sWXbM=
X-Gm-Gg: AYBFou0CYx4GzNt0EuBleSS1RXivC6I9k3O/iuabVdkRiQIuYHyvkhMZF50goyoEq/E
	TCLw+ObnJLecG36j98Lbv5RUGGCQ3ShtbjMJAL1K5c4sMAKylK79ogTl8W1AcceglPy+Ts+E/cB
	kAa5KyFWEYGT1K4OqZi+XizdDRpYg3l62KpbhjPHLnl1i8x26zSyB34xgben98/nNDjIb0s8HdR
	qhv3zDKpbSkigH0YnBX0udFGx0Yuh1Us2vBwJNVZ+r6NFZ8RzA+lH2Dv8LrTrGdkVwLa9mwp0DE
	YXLDBcoY79COlI3Gy+i/alksxgjmBD992ZC47KuKBu5UI3du5di5OjAB+Ozj+urRaxmC2FAg0+v
	eyD2SA9etGLfy+H+k3l2Nh4le
X-Received: by 2002:a05:690e:bc2:b0:66f:c770:2936 with SMTP id
 956f58d0204a3-6715cbaf3aemr667877d50.58.1789485977258; Tue, 15 Sep 2026
 08:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-acpi-hwmon-v1-1-20747f6fd218@thegoodpenguin.co.uk> <4b314524-c0f9-4528-b86d-645747b59ac9@roeck-us.net>
In-Reply-To: <4b314524-c0f9-4528-b86d-645747b59ac9@roeck-us.net>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Tue, 15 Sep 2026 16:26:06 +0100
X-Gm-Features: AcwNN1XxYX75NCsGDaObHIJqn3mwhz-qjmKssIPNQcXV87DmDaAKScfTBr8_0y0
Message-ID: <CAA6zWZJvWAcwnZaO7F-bBEejf0Qn7gFh1fWHLq598Uzz+zzLzA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: acpi_power_meter: use named initializers for acpi_device_id
To: Guenter Roeck <linux@roeck-us.net>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Yeah I know, v2 is already there, messed up the fix up.
